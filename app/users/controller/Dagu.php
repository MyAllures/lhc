<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/1/15
 * Time: 17:00
 */
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
use think\Request;

class Dagu extends Common{
    public function __construct(Request $request = null)
    {
        $this->pd=true;
        parent::__construct($request);
        $sess=session('lhc_users');
        if($sess['lx']!=4)exit('您当前没有权限访问');
    }

    public function index(){
        $data=$this->guan;
        $where=['lx'=>1,'guan1'=>$data['kauser']];
        if(input('kauser')){
            $where['kauser']=['like','%'.input('kauser').'%'];
        }
        if(input('?stat')){
            $where['stat']=input('stat');
        }
        if(input('?size') && input('size')=='all'){
            $where['stat']=['between',[0,1]];
        }
        $ids=input('ids') ? input('ids') : 0;

        $result=Db::name('guan')->where($where)->order('id desc')->paginate();
        $res=$result->all();
        foreach ($res as $k=>$v){
            $r1=Db::name('guan')->field('SUM(cs) As sum_m')->where(['lx'=>2,'guanid'=>$v['id']])->select();
            $mumu=$r1[0]['sum_m'];  //总代的总信用额度
            $r1=Db::name('tan')->field('SUM(sum_m) As sum_m')->where(['kithe'=>getKitheNum(),'username'=>$v['kauser']])->select();
            $mkmk=$r1[0]['sum_m'];  //当前用户已补金额
            $res[$k]['memnum1']=Db::name('guan')->where(['lx'=>2,'guanid'=>$v['id']])->count();     //总代的数量
            $res[$k]['memnum2']=Db::name('guan')->where(['lx'=>3,'guanid'=>$v['id']])->count();     //代理的数量
            $res[$k]['memnum3']=Db::name('mem')->where(['guanid'=>$v['id']])->count();             //会员
            $res[$k]['cs_used']=$v['cs']-$mumu-$mkmk;
        }
        return $this->fetch('',[
            'res'=>$res,
            'page'=>$result->render(),
        ]);
    }

    public function addGu(){
        $data=$this->guan;
        if($data){
            $r1=Db::name('guan')->where(['lx'=>1,'guanid'=>$data['id']])->field('SUM(cs) sum_m')->select();
            $mumu=$r1[0]['sum_m'];  //所有子用户 -- 股东的信用额度之和 cs之和
            $r1=Db::name('tan')->field('sum(sum_m) sum_m')->where(['kithe'=>getKitheNum(),'username'=>$data['kauser']])->select();
            $mkmk=$r1[0]['sum_m'];  //当前用户  走飞的总额 就是下级用户无法满足的情况下大股东来填充
            $r1=Db::name('guan')->where(['lx'=>1,'guanid'=>$data['id']])->field('SUM(rs) As memnum2')->select();
            $rs1=$r1[0]['memnum2']; //所有子用户  所有分到的人数总和
            $rs1=$data['rs']-$rs1;  //当前用户剩余添加人数
            $guanid=$data['id'];
            $maxnum=$data['cs']-$mumu-$mkmk;    //剩余的可用额度
            $istar=0;
            $iend=$data['sf'];
            $tmb=$data['tmb'];
        }else{
            $maxnum=2000000000;
            $istar=0;
            $iend=100;
            $tmb=0;
        }

        $typeData='';
        //默认 大股东的quota全部从 ka_guands 来获取
        $typeData=Db::name('guands')->where(['lx'=>0])->order(['id'=>'desc'])->select();
//        if($guanid){
//            $typeData=Db::name('quota')->where(['userid'=>$guanid,'lx'=>0,'flag'=>0])->select();
//        }
        return $this->fetch('',[
            'data'=>$data,
            'maxnum'=>$maxnum,
            'istart'=>$istar,
            'iend'=>$iend,
            'tmb'=>$tmb,
            'rs1'=>$rs1,
            'dataType'=>$typeData
        ]);
    }

