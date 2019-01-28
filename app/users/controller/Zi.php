<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/17
 * Time: 10:56
 */
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
use think\Request;

class Zi extends Common{
    public function __construct(Request $request = null)
    {
        $this->pd=true;
        parent::__construct($request);
    }

    //子账户管理
    public function index(){
        $data=$this->guan;
        $result=Db::name('zi')->where(['guan'=>$data['kauser']])->order(['id'=>'desc'])->select();
        return $this->fetch('',[
            'data'=>$data,
            'result'=>$result
        ]);
    }

    public function addZi(){
        $sess=session('lhc_users');
        return $this->fetch('',['users'=>$sess]);
    }

    public function saveZi(){
        $json=['code'=>1,'msg'=>''];
        if($this->request->isPost() && input('?pid')){
            if(!input('kauser')){
                $json['msg']='账号不能为空';
                return json($json);
            }
            if(!input('kapassword')){
                $json['msg']='密码不能为空';
                return json($json);
            }
            $data=Db::name('guan')->find(input('pid'));
            if(!$data){
                $json['msg']='当前用户不存在';
                return json($json);
            }
            $num=Db::name('guan')->where(['kauser'=>input('kauser')])->count();
            if($num!=0){
                $json['msg']='这一用户名称已被占用，请得新输入！';
                return json($json);
            }
            $num=Db::name('mem')->where(['kauser'=>input('kauser')])->count();
            if($num!=0){
                $json['msg']='这一用户名称已被某会员占用，请得新输入！';
                return json($json);
            }
            $num=Db::name('zi')->where(['kauser'=>input('kauser')])->count();
            if($num!=0){
                $json['msg']='这一用户名称已被某子用户占用，请得新输入！';
                return json($json);
            }

            $arr=[
                'kauser'=>input('kauser'),
                'kapassword'=>md5('kapassword'),
                'guan'=>$data['kauser'],
                'guanid'=>$data['id'],
                'lx'=>$data['lx'],
                'adddate'=>date('Y-m-d H:i:s')
            ];
            if(!Db::name('zi')->insert($arr)){
                $json['msg']='新增子用户失败!';
                return json($json);
            }
            return json(['code'=>0,'msg'=>'新增成功']);
        }else{
            $json['msg']='非法访问';
            return json($json);
        }
    }

    public function updateZi(){
        $json=['code'=>1,'msg'=>''];
        if(!input('?id')){
            $json['msg']='非法访问';
            return json($json);
        }
        $data=Db::name('zi')->find(input('id'));
        if(!$data){
            $json['msg']='当前子账户不存在';
            return json($json);
        }
        return $this->fetch('',[
            'data'=>$data
        ]);
    }

    public function saveUpdate(){
        $json=['code'=>1,'msg'=>''];
        if(!input('?id')){
            $json['msg']='非法访问';
            return json($json);
        }
        $data=Db::name('zi')->find(input('id'));
        if(!$data){
            $json['msg']='当前子账户不存在';
            return json($json);
        }
        if(!input('kapassword')){
            $json['msg']='请输入新密码';
            return json($json);
        }
        if($data['kapassword']==md5(input('kapassword'))){
            $json['msg']='新密码不能和原密码一致';
            return json($json);
        }
        $arr=[
            'id'=>input('id'),
            'kapassword'=>md5(input('kapassword'))
        ];
        if(Db::name('zi')->update($arr)){
            $json['msg']='修改成功';
            $json['code']=0;
        }else{
            $json['msg']='修改失败';
        }
        return json($json);
    }

    public function deleteZi(){
        $json=['code'=>1,'msg'=>''];
        if(!input('?id')){
            $json['msg']='非法访问';
            return json($json);
        }
        if(Db::name('zi')->delete(input('id'))){
            $json['code']=0;
            $json['msg']='删除成功';
            return json($json);
        }else{
            $json['msg']='删除失败';
            return json($json);
        }
    }
}