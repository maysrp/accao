<?php
namespace Home\Model;
use Think\Model;
class SaveModel extends Model {
	public function uid($uid){
		$where['uid']=$uid;
		return $this->where($where)->order('time desc')->select();
	}
	public function pid($pid){
		$where['pid']=$pid;
		return $this->where($where)->order('time desc')->select();
	}
	public function pid_uid($pid,$uid){
		$where['uid']=$uid;
		$where['pid']=$pid;
		return $this->where($where)->order('time desc')->select();
	}
	public function uid_pid($uid,$pid){
		$where['uid']=$uid;
		$where['pid']=$pid;
		return $this->where($where)->order('time desc')->select();
	}
	public function add_save($uid,$pid){
		if($this->uid_pid($uid,$pid)){//已经添加
			$re['status']=false;
			$re['con']="已经收藏";
		}else{
			$add['uid']=$uid;
			$add['pid']=$pid;
			$add['time']=time();
			$this->add($add);
			$re['status']=true;
			$re['con']="收藏成功";
		}
		return $re;
	}
	public function del_save($uid,$pid){
		$ba=$this->uid_pid($uid,$pid);
		if($ba){
			$re['status']=$this->delete($ba[0]['sid']);
			$re['con']="删除成功";
		}else{
			$re['status']=false;
			$re['con']="还没有收藏";
		}
		return $re;
	}
	public function click($uid,$pid){
		$ba=$this->uid_pid($uid,$pid);
		if($ba){
			$re=$this->del_save($uid,$pid);
		}else{
			$re=$this->add_save($uid,$pid);
		}
		return $re;

	}

}