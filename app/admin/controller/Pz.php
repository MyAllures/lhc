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
		$where['kithe'] = $nn;
		$where['class1'] = $class1;
		$where['class3'] = input('get.class3');
		$where['dagu_zc'] = ['gt',0];
			// $where['lx']  = input('get.lx',0);
		$list = $KaTan->where($where)->order('id desc')->paginate($limit,false,['page'=>$page]);
		// if ($class1=="特码" || $class1=="正码" ){
		// 	$where['kithe'] = $nn;
		// 	$where['class1'] = $class1;
		// 	$where['class3'] = input('get.class3');
		// 	$where['dagu_zc'] = ['gt',0];
		// 	// $where['lx']  = input('get.lx',0);
		// 	$list = $KaTan->where($where)->order('id desc')->paginate($limit,false,['page'=>$page]);
		// }else {
		// 	$where['kithe'] = $nn;
		// 	$where['class1'] = $class1;
		// 	$where['class2'] = input('get.class2');
		// 	$where['class3'] = input('get.class3');
		// 	$where['dagu_zc'] = ['gt',0];
		// 	$list = $KaTan->where($where)->order('id desc')->paginate($limit,false,['page'=>$page]);
		// }
		$data = [];
		foreach ($list as $key => $value) {
			$data[$key]['class2'] = $value['class2'];
			$data[$key]['num'] = $value['num'];
			$data[$key]['adddate'] = $value['adddate'];
			$data[$key]['kithe'] = $value['kithe'];
			$data[$key]['username'] = $value['username'];
			$data[$key]['abcd'] = $value['abcd'];
			$data[$key]['user_ds'] = $value['sum_m'] * $value['user_ds'] / 100;
			$data[$key]['sum_m'] = $value['sum_m'];
			if ($value['sum_m'] < 0) {
				$data[$key]['sum_m'] = $value['sum_m'] . '(自)';
			}
			$data[$key]['rate'] = $value['rate'];
			$data[$key]['dai_zc'] = $value['dai_zc'] * 10 .'%';
			$data[$key]['zong_zc'] = $value['zong_zc'] * 10 .'%';
			$data[$key]['guan_zc'] = $value['guan_zc'] * 10 .'%';
			$data[$key]['guan1_zc'] = $value['guan1_zc'] * 10 .'%';
			$data[$key]['dagu_zc'] = $value['dagu_zc'] * 10 .'%';

			$money = $value['sum_m'] * $value['dagu_zc'] / 10;
			$commission = $money * $value['user_ds'] / 100;
			$data[$key]['sum_m3'] =  round($money   *  $value['rate'] - ($money - $commission ),2);
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

	public function backout(){
		if ($this->request->isPost()) {
			if ($this->kithe['zfbdate'] == 0) {
				return json(['data'=>null,'code'=>1,'msg'=>'封盘中']);
			}
			$KaTan = model('KaTan');
			$tan = input('post.tan/a');
			foreach ($tan as $key => $value) {
				$money = round($value['money']);
				if ($money <= 0) continue;

				$condition['kithe'] = $this->kithe['nn'];
				$condition['class1'] = '特码';
				$condition['class3'] = $value['class3'];
				$result = $KaTan->field('sum(sum_m) as sum_m,sum(sum_m*dagu_zc/10) as sum_mzc,sum(sum_m*dagu_zc/10*user_ds/100) as sum_money,sum(sum_m*dagu_zc/10 *rate) as sum_m3')->where($condition)->find();	
				$sum_mzc = round($result['sum_mzc']);

				if ($money > $sum_mzc) {
					return json(['data'=>null,'code'=>1,'msg'=>'外调金额不能大于可外调金额，请检查']);
				}

				if (empty($value['rate'])) {
					return json(['data'=>null,'code'=>1,'msg'=>'赔率有误，请检查']);
				}

				if (empty($value['ds'])) {
					return json(['data'=>null,'code'=>1,'msg'=>'退水有误，请检查']);
				}

				$num = random(12,true);
				$data[$key]['num'] = $num;
				$data[$key]['username'] = '外调';
				$data[$key]['kithe'] = $this->kithe['nn'];
				$data[$key]['adddate'] = date('Y-m-d H:i:s');
				$data[$key]['class1'] = $value['class1'];
				$data[$key]['class2'] = $value['class2'];
				$data[$key]['class3'] = $value['class3'];
				$data[$key]['rate'] = $value['rate'];
				$data[$key]['sum_m'] = -1* $money;
				$data[$key]['user_ds'] = -1*$value['ds'];
				$data[$key]['dai_ds'] = -1*$value['ds'];
				$data[$key]['zong_ds'] = -1*$value['ds'];
				$data[$key]['guan_ds'] = -1*$value['ds'];
				$data[$key]['guan1_ds'] = -1*$value['ds'];
				$data[$key]['dai_zc'] = 0;
				$data[$key]['zong_zc'] = 0;
				$data[$key]['guan_zc'] = 0;
				$data[$key]['guan1_zc'] = 0;
				$data[$key]['dagu_zc'] = 10;//平台占100
				$data[$key]['bm'] = 0;
				$data[$key]['dai'] = '外调';
				$data[$key]['zong'] = '外调';
				$data[$key]['guan'] = '外调';
				$data[$key]['guan1'] = '外调';
				$data[$key]['abcd'] = 'A';
				$data[$key]['lx'] = 1;
			}
			$result = $KaTan->saveAll($data);
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'补货成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'补货失败']);
		}else{
			$qc = input('param.qc');
			if (empty($qc)) {
				$this->error('参数错误');
			}
			$class2 = input('param.class2','特A');
			$Adad = model('adad');
			$adad = $Adad->where(['id'=>1])->find();

			$KaBl = model('KaBl');
			$where['class1'] = '特码';	
			$where['class2'] = $class2;
			$where['class3'] = ['in',$qc];
			$list = $KaBl->where($where)->order('id')->select();
			$data = [];
			$KaTan = model('KaTan');
			foreach ($list as $key => $value) {
				$data[$key]['class1'] = $value['class1'];
				$data[$key]['class2'] = $value['class2'];
				$data[$key]['class3'] = $value['class3'];
				$data[$key]['rate'] = $value['rate'];
				$data[$key]['ds'] = $adad['tm1'];

				$condition['kithe'] = $this->kithe['nn'];
				$condition['class1'] = '特码';
				$condition['class3'] = $value['class3'];
				$result = $KaTan->field('sum(sum_m) as sum_m,sum(sum_m*dagu_zc/10) as sum_mzc,sum(sum_m*dagu_zc/10*user_ds/100) as sum_money,sum(sum_m*dagu_zc/10 *rate) as sum_m3')->where($condition)->find();	
				$data[$key]['sum_mzc'] = round($result['sum_mzc']);
			}		
			$this->assign('data',$data);
			$this->assign('meta_title','补货');
			return $this->fetch();
		}
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

			foreach ($result as $key => $value) {
				$list[$key]['id'] = $value['id'];
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class1'] = $value['class1'];
				$list[$key]['class2'] = $value['class2'];
				$list[$key]['class3'] = $value['class3'];

				$where['kithe'] = $this->kithe['nn'];
				$where['class1'] = $value['class1'];
				$where['class3'] = $value['class3'];
				//sum(sum_m*(1-user_ds/100) * dagu_zc/10) as sum_m,
				//sum(sum_m*dagu_zc/10 * rate - (sum_m*dagu_zc/10 - sum_m*dagu_zc/10*user_ds/100) ) sum_m3
				$res = $KaTan->field('sum(sum_m) as sum_m,sum(sum_m*dagu_zc/10) as sum_mzc,sum(sum_m*dagu_zc/10*user_ds/100) as sum_money,sum(sum_m*dagu_zc/10 *rate) as sum_m3')->where($where)->find();		

				//走单
				$condition['kithe'] = $this->kithe['nn'];
				$condition['class1'] = $value['class1'];
				$condition['class3'] = $value['class3'];
				$condition['lx'] = 1;
				$res1 = $KaTan->field('sum(sum_m) as sum_bl')->where($condition)->find();

				$list[$key]['sum_m'] = round($res['sum_m']);
				$list[$key]['sum_mzc'] = round($res['sum_mzc']);
				$list[$key]['sum_m3'] = round($res['sum_m3']);
				$list[$key]['sum_bl'] = abs($res1['sum_bl']);
			}
			// var_dump($list);exit();
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