<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/1/2
 * Time: 16:28
 */
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
/*下注 --五不中*/
class BetsWbz extends Common{
    public  function  index(){
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $ids=input('ids') ? input('ids') : '五不中';

        if ($ids=="五不中") {
            $xc=37;
            $XF=21;
        }
        if ($ids=="六不中") {
            $xc=38;
            $XF=21;
        }
        if ($ids=="七不中") {
            $xc=39;
            $XF=21;
        }
        if ($ids=="八不中") {
            $xc=40;
            $XF=21;
        }
        if ($ids=="九不中") {
            $xc=41;
            $XF=21;
        }
        if ($ids=="十不中") {
            $xc=42;
            $XF=21;
        }
        if ($ids=="十一不中") {
            $xc=43;
            $XF=21;
        }
        if ($ids=="十二不中") {
            $xc=44;
            $XF=21;
        }
        $this->fp($XF);

        $result=Db::name('bl')->field('class3,rate')->where(['class2'=>$ids])->select();
        $y=count($result);
        return $this->fetch('',[
            'ids'=>$ids,
            'mem'=>$mem,
            'xc'=>$xc,
            'bzx'=>getConfigField('bzx'),
            'czx'=>getConfigField('czx'),
            'dzx'=>getConfigField('dzx'),
            'bzxdx'=>getConfigField('bztdx'),
            'czxdx'=>getConfigField('cztdx'),
            'dzxdx'=>getConfigField('dztdx'),
        ]);
    }

