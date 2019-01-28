<?php
namespace app\agent\controller;

/**
*	管理首页
*/
class Index extends Agent{
	
	//首页
	public function index(){
		$ids = [];
		$Navi = model('Navi');
		$navis = $Navi->navis(0,'agent',$ids);
		$this->assign("navis",$navis);

		$this->assign("user",$this->user);
		$this->assign("meta_title",$this->site['cname']);
		return $this->fetch();
	}

	//控制台
	public function console(){
		$User = model('User');
		$user_id = $this->user['id'];
		$user = $User->where(['id'=>$user_id])->find();
		$this->assign("user",$user);

		$agent_id = $this->user['agent']['id'];
		$invitecount = $User->where(['agent_id'=>$agent_id])->count();
		$this->assign('invitecount',$invitecount);

		$this->assign('meta_title','控制台');
		return $this->fetch();
	}
}