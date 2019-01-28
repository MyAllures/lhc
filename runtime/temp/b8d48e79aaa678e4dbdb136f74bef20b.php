<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:60:"D:\www\PHPTutorial\WWW\lhc/app/index\view\bets_tm\index.html";i:1548641081;s:57:"D:\www\PHPTutorial\WWW\lhc\app\index\view\public\top.html";i:1547431222;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>特码</title>
    <script src="/file/lhc_images/jquery.min.js"></script>
    <link rel="stylesheet" href="/file/admin/layui/css/layui.css">
    <script src="/file/admin/layui/layui.js"></script>
    <style>
        .ck{
            background-color: green;
            color: #fff;
        }
        .tpa a{
           margin-right: 3px;
        }
        .layui-table td{
            font-size: 16px;
        }
    </style>
</head>
<body class="tbo">
<div class="layui-fluid">
    <div class="layui-row"  style="background-color: #fff;">
        <div class="layui-col-xs12">
            <form action="<?php echo url('bets/kbbSubmit'); ?>" id="form" method="post">
            <input type="hidden" name="class2" value="<?php echo $ids; ?>">
            <div class="layui-crad">
                <div class="top" style="cursor: pointer;border-bottom: 1px solid #f6f6f6;height: 42px;line-height: 42px;padding: 0 15px;"><marquee behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()"><?php echo getConfigField('affice'); ?></marquee></div>
                <div class="layui-card-header">
                    <?php echo $ids; ?>下注
                    <div class="layui-inline" style="padding: 0 0 0 15px;">下注金额：  <span id="allgold">0</span></div>
                        <span style="padding-left: 40px;">距离封盘时间：<b class="time" style="color: red;font-weight: normal;"></b></span>
                    <div style="float: right;cursor:pointer;" class="layui-btn-group">
                        <a class="layui-btn layui-btn-sm speed">快速</a>
                        <?php if($mem['tmb'] != 1): ?>
                        <a href="<?php echo url(''); ?>?ids=特A" class="layui-btn  layui-btn-sm">特A</a>
                        <a href="<?php echo url(''); ?>?ids=特B" class="layui-btn  layui-btn-sm">特B</a>
                        <?php endif; ?>
                    </div>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>赔率</th>
                            <th>金额</th>

                            <th>序号</th>
                            <th>赔率</th>
                            <th>金额</th>

                            <th>序号</th>
                            <th>赔率</th>
                            <th>金额</th>

                            <th>序号</th>
                            <th>赔率</th>
                            <th>金额</th>

                            <th>序号</th>
                            <th>赔率</th>
                            <th>金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php $__FOR_START_27573__=1;$__FOR_END_27573__=11;for($i=$__FOR_START_27573__;$i < $__FOR_END_27573__;$i+=1){ ?>
                        <tr>
                            <?php if($i == 10): ?>
                            <td class="td<?php echo $i; ?>"><img src="/file/lhc_images/num<?php echo $i; ?>.gif" alt=""></td>
                            <?php else: ?>
                            <td class="td<?php echo $i; ?>"><img src="/file/lhc_images/num0<?php echo $i; ?>.gif" alt=""></td>
                            <?php endif; ?>
                            <td class="td<?php echo $i; ?>"><span id="bl<?php echo $i-1; ?>"> 0 </span></td>
                            <td class="td<?php echo $i; ?>">
                                <input type="hidden" name="xc" value="<?php echo $xc; ?>" />
                                <input name="Num_<?php echo $i; ?>" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,$i); ?>">
                                <input name="class3_<?php echo $i; ?>" value="<?php echo $i; ?>" type="hidden" >
                                <input name="gb<?php echo $i; ?>" type="hidden"  value="0">
                                <input name="xr_<?php echo $i-1; ?>" type="hidden" id="xr_<?php echo $i-1; ?>" value="0" >
                                <input name="xrr_<?php echo $i; ?>" type="hidden"  value="0" >
                            </td>

                            <td class="td<?php echo $i+10; ?>"><img src="/file/lhc_images/num<?php echo $i+10; ?>.gif" alt=""></td>
                            <td class="td<?php echo $i+10; ?>"><span id="bl<?php echo $i+9; ?>"> 0 </span></td>
                            <td class="td<?php echo $i+10; ?>">
                                <input name="Num_<?php echo $i+10; ?>" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,$i+10); ?>">
                                <input name="class3_<?php echo $i+10; ?>" value="<?php echo $i+10; ?>" type="hidden" > <!--号码数-->
                                <input name="gb<?php echo $i+10; ?>" type="hidden"  value="0">
                                <input name="xr_<?php echo $i+9; ?>" type="hidden" id="xr_<?php echo $i+9; ?>" value="0" >
                                <input name="xrr_<?php echo $i+10; ?>" type="hidden"  value="0" >
                            </td>

                            <td class="td<?php echo $i+20; ?>"><img src="/file/lhc_images/num<?php echo $i+20; ?>.gif" alt=""></td>
                            <td class="td<?php echo $i+20; ?>"><span id="bl<?php echo $i+19; ?>"> 0 </span></td>
                            <td class="td<?php echo $i+20; ?>">
                                <input name="Num_<?php echo $i+20; ?>" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,$i+20); ?>">
                                <input name="class3_<?php echo $i+20; ?>" value="<?php echo $i+20; ?>" type="hidden" >
                                <input name="gb<?php echo $i+20; ?>" type="hidden"  value="0">
                                <input name="xr_<?php echo $i+19; ?>" type="hidden" id="xr_<?php echo $i+19; ?>" value="0" >
                                <input name="xrr_<?php echo $i+20; ?>" type="hidden"  value="0" >
                            </td>

                            <td class="td<?php echo $i+30; ?>"><img src="/file/lhc_images/num<?php echo $i+30; ?>.gif" alt=""></td>
                            <td class="td<?php echo $i+30; ?>"><span id="bl<?php echo $i+29; ?>"> 0 </span></td>
                            <td class="td<?php echo $i+30; ?>">
                                <input name="Num_<?php echo $i+30; ?>" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,$i+30); ?>">
                                <input name="class3_<?php echo $i+30; ?>" value="<?php echo $i+30; ?>" type="hidden" >
                                <input name="gb<?php echo $i+30; ?>" type="hidden"  value="0">
                                <input name="xr_<?php echo $i+29; ?>" type="hidden" id="xr_<?php echo $i+29; ?>" value="0" >
                                <input name="xrr_<?php echo $i+30; ?>" type="hidden"  value="0" >
                            </td>

                            <?php if($i != 10): ?>
                            <td class="td<?php echo $i+40; ?>"><img src="/file/lhc_images/num<?php echo $i+40; ?>.gif" alt=""></td>
                            <td class="td<?php echo $i+40; ?>"><span id="bl<?php echo $i+39; ?>"> 0 </span></td>
                            <td class="td<?php echo $i+40; ?>">
                                <input name="Num_<?php echo $i+40; ?>" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,$i+40); ?>">
                                <input name="class3_<?php echo $i+40; ?>" value="<?php echo $i+40; ?>" type="hidden" >
                                <input name="gb<?php echo $i+40; ?>" type="hidden"  value="0">
                                <input name="xr_<?php echo $i+39; ?>" type="hidden" id="xr_<?php echo $i+39; ?>" value="0" >
                                <input name="xrr_<?php echo $i+40; ?>" type="hidden"  value="0" >
                            </td>
                            <?php endif; ?>

                        </tr>
                        <?php } $__FOR_START_64__=1;$__FOR_END_64__=61;for($i=$__FOR_START_64__;$i < $__FOR_END_64__;$i+=1){ ?>
                        <input name="xhao_<?php echo $i; ?>" type="hidden" id="xhao_<?php echo $i; ?>" value="0" />
                        <?php } ?>
                        <tr>
                            <td class="td50">单</td>
                            <td class="td50"><span id="bl49">0</span></td>
                            <td class="td50">
                                <input name="Num_50" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,50); ?>">
                                <input name="gb50" value="0" type="hidden">
                                <input name="class3_50" value="单" type="hidden" >
                            </td>

                            <td class="td52">大</td>
                            <td class="td52"><span id="bl51">0</span></td>
                            <td class="td52">
                                <input name="Num_52" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,52); ?>">
                                <input name="gb52" value="0" type="hidden">
                                <input name="class3_52" value="大" type="hidden" >
                            </td>

                            <td class="td54">合单</td>
                            <td class="td54"><span id="bl53">0</span></td>
                            <td class="td54">
                                <input name="Num_54" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,54); ?>">
                                <input name="gb54" value="0" type="hidden">
                                <input name="class3_54" value="合单" type="hidden" >
                            </td>

                            <td class="td56">红波</td>
                            <td class="td56"><span id="bl55">0</span></td>
                            <td class="td56">
                                <input name="Num_56" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,56); ?>">
                                <input name="gb56" value="0" type="hidden">
                                <input name="class3_56" value="红波" type="hidden" >
                            </td>

                            <td class="td58">蓝波</td>
                            <td class="td58"><span id="bl57">0</span></td>
                            <td class="td58">
                                <input name="Num_58" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,58); ?>">
                                <input name="gb58" value="0" type="hidden">
                                <input name="class3_58" value="蓝波" type="hidden" >
                            </td>
                        </tr>
                        <tr>
                            <td class="td51">双</td>
                            <td class="td51"><span id="bl50">0</span></td>
                            <td class="td51">
                                <input name="Num_51" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,51); ?>">
                                <input name="gb51" value="0" type="hidden">
                                <input name="class3_51" value="双" type="hidden" >
                            </td>

                            <td class="td53">小</td>
                            <td class="td53"><span id="bl52">0</span></td>
                            <td class="td53">
                                <input name="Num_53" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,53); ?>">
                                <input name="gb53" value="0" type="hidden">
                                <input name="class3_53" value="小" type="hidden" >
                            </td>

                            <td class="td55">合双</td>
                            <td class="td55"><span id="bl54">0</span></td>
                            <td class="td55">
                                <input name="Num_55" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,55); ?>">
                                <input name="gb55" value="0" type="hidden">
                                <input name="class3_55" value="合双" type="hidden" >
                            </td>

                            <td class="td57">绿波</td>
                            <td class="td57"><span id="bl56">0</span></td>
                            <td class="td57">
                                <input name="Num_57" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,57); ?>">
                                <input name="gb57" value="0" type="hidden">
                                <input name="class3_57" value="绿波" type="hidden" >
                            </td>

                            <td class="td59">家禽</td>
                            <td class="td59"><span id="bl58">0</span></td>
                            <td class="td59">
                                <input name="Num_59" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,59); ?>">
                                <input name="gb59" value="0" type="hidden">
                                <input name="class3_59" value="家禽" type="hidden" >
                            </td>
                        </tr>
                        <tr>
                            <td class="td60">野兽</td>
                            <td class="td60"><span id="bl59">0</span></td>
                            <td class="td60">
                                <input name="Num_60" type="text" class="input1 layui-input" placeholder="￥" style="width: 100px;" sum="<?php echo getTanKitheSum('特码',$ids,60); ?>">
                                <input name="gb60" value="0" type="hidden">
                                <input name="class3_60" value="野兽" type="hidden" >
                            </td>
                            <td colspan="12" align="center">
                                <div class="layui-inline" style=" margin: 0 5px;">
                                    <label style="color: red;">下注金额:</label>
                                    <div class="layui-input-inline" style="width: 100px;">
                                        <input type="text" name="xz" class="input1 layui-input" placeholder="￥">
                                    </div>
                                </div>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-sm bt">转送</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-sm fa">取消</a>
                                <input type="hidden" name="from_url" value="<?php echo url('index'); ?>?ids=<?php echo $ids; ?>">
                                <input type=hidden value=0 name="gold_all" id="total_gold">
                                <input type="submit" class="layui-btn layui-btn-md" value="提交" style="margin-left: 20px;">
                                <input type="reset" class="layui-btn layui-btn-md" value="重设">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="15" class="tpa">
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b1 bx">单</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b2 bx">双</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b3 bx">大</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b4 bx">小</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b5 bx">合单</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b6 bx">合双</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b7 bx">红</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b8 bx">蓝</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b9 bx">绿</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b10 bx">家禽</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs b11 bx">野兽</a>
                                <hr>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c1 bx">大单</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c2 bx">大双</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c3 bx">小单</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c4 bx">小双</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c5 bx">红单</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c6 bx">红双</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c7 bx">红大</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c8 bx">红小</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c9 bx">蓝单</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c10 bx">蓝双</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c11 bx">蓝大</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c12 bx">蓝小</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c13 bx">绿单</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c14 bx">绿双</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c15 bx">绿大</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs c16 bx">绿小</a>
                                <hr>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d1 bx">鼠</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d2 bx">牛</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d3 bx">虎</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d4 bx">兔</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d5 bx">龙</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d6 bx">蛇</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d7 bx">马</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d8 bx">羊</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d9 bx">猴</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d10 bx">鸡</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d11 bx">狗</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d12 bx">猪</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d13 bx">0头</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d14 bx">1头</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d15 bx">2头</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d16 bx">3头</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs d17 bx">4头</a>
                                <hr>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs e1 bx" onclick="weishu(0)">0尾</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs e2 bx" onclick="weishu(1)">1尾</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs e3 bx" onclick="weishu(2)">2尾</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs e4 bx" onclick="weishu(3)">3尾</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs e5 bx" onclick="weishu(4)">4尾</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs e6 bx" onclick="weishu(5)">5尾</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs e7 bx" onclick="weishu(6)">6尾</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs e8 bx" onclick="weishu(7)">7尾</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs e9 bx" onclick="weishu(8)">8尾</a>
                                <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs e10 bx" onclick="weishu(9)">9尾</a>
                            </td>
                        </tr>
                        <!--<tr><td colspan="15" align="center">-->
                        <!--</td></tr>-->
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
    layui.use(['layer'],function(){
        var layer=layui.layer;

        //表单焦点判断
        $('.input1').on('blur',function(){
            var re = /^[0-9]+\.?[0-9]*$/;
            var value=parseFloat($(this).val());
            var sum=parseFloat($(this).attr('sum'));
            if(!re.test($(this).val()) && $(this).val()!=''){
                layer.msg('下注金额仅能输入数字');
                $(this).val('0');
                value=0;
            }
            if($(this).val()==''){
                value=0;
            }
            if ( (value < <?php echo getMemField('xy'); ?>) && (value!='')) {$(this).val('0');$(this).focus(); layer.msg("下注金额不可小於最低限度:<?php echo getMemField('xy'); ?>!!"); return false;}
            if (parseFloat(sum+value) > <?php echo getQuotaField($xc,'xxx'); ?>) {$(this).val('0'); $(this).focus(); layer.msg("对不起,号止本期下注金额最高限制 : <?php echo getQuotaField($xc,'xxx'); ?>!!"); return false;}
            if (value > <?php echo getQuotaField($xc,'xx'); ?>) {$(this).val('0');$(this).focus(); layer.msg("对不起,下注金额已超过单注限额 : <?php echo getQuotaField($xc,'xx'); ?>!!"); return false;}

            //下注金额的值
            var money = getAllInput();

            if (money > <?php echo getMemField('ts'); ?>)   {$(this).val('0');$(this).focus(); layer.msg("下注金额不可大於可用信用额度!!");    return false;}

            $('#allgold').html(money);
            $('[name=gold_all]').val( $('#allgold').html());
        });
        //快速下单
        $('.speed').click(function () {
            var sum=parseFloat($('#allgold').html());
            if(checkAllInput()==false){
                layer.msg('下注金额只能为数字！');
                return false;
            }
            if(sum<=0){
                layer.msg('请输入下注金额!!');
                return false;
            }
            if (sum > <?php echo getMemField('ts'); ?>)   {
                layer.msg("下注金额不可大於可用信用额度!!");
                return false;
            }
            if (sum < <?php echo getMemField('xy'); ?>)   {
                layer.msg("下注最低限额:<?php echo getMemField('xy'); ?>!!");
                return false;
            }
            if (sum > <?php echo getQuotaField($xc,'xx'); ?>) {
                layer.msg("对不起,下注金额已超过单注限额 : <?php echo getQuotaField($xc,'xx'); ?>!!");
                return false;
            }

            $.ajax({
                type:"post",
                data:$('form').serialize(),
                url:"<?php echo url('bets/saveKbb'); ?>",
                success:function(response,status,xhr){
                    layer.open({
                        type: 1, //2
                        title: '确认注单',
                        shadeClose: false,
                        shade: 0.3,
                        maxmin: true,
                        area: ['700px', '500px'],
                        content:response
                    })
                }
            })
            return false;
        });

        //表单提交
        $('#form').submit(function(){
            var sum=parseFloat($('#allgold').html());
            if(checkAllInput()==false){
                layer.msg('下注金额只能为数字！');
                return false;
            }
            if(sum<=0){
                layer.msg('请输入下注金额!!');
                return false;
            }
            if (sum > <?php echo getMemField('ts'); ?>)   {
                layer.msg("下注金额不可大於可用信用额度!!");
                return false;
            }
            if (sum < <?php echo getMemField('xy'); ?>)   {
                layer.msg("下注最低限额:<?php echo getMemField('xy'); ?>!!");
                return false;
            }
            if (sum > <?php echo getQuotaField($xc,'xx'); ?>) {
                layer.msg("对不起,下注金额已超过单注限额 : <?php echo getQuotaField($xc,'xx'); ?>!!");
                return false;
            }

            $.ajax({
                type:"post",
                data:$('form').serialize(),
                url:"<?php echo url('bets/saveKbb'); ?>",
                success:function(response,status,xhr){
                    layer.open({
                        type: 1, //2
                        title: '确认注单',
                        shadeClose: false,
                        shade: 0.3,
                        maxmin: true,
                        area: ['700px', '500px'],
                        content:response
                    })
                }
            })
            return false;
        });



        $.ajax({
            url:'<?php echo url('server'); ?>',
            type:'post',
            data:{
                class1:'特码',
                class2:'<?php echo $ids; ?>'
            },
            dataType:'json',
            success:function (response,status,xhr) {
               if(response!=''){
                   for (var i=0;i<60;i++){
                     var  num1 = response[i][0]; //字段num1的值
                     var  num2 = response[i][1]; //字段num2的值
                     var num3 = response[i][2]; //字段num1的值
                     var num4 = response[i][3]; //字段num2的值
                     var num5 = response[i][4]; //字段num2的值
                     var num6 = response[i][5];
                       if(i<49){
                            $('[name=xr_'+i+']').val(num4);
                           $('[name=xrr_'+(i+1)+']').val(num5);
                        }
                        if(num6==1){
                            $('[name=Num_'+(i+1)+']').attr('disabled','disabled');
                            if(i+1<=49){
                                $('[name=xhao_'+(i+1)+']').val(num6);
                            }
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
                                        var value=parseFloat(num2*100-<?php echo $btm*100; ?>)/100;
                                        if(num2!=num3){
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }else{
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }
                                    }else{
                                        var value=parseFloat(num2*100-<?php echo $btmdx*100; ?>)/100;
                                        if(num2!=num3){
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }else{
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }
                                    }
                                    break;
                                case 'C':
                                    if(i<49){
                                        var value=parseFloat(num2*100-<?php echo $ctm*100; ?>)/100;
                                        if(num2!=num3){
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }else{
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }
                                    }else{
                                        var value=parseFloat(num2*100-<?php echo $ctmdx*100; ?>)/100;
                                        if(num2!=num3){
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }else{
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }
                                    }
                                    break;
                                case 'D':
                                    if(i<49){
                                        var value=parseFloat(num2*100-<?php echo $dtm*100; ?>)/100;
                                        if(num2!=num3){
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }else{
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }
                                    }else{
                                        var value=parseFloat(num2*100-<?php echo $dtmdx*100; ?>)/100;
                                        if(num2!=num3){
                                            $('#bl'+(i)).html(value).css({color:'red','font-weight':'bolder'});
                                        }else{
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
    });
    //表单点击
    $('.layui-table td').hover(function () {
       var className=$(this).attr('class');
       $('.'+className).css({'background-color':'#f2f2f2'});
    },function () {
        var className=$(this).attr('class');
        $('.'+className).removeAttr('style');
    });
    $('.layui-table td').click(function () {
        var value=$('[name=xz]').val();
        var className=$(this).attr('class');
        // console.log(value+'className');
        if(value!=''){
            $('.'+className+' .input1').val(value);
            var money1=getAllInput();
            $('#allgold').html(money1);
            $('[name=gold_all]').val( $('#allgold').html());
        }
    })
    
    $('.bx').click(function () {
        $('.bx').removeClass('ck');
        $(this).addClass('ck');
    })
    //送出
    $('.bt').click(function () {
        var money=$('[name=xz]').val();
        for(var i=0;i<=60;i++){
            if( $('[name=Num_'+i+']').val()=='*'){
                $('[name=Num_'+i+']').val(money);
            }
        }
        var money1=getAllInput();
        $('#allgold').html(money1);
        $('[name=gold_all]').val( $('#allgold').html());
    })

    //取消
    $('.fa').click(function () {
        for(var i=0;i<=60;i++){
            if( $('[name=Num_'+i+']').val()=='*'){
                $('[name=Num_'+i+']').val('');
            }
        }
        var money1=getAllInput();
        $('#allgold').html(money1);
        $('[name=gold_all]').val( $('#allgold').html());
    })

    //计算所有的input表单的值
    function getAllInput(){
        $nums=0;
        //最后一个是不计算的
        for (var i=1;i<=$('.input1').length-1;i++){
            if($('[name=Num_'+i+']').val()!=''){
                $nums+=parseFloat($('[name=Num_'+i+']').val());
            }
        }
        return $nums;
    }

    //验证所有的input表单的值
    function checkAllInput(){
        var re = /^[0-9]+\.?[0-9]*$/;
        for (var i=1;i<=$('.input1').length-1;i++){
            var value1=$('[name=Num_'+i+']').val();
            if(!re.test(value1) && value1!=''){
                return false;
                break;
            }
        }
        return true;
    }

    //单
    $('.b1').click(function () {
        //清空
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i%2==1){
                $('[name=Num_'+i+']').val('*');
            }
        }
    })
    //双
    $('.b2').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i%2==0){
                $('[name=Num_'+i+']').val('*');
            }
        }
    })
    //大
    $('.b3').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i>=25){
                $('[name=Num_'+i+']').val('*');
            }
        }
    })
    //小
    $('.b4').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i<25){
                $('[name=Num_'+i+']').val('*');
            }
        }
    });
    //合单
    $('.b5').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i<10){
                if(i%2==1){
                    $('[name=Num_'+i+']').val('*');
                }
            }else{
                var shi=parseInt(i/10);
                var ge=parseInt(i%10);
                if((shi+ge)%2==1){
                    $('[name=Num_'+i+']').val('*');
                }
            }
        }
    });
    //合双
    $('.b6').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i<10){
                if(i%2==0){
                    $('[name=Num_'+i+']').val('*');
                }
            }else{
                var shi=parseInt(i/10);
                var ge=parseInt(i%10);
                if((shi+ge)%2==0){
                    $('[name=Num_'+i+']').val('*');
                }
            }
        }
    });

    //红
    $('.b7').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 1:
                case 2:
                case 7:
                case 8:
                case 12:
                case 13:
                case 18:
                case 19:
                case 23:
                case 24:
                case 29:
                case 30:
                case 34:
                case 35:
                case 40:
                case 45:
                case 46:
                    $('[name=Num_'+i+']').val('*');
                    break;
            }
        }
    });
    //蓝
    $('.b8').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 3:
                case 4:
                case 9:
                case 10:
                case 14:
                case 15:
                case 20:
                case 25:
                case 26:
                case 31:
                case 36:
                case 37:
                case 41:
                case 42:
                case 47:
                case 48:
                    $('[name=Num_'+i+']').val('*');
                    break;
            }
        }
    })
    //绿
    $('.b9').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 5:
                case 6:
                case 11:
                case 16:
                case 17:
                case 21:
                case 22:
                case 27:
                case 28:
                case 32:
                case 33:
                case 38:
                case 39:
                case 43:
                case 44:
                case 49:
                    $('[name=Num_'+i+']').val('*');
                    break;
            }
        }
    })
    //家禽
    $('.b10').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i<10){
                var s='0'+i;
            }else{
                var s=''+i;
            }
            switch (s) {
                <?php if(is_array($sz[0]) || $sz[0] instanceof \think\Collection || $sz[0] instanceof \think\Paginator): if( count($sz[0])==0 ) : echo "" ;else: foreach($sz[0] as $key=>$j): ?>
                case '<?php echo $j; ?>':
                <?php endforeach; endif; else: echo "" ;endif; ?>
                    $('[name=Num_'+i+']').val('*');
                    break;
            }
        }
    })
    //野兽
    $('.b11').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i<10){
                var s='0'+i;
            }else{
                var s=''+i;
            }
            switch (s) {
                <?php if(is_array($sz[1]) || $sz[1] instanceof \think\Collection || $sz[1] instanceof \think\Paginator): if( count($sz[1])==0 ) : echo "" ;else: foreach($sz[1] as $key=>$j1): ?>
        case '<?php echo $j1; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+i+']').val('*');
                break;
            }
        }
    })

    //大单
    $('.c1').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i>=25 && i%2!=0){
                $('[name=Num_'+i+']').val('*');
            }
        }
    })
    //大双
    $('.c2').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i>=25 && i%2==0){
                $('[name=Num_'+i+']').val('*');
            }
        }
    })
    //小单
    $('.c3').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i<25 && i%2!=0){
                $('[name=Num_'+i+']').val('*');
            }
        }
    })
    //小双
    $('.c4').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            if(i<25 && i%2==0){
                $('[name=Num_'+i+']').val('*');
            }
        }
    })
    //红单
    $('.c5').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 1:
                case 2:
                case 7:
                case 8:
                case 12:
                case 13:
                case 18:
                case 19:
                case 23:
                case 24:
                case 29:
                case 30:
                case 34:
                case 35:
                case 40:
                case 45:
                case 46:
                    if(i%2!=0){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //红双
    $('.c6').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 1:
                case 2:
                case 7:
                case 8:
                case 12:
                case 13:
                case 18:
                case 19:
                case 23:
                case 24:
                case 29:
                case 30:
                case 34:
                case 35:
                case 40:
                case 45:
                case 46:
                    if (i%2==0) {
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //红大
    $('.c7').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 1:
                case 2:
                case 7:
                case 8:
                case 12:
                case 13:
                case 18:
                case 19:
                case 23:
                case 24:
                case 29:
                case 30:
                case 34:
                case 35:
                case 40:
                case 45:
                case 46:
                    if(i>=25){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //红小
    $('.c8').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 1:
                case 2:
                case 7:
                case 8:
                case 12:
                case 13:
                case 18:
                case 19:
                case 23:
                case 24:
                case 29:
                case 30:
                case 34:
                case 35:
                case 40:
                case 45:
                case 46:
                    if(i<25){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //蓝单
    $('.c9').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 3:
                case 4:
                case 9:
                case 10:
                case 14:
                case 15:
                case 20:
                case 25:
                case 26:
                case 31:
                case 36:
                case 37:
                case 41:
                case 42:
                case 47:
                case 48:
                    if(i%2!=0){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //蓝双
    $('.c10').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 3:
                case 4:
                case 9:
                case 10:
                case 14:
                case 15:
                case 20:
                case 25:
                case 26:
                case 31:
                case 36:
                case 37:
                case 41:
                case 42:
                case 47:
                case 48:
                    if(i%2==0){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //蓝大
    $('.c11').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 3:
                case 4:
                case 9:
                case 10:
                case 14:
                case 15:
                case 20:
                case 25:
                case 26:
                case 31:
                case 36:
                case 37:
                case 41:
                case 42:
                case 47:
                case 48:
                    if(i>=25){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //蓝小
    $('.c12').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 3:
                case 4:
                case 9:
                case 10:
                case 14:
                case 15:
                case 20:
                case 25:
                case 26:
                case 31:
                case 36:
                case 37:
                case 41:
                case 42:
                case 47:
                case 48:
                    if(i<25){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //绿单
    $('.c13').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 5:
                case 6:
                case 11:
                case 16:
                case 17:
                case 21:
                case 22:
                case 27:
                case 28:
                case 32:
                case 33:
                case 38:
                case 39:
                case 43:
                case 44:
                case 49:
                    if(i%2!=0){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //绿双
    $('.c14').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 5:
                case 6:
                case 11:
                case 16:
                case 17:
                case 21:
                case 22:
                case 27:
                case 28:
                case 32:
                case 33:
                case 38:
                case 39:
                case 43:
                case 44:
                case 49:
                    if(i%2==0){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //绿大
    $('.c15').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 5:
                case 6:
                case 11:
                case 16:
                case 17:
                case 21:
                case 22:
                case 27:
                case 28:
                case 32:
                case 33:
                case 38:
                case 39:
                case 43:
                case 44:
                case 49:
                    if(i>=25){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })
    //绿小
    $('.c16').click(function () {
        for(var i=1;i<=49;i++){
            $('[name=Num_'+i+']').val('');
        }
        for(var i=1;i<=49;i++){
            switch (i) {
                case 5:
                case 6:
                case 11:
                case 16:
                case 17:
                case 21:
                case 22:
                case 27:
                case 28:
                case 32:
                case 33:
                case 38:
                case 39:
                case 43:
                case 44:
                case 49:
                    if(i<25){
                        $('[name=Num_'+i+']').val('*');
                    }
                    break;
            }
        }
    })

    //十二生肖
    $('.d1').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[2]) || $sz[2] instanceof \think\Collection || $sz[2] instanceof \think\Paginator): if( count($sz[2])==0 ) : echo "" ;else: foreach($sz[2] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
    });
    $('.d2').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[3]) || $sz[3] instanceof \think\Collection || $sz[3] instanceof \think\Paginator): if( count($sz[3])==0 ) : echo "" ;else: foreach($sz[3] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    $('.d3').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[4]) || $sz[4] instanceof \think\Collection || $sz[4] instanceof \think\Paginator): if( count($sz[4])==0 ) : echo "" ;else: foreach($sz[4] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    $('.d4').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[5]) || $sz[5] instanceof \think\Collection || $sz[5] instanceof \think\Paginator): if( count($sz[5])==0 ) : echo "" ;else: foreach($sz[5] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    $('.d5').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[6]) || $sz[6] instanceof \think\Collection || $sz[6] instanceof \think\Paginator): if( count($sz[6])==0 ) : echo "" ;else: foreach($sz[6] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    $('.d6').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[7]) || $sz[7] instanceof \think\Collection || $sz[7] instanceof \think\Paginator): if( count($sz[7])==0 ) : echo "" ;else: foreach($sz[7] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    $('.d7').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[8]) || $sz[8] instanceof \think\Collection || $sz[8] instanceof \think\Paginator): if( count($sz[8])==0 ) : echo "" ;else: foreach($sz[8] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    $('.d8').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[9]) || $sz[9] instanceof \think\Collection || $sz[9] instanceof \think\Paginator): if( count($sz[9])==0 ) : echo "" ;else: foreach($sz[9] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    $('.d9').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[10]) || $sz[10] instanceof \think\Collection || $sz[10] instanceof \think\Paginator): if( count($sz[10])==0 ) : echo "" ;else: foreach($sz[10] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    $('.d10').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[11]) || $sz[11] instanceof \think\Collection || $sz[11] instanceof \think\Paginator): if( count($sz[11])==0 ) : echo "" ;else: foreach($sz[11] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    $('.d11').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[12]) || $sz[12] instanceof \think\Collection || $sz[12] instanceof \think\Paginator): if( count($sz[12])==0 ) : echo "" ;else: foreach($sz[12] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    $('.d12').click(function () {
        for (var j=1;j<50;j++){
            if(j<10){
                var s='0'+j;
            }else{
                var s=''+j;
            }
            switch (s) {
                <?php if(is_array($sz[13]) || $sz[13] instanceof \think\Collection || $sz[13] instanceof \think\Paginator): if( count($sz[13])==0 ) : echo "" ;else: foreach($sz[13] as $key=>$s): ?>
        case '<?php echo $s; ?>':
            <?php endforeach; endif; else: echo "" ;endif; ?>
                $('[name=Num_'+j+']').val('*');
                break;
            }
        }
        });
    
    //0头  0-9
    $('.d13').click(function () {
        for (var i=0;i<=49;i++){
            if(i<10){
                $('[name=Num_'+i+']').val('*');
            }
        }
    });
    //1头  10-19
    $('.d14').click(function () {
        for (var i=0;i<=49;i++){
            if(i>=10 && i<20){
                $('[name=Num_'+i+']').val('*');
            }
        }
    });
    //2头  20-29
    $('.d15').click(function () {
        for (var i=0;i<=49;i++){
            if(i>=20 && i<30){
                $('[name=Num_'+i+']').val('*');
            }
        }
    });
    //3头  30-39
    $('.d16').click(function () {
        for (var i=0;i<=49;i++){
            if(i>=30 && i<40){
                $('[name=Num_'+i+']').val('*');
            }
        }
    });
    //4头  40-49
    $('.d17').click(function () {
        for (var i=0;i<=49;i++){
            if(i>=40 && i<50){
                $('[name=Num_'+i+']').val('*');
            }
        }
    });

    //尾数
    function weishu(size){
        var a1=10,a2=20,a3=30,a4=40,a5=0;
        switch (size) {
            case 0:
                a1=10;
                a2=20;
                a3=30;
                a4=40;
                a5=0;
                break;
            case 1:
                a1=11;
                a2=21;
                a3=31;
                a4=41;
                a5=1;
                break;
            case 2:
                a1=12;
                a2=22;
                a3=32;
                a4=42;
                a5=2;
                break;
            case 3:
                a1=13;
                a2=23;
                a3=33;
                a4=43;
                a5=3;
                break;
            case 4:
                a1=14;
                a2=24;
                a3=34;
                a4=44;
                a5=4;
                break;
            case 5:
                a1=15;
                a2=25;
                a3=35;
                a4=45;
                a5=5;
                break;
            case 6:
                a1=16;
                a2=26;
                a3=36;
                a4=46;
                a5=6;
                break;
            case 7:
                a1=17;
                a2=27;
                a3=37;
                a4=47;
                a5=7;
                break;
            case 8:
                a1=18;
                a2=28;
                a3=38;
                a4=48;
                a5=8;
                break;
            case 9:
                a1=19;
                a2=29;
                a3=39;
                a4=49;
                a5=9;
                break;
        }
        for (var i=0;i<50;i++){
            switch (i) {
                case a1:
                case a2:
                case a3:
                case a4:
                case a5:
                    $('[name=Num_'+i+']').val('*');
                    break;
            }
        }
    }

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