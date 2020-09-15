<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 听雨 < 389625819@qq.com >
// +----------------------------------------------------------------------

// 应用公共文件
use Firebase\JWT\JWT;
/**
 * 根据附件表的id返回url地址
 * @param  [type] $id [description]
 * @return [type]     [description]
 */
function geturl($id)
{
	if ($id) {
		$geturl = \think\Db::name("attachment")->where(['id' => $id])->find();
		if($geturl['status'] == 1) {
			//审核通过
			return $geturl['filepath'];
		} elseif($geturl['status'] == 0) {
			//待审核
			return '/uploads/xitong/beiyong1.jpg';
		} else {
			//不通过
			return '/uploads/xitong/beiyong2.jpg';
		} 
    }
    return false;
}


/**
 * [SendMail 邮件发送]
 * @param [type] $address  [description]
 * @param [type] $title    [description]
 * @param [type] $message  [description]
 * @param [type] $from     [description]
 * @param [type] $fromname [description]
 * @param [type] $smtp     [description]
 * @param [type] $username [description]
 * @param [type] $password [description]
 */
function SendMail($address)
{
    vendor('phpmailer.PHPMailerAutoload');
    //vendor('PHPMailer.class#PHPMailer');
    $mail = new \PHPMailer();          
     // 设置PHPMailer使用SMTP服务器发送Email
    $mail->IsSMTP();                
    // 设置邮件的字符编码，若不指定，则为'UTF-8'
    $mail->CharSet='UTF-8';         
    // 添加收件人地址，可以多次使用来添加多个收件人
    $mail->AddAddress($address); 

    $data = \think\Db::name('emailconfig')->where('email','email')->find();
            $title = $data['title'];
            $message = $data['content'];
            $from = $data['from_email'];
            $fromname = $data['from_name'];
            $smtp = $data['smtp'];
            $username = $data['username'];
            $password = $data['password'];   
    // 设置邮件正文
    $mail->Body=$message;           
    // 设置邮件头的From字段。
    $mail->From=$from;  
    // 设置发件人名字
    $mail->FromName=$fromname;  
    // 设置邮件标题
    $mail->Subject=$title;          
    // 设置SMTP服务器。
    $mail->Host=$smtp;
    // 设置为"需要验证" ThinkPHP 的config方法读取配置文件
    $mail->SMTPAuth=true;
    //设置html发送格式
    $mail->isHTML(true);           
    // 设置用户名和密码。
    $mail->Username=$username;
    $mail->Password=$password; 
    // 发送邮件。
    return($mail->Send());
}


/**
 * 阿里大鱼短信发送
 * @param [type] $appkey    [description]
 * @param [type] $secretKey [description]
 * @param [type] $type      [description]
 * @param [type] $name      [description]
 * @param [type] $param     [description]
 * @param [type] $phone     [description]
 * @param [type] $code      [description]
 * @param [type] $data      [description]
 */
function SendSms($param,$phone)
{
    // 配置信息
    import('dayu.top.TopClient');
    import('dayu.top.TopLogger');
    import('dayu.top.request.AlibabaAliqinFcSmsNumSendRequest');
    import('dayu.top.ResultSet');
    import('dayu.top.RequestCheckUtil');

    //获取短信配置
    $data = \think\Db::name('smsconfig')->where('sms','sms')->find();
            $appkey = $data['appkey'];
            $secretkey = $data['secretkey'];
            $type = $data['type'];
            $name = $data['name'];
            $code = $data['code'];
    
    $c = new \TopClient();
    $c ->appkey = $appkey;
    $c ->secretKey = $secretkey;
    
    $req = new \AlibabaAliqinFcSmsNumSendRequest();
    //公共回传参数，在“消息返回”中会透传回该参数。非必须
    $req ->setExtend("");
    //短信类型，传入值请填写normal
    $req ->setSmsType($type);
    //短信签名，传入的短信签名必须是在阿里大于“管理中心-验证码/短信通知/推广短信-配置短信签名”中的可用签名。
    $req ->setSmsFreeSignName($name);
    //短信模板变量，传参规则{"key":"value"}，key的名字须和申请模板中的变量名一致，多个变量之间以逗号隔开。
    $req ->setSmsParam($param);
    //短信接收号码。支持单个或多个手机号码，传入号码为11位手机号码，不能加0或+86。群发短信需传入多个号码，以英文逗号分隔，一次调用最多传入200个号码。
    $req ->setRecNum($phone);
    //短信模板ID，传入的模板必须是在阿里大于“管理中心-短信模板管理”中的可用模板。
    $req ->setSmsTemplateCode($code);
    //发送
    

    $resp = $c ->execute($req);
}


