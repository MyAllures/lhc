<?php
namespace app\admin\controller;

/**
*	管理用户
*/
class User extends Admin{

    protected $User = null; 
    protected function _initialize(){
        parent::_initialize();
        $this->User = model('KaMem');
    }

    public function index(){
        $KaGuan = model('KaGuan');
        $guans = $KaGuan->where(['guanid'=>0])->select();
        $this->assign('guans',$guans);

        $this->assign('meta_title','用户列表');
        return $this->fetch();
    }

    public function load(){
        $where = [];
        $name = input('get.name');
        if (!empty($name)) {
            $where['kauser'] = ['like','%'.$name.'%'];
        }
        $guanid1 = input('get.guanid1');
        $guanid = input('get.guanid');
        $zongid = input('get.zongid');
        $danid = input('get.danid');
        if ($danid > 0) {
            $where['danid'] = $danid;
        }else if ($zongid > 0) {
            $where['zongid'] = $zongid;
        }else if ($guanid > 0) {
            $where['guanid'] = $guanid;
        }else if ($guanid1 > 0) {
            $where['guanid1'] = $guanid1;
        }
        $page = input('get.page');
        $limit = input('get.limit');
        $list = $this->User->where($where)->order('adddate desc')->paginate($limit,false,['page'=>$page]);
        $data = [];
        foreach ($list as $key => $value) {
            $data[$key]['id'] = $value['id'];
            $data[$key]['kauser'] = $value['kauser'];
            $data[$key]['xm'] = $value['xm'];
            $data[$key]['cs_ts'] = $value['cs'].'/'.$value['ts'];
            $data[$key]['dan'] = $value['dan'] ;//代理
            $data[$key]['zong'] = $value['zong'] ;//总代
            $data[$key]['guan'] = $value['guan'] ;//股东
            $data[$key]['guan1'] = $value['guan1'] ;//大股东
            $data[$key]['dan_zc'] = $value['dan_zc'] * 10 .'%';
            $data[$key]['zong_zc'] = $value['zong_zc']* 10 .'%';
            $data[$key]['guan_zc'] = $value['guan_zc']* 10 .'%';
            $data[$key]['guan1_zc'] = $value['guan1_zc']* 10 .'%';
            $data[$key]['dagu_zc'] = $value['dagu_zc']* 10 .'%';
            $data[$key]['abcd'] = $value['abcd'];
            $data[$key]['login_times'] = $value['look'];
            $data[$key]['state'] = $value['stat'];
            $data[$key]['create_time'] = $value['adddate'];
        }
        return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
    }

    public function add(){
        if ($this->request->isPost()) {
            $role = model('Role')->where(['name'=>'user'])->find();
            if (!$role) {
                return json(['data'=>$repwd,'code'=>1,'msg'=>'不存在用户角色']);
            }
            $this->User->role_id = $role['id'];
            $this->User->name = input('post.name');
            $password = input('post.password');
            $this->User->password = $password;
            $result = $this->User->save();
            if ($result) {
                return json(['data'=>$this->User->id,'code'=>0,'msg'=>'添加用户成功']);
            }else{
                return json(['data'=>$_POST,'code'=>1,'msg'=>'添加失败']);
            }
        }else{
            $Role = model('Role');
            $roles = $Role->where(['name'=>['neq','admin']])->select();
            $this->assign('roles',$roles);

            $this->assign('meta_title','添加用户');
            return $this->fetch();
        }
    }

    public function edit(){
        if ($this->request->isPost()) {
            $id = input('post.id');
            $user = $this->User->where(['id'=>$id])->find();
            if (!$user) {
                return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
            }
            $password = input('post.password');
            if (!empty($password)) {
                $user->password = $password;
            }
            $truename = input('post.truename');
            $user->truename = $truename;
            $sex = input('post.sex');
            $idcard = input('post.idcard/a');
            if(strlen($idcard['no']) != 18) {
                return json(['data'=>null,'code'=>1,'msg'=>'身份证号错误']);
            }
            $user->idcard = $idcard;

            $birthday = input('post.birthday');
            if (empty($birthday)) {
                return json(['data'=>null,'code'=>1,'msg'=>'请选择出生日期']);
            }
            $arr = date_parse_from_format('Y年m月d日',$birthday);
            $birthday = mktime(0,0,0,$arr['month'],$arr['day'],$arr['year']);

            $today = $this->request->time();
            $diff = floor(($today - $birthday) / 86400 / 365);
            $age = strtotime(date('Ymd',$birthday) . ' +' . $diff . 'years') > $today ? ($diff + 1) : $diff;
            $user->birthday = $birthday;
            $user->age = $age;
            $user->sex = $sex;
            $user->taobao = input('post.taobao');
            $user->taoqi = input('post.taoqi');
            $order_no = input('post.order_no');
            if (empty($order_no) || strlen($order_no) != 4) {
                return json(['data'=>null,'code'=>1,'nsg'=>'订单编号输入错误']);
            }
            $user->order_no = $order_no;

            $score = input('post.score');
            $user->score = $score;

            $credit = input('post.credit/a');
            $user->credit = json_encode($credit);
            $result = $user->save();
            if ($result) {
                return json(['data'=>null,'code'=>0,'msg'=>'编辑成功']);
            }
            return json(['data'=>null,'code'=>1,'msg'=>'编辑失败']);
        }else{
            $id = input('get.id');
            $user = $this->User->where(['id'=>$id])->find();
            if (!$user) {
                $this->error('参数错误');
            }
            $this->assign('user',$user);
            $this->assign('meta_title','编辑用户');
            return $this->fetch();
        }
    }

