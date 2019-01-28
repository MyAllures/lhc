<?php
namespace app\index\controller;
use  think\Db;
use app\index\controller\Common;
class Rule extends Common{
    public function index(){
        $rule=Db::table('config')->field('a1')->where(['id'=>1])->find();
        return $this->fetch('',['rule'=>$rule]);
    }
}
