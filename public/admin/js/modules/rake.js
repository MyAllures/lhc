;
layui.define(['form','table',], function (e) {
	var s = layui.$,
	l = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin),
	table = layui.table,
	form = layui.form;


	form.on('submit(batch-adjust)',function(data){
		data.field.type = 'adjust';
		s.post('tm.html',data.field,function(r){
			if (!r.code) {
				location.reload();
			}else{
				layer.msg(r.msg);
			}
		})
		return false;
	})

	form.on('submit(batch-set)',function(data){
		data.field.type = 'set';
		s.post('tm.html',data.field,function(r){
			if (!r.code) {
				location.reload();
			}else{
				layer.msg(r.msg);
			}
		})
		return false;
	})

	s('.btn-batch-feng').on('click',function(){
		var val = s(this).data('val');
		s.post('tm.html',{type:'feng',val:val},function(r){
			if (!r.code) {
				location.reload();
			}else{
				layer.msg(r.msg);
			}
		})
	})

	form.on('submit(batch-submit)',function(data){
		data.field.type = 'submit';
		s.post('tm.html',data.field,function(r){
			if (!r.code) {
				location.reload();
			}else{
				layer.msg(r.msg);
			}
		})
		return false;
	})

	/******************正特*****************************/
	form.on('submit(ztm-batch-adjust)',function(data){
		data.field.type = 'adjust';
		s.post('ztm.html',data.field,function(r){
			if (!r.code) {
				location.reload();
			}else{
				layer.msg(r.msg);
			}
		})
		return false;
	})

	form.on('submit(ztm-batch-set)',function(data){
		data.field.type = 'set';
		s.post('ztm.html',data.field,function(r){
			if (!r.code) {
				location.reload();
			}else{
				layer.msg(r.msg);
			}
		})
		return false;
	})

	form.on('submit(ztm-batch-submit)',function(data){
		data.field.type = 'submit';
		s.post('ztm.html',data.field,function(r){
			if (!r.code) {
				location.reload();
			}else{
				layer.msg(r.msg);
			}
		})
		return false;
	})

	/***************正1-6********************/
	s('.btn-all-add').on('click',function(){
		var inputs = s('input.input');
		layui.each(inputs,function(index,item){
			var val = s(item).val();
			val = parseFloat(val) * 100 + 1;
			val = Math.round(val) / 100
			s(item).val(val);
		});
	})

	s('.btn-all-minus').on('click',function(){
		var inputs = s('input.input');
		layui.each(inputs,function(index,item){
			var val = s(item).val();
			val = parseFloat(val) * 100 - 1;
			val = Math.round(val) / 100
			s(item).val(val);
		});
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

	var rake = function(){}
	e('rake',new rake())
})