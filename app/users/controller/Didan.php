<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/18
 * Time: 10:29
 */
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
use think\Request;

class Didan extends Common{
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $sess=session('lhc_users');
        if($sess['lx']!=1 && $sess['lx']!=4)exit('您当前无权访问');
        $this->guan=Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
    }

    //股东底单
    public function index(){
        $data=$this->guan;
        $z_re=0;
        $z_sum=0;
        $z_dagu=0;
        $z_guan=0;
        $z_zong=0;
        $z_dai=0;
        $z_userds=0;
        $z_guands=0;
        $z_zongds=0;
        $z_daids=0;
        $z_usersf=0;
        $z_guansf=0;
        $z_zongsf=0;
        $z_daisf=0;
        $zz_sf=0;
        $result=Db::name('kithe')->field('id,nn,nd')->order(['nn'=>'desc'])->select();
        $d=['日','一','二','三','四','五','六'];
        foreach ($result as $k=>$v){
            if($data['lx']==4){
                $Rs5=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re','sum(sum_m*dagu_zc/10) dagu_zc','sum(sum_m*guan_zc/10) guan_zc','sum(sum_m*zong_zc/10) zong_zc','sum(sum_m*dai_zc/10) dai_zc'])->where(['guan1'=>$data['kauser'],'kithe'=>$v['nn']])->select();
            }
            if($data['lx']==1){
                $Rs5=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re','sum(sum_m*dagu_zc/10) dagu_zc','sum(sum_m*guan_zc/10) guan_zc','sum(sum_m*zong_zc/10) zong_zc','sum(sum_m*dai_zc/10) dai_zc'])->where(['guan'=>$data['kauser'],'kithe'=>$v['nn']])->select();
            }
            if($data['lx']==2){
                $Rs5=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re','sum(sum_m*dagu_zc/10) dagu_zc','sum(sum_m*guan_zc/10) guan_zc','sum(sum_m*zong_zc/10) zong_zc','sum(sum_m*dai_zc/10) dai_zc'])->where(['zong'=>$data['kauser'],'kithe'=>$v['nn']])->select();
            }
            if($data['lx']==3){
                $Rs5=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re','sum(sum_m*dagu_zc/10) dagu_zc','sum(sum_m*guan_zc/10) guan_zc','sum(sum_m*zong_zc/10) zong_zc','sum(sum_m*dai_zc/10) dai_zc'])->where(['dai'=>$data['kauser'],'kithe'=>$v['nn']])->select();
            }
            $result[$k]['week']=$d[date('w',strtotime($v['nd']))];

            $field1=[
                'sum(sum_m*dai_zc/10-sum_m*rate*dai_zc/10+sum_m*(dai_ds-user_ds)/100*(10-dai_zc)/10-sum_m*user_ds/100*(dai_zc)/10) daisf',
                'sum(sum_m*zong_zc/10-sum_m*rate*zong_zc/10+sum_m*(zong_ds-dai_ds)/100*(10-zong_zc-dai_zc)/10-sum_m*dai_ds/100*(zong_zc)/10) zongsf',
                'sum(sum_m*guan_zc/10-sum_m*rate*guan_zc/10+sum_m*(guan_ds-zong_ds)/100*(10-guan_zc-zong_zc-dai_zc)/10-sum_m*zong_ds/100*(guan_zc)/10) guansf',
                'sum(sum_m*rate-sum_m+sum_m*Abs(user_ds)/100) sum_m',
                'sum(sum_m*dagu_zc/10) dagu_zc',        //每单占成的金额
                'sum(sum_m*guan_zc/10) guan_zc',
                'sum(sum_m*zong_zc/10) zong_zc',
                'sum(sum_m*dai_zc/10) dai_zc',
                'sum(sum_m*Abs(user_ds)/100) user_ds',
                'sum(sum_m*Abs(guan_ds-zong_ds)/100*(10-guan_zc-zong_zc-dai_zc)/10) guan_ds',
                'sum(sum_m*Abs(zong_ds-dai_ds)/100*(10-zong_zc-dai_zc)/10) zong_ds',
                'sum(sum_m*Abs(dai_ds-user_ds)/100*(10-dai_zc)/10) dai_ds'
            ];
            $Rs6=Db::name('tan')->field($field1)->where(['guan'=>$data['kauser'],'kithe'=>$v['nn'],'bm'=>1])->select();
            $field2=[
                'sum(sum_m*Abs(dai_ds-user_ds)/100*(10-dai_zc)/10+sum_m*dai_zc/10-sum_m*(dai_zc)/10*user_ds/100) daisf',
                'sum(sum_m*Abs(zong_ds-dai_ds)/100*(10-zong_zc-dai_zc)/10+sum_m*zong_zc/10-sum_m*(zong_zc)/10*dai_ds/100) zongsf',
                'sum(sum_m*Abs(guan_ds-zong_ds)/100*(10-guan_zc-zong_zc-dai_zc)/10+sum_m*guan_zc/10-sum_m*guan_zc/10*zong_ds/100) guansf',
                'sum(sum_m*Abs(user_ds)/100-sum_m) sum_m','sum(sum_m*dagu_zc/10) dagu_zc','sum(sum_m*guan_zc/10) guan_zc',
                'sum(sum_m*zong_zc/10) zong_zc','sum(sum_m*dai_zc/10) dai_zc','sum(sum_m*Abs(user_ds)/100) user_ds',
                'sum(sum_m*Abs(guan_ds-zong_ds)/100*(10-guan_zc-zong_zc-dai_zc)/10) guan_ds',
                'sum(sum_m*Abs(zong_ds-dai_ds)/100*(10-zong_zc-dai_zc)/10) zong_ds',
                'sum(sum_m*Abs(dai_ds-user_ds)/100*(10-dai_zc)/10) dai_ds'
            ];
            $Rs7=Db::name('tan')->field($field2)->where(['guan'=>$data['kauser'],'kithe'=>$v['nn']])->select();
            $re=$Rs5[0]['re'];
            $sum_m=$Rs5[0]['sum_m'];
            $dagu_zc=$Rs5[0]['dagu_zc'];
            $guan_zc=$Rs5[0]['guan_zc'];
            $zong_zc=$Rs5[0]['zong_zc'];
            $dai_zc=$Rs5[0]['dai_zc'];

            $z_usersf+=$Rs6[0]['sum_m']+$Rs7[0]['sum_m'];
            $z_guansf+=$Rs6[0]['guansf']+$Rs7[0]['guansf'];
            $z_zongsf+=$Rs6[0]['zongsf']+$Rs7[0]['zongsf'];
            $z_daisf+=$Rs6[0]['daisf']+$Rs7[0]['daisf'];
            $z_re+=$Rs5[0]['re'];
            $z_sum+=$Rs5[0]['sum_m'];
            $z_dagu+=$Rs5[0]['dagu_zc'];
            $z_guan+=$Rs5[0]['guan_zc'];
            $z_zong+=$Rs5[0]['zong_zc'];
            $z_dai+=$Rs5[0]['dai_zc'];
            $z_userds+=$Rs6[0]['user_ds']+$Rs7[0]['user_ds'];
            $z_guands+=$Rs6[0]['guan_ds']+$Rs7[0]['guan_ds'];
            $z_zongds+=$Rs6[0]['zong_ds']+$Rs7[0]['zong_ds'];
            $z_daids+=$Rs6[0]['dai_ds']+$Rs7[0]['dai_ds'];

            $usersf=$Rs6[0]['sum_m']+$Rs7[0]['sum_m'];
            $guansf=$Rs6[0]['guansf']+$Rs7[0]['guansf'];
            $zongsf=$Rs6[0]['zongsf']+$Rs7[0]['zongsf'];
            $daisf=$Rs6[0]['daisf']+$Rs7[0]['daisf'];
            $zz_sf+=0-$usersf-$daisf;
            $zong_sf=0-$usersf-$zongsf-$daisf;
            $dai_sf=0-$usersf-$daisf;
            if($Rs5[0]['sum_m']>0){
                $result[$k]['rs5']=$Rs5[0];
                $result[$k]['rs6']=$Rs6[0];
                $result[$k]['rs7']=$Rs7[0];
            }
        }
        return $this->fetch('',[
            'result'=>$result,
            'z_sum'=>$z_sum,        //总金额
            'z_userds'=>$z_userds,  //总佣金
            'z_usersf'=>$z_usersf,  //结果
        ]);
    }


    //每期订单信息
    public function KitheTan(){
        $data=$this->guan;
        if($data['lx']!=1 && $data['lx']!=4)$this->error('非法访问');
        if(input('?kithe')){
            $kithe=input('kithe');
        }else{
            $kithe=getKitheNum();
        }
        $num=0;
        $where=[];
        if($data['lx']==4){
            $where=['guan1'=>$data['kauser'],'kithe'=>$kithe];
        }
        if($data['lx']==1){
            $where=['guan'=>$data['kauser'],'kithe'=>$kithe];
        }
        if($data['lx']==2){
            $where=['zong'=>$data['kauser'],'kithe'=>$kithe];
        }
        if($data['lx']==3){
            $where=['dai'=>$data['kauser'],'kithe'=>$kithe];
        }
        $num=Db::name('tan')->where($where)->count();
        $res=Db::name('tan')->where($where)->order(['id'=>'desc'])->paginate();
        $result=$res->all();
        $z_re=0;
        $z_sum=0;
        $z_dagu=0;
        $z_guan=0;
        $z_zong=0;
        $z_dai=0;
        $re=0;
        $z_user=0;
        $z_userds=0;
        $z_daids=0;

        foreach ($result as $k=>$v){
            if($v['class1']=='过关'){
                $result[$k]['c2']=explode(',',$v['class2']);
                $result[$k]['c3']=explode(',',$v['class3']);
            }
        }

        //所有的数据
        $res1=Db::name('tan')->where($where)->select();
        foreach ($res1 as $k=>$v){
            $z_sum+=$v['sum_m'];        //下注总金额
            if($v['bm']!=2){
                if($v['bm']==1){    //bm=1 说明 是赢钱？？
                    $z_user+=($v['sum_m']*$v['rate']-$v['sum_m']+$v['sum_m']*abs($v['user_ds'])/100);    //会员最终输赢
                }else{  //bm==其它说明输钱  佣金-下注本金
                    $z_user+=$v['sum_m']*abs($v['user_ds'])/100-$v['sum_m'];
                }
                $z_userds+=$v['sum_m']*abs($v['user_ds'])/100;      //总的佣金
            }
        }
        return $this->fetch('',[
            'data'=>$data,
            'kithe'=>$kithe,
            'result'=>$result,
            'page'=>$res->render(),
            'num'=>$num,
            'z_sum'=>$z_sum,   //总下注金额
            'z_user'=>$z_user,  //总的输赢
            'z_userds'=>$z_userds,//总的佣金
        ]);
    }
}