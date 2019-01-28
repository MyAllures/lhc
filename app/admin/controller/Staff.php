<?php
namespace app\admin\controller;

/**
*	员工用户
*/
class Staff extends Admin{

    protected $User = null; 
    protected $Role = null;
    protected function _initialize(){
        parent::_initialize();
        $this->User = model('User');
        $this->Role = model('Role');
    }

    public function index(){
        $this->assign('meta_title','员工列表');
        return $this->fetch();
    }

    public function load(){
    	$role = $this->user['role'];
    	$where = [];
        $page = input('get.page');
        $limit = input('get.limit');
        $list = $this->User->hasWhere('Role',['pid'=>$role['id'],'state'=>1])->where($where)->order('create_time desc')->paginate($limit,false,['page'=>$page]);
        $data = [];
        foreach ($list as $key => $value) {
            $data[$key]['id'] = $value['id'];
            $data[$key]['name'] = $value['name'];
            $data[$key]['truename'] = $value['truename'];
            $data[$key]['mobile'] = $value['mobile'];
            $data[$key]['role_cname'] = $value['role']['cname'];
            $data[$key]['login_times'] = $value['login_times'];
            $data[$key]['state'] = $value['state'];
            $data[$key]['state_text'] = $value['state_text'];
        }
        return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
    }

    public function add(){
    	if ($this->request->isPost()) {
    		$role = $this->user['role'];
    		$role_id = input('post.role_id');
            $role = $this->Role->where(['pid'=>$role['id'],'state'=>1,'id'=>$role_id])->find();
            if (!$role) {
                return json(['data'=>null,'code'=>1,'msg'=>'不存在用户角色']);
            }
            $name = input('post.name');
            $user = $this->User->hasWhere('Role',['pid'=>1,'state'=>1])->where(['User.name'=>$name])->find();
            if ($user) {
            	return json(['data'=>null,'code'=>1,'msg'=>'用户名已经存在']);
            }

            $this->User->role_id = $role['id'];
            $this->User->name = input('post.name');
            $this->User->password = input('post.password');
            $this->User->truename = input('post.truename');
            $this->User->mobile = input('post.mobile');
            $this->User->state = 1;
            $result = $this->User->save();
            if ($result) {
                return json(['data'=>$this->User->id,'code'=>0,'msg'=>'添加成功']);
            }else{
                return json(['data'=>$_POST,'code'=>1,'msg'=>'添加失败']);
            }
        }else{
        	$role = $this->user['role'];
            $roles = $this->Role->where(['pid'=>$role['id'],'state'=>1])->select();
            $this->assign('roles',$roles);

            $this->assign('meta_title','添加员工');
            return $this->fetch();
        }
    }

    //编辑
    public function edit(){
        if ($this->request->isPost()) {
            $id = input('post.id');
            $staff = $this->User->where(['id'=>$id])->find();
            if (!$staff) {
                return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
            }

            $role = $this->user['role'];
            $role_id = input('post.role_id');
            $role = $this->Role->where(['pid'=>$role['id'],'state'=>1,'id'=>$role_id])->find();
            if (!$role) {
                return json(['data'=>null,'code'=>1,'msg'=>'不存在用户角色']);
            }

            $staff->role_id = $role['id'];
            $password = input('post.password');
            if (!empty($password)) {
               $staff->password = $password;
            }
            
            $staff->truename = input('post.truename');
            $staff->mobile = input('post.mobile');
            $result = $staff->save();
            if ($result) {
                return json(['data'=>null,'code'=>0,'msg'=>'编辑成功']);
            }
            return json(['data'=>null,'code'=>1,'msg'=>'编辑失败']);
        }else{
            $id = input('get.id');
            $staff = $this->User->where(['id'=>$id])->find();
            if (!$staff) {
               $this->error('参数错误');
            }
            $this->assign('staff',$staff);

            $role = $this->user['role'];
            $roles = $this->Role->where(['pid'=>$role['id'],'state'=>1])->select();
            $this->assign('roles',$roles);

            $this->assign('meta_title','编辑员工');
            return $this->fetch();
        }
    }

    public function changestate(){
        $id = input('post.id');
        $user = $this->User->where(['id'=>$id])->find();
        if (!$user) {
        	return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
        }else{
            $state = input('post.state');
            $user->state = $state == 'true'?1:0;
            $result = $user->save();
            if ($result) {
                return json(['data'=>null,'code'=>0,'msg'=>'修改成功']);
            }
            return json(['data'=>null,'code'=>1,'msg'=>'修改失败']);
        }
    }

}











