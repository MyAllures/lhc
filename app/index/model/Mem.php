<?php
namespace app\index\model;
use think\Model;
use think\Db;
use think\Request;
class Mem extends Model{
	public function login($data){
		$res=db('mem')->where($data)->find();
		if($res['stat']==1){
		    return -2;
        }elseif($res){
			//登录成功
			if(input('?post.remember')){
                cookie('lhc_index',setcookieValue($res['kauser']),3600*24*7);	//默认保存一周的时间
            }
			session('lhc_index',['kauser'=>$res['kauser'],'id'=>$res['id']]);	//保存的是代理用户的信息
            $upd=[
                'zlogin'=>date('Y-m-d H:i;s',time()),
                'zip'=>\request()->ip()
            ];
            Db::name('mem')->where(['id'=>$res['id']])->update($upd);
            Db::name('mem')->where(['id'=>$res['id']])->setInc('look');
            return -10;//
		}else{
			return -1;
		}
	}
}

?>