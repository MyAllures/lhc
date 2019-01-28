<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Db;
// 应用公共文件

/*cookie的值加密*/
function setcookieValue($value){
	return urlencode($value ^ md5(config('cookiekey')));
}

/*cookie的解密*/
function getcookieValue($value){
	return urldecode($value) ^ md5(config('cookiekey'));
}

/**
 * 生成秘钥
 */
function getSalt(){
	$str='';
	for($i=0;$i<10;$i++){
		$str.=config('salt')[rand(0,strlen(config('salt'))-1)];
	}
	return $str;
}
/**
 * 获取加密密码
 */
function getPassword($pass,$salt=null){
	return empty($salt) ? md5(md5($pass).getSalt()) : md5(md5($pass).$salt);
}

/**
 * 自动关闭
 */
function closePage(){
	echo '<script type="text/javscript">window.close();</script>';
}



function setLoginToken($phone = '') {
	$str = md5(uniqid(md5(microtime(true)), true));
	$str = sha1($str.$phone);
	return $str;
}

//开奖期数  表ka_kithe
function getKitheNum(){
    $res=db('kithe')->where(['na'=>0])->order(['id'=>'desc'])->field('id,nn,nd,na,n1,n2,n3,n4,n5,n6,lx,kitm,kitm1,kizt,kizt1,kizm,kizm1,kizm6,kizm61,kigg,kigg1,kilm,kilm1,kisx,kisx1,kibb,kibb1,kiws,kiws1,zfb,zfbdate,zfbdate1,best,zckg')->find();
    if(!$res)return 1;
    if($res['na']==0 || $res['n1']==0 || $res['n2']==0 || $res['n3']==0 || $res['n4']==0 || $res['n5']==0 || $res['n6']==0){
        return $res['nn'];
    }else{
        return $res['nn']+1;
    }
}

/**
 * 获取最新期数的字段信息  对应 变量$Current_KitheTable[$i]
 * @param $i
 * @return mixed
 */
function getKithe($i){
    $sz=[
        'id', //0
        'nn',
        'nd',
        'na',
        'n1',
        'n2',
        'n3',
        'n4',
        'n5',
        'n6',
        'lx',           //10
        'kitm',         
        'kitm1',        //自动封盘时间  必须是在开盘状态下才行
        'kizt',
        'kizt1',       //封盘倒计时
        'kizm',
        'kizm1',
        'kizm6',
        'kizm61',
        'kigg',
        'kigg1',//20
        'kilm',
        'kilm1',
        'kisx',
        'kisx1',
        'kibb',
        'kibb1',
        'kiws',
        'kiws1',
        'zfb',
        'zfbdate',              //30       封盘时间
        'zfbdate1',             //自动开盘时间
        'best',                 //是否自动开盘  1 自动开盘
        'zckg'
    ];
    $result=db('kithe')->where(['na'=>0])->order(['id'=>'desc'])->value($sz[$i]);
    return $result;
}

/**
 * 下注总额  表ka_tan  不带类型  getTanKitheSum  带类型
 * @return int
 */
function getKitheSum(){
    $sess=session('lhc_index');
    $res=db('tan')->field(['sum(sum_m) sum'])->where(['kithe'=>getKitheNum(),'username'=>$sess['kauser']])->order(['id'=>'desc'])->select();
    if($res && $res[0]['sum'])return $res[0]['sum'];
    else return 0;
}

/**
 * 会员类型
 * @return array
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function getUserType(){
    $res=[];
    $lhc_index=session('lhc_index');
    $result=db('mem')->find($lhc_index['id']);
    $res[]=$result['abcd'];
    if($result){
        if($result['ma']!=$result['abcd'] && $result['ma']!='')$res[]='A';
        if($result['mb']!=$result['abcd'] && $result['mb']!='')$res[]='B';
        if($result['mc']!=$result['abcd'] && $result['mc']!='')$res[]='C';
        if($result['md']!=$result['abcd'] && $result['md']!='')$res[]='D';
    }
    return $res;
}

/**
 * 获取球号对应的颜色
 * @param $i
 * @return string
 */
