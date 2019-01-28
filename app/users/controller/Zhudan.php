<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/13
 * Time: 17:22
 */
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
use think\Request;

/*注单查询*/
class Zhudan extends Common
{
    protected $users;
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $sess=session('lhc_users');
        $this->users=Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
    }

    public function daGu(){
        $data=$this->users;
        if($data['lx']!=4)$this->error('非法访问');
        $kithe=input('?kithe') ? input('kithe') : getKitheNum();
        $z_st=0;
        $z_re=0;
        $z_sum=0;
        $z_dagu=0;
        $z_guan1=0;
        $z_guan=0;
        $z_zong=0;
        $z_dai=0;
        //所有的下级股东
        $res=Db::name('tan')->distinct(true)->field('guan')->where(['kithe'=>$kithe,'guan1'=>$data['kauser']])->order(['guan'=>'desc'])->select();

        if($res){
            foreach ($res as $k=>$v){
                $Rs5=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re','sum(sum_m*dagu_zc/10) dagu_zc','sum(sum_m*guan1_zc/10) guan1_zc','sum(sum_m*guan_zc/10) guan_zc','sum(sum_m*zong_zc/10) zong_zc','sum(sum_m*dai_zc/10) dai_zc','sum(sum_m-sum_m*user_ds/100) sum_st'])->where(['kithe'=>$kithe,'guan'=>$v['guan']])->select();
                $re=$Rs5[0]['re'];
                $sum_m=$Rs5[0]['sum_m'];
                $dagu_zc=$Rs5[0]['dagu_zc'];
                $guan1_zc=$Rs5[0]['guan1_zc'];
                $guan_zc=$Rs5[0]['guan_zc'];
                $zong_zc=$Rs5[0]['zong_zc'];
                $dai_zc=$Rs5[0]['dai_zc'];
                $z_st+=$Rs5[0]['sum_st'];
                $z_re+=$Rs5[0]['re'];
                $z_sum+=$Rs5[0]['sum_m'];
                $z_dagu+=$Rs5[0]['dagu_zc'];
                $z_guan1+=$Rs5[0]['guan1_zc'];
                $z_guan+=$Rs5[0]['guan_zc'];
                $z_zong+=$Rs5[0]['zong_zc'];
                $z_dai+=$Rs5[0]['dai_zc'];
                $res[$k]['rs5']=$Rs5[0];
                $res[$k]['guan_info']=Db::name('guan')->where(['kauser'=>$v['guan']])->find();  //求出当前股东的信息
            }
        }

        $kitheAll=Db::name('kithe')->field('nn')->order(['nn'=>'desc'])->select();
        return $this->fetch('',[
            'data'=>$data,
            'kithe'=>$kithe,
            'res'=>$res,
            'z_re'=>$z_re,      //总的下注数
            'z_sum'=>$z_sum,    //总的下注金额
            'z_st'=>$z_st,      //总的实投   实投 ==下注金额-会员的佣金
            'z_guan1'=>$z_guan1,
            'z_guan'=>$z_guan,  //股东总占成金额
            'z_zong'=>$z_zong,  //总代总占成金额
            'z_dai'=>$z_dai,    //代理总占成金额
            'kitheAll'=>$kitheAll,
        ]);
    }
    //lx==1  股东  或者股东的子账户 都可以访问
    public function index()
    {
        $data=$this->users;
        if($data['lx']!=1 && $data['lx']!=4)$this->error('非法访问');
        $kithe=input('?kithe') ? input('kithe') : getKitheNum();
        $username=input('?username') ? input('username') : $data['kauser'];//用户名
        $z_st=0;
        $z_re=0;
        $z_sum=0;
        $z_dagu=0;
        $z_guan1=0;
        $z_guan=0;
        $z_zong=0;
        $z_dai=0;
        $res=Db::name('tan')->distinct(true)->field('zong')->where(['kithe'=>$kithe,'guan'=>$username])->order(['zong'=>'desc'])->select();
        if($res){
            foreach ($res as $k=>$v){
                $Rs5=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re','sum(sum_m*dagu_zc/10) dagu_zc','sum(sum_m*guan1_zc/10) guan1_zc','sum(sum_m*guan_zc/10) guan_zc','sum(sum_m*zong_zc/10) zong_zc','sum(sum_m*dai_zc/10) dai_zc','sum(sum_m-sum_m*user_ds/100) sum_st'])->where(['kithe'=>$kithe,'zong'=>$v['zong']])->select();
                $z_st+=$Rs5[0]['sum_st'];
                $z_re+=$Rs5[0]['re'];
                $z_sum+=$Rs5[0]['sum_m'];
                $z_dagu+=$Rs5[0]['dagu_zc'];
                $z_guan1+=$Rs5[0]['guan1_zc'];
                $z_guan+=$Rs5[0]['guan_zc'];
                $z_zong+=$Rs5[0]['zong_zc'];
                $z_dai+=$Rs5[0]['dai_zc'];
                $res[$k]['rs5']=$Rs5[0];
                $res[$k]['guan']=Db::name('guan')->where(['kauser'=>$v['zong']])->find();
            }
        }

        $kitheAll=Db::name('kithe')->field('nn')->order(['nn'=>'desc'])->select();
        return $this->fetch('',[
            'data'=>$data,
            'kithe'=>$kithe,
            'res'=>$res,
            'z_re'=>$z_re,      //总的下注数
            'z_sum'=>$z_sum,    //总的下注金额
            'z_st'=>$z_st,      //总的实投   实投 ==下注金额-会员的佣金
            'z_guan'=>$z_guan,  //股东总占成金额
            'z_zong'=>$z_zong,  //总代总占成金额
            'z_dai'=>$z_dai,    //代理总占成金额
            'kitheAll'=>$kitheAll,
            'z_guan1'=>$z_guan1,
        ]);
    }

    //lx==2 总代理 或总代的子账户
    public function index2(){
        $data=$this->users;
        if($data['lx']==3)$this->error('暂无权限!');
        $kithe=input('?kithe') ? input('kithe') : getKitheNum();      //期数
        $username=input('?username') ? input('username') : $data['kauser'];//用户名
        $z_st=0;
        $z_re=0;
        $z_sum=0;
        $z_dagu=0;
        $z_guan1=0;
        $z_guan=0;
        $z_zong=0;
        $z_dai=0;
        $res=Db::name('tan')->distinct(true)->field('dai')->where(['kithe'=>$kithe,'zong'=>$username])->order(['dai'=>'desc'])->select();
        if($res){
            foreach ($res as $k=>$v){
                $Rs5=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re','sum(sum_m*dagu_zc/10) dagu_zc','sum(sum_m*guan1_zc/10) guan1_zc','sum(sum_m*guan_zc/10) guan_zc','sum(sum_m*zong_zc/10) zong_zc','sum(sum_m*dai_zc/10) dai_zc','sum(sum_m-sum_m*user_ds/100) sum_st'])->where(['kithe'=>$kithe,'dai'=>$v['dai']])->select();
                $re=$Rs5[0]['re'];
                $sum_m=$Rs5[0]['sum_m'];
                $dagu_zc=$Rs5[0]['dagu_zc'];
                $guan_zc=$Rs5[0]['guan_zc'];
                $zong_zc=$Rs5[0]['zong_zc'];
                $dai_zc=$Rs5[0]['dai_zc'];
                $z_st+=$Rs5[0]['sum_st'];
                $z_re+=$Rs5[0]['re'];
                $z_sum+=$Rs5[0]['sum_m'];
                $z_dagu+=$Rs5[0]['dagu_zc'];
                $z_guan1+=$Rs5[0]['guan1_zc'];
                $z_guan+=$Rs5[0]['guan_zc'];
                $z_zong+=$Rs5[0]['zong_zc'];
                $z_dai+=$Rs5[0]['dai_zc'];
                $res[$k]['rs5']=$Rs5[0];
                $res[$k]['guan']=Db::name('guan')->where(['kauser'=>$v['dai']])->find();
            }
        }

        $kitheAll=Db::name('kithe')->field('nn')->order(['nn'=>'desc'])->select();
        return $this->fetch('',[
            'data'=>$data,
            'res'=>$res,
            'z_re'=>$z_re,      //总的下注数
            'z_sum'=>$z_sum,    //总的下注金额
            'z_st'=>$z_st,      //总的实投   实投 ==下注金额-会员的佣金
            'z_guan'=>$z_guan,  //股东总占成金额
            'z_zong'=>$z_zong,  //总代总占成金额
            'z_dai'=>$z_dai,    //代理总占成金额
            'kithe'=>$kithe,
            'kitheAll'=>$kitheAll,
            'username'=>$username,
            'z_guan1'=>$z_guan1
        ]);
    }

    //lx=其它
    public function index3(){
        $data=$this->users;
        $kithe=input('?kithe') ? input('kithe') : getKitheNum();      //期数
        $username=input('?username') ? input('username') : $data['kauser'];//用户名
        $z_st=0;
        $z_re=0;
        $z_sum=0;
        $z_dagu=0;
        $z_guan1=0;
        $z_guan=0;
        $z_zong=0;
        $z_dai=0;
        $res=Db::name('tan')->distinct(true)->field('username')->where(['kithe'=>$kithe,'dai'=>$username])->order(['username'=>'desc'])->select();
        if($res){
            foreach ($res as $k=>$v){
                $Rs5=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re','sum(sum_m*dagu_zc/10) dagu_zc','sum(sum_m*guan1_zc/10) guan1_zc','sum(sum_m*guan_zc/10) guan_zc','sum(sum_m*zong_zc/10) zong_zc','sum(sum_m*dai_zc/10) dai_zc','sum(sum_m-sum_m*user_ds/100) sum_st'])->where(['kithe'=>$kithe,'username'=>$v['username']])->select();
                $re=$Rs5[0]['re'];
                $sum_m=$Rs5[0]['sum_m'];
                $dagu_zc=$Rs5[0]['dagu_zc'];
                $guan_zc=$Rs5[0]['guan_zc'];
                $zong_zc=$Rs5[0]['zong_zc'];
                $dai_zc=$Rs5[0]['dai_zc'];
                $z_st+=$Rs5[0]['sum_st'];
                $z_re+=$Rs5[0]['re'];
                $z_sum+=$Rs5[0]['sum_m'];
                $z_dagu+=$Rs5[0]['dagu_zc'];
                $z_guan1+=$Rs5[0]['guan1_zc'];
                $z_guan+=$Rs5[0]['guan_zc'];
                $z_zong+=$Rs5[0]['zong_zc'];
                $z_dai+=$Rs5[0]['dai_zc'];
                $res[$k]['rs5']=$Rs5[0];
                $res[$k]['guan']=Db::name('guan')->where(['kauser'=>$v['username']])->find();
            }
        }

        $kitheAll=Db::name('kithe')->field('nn')->order(['nn'=>'desc'])->select();
        return $this->fetch('',[
            'data'=>$data,
            'res'=>$res,
            'z_re'=>$z_re,      //总的下注数
            'z_sum'=>$z_sum,    //总的下注金额
            'z_st'=>$z_st,      //总的实投   实投 ==下注金额-会员的佣金
            'z_guan'=>$z_guan,  //股东总占成金额
            'z_zong'=>$z_zong,  //总代总占成金额
            'z_dai'=>$z_dai,    //代理总占成金额
            'kithe'=>$kithe,
            'kitheAll'=>$kitheAll,
            'username'=>$username,
            'z_guan1'=>$z_guan1
        ]);
    }

    //查询对应的页面
    public function cha(){
        $sess=session('lhc_users');
        $data=Db::name('guan')->find($sess['id']);
        $kithe=input('?kithe') ? input('kithe') : null;      //期数
        $username=input('?username') ? input('username') : null ;//用户名

        $z_re=0;
        $z_sum=0;
        $z_dagu=0;
        $z_guan=0;
        $z_zong=0;
        $z_dai=0;
        $re=0;
        $where=[];
        if($kithe){
            $where['kithe']=$kithe;
        }else{
            if(input('start')){
                $where['adddate']=['egt',input('start').' 00:00:00'];
            }
            if(input('stop')){
                $where['adddate']=['elt',input('start').' 00:00:00'];
            }
        }
        if ($username){
            $where['username']=input('username');
        }
        if(input('class') && input('key')){
            if(input('class')==1)$where['username']=input('key');
            if(input('class')==2)$where['num']=input('kye');
            if(input('class')==3)$where['abcd']=input('kye');
        }
        if(input('class2')){
            $where['class2']=input('class2');
        }
        if($data['lx']==1)$where['guan']=$data['kauser'];
        if($data['lx']==2)$where['zong']=$data['kauser'];
        if($data['lx']==3)$where['dai']=$data['kauser'];
        $result=Db::name('tan')->field('id,kithe,username,adddate,sum_m,rate,user_ds,class1,class2,class3,abcd')->where($where)->order('id desc')->paginate(20,null,['query'=>$this->request->param()]);

        $page_res=$result->all();
        $resultAll=Db::name('tan')->field('id,sum_m')->where($where)->select();
        $kitheAll=Db::name('kithe')->field('nn')->order(['nn'=>'desc'])->select();
        foreach ($page_res as $k=>$v){
            $page_res[$k]['mem']=Db::name('mem')->where(['kauser'=>$v['username']])->find();
        }
        foreach ($resultAll as $k=>$v){
            $z_re++;
            $z_sum+=$v['sum_m'];    //总下注金额
        }
        return $this->fetch('',[
            'kithe'=>$kithe,
            'username'=>$username,
            'result'=>$page_res,
            'kitheAll'=>$kitheAll,
            'z_re'=>$z_re,
            'z_sum'=>$z_sum,
            'page'=>$result->render(),
        ]);
    }
}