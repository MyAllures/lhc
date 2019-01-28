<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Log;

class Article extends Controller{

	protected $Article = null;
	protected function _initialize(){
		parent::_initialize();
		$this->Article = model('Article');
	}

	public function agreement(){
		$article = $this->Article->get(1);
    	$data['id'] = $article['id'];
    	$data['title'] = $article['cname'];
    	$data['content'] = $article['content'];
    	return json(['data'=>$data,'code'=>0,'msg'=>'加载成功']);
	}

    public function message(){
    	$articles = $this->Article->where(['class_1'=>7])->order('id desc')->select();
    	$data = [];
    	foreach ($articles as $key => $value) {
    		$data[$key]['id'] = $value['id'];
    		$data[$key]['content'] = $value['description'];
    	}
    	return json(['data'=>$data,'code'=>0,'msg'=>'加载成功']);
    }

	public function notice(){
    	$articles = $this->Article->where(['class_1'=>7])->order('id desc')->select();
    	$data = [];
    	foreach ($articles as $key => $value) {
    		$data[$key]['id'] = $value['id'];
    		$data[$key]['title'] = $value['cname'];
    		$data[$key]['content'] = $value['content'];
    	}
    	return json(['data'=>$data,'code'=>0,'msg'=>'加载成功']);
    }    
}