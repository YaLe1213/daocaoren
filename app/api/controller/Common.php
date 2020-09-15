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


namespace app\api\controller;

use \think\Cache;
use \think\Controller;
use think\Loader;
use think\Db;
use \think\Cookie;
use \think\Session;
use think\Request; 
use app\api\model\Users as usersModel;
class Common extends Controller
{
	protected function _initialize()
    {
    	// 系统参数
    	$sys = db("sys")->find();
    	$this->sys = $sys;
    }

    /**
     * 下载注册会员 
     * @return [type] [description]
     */
	public function register()
	{
		$model = new usersModel();
		//注册系统关闭
		if ($this->sys['status'] == 0) {   
			return json_error(0,$this->sys['closs_tips']);
		}
		//超出注册时间段
		if (date("H:i:s") <= $this->sys['regist_start'] || date("H:i:s") >= $this->sys['regist_end']) {
			return json_error(0,$this->sys['over_time_tips']);
		}
		// 注册人数超出
		$users = db("users")->select();
		$num = 0;
		foreach ($users as $key => $value) {
			if (date("Y-m-d",$value['create_time']) == date("Y-m-d")) {
				$num += 1;
			}
		}
		if ($num >= $this->sys['limit_register']) {
			return json_error(0,$this->sys['limit_tips']);
		}

		if ($this->request->isPost()) {
			$post = $this->request->param();

	        $validate = new \think\Validate([
	            ['yqm', 'require', '请填写邀请码'],
	            ['nickname', 'require|unique:users,nickname', '请填写您的会员昵称|该会员昵称已存在，请重新填写。'],
	            ['phone', 'require|unique:users,phone|/^1[3-8]{1}[0-9]{9}$/', '请输入注册手机号|该手机号已被注册，请重新填写。|该手机号禁止注册，请重新填写。'],
	            ['sms_code', 'require', '请填写短信验证码'],
	            ['password', 'require|min:6', '请设置登录密码|登录密码至少6位，请重新填写。'],
	            ['paypass', 'require|/^\d{6}$/', '请设置安全密码|安全密码必须是6位纯数字，请重新填写。'],
	        ]);

	        if (!$validate->check($post)) {
	            return json_error(0,$validate->getError());
	        }
	        // if ($post['code'] != Session::get('code')) {
	        // 	return json_error(0,"短信验证码错误，请重新填写。");
	        // }

	        if (false == db("users")->where("phone",$post['yqm'])->find()) {
	        	return json_error(0,"邀请码错误，请重新填写。");
	        }
	        // 初始化会员头像
	        $post['thumb'] = str_replace("\\",'/',db("app")->where("id",1)->value("thumb"));
	        // 初始化会员等级
	        $post['users_grade_id'] = 1;
	        // 初始化会员级别
	       	$post['users_level_id'] = 1;
	       	// 初始化会员信誉分
	       	$post['credit'] = db("deal")->value("first_credit");
	       	$post['recommonded'] = $post['yqm'];

	        if (false == $model->allowfield(true)->save($post)) {
	        	return json_error(0,"注册失败");
	        } else {
	        	return json_success(1,"注册成功");
	        }
		} else {
			return json_error(0,"请求方式不允许");
		}
	}

	/**
	 * 分享注册会员
	 * @return [type] [description]
	 */
	public function register1()
	{
		$model = new usersModel();
		//注册系统关闭
		if ($this->sys['status'] == 0) {   
			return json_error(0,$this->sys['closs_tips']);
		}
		//超出注册时间段
		if (date("H:i:s") <= $this->sys['regist_start'] || date("H:i:s") >= $this->sys['regist_end']) {
			return json_error(0,$this->sys['over_time_tips']);
		}
		// 注册人数超出
		$users = db("users")->select();
		$num = 0;
		foreach ($users as $key => $value) {
			if (date("Y-m-d",$value['create_time']) == date("Y-m-d")) {
				$num += 1;
			}
		}
		if ($num >= $this->sys['limit_register']) {
			return json_error(0,$this->sys['limit_tips']);
		}

		if ($this->request->isPost()) {
			$post = $this->request->param();

	        $validate = new \think\Validate([
	            ['yqm', 'require', '请填写邀请码'],
	            ['nickname', 'require|unique:users,nickname', '请填写您的会员昵称|该会员昵称已存在，请重新填写。'],
	            ['phone', 'require|unique:users,phone|/^1[3-8]{1}[0-9]{9}$/', '请输入注册手机号|该手机号已被注册，请重新填写。|该手机号禁止注册，请重新填写。'],
	            ['sms_code', 'require', '请填写短信验证码'],
	            ['password', 'require|min:6', '请设置登录密码|登录密码至少6位，请重新填写。'],
	            ['paypass', 'require|/^\d{6}$/', '请设置安全密码|安全密码必须是6位纯数字，请重新填写。'],
	        ]);

	        if (!$validate->check($post)) {
	            return json_error(0,$validate->getError());
	        }
	        // if ($post['code'] != Session::get('code')) {
	        // 	return json_error(0,"短信验证码错误，请重新填写。");
	        // }

	        if (false == db("users")->where("phone",$post['yqm'])->find()) {
	        	return json_error(0,"邀请码错误，请重新填写。");
	        }
	        // 初始化会员头像
	        $post['thumb'] = db("app")->where("id",1)->value("thumb");
	        // 初始化会员等级
	        $post['users_grade_id'] = 1;
	        // 初始化会员级别
	       	$post['users_level_id'] = 1;
	       	// 初始化会员信誉分
	       	$post['credit'] = db("deal")->value("first_credit");
	       	
	       	$post['recommonded'] = $post['yqm'];

	        if (false == $model->allowfield(true)->save($post)) {
	        	return json_error(0,"注册失败");
	        } else {
	        	return json_success(1,"注册成功");
	        }
		} else {
			return json_error(0,"请求方式不允许");
		}
	}

