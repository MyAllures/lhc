<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:57:"D:\www\PHPTutorial\WWW\lhc/app/admin\view\user\index.html";i:1547014845;s:58:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\base.html";i:1548388375;s:57:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\var.html";i:1544147308;}*/ ?>
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
		<div class="layui-card-header">用户列表</div>
		<div class="layui-card-body">
			<div id="user-table" lay-filter="user"></div>
		</div>
	</div>
</div>

<script type="text/html" id="topToolBar">
	<div class="layui-btn-container">
		<form class="layui-form">
			<div class="layui-inline" style="width: 100px;">
				<select name="guanid1" lay-filter="agent" data-selected="{{ d.where.guanid1 }}">
				  <option value="0">大股东</option>
				</select>
			</div>
			<div class="layui-inline" style="width: 100px;">
				<select name="guanid" lay-filter="agent" data-selected="{{ d.where.guanid }}">
				  <option value="0">股东</option>
				</select>  
			</div>
			<div class="layui-inline" style="width: 100px;" >   
				<select name="zongid" lay-filter="agent" data-selected="{{ d.where.zongid }}">
				  <option value="0">总代</option>
				</select> 
			</div>
			<div class="layui-inline" style="width: 100px;" >    
				<select name="danid" data-selected="{{ d.where.danid }}">
				  <option value="0">代理</option>
				</select>          
			</div>
			<div class="layui-inline">
				<input type="text" name="name" value="{{ typeof(d.where.name) == 'undefined'?'':d.where.name }}" placeholder="用户账号" class="layui-input">
			</div>
			<a href="javascript:;" class="layui-btn layui-btn-normal layui-btn-xs"  lay-submit lay-filter="LAY-search" style="margin-bottom: 0px;margin-left: 5px">搜索</a>
		</form>
	</div>
</script>

<script type="text/html" id="switchState">
  <input type="checkbox" name="state" value="1" lay-skin="switch" lay-text="正常|禁用" lay-filter="state" data-id="{{ d.id }}" {{ d.state == 0 ? 'checked' : '' }}>
</script>
<script type="text/html" id="toolbar">
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
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
}).use(['index', 'user']);
</script>

	<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
		
	</div>
	<!-- /底部 -->
</body>
</html>
