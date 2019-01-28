<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:65:"D:\www\PHPTutorial\WWW\lhc/app/index\view\bets_details\index.html";i:1547370396;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>下注明细</title>
    <link rel="stylesheet" href="/file/admin/layui/css/layui.css">
    <link rel="stylesheet" href="/file/admin/layui/bootstrap/css/bootstrap.min.css">
    <script src="/file/admin/layui/layui.js"></script>
</head>
<body style="background-color: #f2f2f2;!important;">
<div class="layui-fluid">
    <div class="layui-row" style="background-color: #fff;">
        <div class="layui-col-xs12">
            <div class="layui-crad">
                <div class="layui-card-header">
                    下注状况
                    <div style="float: right;">
                        <a href="javascript:location.reload();" class="layui-btn layui-btn-primary layui-btn-sm">刷新</a>
                    </div>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>下注时间</th>
                            <th>期数</th>
                            <th>类型</th>
                            <th>内容</th>
                            <th>赔率</th>
                            <th>金额</th>
                            <th>佣金</th>
                            <th>可蠃金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if($result): if(is_array($result) || $result instanceof \think\Collection || $result instanceof \think\Paginator): if( count($result)==0 ) : echo "" ;else: foreach($result as $key=>$r): ?>
                        <tr>
                            <td><?php echo $r['id']; ?></td>
                            <td><?php echo $r['adddate']; ?></td>
                            <td><?php echo $r['kithe']; ?>期</td>
                            <td><?php echo $r['class1']; ?></td>
                            <td>
                                <?php if($r['class1'] == '过关'): if(is_array($r['td5']) || $r['td5'] instanceof \think\Collection || $r['td5'] instanceof \think\Paginator): if( count($r['td5'])==0 ) : echo "" ;else: foreach($r['td5'] as $key=>$v): ?>
                                    <?php echo $v; ?><br>
                                    <?php endforeach; endif; else: echo "" ;endif; else: ?>
                                    <span style="color:#ff0000;"><?php echo $r['class2']; ?>：</span><span style="color:#ff6600;"><?php echo $r['class3']; ?></span>
                                <?php endif; ?>
                            </td>
                            <td><?php echo $r['rate']; ?></td>
                            <td><?php echo $r['sum_m']; ?></td>
                            <td><?php echo round($r['sum_m']*$r['user_ds']/100,2); ?></td>
                            <td><?php echo round($r['sum_m']*$r['rate']+$r['sum_m']*$r['user_ds']/100-$r['sum_m'],2); ?></td>
                        </tr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>小计</td>
                            <td>共下注《<?php echo $tj['z_re']; ?>》笔</td>
                            <td></td>
                            <td><?php echo round($tj['z_sum'],2); ?></td>
                            <td><?php echo round($tj['z_userds'],2); ?></td>
                            <td><?php echo round($tj['z_user'],2); ?></td>
                        </tr>
                        <tr>
                            <td colspan="9" align="center"><?php echo $page; ?></td>
                        </tr>
                        <?php else: ?>
                        <tr><td colspan="9" align="center">暂无数据</td></tr>
                        <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>