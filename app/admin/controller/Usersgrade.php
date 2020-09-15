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
use app\admin\model\UsersGrade as usersgradeModel;//管理员模型
use app\admin\model\AdminMenu;
use app\admin\controller\Permissions;
class Usersgrade extends Permissions
{
    /**
     * 等级列表
     * @return [type] [description]
     */
    public function index()
    {
        $model = new usersgradeModel();

        $list = $model->paginate(20);
        
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * 添加/修改等级
     * @return [type] [description]
     */
    public function publish()
    {
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;

        if ($id > 0) {
            // 修改等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();
                $validate = new \think\Validate([
                    ['name', 'require|unique:users_grade,name', '等级名称不能为空|该等级已存在'],
                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                if (false == db("users_grade")->where("id",$id)->update($post)) {
                    return $this->error("修改失败");
                } else {
                    return $this->success("修改成功","admin/usersgrade/index");
                }
            } else {
                $info = db("users_grade")->where("id",$id)->find();
                $this->assign("info",$info);
                return $this->fetch();
            }
        } else {
            // 添加等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();
                $validate = new \think\Validate([
                    ['name', 'require|unique:users_grade,name', '等级名称不能为空|该等级已存在'],
                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                if (false == db("users_grade")->insert($post)) {
                    return $this->error("添加失败");
                } else {
                    return $this->success("添加成功","admin/usersgrade/index");
                }
            } else {
                return $this->fetch();
            }
        }
    }

    /**
     * 删除等级
     * @return [type] [description]
     */
    public function delete()
    {
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        if ($id > 0) {
            if (false == db("users_grade")->where("id",$id)->delete()) {
                return $this->error("删除失败");
            } else {
                return $this->success("删除成功","admin/usersgrade/index");
            }
        } else {
            return $this->error("id错误");   
        }
    }


}
