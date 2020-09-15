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

class Users extends Controller
{
    public $uid='';
    protected function _initialize()
    {
        // 解密token
       $arr=Request::instance()->header('token');
			if($arr==null){
				http_response_code(401);
				exit(json_error(2,'登录错误',[]));

			}
			$token = json_decode(checkToken($arr),true);
			if($token['code']!=='200'){
				http_response_code(401);
				exit(json_error(2,'登录错误',$token));
				// echo checkToken($arr);
				// die;
			}
          //解密token
        $tokens=check($arr);
        $this->uid=json_decode(json_encode($tokens),true)['uid'];
    }

    /**
     * 实名认证
     * @return [type] [description]
     */
	public function idcard()
	{
		if ($this->request->isPost()) {
			$post = $this->request->param();

	        $validate = new \think\Validate([
	            ['name', 'require', '请填写姓名'],
	            ['idcard', 'require|unique,real_idcard,idcard', '请填写身份证号码|该身份证号已被实名认证，请重新填写。'],
	        ]);
	        if (!$validate->check($post)) {
	            return json_error(0,$validate->getError());
	        }

			// 启动事务
			Db::startTrans();
			try{
			    db("real_idcard")->insert(['users_id'=>$this->uid,"mode"=>"自主认证",'real_name'=>$post['name'],'idcard'=>$post['idcard'],'create_time'=>time()]);
				db("users")->where("id",$this->uid)->update(['users_grade_id'=>2]);
			    // 提交事务
			    Db::commit(); 
			    return json_success(1,"认证成功");   
			} catch (\Exception $e) {
			    // 回滚事务
			    Db::rollback();
			    return json_error(0,"认证失败");	
			}


		} else {
			return json_error(1,"请求方式不允许");
		}
	}

	/**
	 * 会员等级
	 * @return [type] [description]
	 */
	public function level()
	{
		$info = db("users")->where("id",$this->uid)->find();
		// 直推会员数量
		$num = db("users")->where("recommended",$info['phone'])->count();

		if ($info['consensus'] >=200 and $info['consensus'] < 2000 and $num >=4) {

			if (db("users")->where("id",$this->uid)->update(['users_level_id'=>3])) {
				return db("users")->alias("u")->join("users_level ul",'ul.id=u.users_level_id')->where("u.id",$this->uid)->value("ul.name");
			};  //3      H1级

		} else if ($info['consensus'] >=2000 and $info['consensus'] < 10000 and $num >=9) {

			$uns = db("users")->where(['recommended'=>$info['phone'],'users_level_id'=>['>=','3']])->count();
			if ($uns >= 3) {
				if (db("users")->where("id",$this->uid)->update(['users_level_id'=>4])) {
					return db("users")->alias("u")->join("users_level ul",'ul.id=u.users_level_id')->where("u.id",$this->uid)->value("ul.name");
				}  //3      H2级
			}

		} else if ($info['consensus'] >=10000 and $info['consensus'] < 50000 and $num >=12) {

			$uns = db("users")->where(['recommended'=>$info['phone'],'users_level_id'=>['>=','4']])->count();
			if ($uns >= 3) {
				if (db("users")->where("id",$this->uid)->update(['users_level_id'=>5])) {
				  	return db("users")->alias("u")->join("users_level ul",'ul.id=u.users_level_id')->where("u.id",$this->uid)->value("ul.name");
				}  //3      H3级
			}

		} else if ($info['consensus'] >=50000 and $info['consensus'] < 200000 and $num >=30) {

			$uns = db("users")->where(['recommended'=>$info['phone'],'users_level_id'=>['>=','5']])->count();
			if ($uns >= 3) {
				if (db("users")->where("id",$this->uid)->update(['users_level_id'=>6])) {
				  	return db("users")->alias("u")->join("users_level ul",'ul.id=u.users_level_id')->where("u.id",$this->uid)->value("ul.name");				
				}  //3      H4级
			}

		} else if ($info['consensus'] >=200000 and $num >=50) {

			$uns = db("users")->where(['recommended'=>$info['phone'],'users_level_id'=>['>=','6']])->count();
			if ($uns >= 3) {
				if (db("users")->where("id",$this->uid)->update(['users_level_id'=>7])) {
				  	return db("users")->alias("u")->join("users_level ul",'ul.id=u.users_level_id')->where("u.id",$this->uid)->value("ul.name");
				}  //3      H5级
			}

		} else {
			return db("users")->alias("u")->join("users_level ul",'ul.id=u.users_level_id')->where("u.id",$this->uid)->value("ul.name");
		}
	}


