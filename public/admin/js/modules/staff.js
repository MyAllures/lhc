;
layui.define(['form','element','table'], function (e) {
	var s = layui.$,
	 	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	 	table = layui.table,
	  	form = layui.form;

	table.render({
	    elem:'#staff-table'
	    ,url:'load.html'
	    ,toolbar:"#topToolBar"
	    ,cellMinWidth: 80
	    ,cols: [[
	      {field:'name', title: '用户名'}
	      ,{field:'truename',title:'真实姓名'}
	      ,{field:'mobile',title:'手机号码'}
	      ,{field:'role_cname',title:'角色'}
	      ,{field:'state_text', title: '状态',templet:"#switchState"}
	      ,{title:'操作', fixed: 'right',align:'center', toolbar: '#toolbar'}
	    ]]
	    ,id: 'staff-table'
	    ,page: true
	});

	table.on('toolbar(staff)',function(obj){
		var checkStatus = table.checkStatus(obj.config.id);
		switch(obj.event){
		    case 'add':
		    layer.open({
				type: 2,
				title: '添加员工',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'add.html'
			});
		    break;
		};
	})

	table.on('tool(staff)',function(obj){
		var data = obj.data;
		var layEvent = obj.event;
		var tr = obj.tr;
	   if(layEvent === 'edit'){ //编辑
			layer.open({
				type: 2,
				title: '编辑员工',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'edit.html?id='+data.id
			});
	    }else if (layEvent === 'delete') {
	    	layer.confirm('您确定要删除该行数据吗', {
				btn: ['确定','取消']
			}, function(index){
				s.post('delete.html',{id:data.id},function(r){
					layer.msg(r.msg,{time:1000,end:function(){
						if(!r.code){
							obj.del();
						}else{
							layer.msg(r.msg)
						}
					}})
				})
			});
	    }
	})

	form.on('switch(state)', function(obj){
    	var id = s(this).data('id');
    	s.post('changestate.html',{id:id,state:obj.elem.checked},function(r){
    		r.code && layer.msg(r.msg);
    	})
    }); 

	form.on('submit(LAY-staff-add)',function(data){
		s.post('add.html',data.field,function(r){
			layer.msg(r.msg,{time:1000,end:function(){
				if (!r.code) {
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.layui.table.reload('staff-table');
				}
			}});
		});
		return false;
	})

	form.on('submit(LAY-staff-edit)',function(data){
		s.post('edit.html',data.field,function(r){
			layer.msg(r.msg,{time:1000,end:function(){
				if (!r.code) {
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.layui.table.reload('staff-table');
				}
			}});
		});
		return false;
	})

	var staff = function(){}
	e('staff',new staff())
})