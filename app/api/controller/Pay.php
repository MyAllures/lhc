<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Log;

class Pay extends Controller{

	// protected $Setting = null;
	protected function _initialize(){
		parent::_initialize();
		// $this->Setting = model('Setting');
	}

    public function taocan(){
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

    public function notify(){
    	
    }
}