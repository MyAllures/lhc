<?php
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
use think\Request;
/*自动补仓 -- 栏目*/
class Bucang extends Common{

    public function __construct(Request $request = null)
    {
        $this->pd=true;
        parent::__construct($request);
    }

    public function index(){
        $row=$this->guan;
        $ids="特A";
        $best=$row['best'];
        $zm1=$row['zm1'];
        $zm61=$row['zm61'];
        $lm1=$row['lm1'];
        $lm2=$row['lm2'];
        $lm3=$row['lm3'];
        $lm4=$row['lm4'];
        $lm5=$row['lm5'];
        $lx1=$row['lx1'];
        $lx2=$row['lx2'];
        $lx3=$row['lx3'];
        $lx4=$row['lx4'];
        $lx5=$row['lx5'];
        $lx6=$row['lx6'];
        $lx7=$row['lx7'];
        $qsb1=$row['qsb1'];
        $zt1=$row['zt1'];
        $tm1=$row['tm1'];
        $sx1=$row['sx1'];
        $bb1=$row['bb1'];
        $gg1=$row['gg1'];
        $ws1=$row['ws1'];
        $xx1=$row['xx1'];
        $wx1=$row['wx1'];
        $yx1=$row['yx1'];
        $qbz1=$row['qbz1'];
        $qbz2=$row['qbz2'];
        $qbz3=$row['qbz3'];
        $qbz4=$row['qbz4'];
        $qbz5=$row['qbz5'];
        $qbz6=$row['qbz6'];
        $qbz7=$row['qbz7'];
        $qbz8=$row['qbz8'];
        $wsl1=$row['wsl1'];
        $wsl2=$row['wsl2'];
        $wsl3=$row['wsl3'];
        $wsl4=$row['wsl4'];
        $wsl5=$row['wsl5'];
        $wsl6=$row['wsl6'];
        $pz=$row['pz'];
        $kithe=input('?kithe') ? input('kithe') : getKitheNum();
        if($kithe!=getKitheNum()){
            $ftime=20000000;
        }
        $ka_guanid=$row['id'];
        $mumu=0;
        if($row['lx']==4){
            $result=Db::name('guan')->field(['sum(cs) sum'])->where(['lx'=>1,'guanid'=>$row['id']])->select();
            $mumu=$result ? $result[0]['sum'] : 0;
        }
        if($row['lx']==1){
            $result=Db::name('guan')->field(['sum(cs) sum'])->where(['lx'=>2,'guanid'=>$row['id']])->select();
            $mumu=$result ? $result[0]['sum'] : 0;
        }
        if($row['lx']==2){
            $result=Db::name('guan')->field(['sum(cs) sum'])->where(['lx'=>3,'zongid'=>$row['id']])->select();
            $mumu=$result ? $result[0]['sum'] : 0;
        }
        if($row['lx']==3){
            $result=Db::name('mem')->field(['sum(cs) sum'])->where(['danid'=>$row['id']])->select();
            $mumu=$result ? $result[0]['sum'] : 0;
        }
        $mkmk=getTanKitheSum();
        $sum_sumz=$row['cs']-$mkmk-$mumu;       //当前用户剩余的可用信用额度
        $R=0;
        $XF=11;
        return $this->fetch('',[
            'users'=>$row,
        ]);
    }

    public function save(){
        $json=['code'=>1,'msg'=>''];
        if(input('?id') && $this->request->isPost()){
           $data=Db::name('guan')->find(input('id'));
           if(!$data){
               $json['msg']='当前用户不存在';
               return json($json);
           }
           if(Db::name('guan')->update($this->request->param())){
               $json['code']=0;
               $json['msg']='修改成功';
           }else{
               $json['msg']='修改失败';
           }
           return json($json);
        }else{
            $json['msg']='非法访问';
            return json($json);
        }
    }
}
