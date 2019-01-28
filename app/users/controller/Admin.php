<?php
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
class Admin extends Common{
	//修改密码
	public function changePass(){
		if($this->request->isAjax()){
			$up=session('lhc_users');
			if($up['vip']){
			    $dbname='zi';
            }else{
                $dbname='guan';
            }
            $res=Db::name($dbname)->find($up['id']);
			if(!$res){
				$this->error('当前代理不存在');
			}
			$password=md5(input('password1'));
			if($password==$res['password']){
				if(input('password2')!=input('password3')){
                    echo '两次密码不一致';
                    exit;
                }
				if(strlen(input('password2')) >= 5 && strlen(input('password2')) <= 32){
					$rz=[
						'id'=>$res['id'],
						'password'=>md5(input('password2')),
					];
					if(Db::name($dbname)->update($rz)){
						echo 'success';
					}else{
						echo '修改失败';
					}
				}else{
					echo '密码长度在5-32位之间';
				}
			}else{
				echo '原密码不正确';
			}
			exit;
		}
		$users=session('lhc_users');
        if($users['vip']){
            $dbname='zi';
        }else{
            $dbname='guan';
        }
        $data=Db::name($dbname)->find($users['id']);
		return $this->fetch('',['data'=>$data]);
	}

}


?>