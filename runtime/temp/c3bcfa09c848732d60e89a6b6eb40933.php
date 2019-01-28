<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:60:"D:\www\PHPTutorial\WWW\lhc/app/admin\view\index\console.html";i:1544520202;s:58:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\base.html";i:1548388375;s:57:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\var.html";i:1544147308;}*/ ?>
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
h3{font-weight: 600;}
em{font-style: normal;color: red;}
.layui-quote-nm{background: #fff;}
div[carousel-item] div{padding-left: 10px;}
.layadmin-text-center{text-align: center;}
.layadmin-text-center img {max-width: 80%;border-radius: 50%;margin-top: 5px;}
.user-account{border-left: 1px solid #e6e6e6; text-align: center;}
.user-account div:not(:last-child){border-bottom: 1px solid #e6e6e6;}
.user-total{text-align: center;    padding: 36px;}
.user-total div:not(:last-child){border-right: 1px solid #e6e6e6;}
.user-total i{font-size: 25px;}
.user-total div:nth-child(1) i{color: #680279;}
.user-total div:nth-child(2) i{color: #ded013;}
.user-total div:nth-child(3) i{color: #035cbb;}
.user-total div:nth-child(4) i{color: #13bd00;}
</style>


		<script type="text/javascript" src="/public/static/plugins/layui/layui.js"></script>
	</head>
</head>
<body>
	<!-- 头部 -->
	
	<!-- /头部 -->
	
	<!-- 主体 -->
	
<div class="layui-fluid">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md6" style="padding-left: 0px;">
			<div class="layui-card">
				<div class="layui-card-header">账户信息</div>
				<div class="layui-card-body">
					<div class="layui-row">
						<div class="layadmin-contact-box layui-col-md10">
							<div class="layui-col-md2 layui-col-sm3">
								<div class="layadmin-text-center">
									<img src="/public/admin/images/character.jpg">
								</div>
							</div>
							<div class="layui-col-md8 layadmin-padding-left20 layui-col-sm6">
								<h3 class="layadmin-title">
									<strong><?php echo $user['truename']; ?></strong>
								</h3>
								<div class="layadmin-address">
									登录次数：<?php echo $user['login_times']; ?>
									<br/>
									最后登陆IP：<?php echo $user['last_login_ip']; ?>
									<br/>
									最后登陆时间：<?php echo date("Y-m-d H:m:i",$user['last_login_time']); ?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-col-md6" style="padding-right: 0px;">
			<div class="layui-card">
				<div class="layui-card-header">用户统计</div>
				<div class="layui-card-body">
					<div class="layui-row user-total">
						<div class="layui-col-md4" >
							<i class="layui-icon layui-icon-release"></i>
							<h3>100</h3>
							<span>代理</span>
						</div>
						<div class="layui-col-md4" >
							<i class="layui-icon layui-icon-user"></i>
							<h3>10000</h3>
							<span>会员</span>
						</div>
						<div class="layui-col-md4">
							<i class="layui-icon layui-icon-rmb"></i>
							<h3>99999</h3>
							<span>账户</span>
						</div>
					</div>
				</div>
			</div>
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
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index','console']);
</script>

	<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
		
	</div>
	<!-- /底部 -->
</body>
</html>
