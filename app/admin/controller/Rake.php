<?php
namespace app\admin\controller;

/**
*	赔率管理
*/
class Rake extends Admin{

	public function index(){
		// $KaBl = model('KaBl');
		// $result=mysql_query("Select rate,class3,locked from ka_bl where class2='".$ids."' Order By id  LIMIT 66");
		// $ShowTable = array();
		// $y=0;
		// while($Image = mysql_fetch_array($result)){
		// $y++;
		// array_push($ShowTable,$Image);

		$this->assign('sumData',$sumData);
		$this->assign('meta_title','赔率设置');
		return $this->fetch();
	}

	public function tm(){
		if ($this->request->isPost()) {
			$class2 = input('post.class2');
			$type = input('post.type');
			if ($type == 'adjust') {
				$mf = input('post.mf/a');
				if (empty($mf)) {
					return json(['data'=>null,'code'=>1,'msg'=>'请选择项目']);
				}
				$val = input('post.value');
				$val = floatval($val);
				if ($val <= 0) {
					return json(['data'=>null,'code'=>1,'msg'=>'请输入数值']);
				}
				$numbers = [];
				foreach ($mf as $key => $value) {
					$tmp = explode(',', $value);
					$numbers = array_merge($numbers,$tmp);
				}
				$mv = input('post.mv');
				if ($mv==0) {
					$data['rate'] = ['exp','`rate` - '.$val];
				}else{
					$data['rate'] = ['exp','`rate` + '.$val];
				}
				$KaBl = model('KaBl');
				$result = $KaBl->where(['class1'=>'特码','class2'=>$class2,'class3'=>['in',$numbers]])->update($data);
			}else if($type == 'set'){
				$bl = input('post.bl');
				$bl = floatval($bl);
				if ($bl <= 0) {
					return json(['data'=>null,'code'=>1,'msg'=>'请输入数值']);
				}
				$num=$bl + kaconfig('tm');
				$num1=$bl - kaconfig('tm');
				$dx = input('post.dx');
				$numbers = [];
				for ($i=1; $i <= 49; $i++) { 
					if ($dx == '全部') {
						$numbers[] = $i;
					}else if($dx == '单'){
						if ($i%2==1) {
							$numbers[] = $i;
						}
					}else if($dx == '双'){
						if ($i%2==0) {
							$numbers[] = $i;
						}
					}else if($dx == '大'){
						if ($i >= 25) {
							$numbers[] = $i;
						}
					}else if($dx == '小'){
						if ($i < 25) {
							$numbers[] = $i;
						}
					}else if($dx == '红波'){
						if (Get_bs_Color($i)=="r") {
							$numbers[] = $i;
						}
					}else if($dx == '蓝波'){
						if (Get_bs_Color($i)=="b") {
							$numbers[] = $i;
						}
					}else if($dx == '绿波'){
						if (Get_bs_Color($i)=="g") {
							$numbers[] = $i;
						}
					}
				}

				$where['class1'] = '特码';
				$where['class2'] = $class2;
				$where['class3'] = ['in',$numbers];
				if ($class2 == '特A') {
					$data['rate'] = $bl;
					$data['blrate'] = $bl;
				}else{
					$data['rate'] = $num;
					$data['blrate'] = $num1;
				}
				$KaBl = model('KaBl');
				$result = $KaBl->where($where)->update($data);
			}else if($type == 'feng'){
				$val = input('post.val');
				$data['locked'] = $val;
				$where['class1'] = '特码';
				for ($i=1; $i <= 49; $i++) { 
					$numbers[] = $i;
				}
				$where['class3'] = ['in',$numbers];
				$KaBl = model('KaBl');
				$result = $KaBl->where($where)->update($data);
			}else if($type == 'submit'){
				$KaBl = model('KaBl');
				$numbers = input('post.Num/a');
				foreach ($numbers as $key => $value) {
					$num = $value['rate'];

					$tm = kaconfig('tm');
					$num1 = $num + $tm;
					$num2 = $num - $tm;
					 
					$tmdx = kaconfig('tmdx');
					$num3 = $num + $tmdx;
					$num4 = $num - $tmdx;

					$tmps = kaconfig('tmps');
					$num5 = $num + $tmps;
					$num6 = $num - $tmps;

					$class3 = $value['class3'];
					$data['rate'] = $num;
					$data['blrate'] = $num;
					if (isset($value['locked'])) {
						$data['locked'] = 1;
					}else{
						$data['locked'] = 0;
					}
					$KaBl->where(['class2'=>$class2,'class3'=>$class3])->update($data);
					if ($class2=="特A") {
						if ($key<=49){
							$data['rate'] = $num1;
							$data['blrate'] = $num1;
						}else if ($key<=55){
							$data['rate'] = $num3;
							$data['blrate'] = $num3;
						}else{
							$data['rate'] = $num5;
							$data['blrate'] = $num5;
						}
						$KaBl->where(['class2'=>'特B','class3'=>$class3])->update($data);
					}else{
						if ($key<=49){
							$data['rate'] = $num2;
							$data['blrate'] = $num2;
						}else if ($key<=55){
							$data['rate'] = $num4;
							$data['blrate'] = $num4;
						}else{
							$data['rate'] = $num6;
							$data['blrate'] = $num6;
						}
						$KaBl->where(['class2'=>'特A','class3'=>$class3])->update($data);
					}
					$result = true;
				}
			}
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'修改成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'修改失败']);
			
		}else{
			$class2 = input('param.class2','特A');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'特码','class2'=>$class2])->order('id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('特码',$class2);
			$this->assign('sumData',$sumData);

			$class2attr = $KaBl->field('class2')->where(['class1'=>'特码'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);

			$this->assign('class2',$class2);
			$this->assign('meta_title','特码');
			return $this->fetch();
		}
	}

