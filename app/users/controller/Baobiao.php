<?php
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
class Baobiao extends  Common{
    //报表查询
    public function index()
    {
        $sess = session('lhc_users');
        $data = Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
        $url = '';
        if ($data['lx'] == 1) {
            $url = url('findguan');
        }
        if ($data['lx'] == 2) {
            $url = url('findzong');
        }
        if ($data['lx'] == 3) {
            $url = url('finddai');
        }
        $kithe = Db::name('kithe')->field('id,nd,nn')->order('id desc')->select();

        return $this->fetch('', [
            'kithe' => $kithe,
            'url' => $url,
        ]);
    }
    //报表查询--股东
    public function findGuan(){
        $sess=session('lhc_users');
        $data=Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
        $start=input('start') ? input('start').' 00:00:00' :'';
        $stop=input('stop') ? input('stop').' 23:59:59' :'';
        $kithe=input('kithe') ? input('kithe') : '';
        $class2=input('class2') ? input('class2') : '';
        $username=input('username') ? input('username') : '';
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
        $_total=0;
        $zong_sf=0;
        $where=[];
        if($kithe)$where['kithe']=$kithe;
        else{
            if($start){
                $where['adddate']=['egt',$start];
            }
            if($stop){
                $where['adddate']=['elt',$stop];
            }
        }
        if ($class2){
            $where['class2']=$class2;
        }
        $nwhere=$where;
        $nwhere['guan']=$data['kauser'];
        $res=DB::name('tan')->where($nwhere)->order('zong desc')->field('zong,guan_zc, count(distinct zong) zcount')->select();

        foreach ($res as $k=>$v){
            $where1=$where;
            $where1['zong']=$v['zong'];
            $Rs5=Db::name('tan')->where($where1)->field('sum(sum_m) sum_m,count(*) re,sum(sum_m*dagu_zc/10) dagu_zc,sum(sum_m*guan_zc/10) guan_zc,sum(sum_m*zong_zc/10) zong_zc,sum(sum_m*dai_zc/10) dai_zc')->select();
            $where1['bm']=1;
            $Rs6=Db::name('tan')->where($where1)->field('sum(sum_m*dai_zc/10-sum_m*rate*dai_zc/10+sum_m*(dai_ds-user_ds)/100-sum_m*guan_ds/100*(dai_zc)/10) as daisf,sum(sum_m*zong_zc/10-sum_m*rate*zong_zc/10+sum_m*(zong_ds-dai_ds)/100-sum_m*guan_ds/100*(zong_zc)/10) as zongsf,sum(sum_m*guan_zc/10-sum_m*rate*guan_zc/10+sum_m*(guan_ds-zong_ds)/100-sum_m*guan_ds/100*(guan_zc)/10) as guansf,sum(sum_m*rate-sum_m+sum_m*Abs(user_ds)/100) as sum_m,sum(sum_m*Abs(guan_ds)/100) as sum_ds,sum(sum_m*dagu_zc/10) as dagu_zc,sum(sum_m*guan_zc/10) as guan_zc,sum(sum_m*zong_zc/10) as zong_zc,sum(sum_m*dai_zc/10) as dai_zc,sum(sum_m*Abs(user_ds)/100) as user_ds,sum(sum_m*Abs(guan_ds-zong_ds)/100) as guan_ds,sum(sum_m*Abs(zong_ds-dai_ds)/100) as zong_ds,sum(sum_m*Abs(dai_ds-user_ds)/100) as dai_ds')->select();
            $where1['bm']=0;
            $Rs7=Db::name('tan')->where($where1)->field('sum(sum_m*Abs(dai_ds-user_ds)/100+sum_m*dai_zc/10-sum_m*(dai_zc)/10*guan_ds/100) as daisf,sum(sum_m*Abs(zong_ds-dai_ds)/100+sum_m*zong_zc/10-sum_m*(zong_zc)/10*guan_ds/100) as zongsf,sum(sum_m*Abs(guan_ds-zong_ds)/100+sum_m*guan_zc/10-sum_m*guan_zc/10*guan_ds/100) as guansf,sum(sum_m*Abs(user_ds)/100-sum_m) as sum_m,sum(sum_m*dagu_zc/10) as dagu_zc,sum(sum_m*guan_zc/10) as guan_zc,sum(sum_m*zong_zc/10) as zong_zc,sum(sum_m*dai_zc/10) as dai_zc,sum(sum_m*Abs(user_ds)/100) as user_ds,sum(sum_m*Abs(guan_ds-zong_ds)/100) as guan_ds,sum(sum_m*Abs(zong_ds-dai_ds)/100) as zong_ds,sum(sum_m*Abs(dai_ds-user_ds)/100) as dai_ds')->select();
            $re=$Rs5[0]['re'];
            $sum_m=$Rs5[0]['sum_m'];
            $dagu_zc=$Rs5[0]['dagu_zc'];
            $guan_zc=$Rs5[0]['guan_zc'];
            $zong_zc=$Rs5[0]['zong_zc'];
            $dai_zc=$Rs5[0]['dai_zc'];
            $z_guansf+=$Rs6[0]['guansf']+$Rs7[0]['guansf'];
            $z_zongsf+=$Rs6[0]['zongsf']+$Rs7[0]['zongsf'];
            $z_daisf+=$Rs6[0]['daisf']+$Rs7[0]['daisf'];
            $z_re+=$Rs5[0]['re'];
            $z_sum+=$Rs5[0]['sum_m'];
            $z_dagu+=$Rs5[0]['dagu_zc'];
            $z_guan+=$Rs5[0]['guan_zc'];
            $z_zong+=$Rs5[0]['zong_zc'];
            $z_dai+=$Rs5[0]['dai_zc'];
            $z_guands+=$Rs6[0]['guan_ds']+$Rs7[0]['guan_ds'];
            $z_daids+=$Rs6[0]['dai_ds']+$Rs7[0]['dai_ds'];
            $usersf=$Rs6[0]['sum_m']+$Rs7[0]['sum_m'];
            $guansf=$Rs6[0]['guansf']+$Rs7[0]['guansf'];
            $zongsf=$Rs6[0]['zongsf']+$Rs7[0]['zongsf'];
            $daisf=$Rs6[0]['daisf']+$Rs7[0]['daisf'];
            $res[$k]['usersf']=$usersf;       //$usersf-$zongsf-$daisf
            $res[$k]['guansf']=$guansf;
            $res[$k]['zongsf']=$zongsf;
            $res[$k]['daisf']=$daisf;
            $res[$k]['zs']=number_format((0-$usersf-$zongsf-$daisf),2);
            $res[$k]['gs']=number_format((0-$usersf-$guansf-$zongsf-$daisf),2);
            if(input('?username') && input('username')!=$v['zong']){
                $z_userds+=$Rs6[0]['user_ds']+$Rs7[0]['user_ds'];
                $z_usersf+=$Rs6[0]['sum_m']+$Rs7[0]['sum_m'];
                $z_zongds+=$Rs6[0]['zong_ds']+$Rs7[0]['zong_ds'];
                $zong_sf+=0-$usersf-$zongsf-$daisf;
                $_total+=$Rs5[0]['guan_zc'];
            }
            if(input('?username') && input('username')==$v['zong']){
                $z_guands+=$Rs6[0]['user_ds']+$Rs7[0]['user_ds'];
                $z_guansf+=$Rs6[0]['sum_m']+$Rs7[0]['sum_m'];
                $_total-=$Rs5[0]['sum_m'];
            }
            $zz_sf+=0-$usersf-$guansf-$zongsf-$daisf;
            $res[$k]['rs5']=$Rs5[0];
            $res[$k]['rs6']=$Rs6[0];
            $res[$k]['rs7']=$Rs7[0];
            $res[$k]['guan']=Db::name('guan')->where(['kauser'=>$v['zong']])->find();
        }

        return $this->fetch('',[
            'kithe'=>$kithe,
            'start'=>$start,
            'stop'=>$stop,
            'data'=>$data,
            'class2'=>$class2,
            'username'=>$username,
            'res'=>$res,
            'z_re'=>$z_re,
            'z_sum'=>$z_sum,
            'z_userds'=>$z_userds,
            'z_usersf'=>$z_usersf,
            'z_zongds'=>$z_zongds,
            'z_zongsf'=>$z_zongsf,
            'zong_sf'=>$zong_sf,
            '_total'=>$_total,
            'z_re'=>$z_re,
            'z_guands'=>$z_guands,
            'z_guansf'=>$z_guansf,
            'zz_sf'=>$zz_sf

        ]);
    }

    //报表查询--总代理
    public function findzong(){
        $sess=session('lhc_users');
        $data=Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
        $start=input('start') ? input('start').' 00:00:00' :'';
        $stop=input('stop') ? input('stop').' 23:59:59' :'';
        $guanname=input('guanname') ? input('guanname') : '';
        $agentname=input('agentname') ? input('agentname') : '';
        $username=input('username') ? input('username') : '';
        $kithe=input('?kithe') ? input('kithe') : '';

        if(empty($username)){
            $username=$data['kauser'];
            $agentname=$data['kauser'];
        }
        return $this->fetch('',[
            'username'=>$username,
            'kithe'=>$kithe,
            'start'=>$start,
            'stop'=>$stop,
            'data'=>$data,
        ]);
    }



}