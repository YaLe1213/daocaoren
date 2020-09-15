<?php

/**
 * 管理员密码加密方式
 * @param $password  密码
 * @param $password_code 密码额外加密字符
 * @return string
 */
function password($password, $password_code='lshi4AsSUrUOwWV')
{
    return md5(md5($password) . md5($password_code));
}

/**
 * 多维数组转为二维
 * @param  [type] $tree     [description]
 * @param  string $children [description]
 * @return [type]           [description]
 */
function arrays($tree, $children='users')
{
  	$imparr = array();
 	foreach($tree as $w) {
    	if(isset($w[$children])) {
      		$t = $w[$children];
      		unset($w[$children]);
      		$imparr[] = $w;
      		if(is_array($t)) $imparr = array_merge($imparr, arrays($t, $children));
    	} else {
      		$imparr[] = $w;
    	}
  	}
  	return $imparr;
}
//去除二维数组重复值,默认重复保留前面的值
/*
  *array 二维数组
  *keyid 需要判断是否重复的项目
  *desc 为true时保留后面的
*/
function repeatAR($array,$keyid="id",$desc=false)
{
    $array = array_values($array);
    //倒叙排列数
    if($desc)
    {
        $array = array_rsort($array,true);
    }
     
    //提取需要判断的项目变成一维数组
    $a = array_tq($array,$keyid);
     
    //去除一维数组重复值
    $a = array_unique($a);
    //提取二维数组项目值
    foreach($array[0] AS $key=>$value)
    {
        $akey[] = $key;
    }
    //重新拼接二维数组
    foreach($akey AS $key=>$value)
    {
        $b = array_tq($array,$value);
        foreach($a AS $key2=>$value2)
        {
            $c[$key2][$value] = $b[$key2];
        }
    }
     
    if($desc)
    {
        $c = array_rsort($c,true);
    }
    return $c;
}
//提取二维数组项目
function array_tq($array,$aval="")
{
    foreach($array AS $key=>$value)
    {
        $result[] = $value[$aval];
    }
    return $result;
}