	public function ztm(){
		if ($this->request->isPost()) {
			$class2 = input('post.class2');
			$type = input('post.type');
			if ($type == 'adjust') {
				$mf = input('post.mf/a');
				if (empty($mf)) {
					return json(['data'=>null,'code'=>1,'msg'=>'请选择项目']);
				}
				$val = input('post.value');
				$val = floatval($val);
				if ($val <= 0) {
					return json(['data'=>null,'code'=>1,'msg'=>'请输入数值']);
				}
				$numbers = [];
				foreach ($mf as $key => $value) {
					$tmp = explode(',', $value);
					$numbers = array_merge($numbers,$tmp);
				}
				$mv = input('post.mv');
				if ($mv==0) {
					$data['rate'] = ['exp','`rate` - '.$val];
				}else{
					$data['rate'] = ['exp','`rate` + '.$val];
				}
				$KaBl = model('KaBl');
				$result = $KaBl->where(['class1'=>'正特','class2'=>$class2,'class3'=>['in',$numbers]])->update($data);
			}else if($type == 'set'){
				$bl = input('post.bl');
				$bl = floatval($bl);
				if ($bl <= 0) {
					return json(['data'=>null,'code'=>1,'msg'=>'请输入数值']);
				}
				$dx = input('post.dx');
				$numbers = [];
				for ($i=1; $i <= 49; $i++) { 
					if ($dx == '全部') {
						$numbers[] = $i;
					}else if($dx == '单'){
						if ($i%2==1) {
							$numbers[] = $i;
						}
					}else if($dx == '双'){
						if ($i%2==0) {
							$numbers[] = $i;
						}
					}else if($dx == '大'){
						if ($i >= 25) {
							$numbers[] = $i;
						}
					}else if($dx == '小'){
						if ($i < 25) {
							$numbers[] = $i;
						}
					}else if($dx == '红波'){
						if (Get_bs_Color($i)=="r") {
							$numbers[] = $i;
						}
					}else if($dx == '蓝波'){
						if (Get_bs_Color($i)=="b") {
							$numbers[] = $i;
						}
					}else if($dx == '绿波'){
						if (Get_bs_Color($i)=="g") {
							$numbers[] = $i;
						}
					}
				}

				$data['rate'] = $bl;
				$data['blrate'] = $bl;
				$where['class1'] = '正特';
				$where['class2'] = $class2;
				$where['class3'] = ['in',$numbers];
				$KaBl = model('KaBl');
				$result = $KaBl->where($where)->update($data);
			}else if($type == 'feng'){
				$val = input('post.val');
				$data['locked'] = $val;
				$where['class1'] = '正特';
				for ($i=1; $i <= 49; $i++) { 
					$numbers[] = $i;
				}
				$where['class1'] = '正特';
				$where['class2'] = $class2;
				$where['class3'] = ['in',$numbers];
				$KaBl = model('KaBl');
				$result = $KaBl->where($where)->update($data);
			}else if($type == 'submit'){
				$KaBl = model('KaBl');
				$numbers = input('post.Num/a');
				foreach ($numbers as $key => $value) {
					$num = $value['rate'];

					$class3 = $value['class3'];
					$data['rate'] = $num;
					$data['blrate'] = $num;
					if (isset($value['locked'])) {
						$data['locked'] = 1;
					}else{
						$data['locked'] = 0;
					}
					$KaBl->where(['class2'=>$class2,'class3'=>$class3])->update($data);
				}
			}
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'修改成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'修改失败']);
		}else{
			$class2 = input('param.class2','正1特');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'正特','class2'=>['like','%'.$class2.'%']])->order('id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('正特',$class2);
			$this->assign('sumData',$sumData);

			$class2attr = $KaBl->field('class2')->where(['class1'=>'正特'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);

			$this->assign('class2',$class2);
			$this->assign('meta_title','正特');
			return $this->fetch();
		}
	}

