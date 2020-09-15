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
use app\admin\model\Itemshop as itemModel;
use app\admin\model\AdminMenu;
use app\admin\controller\Permissions;
class Itemshop extends Permissions
{
    /**
     * 道具列表
     * @return [type] [description]
     */
    public function index()
    {
        $model = new itemModel();

        $list = $model->paginate(20);
        
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * 添加/修改道具
     * @return [type] [description]
     */
    public function publish()
    {
        $model = new itemModel();
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;

        if ($id > 0) {
            // 修改等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();
                $validate = new \think\Validate([
                    ['sort', 'require|unique:itemshop,sort', '排序号不能为空|序号重复，请重新输入'],
                    ['name|unique:itemshop,name', 'require', '道具名称不能为空|该道具名称已存在'],
                    ['buy_yield', 'require', '购买所需产量为空'],
                    ['desc', 'require', 'APP显示说明不能为空'],
                    ['thumb', 'require', '请上传静态图标'],
                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                
                if ($post['desc'] == 1) {
                    $post['app_desc'] = '可将动物的喂养中的状态直接变更为可摘取状态';
                } else if ($post['desc'] == 2) {
                    $post['app_desc'] = '可一键偷取可偷好友列表中当前时间点内的所有好友产量';
                } else if ($post['desc'] == 3) {
                    $post['app_desc'] = '防好友偷取产量守护24小时(从使用开始时间倒计时24小时)';
                }

                if (false == $model->allowField(true)->save($post,['id'=>$id])) {
                    return $this->error("修改失败");
                } else {
                    return $this->success("修改成功","admin/itemshop/index");
                }
            } else {
                $info = db("itemshop")->where("id",$id)->find();
                $this->assign("info",$info);
                return $this->fetch();
            }
        } else {
            // 添加等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();
                $validate = new \think\Validate([
                    ['sort', 'require|unique:itemshop,sort', '排序号不能为空|序号重复，请重新输入'],
                    ['name|unique:itemshop,name', 'require', '道具名称不能为空|该道具名称已存在'],
                    ['buy_yield', 'require', '购买所需产量为空'],
                    ['desc', 'require', 'APP显示说明不能为空'],
                    ['thumb', 'require', '请上传静态图标'],
                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                if ($post['desc'] == 1) {
                    $post['app_desc'] = '可将动物的喂养中的状态直接变更为可摘取状态';
                } else if ($post['desc'] == 2) {
                    $post['app_desc'] = '可一键偷取可偷好友列表中当前时间点内的所有好友产量';
                } else if ($post['desc'] == 3) {
                    $post['app_desc'] = '防好友偷取产量守护24小时(从使用开始时间倒计时24小时)';
                }
                $post['create_time'] = time();
                
                if (false == $model->allowField(true)->save($post)) {
                    return $this->error("添加失败");
                } else {
                    return $this->success("添加成功","admin/itemshop/index");
                }
            } else {
                return $this->fetch();
            }
        }
    }

    /**
     * 删除道具
     * @return [type] [description]
     */
    public function delete()
    {
        $id = $this->request->param("id");
        if (db("itemshop")->where("id",$id)->find()) {
            if (false == db("itemshop")->where("id",$id)->delete()) {
                return $this->error("删除失败");
            } else {
                return $this->success("删除成功","admin/itemshop/index");
            }
        } else {
            return $this->error("ID错误");
        }

    }


}
