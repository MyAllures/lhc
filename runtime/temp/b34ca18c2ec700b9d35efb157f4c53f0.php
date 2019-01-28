<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:62:"D:\www\PHPTutorial\WWW\lhc/app/index\view\bets\kbb_submit.html";i:1548640132;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>确认订单</title>
    <link rel="stylesheet" href="/file/admin/layui/css/layui.css" type="text/css">
    <script src="/file/lhc_images/jquery.min.js"></script>
    <script src="/file/admin/layui/layui.js"></script>
    <style>
        .layui-table td, .layui-table th{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <form action="<?php echo url('saveKbb'); ?>" method="post" name="form1" id="form1">
                <input type="hidden" name="class2" value="<?php echo $class2; ?>">
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th colspan="4">确认注单</th>
                    </tr>
                    <tr>
                        <th>内容</th>
                        <th>赔率</th>
                        <th>下注金额</th>
                        <th>可赢金额</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $__FOR_START_16615__=1;$__FOR_END_16615__=$numm;for($i=$__FOR_START_16615__;$i < $__FOR_END_16615__;$i+=1){ ?>
                    <input name="Num_<?php echo $i; ?>" type="hidden" value="<?php echo $res[$i]['num']; ?>" />
                    <?php if($res[$i]['num'] !=  ''): ?>
                    <tr>
                        <td><span style="color: #ff0000;"><?php echo $res[$i]['class2']; ?>：</span><span style="color: #ff6600;"><?php echo $res[$i]['class3']; ?></span></td>
                        <td><?php echo $res[$i]['rate']; ?></td>
                        <td><?php echo $res[$i]['num']; ?></td>
                        <td><?php echo $res[$i]['num']*$res[$i]['rate']-$res[$i]['num']; ?></td>
                    </tr>
                    <?php endif; } ?>
                    <tr>
                        <td colspan="2" align="center">下注总额</td>
                        <td><?php echo $total; ?></td>
                        <td></td>
                    </tr>
                    <tr>
                        <input type="hidden" name="from_url" value="<?php echo $url; ?>">
                        <td colspan="4" align="center">
                            <button class="layui-btn layui-btn-sm layui-btn-primary ret" type="reset">取消</button>
                            <button class="layui-btn layui-btn-sm" type="submit">送出</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    layui.use(['layer'],function () {
        var layer=layui.layer;
        $('.ret').click(function () {
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
            window.parent.location.reload();
        });
    })
</script>