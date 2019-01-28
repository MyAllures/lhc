<?php
namespace app\users\controller;
use think\Request;
use think\Db;
class Index extends Common{
	//后台首页
	public function index(){
	    $users=session('lhc_users');
	    if($users['vip']==1){
            $data=Db::name('zi')->find($users['id']);
            $ch='子账户';
        }else{
            $data=Db::name('guan')->where(['kauser'=>$users['kauser']])->find();
            switch ($data['lx']){
                case 1:
                    $ch='股东';
                    break;
                case 2:
                    $ch='总代理';
                    break;
                case 3:
                    $ch='代理';
                    break;
                case 4:
                    $ch='大股东';
                    break;
            }
        }
        $data['vip']=$users['vip'];
		return $this->fetch('',[
		    'admin'=>$data,
            'webname'=>getConfigField('webname'),
            'ch'=>$ch,
        ]);
	}
}



?>