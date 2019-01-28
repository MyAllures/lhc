<?php
namespace app\admin\controller;

/**
*	游戏管理
*/
class Game extends Admin{

	protected $Game = null;
	protected function _initialize(){
        parent::_initialize();
        $this->Game = model('Game');
    }

	public function index(){
		$this->assign('meta_title','游戏列表');
		return $this->fetch();
	}

	public function load(){
		$page = input('get.page');
		$limit = input('get.limit');
		$list = $this->Game->Order('sort asc')->paginate($limit,false,['page'=>$page]);
		$data = [];
		foreach ($list as $key => $value) {
			$data[$key]['id'] = $value['id'];
			$data[$key]['cname'] = $value['cname'];
			$data[$key]['sort'] = $value['sort'];
			$data[$key]['state'] = $value['state'];
			$data[$key]['state_text'] = $value['state_text'];
		}
		return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}

	public function add(){
		if ($this->request->isPost()) {
	        $this->Game->cname = input('post.cname');
	        $this->Game->pic = input('post.pic');
	        $this->Game->rule = input('post.rule');
	        $this->Game->explain = input('post.explain');
	        $this->Game->special = input('post.special');
	        $result = $this->Game->save();
	        if ($result) {
	        	return json(['data'=>null,'code'=>0,'msg'=>'编辑成功']);
	        }
	        return json(['data'=>null,'code'=>1,'msg'=>'编辑失败']);
		}else{
			$this->assign('meta_title','添加充值');
			return $this->fetch();
		}
	}

	public function edit(){
		if ($this->request->isPost()) {
			$id = input('post.id');
			$game = $this->Game->where(['id'=>$id])->find();
			if (!$game) {
				return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
			}
	        $game->pic = input('post.pic');
	        $game->rule = input('post.rule');
	        $game->explain = input('post.explain');
	        $game->special = input('post.special');
	        $result = $game->save();
	        if ($result) {
	        	return json(['data'=>null,'code'=>0,'msg'=>'编辑成功']);
	        }
	        return json(['data'=>null,'code'=>1,'msg'=>'编辑失败']);
		}else{
			$id = input('get.id');
			$game = $this->Game->where(['id'=>$id])->find();
			if (!$game) {
				$this->error('参数错误');
			}
			$this->assign('game',$game);
			$this->assign('meta_title','添加充值');
			return $this->fetch();
		}
	}

	public function delete(){
        $id = input('post.id');
        $game = $this->Game->where(['id'=>$id])->find();
        if (!$game) {
            return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
        }
        $result = $game->delete();
        if ($result) {
            return json(['data'=>null,'code'=>0,'msg'=>'删除成功']);
        }
        return json(['data'=>null,'code'=>1,'msg'=>'删除失败']);
    }


	public function sort(){
		$id = input('post.id');
		$game = $this->Game->get($id);
		if ($game) {
			$sort = input('post.sort');
			$game->sort = $sort;
			$result = $game->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'排序成功']);
			}
		}	
		return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
	}

	public function changestate(){
		$id = input('post.id');
		$game = $this->Game->where(['id'=>$id])->find();
		if ($game) {
			$state = input('post.state');
			$game->state = $state == 'true'?1:0;
			$result = $game->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'改变状态成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'改变状态失败']);
		}else{
			return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
		}
	}
}













