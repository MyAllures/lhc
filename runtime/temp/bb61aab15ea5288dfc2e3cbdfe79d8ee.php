<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:58:"D:\www\PHPTutorial\WWW\lhc/app/admin\view\agent\index.html";i:1547449905;s:58:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\base.html";i:1548388375;s:57:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\var.html";i:1544147308;}*/ ?>
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
	.toolbar{margin-bottom: 10px;}
	input,dl{font-size: 14px;}
	.layui-input{height: 30px;}
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
		<div class="layui-card-header"><?php echo $level['cname']; ?>列表</div>
		<div class="layui-card-body"> 
			<input type="hidden" name="levelid" value="<?php echo $level['id']; ?>">
			<div id="agent-table" lay-filter="agent"></div>
		</div>
	</div>
</div>

<script type="text/html" id="topToolbar">
	<div class="layui-btn-container">
		<a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-sm" lay-event="add">添加</a>
	</div>
</script>

<script type="text/html" id="switchState">
  <input type="checkbox" name="state" value="1" lay-skin="switch" lay-text="通过|拒绝" lay-filter="state" data-id="{{ d.id }}" {{ d.state == 0 ? 'checked' : '' }}>
</script>
<script type="text/html" id="toolbar">
	<a class="layui-btn layui-btn layui-btn-xs " lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn layui-btn-xs layui-btn-normal" lay-event="detail">详细设定</a>
	<a class="layui-btn layui-btn layui-btn-xs layui-btn-primary" href="index.html">下级代理</a>
</script>

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
}).use(['index', 'agent']);
</script>

	<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
		
	</div>
	<!-- /底部 -->
</body>
</html>
