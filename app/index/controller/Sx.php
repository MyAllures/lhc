<?php
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
class Sx extends Common{
    public function index(){
        $class1="生肖";
        $ids="特肖";
        $xc=18;
        $XF=23;
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
}