<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:52:"D:\www\PHPTutorial\WWW\lhc/app/admin\view\pz\tm.html";i:1548236499;s:58:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\base.html";i:1548388375;s:57:"D:\www\PHPTutorial\WWW\lhc\app\admin\view\public\var.html";i:1544147308;}*/ ?>
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
.layui-input{height: 30px;width: 60px;}
.layui-card-header{border-bottom-width: 0px;}
.layui-card-header .layui-form-label{padding: 5px 15px;}
.layui-card-header .layui-form-item{margin-bottom: 0px;margin-top: 10px;}
.layui-card-header .layui-input{width: 80px;}
.layui-quote-nm{margin-bottom: 0px;padding: 0px;border-width:0px}
a.amount{text-decoration: underline;}
.btn-add{
	margin-right: -5px;
}
.btn-minus{
	margin-left: -6px;
}
.btn-add label,.btn-minus label{
	width: 110px;
	padding: 6px 10px;
	height: 38px;
	line-height: 20px;
	border-width: 1px;
	border-style: solid;
	border-radius: 2px 0 0 2px;
	text-align: center;
	background-color: #FBFBFB;
	overflow: hidden;
	box-sizing: border-box;
	border-color: #e6e6e6;
	cursor: pointer;
}
</style>


		<script type="text/javascript" src="/public/static/plugins/layui/layui.js"></script>
	</head>
</head>
<body>
	<!-- 头部 -->
	
	<!-- /头部 -->
	
	<!-- 主体 -->
	
<div class="layui-fluid" style="width: 2000px;">
	<div class="layui-card">
		<div class="layui-card-header layui-form">
			<span>特码[<?php echo Current_Kithe_Num(); ?>期]</span>
<!-- 			<div class="layui-inline"> 
				<div class="layui-form-item">
					<label class="layui-form-label">类别</label>
					<div class="layui-input-block">
					    <select name="tm2">
					        <option value="1">全部</option>
					        <option value="0">特码</option>
					    </select>
					</div>
				</div>
			</div> -->
			<div class="layui-inline" style="display: none;"> 
				<div class="layui-form-item">
					<label class="layui-form-label">盘类</label>
					<div class="layui-input-block">
					      <select name="plate">
					        <option value="">全部</option>
					        <option value="A">A盘</option>
					        <option value="B">B盘</option>
					        <option value="C">C盘</option>
					        <option value="D">D盘</option>
					      </select>
					</div>
				</div>
			</div>
<!-- 			<div class="layui-inline"> 
				<div class="layui-form-item">
					<label class="layui-form-label">风险值</label>
					<div class="layui-input-block">
						<input type="text" name="tm" value="<?php echo $adad['tm']; ?>" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div> -->
			<div class="layui-inline"> 
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 40px">退水</label>
					<div class="layui-input-block" style="margin-left: 70px;">
						<input type="text" name="ttm1" value="<?php echo $adad['tm1']; ?>" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-inline"> 
				<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-normal " lay-submit lay-filter="LAY-zoufei" style="margin-left: 10px;">确认</a>
			</div>
			<div class="layui-inline" style="float: right;"> 
				<a href="javascript:;" data-nd="<?php echo strtotime($kithe['nd']); ?>" class="endtime">距离开盘时间还有<span>0 时 00 分 00 秒</span></a>
				<a href="javascript:;" class="layui-btn layui-btn-sm layui-btn-primary" style="margin-left: 10px;">点击开盘</a>
			</div>
		</div>
		<div class="layui-card-body">
			<div class="layui-tab">
