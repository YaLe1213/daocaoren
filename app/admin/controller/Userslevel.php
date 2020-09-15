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
use app\admin\model\UsersLevel as userslevelModel;
use app\admin\model\AdminMenu;
use app\admin\controller\Permissions;
class UsersLevel extends Permissions
{
    /**
     * 级别列表
     * @return [type] [description]
     */
    public function index()
    {
        $model = new userslevelModel();

        $list = db("users_level")->select();
        foreach ($list as $key => $value) {
            $list[$key]['upgrade_give'] = explode(',', $value['upgrade_give']);
            $list[$key]['upgrade_give']['0'] = db("zoon")->where("id",$list[$key]['upgrade_give']['0'])->value("zoonlevel");
            $list[$key]['wantbuy_yield'] = explode(',', $value['wantbuy_yield']);
            $list[$key]['push'] = explode(',', $value['push']);
            if ($list[$key]['push']['2'] > 0) {
                $list[$key]['push']['2'] = db("users_level")->where("id",$list[$key]['push']['2'])->value("name")?db("users_level")->where("id",$list[$key]['push']['2'])->value("name"):'';
            }
            
        }
       
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * 添加/修改级别
     * @return [type] [description]
     */
    public function publish()
    {
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;

        // 获取动物
        $zoon = db("zoon")->select();
        $this->assign("zoon",$zoon);
        // 获取级别
        $userslevel = db("users_level")->select();
        $this->assign("userslevel",$userslevel);

        if ($id > 0) {
            // 修改等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();

                $validate = new \think\Validate([
                    ['name','require|unique:users_level,name',"等级名称不能为空|该等级名称已存在"]
                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }

                if ($post['upgrade_give']['0'] == '') {
                    return $this->error("请选择升级赠送的动物");
                }

                if ($post['push']['2'] == '') {
                    return $this->error("请选择会员级别");
                }

                $post['upgrade_give'] = implode(',', $post['upgrade_give']);
                $post['wantbuy_yield'] = implode(',', $post['wantbuy_yield']);
                $post['push'] = implode(',', $post['push']);

                if (false == db("users_level")->where("id",$id)->update($post)) {
                    return $this->error("修改失败");
                } else {
                    return $this->success("修改成功","admin/userslevel/index");
                }
            } else {
                $info = db("users_level")->where("id",$id)->find();
                $info['upgrade_give'] = explode(',', $info['upgrade_give']);
                $info['wantbuy_yield'] = explode(',', $info['wantbuy_yield']);
                $info['push'] = explode(',', $info['push']);
                $this->assign("info",$info);
                return $this->fetch();
            }
        } else {
            // 添加等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();
                $validate = new \think\Validate([
                    ['name','require|unique:users_level,name',"等级名称不能为空|该等级名称已存在"]
                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                if ($post['upgrade_give']['0'] == '') {
                    return $this->error("请选择升级赠送的动物");
                }

                if ($post['push']['2'] == '') {
                    return $this->error("请选择会员级别");
                }
                $post['upgrade_give'] = implode(',', $post['upgrade_give']);
                $post['wantbuy_yield'] = implode(',', $post['wantbuy_yield']);
                $post['push'] = implode(',', $post['push']);

                if (false == db("users_level")->insert($post)) {
                    return $this->error("添加失败");
                } else {
                    return $this->success("添加成功","admin/userslevel/index");
                }
            } else {
                return $this->fetch();
            }
        }
    }

    /**
     * 删除级别
     * @return [type] [description]
     */
    public function delete()
    {
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        if ($id > 0) {
            if (false == db("users_level")->where("id",$id)->delete()) {
                return $this->error("删除失败");
            } else {
                return $this->success("删除成功","admin/userslevel/index");
            }
        } else {
            return $this->error("id错误");   
        }
    }

    /**
     * 获取动物名称
     * @return [type] [description]
     */
    public function getname()
    {
        $id = $this->request->param("id");
        return db("zoon")->where("id",$id)->value("name");
    }

}
