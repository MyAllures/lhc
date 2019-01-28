<?php
namespace app\agent\controller;

/**
*	财务明细
*/
class Finance extends Agent{

	protected $Finance = null; 
	protected function _initialize(){
	    parent::_initialize();
	    $this->Finance = model('Finance');
	}


	public function charge(){
		$this->assign('meta_title','充值列表');
		return $this->fetch();
	}

	public function loadcharge(){
		$user_id = $this->user['id'];
        $where['user_id'] = $user_id;
        $where['type'] = 1;
        $page = input('get.page');
        $limit = input('get.limit');
        $list = $this->Finance->where($where)->order('create_time desc')->paginate($limit,false,['page'=>$page]);
        $data = [];
        foreach ($list as $key => $value) {
            $data[$key]['id'] = $value['id'];
            $data[$key]['no'] = $value['no'];
            $data[$key]['value'] = $value['value'];
            $data[$key]['coin'] = $value['coin'];
            $data[$key]['create_time'] = $value['create_time'];
            $data[$key]['state_text'] = $value['state_text'];
            $data[$key]['state'] = $value['state'];
        }
        return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}

	//
	public function addcharge(){
		if ($this->request->isPost()) {
			# code...
		}else{
            $Taocan = model('Taocan');
            $taocans = $Taocan->order('sort asc,id asc')->select();
            $this->assign('taocans',$taocans);
			$this->assign('meta_title','充值');
			return $this->fetch();
		}
	}

    public function gettaocan(){
        $id = input('post.id');
        $Taocan = model('Taocan');
        $taocan = $Taocan->where(['id'=>$id])->find();
        if (!$taocan) {
            return json(['data'=>null, 'code'=>1,'msg'=>'参数错误']);
        }
        $data['id'] = $taocan['id'];
        $data['number'] = $taocan['number'];
        $data['price'] = $taocan['agent_price'];
        return json(['data'=>$data, 'code'=>0,'msg'=>'加载成功']);
    }

	public function consume(){
		$this->assign('meta_title','消费列表');
		return $this->fetch();
	}

	public function loadconsume(){
		$user_id = $this->user['id'];
        $where['operator_id'] = $user_id;
        $where['type'] = 1;
        $page = input('get.page');
        $limit = input('get.limit');
        $list = $this->Finance->where($where)->order('create_time desc')->paginate($limit,false,['page'=>$page]);
        $data = [];
        foreach ($list as $key => $value) {
            $data[$key]['id'] = $value['id'];
            $data[$key]['no'] = $value['no'];
            $data[$key]['value'] = $value['value'];
            $data[$key]['coin'] = $value['coin'];
            $data[$key]['create_time'] = $value['create_time'];
            $data[$key]['state_text'] = $value['state_text'];
            $data[$key]['state'] = $value['state'];
            $data[$key]['remark'] = '为用户['.$value['user']['nickname'].']充值';
        }
        return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}
}
