<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Log;

class Setting extends Controller{

	protected $Setting = null;
	protected function _initialize(){
		parent::_initialize();
		$this->Setting = model('Setting');
	}

    public function app(){
        $setting = $this->Setting->where(['key'=>'app'])->find();
        $app = $setting->value;
        return json([ 'data'=>$app,'code'=>0,'msg'=>'获取成功']);
    }

    public function kefu(){
        $setting = $this->Setting->where(['key'=>'kefu'])->find();
        $kefu = $setting->value;
        return json([ 'data'=>$kefu,'code'=>0,'msg'=>'获取成功']);
    }
}