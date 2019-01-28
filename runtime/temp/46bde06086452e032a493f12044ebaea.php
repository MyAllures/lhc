<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:55:"D:\www\PHPTutorial\WWW\lhc/app/index\view\bets\kbb.html";i:1547431587;s:57:"D:\www\PHPTutorial\WWW\lhc\app\index\view\public\top.html";i:1547431222;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>半波</title>
    <script src="/file/lhc_images/jquery.min.js"></script>
    <link rel="stylesheet" href="/file/admin/layui/css/layui.css">
    <script src="/file/admin/layui/layui.js"></script>
    <style>
        .layui-table th{
            text-align: center;
        }
        .layui-table td{
            font-size: 16px;
        }
    </style>
</head>
<body>
<body>
<div class="layui-fluid">
    <div class="layui-row"  style="background-color: #fff;">
        <div class="layui-col-xs12">
            <form method="post" action="<?php echo url('bets/kbbSubmit'); ?>">
                <input type="hidden" name="class2" value="$ids">
                <div class="layui-crad">
                    <div class="top" style="cursor: pointer;border-bottom: 1px solid #f6f6f6;height: 42px;line-height: 42px;padding: 0 15px;"><marquee behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()"><?php echo getConfigField('affice'); ?></marquee></div>
                    <div class="layui-card-header">
                        <b style="color:red;"><?php echo $ids; ?></b>
                        <div class="layui-inline" style="padding: 0 0 0 15px;">封盘时间：  <span style="color: red;"><?php echo getKithe(14); ?></span></div>
                        <div class="layui-inline" style="padding: 0 0 0 15px;">下注金额：  <span id="allgold">0</span></div>
                        <span style="padding-left: 40px;">封盘倒计时：<b class="time" style="color: red;font-weight: normal;"></b></span>
                    </div>
                    <div class="layui-card-body">
                        <table class="layui-table">
                            <colgroup>
                                <col width="80">
                                <col width="75">
                                <col width="90">
                            </colgroup>
                            <thead>
                            <tr>
                                <th colspan="4">半波</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if(is_array($res) || $res instanceof \think\Collection || $res instanceof \think\Paginator): if( count($res)==0 ) : echo "" ;else: $i=0; foreach($res as $key=>$r): ++$i; ?>
                            <tr>
                                <td class="td<?php echo $i; ?>"><?php echo $r['class3']; ?></td>
                                <td class="td<?php echo $i; ?>"><span id="bl<?php echo $r['id']; ?>" style="color: red;font-weight: bold;"> 0 </span></td>
                                <td class="td<?php echo $i; ?>">
                                    <input style="width:80px;"  class="input1 layui-input" placeholder="￥" name="Num_<?php echo $i-1+1; ?>" sum="<?php echo getTanKitheSum('半波',$ids,$r['class3']); ?>" id="Num_<?php echo $i-1+1; ?>" />
                                    <input name="class3_<?php echo $i-1+1; ?>" value="<?php echo $r['class3']; ?>" type="hidden" >
                                    <input name="gb<?php echo $i-1+1; ?>" type="hidden"  value="0">
                                    <input name="xr_<?php echo $i-1+1; ?>" type="hidden" id="xr_<?php echo $i-1; ?>" value="0" >
                                    <input name="xrr_<?php echo $i-1+1; ?>" type="hidden"  value="0" ></td>
                                </td>
                                <td class="td<?php echo $i; ?>">
                                    <?php if(is_array($r['m_number']) || $r['m_number'] instanceof \think\Collection || $r['m_number'] instanceof \think\Paginator): if( count($r['m_number'])==0 ) : echo "" ;else: foreach($r['m_number'] as $k=>$m): if($m != 49): ?>
                                    <img src="/file/lhc_images/num<?php echo $m; ?>.gif" />
                                    <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                                </td>
                            </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                            <tr>
                                <td colspan="4" align="center">
                                    <input type="hidden" name="xc" value="<?php echo $xc; ?>">
                                    <input type="hidden" name="from_url" value="<?php echo url('index'); ?>">
                                    <input type=hidden value=0 name="gold_all" id="total_gold">
                                    <input type="submit" class="layui-btn layui-btn-sm" value="提交">
                                    <input type="reset" class="layui-btn layui-btn-sm" value="重设">
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

