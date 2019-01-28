<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/1/4
 * Time: 11:46
 */
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
/*下注 --过关*/
class BetsGg extends Common{
    public function index(){
        $XF=19;
        $ids="过关";
        $this->fp($XF);

        $result =Db::name('bl')->where(['class1'=>'过关'])->field('class3,rate,locked')->select();
        foreach($result as $k=>$v){
            if($v['locked']==1){
                $result[$k]['rate']='停';
                $result[$k]['locked']='disabled';
            }else{
                $result[$k]['locked']='';
            }
        }
        return $this->fetch('',[
            'result'=>$result,

        ]);
    }

    public function saveGg(){
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $result=Db::name('tan')->field('sum(sum_m) as sum_mm')->where(['kithe'=>getKitheNum(),'username'=>$mem['kauser'],'class1'=>'过关'])->select();
        $sum_mm=$result[0]['sum_mm'];
        $ggpz=getConfigField('ggpz');       //5000
        $XF=19;
        $R=12;
        $this->fp($XF);
        $result2=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$mem['kauser']])->field('SUM(sum_m) As sum_m1')->select();
        $rsw = $result2[0]['sum_m1'];
        $mkmk=empty($rsw) ? 0 : $rsw;
        $url=input('from_url');
        $z=0;
        $rate2=1;
        $arr=[];
        for ($t=1;$t<=18;$t=$t+1) {
            if (input('game' .$t)) {
                $z = $z + 1;
                $rate_id = input('game'.$t) + 619;
                $b=getBlById($rate_id);
                $rate2 = $rate2 * $b['rate'];
                $arr[$z]['class2']=$b['class2'];
                $arr[$z]['class3']=$b['class3'];
                $arr[$z]['rate']=$b['rate'];
                $arr[$z]['rate_id']=$rate_id;
                $arr[$z]['t']=$t;
            }
        }
        return $this->fetch('',[
            'mkmk'=>$mkmk,
            'mem'=>$mem,
            'money1'=>getQuotaField($R,'xx'),   //单注限额
            'money2'=>getQuotaField($R,'xxx'),   //单号限额
            'z'=>$z,
            'rate2'=>floor($rate2*100)/100,
            'rate'=>$rate2,
            'arr'=>$arr,
            'url'=>$url,
            'xc'=>$R,
            'sum_mm'=>$sum_mm,
            'ggpz'=>$ggpz,
        ]);
    }

    public function tanGg(){
        if(!input('class2'))$this->error('非法访问');
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $result=Db::name('tan')->field('sum(sum_m) as sum_mm')->where(['kithe'=>getKitheNum(),'username'=>$mem['kauser'],'class1'=>'过关'])->select();
        $sum_mm=$result[0]['sum_mm'];

        $drop_sort=input('class2');
        $XF=19;
        $R=12;
        $this->fp($XF);
        $urlurl=url('',['ids'=>'过关']);
        $url=input('from_url');
        $sum_m=input('gold/f');
        $gold=input('gold/f');
        if($sum_m>$mem['ts'])$this->redirect('index/errorPage',['msg'=>'对不起，下注总额不能大于可用信用额!']);
        $z=0;
        $rate2=1;
        $class11="过关";
        $class22='';
        $class33='';
        for ($t=1;$t<=18;$t=$t+1){
            if (input('rate_id'.$t)){
                $rate_id=input('rate_id'.$t);
                $b=getBlById($rate_id);
                $rate2=$rate2*$b['rate'];
                $class22.=$b['class2'].",";
                $class33.=$b['class3'].",".$b['rate'].",";
            }
        }
        $rate5=floor($rate2*100)/100;
        switch ($mem['abcd']) {
            case "A":
                $Y = 'yg';
                break;
            case "B":
                $Y = 'ygb';
                break;
            case "C":
                $Y = 'ygc';
                break;
            case "D":
                $Y = 'ygd';
                break;
            default:
                $Y = 'yg';
                break;
        }

        //超过单项
        $result2=Db::name('tan')->field('SUM(sum_m) As sum_m')->where(['kithe'=>getKitheNum(),'class1'=>$class11,'class2'=>$class22,'class3'=>$class33,'username'=>$mem['kauser']])->select();
        $rs5=$result2[0];

        if (($rs5['sum_m']+$sum_m)>getQuotaField($R,'xxx') ){
            $this->redirect('index/errorPage',['msg'=>'对不起，超过单项限额.请反回重新下注!']);
        }

        $num=randStr();
        $text=date("Y-m-d H:i:s");
        $sum_m=$sum_m;
        $user_ds=getQuotaField($R,'yg');
        $dai_ds = getQuotaField($R, $Y, $mem['dan']);
        $zong_ds = getQuotaField($R, $Y, $mem['zong']);
        $guan_ds = getQuotaField($R, $Y, $mem['guan']);
        $dai_zc = $mem['dan_zc'];
        $zong_zc = $mem['zong_zc'];
        $guan_zc = $mem['guan_zc'];
        $dagu_zc = $mem['dagu_zc'];
        $dai = $mem['dan'];
        $zong = $mem['zong'];
        $guan = $mem['guan'];
        $danid=$mem['danid'];
        $zongid=$mem['zongid'];
        $guanid=$mem['guanid'];
        $memid=$mem['id'];
        $abcd=$mem['abcd'];

        $guan1_ds=getQuotaField($R, $Y, 'guan1');
        $guan1_zc=$mem['guan1_zc'];
        $guanid1 = $mem['guanid1'];
        $guan1 = $mem['guan1'];
        $arr = [
            'num' => $num,
            'username' => $mem['kauser'],
            'kithe' => getKitheNum(),
            'adddate' => $text,
            'class1' => $class11,
            'class2' => $class22,
            'class3' => $class33,
            'rate' => $rate5,
            'sum_m' => $sum_m,
            'user_ds' => $user_ds,
            'dai_ds' => $dai_ds,
            'zong_ds' => $zong_ds,
            'guan_ds' => $guan_ds,
            'dai_zc' => $dai_zc,
            'zong_zc' => $zong_zc,
            'guan_zc' => $guan_zc,
            'dagu_zc' => $dagu_zc,
            'bm' => 0,
            'dai' => $dai,
            'zong' => $zong,
            'guan' => $guan,
            'danid' => $danid,
            'zongid' => $zongid,
            'guanid' => $guanid,
            'abcd' => $abcd,
            'lx' => 0,
            'guan1'=>$guan1,
            'guanid1'=>$guanid1,
            'guan1_zc'=>$guan1_zc,
            'guan1_ds'=>$guan1_ds
        ];
        $res = Db::name('tan')->insert($arr);
        if (!$res) $this->redirect('index/errorPage',['msg'=>'数据库修改出错!']);
        $res1 = Db::name('mem')->where(['kauser' => $mem['kauser']])->setDec('ts',$sum_m);
        if (!$res1)  $this->redirect('index/errorPage',['msg'=>'用户表修改失败!']);
        $fin_res=[];
        $size=0;
        for ($t=1;$t<=18;$t=$t+1){
            if (input('rate_id'.$t)) {
                $size++;
                $rate_id = input('rate_id' . $t);
                $bl=getBlById($rate_id);
                $fin_res[$size]['class2']=$bl['class2'];
                $fin_res[$size]['class3']=$bl['class3'];
                $fin_res[$size]['rate']=$bl['rate'];
            }
        }
        //分成
        //代理
        $row6=Db::name('guan')->where(['kauser'=>$dai])->find();
        $best=$row6['best'];
        $pz=$row6['pz'];
        $sj=$row6['sj'];
        $sf=$row6['sf'];
        $cs=$row6['cs'];
        $danid=$row6['id'];
        $ffff=$row6['gg1'];
        if ($pz==0 and $best==1 and $ffff>=0){
            //占成
            $result5=Db::name('tan')->field('sum(sum_m*dai_zc/10) as sum_m')->where(['kithe'=>getKitheNum(),'dai'=>$dai,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            $Rs5 = $result5[0];
            if ($Rs5['sum_m']!=""){
                $sum_mff = $Rs5['sum_m'];}else{$sum_mff =0;}
            //已补
            $result1=Db::name('tan')->field('sum(sum_m) as sum_m,count(*) as re')->where(['kithe'=>getKitheNum(),'username'=>$dai,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            $Rs6 = $result1[0];
            if ($Rs6['sum_m']!=""){
                $sum_mfll = $Rs6['sum_m'];
            }else{
                $sum_mfll =0;
            }
            $sum_m=$sum_mff-$sum_mfll-$ffff;
            //代理余额
            $r2=Db::name('mem')->field('SUM(cs) As sum_m11')->where(['dan'=>$dai])->select();
            $rsw2 = $r2[0];
            if ($rsw2['sum_m11']<>""){$mumu111=$rsw2['sum_m11'];}else{$mumu111=0;}
            $r3 =Db::name('tan')->field('SUM(sum_m) As sum_m1')->where(['kithe'=>getKitheNum(),'username'=>$dai])->select();
            $rsw3 = $r3[0];
            if ($rsw3['sum_m1']<>""){$mkmk11=$rsw3['sum_m1'];}else{$mkmk11=0;}
            $sum_sumz=$cs-$mkmk11-$mumu111;
            $smsmi=$sum_sumz-$sum_m;
            if ($sum_m>=1 and $ffff>=0 and $smsmi>=0){ ///代理补
                $sf=$sf=Db::name('guan')->where(['kauser'=>$zong])->value('sj');
                $username=$dai;
                $bx=getBlById('$rate_id');
                $rate=$bx['rate'];
                $user_ds=getQuotaField($R,'yg',$dai);
                $dai_ds=getQuotaField($R,'yg',$dai);
                $zong_ds=getQuotaField($R,'yg',$zong);
                $guan_ds=getQuotaField($R,'yg',$guan);
                $dai_zc=0;
                $zong_zc=$sj/10;
                $guan_zc=$sf/10;
                $dagu_zc=10-$sj/10-$sf/10;
                $sum_m=intval($sum_m);
                $num1=randStr();

                $sf1=Db::name('guan')->where(['kauser'=>$guan])->value('sj');
                $guan1_ds=getQuotaField($R,'yg','guan1');
                $guan1_zc=$sf1/10;
                $dagu_zc=10-$guan1_zc-$sj/10-$sf/10;
                $arr2=[
                    'num'=>$num1,
                    'username'=>$username,
                    'kithe'=>getKitheNum(),
                    'adddate'=>$text,
                    'class1'=>$class11,
                    'class2'=>$class22,
                    'class3'=>$class33,
                    'rate'=>$rate,
                    'sum_m'=>$sum_m,
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
                $resx1=Db::name('tan')->insert($arr2);
                if(!$resx1)$this->redirect('index/errorPage',['msg'=>'数据库修改出错!']);
            }//完成代理补
        }


//总代理

        $row6=Db::name('guan')->where(['kauser'=>$zong])->find();
        $best=$row6['best'];
        $pz=$row6['pz'];
        $sj=$row6['sj'];
        $sf=$row6['sf'];
        $cs=$row6['cs'];
        $danid=$row6['id'];
        $ffff=$row6['gg1'];

        if ($pz==0 and $best==1 and $ffff>=0){
            //占成
            $result5=Db::name('tan')->field('sum(sum_m*zong_zc/10) as sum_m')->where(['kithe'=>getKitheNum(),'zong'=>$zong,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            $Rs5 = $result5[0];
            if ($Rs5['sum_m']!=""){
                $sum_mff = $Rs5['sum_m'];
            }else{
                $sum_mff =0;
            }
            //已补
            $result1=Db::name('tan')->field('sum(sum_m) as sum_m,count(*) as re')->where(['kithe'=>getKitheNum(),'username'=>$zong,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            $Rs6 = $result1[0];
            if ($Rs6['sum_m']!=""){
                $sum_mfll = $Rs6['sum_m'];
            }else{
                $sum_mfll =0;
            }
            $sum_m=$sum_mff-$sum_mfll-$ffff;

            //总代余额
            $r2=Db::name('guan')->field('SUM(cs) As sum_m11')->where(['lx'=>3,'zongid'=>$zongid])->select();
            $rsw2 = $r2[0];
            if ($rsw2['sum_m11']<>""){$mumu111=$rsw2['sum_m11'];}else{$mumu111=0;}
            $r3=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$zong])->field('SUM(sum_m) As sum_m1')->select();
            $rsw3 = $r3[0];
            if ($rsw3['sum_m1']<>""){$mkmk11=$rsw3['sum_m1'];}else{$mkmk11=0;}
            $sum_sumz=$cs-$mkmk11-$mumu111;
            $smsmi=$sum_sumz-$sum_m;
            if ($sum_m>=1 and $ffff>=0 and $smsmi>=0){ ///总代补
                $username=$zong;
                $cb=getBlById($rate_id);
                $rate=$cb['rate'];
                $user_ds=getQuotaField($R,'yg',$zong);
                $dai_ds=getQuotaField($R,'yg',$zong);
                $zong_ds=getQuotaField($R,'yg',$zong);
                $guan_ds=getQuotaField($R,'yg',$guan);
                $dai=$mem['zong'];
                $zong=$mem['zong'];
                $guan=$mem['guan'];
                $danid=$mem['zongid'];
                $zongid=$mem['zongid'];
                $guanid=$mem['guanid'];
                $dai_zc=0;
                $zong_zc=0;
                $guan_zc=$sj/10;
                $dagu_zc=10-$sj/10;
                $sum_m=intval($sum_m);
                $num1=randStr();

                $sf1=Db::name('guan')->where(['kauser'=>$guan])->value('sj');
                $guan1_ds=getQuotaField($R,'yg','guan1');
                $guan1=$mem['guan1'];
                $guan1_zc=$sf1/10;
                $dagu_zc=10-$guan1_zc-$sj/10;
                $arr3=[
                    'num'=>$num1,
                    'username'=>$username,
                    'kithe'=>getKitheNum(),
                    'adddate'=>$text,
                    'class1'=>$class11,
                    'class2'=>$class22,
                    'class3'=>$class33,
                    'rate'=>$rate,
                    'sum_m'=>$sum_m,
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
                $resx1=Db::name('tan')->insert($arr3);
                if(!$resx1)$this->redirect('index/errorPage',['msg'=>'数据库修改出错!']);

            }//完成总代补
        }

        //股东
        $row6=Db::name('guan')->where(['kauser'=>$guan])->find();
        $best=$row6['best'];
        $pz=$row6['pz'];
        $sj=$row6['sj'];
        $sf=$row6['sf'];
        $cs=$row6['cs'];
        $danid=$row6['id'];
        $ffff=$row6['gg1'];
        if ($pz==0 and $best==1 and $ffff>=0){
            //占成
            $result5=Db::name('tan')->field('sum(sum_m*guan_zc/10) as sum_m')->where(['kithe'=>getKitheNum(),'guan'=>$guan,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            $Rs5 = $result5[0];
            if ($Rs5['sum_m']!=""){
                $sum_mff = $Rs5['sum_m'];
            }else{$sum_mff =0;}
            //已补
            $result1=Db::name('tan')->field('sum(sum_m) as sum_m,count(*) as re')->where(['kithe'=>getKitheNum(),'username'=>$guan,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            $Rs6 = $result1[0];
            if ($Rs6['sum_m']!=""){
                $sum_mfll = $Rs6['sum_m'];
            }else{$sum_mfll =0;}
            $sum_m=$sum_mff-$sum_mfll-$ffff;

            //股东余额
            $r2=Db::name('guan')->where(['lx'=>2,'guanid'=>$guanid])->field('SUM(cs) As sum_m11')->select();
            $rsw2 = $r2[0];
            if ($rsw2['sum_m11']<>""){$mumu111=$rsw2['sum_m11'];}else{$mumu111=0;}
            $r3 =Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$guan])->field('SUM(sum_m) As sum_m1')->select();
            $rsw3 = $r3[0];
            if ($rsw3['sum_m1']<>""){$mkmk11=$rsw3['sum_m1'];}else{$mkmk11=0;}
            $sum_sumz=$cs-$mkmk11-$mumu111;
            $smsmi=$sum_sumz-$sum_m;

            if ($sum_m>=1 and $ffff>=0 and $smsmi>=0){ ///股东补
                $username=$guan;
                $cb=getBlById($rate_id);
                $rate=$cb['rate'];
                $user_ds=getQuotaField($R,'yg',$guan);
                $dai_ds=getQuotaField($R,'yg',$guan);
                $zong_ds=getQuotaField($R,'yg',$guan);
                $guan_ds=getQuotaField($R,'yg',$guan);
                $dai=$mem['guan'];
                $zong=$mem['guan'];
                $guan=$mem['guan'];
                $danid=$mem['guanid'];
                $zongid=$mem['guanid'];
                $guanid=$mem['guanid'];
                $dai_zc=0;
                $zong_zc=0;
                $guan_zc=0;
                $dagu_zc=10;
                $sum_m=intval($sum_m);
                $num1=randStr();

                $guan1_ds=getQuotaField($R,'yg','guan1');
                $guan1=$mem['guan1'];
                $guan1_zc=$sj/10;
                $dagu_zc=10-$guan1_zc;
                $arr4=[
                    'num'=>$num1,
                    'username'=>$username,
                    'kithe'=>getKitheNum(),
                    'adddate'=>$text,
                    'class1'=>$class11,
                    'class2'=>$class22,
                    'class3'=>$class33,
                    'rate'=>$rate,
                    'sum_m'=>$sum_m,
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
                $resx1=Db::name('tan')->insert($arr4);
                if(!$resx1)$this->redirect('index/errorPage',['msg'=>'数据库修改出错!']);
            }//完成股东补
        }

        //大股东
        $row6=Db::name('guan')->where(['kauser'=>$guan1])->find();
        $best=$row6['best'];
        $pz=$row6['pz'];
        $sj=$row6['sj'];
        $sf=$row6['sf'];
        $cs=$row6['cs'];
        $danid=$row6['id'];
        $ffff=$row6['gg1'];
        if ($pz==0 and $best==1 and $ffff>=0){
            //占成
            $result5=Db::name('tan')->field('sum(sum_m*guan1_zc/10) as sum_m')->where(['kithe'=>getKitheNum(),'guan1'=>$guan1,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            $Rs5 = $result5[0];
            if ($Rs5['sum_m']!=""){
                $sum_mff = $Rs5['sum_m'];
            }else{$sum_mff =0;}
            //已补
            $result1=Db::name('tan')->field('sum(sum_m) as sum_m,count(*) as re')->where(['kithe'=>getKitheNum(),'username'=>$guan1,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            $Rs6 = $result1[0];
            if ($Rs6['sum_m']!=""){
                $sum_mfll = $Rs6['sum_m'];
            }else{$sum_mfll =0;}
            $sum_m=$sum_mff-$sum_mfll-$ffff;

            //大股东余额
            $r2=Db::name('guan')->where(['lx'=>1,'guanid'=>$guanid1])->field('SUM(cs) As sum_m11')->select();
            $rsw2 = $r2[0];
            if ($rsw2['sum_m11']<>""){$mumu111=$rsw2['sum_m11'];}else{$mumu111=0;}
            $r3 =Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$guan1])->field('SUM(sum_m) As sum_m1')->select();
            $rsw3 = $r3[0];
            if ($rsw3['sum_m1']<>""){$mkmk11=$rsw3['sum_m1'];}else{$mkmk11=0;}
            $sum_sumz=$cs-$mkmk11-$mumu111;
            $smsmi=$sum_sumz-$sum_m;

            if ($sum_m>=1 and $ffff>=0 and $smsmi>=0){ ///大股东补
                $username=$guan;
                $cb=getBlById($rate_id);
                $rate=$cb['rate'];
                $user_ds=getQuotaField($R,'yg','guan1');
                $dai_ds=getQuotaField($R,'yg','guan1');
                $zong_ds=getQuotaField($R,'yg','guan1');
                $guan_ds=getQuotaField($R,'yg','guan1');
                $dai=$mem['guan1'];
                $zong=$mem['guan1'];
                $guan=$mem['guan1'];
                $danid=$mem['guanid1'];
                $zongid=$mem['guanid1'];
                $guanid=$mem['guanid1'];
                $dai_zc=0;
                $zong_zc=0;
                $guan_zc=0;
                $dagu_zc=10;
                $sum_m=intval($sum_m);
                $num1=randStr();

                $guan1_ds=getQuotaField($R,'yg','guan1');
                $guan1=$mem['guan1'];
                $guan1_zc=0;
                $dagu_zc=10;
                $arr4=[
                    'num'=>$num1,
                    'username'=>$username,
                    'kithe'=>getKitheNum(),
                    'adddate'=>$text,
                    'class1'=>$class11,
                    'class2'=>$class22,
                    'class3'=>$class33,
                    'rate'=>$rate,
                    'sum_m'=>$sum_m,
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
                $resx1=Db::name('tan')->insert($arr4);
                if(!$resx1)$this->redirect('index/errorPage',['msg'=>'数据库修改出错!']);
            }//完成大股东补
        }
        return $this->fetch('',[
            'url'=>$url,
            'num'=>$num,
            'sum_m'=>input('gold/f'),
            'rate5'=>$rate5,
            'fin_res'=>$fin_res,
        ]);
    }
}