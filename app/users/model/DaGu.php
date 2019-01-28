<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/1/16
 * Time: 14:33
 */
namespace app\users\model;
use think\Db;
/**
 * 大股东
 * Class DaGu
 * @package app\users\model
 */
class DaGu{
    public function getGuan(){
        $sess=session('lhc_users');
        $data=Db::name('guan')->field('id,kauser,lx')->where(['lx'=>1,'guan1'=>$sess['kauser']])->select();
        return $data;
    }
}