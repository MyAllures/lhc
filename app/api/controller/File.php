<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Log;

class File extends Controller{

    public function upload(){
        // 获取表单上传文件 例如上传了001.jpg
        $file = $this->request->file('file');
        // 移动到框架应用根目录/public/uploads/ 目录下
        $file = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($file){
            $name = $file->getInfo('name');
            $src =  DS. 'public' . DS . 'uploads' .DS .$file->getSaveName();
            return json(['code'=>0,'msg'=>'上传成功','data'=>['name'=>$name,'src'=>$src]]);
            // 成功上传后 获取上传信息
        }else{
            return json(['data'=>'','code'=>0,'msg'=>$file->getError()]);
        }
    }
}