;
layui.define(['form','element','table','tree'], function (e) {
	var s = layui.$,
	 	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	 	table = layui.table,
	 	tree = layui.tree,
	  	form = layui.form;

	table.render({
	    elem:'#role-table'
	    ,url:'load.html'
	    ,toolbar:'#topToolbar'
	    ,where:{position:s('select[name=position]').val(),pid:s('input[name=pid]').val()}
	    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
	    ,cols: [[
	      {field:'id', title: 'ID',edit: 'text'}
	      ,{field:'cname', title: '名称'}
	      ,{field:'description', title: '描述'}
	      ,{title:'操作', fixed: 'right', width:250, align:'center', toolbar: '#rowToolbar'} //这里的toolbar值是模板元素的选择器
	    ]]
	    ,id: 'role-table'
	    ,page: true
	});

	table.on('toolbar(role)',function(obj){
		switch(obj.event){
			case 'add':
			layer.open({
				type: 2,
				title: '添加角色',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'add.html'
			});
			break;
		}
	})

	table.on('tool(role)', function(obj){
	    var data = obj.data;
	    var layEvent = obj.event;
	    var tr = obj.tr;
	   
	   if(layEvent === 'edit'){ //编辑
	    	layer.open({
				type: 2,
				title: '编辑角色',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'edit.html?id='+data['id']
			});
	    }else if(layEvent === 'auth'){
	    	layer.open({
				type: 2,
				title: '角色授权',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'auth.html?id='+data['id']
			});
	    } else if(layEvent === 'delete'){ //删除
	    	layer.confirm('您确定要删除该行数据吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(index){
			  	s.post('delete.html',{id:data['id']},function(r){
			    	if(r.code){
			    		layer.msg(r.msg);
			    	}else{
			    		obj.del();
			    		layer.close(index);
			    	}
			    });
			});
	    }
	});

	form.on('submit(LAY-role-add)',function(data){
		s.post('add.html',data.field,function(r){
			if (!r.code) {
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
				parent.layui.table.reload('role-table');

			}else{
				layer.msg(r.msg)
			}
		});
		return false;
	})

	form.on('submit(LAY-role-edit)',function(data){
		s.post('edit.html',data.field,function(r){
			if (!r.code) {
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
				parent.layui.table.reload('role-table');
			}else{
				layer.msg(r.msg)
			}
		});
		return false;
	})

	form.on('checkbox(LAY-tree-check)',function(data){
		if (data.elem.checked) {
			var li  = s(data.elem).parent('li');
			var pid = s(li).data('pid');
			var checkedall = true;
			var boxs = s('li[data-pid='+pid+']').children('input[type=checkbox]');
			layui.each(boxs,function(index,item){
				if (!s(item).prop('checked')) {
					checkedall = false;
				}
			})
			if (checkedall) {
				s('li[data-id='+pid+']').children('input[type=checkbox]').prop('checked',true);
				s('li[data-id='+pid+']').children('.layui-form-checkbox').removeClass('layui-form-part-checked').addClass('layui-form-checked');
			}else{
				s('li[data-id='+pid+']').children('.layui-form-checkbox').addClass('layui-form-part-checked');
			}

			var id = s(li).data('id');
			var boxs = s('li[data-pid='+id+']').find('input[type=checkbox]');
			s('li[data-pid='+id+']').find('.layui-form-checkbox').addClass('layui-form-checked');
			s('li[data-pid='+id+']').find('input[type=checkbox]').prop('checked',true);
		}else{
			var li  = s(data.elem).parent('li');
			var pid = s(li).data('pid');
			var uncheckall = true;
			var boxs = s('li[data-pid='+pid+']').find('input[type=checkbox]');
			layui.each(boxs,function(index,item){
				if (s(item).prop('checked')) {
					uncheckall = false;
				}
			})
			if (uncheckall) {
				s('li[data-id='+pid+']').children('input[type=checkbox]').prop('checked',false);
				s('li[data-id='+pid+']').children('.layui-form-checkbox').removeClass('layui-form-checked');
			}else{
				s('li[data-id='+pid+']').children('.layui-form-checkbox').addClass('layui-form-part-checked').removeClass('layui-form-checked');
			}

			var id = s(li).data('id');
			var boxs = s('li[data-pid='+id+']').find('input[type=checkbox]');
			s('li[data-pid='+id+']').find('.layui-form-checkbox').removeClass('layui-form-checked');
			s('li[data-pid='+id+']').find('input[type=checkbox]').prop('checked',false);
		}
		s(data.othis).removeClass('layui-form-part-checked');
	})

	form.on('submit(LAY-role-auth)',function(data){
		s.post('auth.html',data.field,function(r){
			layer.msg(r.msg,{time:1000,end:function(){
				if (!r.code) {
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
				}
			}});
		});
		return false;
	})

	var role = function(){
		if (s('#navi-tree').length > 0) {
			s.get('loadnavis.html?pid=0&level=3',function(r){
		  		if (!r.code) {
					tree({
					  elem: '#navi-tree'
					  ,nodes: r.data
					  ,check: 'checkbox'
					});
					form.render('checkbox')
		  		}else{
		  			layer.msg(r.msg);
		  		}
		  	});
		}
	}
	e('role', new role())
})







