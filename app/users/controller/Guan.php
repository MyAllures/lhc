<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/17
 * Time: 17:26
 */
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
use think\Request;

/*个人资料  --栏目 */
class Guan extends Common{
    public function __construct(Request $request = null)
    {
        $this->pd=true;
        parent::__construct($request);
    }

    //非子账户
    public function index(){
        $guan=$this->guan;
        $maxnum=2000000000;
        $istar=0;
        $iend=100;
        //只需要计算当前股东下的所有代理？？  非股东怎么办
        $result=Db::name('guan')->where(['lx'=>2,'guanid'=>$guan['id']])->field(['sum(cs) sum'])->select();
        $mumu=empty($result) ? 0 :$result[0]['sum'];
        $mkmk=getTanKitheSum();
        $sum_num=$guan['cs']-$mumu-$mkmk;
        if($guan['lx']==4){
            $res=Db::name('guands')->where(['lx'=>0])->select();
        }else{
            $res=Db::name('quota')->where(['userid'=>$guan['id']])->select();
        }
        $guan['quota']=empty($res) ? [] : $res;
        return $this->fetch('',[
            'guan'=>$guan,
            'sum_num'=>$sum_num,
        ]);
    }
    //非子用户修改密码
    public function savePass(){
        $sess=session('lhc_users');
        $guan=Db::name('guan')->find($sess['id']);
        if($sess['vip']!=0)return json(['code'=>1,'msg'=>'非法访问']);
        return $this->fetch('',[
            'guan'=>$guan
        ]);
    }
    public function saveGuan(){
        $json=['code'=>1,'msg'=>''];
        if(!input('?id')){
            $json['msg']='非法访问';
            return json($json);
        }
        $data=Db::name('guan')->find(input('id'));
        if(!$data){
            $json['msg']='当前用户不存在';
            return json($json);
        }
        if(!input('xm')){
            $json['msg']='姓名不能为空';
            return json($json);
        }
        if($data['kapassword']==md5(input('kapassword'))){
            $json['msg']='新密码不能和原密码一致';
            return json($json);
        }
        $arr=[
            'id'=>input('id'),
            'xm'=>trim(input('xm'))
        ];
        if(input('kapassword')){
            $arr['kapassword']=md5(trim(input('kapassword')));
        }
        if(Db::name('guan')->update($arr)){
            $json['msg']='修改成功';
            $json['code']=0;
        }else{
            $json['msg']='修改失败';
        }
        return json($json);
    }

    //子账户个人资料修改
    public function zi(){
        $sess=session('lhc_users');
        if(!$sess['vip'])$this->error('非法访问');
        $zi=Db::name('zi')->find($sess['id']);
        if($sess['vip']==0)return json(['code'=>1,'msg'=>'非法访问']);
        return $this->fetch('',[
            'zi'=>$zi
        ]);
    }

    //保存修改
    public function saveZi(){
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


}