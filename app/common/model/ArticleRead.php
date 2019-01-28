<?php
namespace app\common\model;
use think\Model;

class ArticleRead extends Model{

    public function article(){
    	return $this->belongsTo('Article','article_id');
    }

   	public function user(){
    	return $this->belongsTo('User','user_id');
    }
}