<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/29
 * Time: 11:56
 */
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
class History extends Common{
    public function index(){
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
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
        $d   =   array("日","一","二","三","四","五","六");
        $zong_sf=0;
        $dai_sf=0;
        $result=Db::name('kithe')->field(['nn','nd'])->where(['lx'=>1,'na'=>['neq',0]])->order(['nn'=>'desc'])->select();
        foreach ($result as $k=>$v){
            $r1=Db::name('tan')->field('sum(sum_m) as sum_m,count(*) as re,sum(sum_m*dagu_zc/10) as dagu_zc,sum(sum_m*guan_zc/10) as guan_zc,sum(sum_m*zong_zc/10) as zong_zc,sum(sum_m*dai_zc/10) as dai_zc')->where(['username'=>$mem['kauser'],'kithe'=>$v['nn']])->select();
            $Rs5 =$r1[0];

            $r1=Db::name('tan')->where(['username'=>$mem['kauser'],'kithe'=>$v['nn'],'bm'=>1])->field('sum(sum_m*dai_zc/10-sum_m*rate*dai_zc/10+sum_m*(dai_ds-user_ds)/100*(10-dai_zc)/10-sum_m*user_ds/100*(dai_zc)/10) as daisf,sum(sum_m*zong_zc/10-sum_m*rate*zong_zc/10+sum_m*(zong_ds-dai_ds)/100*(10-zong_zc-dai_zc)/10-sum_m*dai_ds/100*(zong_zc)/10) as zongsf,sum(sum_m*guan_zc/10-sum_m*rate*guan_zc/10+sum_m*(guan_ds-zong_ds)/100*(10-guan_zc-zong_zc-dai_zc)/10-sum_m*zong_ds/100*(guan_zc)/10) as guansf,sum(sum_m*rate-sum_m+sum_m*Abs(user_ds)/100) as sum_m,sum(sum_m*dagu_zc/10) as dagu_zc,sum(sum_m*guan_zc/10) as guan_zc,sum(sum_m*zong_zc/10) as zong_zc,sum(sum_m*dai_zc/10) as dai_zc,sum(sum_m*Abs(user_ds)/100) as user_ds,sum(sum_m*Abs(guan_ds-zong_ds)/100*(10-guan_zc-zong_zc-dai_zc)/10) as guan_ds,sum(sum_m*Abs(zong_ds-dai_ds)/100*(10-zong_zc-dai_zc)/10) as zong_ds,sum(sum_m*Abs(dai_ds-user_ds)/100*(10-dai_zc)/10) as dai_ds')->select();
            $Rs6 = $r1[0];
            $r1=Db::name('tan')->where(['username'=>$mem['kauser'],'kithe'=>$v['nn'],'bm'=>0])->field('sum(sum_m*Abs(dai_ds-user_ds)/100*(10-dai_zc)/10+sum_m*dai_zc/10-sum_m*(dai_zc)/10*user_ds/100) as daisf,sum(sum_m*Abs(zong_ds-dai_ds)/100*(10-zong_zc-dai_zc)/10+sum_m*zong_zc/10-sum_m*(zong_zc)/10*dai_ds/100) as zongsf,sum(sum_m*Abs(guan_ds-zong_ds)/100*(10-guan_zc-zong_zc-dai_zc)/10+sum_m*guan_zc/10-sum_m*guan_zc/10*zong_ds/100) as guansf,sum(sum_m*Abs(user_ds)/100-sum_m) as sum_m,sum(sum_m*dagu_zc/10) as dagu_zc,sum(sum_m*guan_zc/10) as guan_zc,sum(sum_m*zong_zc/10) as zong_zc,sum(sum_m*dai_zc/10) as dai_zc,sum(sum_m*Abs(user_ds)/100) as user_ds,sum(sum_m*Abs(guan_ds-zong_ds)/100*(10-guan_zc-zong_zc-dai_zc)/10) as guan_ds,sum(sum_m*Abs(zong_ds-dai_ds)/100*(10-zong_zc-dai_zc)/10) as zong_ds,sum(sum_m*Abs(dai_ds-user_ds)/100*(10-dai_zc)/10) as dai_ds')->select();
            $Rs7 = $r1[0];

            $result[$k]['rs5']=$Rs5;
            $result[$k]['rs6']=$Rs6;
            $result[$k]['rs7']=$Rs7;

            $re=$Rs5['re'];
            $sum_m=$Rs5['sum_m'];
            $dagu_zc=$Rs5['dagu_zc'];
            $guan_zc=$Rs5['guan_zc'];
            $zong_zc=$Rs5['zong_zc'];
            $dai_zc=$Rs5['dai_zc'];
            $z_usersf+=$Rs6['sum_m']+$Rs7['sum_m'];
            $z_guansf+=$Rs6['guansf']+$Rs7['guansf'];
            $z_zongsf+=$Rs6['zongsf']+$Rs7['zongsf'];
            $z_daisf+=$Rs6['daisf']+$Rs7['daisf'];
            $z_re+=$Rs5['re'];
            $z_sum+=$Rs5['sum_m'];
            $z_dagu+=$Rs5['dagu_zc'];
            $z_guan+=$Rs5['guan_zc'];
            $z_zong+=$Rs5['zong_zc'];
            $z_dai+=$Rs5['dai_zc'];
            $z_userds+=$Rs6['user_ds']+$Rs7['user_ds'];
            $z_guands+=$Rs6['guan_ds']+$Rs7['guan_ds'];
            $z_zongds+=$Rs6['zong_ds']+$Rs7['zong_ds'];
            $z_daids+=$Rs6['dai_ds']+$Rs7['dai_ds'];
            $usersf=$Rs6['sum_m']+$Rs7['sum_m'];
            $guansf=$Rs6['guansf']+$Rs7['guansf'];
            $zongsf=$Rs6['zongsf']+$Rs7['zongsf'];
            $daisf=$Rs6['daisf']+$Rs7['daisf'];
            $zz_sf+=0-$usersf-$daisf;
            $zong_sf+=0-$usersf-$zongsf-$daisf;
            $dai_sf+=0-$usersf-$daisf;
            //星期
            $result[$k]['d']=$d[date("w",strtotime($v['nd']))];
        }

        return $this->fetch('',[
           'result'=>$result,
            'z_sum'=>$z_sum,
            'z_userds'=>$z_userds,
            'z_usersf'=>$z_usersf,
        ]);
    }

