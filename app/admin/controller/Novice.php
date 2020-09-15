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

use \think\Cache;
use \think\Controller;
use think\Loader;
use think\Db;
use \think\Cookie;
use \think\Session;
use app\admin\controller\Permissions;
use app\admin\model\Novice as noviceModel;
class Novice extends Permissions
{


    public function index()
    {
        $model = new noviceModel();
        $info = $model->paginate(20);
        foreach ($info as $key => $value) {
            $info[$key]['content'] = strip_tags($value['content']);
        }
        $this->assign('info',$info);
        return $this->fetch();
    }



    public function publish()
    {
        //获取菜单id
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        $model = new noviceModel();
        //是正常添加操作
        if($id > 0) {
            //是修改操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['sort', 'require|unique:novice,sort', '请输入排序|该排序已存在'],
                    ['title', 'require', '标题不能为空'],
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                //验证菜单是否存在
                $cate = $model->where('id',$id)->find();
                if(empty($cate)) {
                    return $this->error('id不正确');
                }
                if(false == $model->allowField(true)->save($post,['id'=>$id])) {
                    return $this->error('修改失败');
                } else {
                    return $this->success('修改成功','admin/novice/index');
                }
            } else {
                //非提交操作
                $info = $model->where('id',$id)->find();

                if(!empty($info)) {
                    $this->assign('info',$info);
                    return $this->fetch();
                } else {
                    return $this->error('id不正确');
                }
            }
        } else {
            //是新增操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['title', 'require|unique:novice,sort', '请输入排序|该排序已存在'],
                    ['sort', 'require', '请输入排序'],
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                $post['create_time'] = time();
                if(false == $model->allowField(true)->save($post)) {
                    return $this->error('添加失败');
                } else {
                    return $this->success('添加成功','admin/novice/index');
                }
            } else {
                //非提交操作
                return $this->fetch();
            }
        }
        
    }


    public function delete()
    {
        if($this->request->isAjax()) {
            $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;

                if(false == Db::name('novice')->where('id',$id)->delete()) {
                    return $this->error('删除失败');
                } else {
                    return $this->success('删除成功','admin/novice/index');
                }

        }
    }
}
