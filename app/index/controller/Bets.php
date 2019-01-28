<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/5
 * Time: 10:06
 */
namespace app\index\controller;
use think\Db;
use app\index\controller\Common;

class Bets extends Common{
    //合肖
    public function sx6(){
        $ids=input('ids') ? input('ids') : '六肖';
        $xf=23;
        if($ids=='二肖'){
            $xc=26;
        }
        if($ids=='三肖'){
            $xc=27;
        }
        if($ids=='四肖'){
            $xc=19;
        }
        if($ids=='五肖'){
            $xc=20;
        }
        if($ids=='六肖' || $ids=='七肖' || $ids=='八肖' || $ids=='九肖' || $ids=='十肖' || $ids=='十一肖'){
            $xc=21;
        }
        //封盘判断
        $this->fp($xf);
        $user=session('lhc_index');

        $data=getBlByClass2($ids);
        foreach ($data as $k=>$v){
            $d=db('sxnumber')->where(['sx'=>$v['class3']])->value('m_number');
            $data[$k]['class3_number']=explode(',',$d);
        }

        return $this->fetch('',[
            'ids'=>$ids,
            'xc'=>$xc,
            'data'=>$data,
            'sum'=>getTanKitheSum('生肖',$ids)
        ]);
    }

    //合肖提交确认
    public function sxSubmit(){
        if(!$this->request->has('class2'))$this->redirect('index/errorPage',['msg'=>'非法访问']);
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $class1='生肖';
        $data=$this->request->param();
        $n=0;
        $number1='';
        $mdrop=0;
        $aa='';
        $number1='';
        foreach (range(0,12) as $k=>$v ){
            if(input('?num'.$v)){
                $n++;
                $number1.=input('num'.$v).',';
                $res=Db::table('mdrop')->where(['class1'=>$class1,'class2'=>input('class2'),'class3'=>input('num'.$v)])->value('rate');
                $mdrop+=$res;
                $aa.=$res.',';
            }
        };
        $aa.='0';
        //下面是将aaa切割成数组
        $sum=getTanKitheSum($class1,input('class2'));   //当前用户在本期已投入金额

        //以下是重复的数据
        $bmmm=0;
        $cmmm=0;
        $dmmm=0;
        $rate_id=0;
        $R=0;
        switch (input('class2')){
            case '二肖':
                $R=19;
                $XF=23;
                $rate_id=901;           //ka_bl表
                if($n!=2)$this->redirect('index/errorPage',['msg'=>'对不起，请选择二个生肖']);
                break;
            case '三肖':
                $R=20;
                $XF=23;
                $rate_id=913;
                if($n!=3)$this->redirect('index/errorPage',['msg'=>'对不起，请选择三个生肖']);
                break;
            case '四肖':
                $R=21;
                $XF=23;
                $rate_id=925;
                if($n!=4)$this->redirect('index/errorPage',['msg'=>'对不起，请选择四个生肖']);
                break;
            case '五肖':
                $R=23;
                $XF=23;
                $rate_id=937;
                if($n!=5)$this->redirect('index/errorPage',['msg'=>'对不起，请选择五个生肖']);
                break;
            case '六肖':
                $bmmm=getConfigField('bsx6');
                $cmmm=getConfigField('csx6');
                $dmmm=getConfigField('dsx6');
                $R=21;
                $XF=23;
                $rate_id=949;
                if($n!=6)$this->redirect('index/errorPage',['msg'=>'对不起，请选择六个生肖']);
                break;
            case '七肖':
                $R=27;
                $XF=23;
                $rate_id=961;
                if($n!=7)$this->redirect('index/errorPage',['msg'=>'对不起，请选择七个生肖']);
                break;
            case '八肖':
                $R=28;
                $XF=23;
                $rate_id=973;
                if($n!=8)$this->redirect('index/errorPage',['msg'=>'对不起，请选择八个生肖']);
                break;
            case '九肖':
                $R=29;
                $XF=23;
                $rate_id=985;
                if($n!=9)$this->redirect('index/errorPage',['msg'=>'对不起，请选择九个生肖']);
                break;
            case '十肖':
                $R=31;
                $XF=23;
                $rate_id=997;
                if($n!=10)$this->redirect('index/errorPage',['msg'=>'对不起，请选择十个生肖']);
                break;
            case '十一肖':
                $R=32;
                $XF=23;
                $rate_id=1009;
                if($n!=11)$this->redirect('index/errorPage',['msg'=>'对不起，请选择十一个生肖']);
                break;
            default:
                break;
        }
        //关于会员等级
        $bl=getBlById($rate_id);
        switch (getMemField('abcd')){
            case 'A':
                $rate=$bl['rate']-$mdrop;
                $Y=1;
                break;
            case 'B':
                $rate=$bl['rate']-$mdrop-$bmmm;
                $Y=4;
                break;
            case 'C':
                $rate=$bl['rate']-$mdrop-$cmmm;
                $Y=5;
                break;
            case 'D':
                $rate=$bl['rate']-$mdrop-$dmmm;
                $Y=6;
                break;
            default:
                $rate=$bl['rate']-$mdrop;
                $Y=1;
                break;
        }
        //判断下注金额
        if(input('Num_1/f')>$mem['ts'])$this->redirect('index/errorPage',['msg'=>'下注金额不能超过您当前可用余额!']);
        if(input('Num_1/f')<$mem['xy'])$this->redirect('index/errorPage',['msg'=>'下注最低限额'.$mem['xy'].'元']);
        if(input('Num_1/f')>getQuotaField(input('xc'),'xx'))$this->redirect('index/errorPage',['msg'=>'下注金额已超过单注限额:'.getQuotaField(input('xc'),'xx').'元']);
        $param=[
            'class2'=>input('class2'),
            'min_bl'=>input('min_bl'),  //最小赔率
            'number1'=>rtrim($number1,','),               //暂时是生肖之间用,连接的字符串
            'Num_1'=>input('Num_1/f'),    //投注金额
            'xx'=>getQuotaField($R,'xx'),         //单注限额
            'xxx'=>getQuotaField($R,'xxx'),         //单号限额
            'rate_id'=>$rate_id,                //赔率表的rate_id
            'ratex'=>$bl['rate'],               //赔率
            'sum'=>$sum,                        //当前期的总下注金额
            'url'=>input('from_url'),
            'mem'=>$mem,
        ];
        return $this->fetch('',$param);
    }

