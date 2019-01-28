<?php
namespace app\admin\validate;

use think\Validate;
class User extends Validate{
	protected $rule=[
		'username'=>'require|length:2,20|unique:user',
		'mobile'=>['regex'=>'/^1[34578]\d{9}$/i','require','unique'=>'user']
	];
	protected $message=[
		'username.require'=>'账号不能为空',
		'username.length'=>'账号长度不正确',
		'username.unique'=>'账号已存在',
		'mobile.require'=>'手机号码不能为空',
		'mobile.unique'=>'该手机号码已被注册',
		'mobile.regex'=>'手机号码格式不正确，请检查'
	];
	protected $scene=[
		'add'=>['username','mobile'],
		'edit'=>['username'=>'length:2,20|unique:user','mobile'=>['regex'=>'/^1[34578]\d{9}$/i','unique'=>'user']]	
	];
}

?>