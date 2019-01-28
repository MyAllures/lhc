$(function(){
	$('.login').validate({
		rules:{
			username:{
				required:true,
				rangelength:[1,20],
			},
			password:{
				required:true,
				rangelength:[5,30]
			}
		},
		messages:{
			username:{
				required:'账号不得为空',
				rangelength:'账号长度不正确'
			},
			password:{
				required:'密码不得为空',
				rangelength:'密码长度不正确'
			}
		},
		submitHandler:function(form){
			$('.login').ajaxSubmit({
				url:action,
				type:'POST',
				dataType:'json',
				clearForm : true,
				resetForm : true,
				beforeSubmit:function(){

				},
				success:function(response,status,xhr){
					if(response==1){
						location.href=index;
					}else if(response==-3){
						$('#dia p:nth-child(2)').html('你当前还不是代理');
						$('#dia').dialog('open');
						setTimeout(function(){
							$('#dia').dialog('close');
						},3000);
					}else if(response==-2){
                        $('#dia p:nth-child(2)').html('对不起，该用户已被禁止');
                        $('#dia').dialog('open');
                        setTimeout(function(){
                            $('#dia').dialog('close');
                        },3000);
					}else if(response==-10){
                        location.href=look;
                    }else if(response==-5){
                        $('#dia p:nth-child(2)').html('对不起，该上级用户已被禁止,有问题请联系你上级!');
                        $('#dia').dialog('open');
                        setTimeout(function(){
                            $('#dia').dialog('close');
                        },3000);
					}else{
						$('#dia').dialog('open');
						setTimeout(function(){
							$('#dia').dialog('close');
						},3000);
					}
				},
				error:function(event,errorText,errorType){

				}
			});
		},
		errorClass : 'error_list',
		highlight:function(element){

		},
		unhighlight:function(element){

		}
	});

	$('#dia').dialog({
		modal:true,
		width:210,
		height:120,
		resizable:false,
		autoOpen:false
	}).prev().hide();
	$('#dia .del').click(function(){
		$('#dia').dialog('close');
	})
})