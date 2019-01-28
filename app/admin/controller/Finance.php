<?php
namespace app\admin\controller;

/**
*	财务管理
*/
class Finance extends Admin{

	protected $Finance = null;
	protected function _initialize(){
        parent::_initialize();
        $this->Finance = model('Finance');
    }
    
	public function index(){
		
	}

	public function load()
	{
		$page = input('get.page');
		$limit = input('get.limit');
		$where = [];
		$type = input('get.type');
		if (!empty($type)) {
			$where['type'] = $type;
		}
		$list = $this->Finance->where($where)->order('create_time desc')->paginate($limit,false,['page'=>$page]);
		$data = [];
		foreach ($list as $key => $value) {
			$data[$key]['id'] = $value['id'];
			$data[$key]['no'] = $value['no'];
			$data[$key]['nickname'] = $value['user']['nickname'].'['.$value['user']['id'].']';
			$data[$key]['value'] = $value['value'];
			$data[$key]['balance'] = $value['balance'];
			$data[$key]['coin'] = $value['coin'];
			$data[$key]['type'] = $value['type'];
			$data[$key]['type_text'] = $value['type_text'];
			$data[$key]['state'] = $value['state'];
			$data[$key]['state_text'] = $value['state_text'];
			$data[$key]['create_time'] = $value['create_time'];
		}
		return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}

	public function charge()
	{
		$this->assign('meta_title','充值');
		return $this->fetch();
	}

	public function addcharge()
	{
		if ($this->request->isPost()) {
	        $user_name = input('post.username');
	        $user = $this->User->where(['User.name'=>$user_name])->find();
	        if (!$user) {
	        	return json(['data'=>null,'code'=>1,'msg'=>'账户不存在']);
	        }
	        $amount = input('post.amount');
	        $amount = floatval($amount);
	        if ($amount == 0) {
	        	return json(['data'=>null,'code'=>1,'msg'=>'请输入正确金额']);
	        }
	        $coin = $user['coin'] + $amount;
	        $this->Finance->no = aino('C','Ymd');
	        $this->Finance->user_id = $user['id'];
	        $this->Finance->amount = $amount;
	        $this->Finance->balance = $user['balance'];
	        $this->Finance->coin = $coin;
	        $this->Finance->type = 1;
	        $this->Finance->state = 2;
	        $this->Finance->operator_id = $this->user['id'];
	        $result = $this->Finance->save();
	        if ($result) {
	        	$user->coin = $coin;
	        	$user->save();

	        	return json(['data'=>null,'code'=>0,'msg'=>'充值成功']);
	        }
	        return json(['data'=>null,'code'=>1,'msg'=>'充值失败']);
		}else{
			$this->assign('meta_title','添加充值');
			return $this->fetch();
		}
	}

	public function taocan(){
		$this->assign('meta_title','充值套餐');
		return $this->fetch();
	} 

	public function loadtc(){
		$page = input('get.page');
		$limit = input('get.limit');
		$where = [];
		$Taocan = model('Taocan');
		$list = $Taocan->where($where)->order('create_time desc')->paginate($limit,false,['page'=>$page]);
		$data = [];
		foreach ($list as $key => $value) {
			$data[$key]['id'] = $value['id'];
			$data[$key]['sort'] = $value['sort'];
			$data[$key]['pic'] = '<img src="'.$value['pic'].'">';
			$data[$key]['number'] = $value['number'];
			$data[$key]['user_price'] = $value['user_price'];
			$data[$key]['agent_price'] = $value['agent_price'];
		}
		return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}
		
	public function addtc(){
		if ($this->request->isPost()) {
			$Taocan = model('Taocan');
	        $Taocan->pic = input('post.pic');
			$Taocan->number = input('post.number');
			$Taocan->user_price = input('post.user_price');
			$Taocan->agent_price = input('post.agent_price');
			$result = $Taocan->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'添加成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'添加失败']);
		}else{
			$this->assign('meta_title','添加套餐');
			return $this->fetch();
		}
	}

	public function edittc(){
		$Taocan = model('Taocan');
		if ($this->request->isPost()) {
			$id = input('post.id');
			$taocan = $Taocan->where(['id'=>$id])->find();
			if (!$taocan) {
				return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
			}
	        $taocan->pic = input('post.pic');
			$taocan->number = input('post.number');
			$taocan->user_price = input('post.user_price');
			$taocan->agent_price = input('post.agent_price');
			$result = $taocan->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'编辑成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'编辑失败']);
		}else{
			$id = input('get.id');
			$taocan = $Taocan->where(['id'=>$id])->find();
			$this->assign('taocan',$taocan);
			$this->assign('meta_title','编辑套餐');
			return $this->fetch();
		}
	}

	public function sorttc(){
		if ($this->request->isPost()) {
			$id = input('post.id');
			$Taocan = model('Taocan');
			$taocan = $Taocan->get($id);
			if ($taocan) {
				$sort = input('post.sort');
				$taocan->sort = $sort;
				$result = $taocan->save();
				if ($result) {
					return json(['data'=>null,'code'=>0,'msg'=>'排序成功']);
				}
			}	
			return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
		}
	}

	public function delete(){
		$Taocan = model('Taocan');
        $id = input('post.id');
        $taocan = $Taocan->where(['id'=>$id])->find();
        if (!$taocan) {
            return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
        }
        $result = $taocan->delete();
        if ($result) {
            return json(['data'=>null,'code'=>0,'msg'=>'删除成功']);
        }
        return json(['data'=>null,'code'=>1,'msg'=>'删除失败']);
    }
}













