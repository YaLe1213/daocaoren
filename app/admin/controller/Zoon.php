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
use app\admin\model\Zoon as zoonModel;
use app\admin\model\AdminMenu;
use app\admin\controller\Permissions;
class Zoon extends Permissions
{
    /**
     * 动物列表
     * @return [type] [description]
     */
    public function index()
    {
        $model = new zoonModel();

        $list = $model->paginate(20);
        
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * 添加/修改动物
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
                    ['sort', 'require|unique:zoon,sort', '排序号不能为空|序号重复，请重新输入'],
                    ['zoonlevel', 'require', '动物名称不能为空'],
                    ['name', 'require', '动物名称不能为空'],
                    ['day_yield', 'require', '每日产量不能为空'],
                    ['breed_cycle', 'require', '养殖周期不能为空'],
                    ['buyoutput', 'require', '购买所需产量不能为空'],
                    ['inc_consensus', 'require', '购买增加奖励共识度不能为空'],
                    ['dec_consensus', 'require', '养殖结束减少共识度不能为空'],
                    ['max_breed_num', 'require', '最大养殖数量不能为空'],
                    ['thumb', 'require', '图标不能为空'],
                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                if (db("zoon")->where(["id"=>["neq",$id],"name"=>$post['name'],"zoonlevel"=>$post['zoonlevel']])->select()) {
                    return $this->error("当前级别动物已存在");
                }
                if (false == db("zoon")->where("id",$id)->update($post)) {
                    return $this->error("修改失败");
                } else {
                    return $this->success("修改成功","admin/zoon/index");
                }
            } else {
                $info = db("zoon")->where("id",$id)->find();
                $this->assign("info",$info);
                return $this->fetch();
            }
        } else {
            // 添加等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();
                $validate = new \think\Validate([
                    ['sort', 'require|unique:zoon,sort', '排序号不能为空|序号重复，请重新输入'],
                    ['zoonlevel', 'require', '动物名称不能为空'],
                    ['name', 'require', '动物名称不能为空'],
                    ['day_yield', 'require', '每日产量不能为空'],
                    ['breed_cycle', 'require', '养殖周期不能为空'],
                    ['buyoutput', 'require', '购买所需产量不能为空'],
                    ['inc_consensus', 'require', '购买增加奖励共识度不能为空'],
                    ['dec_consensus', 'require', '养殖结束减少共识度不能为空'],
                    ['max_breed_num', 'require', '最大养殖数量不能为空'],
                    ['thumb', 'require', '图标不能为空'],
                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                $post['create_time'] = time();
                if (db("zoon")->where(["name"=>$post['name'],"zoonlevel"=>$post['zoonlevel']])->select()) {
                    return $this->error("当前级别动物已存在");
                }
                if (false == db("zoon")->insert($post)) {
                    return $this->error("添加失败");
                } else {
                    return $this->success("添加成功","admin/zoon/index");
                }
            } else {
                return $this->fetch();
            }
        }
    }

    /**
     * 删除动物
     * @return [type] [description]
     */
    public function delete()
    {

    }


}
