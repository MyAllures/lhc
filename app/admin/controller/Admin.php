<?php
namespace app\admin\controller;
use think\Controller;

/**
*	管理父类
*/
class Admin extends Controller{
	protected $Setting=null;
	protected $request = null;
	protected $free = ['Login','Register','Forget'];
	protected $user = null;
	protected function _initialize(){
	    $this->Setting=model('Setting');
		$this->request = request();

    	//判断是否登录
    	$controller = $this->request->controller();
       	if (!in_array($controller, $this->free)   && !$this->user = is_login('admin')) {
            $login_url = url("Login/index");
            $result =  redirect($login_url);
            $result->send();exit();
        }

        $Config = model('Config');
        $config = $Config->where(['id'=>1])->find();
        $site['cname'] = $config['webname'];
        $site['sname'] = $config['websname'];
		$this->assign("site",$site);
	}
}