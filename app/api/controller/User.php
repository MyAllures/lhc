<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Log;

class User extends Controller{

	protected function _initialize(){
		parent::_initialize();
	}

  public function getcoin(){
    $Taocan = model('Taocan');
    $taocans = $Taocan->order('sort asc,id asc')->limit(8)->select();
    $data = [];
    $domain = $this->request->domain();
    foreach ($taocans as $key => $value) {
      $data[$key]['id'] = $value['id'];
      $data[$key]['pic'] = $domain . $value['pic'];
      $data[$key]['number'] = $value['number'];
      $data[$key]['price'] = $value['pic'];
    }
    return json([ 'data'=>$data,'code'=>0,'msg'=>'获取成功']);
  }
}