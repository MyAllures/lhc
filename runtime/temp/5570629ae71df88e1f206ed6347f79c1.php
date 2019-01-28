<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:60:"D:\www\PHPTutorial\WWW\lhc/app/index\view\bets\save_kbb.html";i:1548644310;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>下单成功</title>
    <link rel="stylesheet" href="/file/admin/layui/css/layui.css" type="text/css">
    <script src="/file/lhc_images/jquery.min.js"></script>
    <script src="/file/admin/layui/layui.js"></script>
    <script src="/file/admin/layui/lay/modules/layer.js"></script>
    <style>
        .layui-table td, .layui-table th{
            text-align: center;
        }
    </style>
    <script>
        function closeWin(){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
            <?php if(!empty($url)): else: ?>
                window.parent.location.reload();
            <?php endif; ?>

        }
        $(function(){
            layui.use(['layer'],function () {
                var layer=layui.layer;
                <?php if($arr['code'] == 1): ?>
                    layer.msg('<?php echo $arr["msg"]; ?>',{icon:2});
                    closeWin();
                <?php endif; ?>
                $('.ret').click(function () {
                    closeWin();
                });
                setTimeout(closeWin,20000);
            });
        })

    </script>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <table class="layui-table">
               <thead>
               <tr>
                   <th colspan="4">下注成功</th>
               </tr>
               <tr>
                   <th>内容</th>
                   <th>赔率</th>
                   <th>下注金额</th>
               </tr>
               </thead>
                <tbody>
                <?php if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: foreach($res as $key=>$r): if($r['num'] != ''): ?>
                <tr>
                    <td><span style="color: #ff0000;"><?php echo $r['class2']; ?>：</span><span style="color: #ff6600;"><?php echo $r['class3']; ?></span></td></td>
                    <td><?php echo $r['rate']; ?></td>
                    <td><?php echo $r['num']; ?></td>
                </tr>
                <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                <tr>
                    <td colspan="4" align="center">
                        <button class="layui-btn layui-btn-sm ret">下注成功</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>