function getColor($i,$pd=true){
    $result=db('color')->field(['id','color'])->where(['id'=>$i])->find();
    $color='';
    if($pd){
        if ($result['color']=="r"){$color="红波";}
        if ($result['color']=="b"){$color="蓝波";}
        if ($result['color']=="g"){$color="绿波";}
    }else{
        $color=$result['color'];
    }
    return $color;
}

/**
 *获取二级下注类型 对应的所有信息
 * @param $class2
 * @return false|PDOStatement|string|\think\Collection
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function getBlByClass2($class2){
    $result=db('bl')->where(['class2'=>$class2])->select();
    return $result;
}

/**
 * 通过rate_id来获取赔率表的字段  代替ka_bl($i,$b) 函数
 * @param $id
 * @return array|false|PDOStatement|string|\think\Model
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function getBlById($id){
    $result=db('bl')->where(['id'=>$id])->find();
    return $result;
}

/**
 * 获取每期对应的购买详细数据
 * @param $field
 * @param string $class1
 * @param string $class2
 * @return mixed
 */
function getTanField($field,$class1='',$class2=''){
    $where=[];
    if(!empty($class1))$where['class1']=$class1;
    if(!empty($class2))$where['class2']=$class2;
    return db('tan')->where($where)->value($field);
}

/**
 * 获取最新期数用户的下注金额  可以代替 ka_kk1($i)函数
 * @param $class1 下注类型1
 * @param $class2 下注类型2
 * @param $class2 下注类型3
 * @return number
 */
function getTanKitheSum($class1='',$class2='',$class3='',$username=true){
    $user=session('lhc_index');
    if($username){
        $where=['kithe'=>getKitheNum(),'username'=>$user['kauser']];
    }else{
        $where=['kithe'=>getKitheNum()];
    }

    if($class1)$where['class1']=$class1;
    if($class2)$where['class2']=$class2;
    if($class3)$where['class3']=$class3;
    $res=db('tan')->where($where)->order(['id'=>'desc'])->field(['sum(sum_m) sum'])->select();
    return $res[0]['sum'] ? $res[0]['sum'] : 0;
}

/**
 * 获取用户字段信息   代替了ka_memuser
 * @param $field
 * @return mixed
 */
function getMemField($field){
    $user=session('lhc_index');
    $result=db('mem')->where(['kauser'=>$user['kauser']])->order(['id'=>'desc'])->value($field);
    return $result;
}

/**
 * 获取指定用户配额表quota的制定字段值   原先对应 ka_memds($rate_id,$size) /ka_guands方法
 * @param $xc   数组位置
 * @param $field  字段    ds,yg,xx(单注限额),xxx(单号限额),ygb,ygc,ygd  分别对应0-6
 * @return mixed
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function getQuotaField($xc,$field,$username=''){
    $session=session('lhc_index');
    if(!$username)$user=$session['kauser'];
    elseif($username=='dai')$user=getMemField('dan');       //代理
    elseif($username=='zong')$user=getMemField('zong');     //总代理
    elseif($username=='guan')$user=getMemField('guan');     //股东
    else $user=$username;
    if($user=='guan1'){
        $result=db('guands')->order(['id'=>'asc'])->where(['lx'=>0])->select();
    }else{
        $result=db('quota')->order(['id'=>'asc'])->where(['username'=>$user])->select();
    }

    return $result[$xc][$field];
}

/**
 * 获取配置表的字段
 * @param $field
 * @return mixed
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function getConfigField($field){
    $res=Db::table('config')->order(['id'=>'asc'])->value($field);
    return $res;
}

//生成订单
function randStr($len=12) {
    $chars='0123456789'; // 字符，以建立密码
    mt_srand((double)microtime()*1000000*getmypid()); // 随机数发生器 (必须做)
    $password='';
    while(strlen($password)<$len) $password.=substr($chars,(mt_rand()%strlen($chars)),1);
    return $password;
}

//获取类型三对应的球号
function getNumber($class3){
    return Db::name('sxnumber')->where(['sx'=>$class3])->value('m_number');
}



//newAdd

/*
*   用户是否登录
*/
function is_login($type){
    $user = session($type.'_auth');
    if (empty($user)) {
        return false;
    } else {
        return $user;
    }
}

function is_admin(){
    $user = is_login('admin');
    $role_id = $user['role']['id'];
    if ($role_id == 1) {
        return true;
    }
    return false;
}

