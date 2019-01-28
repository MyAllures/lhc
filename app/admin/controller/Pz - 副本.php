<?php
namespace app\admin\controller;

/**
*	注单管理
*/
class Pz extends Admin{

	protected $kithe = null;
	protected function _initialize(){
		parent::_initialize();
		$nn = Current_Kithe_Num();
		$KaKithe = model('KaKithe');
		$this->kithe = $KaKithe->where(['nn'=>$nn])->find();
		$this->assign('kithe',$this->kithe);
	}

	public function index(){
		$this->assign('meta_title','即时注单');
		return $this->fetch();
	}

	public function detail(){
		$this->assign('meta_title','详细信息');
		return $this->fetch();
	}

	public function loadtan(){
		$KaTan = model('KaTan');
		$page = input('get.page');
		$limit = input('get.limit');
		$nn = input('get.nn');
		$class1 = input('get.class1');
		if ($class1=="特码" || $class1=="正码" ){
			$where['kithe'] = $nn;
			$where['class1'] = $class1;
			$where['class3'] = input('get.class3');
			$where['dagu_zc'] = ['lt',0];
			$where['lx']  = input('get.lx',0);
			$list = $KaTan->where($where)->order('id desc')->paginate($limit,false,['page'=>$page]);
		}else {
			$where['kithe'] = $nn;
			$where['class1'] = $class1;
			$where['class2'] = input('get.class2');
			$where['class3'] = input('get.class3');
			$where['dagu_zc'] = ['lt',0];
			$list = $KaTan->where($where)->order('id desc')->paginate($limit,false,['page'=>$page]);
		}
		$data = [];
		foreach ($list as $key => $value) {
			$data[$key]['class2'] = $value['class2'];
			$data[$key]['num'] = $value['num'];
			$data[$key]['adddate'] = $value['adddate'];
			$data[$key]['kithe'] = $value['kithe'];
			$data[$key]['username'] = $value['username'];
			$data[$key]['abcd'] = $value['abcd'];
			$data[$key]['user_ds'] = $value['user_ds'];
			$data[$key]['sum_m'] = $value['sum_m'];
			$data[$key]['rate'] = $value['rate'];
			$data[$key]['dai_zc'] = $value['dai_zc'];
			$data[$key]['zong_zc'] = $value['zong_zc'];
			$data[$key]['guan_zc'] = $value['guan_zc'];
			$data[$key]['guan1_zc'] = $value['guan1_zc'];
			$data[$key]['dagu_zc'] = $value['dagu_zc'];
		}
		return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}

	public function zoufei(){
		$tm = input('post.tm');
		if (empty($tm)) {
			return json(['data'=>null,'code'=>1,'msg'=>'风险值不能为空，请输入数字']);
		}
		$ttm1 = input('post.ttm1');
		if (empty($ttm1)) {    
			return json(['data'=>null,'code'=>1,'msg'=>'退水不能为空，请输入数字']);   
		}
		$Adad = model('adad');
		$result = $Adad->where(['id'=>1])->update(['tm'=>$tm,'tm1'=>$ttm1]);
		if ($result) {
			return json(['data'=>null,'code'=>0,'msg'=>'保存成功']);
		}
		return json(['data'=>null,'code'=>1,'msg'=>'保存失败']); 
	}

	public function tm(){
		if ($this->request->isPost()) {

		}else{
			$class2 = input('param.class2','特A');
			$this->assign('class2',$class2);

			$Adad = model('adad');
			$ztm_tm = $Adad->where(['id'=>1])->value('tm');

			$KaTan = model('KaTan');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'特码','class2'=>$class2])->order('id')->select();
			$list = [];
			$sum_tm = [];
			$sum_re = [];
			$sum_m = [];
			$sum_ma = [];
			$sum_mbl = [];//赔率
			$sum_ds = [];
			$sum_xx = [];
			$sum_xx_7 = [];

			$z_re=0;
			$z_sum=0;
			$z_sumzc=0;
			$z_suma=0;
			$z_sumb=0;
			$z_ds=0;
			$z_xx=0;
			$z_pz=0;

