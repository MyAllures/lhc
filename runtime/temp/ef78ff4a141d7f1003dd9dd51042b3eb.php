<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:58:"D:\www\PHPTutorial\WWW\lhc/app/admin\view\index\index.html";i:1546681006;s:58:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\base.html";i:1548388375;s:57:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\var.html";i:1544147308;}*/ ?>
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
		

		<script type="text/javascript" src="/public/static/plugins/layui/layui.js"></script>
	</head>
</head>
<body>
	<!-- 头部 -->
	
	<!-- /头部 -->
	
	<!-- 主体 -->
	
<div id="LAY_app">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<!-- 头部区域 -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item layadmin-flexible" lay-unselect="">
					<a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
						<i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
					</a>
				</li>
				<li class="layui-nav-item" lay-unselect="">
					<a href="javascript:;" layadmin-event="refresh" title="刷新">
						<i class="layui-icon layui-icon-refresh-3"></i>
					</a>
				</li>
				<li class="layui-nav-item layui-hide-xs" lay-unselect="">
					<a href="javascript:;"  title="时间">香港时间: <span  id="clock">1970年01月01日 00:00:00</span></a>
				</li>
			</ul>
			<ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
				<li class="layui-nav-item layui-hide-xs" lay-unselect="">
					<a href="javascript:;" layadmin-event="fullscreen">
						<i class="layui-icon layui-icon-screen-full"></i>
					</a>
				</li>
				<li class="layui-nav-item" lay-unselect="">
					<a href="javascript:;">
						<cite><?php echo $user['name']; ?></cite>
						<span class="layui-nav-more"></span>
					</a>
					<dl class="layui-nav-child">
						<dd><a href="javascript:;" layadmin-event="changepwd">修改密码</a></dd>
						<hr>
						<dd style="text-align: center;"><a href="<?php echo url('admin/login/index'); ?>">退出</a></dd>
					</dl>
					<
				</li>

				<li class="layui-nav-item layui-hide-xs" lay-unselect="">
					<a href="javascript:;"><i class="layui-icon layui-icon-more-vertical"></i></a>
				</li>
			</ul>
		</div>
		<!-- 侧边菜单 -->
		<div class="layui-side layui-side-menu">
			<div class="layui-side-scroll">
				<div class="layui-logo" lay-href="<?php echo url('admin/index/console'); ?>">
		            <span><?php echo $site['sname']; ?></span>
		        </div>
		        <ul id="LAY-system-side-menu" class="layui-nav layui-nav-tree" lay-shrink="all" lay-filter="layadmin-system-side-menu">
		        	<?php if(is_array($navis) || $navis instanceof \think\Collection || $navis instanceof \think\Paginator): $i = 0; $__LIST__ = $navis;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$navi): $mod = ($i % 2 );++$i;?>
					<li data-name="home" class="layui-nav-item" style="">
						<?php $children = $navi['subnavis']; if(count($children) > 0): ?>
		              	<a href="javascript:;" lay-tips="<?php echo $navi['cname']; ?>" lay-direction="2">
			                <i class="layui-icon layui-icon-<?php echo $navi['icon']; ?>"></i>
			                <cite><?php echo $navi['cname']; ?></cite>
			              	<span class="layui-nav-more"></span>
		              	</a>
		              	<dl class="layui-nav-child">
		              		<?php if(is_array($children) || $children instanceof \think\Collection || $children instanceof \think\Paginator): $i = 0; $__LIST__ = $children;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subnavi): $mod = ($i % 2 );++$i;?>
			                <dd data-name="console" class="">
			                  <a lay-href="<?php echo $subnavi['url']; ?>"><?php echo $subnavi['cname']; ?></a>
			                </dd>
			                <?php endforeach; endif; else: echo "" ;endif; ?>
		              	</dl>
		              	<?php else: ?>
		              	<a href="javascript:;" lay-href="<?php echo $navi['url']; ?>" lay-tips="<?php echo $navi['cname']; ?>" lay-direction="2">
			                <i class="layui-icon layui-icon-<?php echo $navi['icon']; ?>"></i>
			                <cite><?php echo $navi['cname']; ?></cite>
		              	</a>
		              	<?php endif; ?>
		            </li>
		            <?php endforeach; endif; else: echo "" ;endif; ?>
		        </ul>
			</div>
		</div>
		<!-- 页面标签 -->
		<div id="LAY_app_tabs" class="layadmin-pagetabs">
			<div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
			<div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
			<div class="layui-icon layadmin-tabs-control layui-icon-down">
	          	<ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
		            <li class="layui-nav-item" lay-unselect="">
		              <a href="javascript:;"><span class="layui-nav-more"></span></a>
		              <dl class="layui-nav-child layui-anim-fadein">
		                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
		                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
		                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
		              </dl>
		            </li>
			        <span class="layui-nav-bar"></span>
		      	</ul>
	        </div>
	        <div class="layui-tab" lay-unauto lay-allowclose="true" lay-filter="layadmin-layout-tabs">
				<ul class="layui-tab-title" id="LAY_app_tabsheader">
	            	<li lay-id="<?php echo url('admin/index/console'); ?>" lay-attr="<?php echo url('admin/index/console'); ?>" class="layui-this" style="">
	            		<i class="layui-icon layui-icon-console"></i><i class="layui-icon layui-unselect layui-tab-close"></i></li>
	          	</ul>
			</div>
		</div>
		<!--  主体内容  -->
		<div id="LAY_app_body" class="layui-body">
			<div class="layadmin-tabsbody-item layui-show">
				<iframe class="layadmin-iframe" src="<?php echo url('admin/index/console'); ?>" frameborder="0"></iframe>
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
  }).use('index',function(){
  	var s = layui.$;
  	var currentTime = function(){
		var date = new Date();
		s('#clock').text(date.toLocaleString());
		var Timer = setTimeout(function () { 
			currentTime();
		}, 1000);
	}
	currentTime();
  });
</script>

	<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
		
	</div>
	<!-- /底部 -->
</body>
</html>
