<?php
namespace app\index\model;
use think\Model;
use think\Db;
class Sxnumber extends Model{
    //获取number字段的第一个数字
    public function  getNumber($id){
        $res=Db::name('sxnumber')->find($id);
        $sz=explode(',',$res['m_number']);
        return intval($sz[0]);
    }
}