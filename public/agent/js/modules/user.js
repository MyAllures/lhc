/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */
;
layui.define(['form','table'], function (e) {
	var s = layui.$,
	t = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	table = layui.table,
	form = layui.form;

  // table
  	table.render({
	  	elem:'#user-table'
	  	,url:'load.html'
	  	,cellMinWidth: 80
	  	,cols: [[
		  	{field:'id', title: 'ID', sort: true}
		  	,{field:'headimgurl', title: '头像'} 
		  	,{field:'nickname', title: '昵称'} 
		  	,{field:'sex_text', title: '性别'}
		  	,{field:'coin',title:'钻石'}
		  	,{field:'state_text',title:'状态'}
		    ,{title:'操作', fixed: 'right', align:'center', toolbar: '#toolbar'} //这里的toolbar值是模板元素的选择器
	    ]]
	    ,id: 'user-table'
	    ,page: true
	});

	table.on('tool(user)', function(obj){
	    var data = obj.data;
	    var layEvent = obj.event;
	    var tr = obj.tr;

	    switch(obj.event){
	    	case 'charge':
	    	layer.open({
				type: 2,
				title: '充值',
				shadeClose: true,
				shade: true,
				area: ['400px', '500px'],
				content: 'charge.html?id='+data['id']
			});
	    	break;
	    	case 'finance':
	    	layer.open({
				type: 2,
				title: '财务明细',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'finance.html?id='+data['id']
			});
	    	break;
	    }
	});

	table.render({
	  	elem:'#finance-table'
	  	,url:'loadfinance.html'
	  	,where:{userid:s('input[name=id]').val()}
	  	,toolbar:'#toolbar'
	  	,cellMinWidth: 80
	  	,cols: [[
		  	{field:'no', title: '编号'} 
		  	,{field:'value', title: '变动金额'} 
		  	,{field:'coin',title:'当前余额'}
		  	,{field:'mode_text',title:'方式'}
		  	,{field:'type_text',title:'类型'}
		  	,{field:'create_time',title:'时间'}
		  	,{field:'state_text',title:'状态'}
	    ]]
	    ,id: 'finance-table'
	    ,page: true
	});


	form.on('submit(LAY-user-edit)',function(data){
		s.post('/agent/user/edit.html',data.field,function(r){
			layer.msg(r.msg,{end:function(){
				if (!r.code) {
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.location.reload();  
				}}
			})
		})
		return false;
	})

	form.on('submit(LAY-user-charge)',function(data){
		s.post('charge.html',data.field,function(r){
			layer.msg(r.msg,{time:1000,end:function(){
				if (!r.code) {
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.layui.table.reload('user-table');
				}
			}});
		});
		return false;
	})

  	var user = function(){}
  	e('user', new user())
});
