<?php
namespace app\agent\controller;
use think\Controller;

/**
*	代理父类
*/
class Agent extends Controller{
	
	protected $request = null;
	protected $free = ['Login','Register','Forget'];
	protected $user = null;
	protected $site = null;
	protected function _initialize(){
		$this->request = request();

        $site = model('Setting')->where(['key'=>'site'])->value("value");
		$this->site = json_decode($site,true); 
		$this->assign("site",$this->site);
		
    	//判断是否登录
    	$controller = $this->request->controller();
       	if (!in_array($controller, $this->free)  && !$this->user = is_login('agent')) {
            $login_url = url("Login/index");
            $result =  redirect($login_url);
            $result->send();exit();
        }
	}
}