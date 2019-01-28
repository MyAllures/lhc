<?php
namespace app\common\model;
use think\Model;

class Setting extends Model{

	public function getValueAttr($value,$data){
		return json_decode($value,true);
	}

	public function setValueAttr($value){
		return json_encode($value,JSON_UNESCAPED_UNICODE);
	}
}