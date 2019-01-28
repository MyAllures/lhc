<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:61:"D:\www\PHPTutorial\WWW\lhc/app/admin\view\user\changepwd.html";i:1544606322;s:58:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\base.html";i:1548388375;s:57:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\var.html";i:1544147308;}*/ ?>
<!DOCTYPE HTML>
<html>
<head>
	<head>
		<meta charset="utf-8">
		<title><?php echo $meta_title; ?></title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="icon" href="/public/static/images/favicon.ico"  type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="/public/static/plugins/layui/css/layui.css">
		<link rel="stylesheet" href="/public/admin/css/admin.css" media="all">
		<style type="text/css">
			.collapse-link{float: right;cursor: pointer;}
		</style>
		
<style type="text/css">
.layui-fluid{padding: 0;}
.layui-form-item span{line-height: 38px;}
.layui-inline{    border: 1px solid #ece7e7;
	width: 200px;
	height: 200px;
}
.layui-inline div{padding: 10px;text-align: center;}
.layui-inline .image{width: 180px;height: 180px;}
.layui-inline div img{width: 100%;height: 100%}
</style>


		<script type="text/javascript" src="/public/static/plugins/layui/layui.js"></script>
	</head>
</head>
<body>
	<!-- 头部 -->
	
	<!-- /头部 -->
	
	<!-- 主体 -->
	
<div class="layui-fluid">	
	<div class="layui-card">
		<div class="layui-card-body">
			<form class="layui-form">
				<div class="layui-form-item">
					<label class="layui-form-label">旧密码</label>
					<div class="layui-input-inline">
						<input type="password" name="oldpwd" class="layui-input" lay-verify="required">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-inline">
						<input type="text" name="password" class="layui-input" lay-verify="required">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-inline">
						<input type="text" name="confirmpwd" class="layui-input" lay-verify="required">
					</div>
				</div>
				<div class="layui-form-item layui-layout-admin">
					<div class="layui-input-block">
						<div class="layui-footer" style="left: 0;">
							<button class="layui-btn" lay-submit lay-filter="LAY-user-changepwd">立即提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

	<!-- /主体 -->

	<!-- 底部 -->
	<script type="text/javascript">
(function(){
	var Think = window.Think = {
		"ROOT"   : "<?php echo request()->domain();?>", //当前网站地址
		"MODULE" : "<?php echo request()->module();?>",
		"DEEP"	  :"<?php echo \think\Config::get('pathinfo_depr'); ?>"
	}
})();
</script>
	
<script type="text/javascript">
	layui.config({
    base: '/public/admin/js/' //静态资源所在路径
    ,version: '20181201'
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'user']);
</script>

	<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
		
	</div>
	<!-- /底部 -->
</body>
</html>
