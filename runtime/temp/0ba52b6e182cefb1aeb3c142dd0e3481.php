<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:56:"D:\www\PHPTutorial\WWW\lhc/app/admin\view\tan\index.html";i:1548309376;s:58:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\base.html";i:1548388375;s:57:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\var.html";i:1544147308;}*/ ?>
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
.layui-btn-container .layui-btn{margin-bottom: 0px;}
label,input,dl{font-size: 14px;display: block;}
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
		<div class="layui-card-header">注单查询</div>
		<div class="layui-card-body">
			<div id="tan-table" lay-filter="tan"></div>
		</div>
	</div>
</div>

<script type="text/html" id="topToolBar">
	<div class="layui-btn-container layui-form">
		<div class="layui-inline" style="width: 100px">
			<select name="class">
				<option value="1">账号</option>
			    <option value="2">下注单号</option>
			    <option value="3">下注盘类</option>
			</select>
		</div>
		<div class="layui-inline">
			<input type="text" name="key" autocomplete="off" class="layui-input">
		</div>
		<div class="layui-inline">
			<label style="padding-left: 15px;padding-right: 5px">日期区间</label>
		</div>
		<div class="layui-inline ">
			<input type="text" name="stardate" placeholder="开始日期" value="{{ typeof(d.where.stardate) == 'undefined'?layui.util.toDateString(new Date, 'yyyy-MM-dd'):d.where.stardate }}" autocomplete="off" class="layui-input" id="stardate">
		</div>
		<div class="layui-inline">
			<input type="text" name="enddate" placeholder="结束日期" value="{{ typeof(d.where.enddate) == 'undefined'?layui.util.toDateString(new Date, 'yyyy-MM-dd'):d.where.enddate }}" autocomplete="off" class="layui-input" id="enddate">
		</div>
		<a href="javascript:;" class="layui-btn layui-btn-normal layui-btn-sm" lay-submit lay-filter="LAY-btn-search" style="margin-left: 5px;">点击查询</a> 
	</div>
</script>

<script type="text/html" id="switchState">
  <input type="checkbox" name="state" value="1" lay-skin="switch" lay-text="可用|禁用" lay-filter="state" data-id="{{ d.id }}" {{ d.state == 1 ? 'checked' : '' }}>
</script>
<script type="text/html" id="toolbar">

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
}).use(['index', 'tan']);
</script>

	<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
		
	</div>
	<!-- /底部 -->
</body>
</html>
