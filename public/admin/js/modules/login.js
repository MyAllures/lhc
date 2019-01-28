/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */
;
layui.define('form', function (e) {
  var s = layui.$,
  t = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
  form = layui.form;

  s('#LAY-user-get-vercode').on('click', function () {
    s(this);
    this.src = '/captcha.html?t=' + (new Date).getTime()
  })

  s('body').on('keyup',function(e){
    if (e.keyCode == "13") {
      s('button[lay-submit]').click();
    }
  })

  form.on('submit(LAY-user-login-submit)', function(data){
    s.post('check.html',data.field,function(r){
      layer.msg(r.msg,{time:1000,end:function(){
        if (!r.code) {
          location.href = '/admin/index/index';
        }else{
          s('#LAY-user-login-vercode').val('');
          s('#LAY-user-get-vercode').click();
        }
      }});
    })
    return false;
  })

  var login = function(){}
  e('login', new login())
});
