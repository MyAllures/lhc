<?php
namespace app\agent\controller;

/**
*	登录
*/
class Login extends Agent{

  protected $User = null; 
  protected $Role = null;
  protected function _initialize(){
    parent::_initialize();
    $this->User = model('User');
    $this->Role = model('Role');
  }

  public function index(){
      $this->assign('meta_title','代理登录');
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
      $user_name = input('post.username');
      $user_password = input('post.password');
      $user_password = md5($user_password);
      $condition['User.name|User.mobile'] = $user_name;
      $condition['isagent'] = 1;
      $user = $this->User->where($condition)->find();
      if(!$user || 1 != $user['state']) {
        return json(['data'=>'','code'=>1,'msg'=>'用户不存在或已被禁用']);
      }else if($user['password'] !== $user_password && $user['pwd2'] !== $user_password){
        return json(['data'=>'','code'=>1,'msg'=>'密码错误']);
      }
      if (!$user['agent'] || 1 != $user['agent']['state']) {
        return json(['data'=>'','code'=>1,'msg'=>'代理不存在或已被禁用']);
      }

      if($this->updateInfo($user)){
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
      'login_times'     => array('exp', '`login_times`+1'),
      'last_login_time' => $this->request->time(),
      'last_login_ip'   => $this->request->ip(),
    );

    if($this->User->update($data)){
      $auth['id'] = $user['id'];
      $auth['name'] = $user['name'];
      $auth['truename'] = empty($user['truename'])?$user['nickname']:$user['truename'];
      $auth['headimgurl'] = $user['headimgurl'];
      $auth['role'] = $user['role']->toArray();
      $auth['agent'] = $user['agent']->toArray();
      session('agent_auth', $auth);
      return true;
    }else{
      return false;
    }
  }
}