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
class Sxt extends Common{
    public function index(){
        $class1="生肖连";
        $ids=input('ids');
        if($ids=='')$ids='二肖连中';
        if ($ids=="二肖连中") {
            $xc=49;
            $XF=23;
        }
        if ($ids=="三肖连中") {
            $xc=50;
            $XF=23;
        }
        if ($ids=="四肖连中") {
            $xc=51;
            $XF=23;
        }
        if ($ids=="五肖连中") {
            $xc=52;
            $XF=23;
        }
        if ($ids=="二肖连不中") {
            $xc=53;
            $XF=23;
        }
        if ($ids=="三肖连不中") {
            $xc=54;
            $XF=23;
        }
        if ($ids=="四肖连不中") {
            $xc=55;
            $XF=23;
        }
        $this->fp($XF);
        $res=Db::name('bl')->alias('b')->join('ka_sxnumber m','m.sx=b.class3')->field(['b.id','b.class3','b.rate','m.m_number'])->where(['b.class2'=>$ids])->select();
        foreach ($res as $k=>$v){
            $res[$k]['m_number']=explode(',',$v['m_number']);
        }
        return $this->fetch('',[
            'ids'=>$ids,        // 二级分类名称
            'res'=>$res,        //class2=半波的所有三级分类
            'xc'=>$xc,
            'class1'=>$class1,
            'abcd'=>getMemField('abcd'),]);
    }

    public function save(){
        header('Content-Type:text/html;charset=utf-8');
        $class1='生肖连';
        $class2=input('class2');
        $errUrl=url('sxt/index',['ids'=>input('class2')]);
        if(input('?Num_1')){
            $pattern='/^[0-9]+(\.*[0-9]+)$/';
            if(!preg_match($pattern,input('Num_1'))){
                echo "<script>alert('下注金额有误!');window.location.href='".$errUrl."';</script>";
                exit;
            }
        }
        if (!input('?class2') || input('class2')==''){
            echo "<script>alert('非法进入!');window.location.href='".$errUrl."';</script>";
            exit;
        }
        $n=0;           //判断个数
        $number1='';    //所有numX对应的class3的字符串连接
        for ($t=0;$t<=12;$t=$t+1){
            if (input('num'.$t)!=""){
                $number1.=input('num'.$t).",";
                $n=$n+1;
            }
        }
        $number3=$number1;
        $sum_mm=getTanKitheSum($class1,$class2);
        switch ($class2){
            case "二肖连中":
                $bmmm=0;
                $cmmm=0;
                $dmmm=0;
                $R=49;
                $XF=23;
                $rate_id=1401;
                if ($n<2 or $n>8){
                    echo "<script>alert('对不起，请选择二-八个生肖!');window.location.href='".$errUrl."';</script>";
                    exit;
                }
                $zs=$n*($n-1)/2;
                $mu=explode(",",$number1);
                $mama=$mu[0].",".$mu[1];
                for ($f=0;$f<count($mu)-2;$f=$f+1){
                    for ($t=2;$t<count($mu)-1;$t=$t+1){
                        if ($f!=$t and $f<$t){
                            $mama=$mama."/".$mu[$f].",".$mu[$t];
                        }
                    }
                }
                break;
            case "三肖连中":
                $bmmm=0;
                $cmmm=0;
                $dmmm=0;
                $R=50;
                $XF=23;
                $rate_id=1413;
                if ($n<3 or $n>8){
                    echo "<script>alert('对不起，请选择三-八个生肖!');window.location.href='".$errUrl."';</script>";
                    exit;
                }
                $zs=$n*($n-1)*($n-2)/6;
                $mu=explode(",",$number1);
                $mama=$mu[0].",".$mu[1].",".$mu[2];
                for ($h=0;$h<count($mu)-3;$h=$h+1){
                    for ($f=1;$f<count($mu)-2;$f=$f+1){
                        for ($t=3;$t<count($mu)-1;$t=$t+1){
                            if ($h!=$f and $h<$f and $f!=$t and $f<$t){
                                $mama=$mama."/".$mu[$h].",".$mu[$f].",".$mu[$t];
                            }
                        }
                    }
                }
                break;
            case "四肖连中":
                $bmmm=0;
                $cmmm=0;
                $dmmm=0;
                $R=51;
                $XF=23;
                $rate_id=1425;
                if ($n<4 or $n>8){
                    echo "<script>alert('对不起，请选择四-八个生肖!');window.location.href='".$errUrl."';</script>";
                    exit;}
                $zs=$n*($n-1)*($n-2)*($n-3)/24;
                $mu=explode(",",$number1);
                $mama=$mu[0].",".$mu[1].",".$mu[2].",".$mu[3];
                for ($h=0;$h<count($mu)-4;$h=$h+1){
                    for ($f=1;$f<count($mu)-3;$f=$f+1){
                        for ($t=2;$t<count($mu)-2;$t=$t+1){
                            for ($s=4;$s<count($mu)-1;$s=$s+1){
                                if ($h!=$f and $h<$f and $f!=$t and $f<$t and $t!=$s and $t<$s){
                                    $mama=$mama."/".$mu[$h].",".$mu[$f].",".$mu[$t].",".$mu[$s];
                                }
                            }
                        }
                    }
                }
                break;
            case "五肖连中":
                $bmmm=0;
                $cmmm=0;
                $dmmm=0;
                $R=52;
                $XF=23;
                $rate_id=1473;
                if ($n<5 or $n>8){
                    echo "<script>alert('对不起，请选择五-八个生肖!');window.location.href='".$errUrl."';</script>";
                    exit;
                }
                $zs=$n*($n-1)*($n-2)*($n-3)*($n-4)/120;
                $mu=explode(",",$number1);
                $mama=$mu[0].",".$mu[1].",".$mu[2].",".$mu[3].",".$mu[4];
                for ($h=0;$h<count($mu)-5;$h=$h+1){
                    for ($f=1;$f<count($mu)-4;$f=$f+1){
                        for ($t=2;$t<count($mu)-3;$t=$t+1){
                            for ($s=3;$s<count($mu)-2;$s=$s+1){
                                for ($u=5;$u<count($mu)-1;$u=$u+1){
                                    if ($h!=$f and $h<$f and $f!=$t and $f<$t and $t!=$s and $t<$s and $s!=$u and $s<$u){
                                        $mama=$mama."/".$mu[$h].",".$mu[$f].",".$mu[$t].",".$mu[$s].",".$mu[$u];
                                    }
                                }
                            }
                        }
                    }
                }
                break;
            case "二肖连不中":
                $bmmm=0;
                $cmmm=0;
                $dmmm=0;
                $R=53;
                $XF=23;
                $rate_id=1437;
                if ($n<2 or $n>8){echo "<script>alert('对不起，请选择二-八个生肖!');window.location.href='".$errUrl."';</script>";
                    exit;}
                $zs=$n*($n-1)/2;

                $mu=explode(",",$number1);
                $mama=$mu[0].",".$mu[1];
                for ($f=0;$f<count($mu)-2;$f=$f+1){
                    for ($t=2;$t<count($mu)-1;$t=$t+1){
                        if ($f!=$t and $f<$t){
                            $mama=$mama."/".$mu[$f].",".$mu[$t];
                        }
                    }
                }

                break;
            case "三肖连不中":
                $bmmm=0;
                $cmmm=0;
                $dmmm=0;
                $R=54;
                $XF=23;
                $rate_id=1449;
                if ($n<3 or $n>8){echo "<script>alert('对不起，请选择三-八个生肖!');window.location.href='".$errUrl."';</script>";
                    exit;}
                $zs=$n*($n-1)*($n-2)/6;
                $mu=explode(",",$number1);
                $mama=$mu[0].",".$mu[1].",".$mu[2];
                for ($h=0;$h<count($mu)-3;$h=$h+1){
                    for ($f=1;$f<count($mu)-2;$f=$f+1){
                        for ($t=3;$t<count($mu)-1;$t=$t+1){
                            if ($h!=$f and $h<$f and $f!=$t and $f<$t){
                                $mama=$mama."/".$mu[$h].",".$mu[$f].",".$mu[$t];
                            }
                        }
                    }
                }
                break;
            case "四肖连不中":
                $bmmm=0;
                $cmmm=0;
                $dmmm=0;
                $R=55;
                $XF=23;
                $rate_id=1461;
                if ($n<4 or $n>8){echo "<script>alert('对不起，请选择四-八个生肖!');window.location.href='".$errUrl."';</script>";
                    exit;}
                $zs=$n*($n-1)*($n-2)*($n-3)/24;
                $mu=explode(",",$number1);
                $mama=$mu[0].",".$mu[1].",".$mu[2].",".$mu[3];
                for ($h=0;$h<count($mu)-4;$h=$h+1){
                    for ($f=1;$f<count($mu)-3;$f=$f+1){
                        for ($t=2;$t<count($mu)-2;$t=$t+1){
                            for ($s=4;$s<count($mu)-1;$s=$s+1){
                                if ($h!=$f and $h<$f and $f!=$t and $f<$t and $t!=$s and $t<$s){
                                    $mama=$mama."/".$mu[$h].",".$mu[$f].",".$mu[$t].",".$mu[$s];
                                }
                            }
                        }
                    }
                }
                break;
        }
        $this->fp($XF);
        $bl=getBlById($rate_id);
        return $this->fetch('',[
            'class1'=>$class1,
            'ids'=>$class2,
            'num_1'=>input('Num_1'),
            'bl'=>$bl,
            'R'=>$R,
            'number1'=>$number1,
            'rate_id'=>$rate_id,
            'number3'=>$number3,
            'mama'=>$mama,
            'zs'=>$zs,

        ]);
    }

