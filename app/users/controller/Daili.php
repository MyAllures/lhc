<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/13
 * Time: 15:52
 */
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
use think\Loader;
use think\log\driver\Test;
use think\Request;

class Daili extends Common{
    public function __construct(Request $request = null)
    {
        $this->pd=true;
        parent::__construct($request);
        //代理   大股东 股东 总代可以访问
        $sess=session('lhc_users');
        if($sess['lx']!=1 && $sess['lx']!=2 && $sess['lx']!=4){
            exit('您当前没有权限访问');
        }
    }
    //大股东  股东 总代
    public function index(){
        $data=$this->guan;
        $where=['lx'=>3];
        $dali2=[];
        $zid=0;
        //有传递总代的id过来
        if(input('id')){
            $where['zongid']=input('id');
            $zid=input('id');
        }
        $daili2=null;
        if($data['lx']==4){//大股东
            $where['guan1']=$data['kauser'];
            $daili2=Db::name('guan')->where(['lx'=>2,'guan1'=>$data['kauser']])->field('id,kauser')->select();
        }
        if($data['lx']==1){ //股东
            $where['guan']=$data['kauser'];
            $daili2=Db::name('guan')->where(['lx'=>2,'guan'=>$data['kauser']])->field('id,kauser')->select();
        }
        if($data['lx']==2){//总代
            $where['zong']=$data['kauser'];
        }

        if(input('?size') && input('size')=='all'){
            $pagesize=Db::name('guan')->where($where)->count();
        }
        if(input('?stat')){
            $where['stat']=input('stat');
        }
        $res=Db::name('guan')->where($where)->paginate();
        $result=$res->all();

        if($result){
            foreach ($result as $k=>$v){
                $r1=Db::name('mem')->field(['sum(cs) sum'])->where(['danid'=>$v['id']])->select();
                $mumu=empty($r1) ? 0 : $r1[0]['sum'];           //用户信用额度
                $r2=Db::name('tan')->field(['sum(sum_m) sum'])->where(['kithe'=>getKitheNum(),'username'=>$v['kauser']])->select();
                $mkmk=empty($r2) ? 0 : $r2[0]['sum'];           //下注金额
                $result[$k]['cs_used']=$v['cs']-$mumu-$mkmk;    //当前代理可用信用额度
                $r3=Db::name('mem')->field(['count(id) sum'])->where(['danid'=>$v['id'],'stat'=>0])->select();    //当前代理所有的会员
                $result[$k]['mem_sum']=empty($r3) ? 0 : $r3[0]['sum'];
                $r4=Db::name('guan')->where(['id'=>$v['zongid'],'lx'=>2])->find();  //总代
                $result[$k]['gufen']=empty($r4) ? 0 :$r4['sj'];
            }
        }
        return $this->fetch('',[
            'users'=>$data,
            'page'=>$res->render(),
            'result'=>$result,
            'daili2'=>$daili2,
            'zid'=>$zid,
        ]);
    }

