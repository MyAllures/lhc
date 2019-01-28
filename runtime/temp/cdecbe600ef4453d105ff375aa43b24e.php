<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"D:\www\PHPTutorial\WWW\lhc/app/index\view\index\index.html";i:1548472929;}*/ ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户--管理系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="Access-Control-Allow-Owebnamerigin" content="*">

  <link rel="stylesheet" href="/file/admin/layuis/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="/file/admin/layuis/style/admin.css" media="all">
  <script src="/file/admin/layui/jquery.min.js"></script>
  <script src="/file/admin/layui/base.js"></script>
  <script src="/file/admin/layui/vue.js"></script>
  
  <script>
  /^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
  </script>
  <style>
    .tz{
      cursor: pointer;
    }
    .layadmin-side-shrink,.layadmin-pagetabs{
      left: 0!important;
    }
    .layui-layout-admin,.layui-body{
      left: 0!important;
      top: 120px!important;
    }
    .layui-table th{
      text-align: center;
      /*color: #fff;*/
    }
    .layui-left{
      width:250px;
      position: absolute;
      left: 15px;
      top: 15px;
    }
    .layui-layout-admin .layui-body .layadmin-tabsbody-item{
      left: 270px;
    }
    .layui-layout-left{
      left: 0!important;
    }
    .top{
      margin: 15px 15px 15px 15px;
      height: 40px;
      line-height: 40px;
      background-color: #fff;
      padding:0 0 0 10px;
      cursor: pointer;
    }
    .mainL{
      margin-left: 12%;
      height: 100%;
      line-height: 30px;
      margin-top: 10px;
    }
    .le{
      text-align: right;
      margin-right: 5px;
      font-weight: bold;
    }
    .ri span{
      display: inline-block;
      width: 18px;
      text-align: center;
      margin-right: 10px;
    }
    #LAY_app_body{
      overflow: hidden;
    }
    .layui-layout-admin .layui-header{
      height: 80px;
      line-height:80px;
    }
    .layadmin-pagetabs{
      margin-top: 30px;
    }
  </style>
  <script>
    $(function(){
        $('.right1>li').click(function(){
            $('.right1>li a').css({'color':'#fff!important'});
            $(this).find('a').css({'color':'red!important'});
        })
    })
  </script>
