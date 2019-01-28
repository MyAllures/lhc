;
layui.define(['form','table','laydate'], function (e) {
	var s = layui.$,
	 	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	 	table = layui.table,
	 	laydate = layui.laydate,
	  	form = layui.form;
	  	
	table.render({
	    elem:'#kithe-table'
	    ,url:'load.html'
	    ,toolbar:'#topToolbar'
	    ,cellMinWidth: 80
	    ,cols: [[
	      {field:'nn', title: '预设开奖期数'}
	      ,{field:'nd', title: '开奖时间'}
	      ,{field:'zfbdate', title: '自动开盘时间'}
	      ,{field:'zfbdate1',title:'自动封盘时间'}
	      ,{title:'操作',width:250, fixed: 'right', align:'center', toolbar: '#toolbar'}
	    ]]
	    ,id: 'kithe-table'
	    ,page: false
	    ,parseData:function(r){
	    	var data = r.data;
	    	data = data.splice(0,3);
	    	data.reverse();
	    	r.data = data;
	    	return r;
	    }
	});

	table.on('toolbar(kithe)',function(obj){
		switch(obj.event){
			case 'history':
				location.href = 'history.html'
				break;
			case 'add':
			layer.open({
				type: 2,
				title: '添加盘口',
				shadeClose: true,
				shade: true,
				area: ['80%', '80%'],
				content: 'add.html'
			});
			break;
		}
	})

	table.on('tool(kithe)',function(obj){
		var data = obj.data;
		switch(obj.event){
			case 'edit':
				layer.open({
					type: 2,
					title: '编辑盘口',
					shadeClose: true,
					shade: true,
					area: ['80%', '80%'],
					content: 'edit.html?id='+data['id']
				});
				break;
			case 'delete':
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
			break
		}
	})

	table.render({
	    elem:'#history-table'
	    ,url:'/load.html'
	    ,toolbar:'#topToolbar'
	    ,where:{history:1}
	    ,cellMinWidth: 80
	    ,cols: [[
	      {field:'nn', title: '期数',rowspan: 2}
	      ,{field:'nd', title: '开奖时间',rowspan: 2}
	      ,{field:'zfbdate', title: '开奖球号',align:'center',colspan: 7}
	      ,{field:'zodiac',title:'生肖',rowspan: 2}
	      ,{field:'state_text',title:'显示状态',templet:"#switchState", rowspan: 2}
	      ,{title:'操作',width:250, fixed: 'right', align:'center', toolbar: '#toolbar',rowspan: 2}
	    ], [
		    {field: 'n1_image', title: '平1', width: 80}
		    ,{field: 'n2_image', title: '平2', width: 80}
		    ,{field: 'n3_image', title: '平3', width: 80}
		    ,{field: 'n4_image', title: '平4', width: 80}
		    ,{field: 'n5_image', title: '平5', width: 80}
		    ,{field: 'n6_image', title: '平6', width: 80}
		    ,{field: 'na_image', title: '特码', width: 80}
		  ]]
	    ,id: 'history-table'
	    ,page: true
	});

	table.on('tool(history)',function(obj){
		var data = obj.data;
		switch(obj.event){
			case 'edit':
				layer.open({
					type: 2,
					title: '编辑盘口',
					shadeClose: true,
					shade: true,
					area: ['80%', '80%'],
					content: 'edit.html?id='+data['id']
				});
				break;
			case 'lottery':
			if (data.kitm != 0 || data.kizt != 0 || data.kizm != 0 || data.kizm6 != 0 || data.kigg != 0 || data.kilm != 0 || data.kisx != 0 || data.kibb != 0 || data.kiws != 0) {
				layer.msg('请先封盘');
			}else{
				layer.open({
					type: 2,
					title: '开盘',
					shadeClose: true,
					shade: true,
					area: ['50%', '80%'],
					content: 'lottery.html?id='+data['id']
				});
			}
			break
		}
	})

	laydate.render({ 
	  elem: 'input[name=zfbdate1]'
	  ,type: 'datetime'
	});

		laydate.render({ 
	  elem: 'input[name=nd]'
	  ,type: 'datetime'
	});

	laydate.render({ 
	  elem: 'input[name=zfbdate]'
	  ,type: 'datetime'
	});

	laydate.render({ 
	  elem: 'input[name=kitm1]'
	  ,type: 'datetime'
	});

	laydate.render({ 
	  elem: 'input[name=kizm1]'
	  ,type: 'datetime'
	});

	form.on('submit(LAY-kithe-add)',function(data){
		s.post('add.html',data.field,function(r){
			if (!r.code) {
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭
				parent.layui.table.reload('kithe-table');
			}else{
				layer.msg(r.msg);
			}
		})
		return false;
	})

	form.on('submit(LAY-kithe-edit)',function(data){
		s.post('edit.html',data.field,function(r){
			if (!r.code) {
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭
				parent.layui.table.reload('kithe-table');
			}else{
				layer.msg(r.msg);
			}
		})
		return false;
	})

	form.on('switch(state)', function(data){
	   	var id = s(this).data('id');
    	s.post('changestate.html',{id:id,state:data.elem.checked},function(r){
    		if (r.code) {
    			layer.msg(r.msg);
    			data.othis.removeClass('layui-form-onswitch')
    			data.othis.find('em').text('否');
    			// form.render('switch');	
    		}
    	})
	});  

	form.on('submit(LAY-lottery)',function(data){
		s.post('lottery.html',data.field,function(r){
			if (!r.code) {
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭
				parent.layui.table.reload('history-table');
			}else{
				layer.msg(r.msg);
			}
		})
		return false;
	})

	var kithe = function(){}
	e('kithe',new kithe())
})