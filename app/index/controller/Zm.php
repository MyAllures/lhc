<?php
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
class Zm extends Common{
    public function index(){
        $class1="正码";
        if(input('?ids'))$ids=input('ids');
        else $ids='正A';
        if ($ids=="正A"){
            $xc=6;
            $z2color="000000";
            $z1color="ff0000";
        }else{
            $xc=7;
            $z1color="000000";
            $z2color="ff0000";
        }
        $XF=15;
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
            'abcd'=>getMemField('abcd'),
            'class1'=>$class1,
            'z1color'=>$z1color,
            'z2color'=>$z2color,
            'tonggao'=>$this->tonggao1(),
            ]);

    }
}