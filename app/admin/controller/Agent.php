<?php
namespace app\admin\controller;

/**
*	代理商管理
*/
class Agent extends Admin{

	private $Agent = null;
	protected function _initialize(){
		parent::_initialize();
		$this->Agent = model('KaGuan');
	}

	public function index(){
		$AgentLevel = model('AgentLevel');
		$pid = input('get.pid',0);
		$level = $AgentLevel->where(['pid'=>$pid])->find();
		$this->assign('level',$level);

		$this->assign('meta_title','代理商列表');
		return $this->fetch();
	}

	public function load(){
		$page = input('get.page');
		$limit = input('get.limit');
		$guanid = input('get.guanid',0);
		$where['guanid'] = $guanid;
		$list = $this->Agent->where($where)->paginate($limit,false,['page'=>$page]);
		$data = [];
		foreach ($list as $key => $value) {
			$data[$key]['id'] = $value['id'];
			$data[$key]['user_name'] = $value['kauser'];
			$data[$key]['user_cname'] = $value['xm'];
			$data[$key]['level_text'] = $value['lx_text'];
			$data[$key]['credit_quota'] = $value['cs'];
			$data[$key]['usable_quota'] = $value['ts'];
			$data[$key]['sj'] = $value['sj'];
			$data[$key]['sf'] = $value['sf'];
			$data[$key]['pz_text'] = $value['pz_text'];
			$data[$key]['tm'] = $value['tm'];
			$data[$key]['adddate'] = $value['adddate'];
			$data[$key]['state'] = $value['stat'];
			$data[$key]['state_text'] = $value['state_text'];
		}
		return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}

	public function add(){
		if ($this->request->isPost()) {
			$User = model('User');
			$user_prefix = input('post.user_prefix');
			$user_name = input('post.user_name');
			$user_name = $user_prefix . $user_name;
			$count = $User->where(['name'=>$user_name])->count();
			if ($count > 0) {
				return json(['data'=>null,'code'=>1,'msg'=>'该用户名已经存在']);
			}

			$password = input('post.password');
			$password = md5($password);


			$this->Agent->lx = 4;//大股东
			$this->Agent->kauser = $user_name;
			$this->Agent->kapassword = $password;
			$this->Agent->xm = input('post.cname');
			$this->Agent->cs = input('post.user_credit');
			$this->Agent->ts = input('post.quick_credit');
			$this->Agent->tm = input('post.tm');

			$sf = input('post.sf');
			$sf = intval($sf);
			if (!($sf >=0 && $sf <= 100) ) {
				return json(['data'=>null,'code'=>0,'msg'=>'请正确设置占成']);
			}
			$sj = 100 - $sf;
			$this->Agent->sf = $sf;
			$this->Agent->sj = $sj;
			$this->Agent->pz = input('post.pz');
			$this->Agent->guanid = 0;

			$user_plate = input('post.user_plate/a');
			$this->Agent->plate = json_encode($user_plate);
			$this->Agent->odds = input('?odds')?0:1;
			$this->Agent->adddate = date('Y-m-d H:i:s');
			$this->Agent->rebate = input('post.rebate');

			$result = $this->Agent->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'添加成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'添加失败']);
		}else{
			$AgentLevel = model('AgentLevel');
			$level_id = input('get.levelid');
			$level = $AgentLevel->where(['id'=>$level_id])->find();
			if (!$level) {
				return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
			}
			$this->assign('level',$level);
			$this->assign('meta_title','添加代理');
			return $this->fetch();
		}
	}

	public function edit(){
		if ($this->request->isPost()) {
			$id = input('post.id');
			$mch = $this->Mch->where(['id'=>$id])->find();
			if ($mch) {
				$password = input('post.password');
				if (!empty($password)) {
					$mch->user->password = $password;
				}
				$mch->user->qq = input('post.qq');
				$mch->user->weixin = input('post.weixin');
				$mch->user->mobile = input('post.mobile');
				$mch->user->save();

				$mch->logo = input('post.logo');
				$mch->cname = input('post.cname');
				$mch->description = input('post.description');
				$result = $mch->save();
				if ($result) {
					return json(['data'=>null,'code'=>0,'msg'=>'编辑商户成功']);
				}
				return json(['data'=>$_POST,'code'=>1,'msg'=>'编辑商户失败']);
			}else{
				return json(['data'=>$_POST,'code'=>1,'msg'=>'参数错误']);
			}
		}else{
			$id = input('param.id');
			$agent = $this->Agent->where(['id'=>$id])->find();
			if (!$agent) {
				$this->error('参数错误');
			}
			$this->assign('agent',$agent);
			$AgentLevel = model('AgentLevel');
			$level = $AgentLevel->where(['id'=>1])->find();
			if (!$level) {
				return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
			}
			$this->assign('level',$level);
			$this->assign('meta_title','编辑代理');
			return $this->fetch();
		}
	}

