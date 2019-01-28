<?php
namespace app\admin\controller;

/**
*	注单查询
*/
class Tan extends Admin{

	protected $KaTan = null;
	protected function _initialize(){
		parent::_initialize();
		$this->KaTan = model('KaTan');
	}

	public function index(){
		$this->assign('meta_title','注单查询');
		return $this->fetch();
	}

	public function load(){
		$KaTan = model('KaTan');
		$page = input('get.page');
		$limit = input('get.limit');
//		$where = [];
		$sql='';
		$class = input('get.class');
		$key = input('get.key');
		if (!empty($key)) {
			if ($class == 1) {
                $sql.='username ='.$key.' and';
//				$where['username'] = $key;
			}else if($class == 2){
                $sql.='num ='.$key.' and';
//				$where['num'] = $key;
			}else if($class == 3){
                $sql.='abcd ='.$key.' and';
//				$where['abcd'] = $key;
			}
		}

		$time = $this->request->time();
		$date = date('Y-m-d',$time);
		$stardate = input('get.stardate',$date);
		$startime = strtotime($stardate);
		$enddate = input('get.enddate',$date);
		$endtime = strtotime($enddate);
		if ($startime == $endtime) {
			$endtime += 86400;
		}
        $sql.=' UNIX_TIMESTAMP(adddate) between '.$startime.' and '.$endtime;
//		$where['UNIX_TIMESTAMP(adddate)'] = ['between',[$startime,$endtime]];
        $sql.=' and dagu_zc > 0';
//		$where['dagu_zc'] = ['gt',0];
		$list = $KaTan->field('*')
		->alias('t')
		// ->join('')
		->where($sql)->order('id desc')->paginate($limit,false,['page'=>$page]);
		$data = [];
		foreach ($list as $key => $value) {
			$data[$key]['class2'] = $value['class2'];
			$data[$key]['num'] = $value['num'];
			$data[$key]['adddate'] = $value['adddate'];
			$data[$key]['kithe'] = $value['kithe'];
			$data[$key]['username'] = $value['username'];
			// $data[$key]['xm']= $value['xm'];
			$data[$key]['abcd'] = $value['abcd'];
			$data[$key]['user_ds'] = $value['sum_m'] * $value['user_ds'] / 100;
			$data[$key]['sum_m'] = $value['sum_m'];
			if ($value['sum_m'] < 0) {
				$data[$key]['sum_m'] = $value['sum_m'] . '(自)';
			}
			$data[$key]['rate'] = $value['rate'];
			$data[$key]['dagu_zc'] = $value['dagu_zc'] * 10 .'%';

			$money = $value['sum_m'] * $value['dagu_zc'] / 10;
			$data[$key]['sum_m'] = $value['sum_m'] * $value['dagu_zc'] / 10;
			$commission = $money * $value['user_ds'] / 100;
			$data[$key]['user_ds'] = $commission;
			$data[$key]['sum_m3'] =  round($money   *  $value['rate'] - ($money - $commission ),2);
		}
		return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}
}