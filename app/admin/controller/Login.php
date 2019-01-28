<?php
namespace app\admin\controller;

/**
*	登录
*/
class Login extends Admin{

  protected $Login = null; 
  protected function _initialize(){
    parent::_initialize();
    $this->Login = model('Login');
  }

  public function index(){
    if($user = is_login('admin')){
      session('admin_auth', null);
    }
    $this->assign('meta_title','管理员登录');
    return $this->fetch();
  } 

  public function check(){
    if ($this->request->isPost()) {
      if (config('captcha.on')) {
        $vercode = input('post.vercode');
        if(!captcha_check($vercode)){
          return json(['data'=>$vercode,'code'=>1,'msg'=>'验证码错误']);
        };
      }

      $adminrole = model('Role')->where(['name'=>'admin','state'=>1])->find();
      if (!$adminrole) {
        return json(['data'=>null,'code'=>1,'msg'=>'缺少管理员角色']);
      }

      $KaAdmin = model('KaAdmin');
      $user_name = input('post.username');
      $user_password = input('post.password');
      $user_password = md5($user_password);
      $condition['username'] = $user_name;
      $admin = $KaAdmin->hasWhere('Role',['pid'=>$adminrole['id'],'state'=>1])->where($condition)->whereOr(['role_id'=>$adminrole['id']])->find();
      if(!$admin) {
        return json(['data'=>'','code'=>1,'msg'=>'用户不存在或已被禁用']);
      }else if($admin['password'] !== $user_password){
        return json(['data'=>'','code'=>1,'msg'=>'密码错误']);
      }

      if($this->updateInfo($admin)){
        return json(['data'=>null,'code'=>0,'msg'=>'登录成功']);
      }else{
        return json(['data'=>'','code'=>1,'msg'=>'登录失败']);
      }
    }
  }

    //更新用户登录信息
  private function updateInfo($user){

    /* 更新登录信息 */
    $data = array(
      'id'              => $user['id'],
      'look'     => array('exp', '`look`+1'),
      'LastLogin' => date('Y-m-d H:i:s',$this->request->time()),
      'LastLoginIP'   => $this->request->ip(),
    );

    $KaAdmin = model('KaAdmin');
    if($KaAdmin->update($data)){
      $auth['id'] = $user['id'];
      $auth['name'] = $user['username'];
      $auth['stadmin50']=$user['admin'];
      $auth['role'] = $user['role']->toArray();
      session('admin_auth', $auth);
      return true;
    }else{
      return false;
    }
  }
}