<script>
    $(function(){
        //远程定时获取指定数据
        function loc(){
            $.ajax({
                url:'<?php echo url('server'); ?>',
                type:'post',
                returnType:'json',
                data:{
                    'class1':'半波',
                    'class2':'<?php echo $ids; ?>'
                },
                success:function(response,status,xhr){
                    for (var i=0;i<18;i++){
                        var sbbn=i+1;
                        if(response[i].locked==1){
                            $('#bl'+response[i]['id']).html('停');
                            $('#bl'+response[i]['id']).parent().next().find('.input1').attr({disabled:true}).css('background','#F1F1F1');
                        }else{
                            switch('<?php echo $abcd; ?>'){
                                case 'A':
                                    if(response[i]['rate']!=response[i]['blrate']){
                                        $('#bl'+response[i]['id']).html('<SPAN STYLE=\'background-color:ffff00;WIDTH: 100%;height:25px;vertical-align:middle;\' ><span style=\'display:inline-block;height:100%;vertical-align:middle;\'></span><font color=ff0000><b>'+response[i]['rate']+'</b></font></span>');
                                    }else{
                                        $('#bl'+response[i]['id']).html(response[i]['rate']);
                                    }
                                    break;
                                case 'B':
                                    if(response[i]['rate']!=response[i]['blrate']){
                                        var bs=eval(Math.round(response[i]['rate']*100)+"-<?php echo getConfigField('bbb')*100; ?>")/100;
                                        $('#bl'+response[i]['id']).html("<span style='background-color:ffff00;WIDTH: 100%;height:25px;vertical-align:middle;' ><span style='display:inline-block;height:100%;vertical-align:middle;'></span><font color=ff0000><b>"+bs+"</b></font></span>");
                                    }else{
                                        var bs=eval(Math.round(response[i]['rate']*100)+"-<?php echo getConfigField('bbb')*100; ?>")/100;
                                        $('#bl'+response[i]['id']).html(bs);
                                    }
                                    break;
                                case 'C':
                                    if(response[i]['rate']!=response[i]['blrate']){
                                        var bs=eval(Math.round(response[i]['rate']*100)+"-<?php echo getConfigField('cbb')*100; ?>")/100;
                                        $('#bl'+response[i]['id']).html("<span style='background-color:ffff00;WIDTH: 100%;height:25px;vertical-align:middle;' ><span style='display:inline-block;height:100%;vertical-align:middle;'></span><font color=ff0000><b>"+bs+"</b></font></span>");
                                    }else{
                                        var bs=eval(Math.round(response[i]['rate']*100)+"-<?php echo getConfigField('cbb')*100; ?>")/100;
                                        $('#bl'+response[i]['id']).html(bs);
                                    }
                                    break;
                                case 'D':
                                    if(response[i]['rate']!=response[i]['blrate']){
                                        var bs=eval(Math.round(response[i]['rate']*100)+"-<?php echo getConfigField('dbb')*100; ?>")/100;
                                        $('#bl'+response[i]['id']).html("<span style='background-color:ffff00;WIDTH: 100%;height:25px;vertical-align:middle;' ><span style='display:inline-block;height:100%;vertical-align:middle;'></span><font color=ff0000><b>"+bs+"</b></font></span>");
                                    }else{
                                        var bs=eval(Math.round(response[i]['rate']*100)+"-<?php echo getConfigField('dbb')*100; ?>")/100;
                                        $('#bl'+response[i]['id']).html(bs);
                                    }
                                    break;
                                default:
                                    if(response[i]['rate']!=response[i]['blrate']){
                                        $('#bl'+response[i]['id']).html('<SPAN STYLE=\'background-color:ffff00;WIDTH: 100%;height:25px;vertical-align:middle;\' ><span style=\'display:inline-block;height:100%;vertical-align:middle;\'></span><font color=ff0000><b>'+response[i]['rate']+'</b></font></span>');
                                    }else{
                                        $('#bl'+response[i]['id']).html(response[i]['rate']);
                                    }
                                    break;
                            }
                        }

                    }
                }
            });
            //定时操作
            setTimeout(loc,<?php echo \think\Config::get('ftime'); ?>);
        }
        loc();      //执行

        //表格点击
        $('.layui-table td').hover(function () {
            var className=$(this).attr('class');
            $('.'+className).css({'background-color':'#f2f2f2'});
        },function () {
            var className=$(this).attr('class');
            $('.'+className).removeAttr('style');
        });

        $('.layui-table td').click(function () {
            var className=$(this).attr('class');
            $('.'+className).find('input').focus();
        })

        //表单焦点判断
        $('.input1').on('blur',function(){
            var re = /^[0-9]+\.?[0-9]*$/;
            var value=$(this).val();
            var sum=parseFloat($(this).attr('sum'));
            if(!re.test(value) && $(this).val()!=''){
                alert('下注金额仅能输入数字');
                $(this).val('0');
                value=0;
            }
            if($(this).val()==''){
                value=0;
            }
            if ( (value < <?php echo getMemField('xy'); ?>) && (value!='')) {$(this).val('0');$(this).focus(); alert("下注金额不可小於最低限度:<?php echo getMemField('xy'); ?>!!"); return false;}

            if (parseFloat(sum+value) > <?php echo getQuotaField($xc,'xxx'); ?>) {$(this).val('0');$(this).focus(); alert("对不起,号止本期下注金额最高限制 : <?php echo getQuotaField($xc,'xxx'); ?>!!"); return false;}

            if (value > <?php echo getQuotaField($xc,'xx'); ?>) {$(this).val('0');$(this).focus(); alert("对不起,下注金额已超过单注限额 : <?php echo getQuotaField($xc,'xx'); ?>!!"); return false;}

            //下注金额的值
            var money = getAllInput();

            if (money > <?php echo getMemField('ts'); ?>)   {$(this).val('0');$(this).focus(); alert("下注金额不可大於可用信用额度!!");    return false;}

            $('#allgold').html(money);
            $('[name=gold_all]').val( $('#allgold').html());
        });
        //计算所有的input表单的值
        function getAllInput(){
            $nums=0;
            for (var i=1;i<=$('.input1').length;i++){
                if($('[name=Num_'+i+']').val()!=''){
                    $nums+=parseFloat($('[name=Num_'+i+']').val());
                }
            }
            return $nums;
        }

        //表单提交
        $('form').submit(function(){
           var sum=parseFloat($('#allgold').html());
            var re = /^[0-9]+\.?[0-9]*$/;
            if(!re.test(sum) && sum!=''){
                alert('下注金额仅能输入数字');
                return false;
            }
           if(sum<=0){
               alert('请输入下注金额!!');
               return false;
           }
            if (sum > <?php echo getMemField('ts'); ?>)   {
                alert("下注金额不可大於可用信用额度!!");
                return false;
            }
            if(sum < <?php echo getMemField('xy'); ?>){
                alert("下注最低限额<?php echo getMemField('xy'); ?>!!");
                return false;
            }
            if (sum > <?php echo getQuotaField($xc,'xx'); ?>) {
                alert("对不起,下注金额已超过单注限额 : <?php echo getQuotaField($xc,'xx'); ?>!!");
                return false;
            }
           // $('#btnSubmit').attr('disabled','disabled');
            layui.use(['layer'],function () {
                var layer=layui.layer;
                layer.open({
                    type: 2,
                    title: '确认注单',
                    shadeClose: false,
                    shade: 0.3,
                    maxmin: true,
                    area: ['700px', '500px'],
                    content: '<?php echo url("bets/kbbSubmit"); ?>?'+$('form').serialize()
                });
            });
            return false;

        });

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
    })


</script>
</body>
</html>