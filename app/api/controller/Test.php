<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Log;

class Test extends Controller{

	protected function _initialize(){
		parent::_initialize();
	}

	public function login(){
		$url = "http://local.h5game.com/api/login/check";
		$data['openid'] = 'wx';
		$data['from'] = 'wx';
		$result = curl($url,$data);
		var_dump($result);exit();
	}
}