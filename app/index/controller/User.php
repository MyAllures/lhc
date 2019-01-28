<?php
namespace app\index\controller;
use app\index\controller\Common;
use think\Db;
use think\Loader;
class User extends Common{
	/*用户列表*/
	public function index(){
	    $lhc_index=session('lhc_index');
        $user=Db::name('mem')->find($lhc_index['id']);
        $pk=[];
        if($user['ma']!=$user['abcd'] && !empty($user['ma']))$pk[]=$user['ma'];
        if($user['mb']!=$user['abcd'] && !empty($user['mb']))$pk[]=$user['mb'];
        if($user['mc']!=$user['abcd'] && !empty($user['mc']))$pk[]=$user['mc'];
        if($user['md']!=$user['abcd'] && !empty($user['md']))$pk[]=$user['md'];
        //用户项目类型对应的数据
        $data=Db::name('quota')->where(['userid'=>$user['id'],'lx'=>0,'flag'=>1])->select();
		return $this->fetch('',[
		    'user'=>$user,
            'data'=>$data,
            'pk'=>$pk,
        ]);
	}

	//保存修改
	public function saveUser(){
        if(!input('?id') || !$this->request->isPost())return json(['code'=>1,'msg'=>'非法访问']);
        if(!input('pass'))return json(['code'=>1,'msg'=>'新密码不能为空']);
        $where=[
            'kapassword'=>md5(input('pass')),
            'id'=>input('id')
        ];
        $res=Db::name('mem')->update($where);
        if($res){
            return json(['code'=>0,'msg'=>'修改成功']);
        }else{
            return json(['code'=>1,'msg'=>'修改失败']);
        }

    }

}

?>