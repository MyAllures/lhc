<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:56:"D:\www\PHPTutorial\WWW\lhc/app/users\view\jszd\look.html";i:1547799013;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>下注明细</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="/file/admin/layuis/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/file/admin/layuis/style/admin.css" media="all">
    <link rel="stylesheet" href="/file/admin/layui/bootstrap/css/bootstrap.min.css">
    <script src="/file/admin/layui/jquery.min.js"></script>
    <script src="/file/admin/layui/base.js"></script>
    <script src="/file/admin/layuis/layui/layui.js"></script>
    <style>
        .layui-table td, .layui-table th {
            position: relative;
            padding: 9px 15px;
            min-height: 20px;
            line-height: 20px;
            font-size: 14px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">
                    [<?php if($class1 == '特码' or $class1 == '正码'): ?><?php echo $class1; ?>：<?php echo $class3; else: ?><?php echo $class1; ?>：<?php echo \think\Request::instance()->get('class2')?\think\Request::instance()->get('class2') : ''; ?>：<?php echo $class3; endif; ?>]下注明细
                    <div class="layui-btn-group" style="float:right;">
                        <a class="layui-btn layui-btn-primary layui-btn-sm" href="javascript:history.back();">返回</a>
                        <a class="layui-btn layui-btn-primary layui-btn-sm" href="javascript:location.reload();">刷新</a>
                    </div>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>订单号</th>
                            <th>下单时间</th>
                            <th>期数</th>
                            <th>会员</th>
                            <th>下注总额</th>
                            <th>赔率</th>
                            <th>佣金</th>
                            <th>代%</th>
                            <?php if($data['lx'] != 2): ?><th>总%</th><?php endif; if($data['lx'] != 1): ?>
                            <th>股%</th>
                            <?php if($data['lx'] != 4): ?><th>大股%</th><?php endif; ?>
                            <th>公%</th>
                            <?php endif; ?>
                        </tr>

                        </thead>
                        <tbody>
                        <?php if(empty($res)): ?>
                        <tr><td colspan="<?php if($data['lx'] == 1 or $data['lx'] == 4): ?>13<?php elseif($data['lx'] == 2): ?>11<?php else: ?>10<?php endif; ?>">暂无数据</td></tr>
                        <?php else: if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$r): ?>
                        <tr>
                            <td><?php echo $r['id']; ?></td>
                            <td><?php echo $r['num']; ?></td>
                            <td><?php echo $r['adddate']; ?></td>
                            <td><?php echo $r['kithe']; ?></td>
                            <td><?php echo $r['username']; ?>.<?php echo $r['abcd']; ?>.<?php echo abs($r['user_ds']); ?></td>
                            <td><?php echo $r['sum_m']; ?></td>
                            <td><?php echo $r['rate']; ?></td>
                            <td><?php echo $r['sum_m']*$r['user_ds']/100; ?></td>
                            <td><?php echo $r['dai_zc']*10; ?></td>
                            <?php if($data['lx'] != 2): ?><td><?php echo $r['zong_zc']*10; ?></td><?php endif; if($data['lx'] != 1): ?>
                            <td><?php echo $r['guan_zc']*10; ?></td>
                            <?php if($data['lx'] != 4): ?> <td><?php echo $r['guan1_zc']*10; ?></td><?php endif; ?>
                            <td><?php echo !empty($r['dugu_zc'])?$r['dugu_zc']*10 : 0; ?></td>
                            <?php endif; ?>
                        </tr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>总计</td>
                            <td><?php echo $sum_m; ?></td>
                            <td></td>
                            <td><?php echo $user_ds; ?></td>
                            <td></td>
                            <?php if($data['lx'] != 2): ?><th></th><?php endif; if($data['lx'] != 1): ?>
                            <td> </td>
                            <td> </td>
                            <?php endif; ?>
                        </tr>
                        <tr align="center"><td colspan="<?php if($data['lx'] == 1 or $data['lx'] == 4): ?>13<?php elseif($data['lx'] == 2): ?>11<?php else: ?>10<?php endif; ?>"><?php echo $page; ?></td></tr>
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