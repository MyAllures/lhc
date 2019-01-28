<?php
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
class Zoufei extends Common{
    public function index(){
        $ids="特A";
        $sess=session('lhc_users');
        $row=Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
        $best=$row['best'];
        $zm=$row['zm'];
        $zm6=$row['zm6'];
        $lm=$row['lm'];
        $zt=$row['zt'];
        $zf_num=$row['tm'];
        $sx=$row['sx'];
        $bb=$row['bb'];
        $gg=$row['gg'];
        $ws=$row['ws'];
        $xx=$row['xx'];
        $wx=$row['wx'];
        $pz=$row['pz'];
        $kithe=input('?kithe') ? input('kithe') : getKitheNum();

        if ($kithe!=getKitheNum())$ftime=20000000;
        $ka_guanid=$row['id'];

        if ($row['lx']==4){
            $r1=Db::name('guan')->field('SUM(cs) As sum_m')->where(['lx'=>1,'guanid'=>$ka_guanid])->select();
            $fagenttime=60000;
        }
        if ($row['lx']==1){
            $r1=Db::name('guan')->field('SUM(cs) As sum_m')->where(['lx'=>2,'guanid'=>$ka_guanid])->select();
            $fagenttime=60000;
        }
        if ($row['lx']==2){
            $r1=Db::name('guan')->field('SUM(cs) As sum_m')->where(['lx'=>3,'zongid'=>$ka_guanid])->select();
        }
        if ($row['lx']==3){
            $r1=Db::name('mem')->field('SUM(cs) As sum_m')->where(['danid'=>$ka_guanid])->select();
        }
        $mumu=$r1[0]['sum_m'];
        $r1=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$row['kauser']])->field('SUM(sum_m) As sum_m1')->select();
        $mkmk=$r1[0]['sum_m1'];
        $sum_sumz=$row['cs']-$mkmk-$mumu;

        $R=0;
        $XF=11;
        if(getKithe(29)==0 || getKithe($XF)==0)exit('封盘中...');
        $tm=input('?tm') ? input('tm') :1;
        $tm1=input('?tm1') ? input('tm1') :1;
        $tm2=input('?tm2') ? input('tm2') :1;
        $jifei=$row['jifei'];
        if ($tm2=="0"){
            $zf="预计盈利";
        }else{
            $zf="走飞";
        }


        $d_ShowTable=Db::name('bl')->field('rate,class3,class1,class2')->where(['class2'=>'特A'])->select();
        $y=is_array($d_ShowTable) ? count($d_ShowTable) : 0;


        $vvvv=[];

        if ($row['lx']==4){
            $vvvv=['guan1'=>$row['kauser'],'username'=>['neq',$row['kauser']]];
//            $vbbb=['count(*) as re','SUM(sum_m) sum_money','SUM(sum_m*(guan_ds-zong_ds)/100) sum_ds','SUM(0-sum_m*rate*guan_zc/10) sum_m3','SUM(sum_m*guan_zc/10) sum_m4','SUM(0-sum_m*rate) sum_m5','SUM(0-sum_m*(guan_ds-zong_ds)/100*guan_zc/10) sum_ds1'];
            $vbbb=" count(*) as re,SUM(sum_m) As sum_money,SUM(sum_m*(guan1_ds-guan_ds)/100) As sum_ds,SUM(0-sum_m*rate*guan1_zc/10) As sum_m3,SUM(sum_m*guan1_zc/10) As sum_m4,SUM(0-sum_m*rate) As sum_m5,SUM(0-sum_m*(guan1_ds-guan_ds)/100*guan1_zc/10) As sum_ds1 ";
        }
        if ($row['lx']==1){
            $vvvv=['guan'=>$row['kauser'],'username'=>['neq',$row['kauser']]];
//            $vbbb=['count(*) as re','SUM(sum_m) sum_money','SUM(sum_m*(guan_ds-zong_ds)/100) sum_ds','SUM(0-sum_m*rate*guan_zc/10) sum_m3','SUM(sum_m*guan_zc/10) sum_m4','SUM(0-sum_m*rate) sum_m5','SUM(0-sum_m*(guan_ds-zong_ds)/100*guan_zc/10) sum_ds1'];
            $vbbb=" count(*) as re,SUM(sum_m) As sum_money,SUM(sum_m*(guan_ds-zong_ds)/100) As sum_ds,SUM(0-sum_m*rate*guan_zc/10) As sum_m3,SUM(sum_m*guan_zc/10) As sum_m4,SUM(0-sum_m*rate) As sum_m5,SUM(0-sum_m*(guan_ds-zong_ds)/100*guan_zc/10) As sum_ds1 ";
        }
        if ($row['lx']==2){
            $vvvv=['zong'=>$row['kauser'],'username'=>['neq',$row['kauser']]];
            $vbbb=" count(*) as re,SUM(sum_m) As sum_money,SUM(sum_m*(zong_ds-dai_ds)/100) As sum_ds,SUM(0-sum_m*rate*zong_zc/10) As sum_m3,SUM(sum_m*zong_zc/10) As sum_m4,SUM(0-sum_m*rate) As sum_m5,SUM(0-sum_m*(zong_ds-dai_ds)/100*zong_zc/10) As sum_ds1 ";
        }
        if ($row['lx']==3){
            $vvvv=['dai'=>$row['kauser'],'username'=>['neq',$row['kauser']]];
            $vbbb=" count(*) as re,SUM(sum_m) As sum_money,SUM(sum_m*(dai_ds-user_ds)/100) As sum_ds,SUM(0-sum_m*rate*dai_zc/10) As sum_m3,SUM(sum_m*dai_zc/10) As sum_m4,SUM(0-sum_m*rate) As sum_m5,SUM(0-sum_m*(dai_ds-user_ds)/100*dai_zc/10) As sum_ds1 ";
        }
        //主要问题所在
        foreach (range(1,50) as $k=>$v){
            $i=$v;
            $sum_tm1[$i]=$i;
            $vw=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>$i]);
            $r1=Db::name('tan')->field($vbbb)->where($vw)->select();
            $rs5=$r1[0];

            $r1=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>$i,'username'=>$row['kauser']])->select();
            $rs2=$r1[0];
            $Rsbl=Db::name('bl')->where(['class1'=>'特码','class2'=>'特A','class3'=>$i])->find();


            if ($Rsbl['rate']!=""){
                $sum_bl[$i]=$Rsbl['rate'];
            }else{
                $sum_bl[$i]=0;
            }
            if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
            if ($rs5['re']!=""){$re=$rs5['re'];}else{$re=0;}
            if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
            if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
            if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
            if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
            if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}

            if ($rs2['sum_money']!=""){
                $sum_money-=$rs2['sum_money'];
                $sum_m4-=$rs2['sum_money'];
                $sum_m3-=$rs2['sum_m5'];
                $sum_ds-=$rs2['sum_ds'];
                $sum_m5-=$rs2['sum_m5'];
                $sum_ds1-=$rs2['sum_ds'];
            }
            if ($tm==0){

                $sum_money1[$i]=$sum_money;
                $sum_zq[$i]=$sum_m5;
                $sum_dsds[$i]=$sum_ds;
            }else{

                $sum_money1[$i]=$sum_m4;
                $sum_zq[$i]=$sum_m3;
                $sum_dsds[$i]=$sum_ds1;
            }
            $sum_zm[$i]=$sum_money1[$i]*$jifei/100  ;
            $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);

            //全部
            if ($tm1==1){
                //单
                if ($i%2==1){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'单']);
                    $rs5=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs2=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'单','username'=>$row['kauser']])->select();
                    $rs5=$rs5[0];
                    $rs2=$rs2[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/25;
                            $sum_m4-=$rs2['sum_money']/25;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }
                        if ($tm==0){
                            $sum_money1[$i]+=$sum_money/25;
                        }else{
                            $sum_money1[$i]+=$sum_m4/25;
                        }
                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/25;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/25;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                    }
                }
                //大单
                if ($i%2==1 && $i>24){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'大单']);
                    $rs5=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs2=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'大单','username'=>$row['kauser']])->select();
                    $rs5=$rs5[0];
                    $rs2=$rs2[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/13;
                            $sum_m4-=$rs2['sum_money']/13;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }
                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money*1.1/13;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4*1.1/13;
                        }

                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/13;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/13;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                        $sum_yl[$i]=$sum_zm[$i]*$sum_bl[$i];

                    }
                }

                //小单
                if ($i%2==1&&$i<24 or $i==49){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'小单']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'小单','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];

                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/13;
                            $sum_m4-=$rs2['sum_money']/13;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }
                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money*1.1/13;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4*1.1/13;
                        }
                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/13;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/13;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                        $sum_yl[$i]=$sum_zm[$i]*$sum_bl[$i];

                    }
                }

                //双
                if ($i%2==0 or $i==49){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'双']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'双','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/25;
                            $sum_m4-=$rs2['sum_money']/25;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }

                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money/25;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4/25;
                        }

                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/25;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/25;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                    }
                }

                //大双
                if ($i%2==0&&$i>25 or $i==49){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'大双']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'大双','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/13;
                            $sum_m4-=$rs2['sum_money']/13;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }
                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money*1.1/13;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4*1.1/13;
                        }

                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/13;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/13;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                        $sum_yl[$i]=$sum_zm[$i]*$sum_bl[$i];
                    }
                }


                //小双
                if ($i%2==0&&$i<25 or $i==49){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'小双']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'小双','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/13;
                            $sum_m4-=$rs2['sum_money']/13;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }

                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money*1.1/12;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4*1.1/12;
                        }

                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/12;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/12;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }

                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                        $sum_yl[$i]=$sum_zm[$i]*$sum_bl[$i];
                    }
                }



                //大
                if ($i>=25){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'大']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'大','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/25;
                            $sum_m4-=$rs2['sum_money']/25;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }

                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money/25;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4/25;
                        }

                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/25;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/25;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                    }
                }

                //尾大
                if ($i%10>4){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'尾大']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'尾大','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];

                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/25;
                            $sum_m4-=$rs2['sum_money']/25;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }

                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money/22.0663;   //}

                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4/22.0663;     //}
                        }
                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/25;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/25;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                        $sum_yl[$i]=$sum_zm[$i]*$sum_bl[$i];
                    }
                }

                //小
                if ($i<=24 or $i==49){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'小']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'小','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/25;
                            $sum_m4-=$rs2['sum_money']/25;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }

                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money/25;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4/25;
                        }

                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/25;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/25;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }

                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                    }
                }

                //尾小
                if ($i%10<5){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'尾小']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'尾小','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/25;
                            $sum_m4-=$rs2['sum_money']/25;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }

                        if ($i==49){
                            if ($tm==0){
                                $sum_money1[$i]=$sum_money1[$i]+$sum_money*22.73/1000;
                            }else{
                                $sum_money1[$i]=$sum_money1[$i]+$sum_m4*22.73/1000;
                            }
                        }

                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money/22.0663;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4/22.0663;
                        }
                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/25;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/25;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                        $sum_yl[$i]=$sum_zm[$i]*$sum_bl[$i];
                    }
                    if ($i==49){
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                        $sum_yl[$i]=$sum_zm[$i]*$sum_bl[$i];
                    }
                }

                //合单
                if ((($i%10)+intval($i/10))%2==1){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'合单']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'合单','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/25;
                            $sum_m4-=$rs2['sum_money']/25;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }

                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money/25;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4/25;
                        }

                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/25;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/25;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                    }

                }
                //合双
                if ((($i%10)+intval($i/10))%2==0 or $i==49){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'合双']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'合双','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/25;
                            $sum_m4-=$rs2['sum_money']/25;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }

                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money/25;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4/25;
                        }
                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/25;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/25;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                    }
                }
                //红波
                if (getColor($i)=="红波"){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'红波']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'红波','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/17;
                            $sum_m4-=$rs2['sum_money']/17;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }

                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money/17;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4/17;
                        }

                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/17;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/17;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                    }
                }

                //蓝波
                if (getColor($i)=="蓝波"){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'蓝波']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'蓝波','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];
                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/16;
                            $sum_m4-=$rs2['sum_money']/16;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }
                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money/16;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4/16;
                        }
                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/16;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/16;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }

                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                    }
                }

                //绿波
                if (getColor($i)=="绿波"){
                    $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>'特码','class3'=>'绿波']);
                    $rs5x=Db::name('tan')->field($vbbb)->where($w1)->select();
                    $rs5=$rs5x[0];
                    $rs2x=Db::name('tan')->field($vbbb)->where(['kithe'=>$kithe,'class1'=>'特码','class3'=>'绿波','username'=>$row['kauser']])->select();
                    $rs2=$rs2x[0];

                    if ($rs5['sum_money']!=""){$sum_money=$rs5['sum_money'];}else{$sum_money=0;}
                    if ($rs5['re']!=""){
                        if ($rs5['sum_ds']!=""){$sum_ds=$rs5['sum_ds'];}else{$sum_ds=0;}
                        if ($rs5['sum_m3']!=""){$sum_m3=$rs5['sum_m3'];}else{$sum_m3=0;}
                        if ($rs5['sum_m4']!=""){$sum_m4=$rs5['sum_m4'];}else{$sum_m4=0;}
                        if ($rs5['sum_m5']!=""){$sum_m5=$rs5['sum_m5'];}else{$sum_m5=0;}
                        if ($rs5['sum_ds1']!=""){$sum_ds1=$rs5['sum_ds1'];}else{$sum_ds1=0;}
                        if ($rs2['sum_money']!=""){
                            $sum_money-=$rs2['sum_money']/16;
                            $sum_m4-=$rs2['sum_money']/16;
                            $sum_m3-=$rs2['sum_m5'];
                            $sum_m5-=$rs2['sum_m5'];
                            $sum_ds1-=$rs2['sum_ds'];
                        }
                        if ($tm==0){
                            $sum_money1[$i]=$sum_money1[$i]+$sum_money/16;
                        }else{
                            $sum_money1[$i]=$sum_money1[$i]+$sum_m4/16;
                        }

                        if ($tm==0){
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m5;
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds/16;
                        }else{
                            $sum_dsds[$i]=$sum_dsds[$i]+$sum_ds1/16;
                            $sum_zq[$i]=$sum_zq[$i]+$sum_m3;
                        }
                        $sum_zm[$i]=$sum_money1[$i]*$jifei/100;
                        $sum_zf[$i]=$sum_money1[$i]*(1-$jifei/100);
                    }
                }

            }
            //结束全部


            $sum_sum=0;
            $sum_sumds=0;
            $sum_zmzm=0;
            $sum_zmzm1=0;
            $sum_re=0;
            $sum_zfzf=0;
            $zm_num=input('zm_num') ? input('zm_num') : '';
            if ($zm_num!=""){
                for ($i=1;$i<=49;$i=$i+1){
                   if(isset($sum_zm[$i])){
                       if ($sum_zm[$i]>$zm_num){
                           $sum_zm[$i]=$zm_num;
                           $sum_zf[$i]=$sum_money1[$i]-$sum_zm[$i];
                       }
                   }
                }
            }
        }
        for ($i=1;$i<=49;$i=$i+1){
            $sum_sum=$sum_sum+$sum_money1[$i];
            $sum_sumds=$sum_sumds+$sum_dsds[$i];
            $sum_zmzm=$sum_zmzm+$sum_zm[$i];
        }
        for ($i=1;$i<=49;$i=$i+1){
            $sum_zf1[$i]=$sum_sum+$sum_sumds+$sum_zq[$i];
            if ($sum_zf1[$i]<0){
                $sum_re=$sum_re+1;
            }
            if ($tm2==0){
                $sum_zf[$i]=$sum_sum+$sum_sumds+$sum_zq[$i];
            }
        }
        $rake=42.5;
        $ds=13;

        $sum_zmzm2=0;
        //第二段
        if ($zf_num!="" and $rake!=""  and  $zm_num==""){
            $zf_num=$zf_num;
            $sum_zmzm=0;
            for ($i=1;$i<=49;$i=$i+1){
                if (((0-$sum_zf1[$i]-$zf_num)/$rake)>1){
                    $sum_zm[$i]=$sum_zm[$i]-intval(((0-$sum_zf1[$i])-intval($zf_num))/($sum_bl[$i]+4.5));
                    if ($tm2==0){
                    }else{
                        $sum_zf[$i]=$sum_money1[$i]-$sum_zm[$i];
                    }
                }
                $sum_zmzm1=$sum_zmzm1+$sum_zm[$i];
            }
            $sum_zmzm=$sum_zmzm1;


            $zm_num=intval(($sum_zmzm1+$zf_num)/($sum_bl[$i]+4.5));


            $sum_zmzm2=0;
            for ($i=1;$i<=49;$i=$i+1){

                if (($sum_money1[$i]-$zm_num)>1){

                    if ($tm2==1){

                        $sum_zf[$i]=$sum_zf[$i]+($sum_sum-$sum_zmzm1)/($rake-1.87);
                    }

                }
                $sum_zm[$i]=$sum_money1[$i]-$sum_zf[$i];
                $sum_zmzm2=$sum_zmzm2+$sum_zm[$i];

            }


        }
        $zm_num=intval(($sum_zmzm2+$zf_num)/($rake-1.87));


        if ($tm2==1){
            $sum_zmzm=$sum_zmzm2;
        }
        if (input('tm')!=""){$tm=input('tm');}else{
            if (input('tm')!=""){
                $tm=input('tm');
            }else{
                $tm=1;
            }
        }

        if (input('tm1')!=""){$tm1=input('tm1');}else{
            if (input('tm1')!=""){$tm1=input('tm1');}else{
                $tm1=1;
            }
        }

        if (input('tm2')!=""){$tm2=input('tm2');}else{
            if (input('tm2')!=""){$tm2=input('tm2');}else{
                $tm2=1;
            }
        }


        //表格内容
        //球号对应的颜色  $sum_color
        for ($I=1; $I<=49; $I=$I+1){
            $rskf =Db::table('m_color')->find($I);
            if ($rskf['color']=="r") {
                $sum_color[$I]="ff0000";
            }elseif ($rskf['color']=="b"){
                $sum_color[$I]="0000FF";
            }elseif ($rskf['color']=="g"){
                $sum_color[$I]="397100";
            }
        }

        //这部分数据没有错
        $sumzfzf=0;
        for($b=1;$b<=49;$b++){
            $sumzfzf+=$sum_zf[$i];      //又是这个$i  50 /49
        }

        for($b=1;$b<=49;$b++)
        {
            $i=1;
            for($i=1;$i<=48;$i++)
            {
                if ($sumzfzf!=0){
                    $bbs=$sum_zf[$i];
                    $bbs1=$sum_zf[$i+1];
                }else{
                    $bbs=$sum_money1[$i+1];
                    $bbs1=$sum_money1[$i];
                }
                if($bbs>$bbs1){
                    //不会进来
                    $tmp=$sum_tm1[$i+1];
                    $sum_tm1[$i+1]=$sum_tm1[$i];
                    $sum_tm1[$i]=$tmp;
                    $tmp=$sum_color[$i+1];
                    $sum_color[$i+1]=$sum_color[$i];
                    $sum_color[$i]=$tmp;
                    $tmp=$sum_zf[$i+1];
                    $sum_zf[$i+1]=$sum_zf[$i];
                    $sum_zf[$i]=$tmp;
                    $tmp=$sum_money1[$i+1];
                    $sum_money1[$i+1]=$sum_money1[$i];
                    $sum_money1[$i]=$tmp;
                    $tmp=$sum_zm[$i+1];
                    $sum_zm[$i+1]=$sum_zm[$i];
                    $sum_zm[$i]=$tmp;
                }
            }
        }
        $kitheAll=Db::name('kithe')->order(['nn'=>'desc'])->select();
        $bl=0;  //自定义设置
        return $this->fetch('',[
            'tm'=>$tm,      //占成  0全部 1成数
            'tm1'=>$tm1,
            'tm2'=>$tm2,
            'kitheAll'=>$kitheAll,
            'kithe'=>$kithe,
            'zm_num'=>$zm_num,
            'zf'=>$zf,
            'sum_bl'=>$sum_bl,      //所有球号赔率的数组
            'jifei'=>$jifei,
            'sum_color'=>$sum_color,
            'sum_tm1'=>$sum_tm1,
            'sum_money1'=>$sum_money1,
            'sum_zm'=>$sum_zm,
            'sum_zf'=>$sum_zf,
            'row'=>$row,
            'sum_re'=>$sum_re,
            'sum_zmzm'=>$sum_zmzm,
            'sum_sum'=>$sum_sum,
            'zf_num'=>$zf_num,
            'zm_num'=>$zm_num,
            'class1'=>'特码',
            'class2'=>$ids,
            'bl'=>$bl,
        ]);
    }


    //吃码占成 /风险值 修改
    public function saveCm(){
        $result=['code'=>1,'msg'=>''];
        if(!$this->request->isPost() || !input('id')){
            $result['msg']='请求参数不正确';
            return json([$result]);
        }
        $sess=session('lhc_users');
        $data=Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
        if($sess['vip'] == 1){
            $result['msg']='子账号不能设置';
            return json($result);
        }
        $upd=[];
        if(input('jifei')){
            $upd['jifei']=input('jifei');
        }
        if(input('zf_num')){
            $upd['tm']=input('zf_num');
        }
        $affected_row=Db::name('guan')->where(['id'=>$data['id']])->update($upd);
        if($affected_row){
            $result['code']=0;
            $result['msg']='设置成功';
            return json($result);
        }else{
            $result['msg']='设置失败';
            return json($result);
        }
    }

    //走飞修改
    public function updatePz(){
        $data=$this->request->param();
        return $this->fetch('',[
            'data'=>$data
        ]);
    }

    public function saveUpPz(){
        if(input('act')!='save' || !$this->request->isAjax())return json(['code'=>1,'msg'=>'非法访问']);
        $sess=session('lhc_users');
        $guan=Db::name('guan')->find($sess['id']);
        $rate=input('rate');
        $kithe=input('kithe');
        $R=5;
        $XF=11;
        if ($kithe==getKitheNum()){ //必须是当前最新盘才行
            if (getKithe(29)==0 or getKithe($XF)==0) {
                return json(['code'=>1,'msg'=>'封盘中...']);
            }
        }else{
            return json(['code'=>1,'msg'=>'封盘中...']);
        }
        if ($sess['vip']==1) {
            return json(['code'=>1,'msg'=>'对不起,子账号不能走飞!']);
        }
        if ($guan['pz']==1) {
            return json(['code'=>1,'msg'=>'对不起,你不能走飞!']);
        }
        if (!input('sum_m')) {
            return json(['code'=>1,'msg'=>'金额有误，请输入数字!']);
        }
        $text=date("Y-m-d H:i:s");
        $num=randStr();
//
//        if (input('class3')=="单"||input('class3')=="双") $R=2;
//        if (input('class3')=="大"||input('class3')=="小") $R=3;
//        if (input('class3')=="合单"||input('class3')=="合双") $R=4;
//        if (input('class3')=="红波"||input('class3')=="蓝波"||input('class3')=="绿波") $R=10;
//        if (input('class3')=="家禽"||input('class3')=="野兽") $R=24;
//        if (input('class3')=="尾大"||input('class3')=="尾小") $R=33;
//        if (input('class3')=="大单"||input('class3')=="小单") $R=34;
//        if (input('class3')=="大双"||input('class3')=="小双") $R=35;

        if ($guan['lx']==1){
            $username=$guan['kauser'];
            $user_ds=getQuotaField($R,'yg');
            $dai_ds=$user_ds;
            $zong_ds=$user_ds;
            $guan_ds=$user_ds;
            $dai_zc=0;
            $zong_zc=0;
            $guan_zc=0;
            $dagu_zc=10;
            $dai=$guan['kauser'];
            $zong=$guan['kauser'];
            $guan=$guan['kauser'];
        }
        if ($guan['lx']==2){
            $username=$guan['kauser'];
            $user_ds=getQuotaField($R,'yg',$guan['kauser']);
            $dai_ds=$user_ds;
            $zong_ds=$user_ds;
            $guan_ds=$user_ds;
            $dai_zc=0;
            $zong_zc=0;
            $guan_zc=$guan['sj']/10;
            $dagu_zc=10-$guan['sj']/10;
            $dai=$guan['kauser'];
            $zong=$guan['kauser'];
            $guan=$guan['guan'];
        }
        if ($_SESSION['lx']==3){
            $guanss1=$guan['guan'];
            $sf=Db::name('guan')->where(['kauser'=>$guanss1])->value('sj');
            $username=$guan['kauser'];
            $user_ds=getQuotaField($R,'yg',$guan['kauser']);
            $dai_ds=$user_ds;
            $zong_ds=$user_ds;
            $guan_ds=$user_ds;
            $dai_zc=0;
            $zong_zc=$guan['sj']/10;
            $guan_zc=10-$guan['sj']/10-($sf+$guan['sf'])/10;
            $dagu_zc=($sf+$guan['sf'])/10;

            if($sf==0){
                $guan_zc=10-$guan['sj']/10;
                $dagu_zc=0;
            }
            if($guan['sf']+$guan['sj']==100){
                $zong_zc=10;
                $guan_zc=0;
                $dagu_zc=0;
            }
            $dai=$guan['kauser'];
            $zong=$guan['zong'];
            $guan=$guan['guan'];
        }
//        if ($guan['lx']==2){ $vvvv=" and zong='".$_SESSION['kauser']."'  ";}
//        if ($guan['lx']==3){ $vvvv=" and dai='".$_SESSION['kauser']."'  ";}

        $arr=[
            'num'=>$num,
            'username'=>$username,
            'kithe'=>getKitheNum(),
            'adddate'=>$text,
            'class1'=>input('class1'),
            'class2'=>input('class2'),
            'class3'=>input('class3'),
            'rate'=>input('rate'),
            'sum_m'=>input('sum_m'),
            'user_ds'=>$user_ds,
            'dai_ds'=>$dai_ds,
            'zong_ds'=>$zong_ds,
            'guan_ds'=>$guan_ds,
            'dai_zc'=>$dai_zc,
            'zong_zc'=>$zong_zc,
            'guan_zc'=>$guan_zc,
            'dagu_zc'=>$dagu_zc,
            'bm'=>0,
            'dai'=>$dai,
            'zong'=>$zong,
            'guan'=>$guan,
            'abcd'=>'A',
            'lx'=>0
        ];
        $res=Db::name('tan')->insert();
        if($res){
            return json(['code'=>0,'补仓成功']);
        }else{
            return json(['code'=>1,'msg'=>'补仓失败']);
        }
    }




}