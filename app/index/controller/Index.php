<?php
namespace app\index\controller;
use think\Db;
class Index extends Common{
	//后台首页
	public function index(){
	    $webname=$this->checkSys('webname');
	    $sess=session('lhc_index');
	    $user=Db::name('mem')->find($sess['id']);
	    $res=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$user['kauser']])->field('sum(sum_m) sum_m')->select();
        $z_re=0;
        $z_sum=0;
        $z_dagu=0;
        $z_guan=0;
        $z_zong=0;
        $z_dai=0;
        $re=0;
        $z_user=0;
        $z_userds=0;
        $z_daids=0;
        $result=Db::name('tan')->where(['username'=>$user['kauser'],'kithe'=>getKitheNum()])->limit(5)->order(['id'=>'desc'])->select();
        foreach ($result as $k=>$v){
            $z_re++;
            $z_sum+=$v['sum_m'];
            if($v['class1']=='过关') {
                $show1 = explode(',', $v['class2']);
                $show2 = explode(",", $v['class3']);
                $z = count($show1);
                $result[$k]['td5'] = [];
                $k1 = 0;
                for ($j = 0; $j < count($show1) - 1; $j = $j + 1) {
                    $result[$k]['td5'][$j] = $show1[$j] . '&nbsp;' . $show2[$k1] . '@ &nbsp;' . $show2[$k1 + 1];
                    $k1 = $k1 + 2;
                }
            }
            $z_userds+=$v['sum_m']*$v['user_ds']/100;
            $z_user+=$v['sum_m']*$v['rate']+$v['sum_m']*$v['user_ds']/100-$v['sum_m'];
            $result[$k]['adddate']=date('H:i:s',strtotime($v['adddate']));
        }
        //会员类型
        $hy=[];
        if($user['abcd']!=$user['ma'] && $user['ma']!='')$hy[]='A';
        if($user['abcd']!=$user['mb'] && $user['mb']!='')$hy[]='B';
        if($user['abcd']!=$user['mc'] && $user['mc']!='')$hy[]='C';
        if($user['abcd']!=$user['md'] && $user['md']!='')$hy[]='D';

        $top=Db::name('kithe')->where(['na'=>['neq',0]])->order('id desc')->find();
	    return $this->fetch('',[
		    'webname'=>$webname,
            'user'=>$user,
            'sum'=>$res[0]['sum_m'],
            'result'=>$result,
            'hy'=>$hy,
            'top'=>$top
        ]);
	}

	public function reload(){
//	    if(input('act')!='reload'){
//            return json(['code'=>1,'msg'=>'非法访问']);
//        }

        $sess=session('lhc_index');
        $user=Db::name('mem')->find($sess['id']);
        $result=Db::name('tan')->field('adddate,class1,class2,class3,rate,sum_m')->where(['username'=>$user['kauser'],'kithe'=>getKitheNum()])->limit(5)->order(['id'=>'desc'])->select();
        foreach ($result as $k=>$v){
            if($v['class1']=='过关') {
                $show1 = explode(',', $v['class2']);
                $show2 = explode(",", $v['class3']);
                $z = count($show1);
                $result[$k]['td5'] = [];
                $k1 = 0;
                for ($j = 0; $j < count($show1) - 1; $j = $j + 1) {
                    $result[$k]['td5'][$j] = $show1[$j] . '&nbsp;' . $show2[$k1] . '@ &nbsp;' . $show2[$k1 + 1];
                    $k1 = $k1 + 2;
                }
            }
            $result[$k]['adddate']=date('H:i:s',strtotime($v['adddate']));
        }
        $res=Db::name('tan')->where(['kithe'=>getKitheNum(),'username'=>$user['kauser']])->field('sum(sum_m) sum_m')->select();
        $sum_m=$res[0]['sum_m'] ? round($res[0]['sum_m'],2) : 0;
        $result['userinfo']=['ts'=>round($user['ts'],2),'bets'=>$sum_m];
        return json($result);
    }

    public function errorPage(){
        return $this->fetch('',[
            'msg'=>input('msg'),
        ]);
    }

    public function changeType(){
	    if(!input('?type'))return json(['code'=>1]);
	    $j=input('type','','trim');
	    $sess=session('lhc_index');
        if($j=='A' && $j=='B' && $j=='C' && $j=='D' || !empty($sess['kauser'])){
            Db::name('mem')->where(['kauser'=>$sess['kauser']])->update(['abcd'=>$j]);
            $danid=$sess['id'];
            $result =Db::name('quota')->where(['lx'=>0,'userid'=>$danid])->select();
            $t=0;
            foreach ($result as $k=>$v){
                if ($j !="A"){$yga='0';}else{$yga=$v['yg'];}
                if ($j !="B"){$ygb='0';}else{$ygb=$v['ygb'];}
                if ($j !="C"){$ygc='0';}else{$ygc=$v['ygc'];}
                if ($j !="D"){$ygd='0';}else{$ygd=$v['ygd'];}

                if($j == 'A'){
                    $kads= $v['yga'];
                }else{
                    if($j == 'B'){
                        $kads= $v['ygb'];
                    }else{
                        if($j == 'C'){
                            $kads = $v['ygc'];
                        }else{
                            if($j == 'D'){
                                $kads = $v['ygd'];
                            }
                        }
                    }
                }
                Db::name('quota')->where(['userid'=>$danid,'ds'=>$v['ds'],'flag'=>1])->update(['yg'=>$kads,'xx'=>$v['xx'],'xxx'=>$v['xxx'],'ds'=>$v['ds'],'abcd'=>$j]);
            }
            return json(['code'=>0,'msg'=>'ok']);
        }
    }
}



?>