/**
 * 替换手机号码中间四位数字
 * @param  [type] $str [description]
 * @return [type]      [description]
 */
function hide_phone($str){
    $resstr = substr_replace($str,'****',3,4);  
    return $resstr;  
}
/**
 * 文字超出省略
 * 
 * 
 */
 function subtext($text, $length){
  if(mb_strlen($text,'utf8') > $length)return mb_substr($text,0,$length,'utf8').'…';return $text;

}

/**
 * 创建 token
 * @param array $data 必填 自定义参数数组
 * @param integer $exp_time 必填 token过期时间 单位:秒 例子：7200=2小时
 * @param string $scopes 选填 token标识，请求接口的token
 * @return string
 */
function createToken($data = "", $exp_time = 0, $scopes = "")
{

    //JWT标准规定的声明，但不是必须填写的；
    //iss: jwt签发者
    //sub: jwt所面向的用户
    //aud: 接收jwt的一方
    //exp: jwt的过期时间，过期时间必须要大于签发时间
    //nbf: 定义在什么时间之前，某个时间点后才能访问
    //iat: jwt的签发时间
    //jti: jwt的唯一身份标识，主要用来作为一次性token。
    //公用信息
    try {
        $key = 'huang';
        $time = time(); //当前时间
        $token['iss'] = 'Jouzeyu'; //签发者 可选
        $token['aud'] = ''; //接收该JWT的一方，可选
        $token['iat'] = $time; //签发时间
        $token['nbf'] = $time+3; //(Not Before)：某个时间点后才能访问，比如设置time+30，表示当前时间30秒后才能使用
        if ($scopes) {
            $token['scopes'] = $scopes; //token标识，请求接口的token
        }
        if (!$exp_time) {
            $exp_time = 3600*24*30;//默认=2小时过期
        }
        $token['exp'] = $time + $exp_time; //token过期时间,这里设置2个小时
        if ($data) {
            $token['uid'] = $data; //自定义参数
        }

        $json = JWT::encode($token, $key);
        //Header("HTTP/1.1 201 Created");
        //return json_encode($json); //返回给客户端token信息
        return $json; //返回给客户端token信息

    } catch (\Firebase\JWT\ExpiredException $e) {  //签名不正确
        $returndata['code'] = "104";//101=签名不正确
        $returndata['msg'] = $e->getMessage();
        $returndata['data'] = "";//返回的数据
        return json_encode($returndata); //返回信息
    } catch (Exception $e) {  //其他错误
        $returndata['code'] = "199";//199=签名不正确
        $returndata['msg'] = $e->getMessage();
        $returndata['data'] = "";//返回的数据
        return json_encode($returndata); //返回信息
    }
}

/**
 * 验证token是否有效,默认验证exp,nbf,iat时间
 * @param string $jwt 需要验证的token
 * @return string $msg 返回消息
 */
