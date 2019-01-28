<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:57:"D:\www\PHPTutorial\WWW\lhc/app/index\view\look\index.html";i:1547433765;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>使用条款</title>
    <link rel="stylesheet" href="/file/lhc_images/main.css">
    <style>
        body{
            margin-top: -25px;
            background-color: #fff;
        }
        .bannertop{
            /*background-color:green;*/
            border-bottom: 5px solid red;
        }
        #bottomNav{
            background-color: rgb(0, 153, 255);
        }
    </style>
</head>
<body>
    <div class="bannertop">
        <h2><?php echo $webname; ?>使用条款</h2>
    </div>
    <?php echo $content; ?>
    <div id="bottomNav">
        <input name="submit" type="submit" class="wobu" value="我不同意" onclick="javascript:location.href='<?php echo url('login/logout'); ?>'" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="submit2" type="submit"  class="wobu" value="我同意" onclick="javascript:location.href='/'" />
    </div>
</body>
</html>