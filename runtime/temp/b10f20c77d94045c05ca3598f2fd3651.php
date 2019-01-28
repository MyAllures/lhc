<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:61:"D:\www\PHPTutorial\WWW\lhc/app/admin\view\setting\number.html";i:1544687318;s:58:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\base.html";i:1548388375;s:57:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\var.html";i:1544147308;}*/ ?>
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
#wxqrcode{   border: 1px solid #D2D2D2;width: 128px;}
</style>


		<script type="text/javascript" src="/public/static/plugins/layui/layui.js"></script>
	</head>
</head>
<body>
	<!-- 头部 -->
	
	<!-- /头部 -->
	
	<!-- 主体 -->
	
<div class="layui-fluid">
	<form class="layui-form">
		<div class="layui-card">
			<div class="layui-card-header">生肖设置</div>
			<div class="layui-card-body">
				<div class="layui-row">
					<div class="layui-col-md3">
						<div class="layui-form-item">
							<label class="layui-form-label">鼠</label>
							<div class="layui-input-block">
								<input type="text" name="number[rat]" value="<?php echo $number['rat']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">牛</label>
							<div class="layui-input-block">
								<input type="text" name="number[cow]" value="<?php echo $number['cow']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">虎</label>
							<div class="layui-input-block">
								<input type="text" name="number[tiger]" value="<?php echo $number['tiger']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md3">
						<div class="layui-form-item">
							<label class="layui-form-label">兔</label>
							<div class="layui-input-block">
								<input type="text" name="number[rabbit]" value="<?php echo $number['rabbit']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">龙</label>
							<div class="layui-input-block">
								<input type="text" name="number[dragon]" value="<?php echo $number['dragon']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蛇</label>
							<div class="layui-input-block">
								<input type="text" name="number[snake]" value="<?php echo $number['snake']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md3">
						<div class="layui-form-item">
							<label class="layui-form-label">马</label>
							<div class="layui-input-block">
								<input type="text" name="number[horse]" value="<?php echo $number['horse']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>  <div class="layui-form-item">
							<label class="layui-form-label">羊</label>
							<div class="layui-input-block">
								<input type="text" name="number[sheep]" value="<?php echo $number['sheep']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">猴</label>
							<div class="layui-input-block">
								<input type="text" name="number[monkey]" value="<?php echo $number['monkey']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md3">
						<div class="layui-form-item">
							<label class="layui-form-label">鸡</label>
							<div class="layui-input-block">
								<input type="text" name="number[chicken]" value="<?php echo $number['chicken']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">狗</label>
							<div class="layui-input-block">
								<input type="text" name="number[dog]" value="<?php echo $number['dog']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">猪</label>
							<div class="layui-input-block">
								<input type="text" name="number[pig]" value="<?php echo $number['pig']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-card">
			<div class="layui-card-header">波段设置</div>
			<div class="layui-card-body">
				<div class="layui-row">
					<div class="layui-col-md4">
						<div class="layui-form-item">
							<label class="layui-form-label">红波</label>
							<div class="layui-input-block">
								<input type="text" name="number[red]" value="<?php echo $number['red']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">红单</label>
							<div class="layui-input-block">
								<input type="text" name="number[red_single]" value="<?php echo $number['red_single']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">红双</label>
							<div class="layui-input-block">
								<input type="text" name="number[red_double]" value="<?php echo $number['red_double']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">红大</label>
							<div class="layui-input-block">
								<input type="text" name="number[red_big]" value="<?php echo $number['red_big']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">红小</label>
							<div class="layui-input-block">
								<input type="text" name="number[red_small]" value="<?php echo $number['red_small']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">红合单</label>
							<div class="layui-input-block">
								<input type="text" name="number[red_whole_single]" value="<?php echo $number['red_whole_single']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">红合双</label>
							<div class="layui-input-block">
								<input type="text" name="number[red_whole_double]" value="<?php echo $number['red_whole_double']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">红大单</label>
							<div class="layui-input-block">
								<input type="text" name="number[red_big_single]" value="<?php echo $number['red_big_single']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">红大双</label>
							<div class="layui-input-block">
								<input type="text" name="number[red_big_double]" value="<?php echo $number['red_big_double']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">红小单</label>
							<div class="layui-input-block">
								<input type="text" name="number[red_small_single]" value="<?php echo $number['red_small_single']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">红小双</label>
							<div class="layui-input-block">
								<input type="text" name="number[red_small_double]" value="<?php echo $number['red_small_double']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-form-item">
							<label class="layui-form-label">蓝波</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue]" value="<?php echo $number['blue']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蓝单</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue_single]" value="<?php echo $number['blue_single']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蓝双</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue_double]" value="<?php echo $number['blue_double']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蓝大</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue_big]" value="<?php echo $number['blue_big']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蓝小</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue_small]" value="<?php echo $number['blue_small']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蓝合单</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue_whole_single]" value="<?php echo $number['blue_whole_single']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蓝合双</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue_whole_double]"  value="<?php echo $number['blue_whole_double']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蓝大单</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue_big_single]" value="<?php echo $number['blue_big_single']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蓝大双</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue_big_double]"  value="<?php echo $number['blue_big_double']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蓝小单</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue_small_single]" value="<?php echo $number['blue_small_single']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">蓝小双</label>
							<div class="layui-input-block">
								<input type="text" name="number[blue_small_double]" value="<?php echo $number['blue_small_double']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-form-item">
							<label class="layui-form-label">绿波</label>
							<div class="layui-input-block">
								<input type="text" name="number[green]" value="<?php echo $number['green']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">绿单</label>
							<div class="layui-input-block">
								<input type="text" name="number[green_single]" value="<?php echo $number['green_single']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">绿双</label>
							<div class="layui-input-block">
								<input type="text" name="number[green_double]" value="<?php echo $number['green_double']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">绿大</label>
							<div class="layui-input-block">
								<input type="text" name="number[green_big]" value="<?php echo $number['green_big']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">绿小</label>
							<div class="layui-input-block">
								<input type="text" name="number[green_small]"  value="<?php echo $number['green_small']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">绿合单</label>
							<div class="layui-input-block">
								<input type="text" name="number[green_whole_single]"  value="<?php echo $number['green_whole_single']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">绿合双</label>
							<div class="layui-input-block">
								<input type="text" name="number[green_whole_double]" value="<?php echo $number['green_whole_double']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">绿大单</label>
							<div class="layui-input-block">
								<input type="text" name="number[green_big_single]"  value="<?php echo $number['green_big_single']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">绿大双</label>
							<div class="layui-input-block">
								<input type="text" name="number[green_big_double]" value="<?php echo $number['green_big_double']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">绿小单</label>
							<div class="layui-input-block">
								<input type="text" name="number[green_small_single]" value="<?php echo $number['green_small_single']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">绿小双</label>
							<div class="layui-input-block">
								<input type="text" name="number[green_small_double]" value="<?php echo $number['green_small_double']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-card">
			<div class="layui-card-header">五行设置</div>
			<div class="layui-card-body">
				<div class="layui-row">
					<div class="layui-col-md4">
						<div class="layui-form-item">
							<label class="layui-form-label">金</label>
							<div class="layui-input-block">
								<input type="text" name="number[metal]" value="<?php echo $number['metal']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-form-item">
							<label class="layui-form-label">木</label>
							<div class="layui-input-block">
								<input type="text" name="number[wood]" value="<?php echo $number['wood']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-form-item">
							<label class="layui-form-label">水</label>
							<div class="layui-input-block">
								<input type="text" name="number[water]" value="<?php echo $number['water']; ?>"   lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-form-item">
							<label class="layui-form-label">火</label>
							<div class="layui-input-block">
								<input type="text" name="number[fire]" value="<?php echo $number['fire']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="layui-form-item">
							<label class="layui-form-label">土</label>
							<div class="layui-input-block">
								<input type="text" name="number[earth]" value="<?php echo $number['earth']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-card">
			<div class="layui-card-header">尾数设置</div>
			<div class="layui-card-body">
				<div class="layui-row">
					<div class="layui-col-md2">
						<div class="layui-form-item">
							<label class="layui-form-label">1</label>
							<div class="layui-input-block">
								<input type="text" name="number[1]" value="<?php echo $number['1']; ?>"   autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">6</label>
							<div class="layui-input-block">
								<input type="text" name="number[6]"  value="<?php echo $number['6']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md2">
						<div class="layui-form-item">
							<label class="layui-form-label">2</label>
							<div class="layui-input-block">
								<input type="text" name="number[2]" value="<?php echo $number['2']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">7</label>
							<div class="layui-input-block">
								<input type="text" name="number[7]"  value="<?php echo $number['7']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md2">
						<div class="layui-form-item">
							<label class="layui-form-label">3</label>
							<div class="layui-input-block">
								<input type="text" name="number[3]" value="<?php echo $number['3']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">8</label>
							<div class="layui-input-block">
								<input type="text" name="number[8]" value="<?php echo $number['8']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md2">
						<div class="layui-form-item">
							<label class="layui-form-label">4</label>
							<div class="layui-input-block">
								<input type="text" name="number[4]"  value="<?php echo $number['4']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">9</label>
							<div class="layui-input-block">
								<input type="text" name="number[9]" value="<?php echo $number['9']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md2">
						<div class="layui-form-item">
							<label class="layui-form-label">5</label>
							<div class="layui-input-block">
								<input type="text" name="number[5]" value="<?php echo $number['5']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">0</label>
							<div class="layui-input-block">
								<input type="text" name="number[0]" value="<?php echo $number['0']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-card">
			<div class="layui-card-header">大小单双</div>
			<div class="layui-card-body">
				<div class="layui-row">
					<div class="layui-col-md6">
						<div class="layui-form-item">
							<label class="layui-form-label">大单</label>
							<div class="layui-input-block">
								<input type="text" name="number[big_single]" value="<?php echo $number['big_single']; ?>"   lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">大双</label>
							<div class="layui-input-block">
								<input type="text" name="number[big_double]" value="<?php echo $number['big_double']; ?>" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-col-md6">
						<div class="layui-form-item">
							<label class="layui-form-label">小单</label>
							<div class="layui-input-block">
								<input type="text" name="number[small_single]" value="<?php echo $number['small_single']; ?>"  lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">小双</label>
							<div class="layui-input-block">
								<input type="text" name="number[small_double]" value="<?php echo $number['small_double']; ?>"   lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item layui-layout-admin">
			<div class="layui-input-block">
				<div class="layui-footer" style="left: 0;">
					<button class="layui-btn" lay-submit lay-filter="LAY-number-edit">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</div>
	</form>
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
}).use(['index', 'setting']);
</script>

	<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
		
	</div>
	<!-- /底部 -->
</body>
</html>
