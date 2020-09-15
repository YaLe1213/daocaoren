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
use app\admin\model\Users as usersModel;//管理员模型
use app\admin\model\RealIdcard as realidcardModel;//管理员模型
use app\admin\model\RealBank as realbankModel;//管理员模型
use app\admin\model\RealAlipay as realalipayModel;//管理员模型
use app\admin\model\AdminMenu;
use app\admin\controller\Permissions;
class Users extends Permissions
{
    /**
     * 会员列表
     * @return [type] [description]
     */
    public function index()
    {
        //实例化管理员模型
        $model = new usersModel();

        $list = $model->paginate(20);
        foreach ($list as $key => $value) {
            if (empty($value['recommended'])) {
                $list[$key]['recommend_name'] = '';
                $list[$key]['recommend_phone'] = '';
            } else {
                $in = db("users")->where("recommend_code",$value['recommended'])->find();
                $name = db("real_idcard")->where("users_id",$in['id'])->value("real_name");
                $list[$key]['recommend_name'] = $name;
                $list[$key]['recommend_phone'] = $in['phone'];
            }
            if (false == db("real_bank")->where("users_id",$value['id'])->find()) {
                $list[$key]['realbank'] = "未认证";
            } else {
                $list[$key]['realbank'] = "已认证";
            }
            if (false == db("real_alipay")->where("users_id",$value['id'])->find()) {
                $list[$key]['realalipay'] = "未认证";
            } else {
                $list[$key]['realalipay'] = "已认证";
            }
        }
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * insert or update member
     * @return [type] [description]
     */
    public function publish()
    {
        // obtain usersgrade and userslevel
        $usersgrade = db("users_grade")->select();
        $userslevel = db("users_level")->select();
        $this->assign("usersgrade",$usersgrade);
        $this->assign("userslevel",$userslevel);
        $model = new usersModel();
        $id = $this->request->has("id")?$this->request->param('id',0,'intval'):0;
        if ($id > 0) {
            // is update opration
            if ($this->request->isPost()) {
                // is submit opration
                $post = $this->request->param();

                $validate = new \think\Validate([
                    ['nickname', 'require|unique:users,nickname', '昵称不能为空|改昵称已被占用'],
                    ['phone', '/^1[3-8]{1}[0-9]{9}$/|max:11|unique:users,phone', '请输入正确的手机号|手机号最多11位|该手机号已注册'],
                    ['password', 'require|max:16|min:6', '请输入密码|密码最多16位|密码最少6位'],
                    ['paypass', 'require|max:6', '请输入支付密码|支付密码最多6位'],
                ]);
                
                if (!$validate->check($post)) {
                    $this->error('修改失败：' . $validate->getError());
                }
                if (false == $model->allowField(true)->save($post,["id"=>$id])) {
                    return $this->request->error("修改失败");
                } else {
                    return $this->success("修改成功","admin/users/index");
                }
            } else {
                //is load view
                $info = db("users")->where("id",$id)->find();
                $use = db("users")->where("recommend_code",$info['recommended'])->find();
                $info['recommend_name'] = db("real_idcard")->where("users_id",$use['id'])->value("real_name");
                $info['recommend_phone'] = $use['phone'];
                $this->assign("info",$info);
                return $this->fetch();
            }
        } else {
            // is insert opration
            if ($this->request->isPost()) {
                // is submit opration
                $post = $this->request->param();

                $validate = new \think\Validate([
                    ['nickname', 'require|unique:users,nickname', '昵称不能为空|改昵称已被占用'],
                    ['phone', '/^1[3-8]{1}[0-9]{9}$/|max:11|unique:users,phone', '请输入正确的手机号|手机号最多11位|该手机号已注册'],
                    ['password', 'require|max:16|min:6', '请输入密码|密码最多16位|密码最少6位'],
                    ['paypass', 'require|max:6', '请输入支付密码|支付密码最多6位'],
                ]);
                
                if (!$validate->check($post)) {
                    $this->error('修改失败：' . $validate->getError());
                }
                $post['recommend_code'] = "NC".mt_rand(0000000,9999999);
                $post['create_time'] = time();
                $post['register_ip'] = $_SERVER['REMOTE_ADDR'];
                $post['thumb'] = db("app")->where("id",1)->value("thumb");
                if (false == $model->allowField(true)->save($post)) {
                    return $this->request->error("添加用户失败");
                } else {
                    return $this->success("添加用户成功","admin/users/index");
                }
            } else {
                //is load view
                return $this->fetch();
            }
        }
    }

    /**
     * 删除会员
     * @return [type] [description]
     */
    public function delete()
    {

    }

    /**
     * 关系
     * @return [type] [description]
     */
    public function relationship()
    {
        $id = $this->request->has("id")?$this->request->param("id",0,'intval'):0;
            $i = [];
            $i['name'] = db("real_idcard")->where("users_id",$id)->value("real_name
                        ").db("users")->where("id",$id)->value("phone");
            $i['ratio'] = '';
            $i['children'] = $this->get($id);
            dump($i);
        $this->assign("id",$id);
        return $this->fetch();
    }
    public function getdata()
    {
        $id = $this->request->has("id")?$this->request->param("id",0,'intval'):0;
            $i = [];
            $i['name'] = db("real_idcard")->where("users_id",$id)->value("real_name
                        ")."".db("users")->where("id",$id)->value("phone");
            $i['ratio'] = '111';
            $i['children'] = $this->get($id);
        return $i;
    }
    public function get($id)
    {
        $recommend = db("users")->where("id",$id)->value('recommend_code');
        $i = 0;
        $arr = [];
        if(!empty($recommend)){
            $users = db("users")->field(['id','phone'])->where("recommended",$recommend)->select();
            $i += 1;
            foreach ($users as $key => $value) {
                if ($i == 1) {
                    $arr[$key]['ratio'] = "直推：".$i."层";
                } else {
                    $arr[$key]['ratio'] = "间推：".$i."层";
                }
                
                $arr[$key]['name'] = db("real_idcard")->where("users_id",$value['id'])->value("real_name
                    ")." : ".$value['phone'];
                $arr[$key]['children'] =  $this->get($value["id"]);
            }
        }
        return $arr;
    }
    /**
     * 调整
     * @return [type] [description]
     */
    public function adjust()
    {
        $id = $this->request->has("id")?$this->request->param('id',0,'intval'):0;
        $this->assign('id',$id);
        if ($this->request->isPost()) {
            $post = $this->request->param();
            $validate = new \think\Validate([
                ['ob', 'require', '请选择调整项目'],
            ]);
            
            if (!$validate->check($post)) {
                $this->error('调整失败：' . $validate->getError());
            }
            if ( false == db("users")->where("id",$post['id'])->update([$post['ob']=>intval($post['num'])])) {
                return $this->error('调整失败');
            } else {
                return $this->success("调整成功");
            }
        } else {
            $info = db("users")->field(["shed_num",'consensus','credit','yield','use_hos','frozen_hos','feed','onekey_steal','dogs','coupon_50','coupon_200','coupon_600'])->where("id",$id)->find();
            $feed = db("feed")->where("users_id",$id)->select();
            $info['feeding'] = [];
            foreach ($feed as $key => $value) {
                $in = db('zoon')->where('id',$value['zoon_id'])->find();
                $info['feeding'][$key]['num'] = $value['num'];
                $info['feeding'][$key]['method'] = $value['method'];
                $info['feeding'][$key]['level'] = $in['zoonlevel']."级";
                $info['feeding'][$key]['name'] = $in['name'];
            }
            $house =  db('warehouse')->where("users_id",$id)->select();
            $info['house'] = [];
            foreach ($house as $key => $value) {
                $in = db('zoon')->where('id',$value['zoon_id'])->find();
                $info['warehouse'][$key]['num'] = $value['num'];
                $info['warehouse'][$key]['method'] = $value['method'];
                $info['warehouse'][$key]['level'] = $in['zoonlevel']."级";
                $info['warehouse'][$key]['name'] = $in['name'];
            }
            $this->assign("info",$info);
            return $this->fetch();
        }
    }

    /**
     * 认证--收款
     * @return [type] [description]
     */
    public function realpay()
    {
        $realbankmodel = new realbankModel();
        $realalipaymodel = new realalipayModel();
        $id = $this->request->has("id")?$this->request->param("id",0,'intval'):0;
        if ($this->request->isPost()) {
            $post = $this->request->param();
            if (empty($post['ali_name']) and empty($post['ali_alinum']) and empty($post['bank_name']) and empty($post['bank_bank']) and empty($post['bank_bank_card'])) {
                return $this->error("认证失败");
            }
            if (!empty($post['ali_name']) and !empty($post['ali_alinum'])) {
                $data['users_id'] = $id;
                $data['name'] = $post['ali_name'];
                $data['alinum'] = $post['ali_alinum'];
                $data['create_time'] = time();
                if (false == $realalipaymodel->where("users_id",$id)->find()) {
                    $ali = $realalipaymodel->allowField(true)->save($data);
                } else {
                    $ali = $realalipaymodel->allowField(true)->save($data,['users_id'=>$id]);
                }
                if (false == $ali) {
                    return $this->error("认证失败");
                }
            }
            if (!empty($post['bank_name']) and !empty($post['bank_bank']) and !empty($post['bank_bank_card'])) {

                $validate = new \think\Validate([
                    ['bank_bank_card', 'max:19|min:16', '银行卡号码最多19位|银行卡号码最少16位'],
                ]);
                
                if (!$validate->check($post)) {
                    $this->error('认证失败：' . $validate->getError());
                }
                $date['users_id'] = $id;
                $date['name'] = $post['bank_name'];
                $date['bank'] = $post['bank_bank'];
                $date['bank_card'] = $post['bank_bank_card'];
                $date['create_time'] = time();
                if (false == $realbankmodel->where("users_id",$id)->find()) {
                    $bank = $realbankmodel->allowField(true)->save($date);
                } else {
                    $bank = $realbankmodel->allowField(true)->save($date,['users_id'=>$id]);
                }
                
                if (false == $bank) {
                    return $this->error("认证失败");
                }
            }
            return $this->success("认证成功");
            
                
        } else {
            $this->assign("id",$id);
            $info['ali'] = db("real_alipay")->where("users_id",$id)->find();
            $info['bank'] = db("real_bank")->where("users_id",$id)->find();
            $this->assign("info",$info);
            return $this->fetch();
        }
    }

    /**
     * 认证--实名
     * @return [type] [description]
     */
    public function realidcard()
    {
        $model = new realidcardModel();
        $id = $this->request->has("id")?$this->request->param("id",0,'intval'):0;
        if ($this->request->isPost()) {
            $post = $this->request->param();
            $post['users_id'] = $post['id'];
            $post['create_time'] = time();
            $post['mode'] = "客服认证";
            $validate = new \think\Validate([
                ['idcard', 'require|max:18|min:16', '请输入身份证号码|身份证号码最多18位|身份证号码最少16位'],
            ]);
            
            if (!$validate->check($post)) {
                $this->error('认证失败：' . $validate->getError());
            }
            if (false == $model->allowField(true)->save($post)) {
                return $this->error("认证失败");
            } else {
                return $this->success("认证成功",'admin/users/index');
            }
        } else {
            $this->assign("id",$id);
            $info = db("real_idcard")->where("users_id",$id)->find();
            $this->assign("info",$info);
            return $this->fetch();
        }
    } 

    /**
     * 根据手机号获取推荐人姓名
     * @return [type] [description]
     */
    public function getname()
    {
        $phone = $this->request->param("phone");
        return db("real_idcard")->alias("ri")->join("tplay_users u","ri.users_id = u.id")->field(["u.recommend_code",'ri.real_name'])->where("u.phone",$phone)->find();
    }

}
