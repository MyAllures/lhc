<?php
namespace app\index\controller;
use think\Controller;

class Home extends Controller{
	public function console(){
		return $this->fetch();
	}
}

?>