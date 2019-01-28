<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:59:"D:\www\PHPTutorial\WWW\lhc/app/admin\view\setting\site.html";i:1546055086;s:58:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\base.html";i:1548388375;s:57:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\var.html";i:1544147308;}*/ ?>
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
#sitelogo{   border: 1px solid #D2D2D2;width: 128px;height: 128px;}
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
		<div class="layui-card-header">站点设置</div>
		<div class="layui-card-body">
			<form class="layui-form" lay-filter="LAY-site-edit">
				<input type="hidden" name="key" value="site">
				<div class="layui-form-item">
					<label class="layui-form-label">站点简称</label>
					<div class="layui-input-inline">
						<input type="text" name="site[sname]" value="<?php echo (isset($site['sname']) && ($site['sname'] !== '')?$site['sname']:''); ?>"  lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">站点名称</label>
					<div class="layui-input-block">
						<input type="text" name="site[cname]" value="<?php echo $site['cname']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">版权信息</label>
					<div class="layui-input-block">
						<input type="text" name="site[copyright]" value="<?php echo $site['copyright']; ?>"  autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">系统状态</label>
					<div class="layui-input-block">
						<input type="checkbox" name="site[open]" lay-skin="switch" lay-text="开启|维护" <?php if($site['open'] == 0): ?>checked<?php endif; ?>>
					</div>
				</div>
				<div class="layui-form-item layui-layout-admin">
					<div class="layui-input-block">
						<div class="layui-footer" style="left: 0;">
							<button class="layui-btn" lay-submit lay-filter="LAY-site-edit">立即提交</button>
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
    ,version: '20180604'
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'setting']);
</script>

	<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
		
	</div>
	<!-- /底部 -->
</body>
</html>
