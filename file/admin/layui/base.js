
//跳转
function OpenUrl(Url) 
{
  window.location.href = Url;
}
/*
//页面跳转绑定
function toView (url) {
  $.ajax({
     type:"GET",
     url:url,
     success: function(data){
       $("#Bind-View").html(data);
     }
  })
}

//页面刷新保持的状态
function keepView() {
    //说明：bm 大菜单id   cm 当前页面链接  sm 当前页面id
    var def_bm='',def_id='',def_url = '';
    var bm = sessionStorage.getItem('bm');

    if (bm!='null' && bm!=null) 
    {
      def_bm = bm
      var sm = sessionStorage.getItem('sm');
      var cm = sessionStorage.getItem('cm');
      if (sm!='null' && cm!='null' && sm.indexOf(bm)>0)
      {
        def_id = sm
        def_url = cm
      }
      else
      {
          sessionStorage.removeItem('sm');
          sessionStorage.removeItem('cm');
          def_id = '0'+def_bm+'0';
      }
    }
    else
    {
      sessionStorage.removeItem('sm');
      sessionStorage.removeItem('cm');
      def_bm = 'opt';
      def_id = '0'+def_bm+'0';
    }
    //公共部分，都必须执行
    if (def_url=='') 
    {
      def_url = CONFIG_DATA[def_bm].menu['0'].items['0'].href;
    }
    $("#"+def_bm).siblings().removeClass('layui-this');
    $("#"+def_bm).addClass('layui-this');
    $("#index-left-menu li dl dd").removeClass('layui-this');
    $("#"+def_id).addClass('layui-this');
    sessionStorage.setItem('bm',def_bm);
    sessionStorage.setItem('cm',def_url);
    sessionStorage.setItem('sm',def_id);
    toView(def_url);
}
//分页后页面绑定
$('.pages a').on('click',function () {
  var href = $(this).attr('href');
  $(this).attr('href','#');
  toView(href);
})*/

//动态创建引入css
function addCssByStyle(cssString){ 
    var doc=document; 
    var style=doc.createElement("style"); 
    style.setAttribute("type", "text/css"); 
   
    if(style.styleSheet){// IE 
        style.styleSheet.cssText = cssString; 
    } else {// w3c 
        var cssText = doc.createTextNode(cssString); 
        style.appendChild(cssText); 
    } 
   
    var heads = doc.getElementsByTagName("head"); 
    if(heads.length) 
        heads[0].appendChild(style); 
    else 
        doc.documentElement.appendChild(style); 
} 

//图片上传
 var msg = "您可以上传png, jpg, 或者gif格式的图片";
 var filter = {
 "jpeg": "/9j/4",
 "gif": "R0lGOD",
 "png": "iVBORw"
 };
 function preview(file,id) {
 var container = document.getElementById(id);
 container.innerHTML = "";
 if (window.FileReader) {
 for (var index=0, f; f = file.files[index]; index++) {
 
 var filereader = new FileReader();
 filereader.onload = function (event) {
  var srcpath = event.target.result;
  if (!validateImg(srcpath)) {
  console.log("H5"+msg);
  } else {
  showPreviewImage(srcpath,id);
  }
 };
 filereader.readAsDataURL(f);
 }
 } else {
 if (!/\.jpg$|\.png$|\.gif$/i.test(file.value)) {
 console.log("原生"+msg);
 } else {
 showPreviewImage(file.value,id);
 }
 }
 }
 
 function validateImg(data) {
	 var pos = data.indexOf(",") + 1;
	 for (var e in filter) {
		 if (data.indexOf(filter[e]) === pos) {
			return e;
		 }
	 }
	 return null;
 }
 
 function showPreviewImage(src,id) {
	$("#"+id).attr('src', src);
 }
