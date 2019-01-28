<?php
namespace app\common\model;
use think\Model;
use traits\model\SoftDelete;

class User extends Model{

	use SoftDelete;
    public function setPaypwdAttr($value){
        return md5($value);
    }

    public function setPasswordAttr($value){
        return md5($value);
    }

    public function setIdcardAttr($value){
        return json_encode($value,JSON_UNESCAPED_UNICODE);
    }

    public function getIdcardAttr($value,$data){
        return json_decode($value,true);
    }

    public function getSexTextAttr($value,$data){
        $sex = $data['sex'];
        $text = [0=>'保密',1=>'男',2=>'女'];
        return isset($text[$sex])?$text[$sex]:'';
    }

	public function getStateTextAttr($value,$data){
		$state = $data['state'];
		$text = ['0'=>'禁用','1'=>'正常'];
		return $text[$state];
	}

    public function getCheckTextAttr($value,$data){
        $check = $data['check'];
        $text = ['0'=>'拒绝','1'=>'通过'];
        return $text[$check];
    }

    public function getTakeOverAttr($value,$data){
        return json_decode($value,true);
    }

    public function getBlacklistAttr($value,$data){
        if (empty($value)) {
            return [];
        }else{
            return json_decode($value,true);
        }
    }
    public function setBlacklistAttr($value){
        return json_encode($value);
    }

   	public function role(){
        return $this->belongsTo('Role','role_id');
    }

    public function agent(){
    	return $this->hasOne('Agent','user_id');
    }

    public function channel(){
    	return $this->belongsTo('Channel','channel_id');
    }

    public function children(){
        return $this->hasManyThrough('User','Invite','user_id','object_id','id');
    }
}