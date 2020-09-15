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
use app\admin\model\RealIdcard as cardModel;
use app\admin\model\RealAlipay as aliModel;
use app\admin\model\RealBank as bankModel;
use app\admin\controller\Permissions;
class Log extends Permissions
{
    /**
     * 实名记录
     * @return [type] [description]
     */
    public function realname()
    {
        $model = new cardModel();
        $post = $this->request->param();
        
        if (isset($post['nickname']) and !empty($post['nickname'])) {
            $where1['nickname'] = ['like', '%' . $post['nickname'] . '%'];
            $users = db("users")->where($where1)->select();
            $users_id = [];
            foreach ($users as $key => $value) {
                $users_id[] = $value['id'];
            }
            $where['id'] = ["in" ,$users_id];
        }
        
        if (isset($post['phone']) and !empty($post['phone'])) {
            $where2['phone'] = ['like', '%' . $post['phone'] . '%'];
            $users = db("users")->where($where2)->select();
            $users_id = [];
            foreach ($users as $key => $value) {
                $users_id[] = $value['id'];
            }
            $where['id'] = ["in" ,$users_id];
        }
        
        if (isset($post['real_name']) and !empty($post['real_name'])) {
            $where['real_name'] = ['like', '%' . $post['real_name'] . '%'];
        }

        if (isset($post['idcard']) and !empty($post['idcard'])) {
            $where['idcard'] = ['like', '%' . $post['idcard'] . '%'];
        }

        if (isset($post['mode']) and !empty($post['mode'])) {
            $where['mode'] = $post['mode'];
        }

        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $min_time = strtotime($post['create_time']);
            $max_time = $min_time + 24 * 60 * 60;
            $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        }

        $list = empty($where) ? $model->order('create_time desc')->paginate(20) : $model->where($where)->order('create_time desc')->paginate(20,false,['query'=>$this->request->param()]);
        $this->assign("list",$list);
        return $this->fetch();
        
    }

    /**
     * 收款认证
     * @return [type] [description]
     */
    public function realpay()
    {
        $ali = new aliModel();
        $post = $this->request->param();

        if (isset($post['nickname']) and !empty($post['nickname'])) {
            $where1['nickname'] = ['like', '%' . $post['nickname'] . '%'];
            $users = db("users")->where($where1)->select();
            $users_id = [];
            foreach ($users as $key => $value) {
                $users_id[] = $value['id'];
            }
            $where['id'] = ["in" ,$users_id];
        }
        
        if (isset($post['phone']) and !empty($post['phone'])) {
            $where2['phone'] = ['like', '%' . $post['phone'] . '%'];
            $users = db("users")->where($where2)->select();
            $users_id = [];
            foreach ($users as $key => $value) {
                $users_id[] = $value['id'];
            }
            $where['id'] = ["in" ,$users_id];
        }
        
        if (isset($post['real_name']) and !empty($post['real_name'])) {
            $where['real_name'] = ['like', '%' . $post['real_name'] . '%'];
        }

        if (isset($post['alinum']) and !empty($post['alinum'])) {
            $where['alinum'] = ['like', '%' . $post['alinum'] . '%'];
        }

        if (isset($post['mode']) and !empty($post['mode'])) {
            $where['mode'] = $post['mode'];
        }

        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $min_time = strtotime($post['create_time']);
            $max_time = $min_time + 24 * 60 * 60;
            $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        }

        $info['ali'] = empty($where) ? $ali->order('create_time desc')->paginate(20) : $ali->where($where)->order('create_time desc')->paginate(20,false,['query'=>$this->request->param()]);
        

        $this->assign("info",$info);
        return $this->fetch();
    }


    public function realbank()
    {
        $bank = new bankModel();
        $post = $this->request->param();

        if (isset($post['nickname']) and !empty($post['nickname'])) {
            $where1['nickname'] = ['like', '%' . $post['nickname'] . '%'];
            $users = db("users")->where($where1)->select();
            $users_id = [];
            foreach ($users as $key => $value) {
                $users_id[] = $value['id'];
            }
            $where['id'] = ["in" ,$users_id];
        }
        
        if (isset($post['phone']) and !empty($post['phone'])) {
            $where2['phone'] = ['like', '%' . $post['phone'] . '%'];
            $users = db("users")->where($where2)->select();
            $users_id = [];
            foreach ($users as $key => $value) {
                $users_id[] = $value['id'];
            }
            $where['id'] = ["in" ,$users_id];
        }
        
        if (isset($post['real_name']) and !empty($post['real_name'])) {
            $where['real_name'] = ['like', '%' . $post['real_name'] . '%'];
        }

        if (isset($post['idcard']) and !empty($post['idcard'])) {
            $where['idcard'] = ['like', '%' . $post['idcard'] . '%'];
        }

        if (isset($post['mode']) and !empty($post['mode'])) {
            $where['mode'] = $post['mode'];
        }

        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $min_time = strtotime($post['create_time']);
            $max_time = $min_time + 24 * 60 * 60;
            $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        }

        $info['bank'] = empty($where) ? $bank->order('create_time desc')->paginate(20) : $bank->where($where)->order('create_time desc')->paginate(20,false,['query'=>$this->request->param()]);
        $this->assign("info",$info);
        return $this->fetch();
    }

    /**
     * 直推奖励
     * @return [type] [description]
     */
    public function zhitui()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 注册奖励
     * @return [type] [description]
     */
    public function register()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 领导奖励
     * @return [type] [description]
     */
    public function leader()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 养殖奖励
     * @return [type] [description]
     */
    public function feed()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 互动奖励
     * @return [type] [description]
     */
    public function interact()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 转让记录
     * @return [type] [description]
     */
    public function transfer()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 置换记录
     * @return [type] [description]
     */
    public function zhihuan()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 商店记录
     * @return [type] [description]
     */
    public function shop()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 分红收入
     * @return [type] [description]
     */
    public function fenhongincome()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 分红发放
     * @return [type] [description]
     */
    public  function fenhonggrant()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 道具记录
     * @return [type] [description]
     */
    public function prop()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 抽奖记录
     * @return [type] [description]
     */
    public function luckdraw()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 交易信誉
     * @return [type] [description]
     */
    public function transaction()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 价格记录
     * @return [type] [description]
     */
    public function price()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }

    /**
     * 交易列表
     * @return [type] [description]
     */
    public function transactionlist()
    {
        if ($this->request->isPost()) {
            
        } else {
            return $this->fetch();
        }
    }
}
