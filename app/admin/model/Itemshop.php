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
class Itemshop extends Model
{
	public function getDescAttr($value)
	{
		$status = [1=>'喂养后截取产量倒计时自动结束',2=>'偷取所有可偷好友列表的产量',3=>'保护牧场24小时内不被好友偷取'];
        return $status[$value];
	}
}
