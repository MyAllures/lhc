<?php
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
class Mem extends Common{
	//修改密码
	public function changePass(){
		if($this->request->isAjax()){
			$up=session('lhc_index');
			$res=Db::name('mem')->find($up['id']);
			if(!$res){
				$this->error('当前用户不存在');
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
					if(Db::name('mem')->update($rz)){
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
		return $this->fetch();
	}
}


?>