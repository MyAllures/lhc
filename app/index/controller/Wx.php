<?php
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
class Wx extends Common{
    public function index(){
        $class1="五行";
        $ids="五行";
        $xc=25;
        $XF=17;
        $this->fp($XF);
        $res=[];
        $start=0;
        for($i=25;$i<=29;$i++){
            $start++;
            $data=Db::name('sxnumber')->find($i);
            $res[$start]['title']=$data['sx'];
            $res[$start]['m_number']=explode(',',$data['m_number']);
            $res[$start]['id']=Db::name('bl')->where(['class3'=>$data['sx']])->value('id');
        }
        return $this->fetch('',[
            'ids'=>$ids,        // 二级分类名称
            'res'=>$res,        //class2=半波的所有三级分类
            'xc'=>$xc,
            'abcd'=>getMemField('abcd'),]);
        }
}