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
/*下注 --连肖*/
class BetsLx extends Common{
    public function index(){
        $ids=input('ids') ? input('ids') : '二肖连中';
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
        $result =Db::name('bl')->where(['class2'=>$ids])->field('class3,rate')->select();
        foreach ($result as $k=>$v){
            $r=Db::name('sxnumber')->where(['sx'=>$v['class3']])->value('m_number');
            $result[$k]['number']=explode(',',$r);
        }
        return $this->fetch('',[
            'ids'=>$ids,
            'xc'=>$xc,
            'result'=>$result,
        ]);
    }

    public function saveLx(){
        if(!input('class2'))$this->error('非法访问');
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $n=0;
        $class2=input('class2');
        $number1='';
        $url=input('from_url');
        for ($t=0;$t<=12;$t=$t+1){
            if (input('num'.$t)){
                $number1.=input('num'.$t).",";
                $n++;
            }
        }
        $number3=$number1;
        $result=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$mem['kauser'],'class1'=>'生肖连','class2'=>input('class2')])->field('sum(sum_m) as sum_mm')->select();
        $sum_mm=$result[0]['sum_mm'];
        switch (input('class2')){
            case "二肖连中":
                $bmmm=0;
                $cmmm=0;
                $dmmm=0;
                $R=49;
                $XF=23;
                $rate_id=1401;
                if ($n<2 || $n>8)$this->redirect('index/errorPage',['msg'=>'对不起，请选择二-八个生肖!']);
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
                if ($n<3 or $n>8)$this->redirect('index/errorPage',['msg'=>'对不起，请选择三-八个生肖!']);
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
                if ($n<4 or $n>8)$this->redirect('index/errorPage',['msg'=>'对不起，请选择四-八个生肖!']);
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
                if ($n<5 or $n>8)$this->redirect('index/errorPage',['msg'=>'对不起，请选择五-八个生肖!']);
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
                if ($n<2 or $n>8)$this->redirect('index/errorPage',['msg'=>'对不起，请选择二-八个生肖!']);
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
                if ($n<3 or $n>8)$this->redirect('index/errorPage',['msg'=>'对不起，请选择三-八个生肖!']);
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
                if ($n<4 or $n>8)$this->redirect('index/errorPage',['msg'=>'对不起，请选择四-八个生肖!']);
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

        $result2=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$mem['kauser']])->field('SUM(sum_m) As sum_m1')->select();
        $rsw = $result2[0]['sum_m1'];
        $mkmk=empty($rsw) ? 0 : $rsw;
        $bl=getBlById($rate_id);

        if(input('Num_1/f')*$zs > $mem['ts'])$this->redirect('index/errorPage',['msg'=>'可用余额不足']);
        if(input('Num_1/f')<$mem['xy'])$this->redirect('index/errorPage',['msg'=>'下注金额最低限额'.$mem['xy']]);
        if(input('Num_1/f')*$zs > getQuotaField(input('xc'),'xx'))$this->redirect('index/errorPage',['msg'=>'下注金额已超过单注限额'. getQuotaField(input('xc'),'xx')]);

        return $this->fetch('',[
           'class2'=>$class2,
            'url'=>$url,
            'mem'=>$mem,
            'mkmk'=>$mkmk,
            'zs'=>$zs,
            'jq'=>input('Num_1/f'),
            'money1'=>getQuotaField($R,'xx'),   //单注限额
            'money2'=>getQuotaField($R,'xxx'),   //单号限额
            'mama'=>$mama,
            'rate'=>$bl['rate']*1000,
            'number3'=>$number3,
            'number1'=>$number1,
            'rate_id'=>$rate_id
        ]);
    }

    public function tanLx(){
        if(!input('class2'))$this->redirect('index/errorPage',['msg'=>'非法访问']);
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $number3=input('number3');
        $result=Db::name('tan')->field('sum(sum_m) as sum_mm')->where(['kithe'=>getKitheNum(),'username'=>$mem['kauser'],'class1'=>'生肖连','class2'=>input('class2')])->select();
        $sum_mm=$result[0]['sum_mm'];
        $bmmm=getConfigField('blx');
        $cmmm=getConfigField('clx');
        $dmmm=getConfigField('dlx');
        $ratess2=0;
        $drop_sort=input('class2');
        switch ($drop_sort){
            case "二肖连中":
                $R=48;
                $XF=23;
                $urlurl=url('index',['ids'=>'二肖连中']);
                break;
            case "三肖连中":
                $R=49;
                $XF=23;
                $urlurl=url('index',['ids'=>'三肖连中']);
                break;
            case "四肖连中":
                $R=50;
                $XF=23;
                $urlurl=url('index',['ids'=>'四肖连中']);
                break;
            case "五肖连中":
                $R=51;
                $XF=23;
                $urlurl=url('index',['ids'=>'五肖连中']);
                break;

            case "二肖连不中":
                $R=52;
                $XF=23;
                $urlurl=url('index',['ids'=>'二肖连不中']);
                break;
            case "三肖连不中":
                $R=53;
                $XF=23;
                $urlurl=url('index',['ids'=>'三肖连不中']);
                break;
            case "四肖连不中":
                $R=54;
                $XF=23;
                $urlurl=url('index',['ids'=>'四肖连不中']);
                break;
        }
        $sum_m=input('gold')*input('ioradio1');
        $gold=input('gold');
        $url=input('from_url');
        if($sum_m>$mem['ts'])$this->redirect('index/errorPage',['msg'=>'对不起，下注总额不能大于可用信用额!']);

        $rate1=1;
        $number1=input('number1');
        $mu=explode("/",$number1);
        $ioradio1=1;
        $t=3;
        $rate_id=input('rate_id');
        $bx=getBlById($rate_id);
        $fin_res=[];
        for ($t=0;$t<count($mu);$t=$t+1) {
            $muname = explode(",", $mu[$t]);
            switch ($drop_sort) {
                case "二肖连中":
                    switch ($muname[0]) {
                        case "鼠":
                            $r1 = 1401;
                            break;
                        case "虎":
                            $r1 = 1402;
                            break;
                        case "龙":
                            $r1 = 1403;
                            break;
                        case "马":
                            $r1 = 1404;
                            break;
                        case "猴":
                            $r1 = 1405;
                            break;
                        case "狗":
                            $r1 = 1406;
                            break;
                        case "牛":
                            $r1 = 1407;
                            break;
                        case "兔":
                            $r1 = 1408;
                            break;
                        case "蛇":
                            $r1 = 1409;
                            break;
                        case "羊":
                            $r1 = 1410;
                            break;
                        case "鸡":
                            $r1 = 1411;
                            break;
                        case "猪":
                            $r1 = 1412;
                            break;

                    }
                    switch ($muname[1]) {

                        case "鼠":
                            $r2 = 1401;
                            break;
                        case "虎":
                            $r2 = 1402;
                            break;
                        case "龙":
                            $r2 = 1403;
                            break;
                        case "马":
                            $r2 = 1404;
                            break;
                        case "猴":
                            $r2 = 1405;
                            break;
                        case "狗":
                            $r2 = 1406;
                            break;
                        case "牛":
                            $r2 = 1407;
                            break;
                        case "兔":
                            $r2 = 1408;
                            break;
                        case "蛇":
                            $r2 = 1409;
                            break;
                        case "羊":
                            $r2 = 1410;
                            break;
                        case "鸡":
                            $r2 = 1411;
                            break;
                        case "猪":
                            $r2 = 1412;
                            break;
                    }
                    $rs1 = getBlById($r1);
                    $rs2 = getBlById($r2);
                    $rate1 = $rs1['rate'];
                    $rate2 = $rs2['rate'];
                    if ($rate2 < $rate1) $rate1 = $rate2;
                    break;
                case "二肖连不中":
                    switch ($muname[0]) {

                        case "鼠":
                            $r1 = 1437;
                            break;
                        case "虎":
                            $r1 = 1438;
                            break;
                        case "龙":
                            $r1 = 1439;
                            break;
                        case "马":
                            $r1 = 1440;
                            break;
                        case "猴":
                            $r1 = 1441;
                            break;
                        case "狗":
                            $r1 = 1442;
                            break;
                        case "牛":
                            $r1 = 1443;
                            break;
                        case "兔":
                            $r1 = 1444;
                            break;
                        case "蛇":
                            $r1 = 1445;
                            break;
                        case "羊":
                            $r1 = 1446;
                            break;
                        case "鸡":
                            $r1 = 1447;
                            break;
                        case "猪":
                            $r1 = 1448;
                            break;

                    }
                    switch ($muname[1]) {

                        case "鼠":
                            $r2 = 1437;
                            break;
                        case "虎":
                            $r2 = 1438;
                            break;
                        case "龙":
                            $r2 = 1439;
                            break;
                        case "马":
                            $r2 = 1440;
                            break;
                        case "猴":
                            $r2 = 1441;
                            break;
                        case "狗":
                            $r2 = 1442;
                            break;
                        case "牛":
                            $r2 = 1443;
                            break;
                        case "兔":
                            $r2 = 1444;
                            break;
                        case "蛇":
                            $r2 = 1445;
                            break;
                        case "羊":
                            $r2 = 1446;
                            break;
                        case "鸡":
                            $r2 = 1447;
                            break;
                        case "猪":
                            $r2 = 1448;
                            break;
                    }
                    $rs1 = getBlById($r1);
                    $rs2 = getBlById($r2);
                    $rate1 = $rs1['rate'];
                    $rate2 = $rs2['rate'];
                    if ($rate2 < $rate1) $rate1 = $rate2;
                    break;
                case "三肖连中":
                    switch ($muname[0]) {

                        case "鼠":
                            $r1 = 1413;
                            break;
                        case "虎":
                            $r1 = 1414;
                            break;
                        case "龙":
                            $r1 = 1415;
                            break;
                        case "马":
                            $r1 = 1416;
                            break;
                        case "猴":
                            $r1 = 1417;
                            break;
                        case "狗":
                            $r1 = 1418;
                            break;
                        case "牛":
                            $r1 = 1419;
                            break;
                        case "兔":
                            $r1 = 1420;
                            break;
                        case "蛇":
                            $r1 = 1421;
                            break;
                        case "羊":
                            $r1 = 1422;
                            break;
                        case "鸡":
                            $r1 = 1423;
                            break;
                        case "猪":
                            $r1 = 1424;
                            break;

                    }
                    switch ($muname[1]) {
                        case "鼠":
                            $r2 = 1413;
                            break;
                        case "虎":
                            $r2 = 1414;
                            break;
                        case "龙":
                            $r2 = 1415;
                            break;
                        case "马":
                            $r2 = 1416;
                            break;
                        case "猴":
                            $r2 = 1417;
                            break;
                        case "狗":
                            $r2 = 1418;
                            break;
                        case "牛":
                            $r2 = 1419;
                            break;
                        case "兔":
                            $r2 = 1420;
                            break;
                        case "蛇":
                            $r2 = 1421;
                            break;
                        case "羊":
                            $r2 = 1422;
                            break;
                        case "鸡":
                            $r2 = 1423;
                            break;
                        case "猪":
                            $r2 = 1424;
                            break;
                    }
                    switch ($muname[2]) {
                        case "鼠":
                            $r3 = 1413;
                            break;
                        case "虎":
                            $r3 = 1414;
                            break;
                        case "龙":
                            $r3 = 1415;
                            break;
                        case "马":
                            $r3 = 1416;
                            break;
                        case "猴":
                            $r3 = 1417;
                            break;
                        case "狗":
                            $r3 = 1418;
                            break;
                        case "牛":
                            $r3 = 1419;
                            break;
                        case "兔":
                            $r3 = 1420;
                            break;
                        case "蛇":
                            $r3 = 1421;
                            break;
                        case "羊":
                            $r3 = 1422;
                            break;
                        case "鸡":
                            $r3 = 1423;
                            break;
                        case "猪":
                            $r3 = 1424;
                            break;
                    }
                    $rs1 = getBlById($r1);
                    $rs2 = getBlById($r2);
                    $rs3 = getBlById($r3);
                    $rate1 = $rs1['rate'];
                    $rate2 = $rs2['rate'];
                    $rate3 = $rs3['rate'];
                    if ($rate2 < $rate1) $rate1 = $rate2;
                    if ($rate3 < $rate1) $rate1 = $rate3;
                    break;

                case "三肖连不中":
                    switch ($muname[0]) {

                        case "鼠":
                            $r1 = 1449;
                            break;
                        case "虎":
                            $r1 = 1450;
                            break;
                        case "龙":
                            $r1 = 1451;
                            break;
                        case "马":
                            $r1 = 1452;
                            break;
                        case "猴":
                            $r1 = 1453;
                            break;
                        case "狗":
                            $r1 = 1454;
                            break;
                        case "牛":
                            $r1 = 1455;
                            break;
                        case "兔":
                            $r1 = 1456;
                            break;
                        case "蛇":
                            $r1 = 1457;
                            break;
                        case "羊":
                            $r1 = 1458;
                            break;
                        case "鸡":
                            $r1 = 1459;
                            break;
                        case "猪":
                            $r1 = 1460;
                            break;

                    }
                    switch ($muname[1]) {
                        case "鼠":
                            $r2 = 1449;
                            break;
                        case "虎":
                            $r2 = 1450;
                            break;
                        case "龙":
                            $r2 = 1451;
                            break;
                        case "马":
                            $r2 = 1452;
                            break;
                        case "猴":
                            $r2 = 1453;
                            break;
                        case "狗":
                            $r2 = 1454;
                            break;
                        case "牛":
                            $r2 = 1455;
                            break;
                        case "兔":
                            $r2 = 1456;
                            break;
                        case "蛇":
                            $r2 = 1457;
                            break;
                        case "羊":
                            $r2 = 1458;
                            break;
                        case "鸡":
                            $r2 = 1459;
                            break;
                        case "猪":
                            $r2 = 1460;
                            break;
                    }
                    switch ($muname[2]) {
                        case "鼠":
                            $r3 = 1449;
                            break;
                        case "虎":
                            $r3 = 1450;
                            break;
                        case "龙":
                            $r3 = 1451;
                            break;
                        case "马":
                            $r3 = 1452;
                            break;
                        case "猴":
                            $r3 = 1453;
                            break;
                        case "狗":
                            $r3 = 1454;
                            break;
                        case "牛":
                            $r3 = 1455;
                            break;
                        case "兔":
                            $r3 = 1456;
                            break;
                        case "蛇":
                            $r3 = 1457;
                            break;
                        case "羊":
                            $r3 = 1458;
                            break;
                        case "鸡":
                            $r3 = 1459;
                            break;
                        case "猪":
                            $r3 = 1460;
                            break;
                    }
                    $rs1 = getBlById($r1);
                    $rs2 = getBlById($r2);
                    $rs3 = getBlById($r3);
                    $rate1 = $rs1['rate'];
                    $rate2 = $rs2['rate'];
                    $rate3 = $rs3['rate'];
                    if ($rate2 < $rate1) $rate1 = $rate2;
                    if ($rate3 < $rate1) $rate1 = $rate3;
                    break;


                case "四肖连中":
                    switch ($muname[0]) {

                        case "鼠":
                            $r1 = 1425;
                            break;
                        case "虎":
                            $r1 = 1426;
                            break;
                        case "龙":
                            $r1 = 1427;
                            break;
                        case "马":
                            $r1 = 1428;
                            break;
                        case "猴":
                            $r1 = 1429;
                            break;
                        case "狗":
                            $r1 = 1430;
                            break;
                        case "牛":
                            $r1 = 1431;
                            break;
                        case "兔":
                            $r1 = 1432;
                            break;
                        case "蛇":
                            $r1 = 1433;
                            break;
                        case "羊":
                            $r1 = 1434;
                            break;
                        case "鸡":
                            $r1 = 1435;
                            break;
                        case "猪":
                            $r1 = 1436;
                            break;

                    }
                    switch ($muname[1]) {
                        case "鼠":
                            $r2 = 1425;
                            break;
                        case "虎":
                            $r2 = 1426;
                            break;
                        case "龙":
                            $r2 = 1427;
                            break;
                        case "马":
                            $r2 = 1428;
                            break;
                        case "猴":
                            $r2 = 1429;
                            break;
                        case "狗":
                            $r2 = 1430;
                            break;
                        case "牛":
                            $r2 = 1431;
                            break;
                        case "兔":
                            $r2 = 1432;
                            break;
                        case "蛇":
                            $r2 = 1433;
                            break;
                        case "羊":
                            $r2 = 1434;
                            break;
                        case "鸡":
                            $r2 = 1435;
                            break;
                        case "猪":
                            $r2 = 1436;
                            break;
                    }
                    switch ($muname[2]) {
                        case "鼠":
                            $r3 = 1425;
                            break;
                        case "虎":
                            $r3 = 1426;
                            break;
                        case "龙":
                            $r3 = 1427;
                            break;
                        case "马":
                            $r3 = 1428;
                            break;
                        case "猴":
                            $r3 = 1429;
                            break;
                        case "狗":
                            $r3 = 1430;
                            break;
                        case "牛":
                            $r3 = 1431;
                            break;
                        case "兔":
                            $r3 = 1432;
                            break;
                        case "蛇":
                            $r3 = 1433;
                            break;
                        case "羊":
                            $r3 = 1434;
                            break;
                        case "鸡":
                            $r3 = 1435;
                            break;
                        case "猪":
                            $r3 = 1436;
                            break;
                    }
                    switch ($muname[3]) {
                        case "鼠":
                            $r4 = 1425;
                            break;
                        case "虎":
                            $r4 = 1426;
                            break;
                        case "龙":
                            $r4 = 1427;
                            break;
                        case "马":
                            $r4 = 1428;
                            break;
                        case "猴":
                            $r4 = 1429;
                            break;
                        case "狗":
                            $r4 = 1430;
                            break;
                        case "牛":
                            $r4 = 1431;
                            break;
                        case "兔":
                            $r4 = 1432;
                            break;
                        case "蛇":
                            $r4 = 1433;
                            break;
                        case "羊":
                            $r4 = 1434;
                            break;
                        case "鸡":
                            $r4 = 1435;
                            break;
                        case "猪":
                            $r4 = 1436;
                            break;
                    }
                    $rs1 = getBlById($r1);
                    $rs2 = getBlById($r2);
                    $rs3 = getBlById($r3);
                    $rs4 = getBlById($r4);
                    $rate1 = $rs1['rate'];
                    $rate2 = $rs2['rate'];
                    $rate3 = $rs3['rate'];
                    $rate4 = $rs4['rate'];
                    if ($rate2 < $rate1) $rate1 = $rate2;
                    if ($rate3 < $rate1) $rate1 = $rate3;
                    if ($rate4 < $rate1) $rate1 = $rate4;
                    break;

                case "四肖连不中":

                    switch ($muname[0]) {

                        case "鼠":
                            $r1 = 1461;
                            break;
                        case "虎":
                            $r1 = 1462;
                            break;
                        case "龙":
                            $r1 = 1463;
                            break;
                        case "马":
                            $r1 = 1464;
                            break;
                        case "猴":
                            $r1 = 1465;
                            break;
                        case "狗":
                            $r1 = 1466;
                            break;
                        case "牛":
                            $r1 = 1467;
                            break;
                        case "兔":
                            $r1 = 1468;
                            break;
                        case "蛇":
                            $r1 = 1469;
                            break;
                        case "羊":
                            $r1 = 1470;
                            break;
                        case "鸡":
                            $r1 = 1471;
                            break;
                        case "猪":
                            $r1 = 1472;
                            break;

                    }
                    switch ($muname[1]) {
                        case "鼠":
                            $r2 = 1461;
                            break;
                        case "虎":
                            $r2 = 1462;
                            break;
                        case "龙":
                            $r2 = 1463;
                            break;
                        case "马":
                            $r2 = 1464;
                            break;
                        case "猴":
                            $r2 = 1465;
                            break;
                        case "狗":
                            $r2 = 1466;
                            break;
                        case "牛":
                            $r2 = 1467;
                            break;
                        case "兔":
                            $r2 = 1468;
                            break;
                        case "蛇":
                            $r2 = 1469;
                            break;
                        case "羊":
                            $r2 = 1470;
                            break;
                        case "鸡":
                            $r2 = 1471;
                            break;
                        case "猪":
                            $r2 = 1472;
                            break;
                    }
                    switch ($muname[2]) {
                        case "鼠":
                            $r3 = 1461;
                            break;
                        case "虎":
                            $r3 = 1462;
                            break;
                        case "龙":
                            $r3 = 1463;
                            break;
                        case "马":
                            $r3 = 1464;
                            break;
                        case "猴":
                            $r3 = 1465;
                            break;
                        case "狗":
                            $r3 = 1466;
                            break;
                        case "牛":
                            $r3 = 1467;
                            break;
                        case "兔":
                            $r3 = 1468;
                            break;
                        case "蛇":
                            $r3 = 1469;
                            break;
                        case "羊":
                            $r3 = 1470;
                            break;
                        case "鸡":
                            $r3 = 1471;
                            break;
                        case "猪":
                            $r3 = 1472;
                            break;
                    }
                    switch ($muname[3]) {
                        case "鼠":
                            $r4 = 1461;
                            break;
                        case "虎":
                            $r4 = 1462;
                            break;
                        case "龙":
                            $r4 = 1463;
                            break;
                        case "马":
                            $r4 = 1464;
                            break;
                        case "猴":
                            $r4 = 1465;
                            break;
                        case "狗":
                            $r4 = 1466;
                            break;
                        case "牛":
                            $r4 = 1467;
                            break;
                        case "兔":
                            $r4 = 1468;
                            break;
                        case "蛇":
                            $r4 = 1469;
                            break;
                        case "羊":
                            $r4 = 1470;
                            break;
                        case "鸡":
                            $r4 = 1471;
                            break;
                        case "猪":
                            $r4 = 1472;
                            break;
                    }

                    $rs1 = getBlById($r1);
                    $rs2 = getBlById($r2);
                    $rs3 = getBlById($r3);
                    $rs4 = getBlById($r4);
                    $rate1 = $rs1['rate'];
                    $rate2 = $rs2['rate'];
                    $rate3 = $rs3['rate'];
                    $rate4 = $rs4['rate'];
                    if ($rate2 < $rate1) $rate1 = $rate2;
                    if ($rate3 < $rate1) $rate1 = $rate3;
                    if ($rate4 < $rate1) $rate1 = $rate4;
                    break;

                case "五肖连中":
                    switch ($muname[0]) {

                        case "鼠":
                            $r1 = 1473;
                            break;
                        case "虎":
                            $r1 = 1474;
                            break;
                        case "龙":
                            $r1 = 1475;
                            break;
                        case "马":
                            $r1 = 1476;
                            break;
                        case "猴":
                            $r1 = 1477;
                            break;
                        case "狗":
                            $r1 = 1478;
                            break;
                        case "牛":
                            $r1 = 1479;
                            break;
                        case "兔":
                            $r1 = 1480;
                            break;
                        case "蛇":
                            $r1 = 1481;
                            break;
                        case "羊":
                            $r1 = 1482;
                            break;
                        case "鸡":
                            $r1 = 1483;
                            break;
                        case "猪":
                            $r1 = 1484;
                            break;

                    }
                    switch ($muname[1]) {
                        case "鼠":
                            $r2 = 1473;
                            break;
                        case "虎":
                            $r2 = 1474;
                            break;
                        case "龙":
                            $r2 = 1475;
                            break;
                        case "马":
                            $r2 = 1476;
                            break;
                        case "猴":
                            $r2 = 1477;
                            break;
                        case "狗":
                            $r2 = 1478;
                            break;
                        case "牛":
                            $r2 = 1479;
                            break;
                        case "兔":
                            $r2 = 1480;
                            break;
                        case "蛇":
                            $r2 = 1481;
                            break;
                        case "羊":
                            $r2 = 1482;
                            break;
                        case "鸡":
                            $r2 = 1483;
                            break;
                        case "猪":
                            $r2 = 1484;
                            break;
                    }
                    switch ($muname[2]) {
                        case "鼠":
                            $r3 = 1473;
                            break;
                        case "虎":
                            $r3 = 1474;
                            break;
                        case "龙":
                            $r3 = 1475;
                            break;
                        case "马":
                            $r3 = 1476;
                            break;
                        case "猴":
                            $r3 = 1477;
                            break;
                        case "狗":
                            $r3 = 1478;
                            break;
                        case "牛":
                            $r3 = 1479;
                            break;
                        case "兔":
                            $r3 = 1480;
                            break;
                        case "蛇":
                            $r3 = 1481;
                            break;
                        case "羊":
                            $r3 = 1482;
                            break;
                        case "鸡":
                            $r3 = 1483;
                            break;
                        case "猪":
                            $r3 = 1484;
                            break;
                    }
                    switch ($muname[3]) {
                        case "鼠":
                            $r4 = 1473;
                            break;
                        case "虎":
                            $r4 = 1474;
                            break;
                        case "龙":
                            $r4 = 1475;
                            break;
                        case "马":
                            $r4 = 1476;
                            break;
                        case "猴":
                            $r4 = 1477;
                            break;
                        case "狗":
                            $r4 = 1478;
                            break;
                        case "牛":
                            $r4 = 1479;
                            break;
                        case "兔":
                            $r4 = 1480;
                            break;
                        case "蛇":
                            $r4 = 1481;
                            break;
                        case "羊":
                            $r4 = 1482;
                            break;
                        case "鸡":
                            $r4 = 1483;
                            break;
                        case "猪":
                            $r4 = 1484;
                            break;
                    }
                    switch ($muname[4]) {
                        case "鼠":
                            $r5 = 1473;
                            break;
                        case "虎":
                            $r5 = 1474;
                            break;
                        case "龙":
                            $r5 = 1475;
                            break;
                        case "马":
                            $r5 = 1476;
                            break;
                        case "猴":
                            $r5 = 1477;
                            break;
                        case "狗":
                            $r5 = 1478;
                            break;
                        case "牛":
                            $r5 = 1479;
                            break;
                        case "兔":
                            $r5 = 1480;
                            break;
                        case "蛇":
                            $r5 = 1481;
                            break;
                        case "羊":
                            $r5 = 1482;
                            break;
                        case "鸡":
                            $r5 = 1483;
                            break;
                        case "猪":
                            $r5 = 1484;
                            break;
                    }
                    $rs1 = getBlById($r1);
                    $rs2 = getBlById($r2);
                    $rs3 = getBlById($r3);
                    $rs4 = getBlById($r4);
                    $rs5 = getBlById($r5);
                    $rate1 = $rs1['rate'];
                    $rate2 = $rs2['rate'];
                    $rate3 = $rs3['rate'];
                    $rate4 = $rs4['rate'];
                    $rate5 = $rs5['rate'];
                    if ($rate2 < $rate1) $rate1 = $rate2;
                    if ($rate3 < $rate1) $rate1 = $rate3;
                    if ($rate4 < $rate1) $rate1 = $rate4;
                    if ($rate5 < $rate1) $rate1 = $rate5;
                    break;

            }
            switch ($mem['abcd']) {
                case "A":
                    $rate5 = $rate1;
                    $Y = 'yg';
                    break;
                case "B":
                    $rate5 = $rate1 - $bmmm;
                    $Y = 'ygb';
                    break;
                case "C":
                    $Y = 'ygc';
                    $rate5 = $rate1 - $cmmm;
                    break;
                case "D":
                    $rate5 = $rate1 - $dmmm;
                    $Y = 'ygd';
                    break;
                default:
                    $Y = 'yg';
                    $rate5 = $rate1;
                    break;
            }
            $num = randStr();
            $text = date("Y-m-d H:i:s");
            $class11 = $bx['class1'];
            $class22 = $bx['class2'];
            $class33 = $mu[$t];

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
                'sum_m' => $gold,
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
            if (!$res) $this->redirect('index/errorPage',['msg'=>'数据库操作失败']);
            $res1 = Db::name('mem')->where(['kauser' => $mem['kauser']])->setDec('ts', $gold);
            if (!$res1) $this->redirect('index/errorPage',['msg'=>'操作失败，请检查后重新提交!']);

            $arr5=[
                'num' => $num,
                'username' => $mem['kauser'],
                'kithe' => getKitheNum(),
                'adddate' => $text,
                'class1' => $class11,
                'class2' => $class22,
                'class3' => $number3,
                'rate' => $rate5,
                'sum_m' => $gold,
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
            ];
            $res2=Db::name('tong')->insert($arr5);
            if(!$res2)$this->redirect('index/errorPage',['msg'=>'数据库修改出错!']);

            $fin_res[$t]['hm']=$mu[$t];
            $fin_res[$t]['class2']=$class22;
            $fin_res[$t]['rate5']=$rate5;
            $fin_res[$t]['gold']=$gold;
            //分成
            //代理
            $row6=Db::name('guan')->where(['kauser'=>$dai])->find();
            $best=$row6['best'];
            $pz=$row6['pz'];
            $sj=$row6['sj'];
            $sf=$row6['sf'];
            $cs=$row6['cs'];
            $danid=$row6['id'];
            if($class22=="二肖连中")	$ffff=$row6['lx1'];
            if($class22=="三肖连中")	$ffff=$row6['lx2'];
            if($class22=="四肖连中")	$ffff=$row6['lx3'];
            if($class22=="五肖连中")	$ffff=$row6['lx4'];
            if($class22=="二肖连不中")	$ffff=$row6['lx5'];
            if($class22=="三肖连不中")	$ffff=$row6['lx6'];
            if($class22=="四肖连不中")	$ffff=$row6['lx7'];
            if($class22=="二尾连中")	$ffff=$row6['wsl1'];
            if($class22=="三尾连中")	$ffff=$row6['wsl2'];
            if($class22=="四尾连中")	$ffff=$row6['wsl3'];
            if($class22=="二尾连不中")	$ffff=$row6['wsl1'];
            if($class22=="三尾连不中")	$ffff=$row6['wsl2'];
            if($class22=="四尾连不中")	$ffff=$row6['wsl3'];
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
                    $sum_mfll = $Rs6['sum_m'];}else{$sum_mfll =0;}
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
            if($class22=="二肖连中")	$ffff=$row6['lx1'];
            if($class22=="三肖连中")	$ffff=$row6['lx2'];
            if($class22=="四肖连中")	$ffff=$row6['lx3'];
            if($class22=="五肖连中")	$ffff=$row6['lx4'];
            if($class22=="二肖连不中")	$ffff=$row6['lx5'];
            if($class22=="三肖连不中")	$ffff=$row6['lx6'];
            if($class22=="四肖连不中")	$ffff=$row6['lx7'];
            if($class22=="二尾连中")	$ffff=$row6['wsl1'];
            if($class22=="三尾连中")	$ffff=$row6['wsl2'];
            if($class22=="四尾连中")	$ffff=$row6['wsl3'];
            if($class22=="二尾连不中")	$ffff=$row6['wsl1'];
            if($class22=="三尾连不中")	$ffff=$row6['wsl2'];
            if($class22=="四尾连不中")	$ffff=$row6['wsl3'];
            if ($pz==0 and $best==1 and $ffff>=0){
                //占成
                $result5=Db::name('tan')->field('sum(sum_m*zong_zc/10) as sum_m')->where(['kithe'=>getKitheNum(),'zong'=>$zong,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
                $Rs5 = $result5[0];
                if ($Rs5['sum_m']!=""){
                    $sum_mff = $Rs5['sum_m'];}else{$sum_mff =0;}
                //已补
                $result1=Db::name('tan')->field('sum(sum_m) as sum_m,count(*) as re')->where(['kithe'=>getKitheNum(),'username'=>$zong,'class1'=>$class11,'class2'=>$class22,'class3'=>$class33])->select();
                $Rs6 = $result1[0];
                if ($Rs6['sum_m']!=""){
                    $sum_mfll = $Rs6['sum_m'];}else{$sum_mfll =0;}
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
            if($class22=="二肖连中")	$ffff=$row6['lx1'];
            if($class22=="三肖连中")	$ffff=$row6['lx2'];
            if($class22=="四肖连中")	$ffff=$row6['lx3'];
            if($class22=="五肖连中")	$ffff=$row6['lx4'];
            if($class22=="二肖连不中")	$ffff=$row6['lx5'];
            if($class22=="三肖连不中")	$ffff=$row6['lx6'];
            if($class22=="四肖连不中")	$ffff=$row6['lx7'];

            if($class22=="二尾连中")	$ffff=$row6['wsl1'];
            if($class22=="三尾连中")	$ffff=$row6['wsl2'];
            if($class22=="四尾连中")	$ffff=$row6['wsl3'];
            if($class22=="二尾连不中")	$ffff=$row6['wsl1'];
            if($class22=="三尾连不中")	$ffff=$row6['wsl2'];
            if($class22=="四尾连不中")	$ffff=$row6['wsl3'];

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
            if($class22=="二肖连中")	$ffff=$row6['lx1'];
            if($class22=="三肖连中")	$ffff=$row6['lx2'];
            if($class22=="四肖连中")	$ffff=$row6['lx3'];
            if($class22=="五肖连中")	$ffff=$row6['lx4'];
            if($class22=="二肖连不中")	$ffff=$row6['lx5'];
            if($class22=="三肖连不中")	$ffff=$row6['lx6'];
            if($class22=="四肖连不中")	$ffff=$row6['lx7'];

            if($class22=="二尾连中")	$ffff=$row6['wsl1'];
            if($class22=="三尾连中")	$ffff=$row6['wsl2'];
            if($class22=="四尾连中")	$ffff=$row6['wsl3'];
            if($class22=="二尾连不中")	$ffff=$row6['wsl1'];
            if($class22=="三尾连不中")	$ffff=$row6['wsl2'];
            if($class22=="四尾连不中")	$ffff=$row6['wsl3'];

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
                        'rate2'=>$ratess2,
                        'guan1'=>$guan1,
                        'guan1_zc'=>$guan1_zc,
                        'guan1_ds'=>$guan1_ds
                    ];
                    $resx1=Db::name('tan')->insert($arr4);
                    if(!$resx1)$this->redirect('index/errorPage',['msg'=>'数据库修改出错']);
                }//完成大股东补
            }
        }
        return $this->fetch('',[
                'fin_res'=>$fin_res,
                'url'=>$url,
        ]);
    }
}