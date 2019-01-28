<?php
namespace app\admin\controller;

/**
*	盘口
*/
class Kithe extends Admin{

	protected $Kithe = null; 
	protected function _initialize(){
		parent::_initialize();
		$this->Kithe = model('KaKithe');
	}
	public function index(){
		$list = $this->Kithe->order('nn desc')->limit(3)->select();
		sort($list);
		$this->assign('list',$list);
		$this->assign('meta_title','盘口管理');
		return $this->fetch();
	}

	public function load(){
		$page = input('get.page');
		$limit = input('get.limit');
		$where = [];
		$sql='';
		$time = $this->request->time();
		$history = input('get.history',0);
		if ($history) {
            $sql='unix_timestamp(nd) < '.$time;
//			$where[''] = ['lt',$time];
		}else{
            $sql='unix_timestamp(nd) >= '.$time;
//			$where['unix_timestamp(nd)'] = ['egt',$time];
		}
		$list = $this->Kithe->where($sql)->order('nd desc')->paginate($limit,false,['page'=>$page]);

		$data = [];
		foreach ($list as $key => $value) {
			$data[$key]['id'] = $value['id'];
			$data[$key]['nn'] = $value['nn'];
			$data[$key]['nd'] = $value['nd'];
			$data[$key]['zfbdate'] = $value['zfbdate'];
			$data[$key]['zfbdate1'] = $value['zfbdate1'];
			$data[$key]['n1_image'] = $value['n1_image'];
			$data[$key]['n2_image'] = $value['n2_image'];
			$data[$key]['n3_image'] = $value['n3_image'];
			$data[$key]['n4_image'] = $value['n4_image'];
			$data[$key]['n5_image'] = $value['n5_image'];
			$data[$key]['n6_image'] = $value['n6_image'];
			$data[$key]['na_image'] = $value['na_image'];
			$data[$key]['zodiac'] = empty($value['sx'])?'':$value['x1'].$value['x2'].$value['x3'].$value['x4'].$value['x5'].$value['x6'].'+'.$value['sx'];
			$data[$key]['kitm'] = $value['kitm'];
			$data[$key]['kizt'] = $value['kizt'];
			$data[$key]['kizm'] = $value['kizm'];
			$data[$key]['kizm6'] = $value['kizm6'];
			$data[$key]['kigg'] = $value['kigg'];
			$data[$key]['kilm'] = $value['kilm'];
			$data[$key]['kisx'] = $value['kisx'];
			$data[$key]['kibb'] = $value['kibb'];
			$data[$key]['kiws'] = $value['kiws'];
			$data[$key]['lx'] = $value['lx'];
			$data[$key]['state'] =	$value['state'];
			$data[$key]['state_text'] = $value['state_text'];
		}
		return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
	}

	public function edit(){
		if ($this->request->isPost()) {
			$id = input('post.id');
			$kithe = $this->Kithe->where(['id'=>$id])->find();
			if (!$kithe) {
				return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
			}
			$nn = input('post.nn');
			if (empty($nn)) {
				return json(['data'=>null,'code'=>1,'msg'=>'期数不能为空']);
			}
			$nd = input('post.nd');
			if (empty($nd)) {
				return json(['data'=>null,'code'=>1,'msg'=>'开奖时间不能为空']);
			}
			$zfbdate = input('post.zfbdate');
			if (empty($zfbdate)) {
				return json(['data'=>null,'code'=>1,'msg'=>'总封盘时间不能为空']);
			}
			$zfbdate1 = input('post.zfbdate1');
			if (empty($zfbdate1)) {
				return json(['data'=>null,'code'=>1,'msg'=>'自动开盘时间不能为空']);
			}
			$kithe->nn = $nn;
			$kithe->nd = $nd;
			$kithe->zfbdate = $zfbdate;
			$kithe->zfbdate1 = $zfbdate1;
			$kithe->best = input('post.best');
			$kithe->kitm =  input('post.kitm');
			$kithe->kizt =  input('post.kizt');
			$kithe->kizm =  input('post.kizm');
			$kithe->kizm6 =  input('post.kizm6');
			$kithe->kigg =  input('post.kigg');
			$kithe->kilm =  input('post.kilm');
			$kithe->kisx =  input('post.kisx');
			$kithe->kibb =  input('post.kibb');
			$kithe->kiws =  input('post.kiws');
			$kithe->nd = input('post.nd');
			$kithe->kizm1 = input('post.kizm1');
			$result = $kithe->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'编辑成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'编辑失败']);
		}else{
			$id = input('get.id');
			$kithe = $this->Kithe->where(['id'=>$id])->find();
			if (!$kithe) {
				return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
			}
			$this->assign('kithe',$kithe);
			$this->assign('meta_title','编辑盘口');
			return $this->fetch();
		}
	}

