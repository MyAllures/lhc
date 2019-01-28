<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/1/3
 * Time: 15:43
 */
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
use think\Loader;

/*下注 --连码*/
class BetsLm extends Common{
    public function index(){
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $xc=20;
        $XF=21;
        $ids=input('ids') ? input('ids') : '三全中';
        $pd=1;
        switch ($ids){
            case '三全中':
            case '三中二':
                $type=1;
                break;
            case '二全中':
            case '二中特':
            case '特串':
                $type=2;
                break;
        }
        $this->fp($XF);
        $drop_table =Db::name('bl')->where(['class1'=>'连码'])->field('class3,rate')->select();
        $y=count($drop_table);
        $sxnumber=\think\Loader::model('sxnumber');
        $sx=[
            ['鼠',$sxnumber->getNumber(1)],
            ['牛',$sxnumber->getNumber(7)],
            ['虎',$sxnumber->getNumber(2)],
            ['兔',$sxnumber->getNumber(8)],
            ['龙',$sxnumber->getNumber(3)],
            ['蛇',$sxnumber->getNumber(9)],
            ['马',$sxnumber->getNumber(4)],
            ['羊',$sxnumber->getNumber(10)],
            ['猴',$sxnumber->getNumber(5)],
            ['鸡',$sxnumber->getNumber(11)],
            ['狗',$sxnumber->getNumber(6)],
            ['猪',$sxnumber->getNumber(12)]
        ];
        return $this->fetch('',[
            'ids'=>$ids,
            'drop_table'=>$drop_table,
            'xc'=>$xc,
            'mem'=>$mem,
            'bzx'=>getConfigField('bzx'),
            'czx'=>getConfigField('czx'),
            'dzx'=>getConfigField('dzx'),
            'bzxdx'=>getConfigField('bztdx'),
            'czxdx'=>getConfigField('cztdx'),
            'dzxdx'=>getConfigField('dztdx'),
            'sx'=>$sx,
            'type'=>$type,
        ]);
    }

