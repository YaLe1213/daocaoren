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
use app\admin\model\Prize as prizeModel;
use app\admin\model\AdminMenu;
use app\admin\controller\Permissions;
class Prize extends Permissions
{
    /**
     * 奖项列表
     * @return [type] [description]
     */
    public function index()
    {
        $model = new prizeModel();

        $list = $model->paginate(20);
        foreach ($list as $key => $value) {
            if ($value['cate'] == 1) {
                $list[$key]['cate'] = "道具商店";
            } else if ($value['cate'] == 2) {
                $list[$key]['cate'] = "动物商店";
            } else if ($value['cate'] == 3) {
                $list[$key]['cate'] = "自定义";
            }
        }
        
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * 添加/修改奖项
     * @return [type] [description]
     */
    public function publish()
    {
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;

        $zoon = db("zoon")->select();
        $item = db("itemshop")->select();
        $this->assign("zoon",$zoon);
        $this->assign("item",$item);

        if ($id > 0) {
            // 修改等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();
                $validate = new \think\Validate([
                    ['cate', 'require', '请选择奖品类型'],
                    ['chance1', 'require', '中奖数量不能为空'],
                    ['chance2', 'require', '累计抽奖次数不能为空'],

                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }

                if ($post['cate'] == 1) { //道具商店
                    if (empty($post['itemshop_id'])) {
                        return $this->error("请选择道具");
                    }
                    $post['name'] = db("itemshop")->where("id",$post['itemshop_id'])->value("name");
                    $post['zoon_id'] = '';
                    $post['custom'] = '';

                } else if ($post['cate'] == 2) { //动物商店
                    if (empty($post['zoon_id'])) {
                        return $this->error("请选择动物级别");
                    }
                    $post['name'] = db("zoon")->where("id",$post['zoon_id'])->value("name");
                    $post['custom'] = '';
                    $post['itemshop_id'] = '';

                } else if ($post['cate'] == 3) { //自定义
                    if (empty($post['custom'])) {
                        return $this->error("自定义名称不能为空");
                    }
                    $post['name'] = $post['custom'];
                    $post['zoon_id'] = '';
                    $post['itemshop_id'] = '';

                }
                if (false == db("prize")->where("id",$id)->update($post)) {
                    return $this->error("修改失败");
                } else {
                    return $this->success("修改成功","admin/prize/index");
                }
            } else {
                $info = db("prize")->where("id",$id)->find();
                if (!empty($info['zoon_id'])) {
                    $post['zoon_name'] = db("zoon")->where("id",$id)->value("name");
                }
                $this->assign("info",$info);
                return $this->fetch();
            }
        } else {
            // 添加等级
            if ($this->request->isPost()) {
                // 提交
                $post = $this->request->param();
                $validate = new \think\Validate([
                    ['cate', 'require', '请选择奖品类型'],
                    ['chance1', 'require', '中奖数量不能为空'],
                    ['chance2', 'require', '累计抽奖次数不能为空'],

                ]);
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }

                if ($post['cate'] == 1) { //道具商店
                    if (empty($post['itemshop_id'])) {
                        return $this->error("请选择道具");
                    }
                    $post['name'] = db("itemshop")->where("id",$post['itemshop_id'])->value("name");
                    $post['zoon_id'] = '';
                    $post['custom'] = '';

                } else if ($post['cate'] == 2) { //动物商店
                    if (empty($post['zoon_id'])) {
                        return $this->error("请选择动物级别");
                    }
                    $post['name'] = db("zoon")->where("id",$post['zoon_id'])->value("name");
                    $post['custom'] = '';
                    $post['itemshop_id'] = '';

                } else if ($post['cate'] == 3) { //自定义
                    if (empty($post['custom'])) {
                        return $this->error("自定义名称不能为空");
                    }
                    $post['name'] = $post['custom'];
                    $post['zoon_id'] = '';
                    $post['itemshop_id'] = '';

                }

                if (false == db("prize")->insert($post)) {
                    return $this->error("添加失败");
                } else {
                    return $this->success("添加成功","admin/prize/index");
                }
            } else {
                return $this->fetch();
            }
        }
    }

    /**
     * 删除奖项
     * @return [type] [description]
     */
    public function delete()
    {
        $id = $this->request->has('id') ?$this->request->param("id"):0;
        if ($id > 0) {
            if (false == db("prize")->where("id",$id)->delete()) {
                return $this->error("删除失败");
            } else {
                return $this->success("删除成功","admin/prize/index");
            }
        } else {
            return $this->error("未找到id");
        }
    }

    /**
     * 获取动物名称
     * @return [type] [description]
     */
    public function getzoonname()
    {
        $id = $this->request->param("id",0,'intval');
        return db("zoon")->where("id",$id)->value("name");
    }


}