			$z_re1=0;
			$z_sum1=0;
			$z_suma1=0;
			$z_sumb1=0;
			$z_ds1=0;
			$z_xx1=0;
			$z_pz1=0;
			foreach ($result as $key => $value) {
				$list[$key]['id'] = $value['id'];
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class1'] = $value['class1'];
				$list[$key]['class2'] = $value['class2'];
				$list[$key]['class3'] = $value['class3'];

				$where['kithe'] = $this->kithe;
				$where['class1'] = $value['class1'];
				$where['class3'] = $value['class3'];
				$res1 = $KaTan->field("sum(sum_m) as sum_m,sum(sum_m*dagu_zc/10) as sum_mzc, sum_m,count(*) as re,sum(0-sum_m*guan_ds/100*dagu_zc/10) as sum_ds,sum(0-sum_m*rate*dagu_zc/10) as sum_m3")->where($where)->find();

				$where['lx'] = 1;//补货
				$res2 = $KaTan->field("sum(sum_m*rate+sum_m*(user_ds/100)) as sum_money,count(*) as re,sum(0-sum_m*guan_ds/100*dagu_zc/10) as sum_ds,sum(0-sum_m) as sum_m3")->where($where)->find();

				$where['lx'] = 0;//会员下单
				$res3 = $KaTan->field("sum(sum_m*dagu_zc/10) as sum_moneya")->where($where)->find();


				$where['class2'] = '特B';//会员下单
				$res4 = $KaTan->field("sum(sum_m*dagu_zc/10) as sum_moneyb")->where($where)->find();

				$sum_tm[$key] = $value['class3'];
				$sum_re[$key] = $res1['re'];
				$sum_m[$key] = $res1['sum_m'] != ""?round($res1['sum_m'],0):0;
				$sum_ma[$key] = $res3['sum_moneya']!=""?$res3['sum_moneya']:0;
				$sum_mb[$key] = $res4['sum_moneyb']!=""?$res4['sum_moneyb']:0;

				$sum_ds[$key]=$res1['sum_ds'];
				$sum_xx[$key]=$res1['sum_m3'];
				$sum_xx_7[$key]=$res2['sum_m3'];

				$sum_bl[$key] = $value['rate']!=""?$value['rate']:0;
				$sum_mbl[$key] = $value['rate']!=""?$value['rate']:0;


				if ($key < 49){
					$z_re += $res1['re'];
					$z_sum += $res1['sum_m'];
					$z_sumzc += $res1['sum_mzc'];
					$z_suma += $res3['sum_moneya'];
					$z_sumb += $res4['sum_moneyb'];
					$z_ds += $res1['sum_ds'];
					$z_xx += $res1['sum_m3'];
					$z_pz += $res2['sum_m3'];
				}else{
					$z_re1+=$res1['re'];
					$z_sum1+=$res1['sum_m'];
					$z_suma1+=$res3['sum_moneya'];
					$z_sumb1+=$res4['sum_moneyb'];
					$z_ds1+=$res1['sum_ds'];
					$z_xx1+=$res1['sum_m3'];
					$z_pz1+=$res2['sum_m3'];
				}

				$sum_sx1[$key]=$res2['sum_money'];
				$sum_pz1[$key]=$res2['sum_m3']!=""?$res2['sum_m3']:0;

				if ($key<49){
					$color = Get_bs_Color($value['class3']);
					if ($color=="r") {
						$sum_color[$key]="ee0000";

					}else if ($color=="b"){
						$sum_color[$key]="0000FF";
					}else if ($color=="g"){
						$sum_color[$key]="008800";
					}
				}else{
					$sum_color[$key]="dd0000";
				}
			}
	