    public function saveAll(){
        $class1='生肖连';
        $class2=input('class2');
        $urlurl=url('sxt/index',['ids'=>input('class2')]);
        if(input('?Num_1')){
            $pattern='/^[0-9]+(\.*[0-9]+)$/';
            if(!preg_match($pattern,input('Num_1'))){
                echo "<script>alert('下注金额有误!');window.location.href='".$urlurl."';</script>";
                exit;
            }
        }
        if (!input('?class2') || input('class2')==''){
            echo "<script>alert('非法进入!');window.location.href='".$urlurl."';</script>";
            exit;
        }
        $number3=input('number3');
        $sum_mm=getTanKitheSum($class1,$class2);
        $bmmm=getConfigField('blx');
        $cmmm=getConfigField('clx');
        $dmmm=getConfigField('dlx');
        switch ($class2){
            case "二肖连中":
                $R=48;
                $XF=23;
                break;
            case "三肖连中":
                $R=49;
                $XF=23;
                break;
            case "四肖连中":
                $R=50;
                $XF=23;
                break;
            case "五肖连中":
                $R=51;
                $XF=23;
                break;
            case "二肖连不中":
                $R=52;
                $XF=23;
                break;
            case "三肖连不中":
                $R=53;
                $XF=23;
                break;
            case "四肖连不中":
                $R=54;
                $XF=23;
                break;
        }
        $this->fp($XF);
        exit('暂时搞不明白');
    }


}//class end