<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Log;

/**
*	注册
*/
class Register extends Controller{

  protected $User = null; 
  protected function _initialize(){
    parent::_initialize();
    $this->User = model('User');
  }

  public function check(){
    $openid = input('post.openid');
    if (empty($openid)) {
      return json(['data'=>null,'code'=>1,'msg'=>'OPENID 不能为空']);
    }
    $nickname = input('post.nickname');
    if (empty($nickname)) {
      return json(['data'=>null,'code'=>1,'msg'=>'昵称不能为空']);
    }
    $sex = input('post.sex',0);
    $headimgurl = input('post.headimgurl');

    $role = model('Role')->where(['name'=>'user'])->find();
    if (!$role) {
      return json(['data'=>$repwd,'code'=>1,'msg'=>'不存在用户角色']);
    }
    $this->User->openid = $openid;
    $this->User->nickname = $nickname;
    $this->User->sex = $sex;
    $this->User->headimgurl = $headimgurl;
    $this->User->role_id = $role['id'];
    $result = $this->User->save();
    if ($result) {
      return json(['data'=>null,'code'=>0,'msg'=>'注册成功']);
    }else{
      return json(['data'=>$mobile,'code'=>1,'msg'=>'注册失败']);
    }
  }

}