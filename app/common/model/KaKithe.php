<?php
namespace app\common\model;
use think\Model;

class KaKithe extends Model{

	public function getN1ImageAttr($value,$data){
		$value = $data['n1'];
		return '<img src="/public/static/images/num/num'.$value.'.gif">';
	}

	public function getN2ImageAttr($value,$data){
		$value = $data['n2'];
		return '<img src="/public/static/images/num/num'.$value.'.gif">';
	}

	public function getN3ImageAttr($value,$data){
		$value = $data['n3'];
		return '<img src="/public/static/images/num/num'.$value.'.gif">';
	}

	public function getN4ImageAttr($value,$data){
		$value = $data['n4'];
		return '<img src="/public/static/images/num/num'.$value.'.gif">';
	}

	public function getN5ImageAttr($value,$data){
		$value = $data['n5'];
		return '<img src="/public/static/images/num/num'.$value.'.gif">';
	}

	public function getN6ImageAttr($value,$data){
		$value = $data['n6'];
		return '<img src="/public/static/images/num/num'.$value.'.gif">';
	}

	public function getNaImageAttr($value,$data){
		$value = $data['na'];
		return '<img src="/public/static/images/num/num'.$value.'.gif">';
	}

	public function getStateAttr($value,$data){
		$na = $data['na'];
		return $na != 0?1:0;
	}

	public function getStateTextAttr($value,$data){
		$na = $data['na'];
		return $na != 0?'已开奖':'未开奖';
	}
}