/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */
;
layui.define(['form','table'], function (e) {
	var s = layui.$,
	t = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	table = layui.table,
	form = layui.form;

  // table
  	table.render({
	  	elem:'#charge-table'
	  	,url:'loadcharge.html'
	  	,toolbar:'#toolbar'
	  	,cellMinWidth: 80
	  	,cols: [[
		  	{field:'no', title: '编号'} 
		  	,{field:'value', title: '充值金额'} 
		  	,{field:'coin',title:'当前余额'}
		  	,{field:'state_text',title:'状态'}
	    ]]
	    ,id: 'charge-table'
	    ,page: true
	});

	table.on('toolbar',function(obj){
		switch(obj.event){
			case 'charge':
			location.href = '/agent/finance/addcharge.html'
			break;
		}
	})

	table.render({
	  	elem:'#consume-table'
	  	,url:'loadconsume.html'
	  	,cellMinWidth: 80
	  	,cols: [[
		  	{field:'no', title: '编号'} 
		  	,{field:'value', title: '消费金额'} 
		  	,{field:'coin',title:'当前余额'}
		  	,{field:'state_text',title:'状态'}
		  	,{field:'remark',title:'备注'}
	    ]]
	    ,id: 'consume-table'
	    ,page: true
	});

  	var finance = function(){}
  	finance.prototype.pay = function(id) {
  		s.post('gettaocan.html',{id:id},function(r){
  			if (!r.code) {
  				var data = r.data;
	  			layer.confirm('钻石数量：'+data.number+'<br>金额：<span style="color:#f33;">'+data.price+'</span>元<br>确定充值吗？', {
				  btn: ['确定','取消'] //按钮
				}, function(index){

				});
			}
  		})
  	};
  	e('finance', new finance())
});