	public function detail(){
		if($this->request->isPost()){
			$id = input('post.id');
			$agent = $this->Agent->where(['id'=>$id])->find();
			if (!$agent) {
				return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
			}

			$yg = input('post.m/a');
			$ygb = input('post.ygb/a');
			$ygc = input('post.ygc/a');
			$ygd = input('post.ygd/a');
			$xx = input('post.mm/a');
			$xxx = input('post.mmm/a');
			$ds = input('post.ds/a');
			$style = input('post.style/a');

			$list = [];
			$map = [];
			$KaQuota = model('KaQuota');
			foreach ($ds as $key => $value) {
				$where['userid'] = $agent['id'];
				$where['ds'] = $value;
				$quota = $KaQuota->where($where)->find();

				$data = [];
				$data['yg'] = $yg[$key];
				$data['ygb'] = $ygb[$key];
				$data['ygc'] = $ygc[$key];
				$data['ygd'] = $ygd[$key];
				$data['xx'] = $xx[$key];
				$data['xxx'] = $xxx[$key];


				if (!$quota) {
					$data['ds'] = $value;
					$data['style'] = $style[$key];
					$data['lx'] = $agent['lx'];
					$data['username'] = $agent['kauser'];
					$data['userid'] = $agent['id'];
					array_push($list, $data);
				}else{
					$data['id'] = $quota['id'];
					array_push($map, $data);
				}
			}
			if (count($list)) {
				$result = $KaQuota->saveAll($list);
			}
			if (count($map)) {
				$result = $KaQuota->saveAll($map);
			}
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'保存成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'保存失败']);
		}else{
			$id = input('get.id');
			$agent = $this->Agent->where(['id'=>$id])->find();
			if (!$agent) {
				$this->error('参数错误');
			}
			$this->assign('agent',$agent);

			$KaQuota = model('KaQuota');
			$list = $KaQuota->where(['lx'=>$agent['lx'],'userid'=>$id])->order('id')->select();
			if (empty($list)) {
				//基础设定
				$KaGuands = model('KaGuands');
				$list = $KaGuands->where(['lx'=>0])->select();
			}
			$this->assign('list',$list);

			$this->assign('meta_title','详细设定');
			return $this->fetch();
		}
	}

	public function checkname(){
		$user_name = input('post.user_name');
		$count = $this->Agent->where(['kauser'=>$user_name])->count();
		if ($count > 0) {
			return json(['data'=>null,'code'=>1,'msg'=>'用户名已存在']);
		}
		return json(['data'=>null,'code'=>0,'msg'=>'用户名可用']);
	}

	public function changestate(){
    	$id = input('post.id');
    	$agent = $this->Agent->where(['id'=>$id])->find();
    	if (!$agent) {
    		return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
    	}else{
    		$state = input('post.state');
    		$agent->stat = $state == 'true'?0:1;
    		$result = $agent->save();
    		if ($result) {
    			return json(['data'=>null,'code'=>0,'msg'=>'改变状态成功']);
    		}
    		return json(['data'=>null,'code'=>1,'msg'=>'改变状态失败']);
    	}
    }

	public function level(){
		$this->assign('meta_title','代理级别');
		return $this->fetch();
	}

	public function loadlevel(){
		$page = input('get.page');
		$limit = input('get.limit');
		$AgentLevel = model('AgentLevel');
		$list = $AgentLevel->paginate($limit,false,['page'=>$page]);
		$data = [];
		foreach ($list as $key => $value) {
			$data[$key]['id'] = $value['id'];
			$data[$key]['name'] = $value['name'];
			$data[$key]['cname'] = $value['cname'];
			$data[$key]['discount'] = $value['discount'].'%';
		}
		return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}

	//添加级别
	public function addlevel(){
		if ($this->request->isPost()) {
			$AgentLevel = model('AgentLevel');
			$AgentLevel->name = input('post.name');
			$AgentLevel->cname = input('post.cname');
			$AgentLevel->discount = input('post.discount');
			$result = $AgentLevel->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'添加成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'添加失败']);
		}else{
			$this->assign('meta_title','添加级别');
			return $this->fetch();
		}
	}

	//编辑级别
	public function editlevel(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$this->assign('meta_title','编辑级别');
			return $this->fetch();
		}

	}

	//删除级别
	public function dellevel(){
		if ($this->request->isPost()) {

		}
	}


}