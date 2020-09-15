<?php
namespace app\api\controller;

use think\Controller;
use AlibabaCloud\Client\AlibabaCloud;
use AlibabaCloud\Client\Exception\ClientException;
use AlibabaCloud\Client\Exception\ServerException;

class SendSms extends Controller {

    static private $accessKeyId = "****************";
    static private  $accessSecret = "*****************";
    static private  $signName = "*****服务信息平台";
   // 优先加载
   public function  _initialize() {

   }

    static function  send_sms($mobile,$code,$template){
        $accessKeyId = self::$accessKeyId;
        $accessSecret = self::$accessSecret;
        $signName = self::$signName;
        AlibabaCloud::accessKeyClient($accessKeyId, $accessSecret)
            ->regionId('cn-hangzhou')
            ->asDefaultClient();

        try {
            $result = AlibabaCloud::rpc()
                ->product('Dysmsapi')
                // ->scheme('https') // https | http
                ->version('2017-05-25')
                ->action('SendSms')
                ->method('POST')
                ->host('dysmsapi.aliyuncs.com')
                ->options([
                    'query' => [
                        'RegionId' => "cn-hangzhou",
                        'PhoneNumbers' => $mobile,
                        'SignName' => $signName,
                        'TemplateCode' => $template,
                        'TemplateParam' => $code,
                    ],
                ])
                ->request();
            print_r($result->toArray());
        } catch (ClientException $e) {
            echo $e->getErrorMessage() . PHP_EOL;
        } catch (ServerException $e) {
            echo $e->getErrorMessage() . PHP_EOL;
        }
    }
}