/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */
;
layui.define(function (e) {
	var i = (layui.$, layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin);
	i.events.logout = function () {
		i.exit(function () {
			location.href = layui.setter.host + 'admin/login/index.html';
		})
	},
	i.events.changepwd = function(){
		layer.open({
			type: 2,
			title: '修改密码',
			shadeClose: true,
			shade: true,
			area: ['400px', '300px'],
			content: '/admin/user/changepwd.html'
		});
	}
	e('common', {})
});
