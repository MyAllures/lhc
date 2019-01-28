<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:60:"D:\www\PHPTutorial\WWW\lhc/app/index\view\bets_lm\index.html";i:1547531616;s:57:"D:\www\PHPTutorial\WWW\lhc\app\index\view\public\top.html";i:1547431222;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>连码</title>
    <script src="/file/lhc_images/jquery.min.js"></script>
    <link rel="stylesheet" href="/file/admin/layui/css/layui.css">
    <script src="/file/admin/layui/layui.js"></script>
    <style>
        .layui-table td, .layui-table th{
            text-align: center;
            font-size: 16px;
        }
        #hid1,#hid2,#hid3,#hid4{
            display: none;
        }
    </style>
    <script>
        $(function(){
            layui.use(['form','layer'],function(){
               var form=layui.form,
                   layer=layui.layer;
               form.on('radio(rad1)',function(data){
                   var value=data.value;
                   $('#hid1').hide();
                   $('#hid2').hide();
                   $('#hid3').hide();
                   $('#hid4').hide();
                   $('[type=checkbox]').removeAttr('disabled');
                   $('[name=dm1],[name=dm2]').val('');
                   if(value==1){
                       $('[type=checkbox]').prop('checked',false);
                   }
                   if(value==2){
                       $('[type=checkbox]').prop('checked',false);
                   }
                   if(value==3){
                       $('[type=checkbox]').attr('disabled','disabled');
                       $('[type=checkbox]').prop('checked',false);
                       $('#hid1').show();
                       $('#hid2').show();
                   }
                   if(value==4){
                       $('[type=checkbox]').attr('disabled','disabled');
                       $('[type=checkbox]').prop('checked',false);
                       $('#hid3').show();
                       $('#hid4').show();
                   }
                   if(value==5){
                       $('[name=pan2]').prop('checked',false);
                       $('[name=pan4]').prop('checked',false);
                       $('[type=checkbox]').attr('disabled','disabled');
                       $('[type=checkbox]').prop('checked',false);
                       $('#hid1').show();
                       $('#hid3').show();
                       form.render('radio','formx');
                   }
                   form.render('checkbox','formx');
               })
               form.on('radio(s1)',function(data){
                  var value1=data.value,
                      value2=$('[name=pan2]:checked').val();
                  if(value1==value2){
                      $('[name=pan2]').prop('checked',false);
                      layer.msg('生肖不能相同',{icon:2});
                  }
                 form.render('radio','formx');
               })
                form.on('radio(s2)',function(data){
                    var value1=data.value,
                        value2=$('[name=pan1]:checked').val();
                    if(value1==value2){
                        $('[name=pan1]').prop('checked',false);
                        layer.msg('生肖不能相同',{icon:2});
                    }
                    form.render('radio','formx');
                })
                form.on('radio(s3)',function(data){
                    var value1=data.value,
                        value2=$('[name=pan4]:checked').val();
                    if(value1==value2){
                        $('[name=pan4]').prop('checked',false);
                        layer.msg('尾数不能相同',{icon:2});
                    }
                    form.render('radio','formx');
                })
                form.on('radio(s4)',function(data){
                    var value1=data.value,
                        value2=$('[name=pan3]:checked').val();
                    if(value1==value2){
                        $('[name=pan3]').prop('checked',false);
                        layer.msg('尾数不能相同',{icon:2});
                    }
                    form.render('radio','formx');
                })
                form.on('checkbox(nx)',function(data){
                  var rtype='<?php echo $type; ?>',
                      value1=$('[name=pabc]:checked').val(),
                      size=$('[type=checkbox]:checked').size();
                  if(value1==2){  //胆拖
                    if(rtype==1){
                        if(size==0){
                            $('[name=dm1]').val('');
                            $('[name=dm2]').val('');
                        }
                        if(size==1){
                            $('[name=dm1]').val($('[type=checkbox]:checked').eq(0).val());
                            $('[name=dm2]').val('');
                        }
                        if(size==2){
                            $('#dm1').val($('[type=checkbox]:checked').eq(0).val());
                            $('#dm2').val($('[type=checkbox]:checked').eq(1).val());
                        }
                    }else if(rtype==2){
                        if(size==0){
                            $('[name=dm1]').val('');
                        }
                        if(size==1){
                            $('[name=dm1]').val($('[type=checkbox]:checked').eq(0).val());
                            // .addClass('layui-disabled');
                        }
                    }
                    form.render();
                  }
                })
            })
        });
    </script>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row" style="background-color: #fff;">
        <div class="layui-col-xs12">
            <form action="<?php echo url('saveLm'); ?>" id="form" method="post" class="layui-form" lay-filter="formx">
                <div class="layui-crad">
                    <div class="top" style="cursor: pointer;border-bottom: 1px solid #f6f6f6;height: 42px;line-height: 42px;padding: 0 15px;"><marquee behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()"><?php echo getConfigField('affice'); ?></marquee></div>
                    <div class="layui-card-header">
                        <?php echo $ids; ?>
                        <span style="padding-left: 40px;">封盘倒计时：<b class="time" style="color: red;font-weight: normal;"></b></span>
                        <div style="float: right;" class="layui-btn-group">
                            <a href="<?php echo url('',['ids'=>'三全中']); ?>" class="layui-btn layui-btn-sm speed">三全中</a>
                            <a href="<?php echo url('',['ids'=>'三中二']); ?>" class="layui-btn layui-btn-sm speed">三中二</a>
                            <a href="<?php echo url('',['ids'=>'二全中']); ?>" class="layui-btn layui-btn-sm speed">二全中</a>
                            <a href="<?php echo url('',['ids'=>'二中特']); ?>" class="layui-btn layui-btn-sm speed">二中特</a>
                            <a href="<?php echo url('',['ids'=>'特串']); ?>" class="layui-btn layui-btn-sm speed">特串</a>
                        </div>
                    </div>
                    <div class="layui-card-body">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th colspan="15"><?php echo $ids; ?></th>
                            </tr>
                            <tr>
                                <td colspan="3"></td>
                                <td colspan="3">中二 <span style="color: blue;"><?php echo round($drop_table[1]['rate'],2); ?></span></td>
                                <th colspan="3"></th>
                                <th colspan="3">中特 <span style="color: blue;"><?php echo round($drop_table[0]['rate'],2); ?></span></th>
                                <th colspan="3"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $__FOR_START_27504__=1;$__FOR_END_27504__=11;for($i=$__FOR_START_27504__;$i < $__FOR_END_27504__;$i+=1){ ?>
                            <tr>
                                <?php if($i == 10): ?>
                                <td class="td<?php echo $i; ?>"><img src="/file/lhc_images/num<?php echo $i; ?>.gif" alt=""></td>
                                <?php else: ?>
                                <td class="td<?php echo $i; ?>"><img src="/file/lhc_images/num0<?php echo $i; ?>.gif" alt=""></td>
                                <?php endif; ?>
                                <td class="td<?php echo $i; ?>"><span id="bl<?php echo $i-1; ?>"> 0 </span></td>
                                <td class="td<?php echo $i; ?>">
                                    <?php if($i < 10): ?>
                                    <input name="num<?php echo $i; ?>" type="checkbox" value="0<?php echo $i; ?>" lay-filter="nx">
                                    <?php else: ?>
                                    <input name="num<?php echo $i; ?>" type="checkbox" value="<?php echo $i; ?>"  lay-filter="nx">
                                    <?php endif; ?>
                                </td>

                                <td class="td<?php echo $i+10; ?>"><img src="/file/lhc_images/num<?php echo $i+10; ?>.gif" alt=""></td>
                                <td class="td<?php echo $i+10; ?>"><span id="bl<?php echo $i+9; ?>"> 0 </span></td>
                                <td class="td<?php echo $i+10; ?>">
                                    <input name="num<?php echo $i+10; ?>" type="checkbox" value="<?php echo $i+10; ?>" lay-filter="nx">
                                </td>

                                <td class="td<?php echo $i+20; ?>"><img src="/file/lhc_images/num<?php echo $i+20; ?>.gif" alt=""></td>
                                <td class="td<?php echo $i+20; ?>"><span id="bl<?php echo $i+19; ?>"> 0 </span></td>
                                <td class="td<?php echo $i+20; ?>">
                                    <input name="num<?php echo $i+20; ?>" type="checkbox" value="<?php echo $i+20; ?>" lay-filter="nx">
                                </td>

                                <td class="td<?php echo $i+30; ?>"><img src="/file/lhc_images/num<?php echo $i+30; ?>.gif" alt=""></td>
                                <td class="td<?php echo $i+30; ?>"><span id="bl<?php echo $i+29; ?>"> 0 </span></td>
                                <td class="td<?php echo $i+30; ?>">
                                    <input name="num<?php echo $i+30; ?>" type="checkbox" value="<?php echo $i+30; ?>" lay-filter="nx">
                                </td>

                                <?php if($i != 10): ?>
                                <td class="td<?php echo $i+40; ?>"><img src="/file/lhc_images/num<?php echo $i+40; ?>.gif" alt=""></td>
                                <td class="td<?php echo $i+40; ?>"><span id="bl<?php echo $i+39; ?>"> 0 </span></td>
                                <td class="td<?php echo $i+40; ?>">
                                    <input name="num<?php echo $i+40; ?>" type="checkbox" value="<?php echo $i+40; ?>" lay-filter="nx">
                                </td>
                                <?php endif; ?>
                            </tr>
                            <?php } ?>
                            <tr>
                                <td colspan="13">
                                    <input name="pabc" type="radio" class="tit" value="1" checked  title="正常" lay-filter="rad1">
                                    <input name="pabc" type="radio" class="tit" value="2"   title="胆拖" lay-filter="rad1">
                                    <input name="pabc" type="radio" class="tit" value="3"  title="生肖对碰" disabled lay-filter="rad1">
                                    <input name="pabc" type="radio" class="tit" value="4"  title="尾数对碰" disabled lay-filter="rad1">
                                    <input name="pabc" type="radio" class="tit" value="5"  title="肖串尾" disabled lay-filter="rad1">
                                </td>
                                <td>
                                    胆1<input name="dm1" type="text" class="input1 layui-input" id="dm1" size="4" readonly>
                                </td>
                                <td>
                                    胆2<input name="dm2" type="text" class="input1 layui-input" id="dm2" size="4" readonly>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="layui-table" lay-size="sm">
                            <tbody>
                            <tr id="hid1">
                                <?php $__FOR_START_24217__=0;$__FOR_END_24217__=12;for($i=$__FOR_START_24217__;$i < $__FOR_END_24217__;$i+=1){ ?>
                                <td><input type="radio" name="pan1" title="<?php echo $sx[$i]['0']; ?>"  class="s" value="<?php echo $sx[$i][1]; ?>" lay-filter="s1"></td>
                                <?php } ?>
                            </tr>
                            <tr id="hid2">
                                <?php $__FOR_START_19366__=0;$__FOR_END_19366__=12;for($i=$__FOR_START_19366__;$i < $__FOR_END_19366__;$i+=1){ ?>
                                <td><input type="radio" name="pan2" title="<?php echo $sx[$i]['0']; ?>"  class="s1" value="<?php echo $sx[$i][1]; ?>" lay-filter="s2"></td>
                                <?php } ?>
                            </tr>
                            <tr id="hid3">
                                <?php $__FOR_START_27127__=0;$__FOR_END_27127__=10;for($i=$__FOR_START_27127__;$i < $__FOR_END_27127__;$i+=1){ ?>
                                <td><input type="radio" name="pan3" class="s3" value="<?php echo $i; ?>" title="<?php echo $i; ?>尾" lay-filter="s3"></td>
                                <?php } ?>
                            </tr>
                            <tr id="hid4">
                                <?php $__FOR_START_7148__=0;$__FOR_END_7148__=10;for($i=$__FOR_START_7148__;$i < $__FOR_END_7148__;$i+=1){ ?>
                                <td><input type="radio" name="pan4"  class="s4" value="<?php echo $i; ?>" title="<?php echo $i; ?>尾" lay-filter="s4"></td>
                                <?php } ?>
                            </tr>
                            <tr><td colspan="12" align="center">
                                <input type="hidden" name="xc" value="<?php echo $xc; ?>">
                                <input type="hidden" name="rtype" value="<?php echo $ids; ?>">
                                <div class="layui-inline" style="margin-right: 15px;">
                                    <label>下注金额：</label>
                                    <div class="layui-input-inline"  style="width: 100px;" >
                                        <input type="text" name="jq" class="input1 layui-input"placeholder="￥">
                                    </div>
                                </div>
                                <input type="submit" class="layui-btn layui-btn-sm" value="提交">
                                <input type="reset" class="layui-btn layui-btn-sm layui-btn-primary" value="重设">
                            </td>
                            </tr>
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
    //生肖显示与隐藏
    <?php if($type == '2'): ?>
        $('[name=pabc]').removeAttr('disabled');
    <?php endif; ?>

    //表单样式
    $('.layui-table td').hover(function () {
        var className=$(this).attr('class');
        $('.'+className).css({'background-color':'#f2f2f2'});
    },function () {
        var className=$(this).attr('class');
        $('.'+className).removeAttr('style');
    });

    layui.use(['layer','form'],function(){
       var layer=layui.layer,
           form=layui.form;
        $('[name=jq]').blur(function(){
            var re = /^[0-9]+\.?[0-9]*$/,
                value=$(this).val();
            if(!re.test(value) && value!=''){
                layer.msg('下注金额仅能输入数字',{icon:2});
                $(this).val('0');
            }
            if($(this).val()==''){
                value=0;
            }
            if ( (value < <?php echo getMemField('xy'); ?>) && (value!='')) {$(this).val('0');$(this).focus();  layer.msg("下注金额不可小於最低限度:<?php echo getMemField('xy'); ?>!!",{icon:2}); return false;}
            if (value > <?php echo getQuotaField($xc,'xx'); ?>) {$(this).val('0');$(this).focus(); layer.msg("对不起,下注金额已超过单注限额 : <?php echo getQuotaField($xc,'xx'); ?>!!",{icon:2}); return false;}
            if (value > <?php echo getMemField('ts'); ?>)   {$(this).val('0');$(this).focus();  layer.msg("下注金额不可大於可用信用额度!!",{icon:2});    return false;}
        });
        var type_min=0,
            type_max=10;
        <?php if($ids == '三全中' or $ids == '三中二'): ?>
            type_min=3;
        <?php else: ?>
            type_min=2;
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
            var endType=$('[name=pabc]:checked').val();
            console.log(endType);
            if(endType==1 || endType==2){
                var size=$('[type=checkbox]:checked').size();
                if(size >type_max){
                    layer.msg('最多选择'+type_max+'个数字',{icon:2});
                    return false;
                }
                if(size<type_min){
                    layer.msg('最少选择'+type_min+'个数字',{icon:2});
                    return false;
                }
            }else if(endType==3){
                if($('[name=pan1]:checked').size()!=1 || $('[name=pan2]:checked').size()!=1){
                    layer.msg('请选择对应的生肖',{icon:2});
                    return false;
                }
            }else if(endType==4){
                if($('[name=pan3]:checked').size()!=1 || $('[name=pan4]:checked').size()!=1){
                    layer.msg('请选择对应的尾数',{icon:2});
                    return false;
                }
            }else if(endType==5){
                if($('[name=pan1]:checked').size()!=1 || $('[name=pan3]:checked').size()!=1){
                    layer.msg('请选择对应的生肖和尾数',{icon:2});
                    return false;
                }
            }
            layer.open({
                type: 2,
                title: '确认注单',
                shadeClose: false,
                shade: 0.3,
                maxmin: true,
                area: ['700px', '500px'],
                content: '<?php echo url("saveLm"); ?>?'+$('form').serialize()
            });
            return false;
        })
    });


    $.ajax({
        url:'<?php echo url('bets_tm/server'); ?>',
        type:'post',
        data:{
                    class1:'连码',
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