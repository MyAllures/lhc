<?php
namespace app\common\model;
use think\Model;

class Game extends Model{

	public function getStateTextAttr($value,$data){
		$value = $data['state'];
		$text = [0=>'禁用',1=>'可用'];
		return isset($text[$value])?$text[$value]:'';
	}
}