	/**
	 * 手机号密码  登录
	 * @return [type] [description]
	 */
	public function login()
	{
		if ($this->request->isPost()) {
			$post = $this->request->param();

	        $validate = new \think\Validate([
	            ['phone', 'require|/^1[3-8]{1}[0-9]{9}$/', '请填写注册手机号|手机号格式不正确'],
	            ['password', 'require', '请填写登录密码'],
	        ]);
	        if (!$validate->check($post)) {
	            return json_error(0,$validate->getError());
	        }
	        $info = db("users")->where(["phone"=>$post['phone']])->find();
	        if ($info) {
	        	if ($post['password'] != $info['password']) {
	        		return json_error(0,"密码错误，请重新填写。");
	        	} else {
	        		if ($info['login_limit'] == "限制") {
		        		return json_error(0,$info['login_limit_reasons']);
		        	} else {
		        		$data = [
	                        'token'=>createToken($info['id'])
	          
	                    ];
		        		return json_success(1,"登录成功",$data);
		        	}
	        	}
	        } else {
	        	return json_error(0,"手机号暂未注册!");
	        }

		} else {
			return json_error(1,"请求方式不允许");
		}
		
	}

	/**
	 * 短信验证  登录
	 * @return [type] [description]
	 */
	public function smslogin()
	{
		if ($this->request->isPost()) {
			$post = $this->request->param();

	        $validate = new \think\Validate([
	            ['code', 'require', '请填写短信验证码'],
	            ['phone', 'require', '手机号不能为空'],
	        ]);
	        if (!$validate->check($post)) {
	            return json_error(0,$validate->getError());
	        }
	        if ($post['code'] != Session::get('code')) {
	        	return json_error(0,"短信验证码错误，请重新填写。");
	        }

	        $info = db("users")->where(["phone"=>$post['phone']])->find();
	        	
    		$data = [
                'token'=>createToken($info['id'])
  
            ];
    		return json_success(1,"登录成功",$data);

		} else {
			return json_error(1,"请求方式不允许");
		}
		
	}

	/**
	 * 找回登录密码
	 * @return [type] [description]
	 */
	public function repassword()
	{
		if ($this->request->isPost()) {
			$post = $this->request->param();

	        $validate = new \think\Validate([
	            ['code', 'require', '请填写短信验证码'],
	            ['phone', 'require', '请填写注册手机号'],
	            ['password', 'require|min:6', '请填写新的登录密码|登录密码至少6位，请重新填写。'],
	        ]);
	        if (!$validate->check($post)) {
	            return json_error(0,$validate->getError());
	        }
	        $info = db("users")->where("phone",$post['phone'])->find();
	        if (false == $info) {
	        	return json_error(0,"该手机号暂未注册!");
	        }
	        if ($post['code'] != Session::get('code')) {
	        	return json_error(0,"短信验证码错误，请重新填写。");
	        }
	        if (false == db("users")->where("phone",$post['phone'])->update(['password'=>$post['password']])) {
	        	return json_error(0,"找回失败");
	        } else {
	        	return json_success(1,"找回成功");
	        }

		} else {
			return json_error(1,"请求方式不允许");
		}
	}

	/**
	 * 用户注册协议
	 * @return [type] [description]
	 */
	public function agreement()
	{
		$info = db("register")->field("title,content")->where("name","register")->find();
		return json_success(1,"success",$info);
	}

	/**
	 * 关于我们
	 * @return [type] [description]
	 */
	public function about()
	{
		$info = db("register")->field("title,content")->where("name","about")->find();
		return json_success(1,"success",$info);
	}

	/**
	 * 隐私策略
	 * @return [type] [description]
	 */
	public function private()
	{
		$info = db("register")->field("title,content")->where("name","private")->find();
		return json_success(1,"success",$info);
	}

	/**
	 * APP启动背景图片
	 * @return [type] [description]
	 */
	public function start()
	{
		$data = str_replace("\\",'/',db("app")->where("id",1)->value("start_up"));
		return json_success(0,"success",$data);
	}

    /**
     * 发送 注册 验证码
     * @return [type] [description]
     */
    public function sendRegister(){
        $post = $this->request->param();

        $validate = new \think\Validate([
            ['phone', 'require|/^1[3-8]{1}[0-9]{9}$/', '请填写注册手机号|手机号格式不正确'],
        ]);

        if (!$validate->check($post)) {
            return $this->error($validate->getError());
        }


        $mobile = $post['phone'];
        $template = "SMS_195580724";

        $code['code']  = mt_rand(000000,999999);
        $aa = $code['code'];
        Session::set("code",$code['code']);
        $return = SendSms::send_sms($mobile,json_encode($code),$template);
        return json_success(1,"发送成功",$return);
    }

    /**
     * 发送 登录 验证码
     * @return [type] [description]
     */
    public function sendLogin(){
        $post = $this->request->param();

        $validate = new \think\Validate([
            ['phone', 'require|/^1[3-8]{1}[0-9]{9}$/', '请填写注册手机号|手机号格式不正确'],
        ]);

        if (!$validate->check($post)) {
            return $this->error($validate->getError());
        }

        if (false == db("users")->where("phone",$post['phone'])->find()) {
            return json_error(0,"该手机号未注册");
        }
        $mobile = $post['phone'];
        $template = "SMS_195580724";

        $code['code']  = mt_rand(000000,999999);
        $aa = $code['code'];
        Session::set("code",$code['code']);
        $return = SendSms::send_sms($mobile,json_encode($code),$template);
        return json_success(1,"发送成功",$return);
    }

}