			foreach ($list as $key => $value) {
				switch ($value['class3']) {
					case '单':
					case '双':
					$sum_sx[$key]=(($sum_ma[49]+$sum_ma[50])-($sum_xx_7[49]+$sum_xx_7[50]))*0.97-($sum_ma[$key]-$sum_pz1[$key])*$sum_mbl[$key];  
					break;
					case '大':
					case '小':
					$sum_sx[$key]=(($sum_ma[51]+$sum_ma[52])-($sum_xx_7[51]+$sum_xx_7[52]))*0.97-($sum_ma[$key]-$sum_pz1[$key])*$sum_mbl[$key];
					break;
					case '合单':
					case '合双':
					$sum_sx[$key]=(($sum_ma[53]+$sum_ma[54])-($sum_xx_7[53]+$sum_xx_7[54]))*0.97-($sum_ma[$key]-$sum_pz1[$key])*$sum_mbl[$key];
					break;
					case '红波':
					case '绿波':
					case '蓝波':
					$sum_sx[$key]=(($sum_ma[55]+$sum_ma[56]+$sum_ma[57])-($sum_xx_7[55]+$sum_xx_7[56]+$sum_xx_7[57]))*0.97-($sum_ma[$key]-$sum_pz1[$key])*$sum_mbl[$key];
					break;
					case '家禽':
					case '野兽':
					$sum_sx[$key]=(($sum_ma[58]+$sum_ma[59])-($sum_xx_7[58]+$sum_xx_7[59]))*0.97-($sum_ma[$key]-$sum_pz1[$key])*$sum_mbl[$key];
					break;
					case '尾大':
					case '尾小':
					$sum_sx[$key]=(($sum_ma[60]+$sum_ma[61])-($sum_xx_7[60]+$sum_xx_7[61]))*0.97-($sum_ma[$key]-$sum_pz1[$key])*$sum_mbl[$key];
					break;
					case '大单':
					case '小单':
					case '大双':
					case '小双':
					$sum_sx[$key]=(($sum_ma[62]+$sum_ma[63]+$sum_ma[64]+$sum_ma[65])-($sum_xx_7[62]+$sum_xx_7[63]+$sum_xx_7[64]+$sum_xx_7[65]))*0.97-($sum_ma[$key]-$sum_pz1[$key])*$sum_mbl[$key];
					break;
					default:
					$sum_sx[$key]=$sum_xx[$key]+$z_sumzc+$z_ds;
					break;
				}
			}

