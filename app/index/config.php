<?php
return [
	'app_debug'              => true,
	'show_error_msg'         => true,
	'view_replace_str'       => [
		'__CSS__'=>'/file/admin/css',
		'__JS__'=>'/file/admin/js',
		'__IMG__'=>'/file/admin/images',
		'__PARTICLE__'=>'/file/admin/particles',
		'__MODULE__'=>request()->module(),
		'__LAYUI__'=>'/file/admin/layui',
		'__LAYUIS__'=>'/file/admin/layuis',
		'__BOOTSTRAP__'=>'/file/admin/layui/bootstrap/css/bootstrap.min.css',
		'__IMAGES__'=>'/file/lhc_images'
	],
	'keycode'=>'Lu9dgINify',		//管理员密码加密秘钥
	'cookiekey'=>'cjsakhdkasbdh',	//cookie加密秘钥
	'upload_path'=>ROOT_PATH.'file'.DS.'upload',		//默认上传图片的目录
	'pagesize'=>15,		//分页数

	'ftime'=>60000,

];

?>
