<?php
namespace app\common\model;
use think\Model;
use traits\model\SoftDelete;

class ArticleClass extends Model{

	use SoftDelete;
	public function getStateTextAttr($value,$data){
		$state = $data['state'];
		$text = ['0'=>'禁用','1'=>'可用'];
		return $text[$state];
	}

	public function getSubclassesAttr($value,$data){
        $id = $data['id'];
        $subclasses = $this->where(['pid'=>$id])->select();
        return $subclasses;
    }

    public function getPclassAttr($value,$data){
        $pid = $data['pid'];
        $pclass = $this->where(['id'=>$pid])->find();
        return $pclass;
    }

	public function classes($pid,$filter=[],$level=3){
    	 $func  = function ($pid,$filter,$level) use (&$func) {
            $where['pid'] = $pid;
            if (!empty($filter)) {
               $where['id'] = array('in',$filter);
            }
            $list = $this->where($where)->order(['sort asc'])->select();
            $data = [];
            if($level <= 0) return $data;
            foreach ($list as $key => $value) {
                $data[$key]['id'] = $value['id'];
                $data[$key]['pid'] = $value['pid'];
                $data[$key]['cname'] = $value['cname'];
                $data[$key]['subclasses'] = $func($value['id'],$filter,$level);
            }
            $level --;
            return $data;
        };
        return $func($pid,$filter,$level);
    }
}