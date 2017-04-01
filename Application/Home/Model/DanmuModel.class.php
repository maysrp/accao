<?php
namespace Home\Model;
use Think\Model;
class DanmuModel extends Model {
	function uid($uid){
		$where['uid']=$uid;
		return $this->where($where)->order('time desc')->select();
	}
	function pid($pid){
		$where['pid']=$pid;
		return $this->where($where)->order('time desc')->select();
	}


}