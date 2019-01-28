<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:63:"D:\www\PHPTutorial\WWW\lhc/app/index\view\index\error_page.html";i:1547088045;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发生错误</title>
    <link rel="stylesheet" href="/file/admin/layui/css/layui.css" type="text/css">
    <script src="/file/lhc_images/jquery.min.js"></script>
    <script src="/file/admin/layui/layui.js"></script>
    <script>
        layui.use(['layer'],function () {
            var layer=layui.layer;
            layer.msg('<?php echo $msg; ?>',{icon:2});
            setTimeout(function () {
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            },2000);
        })
    </script>
</head>
<body>

</body>
</html>