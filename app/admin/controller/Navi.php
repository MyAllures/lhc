<?php
namespace app\admin\controller;

/**
*	导航管理
*/
class Navi extends Admin{

	protected $Navi = null;
    protected function _initialize(){
        parent::_initialize();
        $this->Navi = model('Navi');
    }

	//导航列表
	public function index(){
		$pid = input('get.pid');
		$pnavi = $this->Navi->get($pid);
		$this->assign('pnavi',$pnavi);

		$position = input('get.position','admin');
		$this->assign('position',$position);
		
		$this->assign('meta_title','导航列表');
		return $this->fetch();
	}

	public function load(){
		$role = $this->user['role'];
		$Navi = model('Navi');
		$pid = input('get.pid',0);
		$level = input('get.level',3);
		$list = $Navi->navis($pid,$role['name'],[],$level);
		return json(['data'=>$list,'code'=>0,'msg'=>'加载成功']);
	}

	//面包屑
	public function breadcrumb($id){
        $breadcrumb = ['<span class="layui-breadcrumb">'];
        $func = function($id) use (&$func,&$breadcrumb){
            $navi = $this->Navi->where(['id'=>$id])->find();
            if ($navi) {
                array_push($breadcrumb,'<a>'.$navi['cname'].'</a>');
                $func($navi['pid']);
            }
            return $breadcrumb;
        };
     	$func($id);
        array_push($breadcrumb,'</span>');
        return implode('', $breadcrumb);
	}

	//排序
	public function sort(){
		$id = input('post.id');
		$navi = $this->Navi->get($id);
		if ($navi) {
			$sort = input('post.sort');
			$navi->sort = $sort;
			$result = $navi->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'排序成功']);
			}
		}	
		return json(['data'=>$_POST,'code'=>1,'msg'=>'参数错误']);
	}

	public function add(){
		if ($this->request->isPost()) {
			$this->Navi->pid = input('post.pid');
			$this->Navi->position = input('post.position');
			$this->Navi->cname = input('post.cname');
			$this->Navi->icon = input('post.icon');
			$this->Navi->action = input('post.action');
			$this->Navi->target = input('post.target');
			$this->Navi->type = input('post.type');
			$result = $this->Navi->save();
			if ($result) {
				return json(['data'=>$this->Navi->id,'code'=>0,'msg'=>'添加导航成功']);
			}
			return json(['data'=>$_POST,'code'=>1,'msg'=>'添加导航失败']);
		}else{
			$pid = input('param.pid');
			$pnavi = $this->Navi->get($pid);
			$this->assign('pnavi',$pnavi);

			$position = input('param.position');
			$this->assign('position',$position);

			$this->assign('meta_title','添加菜单');
			return $this->fetch();
		}
	}

	public function edit(){
		if ($this->request->isPost()) {
			$id = input('post.id');
			$navi = $this->Navi->where(['id'=>$id])->find();
			if ($navi) {
				$navi->cname = input('post.cname');
				$navi->icon = input('post.icon');
				$navi->action = input('post.action');
				$navi->target = input('post.target');
				$navi->type = input('post.type');
				$result = $navi->save();
				if ($result) {
					return json(['data'=>null,'code'=>0,'msg'=>'编辑导航成功']);
				}
				return json(['data'=>$_POST,'code'=>1,'msg'=>'编辑导航失败']);
			}
			return json(['data'=>$_POST,'code'=>1,'msg'=>'参数错误']);
		}else{
			$id = input('param.id');
			$navi = $this->Navi->where(['id'=>$id])->find();
			if (!$navi) {
				$this->error('参数错误');
			}
			$this->assign('navi',$navi);
			$this->assign('meta_title','删除菜单');
			return $this->fetch();
		}
	}

	public function delete(){

	}
}















