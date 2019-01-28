<?php
namespace app\admin\controller;

/**
*	管理首页
*/
class Index extends Admin{
	
	//首页
	public function index(){

		$Navi = model('Navi');
		$navis = $Navi->navis(0,'admin',[]);
		$this->assign("navis",$navis);

		$this->assign("user",$this->user);
		$this->assign("meta_title",'管理后台');
		return $this->fetch();
	}

	//控制台
	public function console(){
		$User = model('User');
		$user = $User->where(['id'=>$this->user['id']])->find();
		$this->assign("user",$user);

		$this->assign('meta_title','控制台');
		return $this->fetch();
	}
}