<?php
namespace app\index\controller;
use app\index\controller\Common;
use app\index\model\Mem;
use think\Db;
use think\Request;
use think\Loader;

class Login extends Common{
	//登录页
	public function index(){
		return $this->fetch();
	}

	/**
	 * 密码加密方式 md5(md5(密码)+秘钥)
	 * 用户登录中心
	 * @return null
	 */
	public function login(){
		if(request()->isAjax()){
			if(!$res=Db::name('mem')->field('id')->where(['kauser'=>trim(input('post.username'))])->find()) {
                echo -2;
                exit;
			}
			$data=[
				'kauser'=>trim(input('post.username')),
				'kapassword'=>md5(input('post.password'))
			];
			$mem=new Mem();
			echo $mem->login($data);
		}else{
			$this->error('非法访问');
		}
	}
	
	/**
	 * 退出登录
	 * @return null
	 */
	public function logout(){
		session('lhc_index',null);
		cookie('lhc_index',null);
		$this->redirect('login/index');
	}

}

