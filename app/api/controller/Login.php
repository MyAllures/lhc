<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Log;

class Login extends Controller{

	protected $Login = null;
	protected function _initialize(){
		parent::_initialize();
		$this->Login = model('Login');
	}

	public function check(){
		$User = model('User');
		$openid = input('get.openid');
		if (empty($openid)) {
			return json(['data'=>null,'code'=>1,'msg'=>'OPENID 不能为空']);
		}
		$from = input('get.from');
		if (empty($from)) {
			return json(['data'=>null,'code'=>1,'msg'=>'FROM 不能为空']);
		}
		$user = $User->where(['openid'=>$openid,'from'=>$from])->find();
		if (!$user) {
			$nickname = input('get.nickname');
			if (empty($nickname)) {
				return json(['data'=>null,'code'=>1,'msg'=>'昵称不能为空']);
			}

			$role = model('Role')->where(['name'=>'user'])->find();
		    if (!$role) {
		      return json(['data'=>null,'code'=>1,'msg'=>'不存在用户角色']);
		    }
			$sex = input('get.sex',0);
			$headimgurl = input('get.headimgurl');

			$User = model('User');
			$user['from'] = $from;
			$user['openid'] = $openid;
			$user['nickname'] = $nickname;
			$user['sex'] = $sex;
			$user['headimgurl'] = $headimgurl;
			$user['role_id'] = $role['id'];
			$user['state'] = 1;
			$user['agent_id'] = 0;
			$user['coin'] = 0;
			$result = $User->save($user);
			if (!$result) {
				return json(['data'=>null,'code'=>1,'msg'=>'注册失败']);
			}
			$user['id'] = $User->id;
		}else if (!$user['state']) {
			return json(['data'=>null,'code'=>1,'msg'=>'该用户被禁用']);
		}

		$token = md5(guid());
		$request = Request();
		$data = array(
			'id' => $user['id'],
			'token'	=>$token,
			'login_times'     => array('exp', '`login_times`+1'),
		    'last_login_time' => $request->time(),
		    'last_login_ip'   => $request->ip(),
		);

		if($User->update($data)){
			$auth['id'] = $user['id'];
			$auth['agent_id'] = $user['agent_id'];
			$auth['from'] = $user['from'];
			$auth['openid'] = $user['openid'];
			$auth['token'] = $token;
			$auth['coin'] = $user['coin'];
			$auth['nickname'] = $user['nickname'];
			$auth['sex'] = $user['sex'];
			$auth['headimgurl'] = $user['headimgurl'];
			return json(['data'=>$auth,'code'=>0,'msg'=>'登录成功']);
		}
		return json(['data'=>null,'code'=>1,'msg'=>'登录失败']);
	}
}