	public function zm(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$class2 = input('param.class2','正A');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'正码','class2'=>['like','%'.$class2.'%']])->order('id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('正码',$class2);
			$this->assign('sumData',$sumData);

			$class2attr = $KaBl->field('class2')->where(['class1'=>'正码'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);

			$this->assign('class2',$class2);
			$this->assign('meta_title','正码');
			return $this->fetch();
		}
	}

	public function zm6(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'正1-6'])->order('class2,id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('正1-6','');
			$this->assign('sumData',$sumData);
			$this->assign('meta_title','正1-6');
			return $this->fetch();
		}
	}

	public function gg(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'过关'])->order('class2,id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('过关','');
			$this->assign('sumData',$sumData);
			$this->assign('meta_title','过关');
			return $this->fetch();
		}
	}

	public function lm(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$class2 = input('param.class2','三全中');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'连码','class2'=>$class2])->order('id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('连码',$class2);
			$this->assign('sumData',$sumData);


			$class2attr = $KaBl->field('class2')->where(['class1'=>'连码'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);

			$this->assign('class2',$class2);
			$this->assign('meta_title','连码');
			return $this->fetch();
		}
	}

	public function bb(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'半波'])->order('id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('半波','');
			$this->assign('sumData',$sumData);
			$this->assign('meta_title','半波');
			return $this->fetch();
		}
	}

	public function bbb(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'半半波'])->order('id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('半半波','');
			$this->assign('sumData',$sumData);
			$this->assign('meta_title','半半波');
			return $this->fetch();
		}
	}

	public function zxsb(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$KaBl = model('KaBl');
			$result = $KaBl->where("class1 = '正肖' or class1 = '七色波'")->order('class2,id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('正色波','');
			$this->assign('sumData',$sumData);
			$this->assign('meta_title','正肖七色波');
			return $this->fetch();
		}
	}

	public function wx(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'五行'])->order('id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('五行','');
			$this->assign('sumData',$sumData);
			$this->assign('meta_title','五行');
			return $this->fetch();
		}
	}

	public function ts(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$KaBl = model('KaBl');
			$result = $KaBl->where("class1='头数' or class1='尾数'")->order('id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('头尾数','');
			$this->assign('sumData',$sumData);
			$this->assign('meta_title','头尾数');
			return $this->fetch();
		}
	}

	public function ztws(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$KaBl = model('KaBl');
			$result = $KaBl->where("class1='正特尾数' or (class1='生肖' and class2='一肖')")->order('id')->select();
			$list = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			$sumData = $this->sum('正特尾数','');
			$this->assign('sumData',$sumData);
			$this->assign('meta_title','正特尾数');
			return $this->fetch();
		}
	}

	public function sx(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$class2 = input('param.class2','特肖');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'生肖','class2'=>$class2])->order('id')->select();
			$list = [];
			$class2Attr = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);

			$sumData = $this->sum('生肖',$class2);
			$this->assign('sumData',$sumData);

			$class2attr = $KaBl->field('class2')->where(['class1'=>'生肖'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);

			$this->assign('class2',$class2);
			$this->assign('meta_title','生肖');
			return $this->fetch();
		}
	}


	public function sxt(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$class2 = input('param.class2','二肖连中');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'生肖连','class2'=>$class2])->order('id')->select();
			$list = [];
			$class2Attr = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			
			$sumData = $this->sum('生肖连',$class2);
			$this->assign('sumData',$sumData);

			$class2attr = $KaBl->field('class2')->where(['class1'=>'生肖连'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);

			$this->assign('class2',$class2);
			$this->assign('meta_title','生肖连');
			return $this->fetch();
		}
	}

	public function wsl(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$class2 = input('param.class2','二尾连中');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'尾数连','class2'=>$class2])->order('id')->select();
			$list = [];
			$class2Attr = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			
			$sumData = $this->sum('尾数连',$class2);
			$this->assign('sumData',$sumData);

			$class2attr = $KaBl->field('class2')->where(['class1'=>'尾数连'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);

			$this->assign('class2',$class2);
			$this->assign('meta_title','尾数连');
			return $this->fetch();
		}
	}

		public function wbz(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$class2 = input('param.class2','五不中');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'不中','class2'=>$class2])->order('id')->select();
			$list = [];
			$class2Attr = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			
			$sumData = $this->sum('不中',$class2);
			$this->assign('sumData',$sumData);

			$class2attr = $KaBl->field('class2')->where(['class1'=>'不中'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);

			$this->assign('class2',$class2);
			$this->assign('meta_title','不中');
			return $this->fetch();
		}
	}

		public function syz(){
		if ($this->request->isPost()) {
			# code...
		}else{
			$class2 = input('param.class2','四中一');
			$KaBl = model('KaBl');
			$result = $KaBl->where(['class1'=>'中一','class2'=>$class2])->order('id')->select();
			$list = [];
			$class2Attr = [];
			foreach ($result as $key => $value) {
				$list[$key]['rate'] = $value['rate'];
				$list[$key]['class3'] = $value['class3'];
				$list[$key]['locked'] = $value['locked'];
			}
			$this->assign('list',$list);
			
			$sumData = $this->sum('中一',$class2);
			$this->assign('sumData',$sumData);

			$class2attr = $KaBl->field('class2')->where(['class1'=>'中一'])->group('class2')->select();
			$this->assign('class2attr',$class2attr);

			$this->assign('class2',$class2);
			$this->assign('meta_title','中一');
			return $this->fetch();
		}
	}


	private function sum($class1,$class2){
		$where = '';
		$order = '';
		if ($class1 == "正1-6" or $class1=="过关" or $class1=="半波" or $class1=="半半波" or $class1=="头数" or $class1=="尾数" or $class1=="正特尾数" or $class1=="七色波" or $class1=="正肖" or $class1 == '五行'){
			$where .= "class1='".$class1."'";

			if ($class1=="正特尾数") {
				$where .= " or (class1='生肖' and class2='一肖')";
			}
			$order .="class2,id";
		}else{
			if ($class1 == "头尾数"){
				$where .= "class1='头数' or class1='尾数' ";
			}else if ($class1 == "正色波"){
				$where .= "class1='七色波' or class1='正肖'";
			}else{
				$where .= "class1='".$class1."' and class2='".$class2."'";
			}
			$order .="id";
		}

		//当前期数 未开奖
		$KaKithe = model('KaKithe');
		$Current_Kithe_Num = $KaKithe->order('nn desc')->value('nn');
		if (!$Current_Kithe_Num) {
			$Current_Kithe_Num = 0;
		}

		$data = [];
		$KaTan = model('KaTan');
		$KaBl = model('KaBl');
		$bls = $KaBl->where($where)->order($order)->select();
		foreach ($bls as $key => $value) {
			$condition['kithe'] = $Current_Kithe_Num;
			$condition['class1'] = $value['class1'];
			$condition['class2'] = $value['class2'];
			$condition['class3'] = $value['class3'];
			$sum = $KaTan->where($condition)->sum('sum_m');

			$data[$key]['class3'] = $value['class3'];
			$data[$key]['rate'] = $value['rate'];
			$data[$key]['blrate'] = $value['blrate'];
			$data[$key]['sum'] = $sum;
		}
		return $data;
	}
}