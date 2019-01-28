<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:57:"D:\www\PHPTutorial\WWW\lhc/app/users\view\jszd\index.html";i:1548485956;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>走飞</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="/file/admin/layuis/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/file/admin/layuis/style/admin.css" media="all">
    <link rel="stylesheet" href="/file/admin/layui/bootstrap/css/bootstrap.min.css">
    <script src="/file/admin/layui/jquery.min.js"></script>
    <script src="/file/admin/layui/base.js"></script>
    <script src="/file/admin/layuis/layui/layui.js"></script>
    <script>
        layui.use('layer',function () {
            var layer=layui.layer;

        })
        //显示弹窗
        function show_win(class3,bl,rate,class1,class2,kithe){
            layer.open({
                type: 2,
                title: '['+class3+'码]请设定',
                shadeClose: true,
                shade: false,
                maxmin: true,
                area: ['600px', '270px'],
                content: '<?php echo url('updatePz'); ?>?class1='+class1+'&class2='+class2+'&class3='+class3+'&sum_m='+bl+'&rate='+rate+'&kithe='+kithe,
            });
        }
    </script>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
                <div class="layui-card">
                  <div class="layui-card-header">
                      <form action="" method="post" class="layui-form">
                            特码统计[<?php echo $kithe; ?>期]
                             <div class="layui-inline"  style="margin: 0 50px;">
                                 出货类别：
                                 <div class="layui-input-inline">
                                     <select name="menu1" lay-filter="type">
                                         <option <?php if($tm2 == 1): ?>selected<?php endif; ?> value="1">全部</option>
                                         <option <?php if($tm2 == 0): ?>selected<?php endif; ?> value="0">特码</option>
                                     </select>
                                 </div>
                             </div>
                            <div class="layui-inline">
                                选择期数：
                                <div class="layui-input-inline">
                                    <select name="temppid" style="color: #0A5D94;" lay-filter="qishu">
                                        <?php if(is_array($kitheAll) || $kitheAll instanceof \think\Collection || $kitheAll instanceof \think\Paginator): if( count($kitheAll)==0 ) : echo "" ;else: foreach($kitheAll as $key=>$k): ?>
                                        <option value="<?php echo $k['nn']; ?>" <?php if($kithe == $k['nn']): ?>selected="selected"<?php endif; ?>>第<?php echo $k['nn']; ?>期</option>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select>
                                </div>
                            </div>

                            <div class="layui-inline" style="margin-left: 50px;">预估风险值：
                                <div class="layui-input-inline" style="margin-right:10px;">
                                    <input type="text" name="tm" value="<?php echo $tm; ?>" class="layui-input">
                                </div>
                                <input type="submit" value="走飞计算" id="sub" class="layui-btn layui-btn-sm" >
                            </div>

                            <div class="layui-btn-group" style="float:right;">
                                <a class="layui-btn layui-btn-primary layui-btn-sm" href="javascript:location.reload();">刷新</a>
                            </div>
                      </form>
                </div>
                <div class="layui-card-body" pad15>
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <td >特码：<a href="<?php echo url('jszd/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[0]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[0]; ?></span></a></td>
                            <td  >正特：<a href="<?php echo url('zt/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[1]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[1]; ?></span></a></td>
                            <td  >正码：<a href="<?php echo url('zm/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[2]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[2]; ?></span></a></td>
                            <td  >正1-6：<a href="<?php echo url('zm6/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[3]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[3]; ?></span></a></td>
                            <td  >连码：<a href="<?php echo url('lm/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[4]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[4]; ?></span></a></td>
                            <td  >过关：<a href="<?php echo url('gg/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[5]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[5]; ?></span></a></td>
                            <td  >半波：<a href="<?php echo url('bb/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[6]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[6]; ?></span></a></td>
                            <td  >半半波：<a href="<?php echo url('bbb/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[10]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[10]; ?></span></a></td>
                            <td  >特尾：<a href="<?php echo url('ws/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[8]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[8]; ?></span></a></td>
                            <td  >五行：<a href="<?php echo url('wx/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[9]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[9]; ?></span></a></td>
                        </tr>
                        <tr>
                            <td  >生肖：<a href="<?php echo url('sx/index'); ?>" ><span style="color: #FF3333;"><?php echo $sum_m[7]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[7]; ?></span></a></td>
                            <td >特头：<a href="<?php echo url('ts/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[11]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[11]; ?></span></a></td>
                            <td  >平特尾（尾数）：<a href="<?php echo url('ztws/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[12]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[12]; ?></span></a></td>
                            <td  >七色波：<a href="<?php echo url('qsb/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[13]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[13]; ?></span></a></td>
                            <td  >正肖：<a href="<?php echo url('zhx/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[14]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[14]; ?></span></a></td>
                            <td  >不中：<a href="<?php echo url('zx/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[15]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[15]; ?></span></a></td>
                            <td  >尾数连：<a href="<?php echo url('wsl/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[16]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[16]; ?></span></a></td>
                            <td  >生肖连：<a href="<?php echo url('lx/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[17]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[17]; ?></span></a></td>
                            <td  >中一：<a href="<?php echo url('szy/index'); ?>"><span style="color: #FF3333;"><?php echo $sum_m[18]; ?></span><span color="#000000">-</span><span style="color: #FF3333;"><?php echo $sum_mzc[18]; ?></span></a></td>
                            <td align="right">
                                总：<span style="color:#333333;"><?php echo $z_sum; ?></span><span style="color:#000000;">-</span><span style="color:#333333;"><?php echo $z_sumzc; ?></span>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <table class="layui-table" id="Hm">
                        <thead>
                        <tr>
                            <th>号码</th>
                            <th>赔率</th>
                            <th>金额</th>
                            <th>输赢</th>
                            <th>走飞</th>
                            <th>已补</th>

                            <th>号码</th>
                            <th>赔率</th>
                            <th>金额</th>
                            <th>输赢</th>
                            <th>走飞</th>
                            <th>已补</th>

                            <th>号码</th>
                            <th>赔率</th>
                            <th>金额</th>
                            <th>输赢</th>
                            <th>走飞</th>
                            <th>已补</th>

                            <th>号码</th>
                            <th>赔率</th>
                            <th>金额</th>
                            <th>输赢</th>
                            <th>走飞</th>
                            <th>已补</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="24">0</td>
                        </tr>
                        </tbody>
                    </table>
                    <table class="layui-table" id="Hm1">
                        <thead>
                        <tr>
                            <th>号码</th>
                            <th>赔率</th>
                            <th>总额</th>
                            <th>输赢</th>
                            <th>走飞</th>
                            <th>已补</th>

                            <th>号码</th>
                            <th>赔率</th>
                            <th>总额</th>
                            <th>输赢</th>
                            <th>走飞</th>
                            <th>已补</th>

                            <th>号码</th>
                            <th>赔率</th>
                            <th>总额</th>
                            <th>输赢</th>
                            <th>走飞</th>
                            <th>已补</th>

                            <th>号码</th>
                            <th>赔率</th>
                            <th>总额</th>
                            <th>输赢</th>
                            <th>走飞</th>
                            <th>已补</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function reload(class2='<?php echo $ids; ?>',kithe='<?php echo $kithe; ?>',tm2=<?php echo $tm2; ?>){
        $.ajax({
            url:'<?php echo url("server_tm"); ?>',
            type:'post',
            data:{
                class1:'特码',
                class2:class2,
                kithe:kithe,
                tm2:tm2
            },
            dataType:'json',
            success:function (response,status,xhr) {
                if(response!=''){
                    var str='',
                        str1='';
                    for(var i=0;i<13;i++){
                        if(response[i*4][7]<0){
                           var temb1='<span style="color:#ff0011;">'+response[i*4][7]+'</span>';
                        }else{
                           var temb1='<span style="color:#2233ff;">'+response[i*4][7]+'</span>';
                        }
                        if(response[i*4+1][7]<0){
                            var temb2='<span style="color:#ff0011;">'+response[i*4+1][7]+'</span>';
                        }else{
                            var temb2='<span style="color:#2233ff;">'+response[i*4+1][7]+'</span>';
                        }
                        if(response[i*4+2][7]<0){
                            var temb3='<span style="color:#ff0011;">'+response[i*4+2][7]+'</span>';
                        }else{
                            var temb3='<span style="color:#2233ff;">'+response[i*4+2][7]+'</span>';
                        }
                        if(response[i*4+3][7]<0){
                            var temb4='<span style="color:#ff0011;">'+response[i*4+3][7]+'</span>';
                        }else{
                            var temb4='<span style="color:#2233ff;">'+response[i*4+3][7]+'</span>';
                        }

                        if(response[i*4][9]!=0 ){ //  && i!=(response.length-2)
                           var temc1='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>1,'id'=>1]); ?>?class3='+response[i*4][12]+'">'+response[i*4][9]+'</a>';
                        }else{
                            var temc1='<span>'+response[i*4][9]+'</span>';
                        }
                        if(response[i*4+1][9]!=0 ){ //  && i!=(response.length-2)
                            var temc2='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>1,'id'=>1]); ?>?class3='+response[i*4+1][12]+'">'+response[i*4+1][9]+'</a>';
                        }else{
                            var temc2='<span>'+response[i*4+1][9]+'</span>';
                        }
                        if(response[i*4+2][9]!=0 ){ //  && i!=(response.length-2)
                            var temc3='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>1,'id'=>1]); ?>?class3='+response[i*4+2][12]+'">'+response[i*4+2][9]+'</a>';
                        }else{
                            var temc3='<span>'+response[i*4+2][9]+'</span>';
                        }
                        if(response[i*4+3][9]!=0 ){ //  && i!=(response.length-2)
                            var temc4='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>1,'id'=>1]); ?>?class3='+response[i*4+3][12]+'">'+response[i*4+3][9]+'</a>';
                        }else{
                            var temc4='<span>'+response[i*4+3][9]+'</span>';
                        }
                        var tema1='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>0,'id'=>1]); ?>?class3='+response[i*4][12]+'">'+response[i*4][3]+'</a>';
                        var tema2='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>0,'id'=>1]); ?>?class3='+response[i*4+1][12]+'">'+response[i*4+1][3]+'</a>';
                        var tema3='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>0,'id'=>1]); ?>?class3='+response[i*4+2][12]+'">'+response[i*4+2][3]+'</a>';
                        var tema4='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>0,'id'=>1]); ?>?class3='+response[i*4+3][12]+'">'+response[i*4+3][3]+'</a>';

                        if(i==12){
                            str+="<tr><td><strong style='color: #"+response[i*4][13]+";'>"+response[i*4][0]+"</strong></td><td>"+response[i*4][10]+"</td><td>"+tema1+"</td><td>"+temb1+"</td><td>"+response[i*4][8]+"</td><td>"+temc1+"</td></tr>";
                        }else{
                            str+="<tr><td><strong style='color: #"+response[i*4][13]+";'>"+response[i*4][0]+"</strong></td><td>"+response[i*4][10]+"</td><td>"+tema1+"</td><td>"+temb1+"</td><td>"+response[i*4][8]+"</td><td>"+temc1+"</td>";
                            str+="<td><strong style='color: #"+response[i*4+1][13]+";'>"+response[i*4+1][0]+"</strong></td><td>"+response[i*4+1][10]+"</td><td>"+tema2+"</td><td>"+temb2+"</td><td>"+response[i*4+1][8]+"</td><td>"+temc2+"</td>"
                            str+="<td><strong style='color: #"+response[i*4+2][13]+";'>"+response[i*4+2][0]+"</strong></td><td>"+response[i*4+2][10]+"</td><td>"+tema3+"</td><td>"+temb3+"</td><td>"+response[i*4+2][8]+"</td><td>"+temc3+"</td>"
                            str+="<td><strong style='color: #"+response[i*4+3][13]+";'>"+response[i*4+3][0]+"</strong></td><td>"+response[i*4+3][10]+"</td><td>"+tema4+"</td><td>"+temb4+"</td><td>"+response[i*4+3][8]+"</td><td>"+temc4+"</td></tr>"
                        }
                    }
                    for (var i=0;i<5;i++){      //49 -66
                        if(response[i*4+49][7]<0){
                            var temb1='<span style="color:#ff0011;">'+response[i*4+49][7]+'</span>';
                        }else{
                            var temb1='<span style="color:#2233ff;">'+response[i*4+49][7]+'</span>';
                        }
                        if(i!=4){
                            if(response[i*4+50][7]<0){
                                var temb2='<span style="color:#ff0011;">'+response[i*4+50][7]+'</span>';
                            }else{
                                var temb2='<span style="color:#2233ff;">'+response[i*4+50][7]+'</span>';
                            }
                            if(response[i*4+51][7]<0){
                                var temb3='<span style="color:#ff0011;">'+response[i*4+51][7]+'</span>';
                            }else{
                                var temb3='<span style="color:#2233ff;">'+response[i*4+51][7]+'</span>';
                            }
                            if(response[i*4+52][7]<0){
                                var temb4='<span style="color:#ff0011;">'+response[i*4+52][7]+'</span>';
                            }else{
                                var temb4='<span style="color:#2233ff;">'+response[i*4+52][7]+'</span>';
                            }
                            if(response[i*4+49][9]!=0 ){ //  && i!=(response.length-2)
                                var temc1='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>1,'id'=>1]); ?>?class3='+response[i*4+49][12]+'">'+response[i*4+49][9]+'</a>';
                            }else{
                                var temc1='<span>'+response[i*4+49][9]+'</span>';
                            }
                            if(response[i*4+50][9]!=0 ){ //  && i!=(response.length-2)
                                var temc2='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>1,'id'=>1]); ?>?class3='+response[i*4+50][12]+'">'+response[i*4+50][9]+'</a>';
                            }else{
                                var temc2='<span>'+response[i*4+50][9]+'</span>';
                            }
                            if(response[i*4+51][9]!=0 ){ //  && i!=(response.length-2)
                                var temc3='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>1,'id'=>1]); ?>?class3='+response[i*4+51][12]+'">'+response[i*4+51][9]+'</a>';
                            }else{
                                var temc3='<span>'+response[i*4+51][9]+'</span>';
                            }
                            if(response[i*4+52][9]!=0 ){ //  && i!=(response.length-2)
                                var temc4='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>1,'id'=>1]); ?>?class3='+response[i*4+52][12]+'">'+response[i*4+52][9]+'</a>';
                            }else{
                                var temc4='<span>'+response[i*4+52][9]+'</span>';
                            }
                            var tema1='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>0,'id'=>1]); ?>?class3='+response[i*4+49][12]+'">'+response[i*4+49][3]+'</a>';
                            var tema2='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>0,'id'=>1]); ?>?class3='+response[i*4+50][12]+'">'+response[i*4+50][3]+'</a>';
                            var tema3='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>0,'id'=>1]); ?>?class3='+response[i*4+51][12]+'">'+response[i*4+51][3]+'</a>';
                            var tema4='<a href="<?php echo url('look',['kithe'=>$kithe,'lx'=>0,'id'=>1]); ?>?class3='+response[i*4+52][12]+'">'+response[i*4+52][3]+'</a>';
                        }

                        if(i==4){
                            str1+="<tr><td><strong style='color: #"+response[65][13]+";'>"+response[65][0]+"</strong></td><td>"+response[65][10]+"</td><td>"+tema1+"</td><td>"+temb1+"</td><td>"+response[65][8]+"</td><td>"+temc1+"</td></tr>";
                        }else{
                            str1+="<tr><td><strong style='color: #"+response[i*4+49][13]+";'>"+response[i*4+49][0]+"</strong></td><td>"+response[i*4+49][10]+"</td><td>"+tema1+"</td><td>"+temb1+"</td><td>"+response[i*4+49][8]+"</td><td>"+temc1+"</td>";
                            str1+="<td><strong style='color: #"+response[i*4+50][13]+";'>"+response[i*4+50][0]+"</strong></td><td>"+response[i*4+50][10]+"</td><td>"+tema2+"</td><td>"+temb2+"</td><td>"+response[i*4+50][8]+"</td><td>"+temc2+"</td>"
                            str1+="<td><strong style='color: #"+response[i*4+51][13]+";'>"+response[i*4+51][0]+"</strong></td><td>"+response[i*4+51][10]+"</td><td>"+tema3+"</td><td>"+temb3+"</td><td>"+response[i*4+51][8]+"</td><td>"+temc3+"</td>"
                            str1+="<td><strong style='color: #"+response[i*4+52][13]+";'>"+response[i*4+52][0]+"</strong></td><td>"+response[i*4+52][10]+"</td><td>"+tema4+"</td><td>"+temb4+"</td><td>"+response[i*4+52][8]+"</td><td>"+temc4+"</td></tr>"
                        }
                    }
                    str+="<tr><td colspan='8'>下注总额："+response[response.length-1][2]+"</td><td colspan='8'>占成总额："+response[response.length-1][3]+"</td><td colspan='8'>走飞总额："+response[response.length-1][9]+"</td></tr>";
                    $('#Hm > tbody').html(str);
                    $('#Hm1 > tbody').html(str1);
                }
            }
        })
    }
    reload();


    layui.use(['layer','form'],function () {
        var layer=layui.layer,
            form=layui.form;
        //走飞计算
        $('#sub').click(function () {
            $.ajax({
                url:'<?php echo url("savePz"); ?>',
                type:'post',
                data:{
                    tm:$('[name=tm]').val(),
                    act:'zsave'
                },
                dataType:'json',
                success:function (response,status,xhr){
                    if(response.code>0){
                        layer.msg(response.msg,{icon:2});
                        $('[name=tm]').val(<?php echo $tm; ?>);
                    }else{
                        layer.msg(response.msg,{icon:1});
                        location.reload();
                    }
                }
            })
            return false;
        });

        form.on('select(type)',function (data) {
            location.href="<?php echo url(''); ?>?kithe=<?php echo $kithe; ?>&tm1=<?php echo $tm1; ?>&tm=<?php echo $tm; ?>&tm2="+data.value;
        });
        form.on('select(qishu)',function (data) {
            location.href="<?php echo url(''); ?>?kithe="+data.value;
        });
    })

</script>
</body>
</html>