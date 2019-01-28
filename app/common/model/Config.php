<?php
namespace app\common\model;
use think\Model;

class Config extends Model{
    //protected $table='config';

	public function getCnameAttr($value,$data){
		return $data['webname'];
	}

	public function getSnameAttr($value,$data){
		return $data['websname'];
	}

	public function getOpenAttr($value,$data){
		return $data['opwww'];
	}
}