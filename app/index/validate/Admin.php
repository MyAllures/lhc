<?php
namespace app\admin\validate;
use think\Validate;
class Admin extends Validate{
	//定义字段验证规则
	protected $rule=[
		'username'=>'require',
		'password'=>'require'
	];

	//定义字段的验证信息
	protected $message=[
		'username.require'=>'账号不能为空',
		'password.require'=>'密码不能为空'
	];

	//定义验证场景
	protected $scene=[
		'login'=>['username','password'],
	];
}


?>