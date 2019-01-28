<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Log;

class Game extends Controller{

	protected $Game = null;
	protected function _initialize(){
		parent::_initialize();
		$this->Game = model('Game');
	}

  public function load(){
    $list = $this->Game->where(['state'=>1])->order('sort asc,id asc')->select();
    $data = [];
    $request = Request();
    $domain = $request->domain();
    foreach ($list as $key => $value) {
      $data[$key]['id'] = $value['id'];
      $data[$key]['pic'] = $domain . $value['pic'];
      $data[$key]['cname'] = $value['cname'];
      $data[$key]['rule'] = $value['rule'];
      $data[$key]['explain'] = $value['explain'];
      $data[$key]['special'] = $value['special'];
    }
    return json([ 'data'=>$data,'code'=>0,'msg'=>'获取成功']);
  }

  public function getGameById(){
    $id = input('get.id');
    $game = $this->Game->where(['id'=>$id,'state'=>1])->find();
    if (!$game) {
      return json([ 'data'=>null,'code'=>1,'msg'=>'获取失败']);
    }
    $request = Request();
    $domain = $request->domain();
    $data['id'] = $game['id'];
      $data['pic'] = $domain . $game['pic'];
      $data['cname'] = $game['cname'];
      $data['rule'] = $game['rule'];
      $data['explain'] = $game['explain'];
      $data['special'] = $game['special'];

    return json(['data'=>$data,'code'=>0,'msg'=>'获取成功']);
  }

  
}