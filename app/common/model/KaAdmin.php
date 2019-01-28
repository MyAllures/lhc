<?php
namespace app\common\model;
use think\Model;

class KaAdmin extends Model{

   	public function role(){
        return $this->belongsTo('Role','role_id');
    }
}