/*
* 是否是微信浏览器
*/
function is_wechat_browser(){
    $user_agent = $_SERVER['HTTP_USER_AGENT'];
    if (strpos($user_agent, 'MicroMessenger') === false){
        return false;
    } else {
        return true;
    }
}

/**
 *	远程获取数据
$urlset = parse_url($url);
if (empty($urlset['path'])) {
$urlset['path'] = '/';
}
if (!empty($urlset['query'])) {
$urlset['query'] = "?{$urlset['query']}";
}else{
$urlset['query'] = '';
}
if (empty($urlset['port'])) {
$urlset['port'] = $urlset['scheme'] == 'https' ? '443' : '80';
}
curl_setopt($ch, CURLOPT_URL, $urlset['scheme'] . '://' . $urlset['host'] . ($urlset['port'] == '80' ? '' : ':' . $urlset['port']) . $urlset['path'] . $urlset['query']);
 */
function curl($url, $data = '',$headers = [],$timeout = 60) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,$url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    @curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    @curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);

    if ($data) {
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    }

    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSLVERSION, 1);

    curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:9.0.1) Gecko/20100101 Firefox/9.0.1");
    if (!empty($headers) && is_array($headers)) {
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    }
    ob_start();
    $res = curl_exec($ch);
    ob_end_clean();
    curl_close($ch);
    unset($ch);

    return $res;
}

/**
 *       获取随机数
 */
function random($length, $numeric = FALSE) {
    $seed = base_convert(md5(microtime() . $_SERVER['DOCUMENT_ROOT']), 16, $numeric ? 10 : 35);
    $seed = $numeric ? (str_replace('0', '', $seed) . '012340567890') : ($seed . 'zZ' . strtoupper($seed));
    if ($numeric) {
        $hash = '';
    } else {
        $hash = chr(rand(1, 26) + rand(0, 1) * 32 + 64);
        $length--;
    }
    $max = strlen($seed) - 1;
    for ($i = 0; $i < $length; $i++) {
        $hash .= $seed{mt_rand(0, $max)};
    }
    $hash=strtoupper($hash);
    return $hash;
}

function getNonceStr($length = 32) {
    $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    $str ="";
    for ( $i = 0; $i < $length; $i++ )  {
        $str .= substr($chars, mt_rand(0, strlen($chars)-1), 1);
    }
    return $str;
}

/*生成全球唯一标识*/
function guid($fix=true){
    $left=$fix?chr(123):'';
    $right=$fix?chr(125):'';
    if (function_exists('com_create_guid')){
        $uuid=com_create_guid();
        if(!$fix){
            $uuid=substr($uuid,1,-1);
        }
        return $uuid;
    }else{
        mt_srand((double)microtime()*10000);
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45);
        $uuid = $left
            .substr($charid, 0, 8).$hyphen
            .substr($charid, 8, 4).$hyphen
            .substr($charid,12, 4).$hyphen
            .substr($charid,16, 4).$hyphen
            .substr($charid,20,12)
            .$right;
        return $uuid;
    }
}

//生成二维码
function createqrcode($data,$level = 'L',$size=4){
    $name = md5($data);
    vendor("phpqrcode.phpqrcode");
    $relativePath =  'public'.DS.'uploads'.DS.date('Ymd',request()->time());
    $absolutePath = ROOT_PATH.$relativePath;
    $file = $absolutePath.DS.$name.".png";
    if (!is_file($file)) {
        is_dir($absolutePath)?'':mkdir($absolutePath, 0755, true);
        $object = new \QRcode();
        $object->png($data,$file, 'L',6);
    }
    return  request()->domain(). DS.$relativePath.DS.$name.".png";
}

function redis_connect(){
    vendor("Predis.autoload");
    $redis = new \Predis\Client(array(
        'scheme' => 'tcp',
        'host'   => '127.0.0.1',
        'port'   => 6379,
    ));
    $password =  \think\Config::get('redis.password');
    if (!empty($password)) {
        $redis->auth(\think\Config::get('database.password'));
    }
    return $redis;
}

/**
 *   自增长单号
 */
