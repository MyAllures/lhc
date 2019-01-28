;
layui.define(['form','table'], function (e) {
	var s = layui.$,
	 	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	 	table = layui.table,
	  	form = layui.form;

	table.render({
	    elem:'#agent-table'
	    ,url:'load.html'
	    ,toolbar:'#topToolbar'
	    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
	    ,cols: [[
	      {field:'id', title: 'ID'}
	      ,{field:'user_name', title: '用户名'}
	      ,{field:'user_cname', title: '姓名'}
	      ,{field:'level_text',title:'级别'}
	      ,{field:'credit_quota',title:'信用额度'}
	      ,{field:'usable_quota',title:'可用额度'}
	      ,{field:'pz_text',title:'走飞状态'}
	      ,{field:'tm',title:'预计亏损'}
	      ,{field:'state_text', title: '状态',templet:"#switchState"}
	      ,{field:'adddate', title: '最后修改时间'}
	      ,{title:'操作',width:250, fixed: 'right', align:'center', toolbar: '#toolbar'} //这里的toolbar值是模板元素的选择器
	    ]]
	    ,id: 'agent-table'
	    ,page: true
	});	

	table.on('toolbar(agent)',function(obj){
		var levelid = s('input[name=levelid]').val();

		switch(obj.event){
			case 'add':
			layer.open({
				type: 2,
				title: '添加代理商',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'add.html?levelid='+levelid
			});
			break;
		}
	})

	table.on('tool(agent)', function(obj){
	    var data = obj.data;
	    var layEvent = obj.event;
	    var tr = obj.tr;

	    switch(obj.event){
	    	case 'edit':
	    	layer.open({
				type: 2,
				title: '编辑',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'edit.html?id='+data['id']
			});
	    	break;
	    	case 'detail':
	    	layer.open({
				type: 2,
				title: '详细',
				shadeClose: true,
				shade: true,
				area: ['80%', '80%'],
				content: 'detail.html?id='+data.id
			});
			break;
	    }
	});

	form.on('checkbox(layTableAllChoose)', function(data){
		var checkboxs = s('input[name=layTableCheckbox]');
		layui.each(checkboxs,function(index,item){
			s(item).prop('checked',data.elem.checked);
		})
		form.render('checkbox')
	});

	form.on('checkbox(layTableChoose)', function(data){
		if (data.elem.checked) {
			var allchoose = true;
			var checkboxs = s('input[lay-filter=layTableChoose]');
			layui.each(checkboxs,function(index,item){
				if (!item.checked) {
					allchoose = false;
				}
			})
			if (allchoose) {
				s('input[lay-filter=layTableAllChoose]').prop('checked',true);
			}
		}else{
			s('input[lay-filter=layTableAllChoose]').prop('checked',false);
		}
		form.render('checkbox')
	});


	form.on('switch(state)', function(obj){
    	var id = s(this).data('id');
    	s.post('changestate.html',{id:id,state:obj.elem.checked},function(r){
    		r.code && layer.msg(r.msg);
    	})
    }); 

    s('.btn-height').on('click',function(){
    	var tpan = s('select[name=tpan]').val();
    	var tnum = parseFloat(s('input[name=tnum]').val());
    	var checkboxs = s('input[lay-filter=layTableChoose]');
    	layui.each(checkboxs,function(index,item){
			if (item.checked) {
				var names = ['m[]','ygb[]','ygc[]','ygd[]'];
				if (s.inArray(tpan, names) >= 0) {
					var input = s(item).parents('tr').find('input[name="'+tpan+'"]');
					var value = parseFloat(s(input).val()) + tnum;
					s(input).val(value);
				}else if(tpan == 'All'){
					for (var i = 0; i < names.length; i++) {
						var input = s(item).parents('tr').find('input[name="'+names[i]+'"]');
						var value = parseFloat(s(input).val()) + tnum;
						s(input).val(value);
					}
				}
			}
		})
    })

    s('.btn-low').on('click',function(){
    	var tpan = s('select[name=tpan]').val();
    	var tnum = parseFloat(s('input[name=tnum]').val()) * -1;
    	var checkboxs = s('input[lay-filter=layTableChoose]');
    	layui.each(checkboxs,function(index,item){
			if (item.checked) {
				var names = ['m[]','ygb[]','ygc[]','ygd[]'];
				if (s.inArray(tpan, names) >= 0) {
					var input = s(item).parents('tr').find('input[name="'+tpan+'"]');
					var value = parseFloat(s(input).val()) + tnum;
					s(input).val(value);
				}else if(tpan == 'All'){
					for (var i = 0; i < names.length; i++) {
						var input = s(item).parents('tr').find('input[name="'+names[i]+'"]');
						var value = parseFloat(s(input).val()) + tnum;
						s(input).val(value);
					}
				}
			}
		})
    })

    s('.btn-zero').on('click',function(){
    	var tpan = s('select[name=tpan]').val();
    	var tnum = parseFloat(s('input[name=tnum]').val()) * -1;
    	var checkboxs = s('input[lay-filter=layTableChoose]');
    	layui.each(checkboxs,function(index,item){
			if (item.checked) {
				var names = ['m[]','ygb[]','ygc[]','ygd[]'];
				if (s.inArray(tpan, names) >= 0) {
					var input = s(item).parents('tr').find('input[name="'+tpan+'"]');
					s(input).val(0);
				}else if(tpan == 'All'){
					for (var i = 0; i < names.length; i++) {
						var input = s(item).parents('tr').find('input[name="'+names[i]+'"]');
						s(input).val(0);
					}
				}
			}
		})
    })

    s('.btn-zhu-limit').on('click',function(){
    	var xrnum = parseFloat(s('input[name=xrnum]').val());
    	var checkboxs = s('input[lay-filter=layTableChoose]');
    	layui.each(checkboxs,function(index,item){
			if (item.checked) {
				var input = s(item).parents('tr').find('input[name="mm[]"]');
				s(input).val(xrnum);
			}
		})
    })

    s('.btn-hao-limit').on('click',function(){
    	var xrnum = parseFloat(s('input[name=xrnum]').val());
    	var checkboxs = s('input[lay-filter=layTableChoose]');
    	layui.each(checkboxs,function(index,item){
			if (item.checked) {
				var input = s(item).parents('tr').find('input[name="mmm[]"]');
				s(input).val(xrnum);
			}
		})
    })

    form.on('submit(LAY-agent-detail)',function(data){
    	s.post('detail.html',data.field,function(r){
    		if (!r.code) {
    			var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
    		}else{
    			layer.msg(r.msg);
    		}
    	});
    	return false;
    })

	var agent = function(){}
	agent.prototype.checkname = function() {
		var user_prefix = s('input[name=user_prefix]').val();
		var user_name = s('input[name=user_name]').val();
		if (s.trim(user_name) == '') {
			layer.msg(r.msg);
		}
		user_name = user_prefix + user_name;
		s.post('checkname.html',{user_name:user_name},function(r){
			s('.checkname_result').text(r.msg);
			if (r.code) {
				s('input[name=user_name]').val('');
			}
		});
	};
	e('agent',new agent())
})