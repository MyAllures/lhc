<?php
namespace app\common\model;
use think\Model;
use traits\model\SoftDelete;

class Article extends Model{

	use SoftDelete;
	public function getClassIdAttr($value,$data){
		return $data['class_3'] == 0?($data['class_2'] == 0?$data['class_1']:$data['class_2']):$data['class_3'];
	}

	public function class0(){
		return $this->belongsTo('ArticleClass','class_id');
	}

	public function class1(){
		return $this->belongsTo('ArticleClass','class_1');
	}

	public function class2(){
		return $this->belongsTo('ArticleClass','class_2');
	}

	public function getObjectTextAttr($value,$data){
		$object = $data['object'];
		$text = [0=>'全部',1=>'商家',2=>'会员'];
		return $text[$object];
	}

	public function getStateTextAttr($value,$data){
		$state = $data['state'];
		$text = ['0'=>'草稿','1'=>'发布'];
		return $text[$state];
	}

	public function articlereadlist(){
		return $this->hasMany('ArticleRead','article_id');
	}
}