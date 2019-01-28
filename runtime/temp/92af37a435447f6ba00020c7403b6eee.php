<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:60:"D:\www\PHPTutorial\WWW\lhc/app/index\view\bets_tm\test1.html";i:1548639076;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/file/admin/layui/css/layui.css" type="text/css">
    <script src="/file/lhc_images/jquery.min.js"></script>
    <script src="/file/admin/layui/layui.js"></script>
</head>
<body>
    <form name="" action="<?php echo url('bets_tm'); ?>" target="_self">
        <p><input type="text"></p>
        <p><button>提交</button></p>
    </form>
<script>
    alert(123456);
    layui.use(['layer'],function(){

        var layer=layui.layer;

        console.log(layer);
        layer.open({
            title:'1',
            content:'2',

        });
        layer.alert('来');
        layer.open({
            title:'测试1',
            content:'内容1',
        });
    })
</script>
</body>
</html>