			$tm2 = input('get.tm2',1);
			if($tm2==1){
				for ($i=0; $i < 48; $i++) { 
					//单双
					if ($i%2==0){
						$sum_m[$i]+=$sum_m[49]/25;
						$sum_ma[$i]+=$sum_ma[49]/25;
						$sum_sx[$i]+=$sum_ma[50]*0.97-$sum_ma[49]*0.96;
						$sum_re[$i]+=$sum_re[49];
					}else{
						$sum_m[$i]+=$sum_m[50]/25;
						$sum_ma[$i]+=$sum_ma[50]/25;
						$sum_sx[$i]+=$sum_ma[49]*0.97-$sum_ma[50]*0.96;
						$sum_re[$i]+=$sum_re[50];
					}
					//大小
					if ($i>=24){
						$sum_m[$i]+=$sum_m[51]/25;
						$sum_ma[$i]+=$sum_ma[51]/25;
						$sum_sx[$i]+=$sum_ma[52]*0.97-$sum_ma[51]*0.96;
						$sum_re[$i]+=$sum_re[51];
					}else{
						$sum_m[$i]+=$sum_m[52]/25;
						$sum_ma[$i]+=$sum_ma[52]/25;
						$sum_sx[$i]+=$sum_ma[51]*0.97-$sum_ma[52]*0.96;
						$sum_re[$i]+=$sum_re[52];
					}
					//合单合双   
					if (((($i+1)%10)+intval(($i+1)/10))%2==1){
						$sum_m[$i]+=$sum_m[53]/25;
						$sum_ma[$i]+=$sum_ma[53]/25;
						$sum_sx[$i]+=$sum_ma[54]*0.97-$sum_ma[53]*0.96;
						$sum_re[$i]+=$sum_re[53];
					}else{
						$sum_m[$i]+=$sum_m[54]/25;
						$sum_ma[$i]+=$sum_ma[54]/25;
						$sum_sx[$i]+=$sum_ma[53]*0.97-$sum_ma[54]*0.96;
						$sum_re[$i]+=$sum_re[54];
					}
					//尾大尾小   
					if (($i+1)%10<5){
						$sum_m[$i]+=$sum_m[61]/25;
						$sum_ma[$i]+=$sum_ma[61]/25;
						$sum_sx[$i]+=$sum_ma[60]*0.97-$sum_ma[61]*0.96;
						$sum_re[$i]+=$sum_re[61];
					}else{
						$sum_m[$i]+=$sum_m[60]/25;
						$sum_ma[$i]+=$sum_ma[60]/25;
						$sum_sx[$i]+=$sum_ma[61]*0.97-$sum_ma[60]*0.96;
						$sum_re[$i]+=$sum_re[60];
					}


					//大单  
					if ($i%2==0&&$i>=24){
						$sum_m[$i]+=$sum_m[62]/12;
						$sum_ma[$i]+=$sum_ma[62]/12;
						$sum_sx[$i]+=$sum_ma[63]*0.97-$sum_ma[62]*2.53;
						$sum_re[$i]+=$sum_re[62];
					}

					//小单  
					if ($i%2==0&&$i<24){
						$sum_m[$i]+=$sum_m[63]/13;
						$sum_ma[$i]+=$sum_ma[63]/13;
						$sum_sx[$i]+=$sum_ma[62]*0.97-$sum_ma[63]*2.53;
						$sum_re[$i]+=$sum_re[63];
					}  

					//大双  
					if ($i%2==1&&$i>24){
						$sum_m[$i]+=$sum_m[64]/13;
						$sum_ma[$i]+=$sum_ma[64]/13;
						$sum_sx[$i]+=$sum_ma[65]*0.97-$sum_ma[64]*2.53;
						$sum_re[$i]+=$sum_re[65];
					}  
					//小双  
					if ($i%2==1&&$i<24){
						$sum_m[$i]+=$sum_m[65]/13;
						$sum_ma[$i]+=$sum_ma[65]/13;
						$sum_sx[$i]+=$sum_ma[64]*0.97-$sum_ma[65]*2.53;
						$sum_re[$i]+=$sum_re[64];
					}  

					//红波  
					if (ka_Color_s($i+1)=="红波"){
						$sum_m[$i]+=$sum_m[55]/17;
						$sum_ma[$i]+=$sum_ma[55]/17;
						$sum_sx[$i]+=($sum_ma[56]+$sum_ma[57])*0.97-$sum_ma[55]*1.78;
						$sum_re[$i]+=$sum_re[55];
					}  

					//绿波  
					if (ka_Color_s($i+1)=="绿波"){
						$sum_m[$i]+=$sum_m[56]/16;
						$sum_ma[$i]+=$sum_ma[56]/16;
						$sum_sx[$i]+=($sum_ma[55]+$sum_ma[57])*0.97-$sum_ma[56]*1.68;
						$sum_re[$i]+=$sum_re[56];
					}  

					//蓝波  
					if (ka_Color_s($i+1)=="蓝波"){
						$sum_m[$i]+=$sum_m[57]/16;
						$sum_ma[$i]+=$sum_ma[57]/16;
						$sum_sx[$i]+=($sum_ma[55]+$sum_ma[56])*0.97-$sum_ma[57]*1.68;
						$sum_re[$i]+=$sum_re[57];
					} 
				}
			}

