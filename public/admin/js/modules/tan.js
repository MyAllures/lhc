;
layui.define(['form','element','table','laydate','util'], function (e) {
	var s = layui.$,
	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	laydate = layui.laydate,
	table = layui.table,
	util = layui.util,
	form = layui.form;

	table.render({
		elem:'#tan-table'
		,url:'load.html'
		,toolbar:"#topToolBar"	
		,cellMinWidth: 80
		,totalRow: true
		,cols: [[
		{field:'kithe', title: '期数',totalRowText:'小计'}
		,{field:'num', title: '单号'} 
		,{field:'adddate', title: '时间'} 
		,{field:'username', title: '账号'} 
		// ,{field:'xm', title: '姓名'}
		,{field:'sum_m', title: '下注金额',totalRow: true}
		,{field:'user_ds',title:'退水'}
		,{field:'dagu_zc', title: '占成'}
		,{title:'操作',width:150, fixed: 'right',align:'center', toolbar: '#toolbar'}
		]]
		,id: 'tan-table'
		,page: true
		,done: function(res, curr, count){
			laydate.render({
				elem: '#stardate'
				,type: 'date'
				// ,value: new Date()
			}); 

			laydate.render({
				elem: '#enddate'
				,type: 'date'
				// ,value: new Date()
			});
		}
	});

	form.on('submit(LAY-btn-search)',function(data){
		table.reload('tan-table',{
			where:data.field
		})
		return false;
	})

	var tan = function(){}
	e('tan', new tan())
})