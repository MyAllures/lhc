;
layui.define(['layer'], function (e) {
	var s = layui.$,
  t = (layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin);

  var console = function(){
    console.prototype.newestnotice();
  }
  console.prototype.newestnotice = function(){
    s.post(layui.setter.host + 'mch/article/newestnotice.html',function(r){
          if (!r.code) {
            var notice = r.data;
            if(notice.read) return false;
            var index = layer.open({
              type: 1
              ,title: false //不显示标题栏
              ,closeBtn: false
              ,area: ['70%','480px']
              ,shade: 0.8
              ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
              ,btn: ['阅后即关']
              ,btnAlign: 'c'
              ,moveType: 1 //拖拽模式，0或者1
              ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><h3 style="text-align: center;margin-bottom: 15px;">'+notice.cname+'</h3>'+notice.content+'</div>'
              ,success: function(layero){
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').on('click',function(){
                  s.post(layui.setter.host + 'mch/article/read.html',{id:notice.id},function(r){
                    if (!r.code) {
                      layer.close(index);
                    }else{
                      layer.msg(r.msg);
                    }
                  })
                });
              }
            });
          }
      })
  }
  e('console', new console())
})