			for ($b=0; $b < 66; $b++) { 
				for ($i=0; $i < 48; $i++) { 
					if ($sum_sx[$i]!=0){
						$bbs=$sum_sx[$i];
						$bbs1=$sum_sx[$i+1];
					}else{
						$bbs=$sum_m[$i+1];
						$bbs1=$sum_m[$i];
					}
					if($bbs>$bbs1){
						$tmp=$sum_tm[$i+1];
						$sum_tm[$i+1]=$sum_tm[$i];
						$sum_tm[$i]=$tmp;

						$tmp=$sum_m[$i+1];
						$sum_m[$i+1]=$sum_m[$i];
						$sum_m[$i]=$tmp;

						$tmp=$sum_re[$i+1];
						$sum_re[$i+1]=$sum_re[$i];
						$sum_re[$i]=$tmp;

						$tmp=$sum_ma[$i+1];
						$sum_ma[$i+1]=$sum_ma[$i];
						$sum_ma[$i]=$tmp;

						$tmp=$sum_mb[$i+1];
						$sum_mb[$i+1]=$sum_mb[$i];
						$sum_mb[$i]=$tmp;

						$tmp=$sum_ds[$i+1];
						$sum_ds[$i+1]=$sum_ds[$i];
						$sum_ds[$i]=$tmp;

						$tmp=$sum_xx[$i+1];
						$sum_xx[$i+1]=$sum_xx[$i];
						$sum_xx[$i]=$tmp;

						$tmp=$sum_bl[$i+1];
						$sum_bl[$i+1]=$sum_bl[$i];
						$sum_bl[$i]=$tmp;


						$tmp=$sum_mbl[$i+1];
						$sum_mbl[$i+1]=$sum_mbl[$i];
						$sum_mbl[$i]=$tmp;


						$tmp=$sum_sx[$i+1];
						$sum_sx[$i+1]=$sum_sx[$i];
						$sum_sx[$i]=$tmp;

						$tmp=$sum_pz1[$i+1];
						$sum_pz1[$i+1]=$sum_pz1[$i];
						$sum_pz1[$i]=$tmp;


						$tmp=$sum_color[$i+1];
						$sum_color[$i+1]=$sum_color[$i];
						$sum_color[$i]=$tmp;
					}
				}
			}
			$fg=0;
			for($i=0;$i<66;$i++)
			{

				if(($sum_sx[$i]+$ztm_tm)>=0 || $sum_mbl[$i]==0 ){
					$ffxx=0;
				}else{
					if ($i<49){
						//飞数= （占成 -该飞-风险值）/ 赔率
						$ffxx=(((0-$sum_sx[$i])-$ztm_tm)/($sum_mbl[$i]+$tm1/100-1));
					}else{
						if($sum_tm[$i]=="单"||$sum_tm[$i]=="双"){
							$ffxx=(((($sum_xx_7[49]+$sum_xx_7[50])-$sum_sx[$i])-$ztm_tm)/($sum_mbl[$i]+3/100-1));
						}elseif($sum_tm[$i]=="大"||$sum_tm[$i]=="小"){
						   $ffxx=(((($sum_xx_7[51]+$sum_xx_7[52])-$sum_sx[$i])-$ztm_tm)/($sum_mbl[$i]+3/100-1));
						}elseif($sum_tm[$i]=="合单"||$sum_tm[$i]=="合双"){
						   $ffxx=(((($sum_xx_7[53]+$sum_xx_7[54])-$sum_sx[$i])-$ztm_tm)/($sum_mbl[$i]+3/100-1));
						}elseif($sum_tm[$i]=="红波"||$sum_tm[$i]=="绿波"||$sum_tm[$i]=="蓝波"){
						   $ffxx=(((($sum_xx_7[55]+$sum_xx_7[56]+$sum_xx_7[57])-$sum_sx[$i])-$ztm_tm)/($sum_mbl[$i]+3/100-1));
						}elseif($sum_tm[$i]=="家禽"||$sum_tm[$i]=="野兽"){
						   $ffxx=(((($sum_xx_7[58]+$sum_xx_7[59])-$sum_sx[$i])-$ztm_tm)/($sum_mbl[$i]+3/100-1));
						}elseif($sum_tm[$i]=="尾大"||$sum_tm[$i]=="尾小"){
						   $ffxx=(((($sum_xx_7[60]+$sum_xx_7[61])-$sum_sx[$i])-$ztm_tm)/($sum_mbl[$i]+3/100-1));
						}elseif($sum_tm[$i]=="大单"||$sum_tm[$i]=="小单"||$sum_tm[$i]=="大双"||$sum_tm[$i]=="小双"){
						   $ffxx=(((($sum_xx_7[62]+$sum_xx_7[63]+$sum_xx_7[64]+$sum_xx_7[65])-$sum_sx[$i])-$ztm_tm)/($sum_mbl[$i]+3/100-1));
						}
					}
				}
				$bl=round($ffxx,0);
				if($ffxx>=1){
					$fg=$fg+1;
					$sum_pz[$i]="<button class=headtd4  onmouseover=this.className='headtd3';window.status='特码'; return true; onMouseOut=this.className='headtd4';window.status='特码';return true; onclick=show_win('".$sum_tm[$i]."','".$bl."','".$sum_mbl[$i]."','".$class1."','".$class2."')    ><font color=ff6600>补</font>  ".$bl."</button>";//}
				}else{
					$sum_pz[$i]="&nbsp;";
				}
			}

