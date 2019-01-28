<?php
namespace app\index\controller;
use think\Db;
class Kq extends Common{
    public function index(){
       $data=Db::name('kithe')->where(['n1'=>['neq',0]])->whereOr(['kplabel'=>1])->order(['id'=>'desc'])->find();
       return $this->fetch('',[
           'data'=>$data
       ]);
    }
}