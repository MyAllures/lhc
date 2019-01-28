<?php
namespace app\agent\controller;

/**
*	管理用户
*/
class User extends Agent{

    protected $User = null; 
    protected $Role = null;
    protected function _initialize(){
        parent::_initialize();
        $this->User = model('User');
        $this->Role = model('Role');
    }

    public function index(){
        $this->assign('meta_title','用户列表');
        return $this->fetch();
    }

    public function load(){
        $agent_id = $this->user['agent']['id'];
        $where['agent_id'] = $agent_id;
        $name = input('get.name');
        if (!empty($name)) {
            $where['User.name'] = ['like','%'.$name.'%'];
        }
        $page = input('get.page');
        $limit = input('get.limit');
        $list = $this->User->hasWhere('Role',['name'=>'user'])->where($where)->order('create_time desc')->paginate($limit,false,['page'=>$page]);
        $data = [];
        foreach ($list as $key => $value) {
            $data[$key]['id'] = $value['id'];
            $data[$key]['nickname'] = $value['nickname'];
            $data[$key]['headimgurl'] = '<img src="'.$value['headimgurl'].'">';
            $data[$key]['openid'] = $value['openid'];
            $data[$key]['coin'] = $value['coin'];
            $data[$key]['login_times'] = $value['login_times'];
            $data[$key]['sex_text'] = $value['sex_text'];
            $data[$key]['state_text'] = $value['state_text'];
            $data[$key]['state'] = $value['state'];
        }
        return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
    }

    public function charge(){
        if ($this->request->isPost()) {
            $id = input('post.id');
            $user = $this->User->where(['id'=>$id])->find();
            if(!$user){
                return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
            }

            $coin = input('post.coin');
            $coin = floatval($coin);
            $agent = $this->User->where(['id'=>$this->user['id']])->find();
            if ($coin > $agent['coin']) {
               return json(['data'=>null,'code'=>1,'msg'=>'您的账户钻石数量不足']);
           }

            $Finance = model('Finance');
            $data[0]['no'] = 'C'.date('YmdHis').rand(100,999);
            $data[0]['user_id'] = $user['id'];
            $data[0]['value'] = $coin;
            $data[0]['balance'] = $user['balance'];
            $data[0]['coin'] = $user['coin'] + $coin;
            $data[0]['mode'] = 2;
            $data[0]['type'] = 1;
            $data[0]['state'] = 2;
            $data[0]['operator_id'] = $this->user['id'];

            $data[1]['no'] = 'C'.date('YmdHis').rand(100,999);
            $data[1]['user_id'] = $agent['id'];
            $data[1]['value'] = $coin;
            $data[1]['balance'] = $agent['balance'];
            $data[1]['coin'] = $agent['coin'] - $coin;
            $data[1]['type'] = 2;
            $data[1]['state'] = 2;
            $result = $Finance->saveAll($data);
            if ($result) {
                $user->coin = ['exp','`coin` + '.$coin];
                $user->save();

                $agent->coin = ['exp','`coin` - '.$coin];
                $agent->save();
                return json(['data'=>null,'code'=>0,'msg'=>'充值成功']);
            }
            return json(['data'=>null,'code'=>1,'msg'=>'充值失败']);
        }else{
            $id = input('get.id');
            $user = $this->User->where(['id'=>$id])->find();
            if (!$user) {
                $this->error('登录超时，请重新登录');
            }
            $this->assign('user',$user);
            $this->assign('meta_title','充值');
            return $this->fetch();
        }        
    }

    public function finance(){
        $user_id = input('get.id');
        $user = $this->User->where(['id'=>$user_id ])->find();
        if(!$user){
            $this->error('参数错误');
        }
        $this->assign('user',$user);
        $this->assign('meta_title','财务明细');
        return $this->fetch();
    }

    public function loadfinance(){
        $user_id = input('get.userid');
        $where['user_id'] = $user_id;
        $page = input('get.page');
        $limit = input('get.limit');
        $Finance = model('Finance');
        $list = $Finance->where($where)->order('create_time desc')->paginate($limit,false,['page'=>$page]);
        $data = [];
        foreach ($list as $key => $value) {
            $data[$key]['id'] = $value['id'];
            $data[$key]['no'] = $value['no'];
            $data[$key]['value'] = $value['value'];
            $data[$key]['coin'] = $value['coin'];
            $data[$key]['mode_text'] = $value['mode_text'];
            $data[$key]['type_text'] = $value['type_text'];
            $data[$key]['state_text'] = $value['state_text'];
            $data[$key]['state'] = $value['state'];
            $data[$key]['create_time'] = $value['create_time'];
        }
        return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
    }
}