	/********************************首页************************************/

	/**
	 * 首页顶部信息
	 * @return users_level_id 用户等级
	 * @return thumb 用户头像
	 * @return nickname 会员昵称
	 * @return credit 信誉分
	 * @return use_hos 可用HOS
	 * @return eggs 鸡蛋数量
	 * @return consensus 共识度
	 */
	public function home()
	{
		$info = db("users")->field("users_level_id,thumb,nickname,credit,use_hos,eggs,consensus")->where("id",$this->uid)->find();
		if ($info['users_level_id'] == 1) {
			$info['target'] = 200;
		} else if ($info['users_level_id'] == 3) {
			$info['target'] = 2000;
		} else if ($info['users_level_id'] == 4) {
			$info['target'] = 10000;
		} else if ($info['users_level_id'] == 5) {
			$info['target'] = 50000;
		} else if ($info['users_level_id'] == 6) {
			$info['target'] = 200000;
		} else if ($info['users_level_id'] == 7) {
			$info['target'] = 200000;
		}
		$info['users_level_id'] = db("users_level")->where("id",$info['users_level_id'])->value("name");
		$info['thumb'] = str_replace("\\", "/", $info['thumb']);
		return json_success(1,"success",$info);
	}

	/**
	 * 公告列表
	 * @param int $status 活动状态 没有传值 为 全部公告  1为已读 其他 为未读
	 * @return id 活动id
	 * @return title 活动标题
	 * @return create_time 发布时间
	 * @return status 读取状态
	 */
	public function notice()
	{
		$post = $this->request->param();
		$noticed = db("notice_role")->where("users_id",$this->uid)->select();
		$ids = '';
		foreach ($noticed as $key => $value) {
			$ids .= $value['notice_id'].","; 
		}
		$dis = substr($ids,0,strlen($ids)-1);
		if (isset($post['status'])) {
			
			if ($post['status'] == 1) {
				// 已读
				$notice = db("notice")->field('id,title,create_time')->where(["id"=>['in',$ids]])->select();
			} else {
				// 未读
				$notice = db("notice")->field('id,title,create_time')->where(["id"=>['not in',$ids]])->select();
			}
		} else {
			$notice = db("notice")->field('id,title,create_time')->select();
		}
		foreach ($notice as $key => $value) {
			foreach ($noticed as $k => $v) {
				if ($value['id'] == $v['notice_id']) {
					$notice[$key]['status'] = "已读";
				} else {
					$notice[$key]['status'] = "未读";
				}
			}
			$notice[$key]['create_time'] = date("Y-m-d",$value['create_time']);
		}
		return json_success(1,"success",$notice);
	}

	/**
	 * 公告详情
	 * @param int $id 公告id
	 * @return title 公告标题
	 * @return create_time 公告发布时间
	 * @return content 公告内容
	 */
	public function noticeinfo()
	{
		$id = $this->request->has("id") ? $this->request->param("id",0,'intval'):0;
		if ($id > 0) {
			if (false == db("notice_role")->where("notice_id",$id)->find()) {
				db("notice_role")->insert(['users_id'=>$this->uid,'notice_id'=>$id]);
			}
			$info = db("notice")->field("title,create_time,content")->where("id",$id)->find();
			if ($info) {
				$info['create_time'] = date("Y-m-d",$info['create_time']);
				return json_success(1,"success",$info);
			} else {
				return json_error(0,"该条公告已不存在");
			}

		} else {
			return json_error(0,"未接收到公告ID");			
		}
	}