<!-- 				<ul class="layui-tab-title">
					<li class="layui-this">特码</li>
					<li onclick="location.href='/admin/pz/ztm.html'">正特</li>
					<li onclick="location.href='/admin/pz/zm.html'">正码</li>
					<li onclick="location.href='/admin/pz/zm6.html'">正码1-6</li>
					<li onclick="location.href='/admin/pz/gg.html'">过关</li>
					<li onclick="location.href='/admin/pz/lm.html'">连码</li>
					<li onclick="location.href='/admin/pz/bb.html'">半波</li>
					<li onclick="location.href='/admin/pz/bbb.html'">半半波</li>
					<li onclick="location.href='/admin/pz/zxsb.html'">正肖/七色波</li>
					<li onclick="location.href='/admin/pz/wx.html'">五行</li>
					<li onclick="location.href='/admin/pz/ts.html'">头尾数</li>
					<li onclick="location.href='/admin/pz/ztws.html'">一肖/尾数</li>
					<li onclick="location.href='/admin/pz/sx.html'">特肖合肖</li>
					<li onclick="location.href='/admin/pz/sxt.html'">生肖连</li>
					<li onclick="location.href='/admin/pz/wsl.html'">尾数连</li>
					<li onclick="location.href='/admin/pz/wbz.html'">不中</li>
					<li onclick="location.href='/admin/pz/syz.html'">中一</li>
				</ul> -->
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<form class=" layui-form">
							<input type="hidden" name="nn" value="<?php echo $kithe['nn']; ?>">
							<input type="hidden" name="dvalue" value="0.5">
