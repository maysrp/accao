<?php
namespace Admin\Model;
use Think\Model;
class GroupModel extends Model {
	public function level($uid){
		$where['uid']=$uid;
		$ba=$this->where($where)->select();
		if($ba){
			$re=$ba[0]['level'];
			session('admin.level',$re);
		}else{
			$re=false;//非管理员
		}
		return $re;
	}
	public function change_level($uid,$level){
		$ba=$this->level($uid);
		if($ba){
			$save['uid']=$uid;
			$save['level']=$level;
			$this->save($save);
		}else{
			$this->add_level($uid,$level);
		}
	}
	public function add_level($uid,$level=1){//添加管理等级
		$add['uid']=$uid;
		$add['level']=$level;
		$this->add($add);
	}
	public function uid($uid){
		$where['uid']=$uid;
		$ba=$this->where($where)->select();
		if($ba){
			return $ba[0];
		}else{
			return false;
		}
	}
	public function uid_info($uid,$ip){//每次管理员登入更新登入时间以及IP
		$info['time']=time();
		$info['ip']=$ip;
		$ba=$this->uid($uid);
		if($ba){
			$sa=json_decode($ba['info'],true);
			$sa[]=$info;
			$ba['info']=json_encode($sa);
			$this->save($ba);
		}

	}
	






}