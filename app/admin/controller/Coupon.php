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
use app\admin\model\Coupon as couponModel;
use app\admin\model\AdminMenu;
use app\admin\controller\Permissions;

class Coupon extends Permissions
{
    /**
     * 卷码列表
     * @return [type] [description]
     */
    public function index()
    {
        $model = new couponModel();

        $list = $model->paginate(20);
        
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * 添加/修改卷码
     * @return [type] [description]
     */
    public function publish()
    {
        $model = new couponModel();
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;

        if ($id > 0) {
            // 修改等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();
                $validate = new \think\Validate([
                    ['name', 'require|unique:coupon,name', '卷码名称不能为空|改卷码已存在'],
                    ['use_shop', 'require', '请选择使用商店'],
                    ['deduct_yield', 'require', '抵扣产量不能为空'],
                    ['thumb', 'require', '请上传静态图标'],
                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                if (false == $model->allowfield(true)->save($post,['id'=>$id])) {
                    return $this->error("修改失败");
                } else {
                    return $this->success("修改成功","admin/coupon/index");
                }
            } else {
                $info = db("coupon")->where("id",$id)->find();
                $this->assign("info",$info);
                return $this->fetch();
            }
        } else {
            // 添加等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();
                $validate = new \think\Validate([
                    ['name', 'require|unique:coupon,name', '卷码名称不能为空|改卷码已存在'],
                    ['use_shop', 'require', '请选择使用商店'],
                    ['deduct_yield', 'require', '抵扣产量不能为空'],
                    ['thumb', 'require', '请上传静态图标'],
                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                $post['create_time'] = time();
            
                if (false == $model->allowfield(true)->save($post)) {
                    return $this->error("添加失败");
                } else {
                    return $this->success("添加成功","admin/coupon/index");
                }
            } else {
                return $this->fetch();
            }
        }
    }

    /**
     * 删除卷码
     * @return [type] [description]
     */
    public function delete()
    {
        $id = $this->request->has("id") ? $this->request->param('id') : 0 ;
        if ($id > 0) {
            if (false == db("coupon")->where("id",$id)->find()) {
                return $this->error("未找到卷码");
            } else {
                if (false == db("coupon")->where('id',$id)->delete()) {
                    return $this->error("删除失败");
                } else {
                    return $this->success("删除成功");
                }
            }
        } else {
            return $this->error("ID错误");
        }
    }

}
