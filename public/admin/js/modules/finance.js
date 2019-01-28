;
layui.define(['form','element','table','upload'], function (e) {
	var s = layui.$,
	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	table = layui.table,
	upload = layui.upload,
	form = layui.form;

	table.render({
		elem:'#charge-table'
		,url:'load.html'
		,where:{type:1}
		,toolbar:'#topToolbar'
		,cellMinWidth: 80
		,cols: [[
		{field:'no', title: '充值编号'}
		,{field:'nickname',title:'用户昵称'}
		,{field:'value', title: '充值金额'}
		,{field:'state_text', title: '状态'}
		,{field:'create_time',title:'提交时间'}
		// ,{field:'handle',title:'操作',width:'265',fixed: 'right', align:'center', toolbar: '#rowToolBar'}
	    ]]
	    ,id: 'charge-table'
	    ,page: true
	});

	table.on('toolbar(charge)', function(obj){
		switch(obj.event){
			case 'setting':
			layer.open({
				type: 2,
				title: '充值账号',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: '/admin/setting/account.html'
			});
			break;
		};
	});

	table.render({
		elem:'#taocan-table'
		,url:'loadtc.html'
		,toolbar:'#topToolbar'
		,cols: [[
		{field:'sort', title: '排序',edit: 'text'}
		,{field:'pic',title:'图片'}
		,{field:'number', title: '数量'}
		,{field:'user_price',title:'用户价格'}
		,{field:'agent_price',title:'代理价格'}
		,{field:'handle',title:'操作',fixed: 'right', align:'center', toolbar: '#rowToolbar'}
		]]
		,id: 'taocan-table'
		,page: false
	});

	table.on('toolbar(taocan)', function(obj){
		switch(obj.event){
			case 'add':
			layer.open({
				type: 2,
				title: '添加套餐',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'addtc.html'
			});
			break;
		};
	});

	upload.render({
	    elem: '#pic' //绑定元素
	    ,url: layui.setter.host + 'api/file/upload' //上传接口
	    ,done: function(res){
	      //上传完毕回调
	      if (!res.code) {
	      	s('input[name="pic"]').val(res.data.src);
	      	s('#pic').attr('src',res.data.src);
	      }
	  }
	});

	table.on('edit(taocan)', function(obj){
      var value = obj.value //得到修改后的值
      ,data = obj.data //得到所在行所有键值
      ,field = obj.field; //得到字段
      s.post('sorttc.html',{id:data.id,sort:value},function(r){
      	if(!r.code){
      		table.reload('taocan-table')
      	}else{
      		layer.msg(r.msg);
      	}
      });
  	});

  	table.on('tool(taocan)', function(obj){
  		var data = obj.data
		switch(obj.event){
			case 'edit':
			layer.open({
				type: 2,
				title: '编辑套餐',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'edittc.html?id='+data.id
			});
			break;
			case 'delete':
	    	layer.confirm('您确定要删除该行数据吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(index){
				s.post('delete',{id:data['id']},function(r){
					if(r.code){
						layer.msg(r.msg);
					}else{
						obj.del();
						layer.close(index);
					}
				});
			});
			break;
		};
	});

	table.render({
		elem:'#consume-table'
		,url:'load.html'
		,where:{type:3}
		,toolbar:'#topToolBar'
		,cols: [[
		{field:'no', title: '编号'}
		,{field:'mch_cname',title:'商户名称'}
		,{field:'amount', title: '消费额'}
		,{field:'balance',title:'存款'}
		,{field:'coin',title:'发布点'}
		,{field:'state_text', title: '状态'}
		,{field:'create_time',title:'提交时间'}
		]]
		,id: 'consume-table'
		,page: true
	});

	s('.btn-search').on('click',function() {
		var username = s('input[name=name]').val();
		s.post('/admin/user/secrchuserbynameforfinance.html',{username:username},function (r) {
			if (!r.code) {
				var data = r.data;
				s('.user_info').html('真实姓名：'+data['truename']+' 钻石：'+data['coin']);
			}else{
				s('.user_info').html(r.msg);
			}
		})
	})

	form.on('submit(LAY-charge-add)',function(data){
		s.post('addcharge.html',data.field,function(r){
			if (!r.code) {
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭
				parent.layui.table.reload('charge-table');
			}else{
				layer.msg(r.msg)
			}
		})
		return false;
	})

	form.on('submit(LAY-taocan-add)',function(data){
		s.post('addtc.html',data.field,function(r){
			if (!r.code) {
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭
				parent.layui.table.reload('taocan-table');
			}else{
				layer.msg(r.msg)
			}
		})
		return false;
	})

	form.on('submit(LAY-taocan-edit)',function(data){
		s.post('edittc.html',data.field,function(r){
			if (!r.code) {
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭
				parent.layui.table.reload('taocan-table');
			}else{
				layer.msg(r.msg)
			}
		})
		return false;
	})

	var finance = function(){}
	e('finance',new finance())
})