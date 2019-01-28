<?php
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
use think\Env;
use think\Request;
use think\Loader;

class Login extends Common{
	//登录页
	public function index(){
		return $this->fetch();
	}

	/**
	 * 密码加密方式 md5(md5(密码)+秘钥)
	 * 用户登录中心
	 * @return null
	 */
	public function login(){
		if(request()->isAjax()){
		    Db::table('tj')->where(['username'=>input('username'),'ip'=>$this->request->ip()])->delete();
		    $vip=0;
            //判断当前用户是否存在
            $res=Db::name('guan')->field('id,lx,guan,zong,guanid')->where(['kauser'=>trim(input('post.username')),'stat'=>0])->find();
			if(!$res) {
			    $r1=Db::name('zi')->field('id,lx')->where(['kauser'=>trim(input('post.username'))])->find();
			    if($r1){    //子账号
			        $res=$r1;
                    $vip=1;
                }else{
                    echo -2;
                    exit;
                }
			}
			//判断该用户上级状态  非子账号
            if(!$vip){
                if($res['lx']==2){  //总代
                    if(!Db::name('guan')->field('id')->where(['kauser'=>$res['guan'],'stat'=>0])->find()){
                        echo -5;
                        exit;
                    }
                }elseif ($res['lx']==3){//代理
                    if(!Db::name('guan')->field('id')->where(['kauser'=>$res['zong'],'stat'=>0])->find()){
                        echo -5;
                        exit;
                    }
                }elseif ($res['lx']==1){ //股东
                    if(!Db::name('guan')->field('id')->where(['id'=>$res['guanid'],'stat'=>0])->find()){
                        echo -5;
                        exit;
                    }
                }
            }
			$data=[
				'kauser'=>trim(input('post.username')),
				'kapassword'=>md5(input('post.password'))
			];
			$admin=model('guan');
			echo $admin->login($data,$vip);
		}else{
			$this->error('非法访问');
		}
	}
	
	/**
	 * 退出登录
	 * @return null
	 */
	public function logout(){
		session('lhc_users',null);
		cookie('lhc_users',null);
		$this->redirect('login/index');
	}

}

