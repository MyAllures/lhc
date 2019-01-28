<?php
namespace app\admin\controller;

/**
*	角色管理
*/
class Role extends Admin{

	private $Role = null;
	protected function _initialize(){
		parent::_initialize();
		$this->Role = model('Role');
	}

	public function index(){
		$this->assign('meta_title','角色列表');
		return $this->fetch();
	}

	public function load(){
		$role = $this->user['role'];
		$page = input('get.page');
		$limit = input('get.limit');
		$list = $this->Role->where(['pid'=>$role['id'],'state'=>1])->paginate($limit,false,['page'=>$page]);
		$data = [];
		foreach ($list as $key => $value) {
			$data[$key]['id'] = $value['id'];
			$data[$key]['name'] = $value['name'];
			$data[$key]['cname'] = $value['cname'];
			$data[$key]['description'] = $value['description'];
		}
		return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}

	public function add(){
		if ($this->request->isPost()) {
			$role = $this->user['role'];
			$this->Role->pid = $role['id'];
			$this->Role->name = input('post.name');
			$this->Role->cname = input('post.cname');
			$this->Role->description = input('post.description');
			$result = $this->Role->save();
			if ($result) {
				return json(['data'=>$this->Role->id,'code'=>0,'msg'=>'添加角色成功']);
			}
			return json(['data'=>$_POST,'code'=>1,'msg'=>'添加角色失败']);
		}else{
			$this->assign('meta_title','添加角色');
			return $this->fetch();
		}
	}

	public function edit(){
		if ($this->request->isPost()) {
			$id = input('post.id');
			$role = $this->Role->get($id);
			if ($role) {
				$role->name = input('post.name');
				$role->cname = input('post.cname');
				$role->description = input('post.description');
				$result = $role->save();
				if ($result) {
					return json(['data'=>null,'code'=>0,'msg'=>'编辑角色成功']);
				}
				return json(['data'=>$_POST,'code'=>1,'msg'=>'编辑角色失败']);
			}else{
				return json(['data'=>$_POST,'code'=>1,'msg'=>'参数错误']);
			}
		}else{
			$id = input('param.id');
			$role = $this->Role->where(['id'=>$id])->find();
			$this->assign('role',$role);

			$this->assign('meta_title','编辑角色');
			return $this->fetch();
		}
	}

	public function delete(){
		if ($this->request->isPost()) {
			$id = input('post.id');
			$role = $this->Role->where(['id'=>$id])->find();
			if (!$role) {
				return json(['data'=>$_POST,'code'=>1,'msg'=>'参数错误']);
			}
			$result = $role->delete();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'删除成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'删除失败']);
		}
	}

	public function loadnavis(){
		$role = $this->user['role'];
		$Navi = model('Navi');
		$pid = input('get.pid',0);
		$level = input('get.level',3);

		$list = model('Navi')->tree($pid,$role['name'],[],$level);
		return json(['data'=>$list,'code'=>0,'msg'=>'加载成功']);
	}

	public function auth(){
		if ($this->request->isPost()) {
			$id = input('post.id');
			$role = $this->Role->where(['id'=>$id])->find();
			if (!$role) {
				return json(['data'=>$_POST,'code'=>1,'msg'=>'参数错误']);
			}else{
				$navis = input('ids/a',[]);

				$ids_str = implode(',', $navis);
				$role->navis = $ids_str;
				$result = $role->save();
				if ($result) {
					return json(['data'=>null,'code'=>0,'msg'=>'授权成功']);
				}
				return json(['data'=>null,'code'=>1,'msg'=>'授权失败']);
			}
		}else{
			$role = $this->user['role'];
			$Navi = model('Navi');
			$navis = $Navi->navis(0,$role['name'],[]);
			$this->assign('navis',$navis);

			$id = input('param.id');
			$role = $this->Role->where(['id'=>$id])->find();
			if (!$role) {
				$this->error('参数错误');
			}
			$this->assign('role',$role);

			$this->assign('meta_title','角色授权');
			return $this->fetch();
		}
	}
}