function aino($prdfix='',$format='Ymd',$length=3){
    $redis = redis_connect();
    $date = empty($format)?'':date($format);
    $key = $prdfix.$date;
    $no = $redis->incr($key);
    if ($no == 1) {
        $redis->expireat($key,strtotime($date) + 86400);
    }

    $no = str_pad($no,$length,"0",STR_PAD_LEFT);
    $no = $prdfix.$date.$no;
    return $no;
}

/**
 *   获取文件路径
 */
function getfileurl($id){
    $File = model('File');
    $file = $File->where(['id'=>$id])->find();
    return DS. 'public' . DS . 'uploads' .DS .$file['name'];
}

/**
 *   获取配置信息
 */
function getsetting($key){
    $value = model('Setting')->where(['key'=>$key])->value("value");
    $value = json_decode($value,true);
    return $value;
}

/**
 * 加密
 * @param string 明文
 * @param string 公玥
 * @param int 填充方式（貌似php有bug，所以目前仅支持OPENSSL_PKCS1_PADDING）
 * @return string 密文
 */
function encrypt($data, $pubKey , $padding = OPENSSL_PKCS1_PADDING){
    $ret = false;
    if (openssl_public_encrypt($data, $result, $pubKey)){
        $ret = base64_encode($result);
    }
    return $ret;
}

/**
 * 字符串截取，支持中文和其他编码
 * @static
 * @access public
 * @param string $str 需要转换的字符串
 * @param string $start 开始位置
 * @param string $length 截取长度
 * @param string $charset 编码格式
 * @param string $suffix 截断显示字符
 * @return string
 */
function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true) {
    if(function_exists("mb_substr"))
        $slice = mb_substr($str, $start, $length, $charset);
    elseif(function_exists('iconv_substr')) {
        $slice = iconv_substr($str,$start,$length,$charset);
        if(false === $slice) {
            $slice = '';
        }
    }else{
        $re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
        $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
        $re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
        $re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
        preg_match_all($re[$charset], $str, $match);
        $slice = join("",array_slice($match[0], $start, $length));
    }
    return $suffix ? $slice.'...' : $slice;
}

//获取生肖
function Get_sx_Color($rrr){
    $KaSxnumber = model('KaSxnumber');
    if (intval($rrr) < 10) {
        $rrr = '0'.$rrr;
    }
    $zodiac = $KaSxnumber->where(['m_number'=>['LIKE','%'.$rrr.'%'],'id'=>['elt',12]])->value('sx');
    return $zodiac;
}

//获取颜色
function Get_bs_Color($i){
    $KaColor = model('KaColor');
    $color = $KaColor->where(['id'=>$i])->order('id')->find();
    return $color['color'];
}

function ka_Color_s($i){
    $text = ['r'=>'红波','b'=>'蓝波','g'=>'绿波'];
    $color = Get_bs_Color($i);
    return isset($text[$color])?$text[$color]:'';
}

function kasxnumberbyid($id){
    $KaSxnumber = model('KaSxnumber');
    $number = $KaSxnumber->where(['id'=>$id])->value('m_number');
    return $number;
}

function kasxnumberbysx($sx){
    $KaSxnumber = model('KaSxnumber');
    $number = $KaSxnumber->where(['sx'=>$sx])->order('id')->value('m_number');
    return $number;
}

// id,webname,weburl,tm,tmdx,tmps,zm,zmdx,ggpz,sanimal,affice,fenb,haffice2,a1,a2,a3,a10,opwww,a4,a5,a6,a7,a8,a9
function kaconfig($i){
    $Config = model('Config');
    $config = $Config->order('id desc')->find();
    return $config[$i];
}

function Current_Kithe_Num(){
    $KaKithe = model('KaKithe');
    $kithe = $KaKithe->field('nn,na,n1,n2,n3,n4,n5,n6')->where('na = 0 or na is null ')->order('id ASC')->find();
    if (!$kithe) {
        return 0;
    }
    if ($kithe['na'] == 0 || $kithe['n1'] == 0 || $kithe['n2'] == 0 || $kithe['n3'] == 0 || $kithe['n4'] == 0 || $kithe['n5'] == 0 || $kithe['n6'] == 0 ) {
        return $kithe['nn'];
    }
    return $kithe['nn'] + 1;
}


?>