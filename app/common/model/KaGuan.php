<?php
namespace app\common\model;
use think\Model;

class KaGuan extends Model{

	public function getLxTextAttr($value,$data){
		$lx = $data['lx'];
		$text = [4=>'大股东',1=>'股东',2=>'总代',3=>'代理'];
		return isset($text[$lx])?$text[$lx]:'';
	}

	public function getPzTextAttr($value,$data){
		$pz = $data['pz'];
		$text = [0=>'正常',1=>'禁止'];
		return isset($text[$pz])?$text[$pz]:'';
	}

	public function getStateTextAttr($value,$data){
		$stat = $data['stat'];
		$text = [0=>'正常',1=>'禁止'];
		return isset($text[$stat])?$text[$stat]:'';
	}

	public function getPlateAttr($value,$data){
		return json_decode($value,true);
	}
}