    public function saveLm(){
        if(!input('?rtype'))$this->redirect('index/errorPage',['msg'=>'非法访问']);
        $zs=0;
        $number1='';    //选中的生肖的数字
        $number2='';
        $n=0;
        if (input('pabc')==1 || input('pabc')==2 ){
            for ($t=1;$t<=49;$t=$t+1){
                if (input('num'.$t)){
                    $number1.=intval(input('num'.$t)).",";
                    $n=$n+1;
                }
            }
            $number1=substr($number1,0,-1);
        }
        //三二中之外的
        if (input('pabc')==3){  //生肖对碰 1
            switch (input('pan1')){
                case "12":
                    $n1=4;
                    $number1="12,24,36,48";
                    break;
                case "11":
                    $n1=4;
                    $number1="11,23,35,47";
                    break;
                case "10":
                    $n1=4;
                    $number1="10,22,34,46";
                    break;
                case "9":
                    $n1=4;
                    $number1="9,21,33,45";
                    break;
                case "8":
                    $n1=4;
                    $number1="8,20,32,44";
                    break;
                case "7":
                    $n1=4;
                    $number1="7,19,31,43";
                    break;
                case "6":
                    $n1=4;
                    $number1="6,18,30,42";
                    break;
                case "5":
                    $n1=4;
                    $number1="5,17,29,41";
                    break;
                case "4":
                    $n1=4;
                    $number1="4,16,28,40";
                    break;
                case "3":
                    $n1=4;
                    $number1="3,15,27,39";
                    break;
                case "2":
                    $n1=4;
                    $number1="2,14,26,38";
                    break;
                case "1":
                    $number1="1,13,25,37,49";
                    $n1=5;
                    break;
                default:
                    break;
            }
            switch (input('pan2')){ //生肖对碰 2
                case "12":
                    $m1=4;
                    $number2="12,24,36,48";
                    break;
                case "11":
                    $m1=4;
                    $number2="11,23,35,47";
                    break;
                case "10":
                    $m1=4;
                    $number2="10,22,34,46";
                    break;
                case "9":
                    $m1=4;
                    $number2="9,21,33,45";
                    break;
                case "8":
                    $m1=4;
                    $number2="8,20,32,44";
                    break;
                case "7":
                    $m1=4;
                    $number2="7,19,31,43";
                    break;
                case "6":
                    $m1=4;
                    $number2="6,18,30,42";
                    break;
                case "5":
                    $m1=4;
                    $number2="5,17,29,41";
                    break;
                case "4":
                    $m1=4;
                    $number2="4,16,28,40";
                    break;
                case "3":
                    $m1=4;
                    $number2="3,15,27,39";
                    break;
                case "2":
                    $m1=4;
                    $number2="2,14,26,38";
                    break;
                case "1":
                    $number2="1,13,25,37,49";

                    $m1=5;
                    break;
                default:
                    break;
            }
            $n=$n1+$m1;
        }
        if (input('pabc')==5){  //肖串尾
            switch (input('pan1')){
                case "12":
                    $n1=4;
                    $number1="12,24,36,48";
                    break;
                case "11":
                    $n1=4;
                    $number1="11,23,35,47";
                    break;
                case "10":
                    $n1=4;
                    $number1="10,22,34,46";
                    break;
                case "9":
                    $n1=4;
                    $number1="9,21,33,45";
                    break;
                case "8":
                    $n1=4;
                    $number1="8,20,32,44";
                    break;
                case "7":
                    $n1=4;
                    $number1="7,19,31,43";
                    break;
                case "6":
                    $n1=4;
                    $number1="6,18,30,42";
                    break;
                case "5":
                    $n1=4;
                    $number1="5,17,29,41";
                    break;
                case "4":
                    $n1=4;
                    $number1="4,16,28,40";
                    break;
                case "3":
                    $n1=4;
                    $number1="3,15,27,39";
                    break;
                case "2":
                    $n1=4;
                    $number1="2,14,26,38";
                    break;
                case "1":
                    $number1="1,13,25,37,49";

                    $n1=5;
                    break;
                default:
                    break;
            }
            switch (input('pan3')){
                case "9":
                    $m1=5;
                    $number2="9,19,29,39,49";
                    break;
                case "8":
                    $m1=5;

                    $number2="8,18,28,38,48";
                    break;
                case "7":
                    $m1=5;

                    $number2="7,17,27,37,47";
                    break;
                case "6":
                    $m1=5;

                    $number2="6,16,26,36,46";
                    break;
                case "5":
                    $m1=5;

                    $number2="5,15,25,35,45";
                    break;
                case "4":
                    $m1=5;

                    $number2="4,14,24,34,44";
                    break;
                case "3":
                    $m1=5;

                    $number2="3,13,23,33,43";
                    break;
                case "2":
                    $m1=5;

                    $number2="2,12,22,32,42";
                    break;
                case "1":
                    $number2="1,11,21,31,41";
                    $m1=5;
                    break;
                case "0":
                    $number2="10,20,30,40";
                    $m1=4;
                    break;
                default:
                    break;
            }
            $n=$n1+$m1;
        }
        if (input('pabc')==4){  //尾数对碰
            switch (input('pan3')){
                case "9":
                    $n1=5;
                    $number1="9,19,29,39,49";
                    break;
                case "8":
                    $n1=5;

                    $number1="8,18,28,38,48";
                    break;
                case "7":
                    $n1=5;

                    $number1="7,17,27,37,47";
                    break;
                case "6":
                    $n1=5;

                    $number1="6,16,26,36,46";
                    break;
                case "5":
                    $n1=5;

                    $number1="5,15,25,35,45";
                    break;
                case "4":
                    $n1=5;

                    $number1="4,14,24,34,44";
                    break;
                case "3":
                    $n1=5;

                    $number1="3,13,23,33,43";
                    break;
                case "2":
                    $n1=5;

                    $number1="2,12,22,32,42";
                    break;
                case "1":
                    $number1="1,11,21,31,41";
                    $n1=5;
                    break;
                case "0":
                    $number1="10,20,30,40";
                    $n1=4;
                    break;
                default:
                    break;
            }
            switch (input('pan4')){
                case "9":
                    $m1=5;

                    $number2="9,19,29,39,49";
                    break;
                case "8":
                    $m1=5;

                    $number2="8,18,28,38,48";
                    break;
                case "7":
                    $m1=5;

                    $number2="7,17,27,37,47";
                    break;
                case "6":
                    $m1=5;

                    $number2="6,16,26,36,46";
                    break;
                case "5":
                    $m1=5;
                    $number2="5,15,25,35,45";
                    break;
                case "4":
                    $m1=5;

                    $number2="4,14,24,34,44";
                    break;
                case "3":
                    $m1=5;

                    $number2="3,13,23,33,43";
                    break;
                case "2":
                    $m1=5;

                    $number2="2,12,22,32,42";
                    break;
                case "1":
                    $number2="1,11,21,31,41";
                    $m1=5;
                    break;
                case "0":
                    $number2="10,20,30,40";
                    $m1=4;
                    break;
                default:
                    break;
            }
            $n=$n1+$m1;
        }
        $number3=$number1;

        switch (input('rtype')){
            case "三全中":
                if (input('pabc')==2){  //胆拖
                    $mama="1,1,1";
                    $number2=input('dm1').",".input('dm2');
                    $mu=explode(",",$number1);
                    for ($t=0;$t<count($mu);$t=$t+1){
                        $mama.="/".$mu[$t].",".$number2;
                    }
                    $ff=explode("/",substr($mama,1));
                    $zzz="/1,1,1";
                    for ($p=1;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        for ($k=0;$k<=2;$k=$k+1){ //循环3次
                            for ($t=0;$t<=1;$t=$t+1){ //循环2次
                                if (intval($un[$t])>intval($un[$t+1])){
                                    $tmp=$un[$t+1];
                                    $un[$t+1]=$un[$t];
                                    $un[$t]=$tmp;
                                }
                            }
                        }
                        $x=$un[0].",".$un[1].",".$un[2];
                        $zzz=$zzz."/".$x;
                    }
                }else{
                    $mu=explode(",",$number1);
                    $mamama="1,1,1";
                    $mama='';
                    for ($f=0;$f<count($mu);$f=$f+1){
                        $t=0;
                        for ($t=0;$t<count($mu);$t=$t+1){
                            if ($f!=$t and $f<$t){
                                $mama=$mama."/".$mu[$f].",".$mu[$t];
                            }
                        }
                    }
                    $mama=empty($mama) ? $mama : substr($mama,1);
                    $ma=explode("/",$mama);
                    for ($f=0;$f<count($mu);$f=$f+1){
                        for ($t=0;$t<count($ma);$t=$t+1){
                            $ma11=explode(",",$ma[$t]);
                            if ($ma11[0]!=$mu[$f] and $ma11[1]!=$mu[$f]){
                                if ($f!=$t and $f<$t){
                                    $mamama=$mamama."#".$ma[$t].",".$mu[$f];
                                }
                            }
                        }
                    }

                    $ff=explode("#",$mamama);
                    for ($p=0;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        for ($k=0;$k<=2;$k=$k+1){
                            for ($f=0;$f<=1;$f=$f+1){
                                if ($un[$f]>$un[$f+1]){
                                    $tmp=$un[$f+1];
                                    $un[$f+1]=$un[$f];
                                    $un[$f]=$tmp;
                                }
                            }
                        }
                        $ff[$p]=$un[0].",".$un[1].",".$un[2];
                    }
                    $zzz='';
                    for ($f=0;$f<count($ff);$f=$f+1){
                        if (!empty($zzz) && strpos($zzz,$ff[$f])>0){

                        }else{
                            $zzz=$zzz."/".$ff[$f];
                        }
                    }
                }
                break;
            case "三中二":
                if (input('pabc')==2){
                    $mama="1,1,1";
                    $number2=input('dm1').",".input('dm2');
                    $mu=explode(",",$number1);
                    for ($t=0;$t<count($mu);$t=$t+1){
                        $mama.="/".$mu[$t].",".$number2;
                    }
                    $ff=explode("/",$mama);   //Add    substr()
                    $zzz="/1,1,1";
                    for ($p=1;$p<count($ff);$p=$p+1){       //new Add   <=
                        $un=explode(",",$ff[$p]);
                        for ($k=0;$k<=2;$k=$k+1){
                            for ($t=0;$t<=1;$t=$t+1){
                                if (intval($un[$t])>intval($un[$t+1])){
                                    $tmp=$un[$t+1];
                                    $un[$t+1]=$un[$t];
                                    $un[$t]=$tmp;
                                }
                            }
                        }
                        $x=$un[0].",".$un[1].",".$un[2];
                        $zzz=$zzz."/".$x;
                    }
                }else{
                    $mu=explode(",",$number1);
                    $mamama="1,1,1";
                    $mama='';
                    for ($f=0;$f<count($mu);$f=$f+1){
                        $t=0;
                        for ($t=0;$t<count($mu);$t=$t+1){
                            if ($f!=$t and $f<$t){
                                $mama=$mama."/".$mu[$f].",".$mu[$t];
                            }
                        }
                    }
                    $ma=explode("/",substr($mama,1));
                    for ($f=0;$f<count($mu);$f=$f+1){
                        for ($t=0;$t<count($ma);$t=$t+1){
                            $ma11=explode(",",$ma[$t]);
                            if ($ma11[0]!=$mu[$f] and $ma11[1]!=$mu[$f]){
                                if ($f!=$t and $f<$t){
                                    $mamama=$mamama."#".$ma[$t].",".$mu[$f];
                                }
                            }
                        }
                    }

                    $ff=explode("#",$mamama);
                    for ($p=0;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        for ($k=0;$k<=2;$k=$k+1){
                            for ($f=0;$f<=1;$f=$f+1){
                                if ($un[$f]>$un[$f+1]){
                                    $tmp=$un[$f+1];
                                    $un[$f+1]=$un[$f];
                                    $un[$f]=$tmp;
                                }
                            }
                        }
                        $ff[$p]=$un[0].",".$un[1].",".$un[2];
                    }
                    $zzz='';
                    for ($f=0;$f<count($ff);$f=$f+1){
                        if (!empty($zzz) && strpos($zzz,$ff[$f])>0){
                        }else{
                            $zzz=$zzz."/".$ff[$f];
                        }
                    }
                }
                break;

            case "二全中":
                if (input('pabc')==1){
                    $mama="1,1";
                    $mu=explode(",",$number1);
                    for ($f=0;$f<count($mu);$f=$f+1){
                        for ($t=0;$t<count($mu);$t=$t+1){
                            if ($f!=$t and $f<$t){
                                $mama=$mama."/".$mu[$f].",".$mu[$t];
                            }
                        }
                    }

                    $f=0;
                    $ff=explode("/",$mama);
                    $zzz='';
                    for ($p=0;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        if (intval($un[$f])>intval($un[$f+1])){
                            $tmp=$un[$f+1];
                            $un[$f+1]=$un[$f];
                            $un[$f]=$tmp;
                        }

                        $x=$un[0].",".$un[1];
                        $zzz=$zzz."/".$x;
                    }
                }
                if (input('pabc')==2){
                    $mama="1,1";
                    $mu=explode(",",$number1);
                    $number2=input('dm1');
                    for ($f=0;$f<count($mu);$f=$f+1){
                        $mama=$mama."/".$mu[$f].",".input('dm1');
                    }
                    $ff=explode("/",$mama);
                    $zzz="/1,1,1";
                    for ($p=1;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        if ($un[0]>$un[1]){
                            $tmp=$un[1];
                            $un[1]=$un[0];
                            $un[0]=$tmp;
                        }
                        $x=$un[0].",".$un[1];
                        $zzz=$zzz."/".$x;

                    }
                }

                if (input('pabc')==3 or input('pabc')==4 or input('pabc')==5){
                    $mu=explode(",",$number1);
                    $mu1=explode(",",$number2);
                    $mama="1,1";
                    for ($f=0;$f<=count($mu)-1;$f=$f+1){
                        for ($t=0;$t<=count($mu1)-1;$t=$t+1){
                            if ($mu[$f]!=$mu1[$t]){
                                $mama=$mama."/".$mu[$f].",".$mu1[$t];
                            }
                        }
                    }
                    $ff=explode("/",substr($mama,1));
                    $zzz="/1,1,1";
                    for ($p=1;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        if ($un[0]>$un[1]){
                            $tmp=$un[1];
                            $un[1]=$un[0];
                            $un[0]=$tmp;
                        }
                        $x=$un[0].",".$un[1];
                        $zzz=$zzz."/".$x;
                    }
                }
                break;
            case "二中特":
                if (input('pabc')==1){
                    $mama="1,1";
                    $mu=explode(",",$number1);
                    for ($f=0;$f<count($mu)-1;$f=$f+1){
                        for ($t=0;$t<count($mu)-1;$t=$t+1){
                            if ($f!=$t and $f<$t){
                                $mama=$mama."/".$mu[$f].",".$mu[$t];
                            }
                        }
                    }
                    $ff=explode("/",substr($mama,1));
                    $zzz='';
                    $f=0;
                    for ($p=0;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        if (intval($un[$f])>intval($un[$f+1])){
                            $tmp=$un[$f+1];
                            $un[$f+1]=$un[$f];
                            $un[$f]=$tmp;
                        }
                        $x=$un[0].",".$un[1];
                        $zzz=$zzz."/".$x;
                    }
                }
                if (input('pabc')==2){
                    $mama="1,1";
                    $mu=explode(",",$number1);
                    $number2=input('dm1');
                    for ($f=0;$f<count($mu)-1;$f=$f+1){
                        $mama=$mama."/".$mu[$f].",".input('dm1');
                    }
                    $ff=explode("/",substr($mama,1));
                    $zzz="/1,1,1";
                    for ($p=1;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        if ($un[0]>$un[1]){
                            $tmp=$un[1];
                            $un[1]=$un[0];
                            $un[0]=$tmp;
                        }
                        $x=$un[0].",".$un[1];
                        $zzz=$zzz."/".$x;
                    }
                }

                if (input('pabc')==3 or input('pabc')==4 or input('pabc')==5){
                    $mu=explode(",",$number1);
                    $mu1=explode(",",$number2);
                    $mama="1,1";
                    for ($f=0;$f<=count($mu)-1;$f=$f+1){
                        for ($t=0;$t<=count($mu1)-1;$t=$t+1){
                            if ($mu[$f]!=$mu1[$t]){
                                $mama=$mama."/".$mu[$f].",".$mu1[$t];
                            }
                        }
                    }

                    $ff=explode("/",$mama);
                    $zzz="/1,1,1";
                    for ($p=1;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        if ($un[0]>$un[1]){
                            $tmp=$un[1];
                            $un[1]=$un[0];
                            $un[0]=$tmp;
                        }
                        $x=$un[0].",".$un[1];
                        $zzz=$zzz."/".$x;
                    }
                }
                break;
            case "特串":
                if (input('pabc')==1){
                    $mama="1,1";
                    $mu=explode(",",$number1);
                    for ($f=0;$f<count($mu);$f=$f+1){
                        for ($t=0;$t<count($mu);$t=$t+1){
                            if ($f!=$t and $f<$t){
                                $mama=$mama."/".$mu[$f].",".$mu[$t];
                            }
                        }
                    }
                    $ff=explode("/",$mama);
                    $zzz='';
                    $f=0;
                    for ($p=0;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        if (intval($un[$f])>intval($un[$f+1])){
                            $tmp=$un[$f+1];
                            $un[$f+1]=$un[$f];
                            $un[$f]=$tmp;
                        }
                        $x=$un[0].",".$un[1];
                        $zzz=$zzz."/".$x;
                    }
                }
                if (input('pabc')==2){
                    $mama="1,1";
                    $mu=explode(",",$number1);
                    $number2=input('dm1');
                    for ($f=0;$f<count($mu);$f=$f+1){
                        $mama=$mama."/".$mu[$f].",".input('dm1');
                    }
                    $ff=explode("/",$mama);
                    $zzz="/1,1,1";
                    for ($p=1;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        if ($un[0]>$un[1]){
                            $tmp=$un[1];
                            $un[1]=$un[0];
                            $un[0]=$tmp;
                        }
                        $x=$un[0].",".$un[1];
                        $zzz=$zzz."/".$x;
                    }
                }

                if (input('pabc')==3 or input('pabc')==4 or input('pabc')==5){
                    $mu=explode(",",$number1);
                    $mu1=explode(",",$number2);
                    $mama="1,1";

                    for ($f=0;$f<=count($mu)-1;$f=$f+1){
                        for ($t=0;$t<=count($mu1)-1;$t=$t+1){
                            if ($mu[$f]!=$mu1[$t]){
                                $mama=$mama."/".$mu[$f].",".$mu1[$t];
                            }
                        }
                    }
                    $ff=explode("/",$mama);
                    $zzz="/1,1,1";
                    for ($p=1;$p<count($ff);$p=$p+1){
                        $un=explode(",",$ff[$p]);
                        if ($un[0]>$un[1]){
                            $tmp=$un[1];
                            $un[1]=$un[0];
                            $un[0]=$tmp;
                        }
                        $x=$un[0].",".$un[1];
                        $zzz=$zzz."/".$x;
                    }
                }
                break;
        }
//        $number1=$number1;
        if (input('pabc')==2){
            if (input('dm1')){
                $number1=$number1.",".input('dm1');
            }
            if (input('dm2')){
                $number1=$number1.",".input('dm2');
            }
        }
        if (input('pabc')==3 || input('pabc')==4 || input('pabc')==5 ){
            $number1=$number1.",".$number2;
        }

        switch (input('rtype')){
            case "三全中":
                $rtype="三全中";
                $rate_id=1801;
                if (input('pabc')==2){
                    $zs=$n;
                }else{
                    $zs=$n*($n-1)*($n-2)/6;
                }
                $R=14;
                break;
            case "三中二":
                $R=15;
                $rtype="三中二";
                if (input('pabc')==2){
                    $zs=$n;
                }else{
                    $zs=$n*($n-1)*($n-2)/6;
                }
                $rate_id=1851;
                break;
            case "二全中":
                $R=13;
                $rtype="二全中";
                if (input('pabc')==3 or input('pabc')==4 or input('pabc')==5){
                    $zs=$n1*$m1;
                }elseif (input('pabc')==2) {
                    $zs=$n;
                }else{
                    $zs=$n*($n-1)/2;
                }
                $rate_id=1901;
                break;
            case "二中特":
                $R=16;
                if (input('pabc')==3 or input('pabc')==4 or input('pabc')==5){
                    $zs=$n1*$m1;
                }elseif (input('pabc')==2) {
                    $zs=$n;
                }else{
                    $zs=$n*($n-1)/2;
                }
                $rate_id=1951;
                $rtype="二中特";
                break;

            case "特串":
                $R=17;
                if (input('pabc')==3 or input('pabc')==4 or input('pabc')==5){
                    $zs=$n1*$m1;
                }elseif (input('pabc')==2) {
                    $zs=$n;
                }else{
                    $zs=$n*($n-1)/2;
                }
                $rate_id=2001;
                $rtype="特串";
                break;
        }
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $result=Db::name('tan')->field('sum(sum_m) as sum_mm')->where(['kithe'=>getKitheNum(),'username'=>$sess['kauser'],'class1'=>'连码','class2'=>$rtype])->select();
        $sum_money=$result[0]['sum_mm'];

        if ($zs==0){
            $this->redirect('index/errorPage',['msg'=>'请选择相应码数!']);
        }
        $jq=input('jq/f');
        if(!$jq)$this->redirect('index/errorPage',['msg'=>'请输入下注金额']);
        if($jq < $mem['xy'])$this->redirect('index/errorPage',['msg'=>'下注最低额度'.$mem['xy']]);
        if($jq*$zs > getQuotaField(input('xc'),'xx'))$this->redirect('index/errorPage',['msg'=>'下注金额已超过单注限额'. getQuotaField(input('xc'),'xx')]);

        $rsw = Db::name('tan')->field('SUM(sum_m) As sum_m1')->where(['kithe'=>getKitheNum(),'username'=>$sess['kauser']])->select();
        $mkmk=$rsw[0]['sum_m1'];
        $XF=21;
        $bl=getBlById($rate_id);
        $class2=$bl['class2'];

        return $this->fetch('',[
            'mem'=>$mem,
            'mkmk'=>$mkmk,
            'class2'=>$class2,
            'bl'=>$bl,
            'zs'=>$zs,
            'jq'=>input('jq/f'),
            'money1'=>getQuotaField($R,'xx'),   //单注限额
            'money2'=>getQuotaField($R,'xxx'),   //单号限额
            'rate_id'=>$rate_id,
            'rate'=>$bl['rate']*1000,
            'zzz'=>$zzz,
            'number1'=>$number1,
            'number2'=>$number2,
            'number3'=>$number3,
            'rtype'=>$rtype
        ]);
    }

