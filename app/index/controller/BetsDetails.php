<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/5
 * Time: 10:06
 */
namespace app\index\controller;
use think\Db;
use app\index\controller\Common;
class BetsDetails extends Common{
    public function  index(){
        $sess=session('lhc_index');
        $mem=Db::name('mem')->find($sess['id']);
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
        $data=Db::name('tan')->field('id,adddate,kithe,sum_m,rate,user_ds,class1,class2,class3')->where(['username'=>$mem['kauser'],'kithe'=>getKitheNum()])->order(['id'=>'desc'])->paginate(20);
        $result=$data->all();
        foreach ($result as $k=>$v){
            $z_re++;
            if($v['class1']=='过关') {
                $show1 = explode(',', $v['class2']);
                $show2 = explode(",", $v['class3']);
                $z = count($show1);
                $result[$k]['td5'] = [];
                $k1 = 0;
                for ($j = 0; $j < count($show1) - 1; $j = $j + 1) {
                    $result[$k]['td5'][$j] = '<span style="color:#ff0000;">'.$show1[$j] . '&nbsp;' . $show2[$k1] . '</span>@ &nbsp;<span style="color:#ff6600;">' . $show2[$k1 + 1].'</span>';
                    $k1 = $k1 + 2;
                }
            }
        }

        $dataAll=Db::name('tan')->field('sum_m,rate,user_ds')->where(['username'=>$mem['kauser'],'kithe'=>getKitheNum()])->order(['id'=>'desc'])->select();
        $tj=['z_re'=>count($dataAll),'z_sum'=>0,'z_userds'=>0,'z_user'=>0];
        foreach ($dataAll as $k1=>$v1){
            $tj['z_sum']+=$v1['sum_m'];
            $tj['z_userds']+=$v1['sum_m']*$v1['user_ds']/100;
            $tj['z_user']+=$v1['sum_m']*$v1['rate']+$v1['sum_m']*$v1['user_ds']/100-$v1['sum_m'];
        }

        return $this->fetch('',[
            'result'=>$result,
            'z_re'=>$z_re,
            'z_sum'=>$z_sum,
            'z_userds'=>$z_userds,
            'z_user'=>$z_user,
            'page'=>$data->render(),
            'tj'=>$tj
        ]);
    }
}