    public function confirm(){
        if ($this->request->isPost()) {
            $ids = input('post.ids/a');
            $users = $this->User->hasWhere('Role',['name'=>'user'])->where(['User.id'=>['in',$ids],'User.check'=>0])->select();
            if (!$users) {
                return json(['data'=>null, 'code'=>1,'msg'=>'已全部确认或参数错误']);
            }
            foreach ($users as $key => $user) {
                $user->check = 1;
                $user->save();
            }
            return json(['data'=>null,'code'=>0,'msg'=>'批量确认成功']);
        }
    }

    public function delete(){
        $id = input('post.id');
        $user = $this->User->where(['id'=>$id])->find();
        if (!$user) {
            return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
        }
        $result = $user->delete();
        if ($result) {
            return json(['data'=>null,'code'=>0,'msg'=>'删除成功']);
        }
        return json(['data'=>null,'code'=>1,'msg'=>'删除失败']);
    }

    public function charge(){
        if ($this->request->isPost()) {
            $id = input('post.id');
            $user = $this->User->where(['id'=>$id])->find();
            if(!$user){
                return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
            }
            $coin = input('post.coin');
            $Finance = model('Finance');
            $Finance->no = 'C'.date('YmdHis').rand(100,999);
            $Finance->user_id = $user['id'];
            $Finance->value = $coin;
            $Finance->balance = $user['balance'];
            $Finance->coin = $user['coin'] + $coin;
            $Finance->mode = 1;//充值
            $Finance->type = 1;
            $Finance->state = 2;
            $Finance->operator_id = $this->user['id'];
            $result = $Finance->save();
            if ($result) {
                $user->coin = ['exp','`coin` + '.$coin];
                $user->save();
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

    public function changecheck(){
        $id = input('post.id');
        $user = $this->User->where(['id'=>$id])->find();
        if ($user) {
            $check = input('post.state');
            $user->check = $check == 'true'?1:0;
            $result = $user->save();
            if ($result) {
                return json(['data'=>null,'code'=>0,'msg'=>'审核成功']);
            }
            return json(['data'=>$_POST,'code'=>1,'msg'=>'审核失败']);
        }else{
            return json(['data'=>$_POST,'code'=>1,'msg'=>'参数错误']);
        }
    }

    public function changepwd(){
        if ($this->request->isPost()) {
            $password = input('post.password');
            $confirmpwd = input('post.confirmpwd');
            if ($password != $confirmpwd) {
                return json(['data'=>'','code'=>1,'msg'=>'确认密码与新密码不一致']);
            }

            $user_id = $this->user['id'];
            $oldpwd = input('post.oldpwd');
            $where['id'] = $user_id;
            $where['password'] = md5($oldpwd);
            $user = $this->User->where($where)->find();
            if (!$user) {
                return json(['data'=>'','code'=>1,'msg'=>'旧密码错误']);
            }

            $user->password = $password;
            $result = $user->save();
            if ($result) {
                 return json(['data'=>null,'code'=>0,'msg'=>'修改成功']);
            }
            return json(['data'=>null,'code'=>0,'msg'=>'修改成功']);
        }else{
            $this->assign('meta_title','修改密码');
            return $this->fetch();
        }
    }

    public function loadguan(){
        $KaGuan = model('KaGuan');
        $guanid = input('post.guanid');
        if ($guanid != 0) {
            $guan = $KaGuan->where(['id'=>$guanid])->find();
            if (!$guan) {
                return json(['data'=>'','code'=>1,'msg'=>'参数错误']);
            }
            $data['id'] = $guan['id'];
            $data['kauser'] = $guan['kauser'];
            $data['lx'] = $guan['lx'];
        }
        $list = $KaGuan->where(['guanid'=>$guanid])->select();
        $children = [];
        foreach ($list as $key => $value) {
            $children[$key]['id'] = $value['id'];
            $children[$key]['kauser'] = $value['kauser'];
        }
        $data['children'] = $children;
        return json(['data'=>$data,'code'=>0,'msg'=>'加载成功']);
    }

    public function finance(){
        $user_id = input('get.id');
        $User = model('User');
        $user = $User->where(['id'=>$user_id ])->find();
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