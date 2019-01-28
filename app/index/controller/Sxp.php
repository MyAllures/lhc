<?php
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
class Sxp extends Common{
    public function index(){
        $class1="生肖";
        $ids='一肖';
        $classa1='正特尾数';
        $classa2='正特尾数';
        $xc=22;
        $XF=23;
        $this->fp($XF);
        $res=Db::name('bl')->alias('b')->join('ka_sxnumber m','b.class3=m.sx')->where(['b.class2'=>$ids])->field(['b.id','b.class2','b.class3','b.rate','m.m_number'])->select();
        foreach ($res as $k=>$v){
            $res[$k]['m_number']=explode(',',$v['m_number']);
        }

        $res1=Db::name('bl')->alias('b')->join('ka_sxnumber m','b.class3=m.sx')->where(['b.class2'=>$classa2])->field(['b.id','b.class2','b.class3','b.rate','m.m_number'])->select();
        foreach ($res1 as $k=>$v){
            $res1[$k]['m_number']=explode(',',$v['m_number']);
        }
        return $this->fetch('',[
            'ids'=>$ids,        // 二级分类名称
            'res'=>$res,        //class2=半波的所有三级分类
            'res1'=>$res1,
            'xc'=>$xc,
            'abcd'=>getMemField('abcd'),
            'class1'=>$class1,
            'classa1'=>$classa1,
            'classa2'=>$classa2,
            'tonggao'=>$this->tonggao1(),
        ]);

    }
}