function checkToken($jwt)
{
    $key = 'huang';
    try {
        JWT::$leeway = 60;//当前时间减去60，把时间留点余地
        $decoded = JWT::decode($jwt, $key, ['HS256']); //HS256方式，这里要和签发的时候对应
        $arr = (array)$decoded;

        $returndata['code'] = "200";//200=成功
        $returndata['msg'] = "成功";//
        $returndata['data'] = $arr;//返回的数据
        return json_encode($returndata,JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT); //返回信息

    } catch (\Firebase\JWT\SignatureInvalidException $e) {  //签名不正确
        //echo "2,";
        //echo $e->getMessage();
        $returndata['code'] = "101";//101=签名不正确
        $returndata['msg'] = $e->getMessage();
        $returndata['data'] = "";//返回的数据
        return json_encode($returndata); //返回信息
    } catch (\Firebase\JWT\BeforeValidException $e) {  // 签名在某个时间点之后才能用
        //echo "3,";
        //echo $e->getMessage();
        $returndata['code'] = "102";//102=签名不正确
        $returndata['msg'] = $e->getMessage();
        $returndata['data'] = "";//返回的数据
        return json_encode($returndata); //返回信息
    } catch (\Firebase\JWT\ExpiredException $e) {  // token过期
        //echo "4,";
        //echo $e->getMessage();
        $returndata['code'] = "103";//103=签名不正确
        $returndata['msg'] = $e->getMessage();
        $returndata['data'] = "";//返回的数据
        return json_encode($returndata); //返回信息
    } catch (Exception $e) {  //其他错误
        //echo "5,";
        //echo $e->getMessage();
        $returndata['code'] = "199";//199=签名不正确
        $returndata['msg'] = $e->getMessage();
        $returndata['data'] = "";//返回的数据
        return json_encode($returndata); //返回信息
    }
    //Firebase定义了多个 throw new，我们可以捕获多个catch来定义问题，catch加入自己的业务，比如token过期可以用当前Token刷新一个新Token
}

// 解密token
 function check($token){
    // vendor('firebase.php-jwt.src.JWT');
    $JWT=new \Firebase\JWT\JWT();
     $jwt = $token;
   // $jwt = input("token");  //上一步中返回给用户的token
    $key = "huang";  //上一个方法中的 $key 本应该配置在 config文件中的
    $info = $JWT->decode($jwt,$key,["HS256"]); //解密jwt
    return $info;
}
/**
 * 成功返回
 * @param  int $code 成功码
 * @param  [type] $msg  [description]
 * @param  array  $arr  [description]
 * @return [type]       [description]
 */
function json_success($code,$msg,$arr=[]){
    return json_encode(['code'=>$code,'status_code'=>'success','msg'=>$msg,'datas'=>$arr],JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
}
/**
 * 失败返回
 * @param  int $code 错误码
 * @param  string $msg  提示信息
 * @param  array  $arr  返回数据
 * @return [type]       [description]
 */
function json_error($code,$msg,$arr=[]){
    return json_encode(['code'=>$code,'status_code'=>'error','msg'=>$msg,'datas'=>$arr],JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
}

/**
 * 生成二维码
 * @param  string $content 二维码内容
 * @return string          二维码保存路径
 */
function userimg($content){

    //引入phpqrcode类库文件
    vendor('phpqrcode.phpqrcode');
    $value = $content;         //二维码内容
    $errorCorrectionLevel = 'L';  //容错级别
    $matrixPointSize = 8;      //生成图片大小

     // 判断是否有这个文件夹  没有的话就创建一个
    if(!is_dir("qrcode")){
    // 创建文件加
        mkdir("qrcode");
    }

     // 设置二维码图片名称，以及存放的路径
    $filename = 'qrcode/'.time().rand(10000,9999999).'.png';
  
    // 使用类库生成二维码
    QRcode::png($value,$filename , $errorCorrectionLevel, $matrixPointSize, 2);

    // 　//如果需要转换成base64数据，解开下面这行注释即可
    // 　$image_data = chunk_split(base64_encode(fread(fopen($filename, 'r'), filesize($filename))));
    return $filename;
} 