    public function saveGu(){
        if(!input('?act') || input('act')!='add')$this->error('');
        if (!input('kauser')) {
            $this->error('用户名不能为空 ');
        }
        if (!input('kapassword')) {
            $this->error('密码不能为空');
        }
        if (input('cs') > input('kyx')) {
            $this->error('总信用额度超过不能上级!');
        }

        if (input('sf')+input('sj') > input('sff')) {  //股东占成+总代占成  不能超过股东的占成
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
        $pass = md5(input('kapassword','','trim'));
        $text=date("Y-m-d H:i:s");
        $ip=$this->request->ip();

        $row= Db::name('guan')->find(input('guanid'));  //上级用户
        $guan=$row['kauser'];

        $arr=[
            'kapassword'=>$pass,
            'kauser'=>input('kauser'),
            'xm'=>input('xm'),
            'tmb'=>input('tmb'),
            'rs'=>input('rs'),
            'cs'=>input('cs'),
            'ts'=>input('cs'),
            'sj'=>input('sj'),
            'sf'=>input('sf'),
            'guan1'=>$guan,
            'guan'=>input('kauser'),
            'zong'=>input('kauser'),
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
            'guanid'=>input('guanid'),
            'zongid'=>0,
            'lx'=>1,
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
            $this->error('添加股东失败');
        }
        $inserId=Db::name('guan')->getLastInsID();

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
                'ds'=>$ds[$I],
                'username'=>input('kauser'),
                'userid'=>$inserId,
                'lx'=>0,
                'flag'=>0,
                'guanid1'=>input('guanid'),
                'guanid'=>0,
                'zongid'=>0,
                'danid'=>0,
                'memid'=>0
            ];
            Db::name('quota')->insert($sz);
        }
        $this->success('股东添加成功',url('index'));
    }

    public function editGu(){
        if(!input('id'))$this->error('非法访问');
        $data=Db::name('guan')->where(['id'=>input('id'),'lx'=>1])->find();
        if(!$data)$this->error('当前股东不存在！');

        //当前股东的所属大股东
        $row=Db::name('guan')->field('id,kauser,sf,cs,tmb,rs')->where(['id'=>$data['guanid'],'lx'=>4])->find();
        if($row){
            $r1=Db::name('guan')->where(['lx'=>1,'guanid'=>$row['id']])->field('SUM(cs) sum_m')->select();
            $mumu=$r1[0]['sum_m'];      //所有子级  总可用额度
            $r1=Db::name('tan')->field('sum(sum_m) sum_m')->where(['kithe'=>getKitheNum(),'username'=>$row['kauser']])->select();
            $mkmk=$r1[0]['sum_m'];      //当前下注总额
            $r1=Db::name('guan')->where(['lx'=>1,'guanid'=>$row['id']])->field('SUM(rs) As memnum2')->select();
            $rs1=$r1[0]['memnum2'];

            $r1=Db::name('guan')->where(['lx'=>2,'guanid'=>$data['id']])->field('SUM(rs) As memnum2')->select();
            $rs2=$r1[0]['memnum2'];

            $rs1=$row['rs']-$rs1+$data['rs'];  //剩余人数
            $guanid=$row['id'];
            $maxnum=$row['cs']-$mumu-$mkmk+$data['cs'];
            $istar=0;
            $iend=$row['sf'];
            $tmb=$row['tmb'];
        }else{
            $maxnum=2000000000;
            $istar=0;
            $iend=100;
            $tmb=0;
        }

        //计算当前用户可用余额
        $r2=Db::name('guan')->where(['lx'=>2,'guanid'=>$data['id']])->field('SUM(cs) As sum_m')->select();
        $mumuf=$r2[0]['sum_m'];
        $r2=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$data['kauser']])->field('SUM(sum_m) As sum_m')->select();
        $mkmkf=$r2[0]['sum_m'];
        $sfsfsf=$data['cs']-$mumuf-$mkmkf;

        //select * from  ka_quota where lx=0 and userid=".$_GET['id']." and flag=0 order by id
        $result=Db::name('quota')->where(['userid'=>input('id'),'lx'=>0,'flag'=>0])->select();
        foreach ($result as $k=>$v){
            $result[$k]['row']=Db::name('guands')->where(['ds'=>$v['ds'],'lx'=>0])->find();
        }

        return $this->fetch('',[
            'data'=>$data,
            'row'=>$row,
            'maxnum'=>$maxnum,
            'istart'=>$istar,
            'iend'=>$iend+1,
            'tmb'=>$tmb,
            'rs1'=>$rs1,
            'rs2'=>$rs2,
            'sfsfsf'=>$sfsfsf,
            'result'=>$result,
        ]);
    }

    public function saveEdit(){
        if(!$this->request->isPost() && input('act')!='update')$this->error('非法访问');
        if(input('cs')>input('kyx'))$this->error('信用额度不能超过上一级!');
        if((input('sf')+input('sj')) > input('sff'))$this->error('对不起,请正确设置占成!');

        $stat=input('tv6')=='是' ? 0 : 1;
        $pz=input('tv5')=='是'  ? 0 : 1;
        $row=Db::name('guan')->find(input('id'));

        $SoftID=$row['id'];
        $cs=$row['cs'];
        $ts=$row['ts'];
        $sj=$row['sj'];
        $sf=$row['sf'];

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

        if (input('tmb')==1){
            Db::name('guan')->where(['tmb'=>0,'zongid'=>input('id')])->update(['tmb'=>1]);
            Db::name('mem')->where(['tmb'=>0,'zongid'=>input('id')])->update(['tmb'=>1]);
        }

        if (input('sf')!=$sf || input('sj')!=$sj){
            $rows=Db::name('guan')->where(['lx'=>3,'zongid'=>input('id')])->update(['sj'=>input('sf'),'sf'=>0]);
            $dugu=10-input('sj')/10-input('sf')/10;
            $exe=Db::name('mem')->where(['zongid'=>input('id')])->update(['dan_zc'=>0,'zong_zc'=>input('sf')/10,'guan_zc'=>input('sj')/10,'dagu_zc'=>$dugu]);
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
                Db::name('quota')->where(['ds'=>$ds[$k],'abcd'=>'A','flag'=>1,'zongid'=>input('id')])->update(['yg'=>$yg[$k]]);
            }
            if ($yg1>$ygb[$k]){
                Db::name('quota')->where(['ds'=>$ds[$k],'abcd'=>'B','flag'=>1,'zongid'=>input('id')])->update(['yg'=>$ygb[$k]]);
            }
            if ($yg1>$ygc[$k]){
                Db::name('quota')->where(['ds'=>$ds[$k],'abcd'=>'C','flag'=>1,'zongid'=>input('id')])->update(['yg'=>$ygc[$k]]);
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
                Db::name('quota')->where(['ds'=>$ds[$k],'zongid'=>input('id')])->update(['xx'=>$xx[$k]]);
            }
            if ($xxx1>$xxx[$k]){
                Db::name('quota')->where(['ds'=>$ds[$k],'zongid'=>input('id')])->update(['xx'=>$xxx[$k]]);
            }
        }
        $this->success('账号修改成功',url('index'));
    }
}