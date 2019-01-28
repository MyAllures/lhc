;
layui.define(['form','element','upload','table','laytpl'], function (e) {
	var s = layui.$,
	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	upload = layui.upload,
	table = layui.table,
	laytpl = layui.laytpl,
	form = layui.form;

	upload.render({
	    elem: '#sitelogo' //绑定元素
	    ,url: layui.setter.host + 'api/file/upload' //上传接口
	    ,done: function(res){
	      //上传完毕回调
	      if (!res.code) {
	      	s('input[name="site[logo]"]').val(res.data.src);
	      	s('#sitelogo').attr('src',res.data.src);
	      }
	  }
	});

	upload.render({
	    elem: '#wxqrcode' //绑定元素
	    ,url: layui.setter.host + 'api/file/upload' //上传接口
	    ,done: function(res){
	      //上传完毕回调
	      if (!res.code) {
	      	s('input[name="kefu[wxqrcode]"]').val(res.data.src);
	      	s('#wxqrcode').attr('src',res.data.src);
	      }
	  }
	});

	upload.render({
	    elem: '#accountalipayqrcode' //绑定元素
	    ,url: layui.setter.host + 'api/file/upload' //上传接口
	    ,done: function(res){
	      //上传完毕回调
	      if (!res.code) {
	      	s('input[name="account[alipay][qrcode]"]').val(res.data.src);
	      	s('#accountalipayqrcode').attr('src',res.data.src);
	      }
	  }
	});

	form.on('submit(LAY-site-edit)',function(data){
		s.post('site.html',data.field,function(r){
			layer.msg(r.msg,{time:1000})
		})
		return false;
	})


	form.on('submit(LAY-kefu-edit)',function(data){
		s.post('kefu.html',data.field,function(r){
			layer.msg(r.msg,{time:1000})
		})
		return false;
	})

	form.on('submit(LAY-number-edit)',function(data){
		s.post('number.html',data.field,function(r){
			layer.msg(r.msg,{time:1000})
		})
		return false;
	})

	var setting = function(){}
	e('setting', new setting())
})














