<?php
namespace app\common\model;
use think\Model;

class Role extends Model{

	public function getNavisArrAttr($value,$data){
		$navis = $data['navis'];
		return explode(',', $navis);
	}
}