</head>
<body class="layui-layout-body">
  <div id="LAY_app" class="layadmin-side-shrink">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item "><a href="javascript;void();" style="font-size:26px;font-weight: bold;"><?php echo $webname; ?></a></li>
          <!--<li class="layui-nav-item layadmin-flexible" lay-unselect>-->
            <!--<a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">-->
              <!--<i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>-->
            <!--</a>-->
          <!--</li>-->
          <!--<li class="layui-nav-item layui-hide-xs" lay-unselect>-->
            <!--<a class="tz" zdy-href="<?php echo url('home/console'); ?>" title="导航">-->
              <!--<i class="layui-icon layui-icon-website"></i>-->
            <!--</a>-->
          <!--</li>-->
          <!--<li class="layui-nav-item" lay-unselect>-->
            <!--<a href="javascript:;" layadmin-event="refresh" title="刷新">-->
              <!--<i class="layui-icon layui-icon-refresh-3"></i>-->
            <!--</a>-->
          <!--</li>-->
        </ul>
        <div class="mainL">
          <div class="layui-inline le">
            <span><?php echo $top['nn']; ?></span><br>
            <span><?php echo $top['nd']; ?></span>
          </div>
          <div class="layui-inline ri">
            <span><img src="/file/lhc_images/num<?php echo $top['n1']; ?>.gif" alt=""></span>
            <span><img src="/file/lhc_images/num<?php echo $top['n2']; ?>.gif" alt=""></span>
            <span><img src="/file/lhc_images/num<?php echo $top['n3']; ?>.gif" alt=""></span>
            <span><img src="/file/lhc_images/num<?php echo $top['n4']; ?>.gif" alt=""></span>
            <span><img src="/file/lhc_images/num<?php echo $top['n5']; ?>.gif" alt=""></span>
            <span><img src="/file/lhc_images/num<?php echo $top['n6']; ?>.gif" alt=""></span>
            <span>+</span>
            <span><img src="/file/lhc_images/num<?php echo $top['na']; ?>.gif" alt=""></span><br>
            <span><?php echo $top['x1']; ?></span>
            <span><?php echo $top['x2']; ?></span>
            <span><?php echo $top['x3']; ?></span>
            <span><?php echo $top['x4']; ?></span>
            <span><?php echo $top['x5']; ?></span>
            <span><?php echo $top['x6']; ?></span>
            <span>&nbsp;</span>
            <span><?php echo $top['sx']; ?></span>
          </div>
        </div>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
          <li class="layui-nav-item" lay-unselect> <!-- layadmin-event="message"  lay-href="<?php echo url('Kq/index'); ?>"  lay-text="即时开奖"-->
            <a  class="tz" zdy-href="<?php echo url('Kq/index'); ?>">即时开奖</a>
          </li>
          <li class="layui-nav-item" lay-unselect><!-- lay-href="<?php echo url('rule/index'); ?>" layadmin-event="message" lay-text="规则说明"-->
            <a class="tz" zdy-href="<?php echo url('rule/index'); ?>">规则说明</a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a class="tz" zdy-href="<?php echo url('lottery/index'); ?>">开奖结果</a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a class="tz" zdy-href="<?php echo url('user/index'); ?>">会员资料</a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a class="tz" zdy-href="<?php echo url('history/index'); ?>">历史账户</a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a class="tz" zdy-href="<?php echo url('betsDetails/index'); ?>">下注明细</a>
          </li>
          <!--<li class="layui-nav-item layui-hide-xs" lay-unselect>-->
            <!--<a href="javascript:;" layadmin-event="theme">-->
              <!--<i class="layui-icon layui-icon-theme"></i>-->
            <!--</a>-->
          <!--</li>-->
          <!--<li class="layui-nav-item layui-hide-xs" lay-unselect>-->
            <!--<a href="javascript:;" layadmin-event="note">-->
              <!--<i class="layui-icon layui-icon-note"></i>-->
            <!--</a>-->
          <!--</li>-->
          <li class="layui-nav-item" lay-unselect style="margin-right: 20px;">
            <a href="javascript:;">
              <cite><?php echo $user['kauser']; ?></cite>
            </a>
            <dl class="layui-nav-child">
              <dd><a class="tz" zdy-href="<?php echo url('mem/changepass'); ?>">修改密码</a></dd><hr>
              <dd><a class="tz" zdy-href="<?php echo url('user/index'); ?>">用户信息</a></dd><hr>
              <dd style="text-align: center;cursor:pointer" onclick="loginOut()"><a>退出</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item layui-hide-xs layui-hide">
            <a href="javascript:;" data-type="test2" id="ttt222"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
        </ul>
      </div>
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu layui-hide">
        <div class="layui-side-scroll">
          <div class="layui-logo">
            <span id="webname" style="font-size: 30px;"><?php echo $webname; ?></span>
          </div>
          
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
            <li data-name="list1" class="layui-nav-item layui-nav-itemed">
              <a href="javascript:;" lay-tips="下注" lay-direction="2">
                <i class="layui-icon layui-icon-chart-screen">&#xe629;</i>
                <cite>下注类型</cite>
              </a>
              <dl class="layui-nav-child">
                <!--<dd><a lay-href="<?php echo url('betsTm/index'); ?>">特码</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('betsWbz/index'); ?>">五不中</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('betsLm/index'); ?>"> 连码</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('betsLx/index'); ?>"> 连肖</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('sxp/index'); ?>"> 一肖/尾数</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('betsGg/index'); ?>"> 过关</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('zt/index'); ?>"> 正特码</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('zm/index'); ?>"> 正码</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('wx/index'); ?>"> 五行</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('bets/kbb'); ?>"> 半波</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('bets/sx6'); ?>"> 合肖</a></dd>-->
                <!--<dd><a lay-href="<?php echo url('sx/index'); ?>"> 特肖</a></dd>-->
              </dl>
            </li>
          </ul>
        </div>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-down  layui-hide">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav" lay-shrink="all">
            <li class="layui-nav-item">
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">w
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="<?php echo url('home/console'); ?>" zdy-href="<?php echo url('home/console'); ?>" class="layui-this tz"><i class="layui-icon layui-icon-home"></i></li>
            <li lay-id="<?php echo url('betsTm/index'); ?>" class="tz" zdy-href="<?php echo url('betsTm/index'); ?>">特码</li>
            <li lay-id="<?php echo url('betsWbz/index'); ?>" class="tz" zdy-href="<?php echo url('betsWbz/index'); ?>">不中</li>
            <li lay-id="<?php echo url('betsLm/index'); ?>" class="tz" zdy-href="<?php echo url('betsLm/index'); ?>">连码</li>
            <li lay-id="<?php echo url('betsLx/index'); ?>" class="tz" zdy-href="<?php echo url('betsLx/index'); ?>">连肖</li>
            <li lay-id="<?php echo url('sxp/index'); ?>" class="tz" zdy-href="<?php echo url('sxp/index'); ?>"> 一肖/尾数</li>
            <li lay-id="<?php echo url('betsGg/index'); ?>" class="tz" zdy-href="<?php echo url('betsGg/index'); ?>">过关</li>
            <li lay-id="<?php echo url('zt/index'); ?>" class="tz" zdy-href="<?php echo url('zt/index'); ?>">正特码</li>
            <li lay-id="<?php echo url('zm/index'); ?>" class="tz" zdy-href="<?php echo url('zm/index'); ?>">正码</li>
            <li lay-id="<?php echo url('wx/index'); ?>" class="tz" zdy-href="<?php echo url('wx/index'); ?>">五行</li>
            <li lay-id="<?php echo url('bets/kbb'); ?>" class="tz" zdy-href="<?php echo url('bets/kbb'); ?>">半波</li>
            <li lay-id="<?php echo url('bets/sx6'); ?>" class="tz" zdy-href="<?php echo url('bets/sx6'); ?>">合肖</li>
            <li lay-id="<?php echo url('sx/index'); ?>" class="tz" zdy-href="<?php echo url('sx/index'); ?>">特肖</li>
          </ul>
        </div>
      </div>


      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layui-left layui-card">
          <div class="layui-card-header" style="text-align: center">
            用户信息
          </div>
          <div class="layui-card-body">
            <form class="layui-form">
              <table class="layui-table" lay-size="sm">
              <tbody>
              <tr>
                <td>账号名称</td>
                <td><?php echo $user['kauser']; ?></td>
              </tr>
              <tr>
                <td>会员类型</td>
                <td>
                  <div class="layui-input-inline" style="width: 70px;">
                    <select id="type" lay-filter="type">
                      <?php if($hy): if(is_array($hy) || $hy instanceof \think\Collection || $hy instanceof \think\Paginator): if( count($hy)==0 ) : echo "" ;else: foreach($hy as $key=>$h): ?>
                      <option value="<?php echo $h; ?>"><?php echo $h; ?>盘</option>
                      <?php endforeach; endif; else: echo "" ;endif; endif; ?>
                      <option value="<?php echo $user['abcd']; ?>" selected><?php echo $user['abcd']; ?>盘</option>
                    </select>
                  </div>
                </td>
              </tr>
              <tr>
                <td>总信用额</td>
                <td><?php echo round($user['cs'],2); ?>元</td>
              </tr>
              <tr>
                <td>可用余额</td>
                <td class="ky"><?php echo round($user['ts'],2); ?>元</td>
              </tr>
              <tr>
                <td>下注总额</td>
                <td class="ball"><?php echo round($sum,2); ?>元</td>
              </tr>
              <tr>
                <td>当前期数</td>
                <td><?php echo getKitheNum(); ?>期</td>
              </tr>
              </tbody>
            </table>
            </form>
            <table class="layui-table" id="jiaoyi" lay-size="sm">
              <thead>
              <tr>
                <th colspan="4">最新交易</th>
              </tr>
              <tr>
                <th>内容</th>
                <th>金额</th>
              </tr>
              </thead>
              <tbody>
              <?php if($result): if(is_array($result) || $result instanceof \think\Collection || $result instanceof \think\Paginator): if( count($result)==0 ) : echo "" ;else: foreach($result as $key=>$r): ?>
              <tr>
                <td>
                  <?php if($r['class1'] == '过关'): if(is_array($r['td5']) || $r['td5'] instanceof \think\Collection || $r['td5'] instanceof \think\Paginator): if( count($r['td5'])==0 ) : echo "" ;else: foreach($r['td5'] as $key=>$v): ?>
                    <?php echo $v; ?><br>
                  <?php endforeach; endif; else: echo "" ;endif; else: ?>
                    <?php echo $r['class2']; ?>：<?php echo $r['class3']; endif; ?>
                </td>
                <td><?php echo $r['sum_m']; ?></td>
              </tr>
              <?php endforeach; endif; else: echo "" ;endif; ?>
              <tr><td colspan="4" align="center"><a style="text-decoration: underline; cursor:pointer;" href="javascript:;" class="tz" zdy-href="<?php echo url('betsDetails/index'); ?>">更多...</a></td></tr>
              <?php else: ?>
              <tr><td colspan="4" align="center">暂无数据</td></tr>
              <?php endif; ?>
              </tbody>
            </table>
          </div>
        </div>
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="<?php echo url('home/console'); ?>" frameborder="0" id="ifra" class="layadmin-iframe"></iframe>
        </div>
      </div>
      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>

  <script src="/file/admin/layuis/layui/layui.js"></script>
  <script>
    layui.use(['form'],function () {
      var form=layui.form;
      form.on('select(type)',function (data) {
        $.ajax({
          url:'<?php echo url("changeType"); ?>',
          type:'post',
          data:{
            'type':data.value
          },
          returnType:'json',
          success:function (response,status,xhr) {
             if(response!='' && response.code==0){
              $('#ifra').attr('src',$('iframe').attr('src'));
             }
          }
        });
      })
    });
    
    function count(o){
      var t = typeof o;
      if(t == 'string'){
        return o.length;
      }else if(t == 'object'){
        var n = 0;
        for(var i in o){
          n++;
        }
        return n;
      }
      return false;
    }
    function setC(){
      $.ajax({
        url:'<?php echo url("reload"); ?>',
        data:{},
        type:'get',
        returnType:'json',
        success:function (response,statu,xhr) {
          if(response!=''){
            var str='';
            for(var i=0;i<count(response)-1;i++){
              if(response[i]['class1']!='过关'){
                str+='<tr><td>'+response[i]['class2']+'：'+response[i]['class3']+'</td><td>'+response[i]['sum_m']+'</td></tr>';
              }else{
                var zs='';
                for (var j=0;j<response[i]['td5'].length;j++){
                  zs+=response[i]['td5'][j]+'<br>';
                }
                str+='<tr><td>'+zs+'</td><td>'+response[i]['sum_m']+'</td></tr>';
              }
            }
            str+='<tr class="ntz"><td colspan="4" align="center"><a style="text-decoration: underline; cursor:pointer;" href="javascript:;" class="tz" zdy-href="<?php echo url('betsDetails/index'); ?>">更多...</a></td></tr>';
            $('#jiaoyi tbody').html(str);
            $('.ntz td').on('click','.tz',function () {
              // console.log($(this).attr('lay-id'));
              $('.layadmin-iframe').attr('src',$(this).attr('zdy-href'));
            });
            $('.ky').html(response['userinfo']['ts']+'元');
            if(response['userinfo']['bets'] == ''){
              $('.ball').html('0元');
            }else{
              $('.ball').html(response['userinfo']['bets']+'元');
            }
          }
        }
      })
    }
    setInterval(setC,5000);
    $('.tz').click(function () {
      $('.layadmin-iframe').attr('src',$(this).attr('zdy-href'));
    });


    // $.ajax({
    //     type: "get",
    //     url: "<?php echo url(''); ?>",
    //     async:false,
    //     data: {}
    //   }).success(function (data) {
    //     $("#version").text(data.version);
    //     $("#kuangjia").text(data.kuangjia);
    //     $("#copyright").text(data.banquan);
    //     $("#copyright_about").text(data.new);
    //     $("#webname").text(data.webname);
        
    //   }).fail(function (jqXHR, textStatus, errorThrown) {
    //     //错误信息
    //   });
  layui.config({
    base: '/file/admin/layuis/'    //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index'],function () {
    
    var $ = layui.$
      ,admin = layui.admin
      ,element = layui.element
      ,router = layui.router();
      element.render();
      var html = $("#is-about-set").html();

      var active = {
        test2: function(){
        admin.popupRight({
          id: 'LAY_adminPopupLayerTest'
          ,success: function(){
            $('#'+ this.id).html(html);
          }
        });
      }
    };
    // $('#ttt222').on('click', function(){
    //   var type = $(this).data('type');
    //   active[type] && active[type].call(this);
    // });
  });
  function loginOut() 
  {
    location.href="<?php echo url('login/logout'); ?>";
  }
  </script>
</body>
</html>