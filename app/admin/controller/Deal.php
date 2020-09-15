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
use app\admin\model\Deal as dealModel;
use app\admin\model\Trend as trendModel;
use app\admin\model\AdminMenu;
use app\admin\controller\Permissions;

class Deal extends Permissions
{
    /**
     * 交易参照
     * @return [type] [description]
     */
    public function index()
    {
        $model = new dealModel();
        if ($this->request->isPost()) {
            $post = $this->request->param();
            if (false == $model->allowfield(true)->save($post)) {
                return $this->error("保存失败");
            } else {
                return $this->success("保存成功");
            }
        } else {
            $info = db("deal")->find();
            $this->assign("info",$info);
            return $this->fetch();
        }
    }

    /**
     * 价格走势
     * @return [type] [description]
     */
    public function pricetrend()
    {
        $model = new trendModel();
        $time = date("Y-m-d");
        $this->assign("time",$time);
        if ($this->request->isPost()) {
            $post = $this->request->param();
            $post['update_time'] = time();
            if (false == $model->allowfield(true)->save($post)) {
                return $this->error("保存失败");
            } else {
                return $this->success("保存成功");
            }
        } else {
            $info = db("trend")->find();
            $this->assign("info",$info);
            return $this->fetch();
        }
    }
 
}
