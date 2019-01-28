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
/*即时注单 -- 正码*/
class Zm extends Common{
    public function index(){
        $sess=session('lhc_users');
        $row=Db::name('guan')->where(['kauser'=>$sess['kauser']])->find();
        $ids='正A';

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
        $tm=$zt;

        $kithe=input('kithe') ? input('kithe') :getKitheNum();
        if($kithe != getKitheNum())$ftime=20000000;
        $ka_guanid=$row['id'];

        //请求参数
        $tm2=input('tm2') ? input('tm2') : 0;
        $tm1=input('tm1') ? input('tm1') : 0;

        if ($row['lx']==4){
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
        $R=6;
        $XF=11;

        //不同
        $res_bl=Db::name('bl')->where(['class1'=>'正码'])->field('distinct(class2)')->select();

        foreach ($res_bl as $k2=>$v2){
            if ($row['lx']==4){
                $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*guan1_zc/10) as sum_mzc')->where(['kithe'=>$kithe,'lx'=>0,'guan1'=>$row['kauser'],'class2'=>$v2['class2']])->select();
            }
            if ($row['lx']==1){
                $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*guan_zc/10) as sum_mzc')->where(['kithe'=>$kithe,'lx'=>0,'guan'=>$row['kauser'],'class2'=>$v2['class2']])->select();
            }
            if ($row['lx']==2){
                $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*zong_zc/10) as sum_mzc')->where(['kithe'=>$kithe,'lx'=>0,'zong'=>$row['kauser'],'class2'=>$v2['class2']])->select();
            }
            if ($row['lx']==3){
                $r1=Db::name('tan')->field('sum(sum_m) as sum_m,sum(sum_m*dai_zc/10) as sum_mzc')->where(['kithe'=>$kithe,'lx'=>0,'dai'=>$row['kauser'],'class2'=>$v2['class2']])->select();
            }
            $Rs6=$r1[0];
            if ($Rs6['sum_m']!=""){
                $sum_m3[$k2] = $Rs6['sum_m'];
            }else{
                $sum_m3[$k2] =0;
            }
            if ($Rs6['sum_mzc']!=""){
                $sum_m3zc[$k2] = $Rs6['sum_mzc'];
            }else{
                $sum_m3zc[$k2] =0;
            }
        }

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

    //ajax加载
    public function server_tm(){
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
//        $z_sumzc=0;
//        $z_sumds2=0;
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


//        $bbbb="count(*) as re,SUM(sum_m) As sum_money";
//        $tm2=input('tm2');
//        for ($i=1;$i<=49;$i=$i+1){
//            $sum_tm1[$i]=$i;
//        }

        $result=Db::name('bl')->field('class3,class1,class2')->where(['class1'=>$class1,'class2'=>$class2])->select();

        $ii=0;
        foreach ($result as $v){
//            if ($ii<49){
//                $tem_index=intval($v['class3']);
////                $my_money=$sum_money1[$tem_index];  //?没什么必要
//            }else{
//                $my_money=0;
//            }
//            $my_money=0;
            if ($row['lx']==4){
                $field1="sum(sum_m) as sum_m,count(*) as re,sum(sum_m*(guan1_ds-guan_ds)/100) as sum_ds,sum(0-sum_m*rate*guan1_zc/10) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>['neq',$row['kauser']],'class1'=>$v['class1'],'class2'=>$class2,'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs5=$r[0];

                $field1="sum(sum_m*rate) as sum_money,count(*) as re,sum(sum_m*(user_ds/100)) as sum_ds,sum(sum_m) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>$row['kauser'],'class1'=>$v['class1'],'class2'=>$class2,'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs7=$r[0];

                $field1="sum(sum_m*guan1_zc/10) as sum_moneya";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class2'=>$class2,'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsA=$r[0];

                $field1="sum(sum_m*guan1_zc/10) as sum_moneyb";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class2'=>'特1B','class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsB=$r[0];
            }
            if ($row['lx']==1){
                $field1="sum(sum_m) as sum_m,count(*) as re,sum(sum_m*(guan_ds-zong_ds)/100) as sum_ds,sum(0-sum_m*rate*guan_zc/10) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>['neq',$row['kauser']],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs5=$r[0];

                $field1="sum(sum_m*rate) as sum_money,count(*) as re,sum(sum_m*(user_ds/100)) as sum_ds,sum(sum_m) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>$row['kauser'],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs7=$r[0];

                $field1="sum(sum_m*guan_zc/10) as sum_moneya";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsA=$r[0];

                $field1="sum(sum_m*guan_zc/10) as sum_moneyb";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class2'=>'特1B','class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsB=$r[0];

            }
            if ($row['lx']==2){
                $field1="sum(sum_m) as sum_m,count(*) as re,sum(sum_m*(zong_ds-dai_ds)/100) as sum_ds,sum(0-sum_m*rate*zong_zc/10) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>['neq',$row['kauser']],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs5=$r[0];

                $field1="sum(sum_m*rate) as sum_money,count(*) as re,sum(sum_m*(user_ds/100)) as sum_ds,sum(sum_m) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>$row['kauser'],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs7=$r[0];

                $field1="sum(sum_m*zong_zc/10) as sum_moneya";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsA=$r[0];

                $field1="sum(sum_m*zong_zc/10) as sum_moneyb";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class2'=>'特1B','class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsB=$r[0];

            }
            if ($row['lx']==3){
                $field1="sum(sum_m) as sum_m,count(*) as re,sum(sum_m*(dai_ds-user_ds)/100) as sum_ds,sum(0-sum_m*rate*dai_zc/10) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>['neq',$row['kauser']],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs5=$r[0];

                $field1="sum(sum_m*rate) as sum_money,count(*) as re,sum(sum_m*(user_ds/100)) as sum_ds,sum(sum_m) as sum_m3";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'username'=>$row['kauser'],'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $Rs7=$r[0];

                $field1="sum(sum_m*dai_zc/10) as sum_moneya";
                $w1=array_merge($vvvv,['kithe'=>$kithe,'class1'=>$v['class1'],'class3'=>$v['class3']]);
                $r=Db::name('tan')->field($field1)->where($w1)->select();
                $RsA=$r[0];

                $field1="sum(sum_m*dai_zc/10) as sum_moneyb";
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

            $Rsbl = Db::name('bl')->where(['class1'=>$v['class1'],'class2'=>$class2,'class3'=>$v['class3']])->find();
//            if($Rs5['sum_m']!=""){$my_sum_m_5=$Rs5['sum_m'];}else{$my_sum_m_5=$my_money;}
//            $my_re_5=$Rs5['re'];
//            $my_sum_ds_5=$Rs5['sum_ds'];
//            $my_sum_m3_5=$Rs5['sum_m3'];
//            $my_sum_m_7=$Rs7['sum_money'];
//            $my_re_7=$Rs7['re'];
//            $my_sum_ds_7=$Rs7['sum_ds'];
//            $my_sum_m3_7=$Rs7['sum_m3'];
//            $my_sum_moneya=$RsA['sum_moneya'];
//            $my_sum_moneyb=$RsB['sum_moneyb'];
//            $my_rate=$Rsbl['rate'];


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
            $sum_re[$ii]=$Rs5['re'];

            if ($Rs5['sum_m']!=""){
                $sum_m[$ii] = $Rs5['sum_m'];
            }else{
                $sum_m[$ii] =0;
            }

            if ($RsA['sum_moneya']!=""){$sum_ma[$ii] =$RsA['sum_moneya'];}else{$sum_ma[$ii] =0;}
            if ($RsB['sum_moneyb']!=""){$sum_mb[$ii] =$RsB['sum_moneyb'];}else{$sum_mb[$ii] =0;}

            $sum_ds[$ii]=$Rs5['sum_ds'];
            $sum_xx[$ii]=$Rs5['sum_m3'];
            $sum_xx_7[$ii]=$Rs7['sum_m3'];
            if ($Rsbl['rate']!=""){
                $sum_bl[$ii]=$Rsbl['rate'];
            }else{
                $sum_bl[$ii]=0;
            }

            if ($ii<49){
                $z_re+=$Rs5['re'];

                $z_sum+=$Rs5['sum_m'];


                $z7_ds+=$Rs7['sum_ds'];

                $z_suma+=$RsA['sum_moneya'];
                $z_sumb+=$RsB['sum_moneyb'];
                $z_ds+=$Rs5['sum_ds'];
                $z_xx+=$Rs5['sum_m3'];
                $z_pz+=$Rs7['sum_m3'];
            }else{
                $z_re1+=$Rs5['re'];
                $z_sum1+=$Rs5['sum_m'];
                $z7_ds1+=$Rs7['sum_ds'];
                $z_suma1+=$RsA['sum_moneya'];
                $z_sumb1+=$RsB['sum_moneyb'];
                $z_ds1+=$Rs5['sum_ds'];
                $z_xx1+=$Rs5['sum_m3'];
                $z_pz1+=$Rs7['sum_m3'];
            }

            $sum_sx1[$ii]=$Rs7['sum_money'];
            if ($Rs7['sum_m3']!=""){$sum_pz1[$ii]=$Rs7['sum_m3'];}else{
                $sum_pz1[$ii]=0;}

            $ii++;
        }

        for($i=0;$i<53;$i++)
        {
            if ($i<49){
                $sum_sx[$i]=($z_suma-$z_pz)*(1-$tm1/100)-($sum_ma[$i]-$sum_pz1[$i])*$sum_bl[$i];
                $sum_ma[$i]=$sum_ma[$i]-$sum_pz1[$i];
            }else{
                if($sum_tm[$i]=="总单"||$sum_tm[$i]=="总双"){
                    $sum_sx[$i]=(($sum_ma[49]+$sum_ma[50])-($sum_xx_7[49]+$sum_xx_7[50]))*0.97-($sum_ma[$i]-$sum_pz1[$i])*$sum_bl[$i];
                }elseif($sum_tm[$i]=="总大"||$sum_tm[$i]=="总小"){
                    $sum_sx[$i]=(($sum_ma[51]+$sum_ma[52])-($sum_xx_7[51]+$sum_xx_7[52]))*0.97-($sum_ma[$i]-$sum_pz1[$i])*$sum_bl[$i];
                }
            }
        }

        $b=0;
        for($b=0;$b<53;$b++)
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

        for($i=0;$i<53;$i++)
        {
            if(($sum_sx[$i]+$ztm_tm)>=0 || $sum_bl[$i]==0 ){
                $ffxx=0;}else{
                if ($i<49){
                    $ffxx=((($z_pz-$sum_sx[$i])-$ztm_tm)/($sum_bl[$i]+$tm1/100-1));
                }else{
                    if($sum_tm[$i]=="总单"||$sum_tm[$i]=="总双"){
                        $ffxx=(((($sum_xx_7[49]+$sum_xx_7[50])-$sum_sx[$i])-$ztm_tm)/($sum_bl[$i]+3/100-1));
                    }elseif($sum_tm[$i]=="总大"||$sum_tm[$i]=="总小"){
                        $ffxx=(((($sum_xx_7[51]+$sum_xx_7[52])-$sum_sx[$i])-$ztm_tm)/($sum_bl[$i]+3/100-1));
                    }
                }
            }

            $bl=round($ffxx,0);//intval($ffxx);
            if($ffxx>=1){
                $fg=$fg+1;
                if ($i==0){
                    $sum_pz[0]="<button onclick=show_win('".$sum_tm[0]."','".$bl."','".$sum_bl[0]."','".$class1."','".$class2."','".$kithe."')    ><font color=ff6600>走飞</font>  ".$bl."</button>";
                }else{
                    $sum_pz[$i]="<button  onclick=show_win('".$sum_tm[$i]."','".$bl."','".$sum_bl[$i]."','".$class1."','".$class2."','".$kithe."')    ><font color=ff6600>走飞</font>  ".$bl."</button>";}
            }else{
                $sum_pz[$i]="0";
                $sum_pz[$i]="<button  onclick=show_win('".$sum_tm[$i]."','".$bl."','".$sum_bl[$i]."','".$class1."','".$class2."','".$kithe."')    ><font color=ff6600>走飞</font>  ".$bl."</button>";
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
            $result['msg']='更新成功';
            return json($result);
        }else{
            $result['msg']='更新失败';
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