	/**
	 * 转让参数
	 * @return [type] [description]
	 */
	public function zhuanrang()
	{
		$transfer = db("sys")->where("id",1)->find();
		// 鸡蛋数量
		$data['eggs'] = db("users")->where("id",$this->uid)->value("eggs");
		// 手续功能状态
		$data['transfer_status'] = $transfer['transfer_status'];
		// 单次最低转让产量
		$data['one_line'] = $transfer['one_line'];
		// 单次最高转让产量
		$data['one_hight'] = $transfer['one_hight'];
		// 每日累计最高转让产量
		$data['day_total'] = $transfer['day_total'];
		// 每日累计转让次数限制
		$data['day_num'] = $transfer['day_num'];

		return json_success(1,"success",$data);
	}



	/**
	 * 我的好友
	 * @return [type] [description]
	 */
	public function friends()
	{
		$user = db("users")->where("id",$this->uid)->find();
		// 获取下级好友
		$users = arrays($this->getfriends($user['phone']));

		// 获取上机好友
		$userss = $this->getprev($user['recommended']);

		$arr = array();
		foreach($users as $k=>$r){
			array_push($userss,$r);
		}
		$arr = repeatAR($userss,'id');
		return json_success(1,"success",$arr);
	}

	/**
	 * 获取下级好友
	 * @param  int $num   显示好友的层级
	 * @param  int $prev  向上显示好友层级
	 * @param  int $phone 推荐人手机号
	 * @return array        返回好友
	 */
	public function getfriends($phone,$num=0)
	{
		// $user = db("users")->where("id",$this->uid)->find()
		// 显示好友层级
		$nums = db("sys")->where('id',1)->value("show_level");
		// 向上显示好友
		$prev = db("sys")->where('id',1)->value("show_prev");

		$users = db("users")->field("id,users_level_id,thumb,nickname,recommended,phone")->where("recommended",$phone)->select();
		$num += 1;
		foreach ($users as $key => $value) {
			
			$users[$key]['users_level_id'] = db("users_level")->where('id',$value['users_level_id'])->value("name");
			$users[$key]['thumb'] = str_replace("\\", "/", $value['thumb']);
			$users[$key]['num'] = $num;
			// 向下获取好友
				$users[$key]['users'] = $this->getfriends($value['phone'],$users[$key]['num']);
			if ( $num >= $nums and $nums != 0 ) {
				break;
			} 
		}
		foreach ($users as $key => $value) {
			$users[$key]['num'] = 1;
		}
		return $users;
	}

	/**
	 * 获取上级好友
	 * @param  int $num   显示好友的层级
	 * @param  int $prev  向上显示好友层级
	 * @param  int $phone 推荐人手机号
	 * @return array        返回好友
	 */
	public function getprev($phone,$num=0)
	{
		$prev = db("sys")->where('id',1)->value("show_prev");
		$arr = [];
		if ($prev == 1) {
			// 向上显示好友
			$u1 = db("users")->field("id,users_level_id,thumb,nickname,recommended,phone")->where("phone",$phone)->find();			
			if (!empty($u1)) {
				$arr[0] = $u1;
			}
		} else if ($prev == 2) {
			$u1 = db("users")->field("id,users_level_id,thumb,nickname,recommended,phone")->where("phone",$phone)->find();
			$u2 = db("users")->field("id,users_level_id,thumb,nickname,recommended,phone")->where("phone",$u1['recommended'])->find();
			if (!empty($u1)) {
				$arr[0] = $u1;
			}
			if (!empty($u2)) {
				$arr[1] = $u2;
			}
		} else if ($prev == 3) {
			$u1 = db("users")->field("id,users_level_id,thumb,nickname,recommended,phone")->where("phone",$phone)->find();
			$u2 = db("users")->field("id,users_level_id,thumb,nickname,recommended,phone")->where("phone",$u1['recommended'])->find();
			$u3 = db("users")->field("id,users_level_id,thumb,nickname,recommended,phone")->where("phone",$u2['recommended'])->find();
			if (!empty($u1)) {
				$arr[0] = $u1;
			}
			if (!empty($u2)) {
				$arr[1] = $u2;
			}
			if (!empty($u3)) {
				$arr[2] = $u3;
			}
		}
		if (!empty($arr)) {
			foreach ($arr as $key => $value) {
				$arr[$key]['users_level_id'] = db("users_level")->where('id',$value['users_level_id'])->value("name");
				$arr[$key]['thumb'] = str_replace("\\", "/", $value['thumb']);
				$arr[$key]['num'] = 1;
			}
		}
			
		return $arr;

	}

