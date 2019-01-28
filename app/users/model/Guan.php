<?php
namespace app\users\model;
use think\Model;
use think\Db;
use think\Request;
class Guan extends Model{
	public function login($data,$vip){
	    if($vip){
            $res=db('zi')->where($data)->find();
        }else{
            $res=db('guan')->where($data)->find();
        }
		if($res){
			//登录成功
			if(input('?post.remember')){
			    //cookie还是保存的当前表的kauser字段  唯一性
				cookie('lhc_users',setcookieValue($res['kauser']),3600*24*7);	//默认保存一周的时间
			}
			if($vip==1){
                session('lhc_users',['kauser'=>$res['guan'],'id'=>$res['id'],'lx'=>$res['lx'],'vip'=>$vip]);	//保存的是代理用户的信息
            }else{
                session('lhc_users',['kauser'=>$res['kauser'],'id'=>$res['id'],'lx'=>$res['lx'],'vip'=>$vip]);	//保存的是代理用户的信息
            }
           if(!$vip){
               $upd=[
                   'zlogin'=>date('Y-m-d H:i;s',time()),
                   'zip'=>\request()->ip()
               ];
               Db::name('guan')->where(['id'=>$res['id']])->update($upd);
               Db::name('guan')->where(['id'=>$res['id']])->setInc('look');
           }
            return 1;
		}else{
			return -1;
		}
	}

}


?>