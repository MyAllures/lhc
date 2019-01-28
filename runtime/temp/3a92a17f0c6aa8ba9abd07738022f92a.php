<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"D:\www\PHPTutorial\WWW\lhc/app/index\view\login\index.html";i:1547370733;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <title>用户管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
    <meta name="author" content="Vincent Garreau" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="/file/admin/particles/css/style.css">
    <link rel="shortcut icon" href="/file/admin/images/favicon.ico" />
    <link rel="stylesheet" href="/file/admin/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/file/admin/css/style.css">
    <script src="/file/admin/js/jquery.min.js"></script>
    <script src="/file/admin/js/jquery.validate.js"></script>
    <script src="/file/admin/js/jquery.form.js"></script>
    <script src="/file/admin/js/jquery-ui.min.js"></script>
    <script src="/file/admin/js/login.js"></script>

    <script>
      var action='<?php echo url("login"); ?>';
      var index='<?php echo url("index/index"); ?>';
      var look='<?php echo url("look/index"); ?>';
    </script>
</head>
<body>
<style type="text/css">
.tpt-login {
    top: 0;
}
    .tpt-login .tpt-logins i {
    color: #fff;
}
#particles-js {
    width: 100%;
    position: absolute;
    right: 0;
    top: 0;
}
</style>
<div class="tpt-login">
    <div class="tpt-logins">
        <div class="geometry1"></div>
        <div class="geometry2"></div>
        <div class="geometry3"></div>
        <div class="geometry4"></div>
        <h2>用户-<em style="color: #ff5722;">登录</h2>
        <form class="login">
            <div class="layui-form-item">
                <input class="layui-input" type="text" id="username" placeholder="账号" name="username" value="" lay-verify="required">
            </div>
            <div class="layui-form-item">
                <input class="layui-input" id="password" type="password" placeholder="密码" name="password" value="" lay-verify="required">
            </div>
            <div class="layui-form-item">
                <input type="checkbox" name="remember" id="remem" value="1" checked="checked" lay-skin="primary" title="记住密码"><label for="remem" class="remem">记住密码</label>
            </div>
            <div class="layui-form-item">
                <button style="padding: 0 102px;" class="layui-btn" id="sub" type="submit">登录后台</button>
            </div>
        </form>
    </div>
</div>
<div id="particles-js"></div>

<script src="/file/admin/particles/js/particles.js"></script>
<script src="/file/admin/particles/js/app.js"></script>

<script>
function stop(){ 
  return false;
} 
document.oncontextmenu=stop;
</script>

<div id="dia">
  <p>登录失败</p>
  <p>账号或密码错误</p>
  <div class="del">关闭</div>
</div>
</body>
</html>