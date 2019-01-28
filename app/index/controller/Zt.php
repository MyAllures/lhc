<?php
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
class Zt extends Common{
    public function index(){
        $class1="正特";
        if(input('?ids'))$ids=input('ids');
        else $ids='正1特';
        if ($ids=="正1特") {
            $z6color="000000";
            $z5color="000000";
            $z4color="000000";
            $z3color="000000";
            $z2color="000000";
            $z1color="ff0000";
        }elseif ($ids=="正2特"){
            $z6color="000000";
            $z5color="000000";
            $z4color="000000";
            $z3color="000000";
            $z1color="000000";
            $z2color="ff0000";
        }elseif ($ids=="正3特"){
            $z6color="000000";
            $z5color="000000";
            $z4color="000000";
            $z2color="000000";
            $z1color="000000";
            $z3color="ff0000";
        }elseif ($ids=="正4特"){
            $z6color="000000";
            $z5color="000000";
            $z2color="000000";
            $z3color="000000";
            $z1color="000000";
            $z4color="ff0000";
        }elseif ($ids=="正5特"){
            $z6color="000000";
            $z2color="000000";
            $z4color="000000";
            $z3color="000000";
            $z1color="000000";
            $z5color="ff0000";
        }elseif ($ids=="正6特"){
            $z2color="000000";
            $z5color="000000";
            $z4color="000000";
            $z3color="000000";
            $z1color="000000";
            $z6color="ff0000";
        }
        $XF=13;
        $xc=5;
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
            'z3color'=>$z3color,
            'z4color'=>$z4color,
            'z5color'=>$z5color,
            'z6color'=>$z6color,
            'tonggao'=>$this->tonggao1(),
        ]);

    }
}