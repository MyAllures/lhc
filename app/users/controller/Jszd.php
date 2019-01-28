<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/22
 * Time: 17:13
 */
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
/*即时注单*/
class Jszd extends Common{
    public function index(){
        $sess=session('lhc_users');
        $row=Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
        $tm2=input('tm2') ? input('tm2') : 0;
        $tm1=input('tm1') ? input('tm1') : 0;
        $kithe=input('kithe') ? input('kithe') : getKitheNum();

        if($kithe != getKitheNum())$ftime=20000000;
        $ka_guanid=$row['id'];
        $ids="特A";
        $best=$row['best'];
        $zm=$row['zm'];
        $zm6=$row['zm6'];
        $lm=$row['lm'];
        $zt=$row['zt'];
        $tm=$row['tm'];     //风险预估值
        $sx=$row['sx'];
        $bb=$row['bb'];
        $gg=$row['gg'];
        $ws=$row['ws'];
        $xx=$row['xx'];
        $wx=$row['wx'];
        $pz=$row['pz'];
        if($row['lx']==4){
            $r1=Db::name('guan')->field('SUM(cs) As sum_m')->where(['lx'=>1,'guanid'=>$ka_guanid])->select();
        }
        if ($row['lx']==1){
            $r1=Db::name('guan')->field('SUM(cs) As sum_m')->where(['lx'=>2,'guanid'=>$ka_guanid])->select();
        }
        if ($row['lx']==2){
            $r1=Db::name('guan')->field('SUM(cs) As sum_m')->where(['lx'=>3,'zongid'=>$ka_guanid])->select();
        }
        if ($row['lx']==3){
            $r1=Db::name('mem')->field('SUM(cs) As sum_m')->where(['danid'=>$ka_guanid])->select();
        }
        $mumu=$r1[0]['sum_m'];
        $r1=Db::name('tan')->field('sum(sum_m) sum_m')->where(['kithe'=>getKitheNum(),'username'=>$row['kauser']])->select();
        $mkmk=$r1[0]['sum_m'];
        $sum_sumz=$row['cs']-$mumu-$mkmk;
        $R=0;
        $XF=11;

        /*第一个表格  start*/
        $z_re=0;
        $z_sum=0;
        $z_sumzc=0;
        $z_suma=0;
        $z_sumb=0;
        $z_ds=0;
        $z_xx=0;
        $z_pz=0;
        $res=Db::name('bl')->field('distinct(class1)')->where(['class1'=>['neq','花会']])->order('id asc')->select();
        foreach ($res as $k=>$v){
            if($row['lx']==4){
                $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*guan1_zc/10) as sum_mzc,count(*) as re')->where(['kithe'=>$kithe,'lx'=>0,'guan1'=>$row['kauser'],'class1'=>$v['class1']])->select();
            }
            if($row['lx']==1){
                $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*guan_zc/10) as sum_mzc,count(*) as re')->where(['kithe'=>$kithe,'lx'=>0,'guan'=>$row['kauser'],'class1'=>$v['class1']])->select();
            }
            if($row['lx']==2){
                $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*zong_zc/10) as sum_mzc,count(*) as re')->where(['kithe'=>$kithe,'lx'=>0,'zong'=>$row['kauser'],'class1'=>$v['class1']])->select();
            }
            if($row['lx']==3){
                $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*dai_zc/10) as sum_mzc,count(*) as re')->where(['kithe'=>$kithe,'lx'=>0,'dai'=>$row['kauser'],'class1'=>$v['class1']])->select();
            }
            $Rs5=$r1[0];
            $sum_tm[$k]=$v['class1'];
            $sum_re[$k]=$Rs5['re'];
            if ($Rs5['sum_m'])
                $sum_m[$k] = $Rs5['sum_m'];
            else $sum_m[$k] =0;
            if ($Rs5['sum_mzc'])
                $sum_mzc[$k] = $Rs5['sum_mzc'];
            else
                    $sum_mzc[$k] =0;
            $z_re+=$Rs5['re'];
            $z_sum+=$Rs5['sum_m'];
            $z_sumzc+=$Rs5['sum_mzc'];
        }
        if ($row['lx']==4){
            $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*guan1_zc/10) as sum_mzc,count(*) as re')->where(['kithe'=>$kithe,'lx'=>0,'guan1'=>$row['kauser'],'class1'=>'过关'])->select();
        }
        if ($row['lx']==1){
            $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*guan_zc/10) as sum_mzc,count(*) as re')->where(['kithe'=>$kithe,'lx'=>0,'guan'=>$row['kauser'],'class1'=>'过关'])->select();
        }
        if ($row['lx']==2){
            $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*zong_zc/10) as sum_mzc,count(*) as re')->where(['kithe'=>$kithe,'lx'=>0,'zong'=>$row['kauser'],'class1'=>'过关'])->select();
        }
        if ($row['lx']==3){
            $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*dai_zc/10) as sum_mzc,count(*) as re')->where(['kithe'=>$kithe,'lx'=>0,'dai'=>$row['kauser'],'class1'=>'过关'])->select();
        }
        $ii=count($res)-1;
        $Rs6=$r1[0];
        $sum_tm[$ii]="过关";
        $sum_re[$ii]=$Rs6['re'];
        if ($Rs6['sum_m']){
            $sum_m[$ii] = $Rs6['sum_m'];
        }else{
            $sum_m[$ii] =0;
        }
        if ($Rs5['sum_mzc']!=""){
            $sum_mzc[$ii] = $Rs5['sum_mzc'];
        }else{
            $sum_mzc[$ii] =0;
        }
        $z_re+=$Rs6['re'];
        $z_sum+=$Rs6['sum_m'];
        $z_sumzc+=$Rs5['sum_mzc'];
        $ii++;
        $b=0;
        $fg=0;
        $i=0;
        $i=0;
        /*第一个表格  end*/


        $kitheAll=Db::name('kithe')->order(['nn'=>'desc'])->select();
        return $this->fetch('',[
            'ids'=>$ids,
            'kithe'=>$kithe,
            'kitheAll'=>$kitheAll,
            'tm2'=>$tm2,
            'tm'=>$tm,
            'tm1'=>$tm1,
            'sum_m'=>$sum_m,
            'z_sum'=>$z_sum,
            'sum_mzc'=>$sum_mzc,
            'z_sumzc'=>$z_sumzc,
        ]);

    }

    //
    public function server_tm(){
        header('Content-type:text/html;charset=utf-8');
        $sess=session('lhc_users');
        $row=Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
        $best=$row['best'];
        $zm=$row['zm'];
        $zm6=$row['zm6'];
        $lm=$row['lm'];
        $zt=$row['zt'];
        $tm=$row['tm'];
        $tm1=10;
        $sx=$row['sx'];
        $bb=$row['bb'];
        $gg=$row['gg'];
        $ws=$row['ws'];
        $xx=$row['xx'];
        $wx=$row['wx'];
        $pz=$row['pz'];
        $ztm_tm=$tm;
        $class1=input('class1');
        $class2=input('class2');
        $kithe=input('kithe') ? input('kithe') : getKitheNum();
        $z_re=0;
        $z_sum=0;
        $z_sumzc=0;
        $z_sumds2=0;
        $z_suma=0;
        $z_sumb=0;
        $z_ds=0;
        $z_xx=0;
        $z_pz=0;
        $z7_sum=0;
        $z7_ds=0;
        $z_re1=0;
        $z_sum1=0;
        $z_suma1=0;
        $z_sumb1=0;
        $z_ds1=0;
        $z_xx1=0;
        $z_pz1=0;
        $z7_sum1=0;
        $z7_ds1=0;

        if ($row['lx']==4){ $vvvv=['guan1'=>$row['kauser']] ; }
        if ($row['lx']==1){ $vvvv=['guan'=>$row['kauser']] ; }
        if ($row['lx']==2){ $vvvv=['zong'=>$row['kauser']] ;}
        if ($row['lx']==3){ $vvvv=['dai'=>$row['kauser']] ;}


        $bbbb="count(*) as re,SUM(sum_m) As sum_money";
        $tm2=input('tm2');
        for ($i=1;$i<=49;$i=$i+1){
            $sum_tm1[$i]=$i;
        }

        $result=Db::name('bl')->field('class3,class1,class2')->where(['class1'=>$class1,'class2'=>'特A'])->select();

        $ii=0;
        foreach ($result as $v){
            if ($ii<49){
                $tem_index=intval($v['class3']);
//                $my_money=$sum_money1[$tem_index];  //?没什么必要
            }else{
                $my_money=0;
            }
            $my_money=0;
            if ($row['lx']==4){
                //SELECT sum(sum_m+0) as sum_m,sum(sum_m*guan1_zc/10) as sum_mzc,count(*) as re,sum((sum_m+0)*(guan1_ds)/100)*guan1_zc/10 as sum_ds,sum(0-(sum_m+0)*rate*guan1_zc/10) as sum_m3 FROM `ka_tan` WHERE `guan1` = '大股东' AND `kithe` = '2019013' AND `username` <> '大股东' AND `class1` = '特码' AND `class3` = '1'
                $field1="sum(sum_m+".$my_money.") as sum_m,sum(sum_m*guan1_zc/10) as sum_mzc,count(*) as re,sum((sum_m+".$my_money.")*(guan1_ds)/100)*guan1_zc/10 as sum_ds,sum(0-(sum_m+".$my_money.")*rate*guan1_zc/10) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>['neq',$row['kauser']],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs5=$r[0];

                //SELECT sum((sum_m+0)*rate) as sum_money,count(*) as re,sum((sum_m+0)*(user_ds/100)) as sum_ds,sum(sum_m+0) as sum_m3 FROM `ka_tan` WHERE `guan1` = '大股东' AND `kithe` = '2019013' AND `username` = '大股东' AND `class1` = '特码' AND `class3` = '1'
                $field1="sum((sum_m+".$my_money.")*rate) as sum_money,count(*) as re,sum((sum_m+".$my_money.")*(user_ds/100)) as sum_ds,sum(sum_m+".$my_money.") as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>$row['kauser'],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs7=$r[0];


                $field1="sum((sum_m+".$my_money.")*guan1_zc/10) as sum_moneya";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsA=$r[0];

                $field1="sum((sum_m+".$my_money.")*guan1_zc/10) as sum_moneyb";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class2'=>'特1B','class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsB=$r[0];

            }
            if ($row['lx']==1){
                $field1="sum(sum_m+".$my_money.") as sum_m,sum(sum_m*guan_zc/10) as sum_mzc,count(*) as re,sum((sum_m+".$my_money.")*(guan_ds)/100)*guan_zc/10 as sum_ds,sum(0-(sum_m+".$my_money.")*rate*guan_zc/10) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>['neq',$row['kauser']],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs5=$r[0];

                $field1="sum((sum_m+".$my_money.")*rate) as sum_money,count(*) as re,sum((sum_m+".$my_money.")*(user_ds/100)) as sum_ds,sum(sum_m+".$my_money.") as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>$row['kauser'],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs7=$r[0];

                $field1="sum((sum_m+".$my_money.")*guan_zc/10) as sum_moneya";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsA=$r[0];

                $field1="sum((sum_m+".$my_money.")*guan_zc/10) as sum_moneyb";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class2'=>'特1B','class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsB=$r[0];

            }
            if ($row['lx']==2){
                $field1="sum(sum_m+".$my_money.") as sum_m,sum(sum_m*zong_zc/10) as sum_mzc,count(*) as re,sum((sum_m+".$my_money.")*(zong_ds)/100)*zong_zc/10 as sum_ds,sum(0-(sum_m+".$my_money.")*rate*zong_zc/10) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>['neq',$row['kauser']],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs5=$r[0];

                $field1="sum((sum_m+".$my_money.")*rate) as sum_money,count(*) as re,sum((sum_m+".$my_money.")*(user_ds/100)) as sum_ds,sum(sum_m+".$my_money.") as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>$row['kauser'],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs7=$r[0];

                $field1="sum((sum_m+".$my_money.")*zong_zc/10) as sum_moneya";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsA=$r[0];

                $field1="sum((sum_m+".$my_money.")*zong_zc/10) as sum_moneyb";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class2'=>'特1B','class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsB=$r[0];

            }
            if ($row['lx']==3){
                $field1="sum(sum_m+".$my_money.") as sum_m,sum(sum_m*dai_zc/10) as sum_mzc,count(*) as re,sum((sum_m+".$my_money.")*(dai_ds)/100)*dai_zc/10 as sum_ds,sum(0-(sum_m+".$my_money.")*rate*dai_zc/10) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>['neq',$row['kauser']],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs5=$r[0];

                $field1="sum((sum_m+".$my_money.")*rate) as sum_money,count(*) as re,sum((sum_m+".$my_money.")*(user_ds/100)) as sum_ds,sum(sum_m+".$my_money.") as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>$row['kauser'],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs7=$r[0];

                $field1="sum((sum_m+".$my_money.")*dai_zc/10) as sum_moneya";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsA=$r[0];

                $field1="sum((sum_m+".$my_money.")*dai_zc/10) as sum_moneyb";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class2'=>'特1B','class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsB=$r[0];
            }

            //自定义数据处理
            foreach ($Rs5 as $k1=>$v1){
                if(!$v)$Rs5[$k1]=0;
            }
            foreach ($Rs7 as $k1=>$v1){
                if(!$v)$Rs7[$k1]=0;
            }
            foreach ($RsA as $k1=>$v1){
                if(!$v)$RsA[$k1]=0;
            }
            foreach ($RsB as $k1=>$v1){
                if(!$v)$RsB[$k1]=0;
            }

            $Rsbl = Db::name('bl')->where(['class1'=>$v['class1'],'class2'=>'特A','class3'=>$v['class3']])->find();
            if($Rs5['sum_m']!=""){$my_sum_m_5=$Rs5['sum_m'];}else{$my_sum_m_5=$my_money;}
            $my_re_5=$Rs5['re'];
            $my_sum_ds_5=$Rs5['sum_ds'];
            $my_sum_m3_5=$Rs5['sum_m3'];
            $my_sum_m_7=$Rs7['sum_money'];
            $my_re_7=$Rs7['re'];
            $my_sum_ds_7=$Rs7['sum_ds'];
            $my_sum_m3_7=$Rs7['sum_m3'];
            $my_sum_moneya=$RsA['sum_moneya'];
            $my_sum_moneyb=$RsB['sum_moneyb'];
            $my_rate=$Rsbl['rate'];


            //一条记录用"###"隔开.每列数据用"@@@"隔开. 这是以只有两个列数据的情况.

            if ($ii<49){
                $rskf = Db::table('m_color')->find($v['class3']);
                if ($rskf['color']=="r") {
                    $sum_color[$ii]="ff0000";
                }else if ($rskf['color']=="b"){
                    $sum_color[$ii]="0000FF";
                }else if ($rskf['color']=="g"){
                    $sum_color[$ii]="008800";
                }
            }else{
                $sum_color[$ii]="ff0000";
            }

            $sum_tm[$ii]=$v['class3'];
            $sum_re[$ii]=$my_re_5;
            if ($my_sum_m_5!=""){
                $sum_m[$ii] = $my_sum_m_5;
            }else{
                $sum_m[$ii] =0;
            }

            if ($my_sum_moneya!=""){$sum_ma[$ii] =$my_sum_moneya;}else{$sum_ma[$ii] =0;}
            if ($my_sum_moneyb!=""){$sum_mb[$ii] =$my_sum_moneyb;}else{$sum_mb[$ii] =0;}
            $sum_ds[$ii]=$my_sum_ds_5;
            $sum_xx[$ii]=$my_sum_m3_5;
            $sum_xx_7[$ii]=$my_sum_m3_7;
            if ($my_rate!=""){
                $sum_bl[$ii]=$my_rate;
            }else{
                $sum_bl[$ii]=0;
            }
            if ($ii<49){
                $z_re+=$my_re_5;
                $z_sum+=$my_sum_m_5;
                $z_sumzc+=$Rs5['sum_mzc'];
                $z_sumds2+=$Rs5['sum_ds'];
                $z7_ds+=$my_sum_ds_7;
                $z_suma+=$my_sum_moneya;
                $z_sumb+=$my_sum_moneyb;
                $z_ds+=$my_sum_ds_5;
                $z_xx+=$my_sum_m3_5;
                $z_pz+=$my_sum_m3_7;
            }else{
                $z_re1+=$my_re_5;
                $z_sum1+=$my_sum_m_5;
                $z7_ds1+=$my_sum_ds_7;
                $z_suma1+=$my_sum_moneya;
                $z_sumb1+=$my_sum_moneyb;
                $z_ds1+=$my_sum_ds_5;
                $z_xx1+=$my_sum_m3_5;
                $z_pz1+=$my_sum_m3_7;
            }
            $sum_sx1[$ii]=$my_sum_m_7;
            if ($my_sum_m3_7!=""){$sum_pz1[$ii]=$my_sum_m3_7;
            }else{
                $sum_pz1[$ii]=0;
            }
            $ii++;
        }

        for($i=0;$i<66;$i++)
        {
            if ($i<49){
                $sum_sx[$i]=$sum_xx[$i]+$z_sumzc-$z_ds+$sum_pz1[$i]*$sum_bl[$i];
                $sum_ma[$i]=$sum_ma[$i]-$sum_pz1[$i];
            }else{
                if($sum_tm[$i]=="单"||$sum_tm[$i]=="双"){
                    $sum_sx[$i]=(($sum_ma[49]+$sum_ma[50])-($sum_xx_7[49]+$sum_xx_7[50]))*0.97-($sum_ma[$i]-$sum_pz1[$i])*$sum_bl[$i];
                }elseif($sum_tm[$i]=="大"||$sum_tm[$i]=="小"){
                    $sum_sx[$i]=(($sum_ma[51]+$sum_ma[52])-($sum_xx_7[51]+$sum_xx_7[52]))*0.97-($sum_ma[$i]-$sum_pz1[$i])*$sum_bl[$i];
                }elseif($sum_tm[$i]=="合单"||$sum_tm[$i]=="合双"){
                    $sum_sx[$i]=(($sum_ma[53]+$sum_ma[54])-($sum_xx_7[53]+$sum_xx_7[54]))*0.97-($sum_ma[$i]-$sum_pz1[$i])*$sum_bl[$i];
                }elseif($sum_tm[$i]=="红波"||$sum_tm[$i]=="绿波"||$sum_tm[$i]=="蓝波"){
                    $sum_sx[$i]=(($sum_ma[55]+$sum_ma[56]+$sum_ma[57])-($sum_xx_7[55]+$sum_xx_7[56]+$sum_xx_7[57]))*0.97-($sum_ma[$i]-$sum_pz1[$i])*$sum_bl[$i];
                }elseif($sum_tm[$i]=="家禽"||$sum_tm[$i]=="野兽"){
                    $sum_sx[$i]=(($sum_ma[58]+$sum_ma[59])-($sum_xx_7[58]+$sum_xx_7[59]))*0.97-($sum_ma[$i]-$sum_pz1[$i])*$sum_bl[$i];
                }elseif($sum_tm[$i]=="尾大"||$sum_tm[$i]=="尾小"){
                    $sum_sx[$i]=(($sum_ma[60]+$sum_ma[61])-($sum_xx_7[60]+$sum_xx_7[61]))*0.97-($sum_ma[$i]-$sum_pz1[$i])*$sum_bl[$i];
                }elseif($sum_tm[$i]=="大单"||$sum_tm[$i]=="小单"||$sum_tm[$i]=="大双"||$sum_tm[$i]=="小双"){
                    $sum_sx[$i]=(($sum_ma[62]+$sum_ma[63]+$sum_ma[64]+$sum_ma[65])-($sum_xx_7[62]+$sum_xx_7[63]+$sum_xx_7[64]+$sum_xx_7[65]))*0.97-($sum_ma[$i]-$sum_pz1[$i])*$sum_bl[$i];
                }
            }
        }
        if($tm2==1){
            for($i=0;$i<48;$i++){
//单双
                if ($i%2==0){
                    $sum_m[$i]+=$sum_m[49]/25;
                    $sum_ma[$i]+=$sum_ma[49]/25;
                    $sum_sx[$i]+=$sum_ma[50]*0.97-$sum_ma[49]*0.96;
                    $sum_re[$i]+=$sum_re[49];
                }else{
                    $sum_m[$i]+=$sum_m[50]/25;
                    $sum_ma[$i]+=$sum_ma[50]/25;
                    $sum_sx[$i]+=$sum_ma[49]*0.97-$sum_ma[50]*0.96;
                    $sum_re[$i]+=$sum_re[50];
                }
//大小
                if ($i>=24){
                    $sum_m[$i]+=$sum_m[51]/25;
                    $sum_ma[$i]+=$sum_ma[51]/25;
                    $sum_sx[$i]+=$sum_ma[52]*0.97-$sum_ma[51]*0.96;
                    $sum_re[$i]+=$sum_re[51];
                }else{
                    $sum_m[$i]+=$sum_m[52]/25;
                    $sum_ma[$i]+=$sum_ma[52]/25;
                    $sum_sx[$i]+=$sum_ma[51]*0.97-$sum_ma[52]*0.96;
                    $sum_re[$i]+=$sum_re[52];
                }
//合单合双
                if (((($i+1)%10)+intval(($i+1)/10))%2==1){
                    $sum_m[$i]+=$sum_m[53]/25;
                    $sum_ma[$i]+=$sum_ma[53]/25;
                    $sum_sx[$i]+=$sum_ma[54]*0.97-$sum_ma[53]*0.96;
                    $sum_re[$i]+=$sum_re[53];
                }else{
                    $sum_m[$i]+=$sum_m[54]/25;
                    $sum_ma[$i]+=$sum_ma[54]/25;
                    $sum_sx[$i]+=$sum_ma[53]*0.97-$sum_ma[54]*0.96;
                    $sum_re[$i]+=$sum_re[54];
                }
//尾大尾小
                if (($i+1)%10<5){
                    $sum_m[$i]+=$sum_m[61]/25;
                    $sum_ma[$i]+=$sum_ma[61]/25;
                    $sum_sx[$i]+=$sum_ma[60]*0.97-$sum_ma[61]*0.96;
                    $sum_re[$i]+=$sum_re[61];
                }else{
                    $sum_m[$i]+=$sum_m[60]/25;
                    $sum_ma[$i]+=$sum_ma[60]/25;
                    $sum_sx[$i]+=$sum_ma[61]*0.97-$sum_ma[60]*0.96;
                    $sum_re[$i]+=$sum_re[60];
                }


//大单
                if ($i%2==0&&$i>=24){
                    $sum_m[$i]+=$sum_m[62]/12;
                    $sum_ma[$i]+=$sum_ma[62]/12;
                    $sum_sx[$i]+=$sum_ma[63]*0.97-$sum_ma[62]*2.53;
                    $sum_re[$i]+=$sum_re[62];
                }
//小单
                if ($i%2==0&&$i<24){
                    $sum_m[$i]+=$sum_m[63]/13;
                    $sum_ma[$i]+=$sum_ma[63]/13;
                    $sum_sx[$i]+=$sum_ma[62]*0.97-$sum_ma[63]*2.53;
                    $sum_re[$i]+=$sum_re[63];
                }
//大双
                if ($i%2==1&&$i>24){
                    $sum_m[$i]+=$sum_m[64]/13;
                    $sum_ma[$i]+=$sum_ma[64]/13;
                    $sum_sx[$i]+=$sum_ma[65]*0.97-$sum_ma[64]*2.53;
                    $sum_re[$i]+=$sum_re[65];
                }
//小双
                if ($i%2==1&&$i<24){
                    $sum_m[$i]+=$sum_m[65]/13;
                    $sum_ma[$i]+=$sum_ma[65]/13;
                    $sum_sx[$i]+=$sum_ma[64]*0.97-$sum_ma[65]*2.53;
                    $sum_re[$i]+=$sum_re[64];
                }

//红波
                if (getColor($i+1)=="红波"){
                    $sum_m[$i]+=$sum_m[55]/17;
                    $sum_ma[$i]+=$sum_ma[55]/17;
                    $sum_sx[$i]+=($sum_ma[56]+$sum_ma[57])*0.97-$sum_ma[55]*1.78;
                    $sum_re[$i]+=$sum_re[55];
                }

//绿波
                if (getColor($i+1)=="绿波"){
                    $sum_m[$i]+=$sum_m[56]/16;
                    $sum_ma[$i]+=$sum_ma[56]/16;
                    $sum_sx[$i]+=($sum_ma[55]+$sum_ma[57])*0.97-$sum_ma[56]*1.68;
                    $sum_re[$i]+=$sum_re[56];
                }

//蓝波
                if (getColor($i+1)=="蓝波"){
                    $sum_m[$i]+=$sum_m[57]/16;
                    $sum_ma[$i]+=$sum_ma[57]/16;
                    $sum_sx[$i]+=($sum_ma[55]+$sum_ma[56])*0.97-$sum_ma[57]*1.68;
                    $sum_re[$i]+=$sum_re[57];
                }
            }
        }

        $b=0;
        for($b=0;$b<66;$b++)
        {
            $i=0;
            for($i=0;$i<48;$i++)
            {
                if ($sum_sx[$i]!=0){
                    $bbs=$sum_sx[$i];
                    $bbs1=$sum_sx[$i+1];
                }else{
                    $bbs=$sum_m[$i+1];
                    $bbs1=$sum_m[$i];
                }
                if($bbs>$bbs1){

                    $tmp=$sum_tm[$i+1];
                    $sum_tm[$i+1]=$sum_tm[$i];
                    $sum_tm[$i]=$tmp;

                    $tmp=$sum_m[$i+1];
                    $sum_m[$i+1]=$sum_m[$i];
                    $sum_m[$i]=$tmp;

                    $tmp=$sum_re[$i+1];
                    $sum_re[$i+1]=$sum_re[$i];
                    $sum_re[$i]=$tmp;

                    $tmp=$sum_ma[$i+1];
                    $sum_ma[$i+1]=$sum_ma[$i];
                    $sum_ma[$i]=$tmp;

                    $tmp=$sum_mb[$i+1];
                    $sum_mb[$i+1]=$sum_mb[$i];
                    $sum_mb[$i]=$tmp;

                    $tmp=$sum_ds[$i+1];
                    $sum_ds[$i+1]=$sum_ds[$i];
                    $sum_ds[$i]=$tmp;

                    $tmp=$sum_xx[$i+1];
                    $sum_xx[$i+1]=$sum_xx[$i];
                    $sum_xx[$i]=$tmp;

                    $tmp=$sum_bl[$i+1];
                    $sum_bl[$i+1]=$sum_bl[$i];
                    $sum_bl[$i]=$tmp;

                    $tmp=$sum_sx[$i+1];
                    $sum_sx[$i+1]=$sum_sx[$i];
                    $sum_sx[$i]=$tmp;

                    $tmp=$sum_pz1[$i+1];
                    $sum_pz1[$i+1]=$sum_pz1[$i];
                    $sum_pz1[$i]=$tmp;


                    $tmp=$sum_color[$i+1];
                    $sum_color[$i+1]=$sum_color[$i];
                    $sum_color[$i]=$tmp;
                }
            }
        }
        $fg=0;
        $i=0;

        //$sum_sx
        for($i=0;$i<66;$i++)
        {
            if(($sum_sx[$i]+$ztm_tm)>=0 || $sum_bl[$i]==0 ){
                $ffxx=0;}else{
                if ($i<49){
                    $ffxx=(((0-$sum_sx[$i]-$ztm_tm))/($sum_bl[$i]+$tm1/100-1));
                }else{
                    if($sum_tm[$i]=="单"||$sum_tm[$i]=="双"){
                        $ffxx=(((($sum_xx_7[49]+$sum_xx_7[50])-$sum_sx[$i])-$ztm_tm)/($sum_bl[$i]+3/100-1));
                    }elseif($sum_tm[$i]=="大"||$sum_tm[$i]=="小"){
                        $ffxx=(((($sum_xx_7[51]+$sum_xx_7[52])-$sum_sx[$i])-$ztm_tm)/($sum_bl[$i]+3/100-1));
                    }elseif($sum_tm[$i]=="合单"||$sum_tm[$i]=="合双"){
                        $ffxx=(((($sum_xx_7[53]+$sum_xx_7[54])-$sum_sx[$i])-$ztm_tm)/($sum_bl[$i]+3/100-1));
                    }elseif($sum_tm[$i]=="红波"||$sum_tm[$i]=="绿波"||$sum_tm[$i]=="蓝波"){
                        $ffxx=(((($sum_xx_7[55]+$sum_xx_7[56]+$sum_xx_7[57])-$sum_sx[$i])-$ztm_tm)/($sum_bl[$i]+3/100-1));
                    }elseif($sum_tm[$i]=="家禽"||$sum_tm[$i]=="野兽"){
                        $ffxx=(((($sum_xx_7[58]+$sum_xx_7[59])-$sum_sx[$i])-$ztm_tm)/($sum_bl[$i]+3/100-1));
                    }elseif($sum_tm[$i]=="尾大"||$sum_tm[$i]=="尾小"){
                        $ffxx=(((($sum_xx_7[60]+$sum_xx_7[61])-$sum_sx[$i])-$ztm_tm)/($sum_bl[$i]+3/100-1));
                    }elseif($sum_tm[$i]=="大单"||$sum_tm[$i]=="小单"||$sum_tm[$i]=="大双"||$sum_tm[$i]=="小双"){
                        $ffxx=(((($sum_xx_7[62]+$sum_xx_7[63]+$sum_xx_7[64]+$sum_xx_7[65])-$sum_sx[$i])-$ztm_tm)/($sum_bl[$i]+3/100-1));
                    }
                }
            }

            $bl=round($ffxx,0);//intval($ffxx);
            if($ffxx>=1){
                $fg=$fg+1;
                $bl=empty($bl) ? $bl : 0;
                if ($i==0){
                    $sum_pz[0]="<button onclick=show_win('".$sum_tm[0]."','".$bl."','".$sum_bl[0]."','".$class1."','".$class2."','".$kithe."')    ><span style='color:#ff6600;'>走飞</span>  ".$bl."</button>";
                }else{
                    $sum_pz[$i]="<button  onclick=show_win('".$sum_tm[$i]."','".$bl."','".$sum_bl[$i]."','".$class1."','".$class2."','".$kithe."')    ><span style='color:#ff6600;'>走飞</span>  ".$bl."</button>";}
            }else{
                $sum_pz[$i]="&nbsp;";
            }
        }

        $i=0;
        $blbl='';


        $arr=[];
        for($i=0;$i<$ii;$i++)
        {
            $arr[$i]=[
                $sum_tm[$i],
                $sum_re[$i],
                round($sum_m[$i],0),
                round($sum_ma[$i],0),
                $sum_mb[$i],
                round($sum_ds[$i],0),
                round($sum_xx[$i],0),
                round($sum_sx[$i],0),
                $sum_pz[$i],
                $sum_pz1[$i],
                $sum_bl[$i],
                $fg,
                $sum_tm[$i],
                $sum_color[$i]
            ];
        }
        $z_suma=$z_suma-$z_pz;
        $arr[$ii]=[0,$z_re,$z_sum,$z_suma,$z_sumb,$z_ds,$z_xx,'','',$z_pz,$ztm_tm,$fg];
        return json($arr);
    }

    public function savePz(){
        $result=['code'=>1,'msg'=>''];
        if(!input('?act') || input('act')!='zsave'){
            $result['msg']='请求参数不正确';
            return json([$result]);
        }
        if(!input('?tm') || !input('tm')){ //存在但为空
            $result['msg']='预估风险值不能为空';
            return json($result);
        }
        $sess=session('lhc_users');
        $res=Db::name('guan')->where(['kauser'=>$sess['kauser']])->update(['tm'=>input('tm')]);
        if($res){
            $result['code']=0;
            $result['msg']='计算成功';
            return json($result);
        }else{
            $result['msg']='计算失败';
            return json($result);
        }
    }

    //下注明细
    public function look(){
        $sess=session('lhc_users');
        $data=Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
        $kithe=input('kithe') ? input('kithe') :getKitheNum();
        $bb=input('id');
        $class2=input('class2') ? input('class2') : '';
        switch ($bb)
        {
            case 1:
                $class1="特码";
                break;
            case 2:
                $class1="正特";
                $class2=input('class2');
                break;
            case 3:
                $class1="正码";
                break;
            case 31:
                $class1="正1-6";
                break;
            case 4:
                $class1="五行";
                $class2=input('class2');
                break;
            case 5:
                $class1="生肖";
                $class2=input('class2');
                break;
            case 6:
                $class1="半波";
                $class2=input('class2');
                break;
            case 61:
                $class1="半半波";
                $class2=input('class2');
                break;
            case 611:
                $class1="七色波";
                $class2=input('class2');
                break;
            case 6111:
                $class1="正肖";
                $class2=input('class2');
                break;
            case 71:
                $class1="头数";
                $class2=input('class2');
                break;
            case 7:
                $class1="尾数";
                $class2=input('class2');
                break;
            case 72:
                $class1="正特尾数";
                $class2=input('class2');
                break;
            case 8:
                $class1="连码";
                $class2=input('class2');
                break;
            case 9:
                $class1="过关";
                $class2=input('class2');
                break;
            case 10:
                $class1=input('class1');
                $class2=input('class2');
                break;
            case 11:
                $class1="生肖连";
                $class2=input('class2');
                break;
            case 12:
                $class1="不中";
                $class2=input('class2');
                break;
            case 13:
                $class1="中一";
                $class2=input('class2');
                break;
            case 14:
                $class1="尾数连";
                $class2=input('class2');
                break;
            default:
                $class1="特码";
                break;
        }
        $class3=input('class3') ? input('class3') : '';

        $where=[];
        if($data['lx']==4){
            $where['guan1']=$data['kauser'];
        }
        if($data['lx']==1){
            $where['guan']=$data['kauser'];
        }
        if($data['lx']==2){
            $where['zong']=$data['kauser'];
        }
        if($data['lx']==3){
            $where['dai']=$data['kauser'];
        }

        if(input('lx') && input('lx')==1){
            $where['username']=$data['kauser'];
        }else{
            $where['username']=['neq',$data['kauser']];
        }
        if ($class1=="特码" or $class1=="正码" ){
            $w=array_merge($where,['kithe'=>$kithe,'class1'=>$class1,'class3'=>$class3]);
            $result=Db::name('tan')->where($w)->order(['id'=>'desc'])->paginate(30);
        }else {
            if($class2){
                $w=array_merge($where,['kithe'=>$kithe,'class2'=>$class2,'class1'=>$class1,'class3'=>$class3]);
            }else{
                $w=array_merge($where,['kithe'=>$kithe,'class1'=>$class1,'class3'=>$class3]);
            }
            $result=Db::name('tan')->where($w)->order(['id'=>'desc'])->paginate(30);
        }

        $sum_m=0;
        $user_ds=0;
        $res=$result->all();

        foreach ($res as $k=>$v){
            $sum_m+=$v['sum_m'];
            $user_ds+=($v['sum_m']*$v['user_ds']/100);
        }
        return $this->fetch('',[
            'class1'=>$class1,
            'class3'=>$class3,
            'data'=>$data,
            'res'=>$res,
            'page'=>$result->render(),
            'sum_m'=>$sum_m,
            'user_ds'=>$user_ds,
        ]);
    }

    //走飞修改
    public function updatePz(){
        $data=$this->request->param();
        return $this->fetch('',[
            'data'=>$data
        ]);
    }
    //保存走飞
    public function saveUpPz(){
        if(input('act')!='save' || !$this->request->isAjax())return json(['code'=>1,'msg'=>'非法访问']);
        $sess=session('lhc_users');
        $mem=Db::name('guan')->find($sess['id']);
        $rate=input('rate');
        $kithe=input('kithe') ? input('kithe') : getKitheNum();

        $R=5;
        $XF=13;
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
        if ($mem['pz']==1) {
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
        if ($mem['lx']==4){
            $username=$mem['kauser'];
            $user_ds=getQuotaField($R,'yg','guan1');
            $dai_ds=$user_ds;
            $zong_ds=$user_ds;
            $guan_ds=$user_ds;
            $dai_zc=0;
            $zong_zc=0;
            $guan_zc=0;
            $dai=$mem['kauser'];
            $zong=$mem['kauser'];
            $guan=$mem['kauser'];

            $guan1=$mem['kauser'];
            $guan1_ds=$user_ds;
            $guan1_zc=0;
            $dagu_zc=10;
        }

        if ($mem['lx']==1){
            $username=$mem['kauser'];
            $user_ds=getQuotaField($R,'yg');
            $dai_ds=$user_ds;
            $zong_ds=$user_ds;
            $guan_ds=$user_ds;
            $dai_zc=0;
            $zong_zc=0;
            $guan_zc=0;
            $dagu_zc=10;
            $dai=$mem['kauser'];
            $zong=$mem['kauser'];
            $guan=$mem['kauser'];

            $guan1=$sess['kauser'];
            $guan1_ds=$user_ds;
            $guan1_zc=$mem['sj']/10;
            $dagu_zc=10-$mem['sj']/10;
        }
        if ($mem['lx']==2){
            $username=$mem['kauser'];
            $user_ds=getQuotaField($R,'yg',$mem['kauser']);
            $dai_ds=$user_ds;
            $zong_ds=$user_ds;
            $guan_ds=$user_ds;
            $dai_zc=0;
            $zong_zc=0;
            $guan_zc=$mem['sj']/10;
            $dagu_zc=10-$mem['sj']/10;
            $dai=$mem['kauser'];
            $zong=$mem['kauser'];
            $guan=$mem['guan'];

            $fa_zc=Db::name('guan')->where(['kauser'=>$mem['guan']])->value('sj');
            $guan1=$sess['kauser'];
            $guan1_ds=$user_ds;
            $guan1_zc=$fa_zc/10;
            $dagu_zc=10-$fa_zc/10-$mem['sj']/10;
        }
        if ($_SESSION['lx']==3){
            $guanss1=$mem['guan'];
            $sf=Db::name('guan')->where(['kauser'=>$guanss1])->value('sj');
            $username=$mem['kauser'];
            $user_ds=getQuotaField($R,'yg',$mem['kauser']);
            $dai_ds=$user_ds;
            $zong_ds=$user_ds;
            $guan_ds=$user_ds;
            $dai_zc=0;
            $zong_zc=$mem['sj']/10;

//            if($sf==0){
//                $guan_zc=10-$mem['sj']/10;
//                $dagu_zc=0;
//            }
//            if($mem['sf']+$mem['sj']==100){
//                $zong_zc=10;
//                $guan_zc=0;
//                $dagu_zc=0;
//            }
            $dai=$mem['kauser'];
            $zong=$mem['zong'];
            $guan=$mem['guan'];

            $gg=Db::name('guan')->where(['kauser'=>$mem['guan']])->field('sj,sf')->find();
            $guan_zc=$gg['sf']/10;
            $guan1=$mem['guan1'];
            $guan1_ds=$user_ds;
            $guan1_zc=$gg['sj']/10;
            $dagu_zc=10-$zong_zc-$guan_zc-$guan1_zc;
        }
//        if ($mem['lx']==2){ $vvvv=" and zong='".$_SESSION['kauser']."'  ";}
//        if ($mem['lx']==3){ $vvvv=" and dai='".$_SESSION['kauser']."'  ";}

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
            'lx'=>0,
            'guan1'=>$guan1,
            'guan1_zc'=>$guan1_zc,
            'guan1_ds'=>$guan1_ds
        ];
        $res=Db::name('tan')->insert($arr);
        if($res){
            return json(['code'=>0,'msg'=>'补仓成功']);
        }else{
            return json(['code'=>1,'msg'=>'补仓失败']);
        }
    }

}