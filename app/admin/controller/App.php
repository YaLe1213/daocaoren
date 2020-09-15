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


namespace app\admin\controller;

use \think\Db;
use \think\Cookie;
use \think\Session;
use app\admin\model\AdminMenu;
use app\admin\controller\Permissions;
class App extends Permissions
{
	/**
	 * 注册协议
	 * @return [type] [description]
	 */
	public function register()
	{
		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == db("register")->where("name","register")->update($post)) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = db("register")->where("name","register")->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * 隐私政策
	 * @return [type] [description]
	 */
	public function private()
	{
		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == db("register")->where("name","private")->update($post)) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = db("register")->where("name","private")->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * 关于我们
	 * @return [type] [description]
	 */
	public function about()
	{
		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == db("register")->where("name","about")->update($post)) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = db("register")->where("name","about")->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * APP参数
	 * @return [type] [description]
	 */
	public function app()
	{
		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == db("app")->where("id",1)->update($post)) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = db("app")->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}
}
