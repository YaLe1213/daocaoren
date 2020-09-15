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
use app\admin\model\Sys as sysModel;
use app\admin\model\Smsconfig as smsModel;
use app\admin\model\AdminMenu;
use app\admin\controller\Permissions;
class System extends Permissions
{
	/**
	 * 系统参数
	 * @return [type] [description]
	 */
	public function sys()
	{
		$model = new sysModel();
		if ($this->request->isPost()) {
			$post = $this->request->param();
            $validate = new \think\Validate([
                ['limit_register', 'require', '每日限制会员注册总人数不能为空'],
                ['limit_tips', 'require', '如果超出限制则APP注册提示框显示不能为空'],
                ['regist_start', 'require', '每日开放会员注册 开始 时间不能为空'],
                ['regist_end', 'require', '每日开放会员注册 结束 时间不能为空'],

            ]);
            if (!$validate->check($post)) {
                $this->error('提交失败：' . $validate->getError());
            }

            if (false == $model->allowfield(true)->save($post,['id'=>$post['id']])) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = $model->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * 转让参数
	 * @return [type] [description]
	 */
	public function transfer()
	{
		$model = new sysModel();
		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == $model->allowfield(true)->save($post,['id'=>$post['id']])) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = $model->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * 置换参数
	 * @return [type] [description]
	 */
	public function zhihuan()
	{
		$model = new sysModel();
		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == $model->allowfield(true)->save($post,['id'=>$post['id']])) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = $model->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * 分红参数
	 * @return [type] [description]
	 */
	public function fenhong()
	{
		$model = new sysModel();
		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == $model->allowfield(true)->save($post,['id'=>$post['id']])) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = $model->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * 奖励参数
	 * @return [type] [description]
	 */
	public function reward()
	{
		$model = new sysModel();

		// 动物
		$zoon = db("zoon")->select();
		$this->assign("zoon",$zoon);

		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == $model->allowfield(true)->save($post,['id'=>$post['id']])) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = $model->find();
			$info['zoon_name'] = db("zoon")->where("id",$info['zoon_id'])->value("name");
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * 获取动物名称
	 * @param $id 动物id
	 * @return  动物名称
	 */
	public function getzoon()
	{
		$id = $this->request->has("id")? $this->request->param("id",0,"intval"):0;
		if ($id > 0) {
			return db("zoon")->where("id",$id)->value("name");
		} else {
			return '';
		}
	}
	/**
	 * 冻结参数
	 * @return [type] [description]
	 */
	public function frozen()
	{
		$model = new sysModel();
		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == $model->allowfield(true)->save($post,['id'=>$post['id']])) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = $model->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * 虚拟会员
	 * @return [type] [description]
	 */
	public function xuni()
	{
		$model = new sysModel();
		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == $model->allowfield(true)->save($post,['id'=>$post['id']])) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = $model->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * 短信接口
	 * @return [type] [description]
	 */
	public function note()
	{
		$model = new smsModel();
		if ($this->request->isPost()) {
			$post = $this->request->param();

            if (false == $model->allowfield(true)->save($post,['sms'=>"sms"])) {
            	return $this->error("保存失败");
            } else {
            	return $this->success("保存成功");
            }
		} else {
			$info = $model->find();
			$this->assign("info",$info);
			return $this->fetch();
		}
	}

	/**
	 * 验证接口
	 * @return [type] [description]
	 */
	public function check()
	{
		return $this->fetch();
	}
}
