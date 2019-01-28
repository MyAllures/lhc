<?php
namespace app\users\controller;
use think\Controller;
use think\Db;
use think\Request;

class Common extends Controller{
    protected $pd=false;     //开启子用户验证
    protected $guan=null;    //当前用户的表信息
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        if($this->pd){
            //判断是否为子用户
            $sess=session('lhc_users');
            if($sess['vip']!=0)$this->error('你当前是子用户，非法操作！');
            else $this->guan=Db::name('guan')->find($sess['id']);
        }
    }

    public function _initialize(){
        if($this->checkSys('opwww')==1 || is_bool($this->checkSys('opwww')))$this->error('对不起，系统正在维护中...');
		$controller=request()->controller();
		$action=request()->action();
		if(!session('lhc_users')){
			//cookie存在
			if(cookie('?lhc_users')){
                $pd1=db('guan')->where(['kauser'=>getcookieValue(cookie('lhc_users')),'stat'=>0])->find();
                $pd2=db('zi')->where(['kauser'=>getcookieValue(cookie('lhc_users'))])->find();
			    if(!$pd1 && !$pd2){
                    if($controller!='Login')$this->redirect('login/index');
                }
			    $vip=1;
			    if($pd1){
                    $vip=0;
                    if($pd1['lx']==1){
                        if(!Db::name('guan')->field('id')->where(['kauser'=>$pd1['guan'],'stat'=>0])->find()){
                            $this->redirect('login/logout');
                        }
                    }elseif($pd1['lx']==2){
                        if(!Db::name('guan')->field('id')->where(['kauser'=>$pd1['guan'],'stat'=>0])->find()){
                            $this->redirect('login/logout');    //上级已关闭
                        }
                    }elseif ($pd1['lx']==3){
                        if(!Db::name('guan')->field('id')->where(['kauser'=>$pd1['zong'],'stat'=>0])->find()){
                            $this->redirect('login/logout');
                        }
                    }
                }

			    $datas=$pd1 ? $pd1 : $pd2;
			    if($vip){
                    session('lhc_users',['id'=>$datas['id'],'kauser'=>$datas['guan'],'lx'=>$datas['lx'],'vip'=>$vip]);
                }else{
                    session('lhc_users',['id'=>$datas['id'],'kauser'=>$datas['kauser'],'lx'=>$datas['lx'],'vip'=>$vip]);
                }
                if(!$vip){
                    $upd=[
                        'zlogin'=>date('Y-m-d H:i;s',time()),
                        'zip'=>\request()->ip()
                    ];
                    Db::name('guan')->where(['id'=>$datas['id']])->update($upd);
                    Db::name('guan')->where(['id'=>$datas['id']])->setInc('look');
                }

			}else{
				if($controller!='Login')$this->redirect('login/index');
			}
		}
		else{
			//已登录
			$upd=session('lhc_users');
			if($upd['vip']){    //1
			    $pd=Db::name('zi')->where(['id'=>$upd['id']])->find();
            }else{
                $pd=Db::name('guan')->where(['kauser'=>$upd['kauser'],'stat'=>0])->find();
                //判断上级状态
                if($pd['lx']==2){
                    if(!Db::name('guan')->field('id')->where(['kauser'=>$pd['guan'],'stat'=>0])->find()){
                        $this->redirect('login/logout');
                    }
                }elseif ($pd['lx']==3){
                    if(!Db::name('guan')->field('id')->where(['kauser'=>$pd['zong'],'stat'=>0])->find()){
                        $this->redirect('login/logout');
                    }
                }
            }
			if($pd){
				if(($controller.'/'.$action)=='Login/index')$this->redirect('index/index');
			}else{
				//还有种情况就是用户登录后修改了账号信息
				cookie('lhc_users',null);
				session('lhc_users',null);
				$this->error('您当前用户信息以改变，请重新登录!');
			}
		}
	}
    //判断系统是否正在维护中
    protected function checkSys($i){
        $res=Db::table('config')->field('id,webname,weburl,tm,tmdx,tmps,zm,zmdx,ggpz,sanimal,affice,fenb,haffice2,a1,a2,a3,a10,opwww,a4,a5,a6,a7,a8,a9')->find();
        if(!$res)return false;
        else{
            return $res[$i];
        }
    }
	/**
	 * 空操作
	 * [_empty description]
	 * @return null
	 */
	public function _empty(){
		exit($this->request->action().' method is undefined!');
	}

	public function fp($xf){
            if(!getKithe(29) || !getKithe($xf)){
            echo "<table width=60% border=1 align=center cellpadding=4 cellspacing=1 bordercolor=#ffff00 bgcolor=#Fd0000>          <tr>            <td height=28 align=center bgcolor=ff0000><font color=ffff00>封盘中....</font></td>          </tr>      </table>";
            exit;
        }
    }

	//layui编辑器上传
	public function uploadLayui(){
		$file=request()->file('file');
		if($file){
			$info=$file->move(ROOT_PATH . 'file' . DS . 'layimg');
			if($info){
				return json(['code'=>0,'data'=>['src'=>'/file/layimg/'.$info->getSaveName()]]);
			}else{
				return json(['msg'=>'上传失败']);
			}
		}else{
			return json(['msg'=>$file->getError()]);
		}
	}


}

?>