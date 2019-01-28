/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */
;
layui.define(function (e) {
  var i = (layui.$, layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin);
  i.events.logout = function () {
    // i.req({
    //   url: layui.setter.host + 'admin/user/logout',
    //   type: 'get',
    //   data: {
    //   },
    //   done: function (e) {
    //     i.exit(function () {
    //       location.href = 'user/login.html'
    //     })
    //   }
    // })
    i.exit(function () {
      location.href ='/mch/login/index.html';
    })
  },
  e('common', {
  })
});
