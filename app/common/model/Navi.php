<?php
namespace app\common\model;
use think\Model;

use traits\model\SoftDelete;
class Navi extends Model{

    use SoftDelete;
    public function getSubnavisAttr($value,$data){
        $id = $data['id'];
        $subnavis = $this->where(['pid'=>$id])->order('sort asc')->select();
        return $subnavis;
    }

    public function getPnaviAttr($value,$data){
        $pid = $data['pid'];
        $pnavi = $this->where(['id'=>$pid])->find();
        return $pnavi;
    }

    public function getPositionTextAttr($value,$data){
        $text=['admin'=>'总管理','merchant'=>'商户管理'];
        $position = $data['position'];
        return $text[$position];
    }

    public function navis($pid,$position='',$filter=[],$level=3){
    	 $func  = function ($pid,$position,$filter,$level) use (&$func) {
            $where['pid'] = $pid;
            if (!empty($position)) {
                $where['position'] = ['like','%'.$position.'%'];
            }
            if (!empty($filter)) {
               $where['id'] = array('in',$filter);
            }
            $list = $this->where($where)->order(['sort asc'])->select();
            $data = [];
            if($level <= 0) return $data;
                        $level --;
            foreach ($list as $key => $value) {
                $data[$key]['id'] = $value['id'];
                $data[$key]['pid'] = $value['pid'];
                $data[$key]['name'] = $value['name'];
                $data[$key]['cname'] = $value['cname'];
                $data[$key]['icon'] = $value['icon'];
                $data[$key]['target'] = $value['target'];
                $data[$key]['action'] = $value['action'];
                $data[$key]['url'] = $value['url'];
                $data[$key]['sort'] = $value['sort'];
                $data[$key]['subnavis'] = $func($value['id'],$position,$filter,$level);
            }
            return $data;
        };
        return $func($pid,$position,$filter,$level);
    }

    public function tree($pid,$position='',$filter=[],$level=3){
        $func  = function ($pid,$position,$filter,$level) use (&$func) {
            $where['pid'] = $pid;
            if (!empty($position)) {
                $where['position'] = ['like','%'.$position.'%'];
            }
            if (!empty($filter)) {
               $where['id'] = array('in',$filter);
            }
            $list = model('Navi')->where($where)->order(['sort asc'])->select();
            $data = [];
            if($level <= 0) return $data;
            foreach ($list as $key => $value) {
                $data[$key]['id'] = $value['id'];
                $data[$key]['pid'] = $value['pid'];
                $data[$key]['name'] = $value['cname'];
                $data[$key]['check'] = true;
                $data[$key]['children'] = $func($value['id'],$position,$filter,$level);
            }
            $level --;
            return $data;
        };
        return $func($pid,$position,$filter,$level);
    }

    public function getUrlAttr($value,$data){
        $action = $data['action'];
        if(strpos($action, 'http') === false){
            $params = [];
            if (!empty($data['params'])) {
                $params = json_decode($data['params'],true);
            }
            return url($action,$params);
        }
        return $action;
    }

}