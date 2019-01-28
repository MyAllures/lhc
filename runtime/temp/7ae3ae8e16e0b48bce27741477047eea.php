<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:64:"D:\www\PHPTutorial\WWW\lhc/app/index\view\bets_wbz\save_wbz.html";i:1546996658;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo $rtype; ?>确认订单</title>
    <link rel="stylesheet" href="/file/admin/layui/css/layui.css" type="text/css">
    <script src="/file/lhc_images/jquery.min.js"></script>
    <script src="/file/admin/layui/layui.js"></script>
    <style>
        .layui-table td, .layui-table th{
            text-align: center;
        }
    </style>
</head>
<body style="background-color: #fff;">
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <form action="<?php echo url('tanWbz'); ?>" method="post" name="form1" id="form1" >
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th colspan="2">确认注单</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>账号名称</td>
                        <td><?php echo $mem['kauser']; ?></td>
                    </tr>
                    <tr>
                        <td>会员类型</td>
                        <td><?php echo $mem['abcd']; ?>盘</td>
                    </tr>
                    <tr>
                        <td>总信用额</td>
                        <td><?php echo $mem['cs']; ?>元</td>
                    </tr>
                    <tr>
                        <td>可用余额</td>
                        <td><?php echo $mem['ts']; ?>元</td>
                    </tr>
                    <tr>
                        <td>最低限额</td>
                        <td><?php echo $mem['xy']; ?>元</td>
                    </tr>
                    <tr>
                        <td>下注总额</td>
                        <td><?php echo $mkmk; ?>元</td>
                    </tr>
                    <tr>
                        <td>当前期数</td>
                        <td><?php echo getKitheNum(); ?>期</td>
                    </tr>
                    <tr>
                        <td>下注类型</td>
                        <td><?php echo $rtype; ?></td>
                    </tr>
                    <tr>
                        <td>下注号码</td>
                        <td><?php echo $number1; ?></td>
                    </tr>
                    <tr>
                        <td>组合总数</td>
                        <td>共 <span style="color: red;font-weight: bold;"><?php echo $zs; ?></span>组</td>
                    </tr>
                    <tr>
                        <td>下注金额</td>
                        <td><?php echo $jq; ?> <input type="hidden" name="gold" value="<?php echo $jq; ?>"></td>
                    </tr>
                    <tr>
                        <td>总下注金额</td>
                        <td><?php echo $zs*$jq; ?></td>
                    </tr>
                    <tr>
                        <td>单注限额</td>
                        <td><?php echo $money1; ?></td>
                    </tr>
                    <tr>
                        <td>单号限额</td>
                        <td><?php echo $money2; ?></td>
                    </tr>
                    <tr>
                        <input type="hidden" name="concede" value="SP11">
                        <input type="hidden" name="ioradio" value="<?php echo $rate; ?>">
                        <input type="hidden" name="ioradio1" value="<?php echo $zs; ?>">
                        <input type="hidden" name="number1" value="<?php echo $zzz; ?>">
                        <input type="hidden" name="rtype" value="<?php echo $rtype; ?>">
                        <input type="hidden" name="rate_id" value="<?php echo $rate_id; ?>">
                        <input type="hidden" name="from_url" value="<?php echo $url; ?>">
                        <td colspan="2" align="center">
                            <button class="layui-btn layui-btn-sm layui-btn-primary tr ret" type="reset">放弃</button>
                            <button class="layui-btn layui-btn-sm" type="submit">确定</button>
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