    //合肖数据保存
    public function saveSx6(){
        if(!input('?class2'))$this->redirect('index/errorPage',['msg'=>'非法访问']);
        $sum=getKitheSum();     //历史下注总额
        $class2=input('class2');
        $bmmm=0;
        $cmmm=0;
        $dmmm=0;
        $R=0;
        $XF=0;
        $rate_id=0;
        $urlurl='';
        switch($class2){
            case '二肖':
                $R=19;
                $XF=23;
                $rate_id=901;
                $urlurl=url('sx6',['ids'=>'二肖']);
                break;
            case '三肖':
                $R=20;
                $XF=23;
                $rate_id=913;
                $urlurl=url('sx6',['ids'=>'三肖']);
                break;
            case '四肖':
                $R=21;
                $XF=23;
                $rate_id=925;
                $urlurl=url('sx6',['ids'=>'四肖']);
                break;
            case '五肖':
                $R=23;
                $XF=23;
                $rate_id=937;
                $urlurl=url('sx6',['ids'=>'五肖']);
                break;
            case '六肖':
                $bmmm=getConfigField('bsx6');
                $cmmm=getConfigField('csx6');
                $dmmm=getConfigField('dsx6');
                $R=21;
                $XF=23;
                $rate_id=949;
                $urlurl=url('sx6',['ids'=>'六肖']);
                break;
            case '七肖':
                $bmmm=getConfigField('bsx6');
                $cmmm=getConfigField('csx6');
                $dmmm=getConfigField('dsx6');
                $R=27;
                $XF=23;
                $rate_id=961;
                $urlurl=url('sx6',['ids'=>'七肖']);
                break;
            case '八肖':
                $bmmm=getConfigField('bsx6');
                $cmmm=getConfigField('csx6');
                $dmmm=getConfigField('dsx6');
                $R=28;
                $XF=23;
                $rate_id=973;
                $urlurl=url('sx6',['ids'=>'八肖']);
                break;
            case '九肖':
                $bmmm=getConfigField('bsx6');
                $cmmm=getConfigField('csx6');
                $dmmm=getConfigField('dsx6');
                $R=29;
                $XF=23;
                $rate_id=985;
                $urlurl=url('sx6',['ids'=>'九肖']);
                break;
            case '十肖':
                $bmmm=getConfigField('bsx6');
                $cmmm=getConfigField('csx6');
                $dmmm=getConfigField('dsx6');
                $R=31;
                $XF=23;
                $rate_id=997;
                $urlurl=url('sx6',['ids'=>'十肖']);
                break;
            case '十一肖':
                $bmmm=getConfigField('bsx6');
                $cmmm=getConfigField('csx6');
                $dmmm=getConfigField('dsx6');
                $R=32;
                $XF=23;
                $rate_id=1009;
                $urlurl=url('sx6',['ids'=>'十一肖']);
                break;
            default:
                break;
        }

        if(input('gold')>getMemField('ts')) $this->redirect('index/errorPage',['msg'=>'对不起，下注总额不能大于可用信用额!']);
        $number1=explode(',',input('number1'));
        $mdrop=0;
        $aa='';
        if(!is_array($number1)) $this->redirect('index/errorPage',['msg'=>'对不起，您选择的生肖数量不正确!']);
        else{
            foreach ($number1 as $k=>$v){
                $res=Db::table('mdrop')->where(['class1'=>'生肖','class2'=>$class2,'class3'=>$v])->value('rate');
                $mdrop+=$res;
                $aa.=$res.',';
            }
        }
        $array=explode(",",$aa);
        $rate555=$array[0];
        //$rate555获取 $array中最小的那个值
        for ($i=1;$i<count($number1);$i++){
            if($rate555<$array[$i]){
                $rate555=$array[$i];
            }
        }
        //关于会员等级
        $bl=getBlById($rate_id);
        switch (getMemField('abcd')){
            case 'A':
                $rate=$bl['rate']-$mdrop;
                $Y='yg';  //1
                break;
            case 'B':
                $rate=$bl['rate']-$mdrop-$bmmm;
                $Y='ygb';       //4
                break;
            case 'C':
                $rate=$bl['rate']-$mdrop-$cmmm;
                $Y='ygc';
                break;
            case 'D':
                $rate=$bl['rate']-$mdrop-$dmmm;
                $Y='ygd';
                break;
            default:
                $rate=$bl['rate']-$mdrop;
                $Y='yg';
                break;
        }
        $rate5=input('min_bl');   //最小赔率
        $order=randStr();
        $date=date('Y-m-d H:i:s');
        $class11=$bl['class1'];
        $class22=$bl['class2'];
        $class33=input('number1');
        $sum_m=input('gold');                   //下注金额
        $user_ds=getQuotaField($R,$Y);        //ka_tan表 user_ds对应ka_quota 表下的$Y字段  username=mem表的kauser
        $dai_ds=getQuotaField($R,$Y,'dai'); //对应ka_quota 表下的$Y字段  username=mem表的dan
        $zong_ds=getQuotaField($R,$Y,'zong');//对应ka_quota 表下的$Y字段  username=mem表的zong
        $guan_ds=getQuotaField($R,$Y,'guan');//对应ka_quota 表下的$Y字段  username=mem表的guan
        $dai_zc=getMemField("dan_zc");
        $zong_zc=getMemField("zong_zc");
        $guan_zc=getMemField("guan_zc");
        $dagu_zc=getMemField("dagu_zc");
        $dai=getMemField("dan");
        $zong=getMemField("zong");
        $guan=getMemField("guan");
        $danid=getMemField("danid");
        $zongid=getMemField("zongid");
        $guanid=getMemField("guanid");
        $memid=getMemField("id");
        $sum_m1=getTanKitheSum($class11,$class22);
        if(($sum_m1+$sum_m) > getQuotaField($R,'xxx')){
            $this->redirect('index/errorPage',['msg'=>'对不起，超过单项限额.请反回重新下注!']);
        }
        $user=session('lhc_index');

        $guan1_ds=getQuotaField($R, $Y, 'guan1');
        $guan1_zc=getMemField('guan1_zc');
        $guanid1 = getMemField('guanid1');
        $guan1 = getMemField('guan1');
        $array=[
            'num'=>$order,
            'username'=>$user['kauser'],
            'kithe'=>getKitheNum(),
            'adddate'=>$date,
            'class1'=>$class11,
            'class2'=>$class22,
            'class3'=>$class33,
            'rate'=>$rate5,
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
            'danid'=>$danid,
            'zongid'=>$zongid,
            'guanid'=>$guanid,
            'abcd'=>'A',
            'lx'=>0,
            'guan1'=>$guan1,
            'guanid1'=>$guanid1,
            'guan1_zc'=>$guan1_zc,
            'guan1_ds'=>$guan1_ds
        ];
        $result=db('tan')->insert($array);
        if(!$result)$this->redirect('index/errorPage',['msg'=>'用户下单插入数据失败!']);

        //分红操作
        //代理
        $row6=Db::name('guan')->where(['kauser'=>$dai])->find();
        $best=$row6['best'];
        $pz=$row6['pz'];
        $sj=$row6['sj'];
        $sf=$row6['sf'];
        $cs=$row6['cs'];
        $danid=$row6['id'];
        switch($bl['class1']){
            case '特码':
                switch($bl['class3']){
                    case "单":
                    case '双':
                    case '家禽':
                    case "野兽":
                    case "大":
                    case "小":
                    case "合单":
                    case "合双":
                    case "红波":
                    case "绿波":
                    case "蓝波":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['tm1'];
                        break;
                }
                break;
            case "正码":
                switch($bl['class3']){
                    case "总单":
                    case "总双":
                    case "总大":
                    case "总小":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['zm1'];
                        break;
                }
                break;
            case "五行":
                $ffff=$row6['wx1'];
                break;
            case "生肖":
                switch ($class22){
                    case "一肖":
                        $ffff=$row6['yx1'];
                        break;
                    default:
                        $ffff=$row6['sx1'];
                        break;
                }
                break;
            case "不中":
                $ffff=$row6['qbz1'];
                break;
            case "半波":
                $ffff=$row6['bb1'];
                break;
            case "正特":
                switch ($bl['class3']){
                    case "单":
                    case "双":
                    case "大":
                    case "小":
                    case "合单":
                    case "合双":
                    case "红波":
                    case "绿波":
                    case "蓝波":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['zt1'];
                        break;
                }
                break;
            case "尾数":
                $ffff=$row6['ws1'];
                break;
            default:
                $ffff=$row6['ws1'];
                break;
        }
        if ($pz==0 and $best==1 and $ffff>=0){
            //占成
            $res1=Db::name('tan')->field(['sum(sum_m*dai_zc/10) sum_m'])->where(['kithe'=>getKitheNum(),'dai'=>$dai,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            if($res[0]['sum'])$sum_mff=$res[0]['sum'];
            else $sum_mff=0;
            //已补
            $res2=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re'])->where(['kithe'=>getKitheNum(),'username'=>$dai,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            if(!$res2[0]['sum_m'])$sum_mfll=0;
            else $sum_mfll=$res2[0]['sum_m'];
            $sum_m2=$sum_mff-$sum_mfll-$ffff;
            //代理余额
            $res3=Db::name('mem')->where(['dan'=>$dai])->field('sum(cs) sum_m11')->order(['id'=>'desc'])->select();
            if($res3[0]['sum_m11'])$mumu111=$res3[0]['sum_m11'];
            else $mumu111=0;

            $res4=Db::name('tan')->field(['sum(sum_m) sum_m1'])->where(['kithe'=>getKitheNum(),'username'=>$dai])->order(['id'=>'desc'])->select();
            if($res4[0]['sum_m1'])$mkmk11=$res4[0]['sum_m1'];
            else $mkmk11=0;
            $sum_sumz=$cs-$mkmk11-$mumu111;
            $smsmi=$sum_sumz-$sum_m2;
            if ($sum_m2>=1 and $ffff>=0 and $smsmi>=0){
            //代理补
                $res5=Db::name('guan')->where(['kauser'=>$zong])->order(['id'=>'desc'])->value('sj');
                $sf=$res5;
                $username=$dai;
                $rate=$bl['rate'];
                $user_ds=getQuotaField($R,'yg',$zong);
                $dai_ds=getQuotaField($R,'yg',$zong);
                $zong_ds=getQuotaField($R,'yg',$zong);
                $guan_ds=getQuotaField($R,'yg',$guan);
                $dai_zc=0;
                $zong_zc=0;
                $guan_zc=$sj/10;
                $dagu_zc=10-$sj/10;

                $dai=getMemField("zong");
                $zong=getMemField("zong");
                $guan=getMemField("guan");
                $danid=getMemField("zongid");
                $zongid=getMemField("zongid");
                $guanid=getMemField("guanid");
                $sum_m2=intval($sum_m2);
                $num1=randStr();

                $sf1=Db::name('guan')->where(['kauser'=>$guan])->value('sj');
                $guan1_ds=getQuotaField($R,'yg','guan1');
                $guan1_zc=$sf1/10;
                $dagu_zc=10-$guan1_zc-$sj/10-$sf/10;

                $arr1=[
                    'num'=>$num1,
                    'username'=>$username,
                    'kithe'=>getKitheNum(),
                    'adddate'=>$date,
                    'class1'=>$class11,
                    'class2'=>$class22,
                    'class3'=>$class33,
                    'rate'=>$rate,
                    'sum_m'=>$sum_m2,
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
                if(!Db::name('tan')->insert() || !Db::name('bl')->where(['class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->setInc('gold',$sum_m2))$this->error('代理数据库修改出错',$urlurl);
            }
        }

        //总代理
        $row6=Db::name('guan')->where(['kauser'=>$zong])->find();
        $best=$row6['best'];
        $pz=$row6['pz'];
        $sj=$row6['sj'];
        $sf=$row6['sf'];
        $cs=$row6['cs'];
        $danid=$row6['id'];
        switch($bl['class1']){
            case '特码':
                switch($bl['class3']){
                    case "单":
                    case '双':
                    case '家禽':
                    case "野兽":
                    case "大":
                    case "小":
                    case "合单":
                    case "合双":
                    case "红波":
                    case "绿波":
                    case "蓝波":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['tm1'];
                        break;
                }
                break;
            case "正码":
                switch($bl['class3']){
                    case "总单":
                    case "总双":
                    case "总大":
                    case "总小":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['zm1'];
                        break;
                }
                break;
            case "五行":
                $ffff=$row6['wx1'];
                break;
            case "生肖":
                switch ($class22){
                    case "一肖":
                        $ffff=$row6['yx1'];
                        break;
                    default:
                        $ffff=$row6['sx1'];
                        break;
                }
                break;
            case "不中":
                $ffff=$row6['qbz1'];
                break;
            case "半波":
                $ffff=$row6['bb1'];
                break;
            case "正特":
                switch ($bl['class3']){
                    case "单":
                    case "双":
                    case "大":
                    case "小":
                    case "合单":
                    case "合双":
                    case "红波":
                    case "绿波":
                    case "蓝波":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['zt1'];
                        break;
                }
                break;
            case "尾数":
                $ffff=$row6['ws1'];
                break;
            default:
                $ffff=$row6['ws1'];
                break;
        }
        if ($pz==0 and $best==1 and $ffff>=0){
            //占成
            $res1=Db::name('tan')->field(['sum(sum_m*zong_zc/10) sum_m'])->where(['kithe'=>getKitheNum(),'zong'=>$zong,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            if($res[0]['sum'])$sum_mff=$res[0]['sum'];
            else $sum_mff=0;
            //已补
            $res2=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re'])->where(['kithe'=>getKitheNum(),'username'=>$zong,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            if(!$res2[0]['sum_m'])$sum_mfll=0;
            else $sum_mfll=$res2[0]['sum_m'];
            $sum_m2=$sum_mff-$sum_mfll-$ffff;
            //总代余额
            $res3=Db::name('guan')->where(['lx'=>3,'zongid'=>$zongid])->field('sum(cs) sum_m11')->order(['id'=>'desc'])->select();
            if($res3[0]['sum_m11'])$mumu111=$res3[0]['sum_m11'];
            else $mumu111=0;

            $res4=Db::name('tan')->field(['sum(sum_m) sum_m1'])->where(['kithe'=>getKitheNum(),'username'=>$zong])->order(['id'=>'desc'])->select();
            if($res4[0]['sum_m1'])$mkmk11=$res4[0]['sum_m1'];
            else $mkmk11=0;
            $sum_sumz=$cs-$mkmk11-$mumu111;
            $smsmi=$sum_sumz-$sum_m2;
            if ($sum_m2>=1 and $ffff>=0 and $smsmi>=0){
                //总代补
                $username=$zong;
                $rate=$bl['rate'];
                $user_ds=getQuotaField($R,'yg',$zong);
                $dai_ds=getQuotaField($R,'yg',$zong);
                $zong_ds=getQuotaField($R,'yg',$zong);
                $guan_ds=getQuotaField($R,'yg',$guan);
                $dai_zc=0;
                $zong_zc=0;
                $guan_zc=$sj/10;
                $dagu_zc=10-$sj/10;

                $dai=getMemField("zong");
                $zong=getMemField("zong");
                $guan=getMemField("guan");
                $danid=getMemField("zongid");
                $zongid=getMemField("zongid");
                $guanid=getMemField("guanid");
                $sum_m2=intval($sum_m2);
                $num1=randStr();

                $sf1=Db::name('guan')->where(['kauser'=>$guan])->value('sj');
                $guan1_ds=getQuotaField($R,'yg','guan1');
                $guan1=getMemField('guan1');
                $guan1_zc=$sf1/10;
                $dagu_zc=10-$guan1_zc-$sj/10;
                $arr1=[
                    'num'=>$num1,
                    'username'=>$username,
                    'kithe'=>getKitheNum(),
                    'adddate'=>$date,
                    'class1'=>$class11,
                    'class2'=>$class22,
                    'class3'=>$class33,
                    'rate'=>$rate,
                    'sum_m'=>$sum_m2,
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
                if(!Db::name('tan')->insert($arr1) || !Db::name('bl')->where(['class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->setInc('gold',$sum_m2))$this->error('总代理数据库修改出错',$urlurl);
            }
        }

        //股东
        $row6=Db::name('guan')->where(['kauser'=>$guan])->find();
        $best=$row6['best'];
        $pz=$row6['pz'];
        $sj=$row6['sj'];
        $sf=$row6['sf'];
        $cs=$row6['cs'];
        $danid=$row6['id'];
        switch ($bl['class1']){
            case "特码":
                switch ($bl['class3']){
                    case "单":
                        $ffff=$row6['xx1'];
                        break;
                    case "双":
                        $ffff=$row6['xx1'];
                        break;
                    case "家禽":
                        $ffff=$row6['xx1'];
                        break;
                    case "野兽":
                        $ffff=$row6['xx1'];
                        break;
                    case "大":
                        $ffff=$row6['xx1'];
                        break;
                    case "小":
                        $ffff=$row6['xx1'];
                        break;
                    case "合单":
                        $ffff=$row6['xx1'];
                        break;
                    case "合双":
                        $ffff=$row6['xx1'];
                        break;
                    case "红波":
                        $ffff=$row6['xx1'];
                        break;
                    case "绿波":
                        $ffff=$row6['xx1'];
                        break;
                    case "蓝波":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['tm1'];
                        break;
                }
                break;
            case "正码":
                switch ($bl['class3']){
                    case "总单":
                        $ffff=$row6['xx1'];
                        break;
                    case "总双":
                        $ffff=$row6['xx1'];
                        break;
                    case "总大":
                        $ffff=$row6['xx1'];
                        break;
                    case "总小":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['zm1'];
                        break;
                }
                break;
            case "五行":
                $ffff=$row6['wx1'];
                break;
            case "生肖":
                switch ($class22){
                    case "一肖":
                        $ffff=$row6['yx1'];
                        break;
                    default:
                        $ffff=$row6['sx1'];
                        break;
                }
                break;
            case "不中":
                $ffff=$row6['qbz1'];
                break;
            case "半波":
                $ffff=$row6['bb1'];
                break;
            case "正特":
                switch ($bl['class3']){
                    case "单":
                        $ffff=$row6['xx1'];
                        break;
                    case "双":
                        $ffff=$row6['xx1'];
                        break;
                    case "大":
                        $ffff=$row6['xx1'];
                        break;
                    case "小":
                        $ffff=$row6['xx1'];
                        break;
                    case "合单":
                        $ffff=$row6['xx1'];
                        break;
                    case "合双":
                        $ffff=$row6['xx1'];
                        break;
                    case "红波":
                        $ffff=$row6['xx1'];
                        break;
                    case "绿波":
                        $ffff=$row6['xx1'];
                        break;
                    case "蓝波":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['zt1'];
                        break;
                }
                break;
            case "尾数":
                $ffff=$row6['ws1'];
                break;
            case "尾数连":
                $ffff=$row6['wsl1'];
                break;
            default:
                $ffff=$row6['ws1'];
                break;
        }
        if ($pz==0 and $best==1 and $ffff>=0){
            //占成
            $res1=Db::name('tan')->field(['sum(sum_m*guan_zc/10) sum_m'])->where(['kithe'=>getKitheNum(),'guan'=>$guan,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            if($res[0]['sum'])$sum_mff=$res[0]['sum'];
            else $sum_mff=0;
            //已补
            $res2=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re'])->where(['kithe'=>getKitheNum(),'username'=>$guan,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            if(!$res2[0]['sum_m'])$sum_mfll=0;
            else $sum_mfll=$res2[0]['sum_m'];
            $sum_m2=$sum_mff-$sum_mfll-$ffff;
            //股东余额
            $res3=Db::name('guan')->where(['lx'=>2,'guanid'=>$guanid])->field('sum(cs) sum_m11')->order(['id'=>'desc'])->select();
            if($res3[0]['sum_m11'])$mumu111=$res3[0]['sum_m11'];
            else $mumu111=0;

            $res4=Db::name('tan')->field(['sum(sum_m) sum_m1'])->where(['kithe'=>getKitheNum(),'username'=>$guan])->order(['id'=>'desc'])->select();
            if($res4[0]['sum_m1'])$mkmk11=$res4[0]['sum_m1'];
            else $mkmk11=0;
            $sum_sumz=$cs-$mkmk11-$mumu111;
            $smsmi=$sum_sumz-$sum_m2;
            if ($sum_m2>=1 and $ffff>=0 and $smsmi>=0){
                //代理补
                $username=$guan;
                $rate=$bl['rate'];
                $user_ds=getQuotaField($R,'yg',$zong);
                $dai_ds=getQuotaField($R,'yg',$zong);
                $zong_ds=getQuotaField($R,'yg',$zong);
                $guan_ds=getQuotaField($R,'yg',$guan);
                $dai_zc=0;
                $zong_zc=0;
                $guan_zc=$sj/10;
                $dagu_zc=10-$sj/10;

                $dai=getMemField("zong");
                $zong=getMemField("zong");
                $guan=getMemField("guan");
                $danid=getMemField("zongid");
                $zongid=getMemField("zongid");
                $guanid=getMemField("guanid");
                $sum_m2=intval($sum_m2);
                $num1=randStr();

                $guan1_ds=getQuotaField($R,'yg','guan1');
                $guan1=getMemField('guan1');
                $guan1_zc=$sj/10;
                $dagu_zc=10-$guan1_zc;
                $arr1=[
                    'num'=>$num1,
                    'username'=>$username,
                    'kithe'=>getKitheNum(),
                    'adddate'=>$date,
                    'class1'=>$class11,
                    'class2'=>$class22,
                    'class3'=>$class33,
                    'rate'=>$rate,
                    'sum_m'=>$sum_m2,
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
                if(!Db::name('tan')->insert($arr1) || !Db::name('bl')->where(['class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->setInc('gold',$sum_m2)){
                    $this->redirect('index/errorPage',['msg'=>'数据库修改出错']);
                };
            }
        }

        //大股东
        $row6=Db::name('guan')->where(['kauser'=>$guan1])->find();
        $best=$row6['best'];
        $pz=$row6['pz'];
        $sj=$row6['sj'];
        $sf=$row6['sf'];
        $cs=$row6['cs'];
        $danid=$row6['id'];
        switch ($bl['class1']){
            case "特码":
                switch ($bl['class3']){
                    case "单":
                        $ffff=$row6['xx1'];
                        break;
                    case "双":
                        $ffff=$row6['xx1'];
                        break;
                    case "家禽":
                        $ffff=$row6['xx1'];
                        break;
                    case "野兽":
                        $ffff=$row6['xx1'];
                        break;
                    case "大":
                        $ffff=$row6['xx1'];
                        break;
                    case "小":
                        $ffff=$row6['xx1'];
                        break;
                    case "合单":
                        $ffff=$row6['xx1'];
                        break;
                    case "合双":
                        $ffff=$row6['xx1'];
                        break;
                    case "红波":
                        $ffff=$row6['xx1'];
                        break;
                    case "绿波":
                        $ffff=$row6['xx1'];
                        break;
                    case "蓝波":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['tm1'];
                        break;
                }
                break;
            case "正码":
                switch ($bl['class3']){
                    case "总单":
                        $ffff=$row6['xx1'];
                        break;
                    case "总双":
                        $ffff=$row6['xx1'];
                        break;
                    case "总大":
                        $ffff=$row6['xx1'];
                        break;
                    case "总小":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['zm1'];
                        break;
                }
                break;
            case "五行":
                $ffff=$row6['wx1'];
                break;
            case "生肖":
                switch ($class22){
                    case "一肖":
                        $ffff=$row6['yx1'];
                        break;
                    default:
                        $ffff=$row6['sx1'];
                        break;
                }
                break;
            case "不中":
                $ffff=$row6['qbz1'];
                break;
            case "半波":
                $ffff=$row6['bb1'];
                break;
            case "正特":
                switch ($bl['class3']){
                    case "单":
                        $ffff=$row6['xx1'];
                        break;
                    case "双":
                        $ffff=$row6['xx1'];
                        break;
                    case "大":
                        $ffff=$row6['xx1'];
                        break;
                    case "小":
                        $ffff=$row6['xx1'];
                        break;
                    case "合单":
                        $ffff=$row6['xx1'];
                        break;
                    case "合双":
                        $ffff=$row6['xx1'];
                        break;
                    case "红波":
                        $ffff=$row6['xx1'];
                        break;
                    case "绿波":
                        $ffff=$row6['xx1'];
                        break;
                    case "蓝波":
                        $ffff=$row6['xx1'];
                        break;
                    default:
                        $ffff=$row6['zt1'];
                        break;
                }
                break;
            case "尾数":
                $ffff=$row6['ws1'];
                break;
            case "尾数连":
                $ffff=$row6['wsl1'];
                break;
            default:
                $ffff=$row6['ws1'];
                break;
        }
        if ($pz==0 and $best==1 and $ffff>=0){
            //占成
            $res1=Db::name('tan')->field(['sum(sum_m*guan1_zc/10) sum_m'])->where(['kithe'=>getKitheNum(),'guan1'=>$guan1,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            if($res[0]['sum'])$sum_mff=$res[0]['sum'];
            else $sum_mff=0;
            //已补
            $res2=Db::name('tan')->field(['sum(sum_m) sum_m','count(*) re'])->where(['kithe'=>getKitheNum(),'username'=>$guan1,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
            if(!$res2[0]['sum_m'])$sum_mfll=0;
            else $sum_mfll=$res2[0]['sum_m'];
            $sum_m2=$sum_mff-$sum_mfll-$ffff;
            //大股东余额
            $res3=Db::name('guan')->where(['lx'=>1,'guanid'=>$guanid1])->field('sum(cs) sum_m11')->order(['id'=>'desc'])->select();
            if($res3[0]['sum_m11'])$mumu111=$res3[0]['sum_m11'];
            else $mumu111=0;

            $res4=Db::name('tan')->field(['sum(sum_m) sum_m1'])->where(['kithe'=>getKitheNum(),'username'=>$guan1])->order(['id'=>'desc'])->select();
            if($res4[0]['sum_m1'])$mkmk11=$res4[0]['sum_m1'];
            else $mkmk11=0;
            $sum_sumz=$cs-$mkmk11-$mumu111;
            $smsmi=$sum_sumz-$sum_m2;
            if ($sum_m2>=1 and $ffff>=0 and $smsmi>=0){
                //大股东补
                $username=$guan1;
                $rate=$bl['rate'];
                $user_ds=getQuotaField($R,'yg','guan1');
                $dai_ds=getQuotaField($R,'yg','guan1');
                $zong_ds=getQuotaField($R,'yg','guan1');
                $guan_ds=getQuotaField($R,'yg','guan1');
                $dai_zc=0;
                $zong_zc=0;
                $guan_zc=$sj/10;
                $dagu_zc=10-$sj/10;

                $dai=getMemField("zong");
                $zong=getMemField("zong");
                $guan=getMemField("guan");
                $danid=getMemField("zongid");
                $zongid=getMemField("zongid");
                $guanid=getMemField("guanid");
                $sum_m2=intval($sum_m2);
                $num1=randStr();

                $guan1_ds=getQuotaField($R,'yg','guan1');
                $guan1=getMemField('guan1');
                $guan1_zc=0;
                $dagu_zc=10;
                $arr1=[
                    'num'=>$num1,
                    'username'=>$username,
                    'kithe'=>getKitheNum(),
                    'adddate'=>$date,
                    'class1'=>$class11,
                    'class2'=>$class22,
                    'class3'=>$class33,
                    'rate'=>$rate,
                    'sum_m'=>$sum_m2,
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
                if(!Db::name('tan')->insert($arr1) || !Db::name('bl')->where(['class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->setInc('gold',$sum_m2)){
                    $this->redirect('index/errorPage',['msg'=>'数据库修改出错']);
                };
            }
        }
        $param=[
            'gold'=>input('gold'),
            'class22'=>$class22,
            'class33'=>$class33,
            'rate5'=>$rate5,
            'sum_m'=>$sum_m,
            'order'=>$order,
            'url'=>input('from_url'),
        ];
        return $this->fetch('',$param);

//        'class2'=>input('class2'),
//            'min_bl'=>input('min_bl'),  //最小赔率
//            'number1'=>$number1,               //暂时是生肖之间用,连接的字符串
//            'Num_1'=>input('Num_1'),    //投注金额
//            'xx'=>getQuotaField($R,'xx'),         //单注限额
//            'xxx'=>getQuotaField($R,'xxx'),         //单号限额
//            'rate_id'=>$rate_id,                //赔率表的rate_id
//            'ratex'=>$bl['rate'],               //赔率
//            'sum'=>$sum,                        //当前期的总下注金额
    }


    /**
     * 显示当前用户所有订单信息
     */
    public function getUserOrder(){
        return $this->fetch();
    }

    public function getData(){
        if(!$this->request->has('act')|| input('act')!='ajax')return json(['code'=>0, 'msg'=>'', 'count'=>0, 'data'=>'']);
        return $this->query($this->request->param());
    }

    private function query($query){
        $sess=session('lhc_index');
        $limit=$query['limit'];
        $start=$query['limit']*($query['page']-1);
        $count=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$sess['kauser']])->count();
        $result=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$sess['kauser']])->limit($start,$limit)->order(['id'=>'desc'])->select();
        $re=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$sess['kauser']])->limit($start,$limit)->order(['id'=>'desc'])->fetchSql();
        //数据优化
        if($result){
            foreach ($result as $k=>$v){
                $result[$k]['content']=$v['class2'].'&nbsp;&nbsp;'.$v['class3'];
            }
        }
        return json([

            'code'=>0,
            'msg'=>'',
            "page" => $query['page'],
            "pagesize" =>$query['limit'],
            'sql'=>$re,
            'count'=>$count,
            'data'=>$result
        ]);
    }

    //特码
    public function tm(){
        $class1='特码';
        if(input('?ids'))$ids='特A';else $ids=input('ids');
        if ($ids=="特A"){
            $xc=0;
            $z2color="000000";
            $z1color="ff6600";
        }else{
            $xc=1;
            $z1color="000000";
            $z2color="ff6600";
        }
        $XF=11;
        $param=[
            'tab32'=>getKithe(32),

        ];
        return $this->fetch('',$param);
    }

    //半波
    public function kbb(){
        $ids='半波';
        $xc=11;
        $XF=25;
        $this->fp($XF);
        $mmid=13;

        $res=Db::name('bl')->alias('b')->join('ka_sxnumber n','n.sx=b.class3')->field(['b.id','b.class3','n.m_number'])->where(['b.class2'=>$ids])->select();
        if(!$res)$this->error('当前下注类型不存在');
        foreach ($res as $k=>$v){
            $res[$k]['m_number']=explode(',',$v['m_number']);
        }
        $param=[
            'ids'=>$ids,        // 二级分类名称
            'res'=>$res,        //class2=半波的所有三级分类
            'xc'=>$xc,
            'abcd'=>getMemField('abcd'),
        ];
        return $this->fetch('',$param);

    }

    //确认订单   n1.php?class2=
    public function kbbSubmit(){
        if(!input('?class2'))$this->error('非法访问');
        $total1=0;
        $url=input('?from_url') ? input('from_url') :  '';
        switch (input('class2')){
            case "特A":
                $XF=11;
                $mumu=0;
                $urlurl=url('k_tm',['ids'=>'特A']);
                $numm=66;
                break;
            case "特B" :
                $XF=11;
                $mumu=58;
                $numm=66;
                $urlurl=url('k_tm',['ids'=>'特B']);

                break;
            case "正A":
                $XF=15;
                $mumu=464;
                $urlurl=url('k_zm',['ids'=>'正A']);
                $numm=58;
                break;
            case "正B":
                $XF=15;
                $mumu=517;
                $numm=58;
                $urlurl=url('k_zm',['ids'=>'正B']);
                break;

            case "正1特":
                $XF=13;
                $mumu=116;
                $urlurl=url('k_zt',['ids'=>'正1特']);
                $numm=60;
                break;

            case "正2特":
                $XF=13;
                $mumu=174;
                $urlurl=url('k_zt',['ids'=>'正2特']);
                $numm=60;
                break;

            case "正3特":
                $XF=13;
                $mumu=232;
                $urlurl=url('k_zt',['ids'=>'正3特']);
                $numm=60;
                break;
            case "正4特":
                $XF=13;
                $mumu=290;
                $urlurl=url('k_zt',['ids'=>'正4特']);
                $numm=60;
                break;

            case "正5特":
                $XF=13;
                $mumu=348;
                $urlurl=url('k_zt',['ids'=>'正5特']);
                $numm=60;
                break;

            case "正6特":
                $XF=13;
                $mumu=406;
                $urlurl=url('k_zt',['ids'=>'正6特']);
                $numm=60;
                break;

            case "正1-6":
                $XF=13;
                $mumu=570;
                $urlurl=url('k_zm6',['ids'=>'正1-6']);
                $numm=78;
                break;

            case "五行":
                $XF=17;
                $mumu=712;
                $urlurl=url('k_wx',['ids'=>'五行']);
                $numm=5;

                break;

            case "半波":
                $XF=25;
                $mumu=661;
                $urlurl=url('kbb',['ids'=>'半波']);
                $numm=18;
                break;

            case "半半波":
                $XF=25;
                $mumu=751;
                $urlurl=url('k_bbb',['ids'=>'半半波']);
                $numm=12;
                break;

            case "正肖":
                $XF=25;
                $mumu=782;
                $urlurl=url('k_qsb',['ids'=>'正肖']);
                $numm=12;
                break;

            case "七色波":
                $XF=25;
                $mumu=778;
                $urlurl=url('k_qsb',['ids'=>'正肖']);
                $numm=4;
                break;

            case "尾数":
                $XF=27;
                $mumu=689;
                $urlurl=url('k_ws',['ids'=>'尾数']);
                $numm=79;
                break;
            case "特肖":
                $XF=23;
                $mumu=673;
                $urlurl=url('k_sx',['ids'=>'特肖']);
                $numm=12;
                break;

            case "一肖":
                $XF=23;
                $mumu=699;
                $urlurl=url('k_sxp',['ids'=>'一肖']);
                $numm=12;
                break;

            case "正特尾数":
                $XF=23;
                $mumu=768;
                $urlurl=url('k_sxp',['ids'=>'一肖']);
                $numm=10;
                break;

            case "过关":
                $XF=19;
                break;
            case "连码":
                $XF=21;

                break;
            default:
                $mumu=0;
                $numm=58;
                $urlurl=url('k_tm',['ids'=>'特A']);
                $XF=11;
                break;
        }
        $this->fp($XF);     //判断是否封盘
        $res=[];
        $sum_sum=0;
        for($r=1;$r<=$numm;$r++){
            $res[$r]['num']=input('Num_'.$r.'/f');
            if(input('Num_'.$r)!='') {
                //判断一下当前金额是否为数字
                if(!is_numeric(input('Num_'.$r))){
                   $this->redirect('index/errorPage',[',sg'=>'输入金额有误，请关闭弹窗后重新输入金额']);
                }

                $sum_sum = $sum_sum + input('Num_' . $r.'/f');
                if ($r == 59 or $r == 60) {
                    if ($_POST['class2'] == "特A") {
                        $rate_id = $r + 687;
                    } else {
                        switch ($_GET['class2']) {
                            case "正1特"://1034
                                $rate_id = $r + 975;
                                break;
                            case "正2特"://1045
                                $rate_id = $r + 1023;
                                if ($r == 59) {
                                    $rate_id = $r + 986;
                                }
                                break;
                            case "正3特"://1044
                                $rate_id = $r + 1024;
                                if ($r == 59) {
                                    $rate_id = $r + 985;
                                }
                                break;
                            case "正4特"://1043
                                $rate_id = $r + 1025;
                                if ($r == 59) {
                                    $rate_id = $r + 984;
                                }
                                break;
                            case "正5特"://1042
                                $rate_id = $r + 1026;
                                if ($r == 59) {
                                    $rate_id = $r + 983;
                                }
                                break;
                            case "正6特"://1041
                                $rate_id = $r + 1027;
                                if ($r == 59) {
                                    $rate_id = $r + 982;
                                }
                                break;
                            default:
                                $rate_id = $r + 689;
                        }
                    }
                } else {
                    if (input('class2') == "半波" && $r >= 13) {
                        $rate_id = $r + 705;
                    } else {
                        $rate_id = $r + $mumu;
                    }
                }
                if ($r == 61) {
                    if (input('class2') == "特A") {
                        $rate_id = 795;
                    } else {
                        $rate_id = 801;
                    }
                }
                if ($r == 62) {
                    if (input('class2') == "特A") {
                        $rate_id = 796;
                    } else {
                        $rate_id = 802;
                    }
                }
                if ($r == 63) {
                    if (input('class2') == "特A") {
                        $rate_id = 797;
                    } else {
                        $rate_id = 803;
                    }
                }
                if ($r == 64) {
                    if (input('class2') == "特A") {
                        $rate_id = 798;
                    } else {
                        $rate_id = 804;
                    }
                }
                if ($r == 65) {
                    if (input('class2') == "特A") {
                        $rate_id = 799;
                    } else {
                        $rate_id = 805;
                    }
                }
                if ($r == 66) {
                    if (input('class2') == "特A") {
                        $rate_id = 800;
                    } else {
                        $rate_id = 806;
                    }
                }
                if (input('class2') == "正1-6") {
                    if ($r >= 1 && $r <= 7) {
                        $rate_id = $r + $mumu;
                    } elseif ($r >= 14 && $r <= 20) {
                        $rate_id = ($r - 6) + $mumu;
                    } elseif ($r >= 27 && $r <= 33) {
                        $rate_id = ($r - 12) + $mumu;
                    } elseif ($r >= 40 && $r <= 46) {
                        $rate_id = ($r - 18) + $mumu;
                    } elseif ($r >= 53 && $r <= 59) {
                        $rate_id = ($r - 24) + $mumu;
                    } elseif ($r >= 66 && $r <= 72) {
                        $rate_id = ($r - 30) + $mumu;
                    } elseif ($r >= 8 && $r <= 13) {
                        $rate_id = $r + 1039;
                    } elseif ($r >= 21 && $r <= 26) {
                        $rate_id = ($r - 7) + 1039;
                    } elseif ($r >= 34 && $r <= 39) {
                        $rate_id = ($r - 14) + 1039;
                    } elseif ($r >= 47 && $r <= 52) {
                        $rate_id = ($r - 21) + 1039;
                    } elseif ($r >= 60 && $r <= 65) {
                        $rate_id = ($r - 28) + 1039;
                    } elseif ($r >= 73 && $r <= 78) {
                        $rate_id = ($r - 35) + 1039;
                    }
                }
                $bl = getBlById($rate_id);        //  ka_bl表一条信息
                if ($bl['class1'] == "特码" and $r <= 49) {
                    //超过单期
                    $sum_m55 = getTanKitheSum($bl['class1'], $bl['class2'], $bl['class3']);
                    if (($sum_m55 + input('Num_' . $r.'/f')) > $bl['xr'] or $bl['locked'] == 1) {
                        $this->redirect('index/errorPage',['msg'=>'对不起，["' . $bl['class3'] .' "号]暂停下注.请反回重新选择!']);
                    }
                }
                if ($bl['locked'] == 1) {
                    $this->redirect('index/errorPage',['msg'=>'对不起，["' . $bl['class3'] .' "号]暂停下注.请反回重新选择!']);
                }
                $res[$r]['class2']=$bl['class2'];
                $res[$r]['class3']=$bl['class3'];
                $btmdx=getConfigField('btmdx');
                $ctmdx=getConfigField('ctmdx');
                $dtmdx=getConfigField('dtmdx');
                $bzmdx=getConfigField('bzmdx');
                $czmdx=getConfigField('czmdx');
                $dzmdx=getConfigField('dzmdx');
                $bmmm=0;
                $cmmm=0;
                $dmmm=0;
                $bbb=getConfigField('bbb');
                $cbb=getConfigField('cbb');
                $dbb=getConfigField('dbb');
                $bztdx=getConfigField('bztdx');
                $cztdx=getConfigField('cztdx');
                $dztdx=getConfigField('dztdx');
                switch ($bl['class1']){
                    case "特码":
                        switch ($bl['class3']){
                            case "单":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;
                                break;
                            case "双":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;
                                break;
                            case "家禽":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;
                                break;
                            case "野兽":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;
                                break;
                            case "大":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;
                                break;
                            case "小":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;
                                break;
                            case "合单":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;
                                break;
                            case "合双":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;
                                break;
                            case "红波":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;
                                break;
                            case "绿波":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;
                                break;

                            case "蓝波":
                                $bmmm=$btmdx;
                                $cmmm=$ctmdx;
                                $dmmm=$dtmdx;

                                break;
                            default:
                                $bmmm=getConfigField('btm');
                                $cmmm=getConfigField('ctm');
                                $dmmm=getConfigField('dtm');
                                break;
                        }
                        break;
                    case "正码":
                        switch ($bl['class3']){
                            case "总单":
                                $bmmm=$bzmdx;
                                $cmmm=$czmdx;
                                $dmmm=$dzmdx;
                                break;
                            case "总双":
                                $bmmm=$bzmdx;
                                $cmmm=$czmdx;
                                $dmmm=$dzmdx;
                                break;

                            case "总大":
                                $bmmm=$bzmdx;
                                $cmmm=$czmdx;
                                $dmmm=$dzmdx;
                                break;
                            case "总小":
                                $bmmm=$bzmdx;
                                $cmmm=$czmdx;
                                $dmmm=$dzmdx;
                                break;
                            default:
                                $bmmm=$bmmm;
                                $cmmm=$cmmm;
                                $dmmm=$dmmm;
                                break;
                        }
                        break;
                    case "五行":
                        $bmmm=getConfigField('bzm6');
                        $cmmm=getConfigField('czm6');
                        $dmmm=getConfigField('dzm6');
                        break;
                    case "生肖":
                        switch ($bl['class2']){
                            case "特肖":
                                $bmmm=getConfigField('bsx');
                                $cmmm=getConfigField('csx');
                                $dmmm=getConfigField('dsx');
                                break;
                            case "四肖":
                                $bmmm=0;
                                $cmmm=0;
                                $dmmm=0;
                                break;
                            case "五肖":
                                $bmmm=0;
                                $cmmm=0;
                                $dmmm=0;
                                break;
                            case "六肖":
                                $bmmm=getConfigField('bsx6');
                                $cmmm=getConfigField('csx6');
                                $dmmm=getConfigField('dsx6');
                                break;
                            case "一肖":
                                $bmmm=getConfigField('bsxp');
                                $cmmm=getConfigField('csxp');
                                $dmmm=getConfigField('dsxp');
                                break;
                                break;
                            default:
                                $bmmm=getConfigField('bsxp');
                                $cmmm=getConfigField('csxp');
                                $dmmm=getConfigField('dsxp');
                                break;
                        }
                        break;
                    case "正特尾数":
                        $bmmm=0;
                        $cmmm=0;
                        $dmmm=0;
                        break;
                    case "半波":
                        $bmmm=$bbb;
                        $cmmm=$cbb;
                        $dmmm=$dbb;
                        break;
                    case "半半波":
                        $bmmm=$bbb;
                        $cmmm=$cbb;
                        $dmmm=$dbb;
                        break;
                    case "正肖":
                        $bmmm=$bbb;
                        $cmmm=$cbb;
                        $dmmm=$dbb;
                        break;
                    case "七色波":
                        $bmmm=$bbb;
                        $cmmm=$cbb;
                        $dmmm=$dbb;
                        break;
                    case "正特":
                        switch ($bl['class3']){
                            case "单":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "双":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "大":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "小":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "合单":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "合双":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;

                            case "红波":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "绿波":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "蓝波":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            default:
                                $bmmm=getConfigField('bzt');
                                $cmmm=getConfigField('czt');
                                $dmmm=getConfigField('dzt');
                                break;
                        }
                        break;
                    case "正1-6":
                        switch ($bl['class3']){
                            case "单":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "双":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "大":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "小":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "合单":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "合双":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "红波":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "绿波":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "蓝波":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "合大":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "合小":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "合单":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "合双":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "尾大":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            case "尾小":
                                $bmmm=$bztdx;
                                $cmmm=$cztdx;
                                $dmmm=$dztdx;
                                break;
                            default:
                                $bmmm=getConfigField('bzt');
                                $cmmm=getConfigField('czt');
                                $dmmm=getConfigField('dzt');
                                break;
                        }
                        break;
                    case "尾数":
                        $bmmm=0;
                        $cmmm=0;
                        $dmmm=0;
                        break;
                    default:
                        $bmmm=0;
                        $cmmm=0;
                        $dmmm=0;
                        break;
                }
                switch (getMemField("abcd")){
                    case "A":
                        $res[$r]['rate']= $bl['rate'];
                        break;
                    case "B":
                        $res[$r]['rate']=$bl['rate']-$bmmm;
                        break;
                    case "C":
                        $res[$r]['rate']=$bl['rate']-$cmmm;
                        break;
                    case "D":
                        $res[$r]['rate']=$bl['rate']-$dmmm;
                        break;
                    default:
                        $res[$r]['rate']=$bl['rate'];
                        break;
                }
                $total1+=input('Num_'.$r.'/f');
            }
        }
        if($total1>getMemField('ts')){
            $this->redirect('index/errorPage',['msg'=>'对不起，下注总额不能大于可用信用额']);
        }
        if($total1<getMemField('xy')){
            $this->redirect('index/errorPage',['msg'=>'对不起，下注金额不可小於最低限度'.getMemField('xy')]);
        }
        if($total1>getQuotaField(input('xc'),'xx')){
            $this->redirect('index/errorPage',['msg'=>'对不起，下注金额已超过单注限额'.getQuotaField(input('xc','xx'))]);
        }
        return $this->fetch('',[
            'total'=>$total1,
            'res'=>$res,
            'numm'=>$numm+1,
            'urlurl'=>$urlurl,
            'class2'=>input('class2'),
            'url'=>$url
        ]);
    }

    //数据保存
    public function saveKbb(){
        if(!input('?class2'))$this->redirect('index/errorPage',['msg'=>'非法访问']);

        switch (input('class2')){
            case "特A":
                $XF=11;
                $mumu=0;
                $urlurl=url('k_tm',['ids'=>'特A']);
                $numm=66;
                break;
            case "特B" :
                $XF=11;
                $mumu=58;
                $numm=66;
                $urlurl=url('k_tm',['ids'=>'特B']);

                break;
            case "正A":
                $XF=15;
                $mumu=464;
                $urlurl=url('k_zm',['ids'=>'正A']);
                $numm=58;
                break;
            case "正B":
                $XF=15;
                $mumu=517;
                $numm=58;
                $urlurl=url('k_zm',['ids'=>'正B']);
                break;

            case "正1特":
                $XF=13;
                $mumu=116;
                $urlurl=url('k_zt',['ids'=>'正1特']);
                $numm=60;
                break;

            case "正2特":
                $XF=13;
                $mumu=174;
                $urlurl=url('k_zt',['ids'=>'正2特']);
                $numm=60;
                break;

            case "正3特":
                $XF=13;
                $mumu=232;
                $urlurl=url('k_zt',['ids'=>'正3特']);
                $numm=60;
                break;

            case "正4特":
                $XF=13;
                $mumu=290;
                $urlurl=url('k_zt',['ids'=>'正4特']);
                $numm=60;
                break;

            case "正5特":
                $XF=13;
                $mumu=348;
                $urlurl=url('k_zt',['ids'=>'正5特']);
                $numm=60;
                break;

            case "正6特":
                $XF=13;
                $mumu=406;
                $urlurl=url('k_zt',['ids'=>'正6特']);
                $numm=60;
                break;
            case "正1-6":
                $XF=13;
                $mumu=570;
                $urlurl=url('k_zm6',['ids'=>'正1-6']);
                $numm=78;
                break;
            case "五行":
                $XF=17;
                $mumu=712;
                $urlurl=url('k_tm',['ids'=>'五行']);
                $numm=5;

                break;

            case "半波":
                $XF=25;
                $mumu=661;
                $urlurl=url('kbb',['ids'=>'半波']);
                $numm=18;
                break;
            case "半半波":
                $XF=25;
                $mumu=751;
                $urlurl=url('k_bbb',['ids'=>'半半波']);
                $numm=12;
                break;

            case "正肖":
                $XF=25;
                $mumu=782;
                $urlurl=url('k_qsb',['ids'=>'正肖']);
                $numm=12;
                break;
            case "七色波":
                $XF=25;
                $mumu=778;
                $urlurl=url('k_qsb',['ids'=>'正肖']);
                $numm=4;
                break;

            case "尾数":
                $XF=27;
                $mumu=689;
                $urlurl=url('k_ws',['ids'=>'尾数']);
                $numm=79;
                break;
            case "特肖":
                $XF=23;
                $mumu=673;
                $urlurl=url('k_sx',['ids'=>'特肖']);
                $numm=12;
                break;

            case "一肖":
                $XF=23;
                $mumu=699;
                $urlurl=url('k_sxp',['ids'=>'一肖']);
                $numm=12;
                break;

            case "正特尾数":
                $XF=23;
                $mumu=768;
                $urlurl=url('k_sxp',['ids'=>'一肖']);
                $numm=12;
                break;

            case "过关":
                $XF=19;
                break;
            case "连码":
                $XF=21;

                break;
            default:
                $mumu=0;
                $numm=58;
                $urlurl=url('k_tm',['ids'=>'特A']);
                $XF=11;
                break;
        }
        $this->fp($XF);
        $sum_sum=0;
        $res=[];
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $arr=['code'=>0,'msg'=>''];
        for ($r=0;$r<=$numm;$r++){
            if (input('Num_'.$r)){
                $sum_sum=$sum_sum+input('Num_'.$r);
            }
            if ($sum_sum>getMemField("ts")){
                $this->redirect('index/errorPage',['msg'=>'对不起，下注总额不能大于可用信用额']);
            }
        }
        for ($r=0;$r<=$numm;$r++) {
            if (input('Num_' . $r)) {
                $res[$r]['num']=input('Num_'.$r);
                $sum_sum = $sum_sum + input('Num_' . $r);
                if ($r == 59 or $r == 60) {
                    if (input('class2') == "特A") {
                        $rate_id = $r + 687;
                    } else {
                        switch (input('class2')) {
                            case "正1特"://1034
                                $rate_id = $r + 975;
                                break;
                            case "正2特"://1045
                                $rate_id = $r + 1023;
                                if ($r == 59) {
                                    $rate_id = $r + 986;
                                }
                                break;
                            case "正3特"://1044
                                $rate_id = $r + 1024;
                                if ($r == 59) {
                                    $rate_id = $r + 985;
                                }
                                break;
                            case "正4特"://1043
                                $rate_id = $r + 1025;
                                if ($r == 59) {
                                    $rate_id = $r + 984;
                                }
                                break;
                            case "正5特"://1042
                                $rate_id = $r + 1026;
                                if ($r == 59) {
                                    $rate_id = $r + 983;
                                }
                                break;
                            case "正6特"://1041
                                $rate_id = $r + 1027;
                                if ($r == 59) {
                                    $rate_id = $r + 982;
                                }
                                break;
                            default:
                                $rate_id = $r + 689;
                        }

                    }
                } else {
                    if (input('class2') == "半波" && $r >= 13) {
                        $rate_id = $r + 705;
                    } else {
                        $rate_id = $r + $mumu;
                    }
                }
                if ($r == 61) {
                    if (input('class2') == "特A") {
                        $rate_id = 795;
                    } else {
                        $rate_id = 801;
                    }
                }
                if ($r == 62) {
                    if (input('class2') == "特A") {
                        $rate_id = 796;
                    } else {
                        $rate_id = 802;
                    }
                }
                if ($r == 63) {
                    if (input('class2') == "特A") {
                        $rate_id = 797;
                    } else {
                        $rate_id = 803;
                    }
                }
                if ($r == 64) {
                    if (input('class2') == "特A") {
                        $rate_id = 798;
                    } else {
                        $rate_id = 804;
                    }
                }
                if ($r == 65) {
                    if (input('class2') == "特A") {
                        $rate_id = 799;
                    } else {
                        $rate_id = 805;
                    }
                }
                if ($r == 66) {
                    if (input('class2') == "特A") {
                        $rate_id = 800;
                    } else {
                        $rate_id = 806;
                    }
                }
                if (input('class2') == "正1-6") {
                    if ($r >= 1 && $r <= 7) {
                        $rate_id = $r + $mumu;
                    } elseif ($r >= 14 && $r <= 20) {
                        $rate_id = ($r - 6) + $mumu;
                    } elseif ($r >= 27 && $r <= 33) {
                        $rate_id = ($r - 12) + $mumu;
                    } elseif ($r >= 40 && $r <= 46) {
                        $rate_id = ($r - 18) + $mumu;
                    } elseif ($r >= 53 && $r <= 59) {
                        $rate_id = ($r - 24) + $mumu;
                    } elseif ($r >= 66 && $r <= 72) {
                        $rate_id = ($r - 30) + $mumu;
                    } elseif ($r >= 8 && $r <= 13) {
                        $rate_id = $r + 1039;
                    } elseif ($r >= 21 && $r <= 26) {
                        $rate_id = ($r - 7) + 1039;
                    } elseif ($r >= 34 && $r <= 39) {
                        $rate_id = ($r - 14) + 1039;
                    } elseif ($r >= 47 && $r <= 52) {
                        $rate_id = ($r - 21) + 1039;
                    } elseif ($r >= 60 && $r <= 65) {
                        $rate_id = ($r - 28) + 1039;
                    } elseif ($r >= 73 && $r <= 78) {
                        $rate_id = ($r - 35) + 1039;
                    }
                }
                $btmdx = getConfigField('btmdx');
                $ctmdx = getConfigField('ctmdx');
                $dtmdx = getConfigField('dtmdx');
                $bzmdx = getConfigField('bzmdx');
                $czmdx = getConfigField('czmdx');
                $dzmdx = getConfigField('dzmdx');
                $bmmm = 0;
                $cmmm = 0;
                $dmmm = 0;
                $bbb = getConfigField('bbb');
                $cbb = getConfigField('cbb');
                $dbb = getConfigField('dbb');
                $bztdx = getConfigField('bztdx');
                $cztdx = getConfigField('cztdx');
                $dztdx = getConfigField('dztdx');
                $bsxp = getConfigField('bsxp');
                $csxp = getConfigField('csxp');
                $dsxp = getConfigField('dsxp');
                $bl = getBlById($rate_id);
                $res[$r]['class2']=$bl['class2'];
                $res[$r]['class3']=$bl['class3'];
                switch ($bl['class1']) {
                    case "特码":
                        switch ($bl['class3']) {
                            case "单":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 2;
                                $drop_sort = "单双";
                                break;

                            case "双":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 2;
                                $drop_sort = "单双";
                                break;

                            case "家禽":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 24;
                                $drop_sort = "家禽野兽";
                                break;

                            case "野兽":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 24;
                                $drop_sort = "家禽野兽";
                                break;

                            case "尾大":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 32;
                                $drop_sort = "尾大尾小";
                                break;

                            case "尾小":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 32;
                                $drop_sort = "尾大尾小";
                                break;

                            case "大单":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 33;
                                $drop_sort = "大单小单";
                                break;

                            case "小单":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 33;
                                $drop_sort = "大单小单";
                                break;

                            case "大双":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 34;
                                $drop_sort = "大双小双";
                                break;

                            case "小双":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 34;
                                $drop_sort = "大双小双";
                                break;


                            case "大":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 3;
                                $drop_sort = "大小";
                                break;

                            case "小":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 3;
                                $drop_sort = "大小";
                                break;

                            case "合单":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 4;
                                $drop_sort = "合数单双 ";
                                break;

                            case "合双":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 4;
                                $drop_sort = "合数单双 ";
                                break;

                            case "红波":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 10;
                                $drop_sort = "波色";

                                break;
                            case "绿波":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 10;
                                $drop_sort = "波色";
                                break;

                            case "蓝波":
                                $bmmm = $btmdx;
                                $cmmm = $ctmdx;
                                $dmmm = $dtmdx;
                                $R = 10;
                                $drop_sort = "波色";

                                break;
                            default:
                                $bmmm = getConfigField('btm');
                                $cmmm = getConfigField('ctm');
                                $dmmm = getConfigField('dtm');
                                if ($bl['class2'] == "特A") {
                                    $R = 0;
                                } else {
                                    $R = 1;
                                }
                                $drop_sort = "特码";

                                break;
                        }
                        break;
                    case "正码":
                        switch ($bl['class3']) {
                            case "总单":
                                $R = 8;
                                $drop_sort = "总数单双";
                                $bmmm = $bzmdx;
                                $cmmm = $czmdx;
                                $dmmm = $dzmdx;
                                break;

                            case "总双":
                                $R = 8;
                                $drop_sort = "总数单双";
                                $bmmm = $bzmdx;
                                $cmmm = $czmdx;
                                $dmmm = $dzmdx;
                                break;

                            case "总大":
                                $R = 9;
                                $drop_sort = "总数大小";
                                $bmmm = $bzmdx;
                                $cmmm = $czmdx;
                                $dmmm = $dzmdx;
                                break;

                            case "总小":
                                $R = 9;
                                $drop_sort = "总数大小";
                                $bmmm = $bzmdx;
                                $cmmm = $czmdx;
                                $dmmm = $dzmdx;

                                break;
                            default:

                                if ($bl['class2'] == "正A") {
                                    $R = 6;
                                } else {
                                    $R = 7;
                                }

                                $drop_sort = "正码";

                                $bmmm = getConfigField('bzm');
                                $cmmm = getConfigField('czm');
                                $dmmm = getConfigField('dzm');
                                break;
                        }
                        break;
                    case "五行":
                        $R = 25;
                        $drop_sort = "五行";
                        $bmmm = getConfigField('bzm6');
                        $cmmm = getConfigField('czm6');
                        $dmmm = getConfigField('dzm6');
                        break;
                    case "生肖":
                        switch ($bl['class2']) {
                            case "特肖":
                                $bmmm = getConfigField('bsx');
                                $cmmm = getConfigField('csx');
                                $dmmm = getConfigField('dsx');
                                $R = 18;
                                $drop_sort = "特肖";

                                break;
                            case "四肖":
                                $bmmm = 0;
                                $cmmm = 0;
                                $dmmm = 0;
                                $R = 19;
                                $drop_sort = "四肖";
                                break;

                            case "五肖":
                                $bmmm = 0;
                                $cmmm = 0;
                                $dmmm = 0;
                                $R = 20;
                                $drop_sort = "五肖";
                                break;

                            case "六肖":
                                $bmmm = getConfigField('bsx6');
                                $cmmm = getConfigField('csx6');
                                $dmmm = getConfigField('dsx6');
                                $R = 21;
                                $drop_sort = "六肖";
                                break;

                            case "一肖":
                                $bmmm = $bsxp;
                                $cmmm = $csxp;
                                $dmmm = $dsxp;
                                $R = 22;
                                $drop_sort = "一肖";
                                break;

                            case "正特尾数":
                                $bmmm = $bsxp;
                                $cmmm = $csxp;
                                $dmmm = $dsxp;
                                $R = 29;
                                $drop_sort = "正特尾数";
                                break;
                                break;
                            default:
                                $R = 18;
                                $drop_sort = "特肖";
                                $bmmm = $bsxp;
                                $cmmm = $csxp;
                                $dmmm = $dsxp;
                                break;
                        }
                        break;
                    case "半波":
                        $bmmm = $bbb;
                        $cmmm = $cbb;
                        $dmmm = $dbb;
                        $R = 11;
                        $drop_sort = "半波";
                        break;
                    case "半半波":
                        $bmmm = $bbb;
                        $cmmm = $cbb;
                        $dmmm = $dbb;
                        $R = 11;
                        $drop_sort = "半半波";
                    case "正肖":
                        $bmmm = $bbb;
                        $cmmm = $cbb;
                        $dmmm = $dbb;
                        $R = 11;
                        $drop_sort = "正肖";
                    case "七色波":
                        $bmmm = $bbb;
                        $cmmm = $cbb;
                        $dmmm = $dbb;
                        $R = 11;
                        $drop_sort = "七色波";
                        break;
                    case "正特":
                        switch ($bl['class3']) {
                            case "单":
                                $R = 2;
                                $drop_sort = "单双";
                                $bmmm = $bztdx;
                                $cmmm = $cztdx;
                                $dmmm = $dztdx;
                                break;

                            case "双":
                                $R = 2;
                                $drop_sort = "单双";
                                $bmmm = $bztdx;
                                $cmmm = $cztdx;
                                $dmmm = $dztdx;
                                break;

                            case "大":
                                $R = 3;
                                $drop_sort = "大小";
                                $bmmm = $bztdx;
                                $cmmm = $cztdx;
                                $dmmm = $dztdx;
                                break;

                            case "小":
                                $R = 3;
                                $drop_sort = "大小";
                                $bmmm = $bztdx;
                                $cmmm = $cztdx;
                                $dmmm = $dztdx;

                                break;
                            case "合单":
                                $R = 4;
                                $drop_sort = "合数单双 ";
                                $bmmm = $bztdx;
                                $cmmm = $cztdx;
                                $dmmm = $dztdx;

                                break;
                            case "合双":
                                $R = 4;
                                $drop_sort = "合数单双 ";
                                $bmmm = $bztdx;
                                $cmmm = $cztdx;
                                $dmmm = $dztdx;
                                break;

                            case "红波":
                                $R = 10;
                                $drop_sort = "波色";
                                $bmmm = $bztdx;
                                $cmmm = $cztdx;
                                $dmmm = $dztdx;
                                break;

                            case "绿波":
                                $R = 10;
                                $drop_sort = "波色";
                                $bmmm = $bztdx;
                                $cmmm = $cztdx;
                                $dmmm = $dztdx;

                                break;
                            case "蓝波":
                                $R = 10;
                                $drop_sort = "波色";
                                $bmmm = $bztdx;
                                $cmmm = $cztdx;
                                $dmmm = $dztdx;

                                break;
                            default:
                                $R = 5;
                                $drop_sort = "正特";
                                $bmmm = getConfigField('bzt');
                                $cmmm = getConfigField('czt');
                                $dmmm = getConfigField('dzt');
                                break;

                        }
                        break;
                    case "尾数":
                        $R = 23;
                        $drop_sort = "尾数";
                        $bmmm = 0;
                        $cmmm = 0;
                        $dmmm = 0;
                        break;
                    case "正1-6":
                        $R = 38;
                        $drop_sort = "正1-6";
                        $bmmm = 0;
                        $cmmm = 0;
                        $dmmm = 0;

                        break;
                    default:
                        $R = 23;
                        $drop_sort = "尾数";
                        $bmmm = 0;
                        $cmmm = 0;
                        $dmmm = 0;
                        break;
                }
                //超过单期
                if ($bl['class1'] == "特码" and $r <= 49) {
                    //超过单期
                    $sum_m55 = getTanKitheSum($bl['class1'], $bl['class2'], $bl['class3'], false);
                    if (($sum_m55 + $_POST['Num_' . $r]) > $bl['xr'] or $bl['locked'] == 1) {
                        $this->redirect('index/errorPage',['msg'=>'对不起，[' . $bl['class3'] . '号]暂停下注.请反回重新选择!']);
                    }
                }
                //超过单项
                $sum_m = getTanKitheSum($bl['class1'], $bl['class2'], $bl['class3']);
                if (($sum_m + input('Num_' . $r)) > getQuotaField($R, 'xxx')) {
                    $this->redirect('index/errorPage',['msg'=>'对不起，[' . $bl['class3'] . ']超过单项限额.请反回重新选择!']);
                }
                if ($bl['locked'] == 1) {
                    $this->redirect('index/errorPage',['msg'=>'对不起，[' . $bl['class3'] . '号]暂停下注.请反回重新选择!']);
                }
                switch (getMemField("abcd")) {
                    case "A":
                        $Y='yg';
                        $res[$r]['rate'] = $bl['rate'];
                        break;
                    case "B":
                        $Y='ygb';
                        $res[$r]['rate'] = $bl['rate'] - $bmmm;
                        break;
                    case "C":
                        $Y='ygc';
                        $res[$r]['rate'] = $bl['rate'] - $cmmm;
                        break;
                    case "D":
                        $Y='ygd';
                        $res[$r]['rate'] = $bl['rate'] - $dmmm;
                        break;
                    default:
                        $Y='yg';
                        $res[$r]['rate'] = $bl['rate'];
                        break;
                }

                //批新增
                $order=randStr();
                $text=date("Y-m-d H:i:s");
                $class11=$bl['class1'];
                $class22=$bl['class2'];
                $class33=$bl['class3'];
                $sum_m=input('Num_'.$r);
                $tmp_user=$sess['kauser'];
                $xpankou = getMemField('abcd');
                $user_ds=getQuotaField($R,$Y);        //ka_tan表 user_ds对应ka_quota 表下的$Y字段  username=mem表的kauser
                $dai_ds=getQuotaField($R,$Y,'dai'); //对应ka_quota 表下的$Y字段  username=mem表的dan
                $zong_ds=getQuotaField($R,$Y,'zong');//对应ka_quota 表下的$Y字段  username=mem表的zong
                $guan_ds=getQuotaField($R,$Y,'guan');//对应ka_quota 表下的$Y字段  username=mem表的guan
                $dai_zc=getMemField("dan_zc");
                $zong_zc=getMemField("zong_zc");
                $guan_zc=getMemField("guan_zc");
                $dagu_zc=getMemField("dagu_zc");
                $dai=getMemField("dan");
                $zong=getMemField("zong");
                $guan=getMemField("guan");
                $danid=getMemField("danid");
                $zongid=getMemField("zongid");
                $guanid=getMemField("guanid");
                $memid=getMemField("id");

                $guan1_ds=getQuotaField($R, $Y, 'guan1');
                $guan1_zc=$mem['guan1_zc'];
                $guanid1 = $mem['guanid1'];
                $guan1 = $mem['guan1'];
                $array=[
                    'num'=>$order,
                    'username'=>$sess['kauser'],
                    'kithe'=>getKitheNum(),
                    'adddate'=>$text,
                    'class1'=>$class11,
                    'class2'=>$class22,
                    'class3'=>$class33,
                    'rate'=>$res[$r]['rate'],
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
                    'danid'=>$danid,
                    'zongid'=>$zongid,
                    'guanid'=>$guanid,
                    'abcd'=>'A',
                    'lx'=>0,
                    'guan1'=>$guan1,
                    'guanid1'=>$guanid1,
                    'guan1_zc'=>$guan1_zc,
                    'guan1_ds'=>$guan1_ds
                ];
                $result=Db::name('tan')->insert($array);
                if(!$result){
                    $this->redirect('index/errorPage',['msg'=>'用户下单插入数据失败']);
                }
                $result=Db::name('mem')->where(['kauser'=>$sess['kauser']])->setDec('ts',$sum_m);
                if(!$result)
                {
                    $this->redirect('index/errorPage',['msg'=>'发生错误，操作失败']);
                }


                //分成
                if($class11!='正1-6'){
                    $text=date("Y-m-d H:i:s");
                    $blf=getBlById($rate_id);
                    $class11=$blf['class1'];
                    $class22=$blf['class2'];
                    if ($class22=="五肖" || $class22=="六肖" || $class22=="四肖"){
                        $class33=$blf['class3'];
                    }
                    $ztm1='';
                    switch ($blf['class1']){
                        case "特码":
                            switch ($blf['class3']){
                                case "单":
                                    $ztm1=getConfigField('tmdx'); //4
                                    break;
                                case "家禽":
                                    $ztm1=getConfigField('tmdx');
                                    break;
                                case "野兽":
                                    $ztm1=getConfigField('tmdx');
                                    break;
                                case "双":
                                    $ztm1=getConfigField('tmdx');
                                    break;
                                case "合单":
                                    $ztm1=getConfigField('tmdx');
                                    break;
                                case "合双":
                                    $ztm1=getConfigField('tmdx');
                                    break;
                                case "大":
                                    $ztm1=getConfigField('tmdx');
                                    break;
                                case "小":
                                    $ztm1=getConfigField('tmdx');
                                    break;
                                case "红波":
                                    $ztm1=getConfigField('tmps');
                                    break;
                                case "蓝波":
                                    $ztm1=getConfigField('tmps');
                                    break;
                                case "绿波":
                                    $ztm1=getConfigField('tmps');
                                    break;
                            }
                            $image=Db::name('drop')->field('drop_sort,drop_value,drop_unit,low_drop')->where(['drop_sort'=>$drop_sort])->find();
                            $drop=intval(($blf['gold']+$sum_m)/$image['drop_value'])*$image['drop_unit'];
                            $num1=($blf['gold']+$sum_m)%$image['drop_value'];
                            $zpm1=$image['low_drop'];
                            $zpm2=$image['low_drop']+$ztm1;
                            $low_drop=$image['low_drop']; //最小值
                            if ($blf['class2']=="特B"){$low_drop=$image['low_drop']+$ztm1;}
                            $exe=Db::name('bl')->where(['class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->update(['gold'=>$num1]);
                            if(!$exe){
                                $this->redirect('index/errorPage',['msg'=>'分成错误!']);
                                exit;
                            };
                            if (($blf['rate']-$drop)>$low_drop){
                                $sql="update ka_bl set adddate='". $text."',rate=rate-".$drop." where class1='".$class11."' and class2='特A' and class3='".$class33."'";
                                $exe=Db::execute($sql);
                                if(!$exe)exit($sql);
                                $sql="update ka_bl set adddate='". $text."',rate=rate-".$drop." where class1='".$class11."' and class2='特B' and class3='".$class33."'";
                                $exe=Db::execute($sql);
                                if(!$exe)exit($sql);
                            }else{
                                $sql="update ka_bl set adddate='". $text."',rate=".$zpm1." where class1='".$class11."' and class2='特A' and class3='".$class33."'";
                                $exe=Db::execute($sql);
                                if(!$exe)exit($sql);
                                $sql="update ka_bl set adddate='". $text."',rate=".$zpm2." where class1='".$class11."' and class2='特B' and class3='".$class33."'";
                                $exe=Db::execute($sql);
                                if(!$exe)exit($sql);
                            }
                            break;
                        case "正码":
                            switch ($blf['class3']){
                                case "总单":
                                    $ztm1=getConfigField('zmdx');
                                    break;
                                case "总双":
                                    $ztm1=getConfigField('zmdx');
                                    break;
                                case "总大":
                                    $ztm1=getConfigField('zmdx');
                                    break;
                                case "总小":
                                    $ztm1=getConfigField('zmdx');
                                    break;
                                default:
                                    $ztm1=getConfigField('zm');
                                    break;
                            }
                            $image = Db::name('drop')->field('drop_sort,drop_value,drop_unit,low_drop')->where(['drop_sort'=>$drop_sort])->find();
                            $drop=intval(($blf['gold']+$sum_m)/$image['drop_value'])*$image['drop_unit'];
                            $num1=($blf['gold']+$sum_m)%$image['drop_value'];
                            $zpm1=$image['low_drop'];
                            $zpm2=$image['low_drop']+$ztm1;
                            $low_drop=$image['low_drop']; //最小值

                            if ($blf['class2']=="正B"){$low_drop=$image['low_drop']+$ztm1;}

                            $sql="update ka_bl set gold=".$num1." where class1='".$class11."' and class2='".$class22."' and class3='".$class33."'";
                            $exe=Db::execute($sql);
                            if(!$exe)exit($sql);

                            if (($blf['rate']-$drop)>$low_drop){
                                $sql="update ka_bl set adddate='". $text."',rate=rate-".$drop." where class1='".$class11."' and class2='正A' and class3='".$class33."'";
                                $exe=Db::execute($sql);
                                if(!$exe)exit($sql);
                                $sql="update ka_bl set adddate='". $text."',rate=rate-".$drop." where class1='".$class11."' and class2='正B' and class3='".$class33."'";
                                $exe=Db::execute($sql);
                                if(!$exe)exit($sql);
                            }else{
                                $sql="update ka_bl set adddate='". $text."',rate=".$zpm1." where class1='".$class11."' and class2='正A' and class3='".$class33."'";
                                $exe=Db::execute($sql);
                                if(!$exe)exit($sql);
                                $sql="update ka_bl set adddate='". $text."',rate=".$zpm2." where class1='".$class11."' and class2='正B' and class3='".$class33."'";
                                $exe=Db::execute($sql);
                                if(!$exe)exit($sql);
                            }
                            break;
                        default:
                            $image =  Db::name('drop')->field('drop_sort,drop_value,drop_unit,low_drop')->where(['drop_sort'=>$drop_sort])->find();
                            $drop=intval(($blf['gold']+$sum_m)/$image['drop_value'])*$image['drop_unit'];
                            $num1=($blf['gold']+$sum_m)%$image['drop_value'];
                            $zpm1=$image['low_drop'];
                            $zpm2=$image['low_drop'];
                            $low_drop=$image['low_drop']; //最小值

                            $sql="update ka_bl set gold=".$num1." where class1='".$class11."' and class2='".$class22."' and class3='".$class33."'";
                            $exe=Db::execute($sql);
                            if(!$exe)exit($sql);
                            if (($blf['rate']-$drop)>$low_drop){
                                $sql="update ka_bl set adddate='". $text."',rate=rate-".$drop." where class1='".$class11."' and class2='".$class22."'  and class3='".$class33."'";
                                $exe=Db::execute($sql);
                                if(!$exe)exit($sql);
                            }else{
                                $sql="update ka_bl set adddate='". $text."',rate=".$zpm1." where class1='".$class11."' and class2='".$class22."'  and class3='".$class33."'";
                                $exe=Db::execute($sql);
                                if(!$exe)exit($sql);
                            }
                            break;
                    }
                    $class333='';
                    if ($class22=="五肖" || $class22=="六肖" || $class22=="四肖"  ){
                        $class33=$class333;
                    }

                    //代理
                    $row6=$row6=Db::name('guan')->where(['kauser'=>$dai])->find();
                    $best=$row6['best'];
                    $pz=$row6['pz'];
                    $sj=$row6['sj'];
                    $sf=$row6['sf'];
                    $cs=$row6['cs'];
                    $danid=$row6['id'];
                    switch ($blf['class1']){
                        case "特码":
                            switch ($blf['class3']){
                                case "单":
                                case "双":
                                case "家禽":
                                case "野兽":
                                case "大":
                                case "小":
                                case "合单":
                                case "合双":
                                case "红波":
                                case "绿波":
                                case "蓝波":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['tm1'];
                                    break;
                            }
                            break;
                        case "正码":
                            switch ($blf['class3']){
                                case "总单":
                                case "总双":
                                case "总大":
                                case "总小":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['zm1'];
                                    break;
                            }
                            break;

                        case "五行":
                            $ffff=$row6['wx1'];
                            break;

                        case "生肖":
                            switch ($class22){
                                case "一肖":
                                    $ffff=$row6['yx1'];
                                    break;
                                default:
                                    $ffff=$row6['sx1'];
                                    break;
                            }
                            break;

                        case "不中":
                            $ffff=$row6['qbz1'];
                            break;
                        case "半波":
                            $ffff=$row6['bb1'];
                            break;
                        case "正特":
                            switch ($blf['class3']){
                                case "单":
                                case "双":
                                case "大":
                                case "小":
                                case "合单":
                                case "合双":
                                case "红波":
                                case "绿波":
                                case "蓝波":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['zt1'];
                                    break;
                            }
                            break;
                        case "尾数":
                            $ffff=$row6['ws1'];
                            break;

                        default:
                            $ffff=$row6['ws1'];
                            break;
                    }
                    if ($pz==0 and $best==1 and $ffff>=0){
                        //代理
                        //占成
                        $result5=Db::name('tan')->field('sum(sum_m*dai_zc/10) as sum_m')->where(['kithe'=>getKitheNum(),'dai'=>$dai,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
                        $Rs5 = $result5[0];
                        if ($Rs5['sum_m']!=""){
                            $sum_mff = $Rs5['sum_m'];}else{$sum_mff =0;
                        }
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
                            $sf=Db::name('guan')->where(['kauser'=>$zong])->value('sj');
                            $username=$dai;
                            $rate=$blf['rate'];
                            $user_ds=getQuotaField($R,'yg',$dai);
                            $dai_ds=getQuotaField($R,'yg',$dai);
                            $zong_ds=getQuotaField($R,'yg',$zong);
                            $guan_ds=getQuotaField($R,'yg',$guan);
                            $dai_zc=0;
                            $zong_zc=$sj/10;
                            $guan_zc=$sf/10;
//                            $dagu_zc=10-$sj/10-$sf/10;
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
                            if(!$resx1)exit('数据修改错误！');
                            $exe=Db::name('bl')->where(['class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->setInc('gold',$sum_m);
                            if(!$exe)exit('数据修改错误！');
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


                    switch ($blf['class1']){
                        case "特码":
                            switch ($blf['class3']){
                                case "单":
                                case "双":
                                case "家禽":
                                case "野兽":
                                case "大":
                                case "小":
                                case "合单":
                                case "合双":
                                case "红波":
                                case "绿波":
                                case "蓝波":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['tm1'];
                                    break;
                            }
                            break;
                        case "正码":
                            switch ($blf['class3']){
                                case "总单":
                                case "总双":
                                case "总大":
                                case "总小":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['zm1'];
                                    break;
                            }
                            break;

                        case "五行":
                            $ffff=$row6['wx1'];
                            break;
                        case "七色波":
                            $ffff=$row6['qsb1'];
                            break;
                        case "生肖":
                            switch ($class22){
                                case "一肖":
                                    $ffff=$row6['yx1'];
                                    break;
                                default:
                                    $ffff=$row6['sx1'];
                                    break;
                            }
                            break;
                        case "不中":
                            $ffff=$row6['qbz1'];
                            break;
                        case "半波":
                            $ffff=$row6['bb1'];
                            break;
                        case "正特":
                            switch ($blf['class3']){
                                case "单":
                                case "双":
                                case "大":
                                case "小":
                                case "合单":
                                case "合双":
                                case "红波":
                                case "绿波":
                                case "蓝波":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['zt1'];
                                    break;
                            }
                            break;
                        case "尾数":
                            $ffff=$row6['ws1'];
                            break;
                        case "尾数连":
                            $ffff=$row6['wsl1'];
                            break;

                        default:
                            $ffff=$row6['ws1'];
                            break;
                    }
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
                            $rate=$blf['rate'];
                            $user_ds=getQuotaField($R,'yg',$zong);
                            $dai_ds=getQuotaField($R,'yg',$zong);
                            $zong_ds=getQuotaField($R,'yg',$zong);
                            $guan_ds=getQuotaField($R,'yg',$guan);
                            $dai_zc=0;
                            $zong_zc=0;
                            $guan_zc=$sj/10;
                            $dagu_zc=10-$sj/10;

                            $dai=$mem['zong'];
                            $zong=$mem['zong'];
                            $guan=$mem['guan'];
                            $danid=$mem['zongid'];
                            $zongid=$mem['zongid'];
                            $guanid=$mem['guanid'];
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
                            if(!$resx1)exit('数据库修改出错');

                            $exe=Db::name('bl')->where(['class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->setInc('gold',$sum_m);
                            if(!$exe)exit('数据修改错误！');
                        }//完成代理补
                    }

                    //股东
                    $row6=Db::name('guan')->where(['kauser'=>$guan])->find();
                    $best=$row6['best'];
                    $pz=$row6['pz'];
                    $sj=$row6['sj'];
                    $sf=$row6['sf'];
                    $cs=$row6['cs'];
                    $danid=$row6['id'];

                    switch ($blf['class1']){
                        case "特码":
                            switch ($blf['class3']){
                                case "单":
                                case "双":
                                case "家禽":
                                case "野兽":
                                case "大":
                                case "小":
                                case "合单":
                                case "合双":
                                case "红波":
                                case "绿波":
                                case "蓝波":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['tm1'];
                                    break;
                            }
                            break;
                        case "正码":
                            switch ($blf['class3']){
                                case "总单":
                                case "总双":
                                case "总大":
                                case "总小":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['zm1'];
                                    break;
                            }
                            break;
                        case "五行":
                            $ffff=$row6['wx1'];
                            break;
                        case "生肖":
                            switch ($class22){
                                case "一肖":
                                    $ffff=$row6['yx1'];
                                    break;
                                default:
                                    $ffff=$row6['sx1'];
                                    break;
                            }
                            break;
                        case "不中":
                            $ffff=$row6['qbz1'];
                            break;
                        case "半波":
                            $ffff=$row6['bb1'];
                            break;
                        case "正特":
                            switch ($blf['class3']){
                                case "单":
                                case "双":
                                case "大":
                                case "小":
                                case "合单":
                                case "合双":
                                case "红波":
                                case "绿波":
                                case "蓝波":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['zt1'];
                                    break;
                            }
                            break;
                        case "尾数":
                            $ffff=$row6['ws1'];
                            break;
                        case "尾数连":
                            $ffff=$row6['wsl1'];
                            break;
                        default:
                            $ffff=$row6['ws1'];
                            break;
                    }
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

                        if ($sum_m>=1 and $ffff>=0 and $smsmi>=0){ ///代理补
                            $username=$guan;
                            $rate=$blf['rate'];
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
                            if(!$resx1)exit('数据库修改出错');

                            $exe=Db::name('bl')->where(['class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->setInc('gold',$sum_m);
                            if(!$exe)exit('数据修改错误！');
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

                    switch ($blf['class1']){
                        case "特码":
                            switch ($blf['class3']){
                                case "单":
                                case "双":
                                case "家禽":
                                case "野兽":
                                case "大":
                                case "小":
                                case "合单":
                                case "合双":
                                case "红波":
                                case "绿波":
                                case "蓝波":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['tm1'];
                                    break;
                            }
                            break;
                        case "正码":
                            switch ($blf['class3']){
                                case "总单":
                                case "总双":
                                case "总大":
                                case "总小":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['zm1'];
                                    break;
                            }
                            break;
                        case "五行":
                            $ffff=$row6['wx1'];
                            break;
                        case "生肖":
                            switch ($class22){
                                case "一肖":
                                    $ffff=$row6['yx1'];
                                    break;
                                default:
                                    $ffff=$row6['sx1'];
                                    break;
                            }
                            break;
                        case "不中":
                            $ffff=$row6['qbz1'];
                            break;
                        case "半波":
                            $ffff=$row6['bb1'];
                            break;
                        case "正特":
                            switch ($blf['class3']){
                                case "单":
                                case "双":
                                case "大":
                                case "小":
                                case "合单":
                                case "合双":
                                case "红波":
                                case "绿波":
                                case "蓝波":
                                    $ffff=$row6['xx1'];
                                    break;
                                default:
                                    $ffff=$row6['zt1'];
                                    break;
                            }
                            break;
                        case "尾数":
                            $ffff=$row6['ws1'];
                            break;
                        case "尾数连":
                            $ffff=$row6['wsl1'];
                            break;
                        default:
                            $ffff=$row6['ws1'];
                            break;
                    }
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

                        if ($sum_m>=1 and $ffff>=0 and $smsmi>=0){ ///代理补
                            $username=$guan1;
                            $rate=$blf['rate'];
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
                            $arr5=[
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
                            $resx1=Db::name('tan')->insert($arr5);
                            if(!$resx1)exit('数据库修改出错');

                            $exe=Db::name('bl')->where(['class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->setInc('gold',$sum_m);
                            if(!$exe)exit('数据修改错误！');
                        }//完成股东补
                    }
                }
            }
        }
        $url=input('from_url') ? input('from_url') : '';
        return $this->fetch('',[
            'res'=>$res,
            'numm'=>$numm,
            'url'=>$url,
            'arr'=>$arr,
        ]);
    }


    //封盘判断
//    protected function fp($xf){
//        if(!getKithe(29) || !getKithe($xf)){
//            echo "<table width=60% border=1 align=center cellpadding=4 cellspacing=1 bordercolor=#ffff00 bgcolor=#Fd0000>          <tr>            <td height=28 align=center bgcolor=ff0000><font color=ffff00>封盘中....</font></td>          </tr>      </table>";
//            exit;
//        }
//    }


    public function server(){
        $class1=input('class1');
        $class2=input('class2');
        if ($class1=="正1-6" or $class1=="正码1-6" or $class1=="过关" or $class1=="半波" or $class1=="尾数" or $class1=="单双大小" or $class1=="一字" or $class1=="二字" or $class1=="三字" or $class1=="一字过关" or $class1=="跨度" or $class1=="组选三" or $class1=="组选六"){
            if ($class1=="正1-6" ){
                $result=Db::name('bl')->where(['class1'=>$class1])->order(['class2'=>'asc','id'=>'asc'])->select();
            }
            else if ($class1=="正码1-6" ){
                $result=Db::name('bl')->where(['class1'=>'正1-6'])->order(['class2'=>'asc','id'=>'asc'])->select();
            }
            else if ($class1=="单双大小" ){
                $result=Db::name('bl')->where("(class3='单' or class3='双' or class3='大' or class3='小' or  class3='合单' or class3='合双' or class3='红波' or class3='绿波' or class3='蓝波' or class3='总单' or class3='总双' or class3='总大' or class3='总小') and (class2='正1特' or class2='正2特' or class2='正3特' or class2='正4特' or class2='正5特'  or class2='正6特' or class2='特A' or class2='正A')")->order(['class2'=>'asc','id'=>'asc'])->select();
            }
            else if ($class1=="尾数" ){
                $result=Db::name('bl')->where("class1='头数' or class1='尾数'")->order(['id'=>'asc'])->select();
            }
            else if ($class1=="一字" or $class1=="二字" or $class1=="三字" or $class1=="一字过关" or $class1=="跨度" or $class1=="组选三" or $class1=="组选六" ){
                $result=Db::table('3dka_bl')->where(['class1'=>$class1,'class2'=>$class2])->order(['id'=>'asc'])->select();
            }
            else{
                $result=Db::name('bl')->where(['class1'=>$class1])->order(['id'=>'asc'])->select();
            }
        }else{
            if ($class1=="生肖" && $class2=="一肖"){
                $result=Db::name('bl')->where(['class1'=>'正特尾数','class2'=>'正特尾数'])->whereOr(['class1'=>$class1,'class2'=>$class2])->order('id')->select();
            }
            else if ($class1=="正肖" && $class2=="正肖")
                $result=Db::name('bl')->where(['class1'=>'七色波','class2'=>'七色波'])->whereOr(['class1'=>$class1,'class2'=>$class2])->order('id')->select();
            else{
                $result=Db::name('bl')->where(['class1'=>$class1,'class2'=>$class2])->order('id')->select();
            }
        }

        $blbl=[];
        foreach ($result as $k=>$v){
            if($class1=="连码"){
                $rs5=getTanKitheSum($v['class1'],$v['class2']);
            }else{
                $res1=db('tan')->where(['kithe'=>getKitheNum(),'class1'=>$v['class1'],'class2'=>$v['class2'],'class3'=>$v['class3']])->order(['id'=>'desc'])->field(['sum(sum_m) sum'])->select();
                $rs5=$res1[0]['sum'];
            }
            if ($rs5==""){$sum_m=0;}else{$sum_m=$rs5;}
            $rate=$v['rate'];
            $blbl[]=[
                'id'=>$v['id'],
                'class3'=>$v['class3'],
                'rate'=>$v['rate'],
                'blrate'=>$v['blrate'],
                'sum_m'=>$sum_m,
                'xr'=>$v['xr'],
                'locked'=>$v['locked']
            ];
        }
        if ($class1=="生肖" || $class1=="连肖") {
            $result=Db::table('mdrop')->where(['class1'=>$class1,'class2'=>$class2])->select();
           foreach ($result as $k=>$v){
               $blbl[]=[
                   'class3'=>$v['class3'],
                   'rate'=>$v['rate'],
                   'blrate'=>'xx',     //xx自定义不存在的值
                   'sum_m'=>'x',
                   'xr'=>'x',
                   'locked'=>'x'
               ];
           }
        }
        return json($blbl);
        $ddf=date( "Y-m-d H:i:s",time()-20);
        $rate=Db::name('bl')->field(['rate','blrate'])->where(['class1'=>$class1,'adddate'=>['lt',$ddf]])->select();
        if($rate){
            foreach ($rate as $v){
                if($v['rate']!=$v['blrate']){
                    Db::name('bl')->where(['class1'=>$class1,'adddate'=>['lt',$ddf]])->update(['blrate'=>$rate]);
                }
            }
        }
    }
}