<?php
namespace app\common\model;
use think\Model;
use traits\model\SoftDelete;

class Agent extends Model{

	use SoftDelete;
	public function getStateTextAttr($value,$data){
		$state = $data['state'];
		$text = ['0'=>'禁用','1'=>'正常'];
		return $text[$state];
	}
	public function user(){
    	return $this->belongsTo('User','user_id');
    }
}