<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:61:"D:\www\PHPTutorial\WWW\lhc/app/index\view\bets_wbz\index.html";i:1547431351;s:57:"D:\www\PHPTutorial\WWW\lhc\app\index\view\public\top.html";i:1547431222;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>五不中</title>
    <script src="/file/lhc_images/jquery.min.js"></script>
    <link rel="stylesheet" href="/file/admin/layui/css/layui.css">
    <script src="/file/admin/layui/layui.js"></script>
    <style>
        .layui-table td, .layui-table th{
            text-align: center;
            font-size: 16px;
        }
    </style>

</head>
<body>
<div class="layui-fluid">
    <div class="layui-row"  style="background-color: #fff;">
        <div class="layui-col-xs12">
            <form action="<?php echo url('saveWbz'); ?>" id="form" method="post" class="layui-form">
                <div class="layui-crad">
                    <div class="top" style="cursor: pointer;border-bottom: 1px solid #f6f6f6;height: 42px;line-height: 42px;padding: 0 15px;"><marquee behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()"><?php echo getConfigField('affice'); ?></marquee></div>
                    <div class="layui-card-header">
                        <?php echo $ids; ?>
                        <span style="padding-left: 40px;">距离封盘时间：<b class="time" style="color: red;font-weight: normal;"></b></span>
                        <div style="float: right;" class="layui-btn-group">
                            <a href="<?php echo url(''); ?>?ids=五不中" class="layui-btn layui-btn-sm speed">五不中</a>
                            <a href="<?php echo url(''); ?>?ids=六不中" class="layui-btn layui-btn-sm speed">六不中</a>
                            <a href="<?php echo url(''); ?>?ids=七不中" class="layui-btn layui-btn-sm speed">七不中</a>
                            <a href="<?php echo url(''); ?>?ids=八不中" class="layui-btn layui-btn-sm speed">八不中</a>
                            <a href="<?php echo url(''); ?>?ids=九不中" class="layui-btn layui-btn-sm speed">九不中</a>
                            <a href="<?php echo url(''); ?>?ids=十不中" class="layui-btn layui-btn-sm speed">十不中</a>
                            <a href="<?php echo url(''); ?>?ids=十一不中" class="layui-btn layui-btn-sm speed">十一不中</a>
                            <a href="<?php echo url(''); ?>?ids=十二不中" class="layui-btn layui-btn-sm speed">十二不中</a>
                        </div>
                    </div>
                    <div class="layui-card-body">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <input type="hidden" name="type0" value="5"><!--不定量 5 --五不中-->
                                <th colspan="15"><?php echo $ids; ?></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $__FOR_START_10702__=1;$__FOR_END_10702__=11;for($i=$__FOR_START_10702__;$i < $__FOR_END_10702__;$i+=1){ ?>
                            <tr>
                                <?php if($i == 10): ?>
                                <td class="td<?php echo $i; ?>"><img src="/file/lhc_images/num<?php echo $i; ?>.gif" alt=""></td>
                                <?php else: ?>
                                <td class="td<?php echo $i; ?>"><img src="/file/lhc_images/num0<?php echo $i; ?>.gif" alt=""></td>
                                <?php endif; ?>
                                <td class="td<?php echo $i; ?>"><span id="bl<?php echo $i-1; ?>"> 0 </span></td>
                                <td class="td<?php echo $i; ?>">
                                    <?php if($i < 10): ?>
                                    <input name="Num_<?php echo $i; ?>" type="checkbox" value="0<?php echo $i; ?>" sum="<?php echo getTanKitheSum('不中',$ids,$i); ?>">
                                    <?php else: ?>
                                    <input name="Num_<?php echo $i; ?>" type="checkbox" value="<?php echo $i; ?>" sum="<?php echo getTanKitheSum('不中',$ids,$i); ?>">
                                    <?php endif; ?>
                                </td>

                                <td class="td<?php echo $i+10; ?>"><img src="/file/lhc_images/num<?php echo $i+10; ?>.gif" alt=""></td>
                                <td class="td<?php echo $i+10; ?>"><span id="bl<?php echo $i+9; ?>"> 0 </span></td>
                                <td class="td<?php echo $i+10; ?>">
                                    <input name="Num_<?php echo $i+10; ?>" type="checkbox" value="<?php echo $i+10; ?>" sum="<?php echo getTanKitheSum('不中',$ids,$i+10); ?>">
                                </td>

                                <td class="td<?php echo $i+20; ?>"><img src="/file/lhc_images/num<?php echo $i+20; ?>.gif" alt=""></td>
                                <td class="td<?php echo $i+20; ?>"><span id="bl<?php echo $i+19; ?>"> 0 </span></td>
                                <td class="td<?php echo $i+20; ?>">
                                    <input name="Num_<?php echo $i+20; ?>" type="checkbox" value="<?php echo $i+20; ?>" sum="<?php echo getTanKitheSum('不中',$ids,$i+20); ?>">
                                </td>

                                <td class="td<?php echo $i+30; ?>"><img src="/file/lhc_images/num<?php echo $i+30; ?>.gif" alt=""></td>
                                <td class="td<?php echo $i+30; ?>"><span id="bl<?php echo $i+29; ?>"> 0 </span></td>
                                <td class="td<?php echo $i+30; ?>">
                                    <input name="Num_<?php echo $i+30; ?>" type="checkbox" value="<?php echo $i+30; ?>" sum="<?php echo getTanKitheSum('不中',$ids,$i+30); ?>">
                                </td>

                                <?php if($i != 10): ?>
                                <td class="td<?php echo $i+40; ?>"><img src="/file/lhc_images/num<?php echo $i+40; ?>.gif" alt=""></td>
                                <td class="td<?php echo $i+40; ?>"><span id="bl<?php echo $i+39; ?>"> 0 </span></td>
                                <td class="td<?php echo $i+40; ?>">
                                    <input name="Num_<?php echo $i+40; ?>" type="checkbox" value="<?php echo $i+40; ?>" sum="<?php echo getTanKitheSum('不中',$ids,$i+40); ?>">
                                </td>
                                <?php endif; ?>
                            </tr>
                            <?php } ?>
                            <tr><td colspan="15" align="center">
                                <input type="hidden" name="xc" value="<?php echo $xc; ?>">
                                <input type="hidden" name="from_url" value="<?php echo url('index'); ?>?ids=<?php echo $ids; ?>">
                                <input type="hidden" name="rtype" value="<?php echo $ids; ?>">

                                <div class="layui-inline" style="margin: 0px 5px;">
                                    <label class="">下注金额:</label>
                                    <div class="layui-input-inline" style="width: 100px;">
                                        <input type="text" name="jq" class="input1 layui-input" placeholder="￥">
                                    </div>
                                </div>


                                <input type="submit" class="layui-btn layui-btn-sm" value="提交">
                                <input type="reset" class="layui-btn layui-btn-sm layui-btn-primary" value="重设">
                            </td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    layui.use(['layer','form'],function() {
        var layer = layui.layer,
            form=layui.form;
        //表格点击
        $('.layui-table td').hover(function () {
            var className=$(this).attr('class');
            $('.'+className).css({'background-color':'#f2f2f2'});
        },function () {
            var className=$(this).attr('class');
            $('.'+className).removeAttr('style');
        });

        function cs1(){
            $('.layui-table td').click(function () {
                var className=$(this).attr('class');
                var div=$(this).find('div').html();
                if(div==undefined){
                    if($('.'+className).find('div').hasClass('layui-form-checked')==true){
                        $('.'+className).find('div').removeClass('layui-form-checked');
                        $('.'+className).find('[type=checkbox]').removeAttr('checked');
                    }else{
                        $('.'+className).find('div').addClass('layui-form-checked');
                        $('.'+className).find('[type=checkbox]').attr('checked','checked');
                    }
                }
            })
        }


        $('[name=jq]').blur(function(){
            var re = /^[0-9]+\.?[0-9]*$/,
                value=$(this).val(),
                sum=parseFloat($(this).attr('sum'));
            if(!re.test(value) && value!=''){
                layer.msg('下注金额仅能输入数字',{icon:2});
                $(this).val('0');
            }
            if($(this).val()==''){
                value=0;
            }
            if ( (value < <?php echo getMemField('xy'); ?>) && (value!='')) {$(this).val('0');$(this).focus();  layer.msg("下注金额不可小於最低限度:<?php echo getMemField('xy'); ?>!!",{icon:2}); return false;}
            if (parseFloat(sum+value) > <?php echo getQuotaField($xc,'xxx'); ?>) {$(this).val('0'); $(this).focus(); layer.msg("对不起,号止本期下注金额最高限制 : <?php echo getQuotaField($xc,'xxx'); ?>!!",{icon:2}); return false;}
            if (value > <?php echo getQuotaField($xc,'xx'); ?>) {$(this).val('0');$(this).focus(); layer.msg("对不起,下注金额已超过单注限额 : <?php echo getQuotaField($xc,'xx'); ?>!!",{icon:2}); return false;}
            if (value > <?php echo getMemField('ts'); ?>)   {$(this).val('0');$(this).focus();  layer.msg("下注金额不可大於可用信用额度!!",{icon:2});    return false;}
        });


        //获取当前可选的复选框的数量
        <?php if($ids == '五不中'): ?>
        var	 type_max = 10;
        var	 type_min = 5;
        var  mess2 =  '最多选择10个数字';
        var  mess =  '最少选择5个数字';
        <?php elseif($ids == '六不中'): ?>
        var	 type_max = 10;
        var	 type_min = 6;
        var  mess2 =  '最多选择10个数字';
        var  mess =  '最少选择6个数字';
        <?php elseif($ids == '七不中'): ?>
        var	 type_max = 10;
        var	 type_min = 7;
        var  mess2 =  '最多选择10个数字';
        var  mess =  '最少选择7个数字';
        <?php elseif($ids == '八不中'): ?>
        var	 type_max = 10;
        var	 type_min = 8;
        var  mess2 =  '最多选择10个数字';
        var  mess =  '最少选择8个数字';
        <?php elseif($ids == '九不中'): ?>
        var	 type_max = 11;
        var	 type_min = 9;
        var  mess2 =  '最多选择11个数字';
        var  mess =  '最少选择9个数字';
        <?php elseif($ids == '十不中'): ?>
        var	 type_max = 12;
        var	 type_min = 10;
        var  mess2 =  '最多选择12个数字';
        var  mess =  '最少选择10个数字';
        <?php elseif($ids == '十一不中'): ?>
        var	 type_max = 13;
        var	 type_min = 11;
        var  mess2 =  '最多选择13个数字';
        var  mess =  '最少选择11个数字';
        <?php elseif($ids == '十二不中'): ?>
        var	 type_max = 14;
        var	 type_min = 12;
        var  mess2 =  '最多选择14个数字';
        var  mess =  '最少选择12个数字';
        <?php endif; ?>

        $('form').submit(function(){
            var re = /^[0-9]+\.?[0-9]*$/;
            var value=$('[name=jq]').val();
            if($.trim(value)==''){
                layer.msg('请输入下注金额',{icon:2});
                return false;
            }
            if(!re.test(value) && value!=''){
                layer.msg('下注金额不正确！',{icon:2});
                $(this).val('0');
                return false;
            }
            if(parseFloat(value)><?php echo getMemField('ts'); ?>){
                layer.msg('余额不足',{icon:2});
                return false;
            }
            if(parseFloat(value)<<?php echo getMemField('xy'); ?>){
                layer.msg('下注金额不可小於最低限度:<?php echo getMemField("xy"); ?>!!',{icon:2});
                return false;
            }
            if(parseFloat(value)><?php echo getQuotaField($xc,'xx'); ?>){
                layer.msg('对不起,下注金额已超过单注限额 : <?php echo getQuotaField($xc,"xx"); ?>!!',{icon:2});
                return false;
            }

            var size=$('[type=checkbox]:checked').size();
            if(size >type_max){
                layer.msg(mess2,{icon:2});
                return false;
            }
            if(size<type_min){
                layer.msg(mess,{icon:2});
                return false;
            }
            layer.open({
                type: 2,
                title: '确认注单',
                shadeClose: false,
                shade: 0.3,
                maxmin: true,
                area: ['700px', '500px'],
                content: '<?php echo url("saveWbz"); ?>?'+$('form').serialize()
            });
            return false;
        });
    });

    $.ajax({
        url:'<?php echo url('bets_tm/server'); ?>',
        type:'post',
        data:{
            class1:'不中',
            class2:'<?php echo $ids; ?>'
        },
        dataType:'json',
        success:function (response,status,xhr) {
            if(response!=''){
                for (var i=0;i<49;i++){
                    var  num1 = response[i][0]; //字段num1的值
                    var  num2 = response[i][1]; //字段num2的值
                    var num3 = response[i][2]; //字段num1的值
                    var num4 = response[i][3]; //字段num2的值
                    var num5 = response[i][4]; //字段num2的值
                    var num6 = response[i][5];
                    if(num6==1){
                        $('[name=Num_'+(i+1)+']').attr('disabled','disabled');
                    }
                    if(num6==1){
                        $('#bl'+(i)).html('停');
                    }else{
                        var bb='<?php echo $mem['abcd']; ?>';
                        switch (bb) {
                            case 'A':
                                if(num2!=num3){
                                    $('#bl'+(i)).html(num2).css({color:'red','font-weight':'bolder'});
                                }else{
                                    $('#bl'+(i)).html(num2).css({color:'red','font-weight':'bolder'});
                                }
                                break;
                            case 'B':
                                if(i<49){
                                    var value=parseFloat(num2*100-<?php echo $bzx*100; ?>)/100;
                                    if(num2!=num3){
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }else{
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }
                                }else{
                                    if(num2!=num3){
                                        var value=parseFloat(num2*100-<?php echo $bzxdx*100; ?>)/100;
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }else{
                                        var value=parseFloat(num2*100-<?php echo $bzx*100; ?>)/100;
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }
                                }
                                break;
                            case 'C':
                                if(i<49){
                                    var value=parseFloat(num2*100-<?php echo $czx*100; ?>)/100;
                                    if(num2!=num3){
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }else{
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }
                                }else{
                                    if(num2!=num3){
                                        var value=parseFloat(num2*100-<?php echo $czxdx*100; ?>)/100;
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }else{
                                        var value=parseFloat(num2*100-<?php echo $czx*100; ?>)/100;
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }
                                }
                                break;
                            case 'D':
                                if(i<49){
                                    var value=parseFloat(num2*100-<?php echo $dzx*100; ?>)/100;
                                    if(num2!=num3){
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }else{
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }
                                }else{
                                    if(num2!=num3){
                                        var value=parseFloat(num2*100-<?php echo $dzxdx*100; ?>)/100;
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }else{
                                        var value=parseFloat(num2*100-<?php echo $dzx*100; ?>)/100;
                                        $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                    }
                                }
                                break;
                        }
                    }
                }
            }
        }
    })

    //计算倒计时
    var time=parseInt(<?php echo strtotime(getKithe(14))-time(); ?>);
    countDown(time);
    //带天数的倒计时
    function countDown(times){
        var timer=null;
        timer=setInterval(function(){
            var day=0,
                hour=0,
                minute=0,
                second=0;//时间默认值
            if(times > 0){
                day = Math.floor(times / (60 * 60 * 24));
                hour = Math.floor(times / (60 * 60)) - (day * 24);
                minute = Math.floor(times / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(times) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (day <= 9) day = '0' + day;
            if (hour <= 9) hour = '0' + hour;
            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            //console.log();
            $('.time').html(day+"天"+hour+"小时"+minute+"分钟&nbsp;&nbsp;"+second+"秒");
            times--;
        },1000);
        if(times<=0){
            clearInterval(timer);
        }
    }

</script>