	public function add(){
		if ($this->request->isPost()) {
			$nn = input('post.nn');
			if (empty($nn)) {
				return json(['data'=>null,'code'=>1,'msg'=>'期数不能为空']);
			}
			$kithe = $this->Kithe->where(['nn'=>$nn])->find();
			if ($kithe) {
				return json(['data'=>null,'code'=>1,'msg'=>'该期数已经存在']);
			}
			$nd = input('post.nd');
			if (empty($nd)) {
				return json(['data'=>null,'code'=>1,'msg'=>'开奖时间不能为空']);
			}
			$zfbdate = input('post.zfbdate');
			if (empty($zfbdate)) {
				return json(['data'=>null,'code'=>1,'msg'=>'总封盘时间不能为空']);
			}
			$zfbdate1 = input('post.zfbdate1');
			if (empty($zfbdate1)) {
				return json(['data'=>null,'code'=>1,'msg'=>'自动开盘时间不能为空']);
			}
			$this->Kithe->nn = $nn;
			$this->Kithe->nd = $nd;
			$this->Kithe->zfbdate = $zfbdate;
			$this->Kithe->zfbdate1 = $zfbdate1;
			$result = $this->Kithe->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'添加成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'添加失败']);
		}else{
			$nn = $this->Kithe->order('nd desc')->value('nn');
			$curnn = $nn + 1;
			$this->assign('curnn',$curnn);
			$this->assign('meta_title','添加盘口');
			return $this->fetch();
		}
	}

	public function delete(){
		$id = input('post.id');
		$kithe = $this->Kithe->where(['id'=>$id])->find();
		if (!$kithe) {
			return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
		}
		$result = $kithe->delete();
		if ($result) {
			return json(['data'=>null,'code'=>0,'msg'=>'删除成功']);
		}
		return json(['data'=>null,'code'=>1,'msg'=>'删除失败']);
	}

	public function changestate(){
		$id = input('post.id');
		$kithe = $this->Kithe->where(['id'=>$id])->find();
		if (!$kithe) {
			return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
		}
		$state = input('post.state');
		if ($state == 'true') {
			if ($kithe['na'] == 0) {
				return json(['data'=>null,'code'=>1,'msg'=>'该期未开奖']);
			}
			$lx = 1;
		}else{
			$lx = 0;
		}
		$kithe->lx = $lx;
		$result = $kithe->save();
		if ($result) {
			return json(['data'=>null,'code'=>0,'msg'=>'修改状态成功']);
		}
		return json(['data'=>null,'code'=>0,'msg'=>'修改状态成功']);
	}

	public function history(){
		$this->assign('meta_title','历史开盘');
		return $this->fetch();
	}

	public function lottery(){
		if ($this->request->isPost()) {
			$id = input('post.id');
			$kithe = $this->Kithe->where(['id'=>$id])->find();
			if (!$kithe) {
				return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
			}
			$number = [];
			$n1 = input('post.n1');
			$n1 = intval($n1);
			if (!($n1 >= 1 && $n1 <= 49)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平1输入错误']);
			}
			$number[] = $n1;
			$n2 = input('post.n2');
			$n2 = intval($n2);
			if (!($n2 >= 1 && $n2 <= 49)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平2输入错误']);
			}
			if (in_array($n2, $number)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平2输入重复']);
			}
			$number[] = $n2;
			$n3 = input('post.n3');
			$n3 = intval($n3);
			if (!($n3 >= 1 && $n3 <= 49)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平3输入错误']);
			}
			if (in_array($n3, $number)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平3输入重复']);
			}
			$number[] = $n3;
			$n4 = input('post.n4');
			$n4 = intval($n4);
			if (!($n4 >= 1 && $n4 <= 49)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平4输入错误']);
			}
			if (in_array($n4, $number)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平4输入重复']);
			}
			$number[] = $n4;
			$n5 = input('post.n5');
			$n5 = intval($n5);
			if (!($n5 >= 1 && $n5 <= 49)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平5输入错误']);
			}
			if (in_array($n5, $number)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平5输入重复']);
			}
			$number[] = $n5;
			$n6 = input('post.n6');
			$n6 = intval($n6);
			if (!($n6 >= 1 && $n6 <= 49)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平6输入错误']);
			}
			if (in_array($n6, $number)) {
				return json(['data'=>null,'code'=>1,'msg'=>'平6输入重复']);
			}
			$number[] = $n6;
			$na = input('post.na');
			$na = intval($na);
			if (!($na >= 1 && $na <= 49)) {
				return json(['data'=>null,'code'=>1,'msg'=>'特码输入错误']);
			}
			if (in_array($na, $number)) {
				return json(['data'=>null,'code'=>1,'msg'=>'特码输入重复']);
			}
			$kithe->n1 = $n1;
			$kithe->x1 = Get_sx_Color($n1);
			$kithe->n2 = $n2;
			$kithe->x2 = Get_sx_Color($n2);
			$kithe->n3 = $n3;
			$kithe->x3 = Get_sx_Color($n3);
			$kithe->n4 = $n4;
			$kithe->x4 = Get_sx_Color($n4);
			$kithe->n5 = $n5;
			$kithe->x5 = Get_sx_Color($n5);
			$kithe->n6 = $n6;
			$kithe->x6 = Get_sx_Color($n6);
			$kithe->na = $na;
			$kithe->sx = Get_sx_Color($na);
			$result = $kithe->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'录入成功，请检查确认在修改显示状态']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'录入失败']);
		}else{
			$id = input('get.id');
			$kithe = $this->Kithe->where(['id'=>$id])->find();
			if (!$kithe) {
				$this->error('参数错误');
			}
			$this->assign('kithe',$kithe);
			$this->assign('meta_title','开盘');
			return $this->fetch();
		}
	}
}