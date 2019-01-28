<?php
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
use think\Loader;
class User extends Common{
	/*用户列表*/
	public function index(){
		return $this->fetch();
	}

	//获取json数据
	public function getJson(){
		$act=input('act');
		if($act == 'ajax') return $this->listQuery();
	}

	//当前用户添加的代理列表
	public function listQuery(){
		$pagesize = input('limit/d',10);	
		$page = input("page/d",1);
		if($page <= 0) $page = 1;
		$start = ($page - 1) * $pagesize;
		$time=time();
		$count = Db::name('user')->where(['expire'=>['gt',$time]])->count();
		
		$data = Db::name('user')
		->limit($start.','.$pagesize)
		->where(['expire'=>['gt',$time]])
		->order('id','desc')
		->select();   //总的查询数据

		//对数据进行优化
		if(!empty($data)){
			foreach ($data as $key => $value) {
				$data[$key]['expire']=date('Y-m-d H:i:s',$data[$key]['expire']);
			}
		}
		$_result = [
			"code" => 0,
			"msg" => '',
			"page" => $page,
			"pagesize" => $pagesize,
			"count" => $count,
			'data' => $data
		];
		return json($_result);
	}

	//删除
	public function delUser(){
		if(request()->isPost() && !request()->has('id')){
			$this->error('非法访问');
		}
		if(Db::name('user')->delete(input('id'))){
			$data=[
				'code'=>0,
				'msg'=>'删除成功'
			];
		}else{
			$data=[
				'msg'=>'删除失败'
			];
		}
		return json($data);
	}

	//新增用户
	public function addUser(){
		if(request()->isAjax()){
			$sz=request()->param();
			$validate=Loader::validate('user');
			if($validate->scene('add')->check($sz)){
				$arr=[
					'username'=>trim(input('username',null,'htmlspecialchars')),
					'mobile'=>trim(input('mobile',null,'htmlspecialchars')),
					'token'=>setLoginToken(trim(input('mobile',null,'htmlspecialchars'))),
					'expire'=>strtotime(input('expire').' 23:59:59')
				];
				if(Db::name('user')->insert($arr)){
					return json(['code'=>0,'msg'=>'添加成功']);
				}else{
					return json(['msg'=>'添加失败']);
				}
			}else{
				return json(['msg'=>$validate->getError()]);
			}
			
		}
		return $this->fetch();
	}
	

	//编辑用户
	public function editUser(){
		if(!request()->isGet() || !input('?id')){
			return $this->error('非法访问');
		}
		if(!$rs= Db::name('user')->find(input('id'))){
			return $this->error('用户不存在');
		}	
		return $this->fetch('',['rs'=>$rs]);
	}

	//保存编辑信息
	public function saveUser(){
		if(request()->isAjax() && input('?id')){
			$sz=[];
			if(!$rs=Db::name('user')->find(input('id'))){
				$this->error('非法访问');
			}
			$upd=request()->param();
			if(!empty($upd['username']) && input('username')!=$rs['username']){
				$sz['username']=trim(input('username',null,'htmlspecialchars'));
			}
			if(!empty($upd['mobile']) && input('mobile') != $rs['mobile']){
				$sz['mobile']=trim(input('mobile',null,'htmlspecialchars'));
			}
			$validate=Loader::validate('user');
			if($validate->scene('edit')->check($sz)){
				$sz['expire']=strtotime(input('expire').' 23:59:59');
				$sz['id']=input('id');
				if(Db::name('user')->update($sz)){
					return json(['code'=>0,'msg'=>'编辑成功']);
				}else{
					return json(['msg'=>'编辑失败']);
				}
			}else{
				return json(['msg'=>$validate->getError()]);
			}
		}else{
			$this->error('非法访问');
		}
	}

	//api地址
	public function copyApi(){
		if(!request()->isGet() || !input('?id')){
			return $this->error('非法访问');
		}
		if(!$rs= Db::name('user')->find(input('id'))){
			return $this->error('用户不存在');
		}	
		$upd=Db::name('config')->where(['code'=>'wss'])->find();
		$str=$upd['value'];
		$url=str_replace('{TOKEN}', $rs['token'], $str);
		$rs['token']=$url;
		return $this->fetch('',['rs'=>$rs]);
	}
}

?>