    //新增代理
    public function AddDaili(){
        $sess=session('lhc_users');
        $data=$this->guan;
        $zongid=0;
        $res=[];
        $maxnum=0;
        $istar=0;
        $iend=0;
        $tmb=0;     //是否允许特B
        $rs1=0;     //最多添加会员人数    代理所能添加的会员人数来自于总代理的人数-总代下的所有子代理的会员人数的差
        $ids=$sess['id'];
        if(input('id')){
            $rex=Db::name('guan')->field('id,kauser,sf,cs,tmb,rs')->where(['id'=>input('id'),'lx'=>2])->find();
            $ids=input('id');
            if($rex){
                $r1=Db::name('guan')->field(['sum(cs) sum'])->where(['lx'=>3,'zongid'=>$rex['id']])->select();
                $mumu=empty($r1) ? 0 : $r1[0]['sum'];
                $r2=Db::name('tan')->field(['sum(sum_m) sum'])->where(['kithe'=>getKitheNum(),'username'=>$rex['kauser']])->select();
                $mkmk=empty($r2) ? 0 : $r2[0]['sum'];
                $r3=Db::name('guan')->field(['sum(rs) sum'])->where(['lx'=>3,'zongid'=>$rex['id']])->select();  //计算当前用户所有下级人数的和
                $rs1=empty($r3) ? 0 :$r3[0]['sum'];
                $rs1=$rex['rs']-$rs1;
                $zongid=$rex['id'];
                $maxnum=$rex['cs']-$mumu-$mkmk;
                $istar=0;
                $iend=$rex['sf'];
                $tmb=$rex['tmb'];
            }else{
                $maxnum=2000000000;
                $istar=0;
                $iend=100;
                $tmb=0;
            }
        }
        //代理  lx=3  mem会员表对应代理的字段是danid
        //总代理 lx=2   代理对应总代理的字段是 zongid
        //股东？  lx=1   总代理是对应的股东的字段是guan
        if($data['lx']==4){
            $res=Db::name('guan')->field('id,kauser,sf,cs')->where(['guan1'=>$data['kauser'],'lx'=>2])->select();
            if($res){
                foreach ($res as $k=>$v){
                    $r1=Db::name('guan')->where(['lx'=>3,'zongid'=>$v['id']])->field(['sum(cs) sum'])->select();  //求出当前用户下所有代理总的信用额度
                    $mumu=empty($r1) ? 0 : $r1[0]['sum'];
                    $r2=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$v['kauser']])->field(['sum(sum_m) sum'])->select();
                    $mkmk=empty($r2) ? 0 : $r2[0]['sum'];
                    $res[$k]['cs_end']=$v['cs']-$mumu-$mkmk;
                    if($zongid!=null && $zongid==$v['id'])$res[$k]['selected']=true;else $res[$k]['selected']=false;
                }
            }
        }
        if($data['lx']==1){
            $res=Db::name('guan')->field('id,kauser,sf,cs')->where(['guan'=>$data['kauser'],'lx'=>2])->select();
            if($res){
                foreach ($res as $k=>$v){
                    $r1=Db::name('guan')->where(['lx'=>3,'zongid'=>$v['id']])->field(['sum(cs) sum'])->select();  //求出当前用户下所有代理总的信用额度
                    $mumu=empty($r1) ? 0 : $r1[0]['sum'];
                    $r2=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$v['kauser']])->field(['sum(sum_m) sum'])->select();
                    $mkmk=empty($r2) ? 0 : $r2[0]['sum'];
                    $res[$k]['cs_end']=$v['cs']-$mumu-$mkmk;
                    if($zongid!=null && $zongid==$v['id'])$res[$k]['selected']=true;else $res[$k]['selected']=false;
                }
            }
        }
        //总代id
        if($data['lx']==2){
            $res=Db::name('guan')->where(['kauser'=>$data['kauser'],'lx'=>2])->find();
            if($res){
                $r1=Db::name('guan')->where(['lx'=>3,'zongid'=>$res['id']])->field(['sum(cs) sum'])->select();  //求出当前用户下所有代理总的信用额度
                $mumu=empty($r1) ? 0 : $r1[0]['sum'];
                $r2=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$res['kauser']])->field(['sum(sum_m) sum'])->select();
                $mkmk=empty($r2) ? 0 : $r2[0]['sum'];
                $r3=Db::name('guan')->field(['sum(rs) sum'])->where(['lx'=>3,'zongid'=>$data['id']])->select();  //计算当前用户所有下级人数的和
                $rs1=empty($r3) ? 0 :$r3[0]['sum'];
                $rs1=$data['rs']-$rs1;
                $zongid=$res['id'];
                $maxnum=$res['cs']-$mumu-$mkmk;
                $istar=0;
                $iend=$res['sf'];
            }else{
                $maxnum=2000000000;
                $istar=0;
                $iend=100;
            }
        }
        $typeData='';
        if($zongid){
            $typeData=Db::name('quota')->where(['userid'=>$zongid,'lx'=>0,'flag'=>0])->select();
        }else{
            $typeData=Db::name('guands')->where(['lx'=>0])->select();
        }
        return $this->fetch('',[
            'users'=>$data,
            'zongid'=>$zongid,
            'res'=>$res,
            'maxnum'=>$maxnum,
            'istart'=>$istar,
            'iend'=>$iend+1,
            'tmb'=>$tmb,
            'rs1'=>$rs1,
            'dataType'=>$typeData,
            'ids'=>$ids,
        ]);
    }
    //总代新增代理需要 添加两张表的数据  ka_guan  和 ka_quota表
    public function saveDaili(){
        if(input('?act') && input('act')=='add' && input('?id')){
            if (!input('kauser')) {
                $this->error('用户名不能为空');
            }
            if (!input('kapassword')) {
                $this->error('密码不能为空');
            }
            if (input('cs') > input('kyx')) {
                $this->error('信用额度超过可用信用额!');
            }
            if (input('sf')+input('sj') >input('sff')) {  //代理占成+总代占成  不能超过股东的占成
                $this->error('对不起,请正确设置占成!');
            }
            if (input('tv5')=="是") $pz=0; else $pz=1;
            if (input('tv6')=="是") $stat=0; else $stat=1;

            $num=Db::name('guan')->where(['kauser'=>input('kauser')])->count();
            if($num!=0){
                $this->error('这一用户名称已被占用，请重新输入！');
            }
            $num=Db::name('mem')->where(['kauser'=>input('kauser')])->count();
            if($num!=0){
                $this->error('这一用户名称已被某会员占用，请重新输入！');
            }
            $num=Db::name('zi')->where(['kauser'=>input('kauser')])->count();
            if($num!=0){
                $this->error('这一用户名称已被某子用户占用，请重新输入！');
            }
            $pass = md5(input('kapassword'));
            $text=date("Y-m-d H:i:s");
            $ip=$this->request->ip();

            $row= Db::name('guan')->find(input('zongid'));
            $guan=$row['guan'];
            $zong=$row['kauser'];
            $guanid=$row['guanid'];
            $zongid=$row['id'];

            $arr=[
                'kapassword'=>$pass,
                'kauser'=>input('kauser'),
                'xm'=>input('xm'),
                'tmb'=>input('tmb'),
                'rs'=>input('rs'),
                'cs'=>input('cs'),
                'ts'=>input('cs'),  //可用信用额度
                'sj'=>input('sj'),
                'sf'=>input('sf'),
                'guan1'=>$row['guan1'],
                'guan'=>$guan,
                'zong'=>$zong,
                'tm'=>500000,
                'zm'=>50000,
                'zt'=>50000,
                'zm6'=>500000,
                'lm'=>50000,
                'gg'=>50000,
                'xx'=>500000,
                'sx'=>50000,
                'bb'=>50000,
                'ws'=>50000,
                'guanid'=>$guanid,
                'zongid'=>$zongid,
                'lx'=>3,
                'look'=>0,
                'pz'=>$pz,
                'ztws'=>0,
                'stat'=>$stat,
                'adddate'=>$text,
                'slogin'=>$text,
                'zlogin'=>$text,
                'sip'=>$ip,
                'zip'=>$ip
            ];

            if(!Db::name('guan')->insert($arr)){
                $this->error('新增代理失败');
            }
            $inserId=Db::name('guan')->getLastInsID();

            //总代设置
            $yg=input('m/a');
            $ygb=input('ygb/a');
            $ygc=input('ygc/a');
            $ygd=input('ygd/a');
            $xx=input('mm/a');
            $xxx=input('mmm/a');
            $ds=input('ds/a');

            for ($I=0; $I<count($yg); $I=$I+1)
            {
                $sz=[
                    'yg'=>$yg[$I],
                    'ygb'=>$ygb[$I],
                    'ygc'=>$ygc[$I],
                    'ygd'=>$ygd[$I],
                    'xx'=>$xx[$I],
                    'xxx'=>$xxx[$I],
                    'username'=>input('kauser'),
                    'userid'=>$inserId,
                    'lx'=>0,
                    'flag'=>0,
                    'guanid'=>$guanid,
                    'zongid'=>$zongid,
                    'danid'=>0,
                    'memid'=>0,
                    'ds'=>$ds[$I]
                ];
                Db::name('quota')->insert($sz);
            }
            $this->success('代理添加成功',url('index'));
        }else{
            $this->error('非法访问');
        }
    }

    public function editDaili(){
        if(!input('?id'))$this->error('非法访问');
        $row2=Db::name('guan')->where(['id'=>input('id'),'lx'=>3])->find();     //当前代理本身
        if($row2){
            $row=Db::name('guan')->field('id,kauser,sf,cs,tmb,rs')->where(['id'=>$row2['zongid'],'lx'=>2])->find();  //当前代理的上级 总代
            if($row){
                $r1=Db::name('guan')->field('sum(cs) sum')->where(['zongid'=>$row['id'],'lx'=>3])->select();
                $mumu=$r1[0]['sum'];
                $r1=Db::name('tan')->field('sum(sum_m) sum')->where(['kithe'=>getKitheNum(),'username'=>$row['kauser']])->select();
                $mkmk=$r1[0]['sum'];
                $maxnum=$row['cs']-$mumu-$mkmk+$row2['cs'];

                $r1=Db::name('guan')->field('sum(rs) sum')->where(['lx'=>3,'zongid'=>$row['id']])->select();
                $rs1=$r1[0]['sum'];
                $r1=Db::name('mem')->where(['danid'=>$row2['id']])->count();
                $rs2=$r1;
                $rs1=$row['rs']-$rs1+$row2['rs'];
                $danid=$row['id'];
                $maxnum=$row['cs']-$mumu-$mkmk+$row2['cs'];
                $istar=0;
                $iend=$row['sf'];
                $tmb=$row['tmb'];

                //可分配余额
                $r1 = Db::name('mem')->where(['danid'=>$row2['id']])->field('SUM(cs) As sum_m')->select();
                $mumuf = $r1[0]['sum_m'];

                $r1 = Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$row2['kauser']])->field('SUM(sum_m) As sum_m')->select();
                $mkmkf=$r1[0]['sum_m'];

                $sfsfsf=$row2['cs']-$mumuf-$mkmkf;

                //第二个表格
                $r2=Db::name('quota')->where(['lx'=>0,'userid'=>input('id'),'flag'=>0])->select();
                foreach ($r2 as $k=>$v){
                    $r2[$k]['row']=Db::name('quota')->where(['ds'=>$v['ds'],'lx'=>$v['lx'],'userid'=>$v['zongid'],'flag'=>0])->find();
                }
            }else{
                $maxnum=2000000000;
                $istar=0;
                $iend=100;
                $tmb=0;
            }
        }
        return $this->fetch('',[
            'id'=>input('id'),
            'row'=>$row,
            'row2'=>$row2,
            'sfsfsf'=>$sfsfsf,
            'maxnum'=>$maxnum,
            'istar'=>$istar,
            'iend'=>$iend,
            'rs1'=>$rs1,
            'rs2'=>$rs2,
            'r2'=>$r2,
        ]);
    }

    public function saveUpdate(){
        if(!$this->request->isPost() && input('act')!='update')$this->error('非法访问');
        if(input('cs')>input('kyx'))$this->error('信用额度超过可用信用额!');
        if((input('sf')+input('sj')) > input('sff'))$this->error('对不起,请正确设置占成!');

        $stat=input('tv6')=='是' ? 0 : 1;
        $pz=input('tv5')=='是'  ? 0 : 1;

        $row=Db::name('guan')->find(input('id'));

        $SoftID=$row['id'];
        $cs=$row['cs'];
        $ts=$row['ts'];
        $sj=$row['sj'];
        $sf=$row['sf'];
        $zongid=$row['zongid'];
        if((getKithe(29)==1 || getKithe(33)==0) && ($sf!=input('sf') || $sj!=input('sj')))$this->error('对不起,现在不能设置占成!');

        $sjj=input('sj');
        $where=[
            'id'=>input('id'),
            'xm'=>input('xm'),
            'cs'=>input('cs'),
            'ts'=>input('cs'),
            'rs'=>input('rs'),
            'tmb'=>input('tmb'),
            'sj'=>input('sj'),
            'sf'=>input('sf'),
            'pz'=>$pz,
            'stat'=>$stat,
        ];
        if(input('kapassword')){
            $where['kapassword']=trim(md5(input('kapassword')));
        }
        $affected_rows=Db::name('guan')->update($where);
//        if(!$affected_rows)$this->error('修改失败！');

        if (input('tmb')==1){
            Db::name('guan')->where(['tmb'=>0,'daiid'=>input('id')])->update(['tmb'=>1]);
            Db::name('mem')->where(['tmb'=>0,'daiid'=>input('id')])->update(['tmb'=>1]);
        }

        if (input('sf')!=$sf || input('sj')!=$sj){
            $rows=Db::name('guan')->find($zongid);
            $vvz=(100-$rows['sj']-input('sf')-input('sj'))/10;
            $gusj=$rows['sj']/10;
            $exe=Db::name('mem')->where(['danid'=>input('id')])->update(['dagu_zc'=>$vvz,'guan_zc'=>$gusj,'dan_zc'=>input('sf')/10,'zong_zc'=>input('sj')/10]);
        }

        //总代设置
        //$ygid=$_POST['ygid'];
        $yg=input('m/a');
        $ygb=input('ygb/a');
        $ygc=input('ygc/a');
        $ygd=input('ygd/a');
        $xx=input('mm/a');
        $xxx=input('mmm/a');
        $ds=input('ds/a');
        $ygid=input('ygid/a');

        $data=Db::name('quota')->where(['userid'=>input('id'),'flag'=>0])->select();
       foreach ($data as $k=>$v)
        {
            $ds1=$v['ds'];
            $yg1=$v['yg'];
            $xx1=$v['xx'];
            $xxx1=$v['xxx'];
            Db::name('quota')->where(['id'=>$ygid[$k]])->update(['yg'=>$yg[$k],'ygb'=>$ygb[$k],'ygc'=>$ygc[$k],'ygd'=>$ygd[$k],'xx'=>$xx[$k],'xxx'=>$xxx[$k]]);
            //会员
            if ($yg1>$yg[$k]){
                Db::name('quota')->where(['ds'=>$ds[$k],'abcd'=>'A','flag'=>1,'danid'=>input('id')])->update(['yg'=>$yg[$k]]);
            }
            if ($yg1>$ygb[$k]){
                Db::name('quota')->where(['ds'=>$ds[$k],'abcd'=>'B','flag'=>1,'danid'=>input('id')])->update(['yg'=>$ygb[$k]]);
            }
            if ($yg1>$ygc[$k]){
                Db::name('quota')->where(['ds'=>$ds[$k],'abcd'=>'C','flag'=>1,'danid'=>input('id')])->update(['yg'=>$ygc[$k]]);
            }
            if ($yg1>$ygd[$k]){
                Db::name('quota')->where(['ds'=>$ds[$k],'abcd'=>'D','flag'=>1,'danid'=>input('id')])->update(['yg'=>$ygd[$k]]);
            }

            ///代理
            //$exe=mysql_query("update ka_quota Set yg='".$yg[$I]."'  where ds='".$ds[$I]."'  and yg>".$yg[$I]."   and flag=0 and  danid=".$_GET['id']." ",$conn);
            //$exe=mysql_query("update ka_quota Set ygb='".$ygb[$I]."'  where ds='".$ds[$I]."'  and ygb>".$ygb[$I]."   and flag=0  and danid=".$_GET['id']." ",$conn);
            //$exe=mysql_query("update ka_quota Set ygc='".$ygc[$I]."'  where ds='".$ds[$I]."'  and ygc>".$ygc[$I]."   and flag=0  and danid=".$_GET['id']." ",$conn);
            //$exe=mysql_query("update ka_quota Set ygd='".$ygd[$I]."'  where ds='".$ds[$I]."'  and ygd>".$ygd[$I]."   and flag=0  and danid=".$_GET['id']." ",$conn);

            ///单注单项
            if ($xx1>$xx[$k]){
                Db::name('quota')->where(['ds'=>$ds[$k],'danid'=>input('id')])->update(['xx'=>$xx[$k]]);
            }
            if ($xxx1>$xxx[$k]){
                Db::name('quota')->where(['ds'=>$ds[$k],'danid'=>input('id')])->update(['xx'=>$xxx[$k]]);
            }
        }
        $this->success('会员信息修改成功',url('index'));
    }
}