	/**
	 * 转让
	 * @return [type] [description]
	 */
	public function transfer()
	{
		if ($this->request->isPost()) {
			$transfer = db("sys")->where("id",1)->find();
			if ($transfer['transfer_status'] == 0) {
				return json_error(0,"转让功能暂未开启");
			}
			
			$post = $this->request->param();
			$validate = new \think\Validate([
	            ['eggs', 'require', '请填写鸡蛋数量'],
	            ['eggsyu', 'require', '请填写鸡蛋剩余数量'],
	            ['phone', 'require', '请填写好友账号'],
	            ['paypass', 'require', '请填写您设置的安全密码'],

	        ]);
	        if (!$validate->check($post)) {
	            return json_error(0,$validate->getError());
	        }
	        if ($post['eggsyu'] < 0) {
	        	return json_error(0,"请重新填写转让数量！手续费自动从账户中扣除，当前账户余额不够扣除手续费");
	        }
	        // 检测是不是好友

	        // 判断安全密码
	        if (password(db("users")->where("id",$this->uid)->value("paypass")) != password($post['paypass'])) {
	        	return json_error(0,"安全密码错误，请重新输入。");
	        }
	       
	        // 启动事务
			Db::startTrans();
			try{
			    db("zhuanrang")->insert(['users_id'=>$this->uid,"eggs"=>$post['eggs'],'phone'=>$post['phone'],'create_time'=>time()]);
			    db("users")->where("id",$this->uid)->update(['eggs'=>$post['eggsyu']]);
			    // 提交事务
			    Db::commit();
			    return json_success(1,"恭喜！转让成功！");
			    
			} catch (\Exception $e) {
			    // 回滚事务
			    Db::rollback();
			    return json_error(0,"转让失败");	
			}
		} else {
			return json_error(0,"请求方式不允许");
		}
		

	}




























	/**
	 * 领取注册奖励
	 * @return [type] [description]
	 */
	public function receiveregist()
	{
		// 判断用户有没有实名
		if (false == db("real_name")->where("users_id",$this->uid)->find()) {
			return json_error(0,"您还未实名认证，请前往实名认证");
		}
	}

	/**
	 * 日志
	 * @return [type] [description]
	 */
	public function daily()
	{
		// 实名认证
		$real_name = db("real_name")->where("users_id",$this->uid)->find();
		//  我 支付宝认证
		$real_ali = db("real_ali")->where("users_id",$this->uid)->find();
		// 我  银行卡认证
		$real_bank = db("real_bank")->where("users_id",$this->uid)->find();
		//  我 微信认证
		$real_wx = db("real_bank")->where("users_id",$this->uid)->find();
		// 我  领取注册奖励动物

		// 我 直推奖励

		// 好友 间推奖励

		// 好友 养殖成功奖励

		// 我 商店购买动物

		// 我 商店购买道具

		// 我 养殖成功奖励

		// 我 成功喂养奖励

		// 我 成功收获鸡蛋 

		// 我 转让好友  鸡蛋 **个

		// 我 收入好友 鸡蛋**个

		// 我 鸡蛋置换HOS : **个

		// 我 HOS置换鸡蛋 : **个

		// /我使用道具:**道具名称**

		// 我 抽奖小号鸡蛋**个

		// 我 解除限制小号鸡蛋 ** 个

		// 我 成功偷取好友**好友昵称**鸡蛋 **个

		// 我 一键偷取好友**昵称***鸡蛋 ***个


	}

}
