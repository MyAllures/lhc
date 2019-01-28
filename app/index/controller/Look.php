<?php
namespace app\index\controller;
use app\index\controller\Common;
use think\Request;

class Look extends Common{
    public function index()
    {
        $web_name=$this->checkSys('webname');
        $content=$this->checkSys('a3');
        return $this->fetch('',['webname'=>$web_name,'content'=>$content]);
    }

}