<!-- 							<blockquote class="layui-elem-quote layui-quote-nm">
								<?php if(is_array($class2attr) || $class2attr instanceof \think\Collection || $class2attr instanceof \think\Paginator): $i = 0; $__LIST__ = $class2attr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
								<a href="/admin/pz/tm.html?class2=<?php echo $item['class2']; ?>" <?php if($item['class2'] == $class2): ?>class="layui-btn layui-btn-danger "<?php else: ?>class="layui-btn layui-btn-primary "<?php endif; ?> ><?php echo $item['class2']; ?></a>
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</blockquote> -->
							<div class="layui-row">
								<div class="layui-col-md3">
									<table class="layui-table">
										<thead>
											<tr>
												<th></th>
												<th>号码</th>
												<th>赔率</th>
												<th>金额</th>
												<th>预计盈利</th>
												<th>已补</th>
											</tr> 
										</thead>
										<tbody>
											<?php $__FOR_START_27915__=1;$__FOR_END_27915__=14;for($i=$__FOR_START_27915__;$i < $__FOR_END_27915__;$i+=1){ ?>
											<tr>
												<td><input type="checkbox" lay-skin="primary" lay-filter="layTableChoose" value="<?php echo $i; ?>"></td>
												<td><img src="/public/static/images/num/num<?php echo $i; ?>.gif"></td>
												<td style="line-height: 26px;">
													<input type="hidden" name="Num[<?php echo $i; ?>][class3]" value="<?php echo $list[$i-1]['class3']; ?>">
													<div class="layui-inline btn-add"><label>+</label></div>
													<div class="layui-inline">
														<input type="text" name="Num[<?php echo $i; ?>][rate]" value="<?php echo $list[$i-1]['rate']; ?>" class="layui-input input" style="float:left;">
													</div>
													<div class="layui-inline btn-minus"><label>-</label></div>
												</td>
												<td><a href="javascript:;" onclick="layui.pz.showdetail('<?php echo $list[$i-1]['class1']; ?>','<?php echo $list[$i-1]['class2']; ?>','<?php echo $list[$i-1]['class3']; ?>')" class="amount"><?php echo $list[$i-1]['sum_m']; ?>/<?php echo $list[$i-1]['sum_mzc']; ?></a></td>
												<td><?php echo $list[$i-1]['sum_m3']; ?></td>
												<td><?php echo $list[$i-1]['sum_bl']; ?></td>
											</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
								<div class="layui-col-md3">
									<table class="layui-table">
										<thead>
											<tr>
												<th></th>
												<th>号码</th>
												<th>赔率</th>
												<th>金额</th>
												<th>预计盈利</th>
												<th>已补</th>
											</tr> 
										</thead>
										<tbody>
											<?php $__FOR_START_31042__=14;$__FOR_END_31042__=27;for($i=$__FOR_START_31042__;$i < $__FOR_END_31042__;$i+=1){ ?>
											<tr>
												<td><input type="checkbox" lay-skin="primary" lay-filter="layTableChoose"  value="<?php echo $i; ?>"></td>
												<td><img src="/public/static/images/num/num<?php echo $i; ?>.gif"></td>
												<td style="line-height: 26px;">
													<input type="hidden" name="Num[<?php echo $i; ?>][class3]" value="<?php echo $list[$i-1]['class3']; ?>">
													<div class="layui-inline btn-add"><label>+</label></div>
													<div class="layui-inline">
														<input type="text" name="Num[<?php echo $i; ?>][rate]" value="<?php echo $list[$i-1]['rate']; ?>" class="layui-input input" style="float:left;">
													</div>
													<div class="layui-inline btn-minus"><label>-</label></div>
												</td>
												<td><a href="javascript:;" onclick="layui.pz.showdetail('<?php echo $list[$i-1]['class1']; ?>','<?php echo $list[$i-1]['class2']; ?>','<?php echo $list[$i-1]['class3']; ?>')" class="amount"><?php echo $list[$i-1]['sum_m']; ?>/<?php echo $list[$i-1]['sum_mzc']; ?></a></td>
												<td>0</td>
												<td>0</td>
											</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
								<div class="layui-col-md3">
									<table class="layui-table">
										<thead>
											<tr>
												<th></th>
												<th>号码</th>
												<th>赔率</th>
												<th>金额</th>
												<th>预计盈利</th>
												<th>已补</th>
											</tr> 
										</thead>
										<tbody>
											<?php $__FOR_START_21303__=27;$__FOR_END_21303__=40;for($i=$__FOR_START_21303__;$i < $__FOR_END_21303__;$i+=1){ ?>
											<tr>
												<td><input type="checkbox" lay-skin="primary" lay-filter="layTableChoose"  value="<?php echo $i; ?>"></td>
												<td><img src="/public/static/images/num/num<?php echo $i; ?>.gif"></td>
												<td style="line-height: 26px;">
													<input type="hidden" name="Num[<?php echo $i; ?>][class3]" value="<?php echo $list[$i-1]['class3']; ?>">
													<div class="layui-inline btn-add"><label>+</label></div>
													<div class="layui-inline">
														<input type="text" name="Num[<?php echo $i; ?>][rate]" value="<?php echo $list[$i-1]['rate']; ?>" class="layui-input input" style="float:left;">
													</div>
													<div class="layui-inline btn-minus"><label>-</label></div>
												</td>
												<td><a href="javascript:;" onclick="layui.pz.showdetail('<?php echo $list[$i-1]['class1']; ?>','<?php echo $list[$i-1]['class2']; ?>','<?php echo $list[$i-1]['class3']; ?>')" class="amount"><?php echo $list[$i-1]['sum_m']; ?>/<?php echo $list[$i-1]['sum_mzc']; ?></a></td>
												<td>0</td>
												<td>0</td>
											</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
								<div class="layui-col-md3">
									<table class="layui-table">
										<thead>
											<tr>
												<th></th>
												<th>号码</th>
												<th>赔率</th>
												<th>金额</th>
												<th>预计盈利</th>
												<th>已补</th>
											</tr> 
										</thead>
										<tbody>
											<?php $__FOR_START_6515__=40;$__FOR_END_6515__=50;for($i=$__FOR_START_6515__;$i < $__FOR_END_6515__;$i+=1){ ?>
											<tr>
												<td><input type="checkbox" lay-skin="primary" lay-filter="layTableChoose"  value="<?php echo $i; ?>"></td>
												<td><img src="/public/static/images/num/num<?php echo $i; ?>.gif"></td>
												<td style="line-height: 26px;">
													<input type="hidden" name="Num[<?php echo $i; ?>][class3]" value="<?php echo $list[$i-1]['class3']; ?>">
													<div class="layui-inline btn-add"><label>+</label></div>
													<div class="layui-inline">
														<input type="text" name="Num[<?php echo $i; ?>][rate]" value="<?php echo $list[$i-1]['rate']; ?>" class="layui-input input" style="float:left;">
													</div>
													<div class="layui-inline btn-minus"><label>-</label></div>
												</td>
												<td><a href="javascript:;" onclick="layui.pz.showdetail('<?php echo $list[$i-1]['class1']; ?>','<?php echo $list[$i-1]['class2']; ?>','<?php echo $list[$i-1]['class3']; ?>')" class="amount"><?php echo $list[$i-1]['sum_m']; ?>/<?php echo $list[$i-1]['sum_mzc']; ?></a></td>
												<td>0</td>
												<td>0</td>
											</tr>
											<?php } ?>
											<tr rowspan='2' style="height: 98px;text-align: center;">
												<td colspan="4">
													<a href="javascript:;" class="layui-btn layui-btn-radius layui-btn-sm" lay-submit lay-filter="batch-submit">补货</a>
													<button type="reset" class="layui-btn layui-btn-primary layui-btn-radius layui-btn-sm">重置</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="layui-row">
								<div class="layui-col-md3">
									<table class="layui-table">
										<thead>
											<tr>
												<th>号码</th>
												<th>赔率</th>
												<th>总额</th>
												<th>预计盈利</th>
												<th>已补</th>
											</tr> 
										</thead>
										<tbody>
											<?php $__FOR_START_4409__=50;$__FOR_END_4409__=55;for($i=$__FOR_START_4409__;$i < $__FOR_END_4409__;$i+=1){ ?>
											<tr>
												<td><?php echo $list[$i-1]['class3']; ?></td>
												<td style="line-height: 26px;">
													<input type="hidden" name="Num[<?php echo $i; ?>][class3]" value="<?php echo $list[$i-1]['class3']; ?>">
													<div class="layui-inline btn-add"><label>+</label></div>
													<div class="layui-inline">
														<input type="text" name="Num[<?php echo $i; ?>][rate]" value="<?php echo $list[$i-1]['rate']; ?>" class="layui-input input" style="float:left;">
													</div>
													<div class="layui-inline btn-minus"><label>-</label></div>
												</td>
												<td><a href="javascript:;" onclick="layui.pz.showdetail('<?php echo $list[$i-1]['class1']; ?>','<?php echo $list[$i-1]['class2']; ?>','<?php echo $list[$i-1]['class3']; ?>')" class="amount"><?php echo $list[$i-1]['sum_m']; ?>/<?php echo $list[$i-1]['sum_mzc']; ?></a></td>
												<td>0</td>
												<td>0</td>
											</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
								<div class="layui-col-md3">
									<table class="layui-table">
										<thead>
											<tr>
												<th>号码</th>
												<th>赔率</th>
												<th>总额</th>
												<th>预计盈利</th>
												<th>已补</th>
											</tr> 
										</thead>
										<tbody>
											<?php $__FOR_START_18480__=55;$__FOR_END_18480__=60;for($i=$__FOR_START_18480__;$i < $__FOR_END_18480__;$i+=1){ ?>
											<tr>
												<td><?php echo $list[$i-1]['class3']; ?></td>
												<td style="line-height: 26px;">
													<input type="hidden" name="Num[<?php echo $i; ?>][class3]" value="<?php echo $list[$i-1]['class3']; ?>">
													<div class="layui-inline btn-add"><label>+</label></div>
													<div class="layui-inline">
														<input type="text" name="Num[<?php echo $i; ?>][rate]" value="<?php echo $list[$i-1]['rate']; ?>" class="layui-input input" style="float:left;">
													</div>
													<div class="layui-inline btn-minus"><label>-</label></div>
												</td>
												<td><a href="javascript:;" onclick="layui.pz.showdetail('<?php echo $list[$i-1]['class1']; ?>','<?php echo $list[$i-1]['class2']; ?>','<?php echo $list[$i-1]['class3']; ?>')" class="amount"><?php echo $list[$i-1]['sum_m']; ?>/<?php echo $list[$i-1]['sum_mzc']; ?></a></td>
												<td>0</td>
												<td>0</td>
											</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
								<div class="layui-col-md3">
									<table class="layui-table">
										<thead>
											<tr>
												<th>号码</th>
												<th>赔率</th>
												<th>总额</th>
												<th>预计盈利</th>
												<th>已补</th>
											</tr> 
										</thead>
										<tbody>
											<?php $__FOR_START_25683__=60;$__FOR_END_25683__=65;for($i=$__FOR_START_25683__;$i < $__FOR_END_25683__;$i+=1){ ?>
											<tr>
												<td><?php echo $list[$i-1]['class3']; ?></td>
												<td style="line-height: 26px;">
													<input type="hidden" name="Num[<?php echo $i; ?>][class3]" value="<?php echo $list[$i-1]['class3']; ?>">
													<div class="layui-inline btn-add"><label>+</label></div>
													<div class="layui-inline">
														<input type="text" name="Num[<?php echo $i; ?>][rate]" value="<?php echo $list[$i-1]['rate']; ?>" class="layui-input input" style="float:left;">
													</div>
													<div class="layui-inline btn-minus"><label>-</label></div>
												</td>
												<td><a href="javascript:;" onclick="layui.pz.showdetail('<?php echo $list[$i-1]['class1']; ?>','<?php echo $list[$i-1]['class2']; ?>','<?php echo $list[$i-1]['class3']; ?>')" class="amount"><?php echo $list[$i-1]['sum_m']; ?>/<?php echo $list[$i-1]['sum_mzc']; ?></a></td>
												<td>0</td>
												<td>0</td>
											</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
								<div class="layui-col-md3">
									<table class="layui-table">
										<thead>
											<tr>
												<th>号码</th>
												<th>赔率</th>
												<th>总额</th>
												<th>预计盈利</th>
												<th>已补</th>
											</tr> 
										</thead>
										<tbody>
											<?php $__FOR_START_2338__=65;$__FOR_END_2338__=67;for($i=$__FOR_START_2338__;$i < $__FOR_END_2338__;$i+=1){ ?>
											<tr>
												<td><?php echo $list[$i-1]['class3']; ?></td>
												<td style="line-height: 26px;">
													<input type="hidden" name="Num[<?php echo $i; ?>][class3]" value="<?php echo $list[$i-1]['class3']; ?>">
													<div class="layui-inline btn-add"><label>+</label></div>
													<div class="layui-inline">
														<input type="text" name="Num[<?php echo $i; ?>][rate]" value="<?php echo $list[$i-1]['rate']; ?>" class="layui-input input" style="float:left;">
													</div>
													<div class="layui-inline btn-minus"><label>-</label></div>
												</td>
												<td><a href="javascript:;" onclick="layui.pz.showdetail('<?php echo $list[$i-1]['class1']; ?>','<?php echo $list[$i-1]['class2']; ?>','<?php echo $list[$i-1]['class3']; ?>')" class="amount"><?php echo $list[$i-1]['sum_m']; ?>/<?php echo $list[$i-1]['sum_mzc']; ?></a></td>
												<td>0</td>
												<td>0</td>
											</tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
							</div>
						</form>
						<div class="layui-row">
							<form class=" layui-form">
								<input type="hidden" name="class2" value="<?php echo $class2; ?>">
								<table class="layui-table batch_table">
									<tbody>
										<tr>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(1); ?>" title="鼠" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(7); ?>" title="牛" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(2); ?>" title="虎" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(8); ?>" title="兔" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(3); ?>" title="龙" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(9); ?>" title="蛇" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(4); ?>" title="马" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(10); ?>" title="羊" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(5); ?>" title="猴" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(11); ?>" title="鸡" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(6); ?>" title="狗" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(12); ?>" title="猪" lay-skin="primary"></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(13); ?>" title="红单" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(14); ?>" title="红双" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(15); ?>" title="红大" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(16); ?>" title="红小" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(21); ?>" title="蓝单" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(22); ?>" title="蓝双" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(23); ?>" title="蓝大" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(24); ?>" title="蓝小" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(17); ?>" title="绿单" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(18); ?>" title="绿双" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(19); ?>" title="绿大" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(20); ?>" title="绿小" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(16); ?>,<?php echo kasxnumberbyid(15); ?>" title="红波" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(24); ?>,<?php echo kasxnumberbyid(23); ?>" title="蓝波" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="<?php echo kasxnumberbyid(20); ?>,<?php echo kasxnumberbyid(19); ?>" title="绿波" lay-skin="primary"></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="mf[]" value="1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,49" title="单号" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48" title="双号" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]"  value="25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49"title="大号" lay-skin="primary"></td>
											<td><input type="checkbox" name="mf[]" value="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" title="小号" lay-skin="primary"></td>
											<td><input type="checkbox"  title="合单" lay-skin="primary" name="mf[]" value="1,3,5,7,9,10,12,14,16,18,21,23,25,27,29,30,32,34,36,38,41,43,45,47,49"></td>
											<td><input type="checkbox" name="mf[]" title="合双" lay-skin="primary"  value="2,4,6,8,11,13,15,17,19,20,22,24,26,28,31,33,35,37,39,40,42,44,46,48"></td>
											<td></td>
											<td><input type="checkbox" name="mf[]" title="0头" lay-skin="primary"  value="1,2,3,4,5,6,7,8,9"></td>
											<td><input type="checkbox" name="mf[]" title="1头" lay-skin="primary" value="10,11,12,13,14,15,16,17,18,19"></td>
											<td><input type="checkbox" name="mf[]" title="2头" lay-skin="primary" value="20,21,22,23,24,25,26,27,28,29"></td>
											<td><input type="checkbox" name="mf[]" title="3头" lay-skin="primary"  value="30,31,32,33,34,35,36,37,38,39"></td>
											<td><input type="checkbox" name="mf[]" title="4头" lay-skin="primary" value="40,41,42,43,44,45,46,47,48,49"></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="mf[]" title="0尾" lay-skin="primary" value="10,20,30,40"></td>
											<td><input type="checkbox" name="mf[]" title="1尾" lay-skin="primary" value="1,11,21,31,41"></td>
											<td><input type="checkbox" name="mf[]" title="2尾" lay-skin="primary"  value="2,12,22,32,42"></td>
											<td><input type="checkbox" name="mf[]" title="3尾" lay-skin="primary" value="3,13,23,33,43"></td>
											<td><input type="checkbox" name="mf[]" title="4尾" lay-skin="primary" value="4,14,24,34,44"></td>
											<td><input type="checkbox" name="mf[]" title="5尾" lay-skin="primary" value="5,15,25,35,45"></td>
											<td><input type="checkbox" name="mf[]" title="6尾" lay-skin="primary"  value="6,16,26,36,46"></td>
											<td><input type="checkbox" name="mf[]" title="7尾" lay-skin="primary" value="7,17,27,37,47"></td>
											<td><input type="checkbox" name="mf[]" title="8尾" lay-skin="primary" value="8,18,28,38,48"></td>
											<td><input type="checkbox" name="mf[]" title="9尾" lay-skin="primary" value="9,19,29,39,49"></td>
											<td></td>
											<td colspan="4">
												<div class="layui-inline">
													<input type="radio" name="mv" value="0" title="减" checked>
													<input type="radio" name="mv" value="1" title="加">
												</div>
												<div class="layui-inline">
													<input type="text" name="value" value="0.5" autocomplete="off" class="layui-input">
												</div>
												<a href="javascript:;" class="layui-btn layui-btn-radius layui-btn-normal layui-btn-xs" lay-submit lay-filter="batch-adjust">送出</a>
											</td>
										</tr>
										<tr>
											<td colspan="15">
												<label class="layui-form-label">统一修改</label>
												<input type="radio" name="dx" value="单" title="单" checked="">
												<input type="radio" name="dx" value="双" title="双">
												<input type="radio" name="dx" value="大" title="大">
												<input type="radio" name="dx" value="小" title="小">
												<input type="radio" name="dx" value="红波" title="红波">
												<input type="radio" name="dx" value="绿波" title="绿波">
												<input type="radio" name="dx" value="蓝波" title="蓝波">
												<input type="radio" name="dx" value="全部" title="全部">
												<div class="layui-inline">
													<label class="layui-form-label">赔率</label>
													<input type="text" name="bl" value="0" autocomplete="off" class="layui-input" style="margin-top: 3px;">
												</div>
												<a href="javascript:;" class="layui-btn layui-btn-radius layui-btn-normal layui-btn-xs btn-batch-set" lay-submit lay-filter="batch-set">送出</a>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
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
    ,version: '20181201'
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'pz']);
</script>

	<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
		
	</div>
	<!-- /底部 -->
</body>
</html>
