<?php
namespace app\admin\controller;

/**
*	站点管理
*/
class Setting extends Admin{


	protected $Config = null;
    protected function _initialize(){
        parent::_initialize();
        $this->Config = model('Config');
    }

	public function site(){
		if ($this->request->isPost()) {
			$config = $this->Config->where(['id'=>1])->find();
			$site = input('post.site/a');
			$config->webname = $site['cname'];
			$config->websname = $site['sname'];
			$config->copyright = $site['copyright'];
			$config->opwww = isset($site['open'])?0:1;
			$result = $config->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'设置成功']);
			}
			return json(['data'=>$_POST,'code'=>1,'msg'=>'设置失败']);
		}else{
        	$config = $this->Config->where(['id'=>1])->find();

			$this->assign('site',$config);
			$this->assign('meta_title','站点设置');
			return $this->fetch();
		}
	}

	public function kefu(){
		if ($this->request->isPost()) {
			$setting = $this->Setting->where(['key'=>'kefu'])->find();
			$setting->value = input('post.kefu/a');
			$result = $setting->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'设置成功']);
			}
			return json(['data'=>$_POST,'code'=>1,'msg'=>'设置失败']);
		}else{
			$setting = $this->Setting->where(['key'=>'kefu'])->find();
			$kefu = $setting->value;
			$this->assign('kefu',$kefu);
			$this->assign('meta_title','客服设置');
			return $this->fetch();
		}
	}

	public function number(){
		if ($this->request->isPost()) {
			$setting = $this->Setting->where(['key'=>'number'])->find();
			$setting->value = input('post.number/a');
			$result = $setting->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'设置成功']);
			}
			return json(['data'=>null,'code'=>1,'msg'=>'设置失败']);
		}else{
			$setting = $this->Setting->where(['key'=>'number'])->find();
			$number = $setting->value;
			$this->assign('number',$number);
			$this->assign('meta_title','号码设置');
			return $this->fetch();
		}
	}

	public function account(){
		if ($this->request->isPost()) {
			$setting = $this->Setting->where(['key'=>'account'])->find();
			$setting->value = input('post.account/a');
			$result = $setting->save();
			if ($result) {
				return json(['data'=>null,'code'=>0,'msg'=>'设置成功']);
			}
			return json(['data'=>$_POST,'code'=>1,'msg'=>'设置失败']);
		}else{
			$setting = $this->Setting->where(['key'=>'account'])->find();
			$account = $setting->value;
			$this->assign('account',$account);
			$this->assign('meta_title','账户设置');
			return $this->fetch();
		}
	}
}





