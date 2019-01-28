<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:60:"D:\www\PHPTutorial\WWW\lhc/app/index\view\bets_lx\index.html";i:1547431475;s:57:"D:\www\PHPTutorial\WWW\lhc\app\index\view\public\top.html";i:1547431222;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>连肖</title>
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
<div class="layui-fluid">
    <div class="layui-row" style="background-color: #fff;">
        <div class="layui-col-xs12">
            <form action="<?php echo url('saveLx'); ?>" id="form" method="post" class="layui-form">
                <div class="layui-crad">
                    <div class="top" style="cursor: pointer;border-bottom: 1px solid #f6f6f6;height: 42px;line-height: 42px;padding: 0 15px;"><marquee behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()"><?php echo getConfigField('affice'); ?></marquee></div>
                    <div class="layui-card-header">
                        <input type="hidden" name="class2" value="<?php echo $ids; ?>">
                        <?php echo $ids; ?>
                        <span style="padding-left: 40px;">封盘倒计时：<b class="time" style="color: red;font-weight: normal;"></b></span>

                        <div style="float: right;" class="layui-btn-group">
                            <a href="<?php echo url(''); ?>?ids=二肖连中" class="layui-btn layui-btn-sm speed">二肖连中</a>
                            <a href="<?php echo url(''); ?>?ids=三肖连中" class="layui-btn layui-btn-sm speed">三肖连中</a>
                            <a href="<?php echo url(''); ?>?ids=四肖连中" class="layui-btn layui-btn-sm speed">四肖连中</a>
                            <a href="<?php echo url(''); ?>?ids=五肖连中" class="layui-btn layui-btn-sm speed">五肖连中</a>
                            <a href="<?php echo url(''); ?>?ids=二肖连不中" class="layui-btn layui-btn-sm speed">二肖连不中</a>
                            <a href="<?php echo url(''); ?>?ids=三肖连不中" class="layui-btn layui-btn-sm speed">三肖连不中</a>
                            <a href="<?php echo url(''); ?>?ids=四肖连不中" class="layui-btn layui-btn-sm speed">四肖连不中</a>
                        </div>
                    </div>
                    <div class="layui-card-body">
                        <table class="layui-table">
                            <colgroup>
                                <col width="60">
                                <col width="75">
                                <col width="60">
                                <col width="30%">
                                <col width="60">
                                <col width="75">
                                <col width="60">
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th colspan="8"><?php echo $ids; ?></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $__FOR_START_30825__=0;$__FOR_END_30825__=6;for($i=$__FOR_START_30825__;$i < $__FOR_END_30825__;$i+=1){ ?>
                            <tr>
                                <td class="td<?php echo $i; ?>"><?php echo $result[$i]['class3']; ?></td>
                                <td class="td<?php echo $i; ?>"><span id="bl<?php echo $i; ?>" style="color: red;font-weight: bold;"><?php echo $result[$i]['rate']; ?></span></td>
                                <td class="td<?php echo $i; ?>">
                                    <input name="num<?php echo $i+1; ?>" type="checkbox" value="<?php echo $result[$i]['class3']; ?>">
                                </td>
                                <td class="td<?php echo $i; ?>">
                                    <?php if(is_array($result[$i]['number']) || $result[$i]['number'] instanceof \think\Collection || $result[$i]['number'] instanceof \think\Paginator): if( count($result[$i]['number'])==0 ) : echo "" ;else: foreach($result[$i]['number'] as $key=>$m): ?>
                                    <img src="/file/lhc_images/num<?php echo $m; ?>.gif" alt="">
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
                                </td>
                                <td class="td<?php echo $i+6; ?>"><?php echo $result[$i+6]['class3']; ?></td>
                                <td class="td<?php echo $i+6; ?>"><span id="bl<?php echo $i+6; ?>" style="color: red;font-weight: bold;"><?php echo $result[$i+6]['rate']; ?></span></td>
                                <td class="td<?php echo $i+6; ?>">
                                    <input name="num<?php echo $i+7; ?>" type="checkbox" value="<?php echo $result[$i+6]['class3']; ?>">
                                </td>
                                <td class="td<?php echo $i+6; ?>">
                                    <?php if(is_array($result[$i+6]['number']) || $result[$i+6]['number'] instanceof \think\Collection || $result[$i+6]['number'] instanceof \think\Paginator): if( count($result[$i+6]['number'])==0 ) : echo "" ;else: foreach($result[$i+6]['number'] as $key=>$m1): ?>
                                    <img src="/file/lhc_images/num<?php echo $m1; ?>.gif" alt="">
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
                                </td>
                            </tr>
                            <?php } ?>
                            <tr>
                                <td colspan="8" align="center">
                                    <input type="hidden" name="xc" value="<?php echo $xc; ?>">
                                    <input type="hidden" name="from_url" value="<?php echo url(''); ?>?ids=<?php echo $ids; ?>">
                                    <input type="hidden" value="0" name="gold_all">
                                    <input type="hidden" value="0" name="total_gold">

                                    <div class="layui-inline" style="margin: 0px 5px;">
                                        <label class="">下注金额:</label>
                                        <div class="layui-input-inline" style="width: 100px;">
                                            <input type="text" name="Num_1" class="input1 layui-input" placeholder="￥">
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
    layui.use(['layer','form'],function() {
        var layer = layui.layer;
        $('[name=Num_1]').blur(function(){
            var re = /^[0-9]+\.?[0-9]*$/;
            var value = $(this).val();
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

        //表格点击
        $('.layui-table td').hover(function () {
            var className=$(this).attr('class');
            $('.'+className).css({'background-color':'#f2f2f2'});
        },function () {
            var className=$(this).attr('class');
            $('.'+className).removeAttr('style');
        });


        $('form').submit(function () {
            var re = /^[0-9]+\.?[0-9]*$/;
            var value=$('[name=Num_1]').val();
            if($.trim(value)==''){
                layer.msg('请输入下注金额！',{icon:2});
                return false;
            }
            if(!re.test(value) && value!=''){
                layer.msg('下注金额仅能输入数字！',{icon:2});
                return false;
            }
            if(parseFloat(value)<=<?php echo getMemField('xy'); ?>){
                layer.msg('下注金额不能小于<?php echo getMemField('xy'); ?>！',{icon:2});
                return false;
            }
            if (parseFloat(value) > <?php echo getMemField('ts'); ?>)   {
                layer.msg('下注金额不可大於可用信用额度<?php echo getMemField('ts'); ?>',{icon:2});
                return false;
            }
            if (parseFloat(value) > <?php echo getQuotaField($xc,'xx'); ?>) {
                layer.msg("对不起,下注金额已超过单注限额 : <?php echo getQuotaField($xc,'xx'); ?>!!",{icon:2});
                return false;
            }

            var	 type_max = 8;
            <?php if($ids == '二肖连中' or $ids == '二肖连不中'): ?>
            var	 type_min = 2;
            <?php elseif($ids == '三肖连中' or $ids == '三肖连不中'): ?>
            var	 type_min = 3;
            <?php elseif($ids == '四肖连中' or $ids == '四肖连不中'): ?>
            var	 type_min = 4;
            <?php elseif($ids == '五肖连中'): ?>
            var	 type_min = 5;
            <?php endif; ?>
            var size=$('[type=checkbox]:checked').size();
            if(size>type_max || size<type_min){
                layer.msg('请选择'+type_min+'-'+type_max+'个生肖',{icon:2})
                return false;
            }
            layer.open({
                type: 2,
                title: '确认注单',
                shadeClose: false,
                shade: 0.3,
                maxmin: true,
                area: ['700px', '500px'],
                content: '<?php echo url("saveLx"); ?>?'+$('form').serialize()
            });
            return false;
        });
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

</script>