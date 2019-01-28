;
layui.define(['form','element','table'], function (e) {
	var s = layui.$,
	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	table = layui.table,
	form = layui.form;

	table.render({
		elem:'#class-table'
		,url:'loadclass.html'
		,where:{pid:s('input[name=pid]').val()}
	    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
	    ,cols: [[
	    {field:'sort', title: '排序',edit:'edit'}
	    ,{field:'cname', title: '分类名称'}
	    ,{field:'state_text', title: '状态',templet:"#switchState"}
	      ,{title:'操作', fixed: 'right', width:250, align:'center', toolbar: '#toolbar'} //这里的toolbar值是模板元素的选择器
	      ]]
	      ,id: 'class-table'
	      ,page: true
	  });

	table.on('edit(class)', function(obj){
      	var value = obj.value //得到修改后的值
      	,data = obj.data //得到所在行所有键值
      	,field = obj.field; //得到字段
      	s.post(layui.setter.host + 'admin/article/sortclass.html',{id:data.id,sort:value},function(r){
      		if(!r.code){
      			table.reload('class-table')
      		}else{
      			layer.msg(r.msg);
      		}
      	});
      });

   	table.on('tool(class)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
	    var data = obj.data; //获得当前行数据
	    var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	    var tr = obj.tr; //获得当前行 tr 的DOM对象

	    if (layEvent === 'select') {
	    	location.href = layui.setter.host + 'admin/article/classify.html?pid='+data['id'];
	    } else if(layEvent === 'add'){
	    	article.prototype.open('添加子分类',layui.setter.host + 'admin/article/addclass.html?pid='+data['id'])
	   	} else if(layEvent === 'edit'){ //编辑
	   		article.prototype.open('编辑分类',layui.setter.host + 'admin/article/editclass.html?id='+data['id'])
	      //do somehing
	    } else if(layEvent === 'delete'){ //删除
	    	layer.confirm('您确定要删除该行数据吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(index){
				s.post(layui.setter.host + 'admin/article/delclass',{id:data['id']},function(r){
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

   	form.on('submit(LAY-articleclass-add)',function(data){
   		s.post(layui.setter.host + 'admin/article/addclass.html',data.field,function(r){
   			layer.msg(r.msg,{end:function(){
   				if(!r.code){
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.location.reload(); 
				}
			}})
   		})
   		return false;
   	})

   	form.on('submit(LAY-articleclass-edit)',function(data){
   		s.post('editclass.html',data.field,function(r){
   			layer.msg(r.msg,{end:function(){
   				if(!r.code){
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.location.reload(); 
				}
			}})
   		})
   		return false;
   	})

   	table.render({
   		elem:'#article-table'
   		,url:'load.html'
   		,toolbar:'#topToolbar'
	    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
	    ,cols: [[
	    {field:'id', title: 'ID',type:'checkbox'}
	    ,{field:'class_cname', title: '分类名称'}
	    ,{field:'cname', title: '文章名称'}
	    ,{field:'click',title:'点击次数'}
	    ,{field:'object_text',title:'对象'}
	    ,{field:'state_text', title: '状态',templet:"#switchState"}
	    ,{field:'update_time',title:'更新时间'}
	      ,{title:'操作', fixed: 'right', width:250, align:'center', toolbar: '#rowToolbar'} //这里的toolbar值是模板元素的选择器
	      ]]
	      ,id: 'article-table'
	      ,page: true
	  });

	table.on('tool(article)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
	    var data = obj.data; //获得当前行数据
	    var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	    var tr = obj.tr; //获得当前行 tr 的DOM对象

	   	if(layEvent === 'edit'){ //编辑
	   		article.prototype.open('编辑文章','edit.html?id='+data['id'])
	      //do somehing
	    } else if(layEvent === 'delete'){ //删除
	    	layer.confirm('您确定要删除该行数据吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(index){
				s.post('delete',{ids:data.id },function(r){
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

	table.on('toolbar(article)', function(obj){
		ids = [];
		var checkStatus = table.checkStatus(obj.config.id);
		layui.each(checkStatus.data,function(index,item){
			ids.push(item.id);
		})
		switch(obj.event){
			case 'add':
			article.prototype.open('添加文章','add.html');
			break;
			case 'publish':
			s.post('changestate.html',{ids:ids,state:1},function(r){
				if(r.code){
					layer.msg(r.msg);
				}else{
					table.reload('article-table')
				}
			})
			break;
			case 'draft':
			s.post('changestate.html',{ids:ids,state:0},function(r){
				if(r.code){
					layer.msg(r.msg);
				}else{
					table.reload('article-table')
				}
			})
			break;
			case 'delete':
			s.post(layui.setter.host + 'admin/article/delete',{ids:ids},function(r){
				if(r.code){
					layer.msg(r.msg);
				}else{
					table.reload('article-table')
					layer.close(index);
				}
			});
			break;
		};
	});

	form.on('select(object)',function(data){
		table.reload('article-table',{
			where:{object:data.value}
		});
	})

	form.on('submit(LAY-article-add)',function(data){
		data.field.content = data.field.editorValue;
		s.post(layui.setter.host + 'admin/article/add.html',data.field,function(r){
			layer.msg(r.msg,{end:function(){
				if(!r.code){
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.location.reload(); 
				}
			}})
		})
		return false;
	})

	form.on('submit(LAY-article-edit)',function(data){
		data.field.content = data.field.editorValue;
		s.post(layui.setter.host + 'admin/article/edit.html',data.field,function(r){
			layer.msg(r.msg,{end:function(){
				if(!r.code){
					var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					parent.layer.close(index); //再执行关闭
					parent.location.reload(); 
				}
			}})
		})
		return false;
	})

	form.on('select(class)',function(data){
		var id = s(data.elem).find('option:selected').val();
		var classname = data.elem.name == 'class_1'?'2':'3';
		article.prototype.loadclass(classname,id);
	})

	form.on('switch(state)', function(obj){
		var id = s(this).data('id');
		var state = obj.elem.checked?1:0
		s.post('changestate.html',{ids:{id},state:state},function(r){
			r.code && layer.msg(r.msg);
		})
	}); 

	var article = function(){
		if (s('select[name=class_1]').length > 0) {
			article.prototype.loadclass(1,0);
		}
		if (s('#content').length > 0) {
			article.prototype.loadUMEditor("/public/static/plugins//umeditor/umeditor.config.js",function(){
				article.prototype.loadUMEditor('/public/static/plugins/umeditor/umeditor.js',function(){
					var um = UM.getEditor('content');
				})
			})
		}
	}
	article.prototype.loadUMEditor = function(url,callback){
		var head = document.getElementsByTagName('head')[0];
		var script = document.createElement('script');
		script.type = 'text/javascript';
		script.src = url;
		script.onload = script.onreadystatechange = function () {
			if (!this.readyState || this.readyState === "loaded" || this.readyState === "complete"){
				callback();
				script.onload = script.onreadystatechange = null;
			}
		};
		head.appendChild(script);
	}
	article.prototype.open = function(title,href){
		layer.open({
			type: 2,
			title: title,
			shadeClose: true,
			shade: true,
			area: ['70%', '80%'],
			content: href
		});
	}
	article.prototype.add = function(){
		article.prototype.open('添加文章',layui.setter.host + 'admin/article/add.html');
	}
	article.prototype.addclass = function(){
		var pid = s('input[name=pid]').val();
		article.prototype.open('添加分类',layui.setter.host + 'admin/article/addclass.html?pid='+pid);
	}
	article.prototype.loadclass = function(level,pid){
		s.post(layui.setter.host + 'admin/article/loadclassforselect.html',{pid:pid},function(r){
			if (!r.code) {
				var selected = s('select[name=class_'+level+']').data('selected');
				var options = [];
				for (var index in r.data) {
					options.push('<option value="'+r.data[index]['id']+'" '+(selected == r.data[index]['id']?'selected':'')+' >'+r.data[index]['cname']+'</option>');
				}
				s('select[name=class_'+level+'] option:not(:first)').remove();
				s('select[name=class_'+level+']').append(options.join(''));
				form.render('select');

				if (level != 3) {
					var pid = s('select[name=class_'+level+']').val();
					if (pid > 0) {
						level = level == 1?2:3;
						article.prototype.loadclass(level,pid);
					}
				}
			}
		})
	}
	e('article',new article())
})