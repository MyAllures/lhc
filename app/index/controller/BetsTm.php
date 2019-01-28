<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/29
 * Time: 17:55
 */
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
class BetsTm extends Common{
    public function index(){
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
        $ids=input('ids') ? input('ids') : '特A';

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
        $this->fp($XF);

        //家禽
        $sz[0]=explode(',',getNumber('牛').','.getNumber('马').','.getNumber('羊').','.getNumber('鸡').','.getNumber('狗').','.getNumber('猪'));
        //野兽
        $sz[1]=explode(',',getNumber('鼠').','.getNumber('虎').','.getNumber('兔').','.getNumber('龙').','.getNumber('蛇').','.getNumber('猴'));
        //十二生肖
        $sz[2]=explode(',',getNumber('鼠'));
        $sz[3]=explode(',',getNumber('牛'));
        $sz[4]=explode(',',getNumber('虎'));
        $sz[5]=explode(',',getNumber('兔'));
        $sz[6]=explode(',',getNumber('龙'));
        $sz[7]=explode(',',getNumber('蛇'));
        $sz[8]=explode(',',getNumber('马'));
        $sz[9]=explode(',',getNumber('羊'));
        $sz[10]=explode(',',getNumber('猴'));
        $sz[11]=explode(',',getNumber('鸡'));
        $sz[12]=explode(',',getNumber('狗'));
        $sz[13]=explode(',',getNumber('猪'));

        $result=Db::name('bl')->where(['class3'=>'单'])->whereOr(['class3'=>'双'])->fetchSql()->order(['class2','id'])->select();
        return $this->fetch('',[
            'ids'=>$ids,
            'mem'=>$mem,
            'sz'=>$sz,
            'xc'=>$xc,
            'btm'=>getConfigField('btm'),
            'ctm'=>getConfigField('ctm'),
            'dtm'=>getConfigField('dtm'),
            'btmdx'=>getConfigField('btmdx'),
            'ctmdx'=>getConfigField('ctmdx'),
            'dtmdx'=>getConfigField('dtmdx'),
        ]);
    }

    //当前期当前类型的下注总额 replace   ka_kk1
    public function getSum($class1,$class2,$class3){
        $sess=session('lhc_index');
        $r=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$sess['kauser'],'class1'=>$class1,'class2'=>$class2,'class3'=>$class3])->field('sum(sum_m) as sum_mm')->select();
        return $r[0]['sum_mm'];
    }

    public function server(){
        $sess=session('lhc_index');
        $class1=input('class1');
        $class2=input('class2');
        if ($class1=="正1-6" or $class1=="正码1-6" or $class1=="过关" or $class1=="半波" or $class1=="尾数" or $class1=="单双大小" or $class1=="一字" or $class1=="二字" or $class1=="三字" or $class1=="一字过关" or $class1=="跨度" or $class1=="组选三" or $class1=="组选六"){
            if ($class1=="正1-6" ){
                $result=Db::name('bl')->where(['class1'=>$class1])->order(['class2','id'])->select();
            }
            else if ($class1=="正码1-6" ){
                $result=Db::name('bl')->where(['class1'=>'正1-6'])->order(['class2','id'])->select();
            }
            else if ($class1=="单双大小" ){
                $result=Db::query("select * from ka_bl where   (class3='单' or class3='双' or class3='大' or class3='小' or  class3='合单' or class3='合双' or class3='红波' or class3='绿波' or class3='蓝波' or class3='总单' or class3='总双' or class3='总大' or class3='总小') and (class2='正1特' or class2='正2特' or class2='正3特' or class2='正4特' or class2='正5特'  or class2='正6特' or class2='特A' or class2='正A')  order by class2,id");
            }
            else if ($class1=="尾数" ){
                Db::name('bl')->where(['class1'=>'头数'])->whereOr(['class1'=>'尾数'])->select();
            }
            else if ($class1=="一字" or $class1=="二字" or $class1=="三字" or $class1=="一字过关" or $class1=="跨度" or $class1=="组选三" or $class1=="组选六" ){
//                $result = mysql_query("select * from 3dka_bl where class1='".$class1."' and class2='".$class2."' order by id");
            }
            else{
                $result=Db::name('bl')->where(['class1'=>$class1])->select();
            }
        }else{
            if ($class1=="生肖" && $class2=="一肖")
                $result =Db::name('bl')->where(['class1'=>$class1,'class2'=>$class2])->whereOr(['class1'=>'正特尾数','class2'=>'正特尾数'])->select();
            else if ($class1=="正肖" && $class2=="正肖")
                $result =Db::name('bl')->where(['class1'=>$class1,'class2'=>$class2])->whereOr(['class1'=>'七色波','class2'=>'七色波'])->select();
            else{
                $result =Db::name('bl')->where(['class1'=>$class1,'class2'=>$class2])->select();
            }
        }
        $blbl=[];
        foreach ($result as $k=>$v){
            if ($class1=="连码"){
                $r1=Db::name('tan')->field('SUM(sum_m) As sum_m')->where(['kithe'=>getKitheNum(),'class1'=>$v['class1'],'class2'=>$v['class2'],'username'=>$sess['kauser']])->select();
                $rs5=$r1[0];
            }else{
                $r1=Db::name('tan')->field('SUM(sum_m) As sum_m')->where(['kithe'=>getKitheNum(),'class1'=>$v['class1'],'class2'=>$v['class2'],'class3'=>$v['class3']])->select();
                $rs5=$r1[0];
            }
            if ($rs5['sum_m']==""){$sum_m=0;}else{$sum_m=$rs5['sum_m'];}
            $rate=$v['rate'];
            $blbl[]=[$v['class3'],$rate,$v['blrate'],$sum_m,$v['xr'],$v['locked']];
        }

        if ($class1=="生肖" || $class1=="连肖") {
            $result =Db::table('mdrop')->where(['class1'=>$class1,'class2'=>$class2])->select();
            foreach ($result as $k1=>$v1){
                $blbl[]=[$v['class3'],$v['rate'],'x','x','x','x'];
            }
        }
        $ddf=date( "Y-m-d H:i:s",time()-20);
        Db::name('bl')->where(['class1'=>$class1,'blrate'=>['neq',$rate],'adddate'=>['lt',$ddf]])->update(['blrate'=>$rate]);

        return json($blbl);
    }

    public function test1(){
        return $this->fetch();
    }
}