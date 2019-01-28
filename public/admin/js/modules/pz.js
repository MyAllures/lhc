;
layui.define(['form','table','util'], function (e) {
	var s = layui.$,
	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	table = layui.table,
	form = layui.form,
	util = layui.util;
	
	table.render({
	    elem:'#tan-table'
	    ,url:'loadtan.html'
	    ,where:{
	    	nn:s('input[name=nn]').val(),
	    	class1:s('input[name=class1]').val(),
	    	class2:s('input[name=class2]').val(),
	    	class3:s('input[name=class3]').val()
	    }
	    ,toolbar:'#topToolbar'
	    ,cellMinWidth: 80
	    ,totalRow: true
	    ,cols: [[
	      {field:'num', title: '单号',totalRowText:'小计'}
	      ,{field:'adddate', title: '下单时间'}
	      ,{field:'kithe', title: '期数'}
	      ,{field:'username', title: '会员'}
	      ,{field:'abcd',title:'盘类'}
	      ,{field:'rate',title:'赔率'}
	      ,{field:'sum_m',title:'下注总额',totalRow: true}
	      ,{field:'user_ds',title:'退水'}
	      ,{field:'sum_m3',title:'可赢金额',totalRow: true}
	      ,{field:'dagu_zc',title:'占成'}
	    ]]
	    ,id: 'tan-table'
	    ,page: true
	});

	form.on('submit(LAY-zoufei)',function(data){
		s.post('zoufei.html',data.field,function(r){
			
		})
		return false;
	})

	form.on('submit(batch-submit)',function(data){
		var qc = '';
		var checkboxs = s('input[lay-filter=layTableChoose]');
		layui.each(checkboxs,function(index,item){
			if (item.checked) {
				if (qc == '') {
					qc = s(item).val()
				}else{
					qc += ',' +s(item).val();
				}
			}
		})
		if (qc == '') {
			layer.msg('请选择补货号码');
			return false;
		}
		layer.open({
			type: 2,
			title: '补货',
			shadeClose: true,
			shade: true,
			area: ['50%', '80%'],
			content: 'backout.html?qc='+qc
		});
		return false;
	})

	form.on('submit(LAY-backout-add)',function(data){
		s.post('backout.html',data.field,function(r){
			if (!r.code) {
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭
				parent.location.reload();
			}else{
				layer.msg(r.msg);
			}
		});
		return false;
	})

	/*******************公用*********************/
	s('.btn-add').on('click',function(){
		var dvalue = s('input[name=dvalue]').val();
		var input = s(this).next("div").find(".input");
		var val = s(input).val();
		val = parseFloat(val) * 100 + parseFloat(dvalue) * 100;
		val = Math.round(val) / 100
		s(input).val(val);
	})

	s('.btn-minus').on('click',function(){
		var dvalue = s('input[name=dvalue]').val();
		var input = s(this).prev("div").find('.input');
		var val = s(input).val();
		val = parseFloat(val) * 100 - parseFloat(dvalue) * 100;;
		val = Math.round(val) / 100
		s(input).val(val);
	})

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

	var pz = function(){
		pz.prototype.countdown()
		// document.oncontextmenu = function() {
		//     return false;
		// }
	}
	pz.prototype.countdown = function() {
		var nd = s('.endtime').data('nd');
		nd = parseInt(nd) * 1000;
		var serverTime = new Date().getTime();
		util.countdown(nd, serverTime, function(date, serverTime, timer){
			var str = date[0] + '天' + date[1] + '时' +  date[2] + '分' + date[3] + '秒';
			s('.endtime').html('距离开盘时间还有：'+ str);
		});
	}
	pz.prototype.showdetail = function(class1,class2,class3) {
		var title = '[';
		if (class1 == '特码' || class1 == '正码') {
			title += class1 + ':' + class3;
		}else{
			title += class1 + '/' + class2 +':' + class3;
		}
		title += ']下注明细';
		var nn = s('input[name=nn]').val();
		layer.open({
			type: 2,
			title: title,
			shadeClose: true,
			shade: true,
			area: ['80%', '80%'],
			content: '/admin/pz/detail.html?nn='+nn+'&class1='+class1+'&class2='+class2+'&class3='+class3+'&lx=0'
		});
	};
	e('pz', new pz())
})