    public function saveWbz(){
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $zs=0;
        $n=0;       //获取的数量
        $number1='';
        for ($t=1;$t<=49;$t=$t+1){
            if (input('Num_'.$t)){
                $number1.=intval(input('Num_'.$t)).",";
                $n=$n+1;
            }
        }
        $url=input('from_url');
        if (input('rtype')=="五不中" and ($n<5 or $n>10)){
            $this->redirect('index/errorPage',['msg'=>'请选择五至十个号码!']);
        }
        if (input('rtype')=="六不中" and ($n<6 or $n>10)){
            $this->redirect('index/errorPage',['msg'=>'请选择六至十个号码!']);
        }
        if (input('rtype')=="七不中" and ($n<7 or $n>10)){
            $this->redirect('index/errorPage',['msg'=>'请选择七至十个号码!']);
        }
        if (input('rtype')=="八不中" and ($n<8 or $n>10)){
            $this->redirect('index/errorPage',['msg'=>'请选择八至十个号码!']);
        }
        if (input('rtype')=="九不中" and ($n<9 or $n>11)){
            $this->redirect('index/errorPage',['msg'=>'请选择九至十一个号码!']);
        }
        if (input('rtype')=="十不中" and ($n<10 or $n>12)){
            $this->redirect('index/errorPage',['msg'=>'请选择十至十二个号码!']);
        }
        if (input('rtype')=="十一不中"  and ($n<10 or $n>13)){
            $this->redirect('index/errorPage',['msg'=>'请选择十一至十三个号码!']);
        }
        if (input('rtype')=="十二不中" and ($n<10 or $n>14)){
            $this->redirect('index/errorPage',['msg'=>'请选择十二至十四个号码!']);
        }
        $zzz='';    //自定义初始值
        $mama='';   //所有组合   / 组合1/组合2/....
        switch (input('rtype')){
            case "五不中":
                $mu=explode(",",$number1);
                $mamama="1,1,1,1,1";
                for ($d=0;$d<count($mu)-5;$d=$d+1){
                    for ($f=$d+1;$f<count($mu)-4;$f=$f+1){
                        for ($t=$f+1;$t<count($mu)-3;$t=$t+1){
                            for ($u=$t+1;$u<count($mu)-2;$u=$u+1){
                                for ($v=$u+1;$v<count($mu)-1;$v=$v+1){
                                    $mama=$mama."/".$mu[$d].",".$mu[$f].",".$mu[$t].",".$mu[$u].",".$mu[$v];
                                }
                            }
                        }
                    }
                }
                $ff=explode("/",substr($mama,1));
                for ($p=0;$p<count($ff);$p=$p+1){
                    $un=explode(",",$ff[$p]);
                    for ($k=0;$k<=3;$k=$k+1){
                        for ($f=$k+1;$f<=4;$f=$f+1){
                            if ($un[$k]>$un[$f]){
                                $tmp=$un[$k];
                                $un[$k]=$un[$f];
                                $un[$f]=$tmp;
                            }
                        }
                    }
                    $ff[$p]=$un[0].",".$un[3].",".$un[2].",".$un[1].",".$un[4];
                }
//                var_dump($ff);
//                exit;
                for ($f=0;$f<count($ff);$f=$f+1){
                    if (false){  //strpos($zzz,$ff[$f])>0
                    }else{
                        $zzz=$zzz."/".$ff[$f];
                    }
                }
                break;
            case "六不中":
                $mu=explode(",",$number1);
                $mamama="1,1,1,1,1,1";
                for ($d=0;$d<count($mu)-6;$d=$d+1){
                    for ($f=$d+1;$f<count($mu)-5;$f=$f+1){
                        for ($t=$f+1;$t<count($mu)-4;$t=$t+1){
                            for ($u=$t+1;$u<count($mu)-3;$u=$u+1){
                                for ($v=$u+1;$v<count($mu)-2;$v=$v+1){
                                    for ($w=$v+1;$w<count($mu)-1;$w=$w+1){
                                        $mama=$mama."/".$mu[$d].",".$mu[$f].",".$mu[$t].",".$mu[$u].",".$mu[$v].",".$mu[$w];
                                    }
                                }
                            }
                        }
                    }
                }

                $ff=explode("/",substr($mama,1));
                for ($p=0;$p<count($ff);$p=$p+1){
                    $un=explode(",",$ff[$p]);
                    for ($k=0;$k<=4;$k=$k+1){
                        for ($f=$k+1;$f<=5;$f=$f+1){
                            if ($un[$k]>$un[$f]){
                                $tmp=$un[$k];
                                $un[$k]=$un[$f];
                                $un[$f]=$tmp;
                            }
                        }
                    }
                    $ff[$p]=$un[0].",".$un[4].",".$un[3].",".$un[2].",".$un[1].",".$un[5];
                }
                for ($f=0;$f<count($ff);$f=$f+1){
                    if (strpos($zzz,$ff[$f])>0){
                    }else{
                        $zzz=$zzz."/".$ff[$f];
                    }
                }
                break;

            case "七不中":

                $mu=explode(",",$number1);
                $mamama="1,1,1,1,1,1,1";
                for ($d=0;$d<count($mu)-7;$d=$d+1){
                    for ($f=$d+1;$f<count($mu)-6;$f=$f+1){
                        for ($t=$f+1;$t<count($mu)-5;$t=$t+1){
                            for ($u=$t+1;$u<count($mu)-4;$u=$u+1){
                                for ($v=$u+1;$v<count($mu)-3;$v=$v+1){
                                    for ($w=$v+1;$w<count($mu)-2;$w=$w+1){
                                        for ($x=$w+1;$x<count($mu)-1;$x=$x+1){
                                            $mama=$mama."/".$mu[$d].",".$mu[$f].",".$mu[$t].",".$mu[$u].",".$mu[$v].",".$mu[$w].",".$mu[$x];
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                $ff=explode("/",substr($mama,1));
                for ($p=0;$p<count($ff);$p=$p+1){
                    $un=explode(",",$ff[$p]);
                    for ($k=0;$k<=5;$k=$k+1){
                        for ($f=$k+1;$f<=6;$f=$f+1){
                            if ($un[$k]>$un[$f]){
                                $tmp=$un[$k];
                                $un[$k]=$un[$f];
                                $un[$f]=$tmp;
                            }
                        }
                    }
                    $ff[$p]=$un[0].",".$un[5].",".$un[4].",".$un[3].",".$un[2].",".$un[1].",".$un[6];
                }
                for ($f=0;$f<count($ff);$f=$f+1){
                    if (strpos($zzz,$ff[$f])>0){
                    }else{
                        $zzz=$zzz."/".$ff[$f];
                    }

                }
                break;

            case "八不中":

                $mu=explode(",",$number1);
                $mamama="1,1,1,1,1,1,1,1";
                for ($d=0;$d<count($mu)-8;$d=$d+1){
                    for ($f=$d+1;$f<count($mu)-7;$f=$f+1){
                        for ($t=$f+1;$t<count($mu)-6;$t=$t+1){
                            for ($u=$t+1;$u<count($mu)-5;$u=$u+1){
                                for ($v=$u+1;$v<count($mu)-4;$v=$v+1){
                                    for ($w=$v+1;$w<count($mu)-3;$w=$w+1){
                                        for ($x=$w+1;$x<count($mu)-2;$x=$x+1){
                                            for ($y=$x+1;$y<count($mu)-1;$y=$y+1){
                                                $mama=$mama."/".$mu[$d].",".$mu[$f].",".$mu[$t].",".$mu[$u].",".$mu[$v].",".$mu[$w].",".$mu[$x].",".$mu[$y];
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                $ff=explode("/",substr($mama,1));
                for ($p=0;$p<count($ff);$p=$p+1){
                    $un=explode(",",$ff[$p]);
                    for ($k=0;$k<=6;$k=$k+1){
                        for ($f=$k+1;$f<=7;$f=$f+1){
                            if ($un[$k]>$un[$f]){
                                $tmp=$un[$k];
                                $un[$k]=$un[$f];
                                $un[$f]=$tmp;
                            }
                        }
                    }
                    $ff[$p]=$un[0].",".$un[6].",".$un[5].",".$un[4].",".$un[3].",".$un[2].",".$un[1].",".$un[7];
                }
                for ($f=0;$f<count($ff);$f=$f+1){
                    if (strpos($zzz,$ff[$f])>0){
                    }else{
                        $zzz=$zzz."/".$ff[$f];
                    }
                }
                break;

            case "九不中":

                $mu=explode(",",$number1);
                $mamama="1,1,1,1,1,1,1,1,1";
                for ($d=0;$d<count($mu)-9;$d=$d+1){
                    for ($f=$d+1;$f<count($mu)-8;$f=$f+1){
                        for ($t=$f+1;$t<count($mu)-7;$t=$t+1){
                            for ($u=$t+1;$u<count($mu)-6;$u=$u+1){
                                for ($v=$u+1;$v<count($mu)-5;$v=$v+1){
                                    for ($w=$v+1;$w<count($mu)-4;$w=$w+1){
                                        for ($x=$w+1;$x<count($mu)-3;$x=$x+1){
                                            for ($y=$x+1;$y<count($mu)-2;$y=$y+1){
                                                for ($z=$y+1;$z<count($mu)-1;$z=$z+1){
                                                    $mama=$mama."/".$mu[$d].",".$mu[$f].",".$mu[$t].",".$mu[$u].",".$mu[$v].",".$mu[$w].",".$mu[$x].",".$mu[$y].",".$mu[$z];
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                $ff=explode("/",substr($mama,1));
                for ($p=0;$p<count($ff);$p=$p+1){
                    $un=explode(",",$ff[$p]);
                    for ($k=0;$k<=7;$k=$k+1){
                        for ($f=$k+1;$f<=8;$f=$f+1){
                            if ($un[$k]>$un[$f]){
                                $tmp=$un[$k];
                                $un[$k]=$un[$f];
                                $un[$f]=$tmp;
                            }
                        }
                    }
                    $ff[$p]=$un[0].",".$un[7].",".$un[6].",".$un[5].",".$un[4].",".$un[3].",".$un[2].",".$un[1].",".$un[8];
                }
                for ($f=0;$f<count($ff);$f=$f+1){
                    if (strpos($zzz,$ff[$f])>0){
                    }else{
                        $zzz=$zzz."/".$ff[$f];
                    }
                }
                break;

            case "十不中":

                $mu=explode(",",$number1);
                $mamama="1,1,1,1,1,1,1,1,1,1";
                for ($d=0;$d<count($mu)-10;$d=$d+1){
                    for ($f=$d+1;$f<count($mu)-9;$f=$f+1){
                        for ($t=$f+1;$t<count($mu)-8;$t=$t+1){
                            for ($u=$t+1;$u<count($mu)-7;$u=$u+1){
                                for ($v=$u+1;$v<count($mu)-6;$v=$v+1){
                                    for ($w=$v+1;$w<count($mu)-5;$w=$w+1){
                                        for ($x=$w+1;$x<count($mu)-4;$x=$x+1){
                                            for ($y=$x+1;$y<count($mu)-3;$y=$y+1){
                                                for ($z=$y+1;$z<count($mu)-2;$z=$z+1){
                                                    for ($g=$z+1;$g<count($mu)-1;$g=$g+1){
                                                        $mama=$mama."/".$mu[$d].",".$mu[$f].",".$mu[$t].",".$mu[$u].",".$mu[$v].",".$mu[$w].",".$mu[$x].",".$mu[$y].",".$mu[$z].",".$mu[$g];
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                $ff=explode("/",substr($mama,1));
                for ($p=0;$p<count($ff);$p=$p+1){
                    $un=explode(",",$ff[$p]);
                    for ($k=0;$k<=8;$k=$k+1){
                        for ($f=$k+1;$f<=9;$f=$f+1){
                            if ($un[$k]>$un[$f]){
                                $tmp=$un[$k];
                                $un[$k]=$un[$f];
                                $un[$f]=$tmp;
                            }
                        }
                    }
                    $ff[$p]=$un[0].",".$un[8].",".$un[7].",".$un[6].",".$un[5].",".$un[4].",".$un[3].",".$un[2].",".$un[1].",".$un[9];
                }
                for ($f=0;$f<count($ff);$f=$f+1){
                    if (strpos($zzz,$ff[$f])>0){
                    }else{
                        $zzz=$zzz."/".$ff[$f];
                    }
                }
                break;

            case "十一不中":

                $mu=explode(",",$number1);
                $mamama="1,1,1,1,1,1,1,1,1,1,1";
                for ($d=0;$d<count($mu)-11;$d=$d+1){
                    for ($f=$d+1;$f<count($mu)-10;$f=$f+1){
                        for ($t=$f+1;$t<count($mu)-9;$t=$t+1){
                            for ($u=$t+1;$u<count($mu)-8;$u=$u+1){
                                for ($v=$u+1;$v<count($mu)-7;$v=$v+1){
                                    for ($w=$v+1;$w<count($mu)-6;$w=$w+1){
                                        for ($x=$w+1;$x<count($mu)-5;$x=$x+1){
                                            for ($y=$x+1;$y<count($mu)-4;$y=$y+1){
                                                for ($z=$y+1;$z<count($mu)-3;$z=$z+1){
                                                    for ($g=$z+1;$g<count($mu)-2;$g=$g+1){
                                                        for ($h=$g+1;$h<count($mu)-1;$h=$h+1){
                                                            $mama=$mama."/".$mu[$d].",".$mu[$f].",".$mu[$t].",".$mu[$u].",".$mu[$v].",".$mu[$w].",".$mu[$x].",".$mu[$y].",".$mu[$z].",".$mu[$g].",".$mu[$h];
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                $ff=explode("/",substr($mama,1));
                for ($p=0;$p<count($ff);$p=$p+1){
                    $un=explode(",",$ff[$p]);
                    for ($k=0;$k<=9;$k=$k+1){
                        for ($f=$k+1;$f<=10;$f=$f+1){
                            if ($un[$k]>$un[$f]){
                                $tmp=$un[$k];
                                $un[$k]=$un[$f];
                                $un[$f]=$tmp;
                            }
                        }
                    }
                    $ff[$p]=$un[0].",".$un[9].",".$un[8].",".$un[7].",".$un[6].",".$un[5].",".$un[4].",".$un[3].",".$un[2].",".$un[1].",".$un[10];
                }
                for ($f=0;$f<count($ff);$f=$f+1){
                    if (strpos($zzz,$ff[$f])>0){
                    }else{
                        $zzz=$zzz."/".$ff[$f];
                    }
                }
                break;


            case "十二不中":

                $mu=explode(",",$number1);
                $mamama="1,1,1,1,1,1,1,1,1,1,1,1";
                for ($d=0;$d<count($mu)-12;$d=$d+1){
                    for ($f=$d+1;$f<count($mu)-11;$f=$f+1){
                        for ($t=$f+1;$t<count($mu)-10;$t=$t+1){
                            for ($u=$t+1;$u<count($mu)-9;$u=$u+1){
                                for ($v=$u+1;$v<count($mu)-8;$v=$v+1){
                                    for ($w=$v+1;$w<count($mu)-7;$w=$w+1){
                                        for ($x=$w+1;$x<count($mu)-6;$x=$x+1){
                                            for ($y=$x+1;$y<count($mu)-5;$y=$y+1){
                                                for ($z=$y+1;$z<count($mu)-4;$z=$z+1){
                                                    for ($g=$z+1;$g<count($mu)-3;$g=$g+1){
                                                        for ($h=$g+1;$h<count($mu)-2;$h=$h+1){
                                                            for ($i=$h+1;$i<count($mu)-1;$i=$i+1){
                                                                $mama=$mama."/".$mu[$d].",".$mu[$f].",".$mu[$t].",".$mu[$u].",".$mu[$v].",".$mu[$w].",".$mu[$x].",".$mu[$y].",".$mu[$z].",".$mu[$g].",".$mu[$h].",".$mu[$i];
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                $ff=explode("/",substr($mama,1));
                for ($p=0;$p<count($ff);$p=$p+1){
                    $un=explode(",",$ff[$p]);
                    for ($k=0;$k<=10;$k=$k+1){
                        for ($f=$k+1;$f<=11;$f=$f+1){
                            if ($un[$k]>$un[$f]){
                                $tmp=$un[$k];
                                $un[$k]=$un[$f];
                                $un[$f]=$tmp;
                            }
                        }
                    }
                    $ff[$p]=$un[0].",".$un[10].",".$un[9].",".$un[8].",".$un[7].",".$un[6].",".$un[5].",".$un[4].",".$un[3].",".$un[2].",".$un[1].",".$un[11];
                }
                for ($f=0;$f<count($ff);$f=$f+1){
                    if (strpos($zzz,$ff[$f])>0){
                    }else{
                        $zzz=$zzz."/".$ff[$f];
                    }
                }
                break;

        }

        switch (input('rtype')){
            case "五不中":
                $rtype="五不中";
                $rate_id=1101;
                $zs=$n*($n-1)*($n-2)*($n-3)*($n-4)/120;
                $R=37;
                break;
            case "六不中":
                $rtype="六不中";
                $rate_id=1151;
                $zs=$n*($n-1)*($n-2)*($n-3)*($n-4)*($n-5)/720;
                $R=38;
                break;

            case "七不中":
                $rtype="七不中";
                $rate_id=1201;
                $zs=$n*($n-1)*($n-2)*($n-3)*($n-4)*($n-5)*($n-6)/5040;
                $R=39;
                break;

            case "八不中":
                $rtype="八不中";
                $rate_id=1251;
                $zs=$n*($n-1)*($n-2)*($n-3)*($n-4)*($n-5)*($n-6)*($n-7)/40320;
                $R=40;
                break;

            case "九不中":
                $rtype="九不中";
                $rate_id=1501;
                $zs=$n*($n-1)*($n-2)*($n-3)*($n-4)*($n-5)*($n-6)*($n-7)*($n-8)/362880;
                $R=41;
                break;
            case "十不中":
                $rtype="十不中";
                $rate_id=1551;
                $zs=$n*($n-1)*($n-2)*($n-3)*($n-4)*($n-5)*($n-6)*($n-7)*($n-8)*($n-9)/3628800;
                $R=42;
                break;

            case "十一不中":
                $rtype="十一不中";
                $rate_id=1601;
                $zs=$n*($n-1)*($n-2)*($n-3)*($n-4)*($n-5)*($n-6)*($n-7)*($n-8)*($n-9)*($n-10)/39916800;
                $R=43;
                break;

            case "十二不中":
                $rtype="十二不中";
                $rate_id=1651;
                $zs=$n*($n-1)*($n-2)*($n-3)*($n-4)*($n-5)*($n-6)*($n-7)*($n-8)*($n-9)*($n-10)*($n-11)/479001600;
                $R=44;
                break;
        }

        $result=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$mem['kauser'],'class1'=>'不中','class2'=>$rtype])->field('sum(sum_m) as sum_mm')->select();
        $sum_money=$result[0]['sum_mm'];
        $XF=21;
        //下注总额
        $result2=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$mem['kauser']])->field('SUM(sum_m) As sum_m1')->select();
        $rsw = $result2[0]['sum_m1'];
        $mkmk=empty($rsw) ? 0 : $rsw;

        //不能大于当前用户总的信用额度
        $all_money=input('jq/f')*$zs;//当前下注金额
        if(!is_numeric(input('jq')))$this->redirect('index/errorPage',['msg'=>'下注金额只能是数字!']);
        if($all_money>$mem['cs'])$this->redirect('index/errorPage',['msg'=>'下注金额不可大於可用信用额度!']);
        if($all_money<$mem['xy'])$this->redirect('index/errorPage',['msg'=>'下注金额不可小於最低限度'.$mem['xy'].'!']);
        if(($all_money+$mkmk) > getQuotaField(input('xc'),'xx') )$this->redirect('index/errorPage',['msg'=>'对不起,号止本期下注金额最高限制'.getQuotaField(input('xc'),'xx')]);
        if($all_money>getQuotaField(input('xc'),'xx'))$this->redirect('index/errorPage',['msg'=>'对不起,下注金额已超过单注限额'.getQuotaField(input('xc'),'xx')]);
        $bl=getBlById($rate_id);
        return $this->fetch('',[
            'mem'=>$mem,
            'mkmk'=>$mkmk,
            'rtype'=>$rtype,
            'number1'=>$number1,        //选择的数字
            'zs'=>$zs,                  //组数
            'jq'=>input('jq/f'),      //下注金额
            'money1'=>getQuotaField($R,'xx'),   //单注限额
            'money2'=>getQuotaField($R,'xxx'),   //单号限额
            'rate_id'=>$rate_id,
            'url'=>$url,
            'rate'=>$bl['rate']*1000,
            'zzz'=>$zzz,
        ]);
    }

    public function tanWbz(){
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $XF=21;
        $this->fp($XF);
        $rate_id=input('rate_id');
        $gold=input('gold');
        $url=input('from_url');
        switch (input('rtype')){
            case "五不中":
                $R=37;
                $ratess2=0;
                break;
            case "六不中":
                $R=38;
                $ratess2=0;
                break;
            case "七不中":
                $R=39;
                $ratess2=0;
                break;
            case "八不中":
                $R=40;
                $ratess2=0;
                break;
            case "九不中":
                $R=41;
                $ratess2=0;
                break;
            case "十不中":
                $R=42;
                $ratess2=0;
                break;
            case "十一不中":
                $R=43;
                $ratess2=0;
                break;
            case "十二不中":
                $R=44;
                $ratess2=0;
                break;
        }
        $sum_sum=input('gold')*input('icradio1');
        if ($sum_sum>$mem['ts'])$this->redirect('index/errorPage',['msg'=>'对不起，下注总额不能大于可用信用额']);

        $number1=input('number1');
        $mu=explode("/",$number1);
        $ioradio1=1;
        $t=3;
        $fin_res=[];

        for ($t=1;$t<count($mu);$t=$t+1) {
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
            $class11 = "不中";
            $class22 = input('rtype');
            $class33 = $mu[$t];
            $sum_m = input('gold');
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
                case "五不中":
                    $rx = getBlById($rnum[0] + 1100);
                    $r1 = $rx['rate'];
                    $rx = getBlById($rnum[1] + 1100);
                    $r2 = $rx['rate'];
                    $rx = getBlById($rnum[2] + 1100);
                    $r3 = $rx['rate'];
                    $rx = getBlById($rnum[3] + 1100);
                    $r4 = $rx['rate'];
                    $rx = getBlById($rnum[4] + 1100);
                    $r5 = $rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    if ($r3 < $rate5) {
                        $rate5 = $r3;
                    }
                    if ($r4 < $rate5) {
                        $rate5 = $r4;
                    }
                    if ($r5 < $rate5) {
                        $rate5 = $r5;
                    }
                    break;
                case "六不中":
                    $rx = getBlById($rnum[0] + 1150);
                    $r1 = $rx['rate'];
                    $rx = getBlById($rnum[1] + 1150);
                    $r2 = $rx['rate'];
                    $rx = getBlById($rnum[2] + 1150);
                    $r3 = $rx['rate'];
                    $rx = getBlById($rnum[3] + 1150);
                    $r4 = $rx['rate'];
                    $rx = getBlById($rnum[4] + 1150);
                    $r5 = $rx['rate'];
                    $rx = getBlById($rnum[5] + 1150);
                    $r6 = $rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    if ($r3 < $rate5) {
                        $rate5 = $r3;
                    }
                    if ($r4 < $rate5) {
                        $rate5 = $r4;
                    }
                    if ($r5 < $rate5) {
                        $rate5 = $r5;
                    }
                    if ($r6 < $rate5) {
                        $rate5 = $r6;
                    }
                    break;
                case "七不中":
                    $rx = getBlById($rnum[0] + 1200);
                    $r1 = $rx['rate'];
                    $rx = getBlById($rnum[1] + 1200);
                    $r2 = $rx['rate'];
                    $rx = getBlById($rnum[2] + 1200);
                    $r3 = $rx['rate'];
                    $rx = getBlById($rnum[3] + 1200);
                    $r4 = $rx['rate'];
                    $rx = getBlById($rnum[4] + 1200);
                    $r5 = $rx['rate'];
                    $rx = getBlById($rnum[5] + 1200);
                    $r6 = $rx['rate'];
                    $rx = getBlById($rnum[6] + 1200);
                    $r7 = $rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    if ($r3 < $rate5) {
                        $rate5 = $r3;
                    }
                    if ($r4 < $rate5) {
                        $rate5 = $r4;
                    }
                    if ($r5 < $rate5) {
                        $rate5 = $r5;
                    }
                    if ($r6 < $rate5) {
                        $rate5 = $r6;
                    }
                    if ($r7 < $rate5) {
                        $rate5 = $r7;
                    }
                    break;

                case "八不中":
                    $rx = getBlById($rnum[0] + 1250);
                    $r1 = $rx['rate'];
                    $rx = getBlById($rnum[1] + 1250);
                    $r2 = $rx['rate'];
                    $rx = getBlById($rnum[2] + 1250);
                    $r3 = $rx['rate'];
                    $rx = getBlById($rnum[3] + 1250);
                    $r4 = $rx['rate'];
                    $rx = getBlById($rnum[4] + 1250);
                    $r5 = $rx['rate'];
                    $rx = getBlById($rnum[5] + 1250);
                    $r6 = $rx['rate'];
                    $rx = getBlById($rnum[6] + 1250);
                    $r7 = $rx['rate'];
                    $rx = getBlById($rnum[7] + 1250);
                    $r8 = $rx['rate'];

                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    if ($r3 < $rate5) {
                        $rate5 = $r3;
                    }
                    if ($r4 < $rate5) {
                        $rate5 = $r4;
                    }
                    if ($r5 < $rate5) {
                        $rate5 = $r5;
                    }
                    if ($r6 < $rate5) {
                        $rate5 = $r6;
                    }
                    if ($r7 < $rate5) {
                        $rate5 = $r7;
                    }
                    if ($r8 < $rate5) {
                        $rate5 = $r8;
                    }
                    break;

                case "九不中":
                    $rx = getBlById($rnum[0] + 1500);
                    $r1 = $rx['rate'];
                    $rx = getBlById($rnum[1] + 1500);
                    $r2 = $rx['rate'];
                    $rx = getBlById($rnum[2] + 1500);
                    $r3 = $rx['rate'];
                    $rx = getBlById($rnum[3] + 1500);
                    $r4 = $rx['rate'];
                    $rx = getBlById($rnum[4] + 1500);
                    $r5 = $rx['rate'];
                    $rx = getBlById($rnum[5] + 1500);
                    $r6 = $rx['rate'];
                    $rx = getBlById($rnum[6] + 1500);
                    $r7 = $rx['rate'];
                    $rx = getBlById($rnum[7] + 1500);
                    $r8 = $rx['rate'];
                    $rx = getBlById($rnum[8] + 1500);
                    $r9 = $rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    if ($r3 < $rate5) {
                        $rate5 = $r3;
                    }
                    if ($r4 < $rate5) {
                        $rate5 = $r4;
                    }
                    if ($r5 < $rate5) {
                        $rate5 = $r5;
                    }
                    if ($r6 < $rate5) {
                        $rate5 = $r6;
                    }
                    if ($r7 < $rate5) {
                        $rate5 = $r7;
                    }
                    if ($r8 < $rate5) {
                        $rate5 = $r8;
                    }
                    if ($r9 < $rate5) {
                        $rate5 = $r9;
                    }
                    break;
                case "十不中":
                    $rx=getBlById($rnum[0] + 1550);
                    $r1 =$rx['rate'];
                    $rx=getBlById($rnum[1] + 1550);
                    $r2 =$rx['rate'];
                    $rx=getBlById($rnum[2] + 1550);
                    $r3 =$rx['rate'];
                    $rx=getBlById($rnum[3] + 1550);
                    $r4 =$rx['rate'];
                    $rx=getBlById($rnum[4] + 1550);
                    $r5 =$rx['rate'];
                    $rx=getBlById($rnum[5] + 1550);
                    $r6 =$rx['rate'];
                    $rx=getBlById($rnum[6] + 1550);
                    $r7 =$rx['rate'];
                    $rx=getBlById($rnum[7] + 1550);
                    $r8 =$rx['rate'];
                    $rx=getBlById($rnum[8] + 1550);
                    $r9 =$rx['rate'];
                    $rx=getBlById($rnum[9] + 1550);
                    $r10 =$rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    if ($r3 < $rate5) {
                        $rate5 = $r3;
                    }
                    if ($r4 < $rate5) {
                        $rate5 = $r4;
                    }
                    if ($r5 < $rate5) {
                        $rate5 = $r5;
                    }
                    if ($r6 < $rate5) {
                        $rate5 = $r6;
                    }
                    if ($r7 < $rate5) {
                        $rate5 = $r7;
                    }
                    if ($r8 < $rate5) {
                        $rate5 = $r8;
                    }
                    if ($r9 < $rate5) {
                        $rate5 = $r9;
                    }
                    if ($r10 < $rate5) {
                        $rate5 = $r10;
                    }
                    break;
                case "十一不中":
                    $rx=getBlById($rnum[0] + 1600);
                    $r1 =$rx['rate'];
                    $rx=getBlById($rnum[1] + 1600);
                    $r2 =$rx['rate'];
                    $rx=getBlById($rnum[2] + 1600);
                    $r3 =$rx['rate'];
                    $rx=getBlById($rnum[3] + 1600);
                    $r4 =$rx['rate'];
                    $rx=getBlById($rnum[4] + 1600);
                    $r5 =$rx['rate'];
                    $rx=getBlById($rnum[5] + 1600);
                    $r6 =$rx['rate'];
                    $rx=getBlById($rnum[6] + 1600);
                    $r7 =$rx['rate'];
                    $rx=getBlById($rnum[7] + 1600);
                    $r8 =$rx['rate'];
                    $rx=getBlById($rnum[8] + 1600);
                    $r9 =$rx['rate'];
                    $rx=getBlById($rnum[9] + 1600);
                    $r10 =$rx['rate'];
                    $rx=getBlById($rnum[10] + 1600);
                    $r11 =$rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    if ($r3 < $rate5) {
                        $rate5 = $r3;
                    }
                    if ($r4 < $rate5) {
                        $rate5 = $r4;
                    }
                    if ($r5 < $rate5) {
                        $rate5 = $r5;
                    }
                    if ($r6 < $rate5) {
                        $rate5 = $r6;
                    }
                    if ($r7 < $rate5) {
                        $rate5 = $r7;
                    }
                    if ($r8 < $rate5) {
                        $rate5 = $r8;
                    }
                    if ($r9 < $rate5) {
                        $rate5 = $r9;
                    }
                    if ($r10 < $rate5) {
                        $rate5 = $r10;
                    }
                    if ($r11 < $rate5) {
                        $rate5 = $r11;
                    }
                    break;
                case "十二不中":
                    $rx=getBlById($rnum[0] + 1650);
                    $r1 = $rx['rate'];
                    $rx=getBlById($rnum[1] + 1650);
                    $r2 = $rx['rate'];
                    $rx=getBlById($rnum[2] + 1650);
                    $r3 = $rx['rate'];
                    $rx=getBlById($rnum[3] + 1650);
                    $r4 = $rx['rate'];
                    $rx=getBlById($rnum[4] + 1650);
                    $r5 = $rx['rate'];
                    $rx=getBlById($rnum[5] + 1650);
                    $r6 = $rx['rate'];
                    $rx=getBlById($rnum[6] + 1650);
                    $r7 = $rx['rate'];
                    $rx=getBlById($rnum[7] + 1650);
                    $r8 = $rx['rate'];
                    $rx=getBlById($rnum[8] + 1650);
                    $r9 = $rx['rate'];
                    $rx=getBlById($rnum[9] + 1650);
                    $r10 = $rx['rate'];
                    $rx=getBlById($rnum[10] + 1650);
                    $r11 = $rx['rate'];
                    $rx=getBlById($rnum[11] + 1650);
                    $r12 = $rx['rate'];
                    $rate5 = $r1;
                    if ($r2 < $rate5) {
                        $rate5 = $r2;
                    }
                    if ($r3 < $rate5) {
                        $rate5 = $r3;
                    }
                    if ($r4 < $rate5) {
                        $rate5 = $r4;
                    }
                    if ($r5 < $rate5) {
                        $rate5 = $r5;
                    }
                    if ($r6 < $rate5) {
                        $rate5 = $r6;
                    }
                    if ($r7 < $rate5) {
                        $rate5 = $r7;
                    }
                    if ($r8 < $rate5) {
                        $rate5 = $r8;
                    }
                    if ($r9 < $rate5) {
                        $rate5 = $r9;
                    }
                    if ($r10 < $rate5) {
                        $rate5 = $r10;
                    }
                    if ($r11 < $rate5) {
                        $rate5 = $r11;
                    }
                    if ($r12 < $rate5) {
                        $rate5 = $r12;
                    }
                    break;
            }
            switch ($mem['abcd']) {
                case "B":
                    $rate5 = $rate5 - getConfigField('bzx');
                    break;
                case "C":
                    $rate5 = $rate5 - getConfigField('czx');
                    break;
                case "D":
                    $rate5 = $rate5 - getConfigField('dzx');
                    break;
                default:
                    $Y = 'yg';
                    break;
            }
            $danid = $mem['danid'];
            $zongid = $mem['zongid'];
            $guanid = $mem['guanid'];
            $memid = $mem['id'];
            $abcd = $mem['abcd'];

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
            if (!$res){
                $this->redirect('index/errorPage',['msg'=>'数据库操作失败!']);
                exit;
            };
            $res1 = Db::name('mem')->where(['kauser' => $mem['kauser']])->setDec('ts',$sum_m);
            if (!$res1) $this->redirect('index/errorPage',['msg'=>'用户表修改失败!']);
            $rate_id = 1101;

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
            if($class22=="五不中")	$ffff=$row6['qbz1'];
            if($class22=="六不中")	$ffff=$row6['qbz2'];
            if($class22=="七不中")	$ffff=$row6['qbz3'];
            if($class22=="八不中")	$ffff=$row6['qbz4'];
            if($class22=="九不中")	$ffff=$row6['qbz5'];
            if($class22=="十不中")	$ffff=$row6['qbz6'];
            if($class22=="十一不中")	$ffff=$row6['qbz7'];
            if($class22=="十二不中")	$ffff=$row6['qbz8'];
            if ($pz==0 and $best==1 and $ffff>=0){  //走飞 、  自动补齐
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
                if ($sum_m>=1 and $ffff>0 and $smsmi>0){ ///代理补
                    $sf=Db::name('guan')->where(['kauser'=>$zong])->value('sj');
                    $username=$dai;
                    $rate=$rate5;
                    $ratess2=0;
                    $user_ds=getQuotaField($R,'yg',$dai);
                    $dai_ds=getQuotaField($R,'yg',$dai);
                    $zong_ds=getQuotaField($R,'yg',$zong);
                    $guan_ds=getQuotaField($R,'yg',$guan);
                    $dai_zc=0;
                    $zong_zc=$sj/10;
                    $guan_zc=$sf/10;
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
                    if(!$resx1)$this->error('数据库修改出错！',$url);
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
            if($class22=="五不中")	$ffff=$row6['qbz1'];
            if($class22=="六不中")	$ffff=$row6['qbz2'];
            if($class22=="七不中")	$ffff=$row6['qbz3'];
            if($class22=="八不中")	$ffff=$row6['qbz4'];
            if($class22=="九不中")	$ffff=$row6['qbz5'];
            if($class22=="十不中")	$ffff=$row6['qbz6'];
            if($class22=="十一不中")	$ffff=$row6['qbz7'];
            if($class22=="十二不中")	$ffff=$row6['qbz8'];
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
                    if(!$resx1)$this->error('数据库修改出错！',$url);

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
            if($class22=="五不中")	$ffff=$row6['qbz1'];
            if($class22=="六不中")	$ffff=$row6['qbz2'];
            if($class22=="七不中")	$ffff=$row6['qbz3'];
            if($class22=="八不中")	$ffff=$row6['qbz4'];
            if($class22=="九不中")	$ffff=$row6['qbz5'];
            if($class22=="十不中")	$ffff=$row6['qbz6'];
            if($class22=="十一不中")	$ffff=$row6['qbz7'];
            if($class22=="十二不中")	$ffff=$row6['qbz8'];
            if ($pz==0 and $best==1 and $ffff>0){
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
                    if(!$resx1)$this->error('数据库修改出错！',$url);
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
            if($class22=="五不中")	$ffff=$row6['qbz1'];
            if($class22=="六不中")	$ffff=$row6['qbz2'];
            if($class22=="七不中")	$ffff=$row6['qbz3'];
            if($class22=="八不中")	$ffff=$row6['qbz4'];
            if($class22=="九不中")	$ffff=$row6['qbz5'];
            if($class22=="十不中")	$ffff=$row6['qbz6'];
            if($class22=="十一不中")	$ffff=$row6['qbz7'];
            if($class22=="十二不中")	$ffff=$row6['qbz8'];
            if ($pz==0 and $best==1 and $ffff>0){
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
                    if(!$resx1)$this->error('数据库修改出错！',$url);
                }//完成大股东补
            }
        }
//        var_dump($fin_res);
        return $this->fetch('',[
            'url'=>$url,
            'fin_res'=>$fin_res,
        ]);
    }

    public function test(){
        var_dump(getQuotaField(37,'yg','guan1'));
    }
}