			$i=0;
			$my_bl="";
			$blbl = '';
			for($i=0;$i<66;$i++)
			{
				if($i<15){
					if($my_bl==""){
						$my_bl=$sum_tm[$i];
					}else{
						$my_bl.=",".$sum_tm[$i];
					}
				}
				//if ($sum_m[$i]==0)$sum_sx[$i]=0;
				$sum_ma[$i]=$sum_ma[$i]-$sum_pz1[$i];
				$blbl.=$sum_tm[$i]."@@@". $sum_re[$i]. "@@@" . round($sum_m[$i],0). "@@@" . round($sum_ma[$i],0). "@@@" .$sum_mb[$i]. "@@@" . round($sum_ds[$i],0). "@@@" .round($sum_xx[$i],0). "@@@" . round($sum_sx[$i],0). "@@@" . $sum_pz[$i]. "@@@" . $sum_pz1[$i]. "@@@" .$sum_bl[$i]. "@@@" .$fg."@@@".$sum_tm[$i]."@@@".$sum_color[$i]."###";
			}

			$z_suma=$z_suma-$z_pz;
			$z_suma1=$z_suma1-$z_pz1;
			$blbl.= "0@@@<font color=ff6600>".$z_re."注</font>@@@<font color=ff6600>".$z_sum."</font>@@@<font color=ff6600>".$z_suma."</font>@@@<font color=ff6600>".$z_sumb."</font>@@@<font color=ff6600>".$z_ds."</font>@@@<font color=ff6600>".$z_xx."</font>@@@&nbsp;@@@&nbsp;@@@<font color=ff6600>".$z_pz."</font>@@@<b><font color=ff0000>".$ztm_tm."</font></b>@@@".$fg."###";
			$blbl.= "0@@@<font color=ff6600>".$z_re1."注</font>@@@<font color=ff6600>".($z_sum+$z_sum1)."</font>@@@<font color=ff6600>".($z_suma+$z_suma1)."</font>@@@<font color=ff6600>".($z_sumb+$z_sumb1)."</font>@@@<font color=ff6600>".($z_ds+$z_ds1)."</font>@@@<font color=ff6600>".$z_xx1."</font>@@@&nbsp;@@@&nbsp;@@@<font color=ff6600>".($z_pz+$z_pz1)."</font>@@@<b><font color=ff0000>".$ztm_tm."</font></b>@@@".$my_bl."###";
			var_dump($blbl);exit();

			$this->assign('list',$list);

			$class2attr = $KaBl->field('class2')->where(['class1'=>'特码'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);

			$Adad = model('adad');
			$adad = $Adad->field('tm,tm1')->where(['id'=>1])->find();
			$this->assign('adad',$adad);

			$this->assign('meta_title','特码');
			return $this->fetch();
		}
	}

	public function ztm(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$class2 = input('param.class2','正1特');
			$this->assign('class2',$class2);

			$KaTan = model('KaTan');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'正特','class2'=>$class2])->order('id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['id'] = $value['id'];
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class1'] = $value['class1'];
				$list[$key]['class2'] = $value['class2'];
				$list[$key]['class3'] = $value['class3'];
			}
			$this->assign('list',$list);

			$class2attr = $KaBl->field('class2')->where(['class1'=>'正特'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);
			$this->assign('meta_title','正特');
			return $this->fetch();
		}
	}
}