<?php
namespace app\common\model;
use think\Model;
use traits\model\SoftDelete;

class Finance extends Model{

    use SoftDelete;
	public function user(){
    	return $this->belongsTo('User','user_id');
    }

    public function getModeTextAttr($value,$data){
    	$model = $data['mode'];
    	$text = [1=>'系统赠送',2=>'代理充值',3=>'支付宝充值',4=>'微信充值'];
    	return isset($text[$model])?$text[$model]:'';
    }

    public function getStateTextAttr($value,$data){
    	$state = $data['state'];
    	$text = [0=>'取消订单',1=>'提交订单',2=>'已确认'];
    	return $text[$state];
    }

    public function getTypeTextAttr($value,$data){
        $type = $data['type'];
        $text = [1=>'充值',2=>'兑换',3=>'消费'];
        return isset($text[$type])?$text[$type]:'';
    }
}