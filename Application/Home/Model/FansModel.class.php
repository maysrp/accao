<?php
namespace Home\Model;
use Think\Model;
class FansModel extends Model {
	function add_fans($uid,$fans){
		$ba=$this->check_fans($uid,$fans);
		if($ba){
			$re['status']=false;
			$re['con']="你已经关注";
		}else{
			$add['uid']=$uid;
			$add['fans']=$fans;
			$add['time']=time();
			$this->add($add);
			$re['status']=true;
			$re['con']="关注成功";
		}
		return $re;
	}
	function del_fans($uid,$fans){
		$ba=$this->check_fans($uid,$fans);
		if($ba){
			$where['uid']=$uid;
			$where['fans']=$fans;
			$this->where($where)->delete();
			$re['status']=true;
			$re['con']="已取消关注";
		}else{
			$re['status']=false;
			$re['con']="你还未关注";
		}
		return $re;
	}
	function check_fans($uid,$fans){
		$where['uid']=$uid;
		$where['fans']=$fans;
		$ba=$this->where($where)->select();
		if($ba){
			return $ba[0];
		}else{
			return false;
		}
	}
	function toggle($uid,$fans){
		$ba=$this->check_fans($uid,$fans);
		if($ba){
			$re=$this->del_fans($uid,$fans);//已经关注则取消
		}else{
			$re=$this->add_fans($uid,$fans);
		}
		return $re;
	}
	function uid($uid){//返回粉丝
		$where['uid']=$uid;
		return $this->where($where)->select();
	}
	function fans($fans){//返回自己关注的人
		$where['fans']=$fans;
		return $this->where($where)->select();
	}







}