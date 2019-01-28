;
layui.define(['form','element','table','laydate','upload'], function (e) {
	var s = layui.$,
	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	laydate = layui.laydate,
	upload = layui.upload,
	table = layui.table,
	form = layui.form;

	var userTable = table.render({
		elem:'#user-table'
		,url:'load.html'
		,toolbar:"#topToolBar"	
		,cellMinWidth: 80
		,cols: [[
		{field:'id', title: 'ID',rowspan: 2}
		,{field:'kauser', title: '账号',rowspan: 2} 
		,{field:'xm', title: '姓名',rowspan: 2} 
		,{field:'cs_ts', title: '信用额度/余额',rowspan: 2}
		,{title:'代理',colspan: 2}
		,{title:'总代',colspan: 2}
		,{title:'股东',colspan: 2}
		,{title:'大股东',colspan: 2}
		,{title:'平台',colspan: 2}
		,{field:'abcd',title:'盘类',rowspan: 2}
		,{field:'create_time', title: '注册时间',rowspan: 2}
		,{field:'login_times', title: '登陆次数',rowspan: 2}
		,{field:'state_text', title: '状态',templet:"#switchState",rowspan: 2}
		,{title:'操作',width:150, fixed: 'right',align:'center', toolbar: '#toolbar',rowspan: 2}
		],[
	    {field: 'dan', title: '账号', width: 80}
		,{field: 'dan_zc', title: '占成', width: 120}
		,{field: 'zong', title: '账号', width: 80}
		,{field: 'zong_zc', title: '占成', width: 120}
		,{field: 'guan', title: '账号', width: 80}
		,{field: 'guan_zc', title: '占成', width: 120}
		,{field: 'guan1', title: '账号', width: 80}
		,{field: 'guan1_zc', title: '占成', width: 120}
		,{field: 'dagu_zc', title: '占成', width: 120}
		]]
		,id: 'user-table'
		,page: true
	});

	table.on('toolbar(user)',function(obj){
		var checkStatus = table.checkStatus(obj.config.id);
		switch(obj.event){
			case 'add':
			layer.open({
				type: 2,
				title: '添加用户',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'add.html'
			});
			break;
		};
	})

	form.on('submit(LAY-search)',function(data){
		table.reload('user-table',{
			where:data.field
			,done:function(res, curr, count){
				user.prototype.loadguan(0)
			}
		})
		return false;
	})

	form.on('select(agent)',function(data){
		var guanid = data.value;
		user.prototype.loadguan(guanid);
	})

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

	form.on('submit(LAY-user-add)',function(data){
		s.post(layui.setter.host + 'admin/user/add.html',data.field,function(r){
			layer.msg(r.msg,{time:1000,end:function(){
				if (!r.code) {
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.layui.table.reload('user-table');
				}else{
					layer.msg(r.msg)
				}
			}});
		});
		return false;
	})

	form.on('submit(LAY-user-edit)',function(data){
		s.post('edit.html',data.field,function(r){
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

	form.on('switch(state)', function(obj){
		var id = s(this).data('id');
		s.post('changestate.html',{id:id,state:obj.elem.checked},function(r){
			r.code && layer.msg(r.msg);
		})
	}); 

	form.on('submit(LAY-user-changepwd)',function(data){
		s.post('changepwd.html',data.field,function(r){
			if (!r.code) {
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
			}else{
				layer.msg(r.msg)
			}
		});
		return false;
	})

	var user = function(){
		user.prototype.loadguan(0);
	}
	user.prototype.loadguan = function(guanid) {
		s.post('loadguan.html',{guanid:guanid},function(r){
			if (!r.code) {
				var data = r.data;
				var select;
				if (guanid == 0) {
					var select = s('select[name=guanid1]');
				}else{
					var lx = data['lx'];
					if (lx == 4) {
						var select = s('select[name=guanid]');
					}else if(lx == 1){
						var select = s('select[name=zongid]');
					}else if(lx == 2){
						var select = s('select[name=danid]');
					}
				}
				var selected = select.data('selected');
				var options = [];
				layui.each(data['children'],function(index,item){
					options.push('<option value="'+item['id']+'"'+ (item['id'] == selected?'selected':'') + ' >'+item['kauser']+'</option>');
				})
				select.find('option:not(:first)').remove();
				select.append(options.join(''));
				if (selected > 0) {
					user.prototype.loadguan(selected);
				}
				form.render('select');
			}else{
				layer.msg(r.msg);
			}
		})
	};
	e('user', new user())
})












