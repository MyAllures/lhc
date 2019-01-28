<?php
namespace app\api\controller;
use think\Controller;
use think\Request;
use think\Log;

class Api extends Controller{

    protected $request = null;
    protected $Api = null;
    protected $mch = null;
	protected function _initialize()
    {
        $this->values = input('post.');
        $Account = model('Account');
        $mch_id = input('param.mchid');
        $this->mch = model('Mch')->get($mch_id);
        if (!$this->mch) {
            $this->error('商户不存在');
        }
        $this->key = $this->mch['key'];
        // $account = $mch['account'];
        // if (!$account) {
        //     $this->error('未设置公众号信息');
        // }
        $sign = $this->MakeSign();
        if($this->values['sign'] != $sign){
            $this->error('商户签名错误！');
        }
    }

    /**
     * 格式化参数格式化成url参数
     */
    public function ToUrlParams()
    {
        $buff = "";
        foreach ($this->values as $k => $v)
        {
            if($k != "sign" && $v != "" && !is_array($v)){
                $buff .= $k . "=" . $v . "&";
            }
        }
        
        $buff = trim($buff, "&");
        return $buff;
    }
    
    /**
     * 生成签名
     * @return 签名，本函数不覆盖sign成员变量，如要设置签名需要调用SetSign方法赋值
     */
    public function MakeSign()
    {
        //签名步骤一：按字典序排序参数
        ksort($this->values);
        $string = $this->ToUrlParams();
        //签名步骤二：在string后加入KEY
        $string = $string . "&key=".$this->key;
        //签名步骤三：MD5加密
        $string = md5($string);
        //签名步骤四：所有字符转为大写
        $result = strtoupper($string);
        return $result;
    }

    public function output($data){
        echo json($data)->getContent();
        exit();
    }
}