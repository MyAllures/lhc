<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/13
 * Time: 15:52
 */
namespace app\users\controller;
use app\users\controller\Common;
use think\Db;
class Kakithe extends Common{
    public function index(){
        return $this->fetch();
    }
    public function getData(){
        if(!$this->request->has('act')|| input('act')!='ajax')return json(['code'=>0, 'msg'=>'', 'count'=>0, 'data'=>'']);
        return $this->query($this->request->param());
    }
    public function query($query){
        $limit=$query['limit'];
        $start=$limit*($query['page']-1);
        $count=db('kithe')->where(['na'=>['neq',0]])->count();
        $result=db('kithe')->where(['na'=>['neq',0]])->limit($start,$limit)->order(['id'=>'desc'])->select();
        if($result){
            foreach ($result as $key=>$value){
                $result[$key]['color']=getColor($value['na']);
                switch (getColor($value['na'])){
                    case '红波':
                        $result[$key]['color']="<span style='color: #ff0000;'>".getColor($value['na'])."</span>";
                        break;
                    case'蓝波':
                        $result[$key]['color']="<span style='color: #0000ff;'>".getColor($value['na'])."</span>";
                        break;
                    default:
                        $result[$key]['color']="<span style='color: #00ff00;'>".getColor($value['na'])."</span>";
                        break;
                }
                $result[$key]['nd']=date('Y-m-d H:i',strtotime($value['nd']));
                $result[$key]['sx']=$value['x1'].$value['x2'].$value['x3'].$value['x4'].$value['x5'].$value['x6'].'+'.$value['sx']; //生肖
                $result[$key]['nall']=$value['n1']+$value['n2']+$value['n3']+$value['n4']+$value['n5']+$value['n6']+$value['na'];   //开奖球号总和
                $result[$key]['ds']=$value['na']%2==1 ? '<span style="color: #0000ff;">单</span>' : '<span style="color: #000000;">双</font>';  //单双
                $result[$key]['bs']=$value['na']>=25 ? "<span style='color: #0000ff;'>大</span>" :"<span style='color:#000000;'>小</span>" ;   //大小
                $result[$key]['hds']=($value['na']%10 +intval($value['na'])/10)%2==1 ? "<span style='color: #0000ff;'>合单</font>" : "<span style='color:#000000;'>合双</span>"; //合数单双
                $result[$key]['ads']=$result[$key]['nall'] % 2==1 ? "<span style='color: #0000ff;'>单</span>" : "<span style='color:#000000;'>双</span>";  //总分单双
                $result[$key]['abs']=$result[$key]['nall'] >=175 ?  "<span style='color: #0000ff;'>大</span>" : "<span style='color:#000000;'>小</span>";  //总分大小
                $result[$key]['n1']='<img src="/file/lhc_images/num'.$value['n1'].'.gif" />';
                $result[$key]['n2']='<img src="/file/lhc_images/num'.$value['n2'].'.gif" />';
                $result[$key]['n3']='<img src="/file/lhc_images/num'.$value['n3'].'.gif" />';
                $result[$key]['n4']='<img src="/file/lhc_images/num'.$value['n4'].'.gif" />';
                $result[$key]['n5']='<img src="/file/lhc_images/num'.$value['n5'].'.gif" />';
                $result[$key]['n6']='<img src="/file/lhc_images/num'.$value['n6'].'.gif" />';
                $result[$key]['na']='<img src="/file/lhc_images/num'.$value['na'].'.gif" />';
            }
        }
        return json([
            'code'=>0,
            'msg'=>'',
            'count'=>$count,
            'data'=>$result,
            'page'=>$query['page'],
            'limit'=>$query['limit'],
        ]);
    }
}