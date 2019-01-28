;
layui.define(['form','element','table'], function (e) {
	var s = layui.$,
	 	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	 	table = layui.table,
	  	form = layui.form;

	table.render({
	    elem:'#withdraw-table'
	    ,url:'load.html'
	    ,toolbar:'#topToolBar'
	    ,cellMinWidth: 80
	    ,cols: [[
	      {field:'id', type:'checkbox'}
	      ,{field:'amount', title: '金额'}
	      ,{field:'card_account_cname', title: '账户'}
	      ,{field:'bank_cname', title: '银行名称'}
	      ,{field:'card_no', title: '卡号'}
	      ,{field:'branch_cname', title: '支行名称'}
	      ,{field:'phone', title: '短信通知'}
	      ,{field:'state_text', title: '状态',templet:"#switchState"}
	      ,{field:'update_time', title: '更新时间'}
	      ,{field:'handle',title:'操作', fixed: 'right', align:'center', toolbar: '#toolbar'} //这里的toolbar值是模板元素的选择器
	    ]]
	    ,id: 'withdraw-table'
	    ,page: true
	});

	table.on('toolbar(withdraw)', function(obj){
		switch(obj.event){
			case 'setting':
			layer.open({
				type: 2,
				title: '提现设置',
				shadeClose: true,
				shade: true,
				area: ['500px', '579px'],
				content:'/admin/setting/withdraw.html'
			});
			break;
			case 'search':
			table.reload('withdraw-table',{
		     	where:{card_account_cname:s('input[name=card_account_cname]').val(),state:s('select[name=state]').val()}
		     })
			break;
			case 'confirm':
			layer.confirm('您确定要批量确认吗', {
				btn: ['确定','取消']
			}, function(index){
				var ids = [];
				layui.each(checkStatus.data,function(index,item){
					ids.push(item.id);
				})
				s.post('confirm.html',{ids:ids},function(r){
					layer.msg(r.msg,{time:1000,end:function(){
						if (!r.code) {
							location.reload();
						}
					}})
				})
			});
			break;
		};
	});

	table.on('tool(withdraw)', function(obj){ 
	    var data = obj.data; //获得当前行数据
	    var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	    var tr = obj.tr;
	    var elem = this; 
	   
	   if(layEvent === 'cancel'){ 
	      	layer.confirm('您确定要作废该行数据吗？', {
			  btn: ['确定','取消'] 
			}, function(index){
			  	s.post('cancel.html',{id:data['id']},function(r){
			    	if(r.code){
			    		layer.msg(r.msg);
			    	}else{
			    		obj.update({
			    			state:0,
			    			state_text:'作废',
			    		});
			    		s(elem).remove();
			    		layer.close(index);
			    	}
			    });
			});
	    }
	});

	form.on('switch(state)', function(obj){
    	var id = s(this).data('id');
    	s.post('changestate.html',{id:id,state:obj.elem.checked},function(r){
    		r.code && layer.msg(r.msg);
    	})
    }); 

	var withdraw = function(){}
	e('withdraw',new withdraw())
})