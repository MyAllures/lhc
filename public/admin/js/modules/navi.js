;
layui.define(['form','table','element','laytpl'], function (e) {
	var s = layui.$,
	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	table = layui.table,
	laytpl = layui.laytpl,
	form = layui.form;

	//导航列表
	table.render({
		elem:'#navi-table'
		,url:'load.html?pid=0&level=1'
		,toolbar:'#topToolbar'
	    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
	    ,cols: [[
	    {field:'cname_text', title: '名称'}
	    ,{field:'sort', title: '排序',edit: 'text'}
	    ,{field:'action', title: '动作'}
	      ,{title:'操作', fixed: 'right', width:250, align:'center', toolbar: '#toolbar'} //这里的toolbar值是模板元素的选择器
	      ]]
	    ,id: 'navi-table'
	    ,page: false
	    ,parseData:function(res){
	    	var data = res.data;
	    	var length = data.length;
	    	var i = 1;
	    	layui.each(data,function(index,item){
	    		data[index]['cname_text'] = '<i class="layui-icon w16">'+(item['subnavis'].length > 0?'&#xe623;':'')+'</i>'+item['cname'];
	    	})
	    	return res;
	    }
	});

	table.on('rowDouble(navi)', function(obj){
		// var that = this;/
		var load = s(obj.tr).hasClass('layui-tree-spread');
		layui.each(s(obj.tr).parent().find('.layui-tree-spread'),function(index,item){
			var id = s(item).data('id');
			if (typeof(id) == 'undefined') {
				s('tr[data-pid]').remove();
			}else{
				s('tr[data-pid='+id+']').remove();
			}
			s(item).removeClass('layui-tree-spread');
			var content = '<i class="layui-icon w16">&#xe623;</i>'+obj.data.cname
			var td = s(item).children('td[data-field="cname_text"]');
			td.children('.layui-table-cell').html(content);
			td.data('content', content)
		})
		if (!load) {
			var id = obj.data.id;
			s.get('load.html?pid='+id,function(r){
				var length = r.data.length 
			  	if (length > 0) {
			  		var trs = [];
			  		var j = 1;
			  		layui.each(r.data, function(index, item){
			  			var cname_text = '';
			    		if (item.pid != 0) {
			    			if (j == length) {
			    				cname_text += '&nbsp;└';
			    			}else{
			    				cname_text += '&nbsp;├';
			    			}
			    		}
			    		cname_text += '<i class="layui-icon w16">'+(item['subnavis'].length > 0?'&#xe623;':'')+'</i>'+item['cname'];
			    		item['cname_text'] = cname_text;
			  			var tr = [];
				  		table.eachCols('navi-table',function(i,a){
				  			var key = table.index + '-' + a.key;
				  			var td = ['<td data-field='+a.field+' data-key="' + key + '"'+function () {
				                var e = [
				                ];
				                return a.edit && e.push('data-edit="' + a.edit + '"'),
				                a.align && e.push('align="' + a.align + '"'),
				                a.toolbar && e.push('data-off="true"'),
				                e.join(' ')
				              }()+' >',
							'<div class="layui-table-cell laytable-cell-'+key+'">'+(a.toolbar ? laytpl(s(a.toolbar).html()).render(item) : item[a.field])+'</div>',
							'</td>'].join('')
							tr.push(td);
				  		})
				  		trs.push('<tr data-index="' + obj.tr.data('index')+'-'+index + '" data-id="'+item['id']+'" data-pid="'+id+'">' + tr.join('') + '</tr>');
				  		j++;
				  	})
				  	s(obj.tr).after(trs.join());
				  	s(obj.tr).addClass('layui-tree-spread');
			  		obj.update({'cname_text':'<i class="layui-icon w16">&#xe625;</i>'+obj.data.cname});   
			  	}else{
			  		layer.msg("加载失败");
			  	} 
			});
		}
	});

	table.on('tool(navi)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
	    var data = obj.data; //获得当前行数据
	    var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	    var tr = obj.tr; //获得当前行 tr 的DOM对象

	    if(layEvent === 'add'){
	    	layer.open({
				type: 2,
				title: '添加导航',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'add.html?pid='+data['id']
			});
	   	} else if(layEvent === 'edit'){ //编辑
	   		layer.open({
				type: 2,
				title: '编辑导航',
				shadeClose: true,
				shade: true,
				area: ['50%', '80%'],
				content: 'edit.html?id='+data['id']
			});
	    } else if(layEvent === 'delete'){ //删除
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
	    }
	});

	table.on('edit(navi)', function(obj){
      var value = obj.value //得到修改后的值
      ,data = obj.data //得到所在行所有键值
      ,field = obj.field; //得到字段
      s.post(layui.setter.host + 'admin/navi/sort.html',{id:data.id,sort:value},function(r){
      	if(!r.code){
      		table.reload('navi-table')
      	}else{
      		layer.msg(r.msg);
      	}
      });
  	});


	form.on('submit(LAY-navi-edit)',function(data){
		s.post('edit.html',data.field,function(r){
			layer.msg(r.msg,{time:1000,end:function(){
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.layui.table.reload('navi-table');
			}})
		});
		return false;
	});

	form.on('submit(LAY-navi-add)',function(data){
		s.post('add.html',data.field,function(r){
			layer.msg(r.msg,{time:1000,end:function(){
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.layui.table.reload('navi-table');
			}})
		});
		return false;
	});

	e('navi', {})
})