    public function getList(){
        if(!input('?kithe'))$this->error('请求参数不正确');
        $kithe=input('kithe');
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
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

        $result=Db::name('tan')->field('num,adddate,rate,sum_m,class1,class2,class3,user_ds,bm')->where(['username'=>$mem['kauser'],'kithe'=>$kithe])->order(['id'=>'desc'])->select();
        foreach ($result as $k=>$v){
            $z_re++;
            $z_sum+=$v['sum_m'];
            if($v['class1']=='过关') {
                $show1 = explode(',', $v['class2']);
                $show2 = explode(",", $v['class3']);
                $z = count($show1);
                $k = 0;
                $result[$k]['td4'] = [];
                for ($j = 0; $j < count($show1) - 1; $j = $j + 1) {
                    $result[$k]['td4'][$j] = $show1[$j] . '&nbsp;' . $show2[$k] . '@ &nbsp;' . $show2[$k + 1];
                    $k = $k + 2;
                }
            }
            if($v['bm']==2){
                $result[$k]['td7']=0;
            }else{
                $result[$k]['td7']=$v['sum_m']*abs($v['user_ds'])/100;
                $z_userds+=$v['sum_m']*abs($v['user_ds'])/100;
            }
            if($v['bm']==2){
                $result[$k]['td8']=0;
            }elseif($v['bm'] ==1){
                $result[$k]['td8']=$v['sum_m']*$v['rate']-$v['sum_m']+$v['sum_m']*abs($v['user_ds'])/100;
                $z_user+=$v['sum_m']*$v['rate']-$v['sum_m']+$v['sum_m']*abs($v['user_ds'])/100;
            }else{
                $result[$k]['td8']=$v['sum_m']*abs($v['user_ds'])/100-$v['sum_m'];
                $z_user+=$v['sum_m']*abs($v['user_ds'])/100-$v['sum_m'];
            }
        }
        return $this->fetch('',[
            'kithe'=>$kithe,
            'result'=>$result,
            'z_re'=>$z_re,
            'z_sum'=>$z_sum,
            'z_userds'=>$z_userds,
            'z_user'=>$z_user
        ]);
    }
}