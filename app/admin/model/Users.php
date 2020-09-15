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


namespace app\admin\model;

use \think\Model;
class Users extends Model
{
	public function userslevel()
    {
        //关联会员级别表
        return $this->belongsTo('UsersLevel');
    }

    public function usersgrade()
    {
        //关联会员等级表
        return $this->belongsTo('UsersGrade');
    }

    public function realidcard()
    {
        //关联实名--认证表
        return $this->hasOne('RealIdcard',"id");
    }

    public function realalipay()
    {
        //关联支付宝--认证表
        return $this->belongsTo('RealAlipay');
    }

    public function realbank()
    {
        //关联银行--认证表
        return $this->belongsTo('RealBank');
    }
}