    public function tanLm(){
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $number3=input('number3');
        $number2=input('number2');
        $number3=$number2."--".$number3;
        $XF=21;
        $this->fp($XF);
        $rate_id=input('rate_id');
        $gold=input('gold');
        $bl=getBlById($rate_id);
        switch ($bl['class2']){
            case "三全中":
                $R=14;
                $ratess2=0;
                break;
            case "二全中":
                $R=13;
                $ratess2=0;
                break;
            case "三中二":
                $blf=getBlById(618);
                $ratess2=$blf['rate'];
                $l_type="中二";
                $R=15;
                break;
            case "二中特":
                $blf=getBlById(614);
                $ratess2=$blf['rate'];
                $l_type="中特";
                $R=16;
                break;
            case "特串":
                $R=17;
                $ratess2=0;
                break;
        }
        $sum_sum=input('gold')*input('icradio1');

        if ($sum_sum>$mem['ts']){
            $this->redirect('index/errorPage',['msg'=>'对不起，下注总额不能大于可用信用额']);
        }

        $number1=input('number1');
        $mu=explode("/",$number1);
        $ioradio1=1;
        $t=3;
        $fin_res=[];
        for ($t=2;$t<count($mu);$t=$t+1) {
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
            $num = randStr();
            $text = date("Y-m-d H:i:s");
            $class11 = "连码";
            $class22 = $bl['class2'];
            $class33 = $mu[$t];
            $sum_m = input('gold/f');
            $user_ds = getQuotaField($R, 'yg');
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
            $rnum = explode(",", $class33);

            switch (input('rtype')) {
                case "三全中":
                    $rx = getBlById($rnum[0] + 1800);
                    $r1 = $rx['rate'];
                    $rx = getBlById($rnum[1] + 1800);
                    $r2 = $rx['rate'];
                    $rx = getBlById($rnum[2] + 1800);
                    $r3 = $rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    if ($r3 < $rate5) {
                        $rate5 = $r3;
                    }
                    break;
                case "三中二":
                    $rx = getBlById($rnum[0] + 1850);
                    $r1 = $rx['rate'];
                    $rx = getBlById($rnum[1] + 1850);
                    $r2 = $rx['rate'];
                    $rx = getBlById($rnum[2] + 1850);
                    $r3 = $rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    if ($r3 < $rate5) {
                        $rate5 = $r3;
                    }
                    break;

                case "二全中":
                    $rx = getBlById($rnum[0] + 1900);
                    $r1 = $rx['rate'];
                    $rx = getBlById($rnum[1] + 1900);
                    $r2 = $rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    break;
                case "二中特":
                    $rx = getBlById($rnum[0] + 1950);
                    $r1 = $rx['rate'];
                    $rx = getBlById($rnum[1] + 1950);
                    $r2 = $rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    break;
                case "特串":
                    $rx = getBlById($rnum[0] + 2000);
                    $r1 = $rx['rate'];
                    $rx = getBlById($rnum[1] + 2000);
                    $r2 = $rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    break;
            }

            $danid = $mem['danid'];
            $zongid = $mem['zongid'];
            $guanid = $mem['guanid'];
            $memid = $mem['id'];
            $abcd = $mem['abcd'];
            $result2 = Db::name('tan')->field('SUM(sum_m) As sum_m')->where(['kithe' => getKitheNum(), 'class1' => $class11, 'class2' => $class22, 'username' => $mem['kauser']])->select();
            $rs5 = $result2[0]['sum_m'];
            if (($rs5 + $sum_m) > getQuotaField($R, 'xxx')) {
                $this->redirect('index/errorPage', ['msg' => '对不起，超过单项限额.请反回重新下注!']);
                echo "<script Language=Javascript>alert('对不起，超过单项限额.请反回重新下注!');parent.k_memr.location.href='index.php?action=k_lm';window.location.href='index.php?action=left';</script>";
                exit;
            }

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
                'rate2' => $ratess2,
                'guan1'=>$guan1,
                'guanid1'=>$guanid1,
                'guan1_zc'=>$guan1_zc,
                'guan1_ds'=>$guan1_ds
            ];
            $res = Db::name('tan')->insert($arr);
            if (!$res) $this->redirect('index/errorPage', ['msg' => '数据库操作失败!']);
            $res1 = Db::name('mem')->where(['kauser' => $mem['kauser']])->setDec('ts', $sum_m);
            if (!$res1) $this->redirect('index/errorPage', ['msg' => '用户表修改失败!']);

            $fin_res[$t-1]['class22']= $class22;
            $fin_res[$t-1]['hm']=$mu[$t];
            $fin_res[$t-1]['rate5']=$rate5;
            $fin_res[$t-1]['sum_m']=$sum_m;

            //分成
            //代理
            $row6=Db::name('guan')->where(['kauser'=>$dai])->find();
            $best=$row6['best'];
            $pz=$row6['pz'];
            $sj=$row6['sj'];
            $sf=$row6['sf'];
            $cs=$row6['cs'];
            $danid=$row6['id'];
            if($class22=="三全中")	$ffff=$row6['lm1'];
            if($class22=="三中二")	$ffff=$row6['lm2'];
            if($class22=="二全中")	$ffff=$row6['lm3'];
            if($class22=="二中特")	$ffff=$row6['lm4'];
            if($class22=="特串")	$ffff=$row6['lm5'];

            if ($pz==0 and $best==1 and $ffff>=0){
                //占成
                $result5=Db::name('tan')->field('sum(sum_m*dai_zc/10) as sum_m')->where(['kithe'=>getKitheNum(),'dai'=>$dai,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
                $Rs5 = $result5[0];
                if ($Rs5['sum_m']!=""){
                    $sum_mff = $Rs5['sum_m'];
                }else{
                    $sum_mff =0;
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

                if ($sum_m>=1 and $ffff>=0 and $smsmi>0){ ///代理补
                    $sf=Db::name('guan')->where(['kauser'=>$zong])->value('sj');
                    $username=$dai;
                    $rate=$rate5;
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
                        'rate2'=>$ratess2,
                        'guan1'=>$guan1,
                        'guan1_zc'=>$guan1_zc,
                        'guan1_ds'=>$guan1_ds
                    ];
                    $resx1=Db::name('tan')->insert($arr2);
                    if(!$resx1)$this->redirect('index/errorPage',['msg'=>'数据库修改出错']);
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

            if($class22=="三全中")	$ffff=$row6['lm1'];
            if($class22=="三中二")	$ffff=$row6['lm2'];
            if($class22=="二全中")	$ffff=$row6['lm3'];
            if($class22=="二中特")	$ffff=$row6['lm4'];
            if($class22=="特串")	$ffff=$row6['lm5'];

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
                    $b=getBlById($rate_id);
                    $rate=$b['rate'];
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
                        'rate2'=>$ratess2,
                        'guan1'=>$guan1,
                        'guan1_zc'=>$guan1_zc,
                        'guan1_ds'=>$guan1_ds
                    ];
                    $resx1=Db::name('tan')->insert($arr3);
                    if(!$resx1)$this->redirect('index/errorPage',['msg'=>'数据库修改出错']);
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

            if($class22=="三全中")	$ffff=$row6['lm1'];
            if($class22=="三中二")	$ffff=$row6['lm2'];
            if($class22=="二全中")	$ffff=$row6['lm3'];
            if($class22=="二中特")	$ffff=$row6['lm4'];
            if($class22=="特串")	$ffff=$row6['lm5'];

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

                if ($sum_m>=1 and $ffff>0 and $smsmi>0){ ///股东补


                    $username=$guan;
                    $b=getBlById($rate_id);
                    $rate=$b['rate'];
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
                        'rate2'=>$ratess2,
                        'guan1'=>$guan1,
                        'guan1_zc'=>$guan1_zc,
                        'guan1_ds'=>$guan1_ds
                    ];
                    $resx1=Db::name('tan')->insert($arr4);
                    if(!$resx1)$this->redirect('index/errorPage',['msg'=>'数据库修改出错']);
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

            if($class22=="三全中")	$ffff=$row6['lm1'];
            if($class22=="三中二")	$ffff=$row6['lm2'];
            if($class22=="二全中")	$ffff=$row6['lm3'];
            if($class22=="二中特")	$ffff=$row6['lm4'];
            if($class22=="特串")	$ffff=$row6['lm5'];

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

                if ($sum_m>=1 and $ffff>0 and $smsmi>0){ ///大股东补
                    $username=$guan1;
                    $b=getBlById($rate_id);
                    $rate=$b['rate'];
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
                        'rate2'=>$ratess2,
                        'guan1'=>$guan1,
                        'guan1_zc'=>$guan1_zc,
                        'guan1_ds'=>$guan1_ds
                    ];
                    $resx1=Db::name('tan')->insert($arr5);
                    if(!$resx1)$this->redirect('index/errorPage',['msg'=>'数据库修改出错']);
                }//完成大股东补
            }
            $arrx=[
                'num'=>$num,
                'username'=>$mem['kauser'],
                'kithe'=>getKitheNum(),
                'adddate'=>$text,
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
                'abcd'=>$abcd,
                'lx'=>0,
                'rate2'=>$ratess2
            ];
            $res2=Db::name('tong')->insert($arrx);
            if(!$res2)$this->redirect('index/errorPage',['msg'=>'数据库修改出错']);
        }

        return $this->fetch('',[
            'fin_res'=>$fin_res,
        ]);
    }
}