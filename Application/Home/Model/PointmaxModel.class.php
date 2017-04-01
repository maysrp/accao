<?php
namespace Home\Model;
use Think\Model;
class PointmaxModel extends Model {
//默认100
	function uid($uid){
		$ba=$this->find($uid);
		if($ba){
			if($ba['day']!=date("Ymd")){
				$add['uid']=$uid;
				$add['day']=date('Ymd');
				$add['point']=0;
				$this->save($add);
			return 0;
			}else{
				return $ba['point'];
			}
		}else{
			$add['uid']=$uid;
			$add['day']=date('Ymd');
			$add['point']=0;
			$this->add($add);
			return 0;
		}
	}
	function uid_add($uid,$point){//系统触发 管理员不受影响
		$ba=$this->uid($uid);
		if($ba>100){
			$re['status']=false;
			$re['con']="每日最多添加100积分";
		}else{
			$save['point']=$ba+$point;
			$save['uid']=$uid;
			$this->save($save);
			$re['status']=true;
			$re['con']="今日已经获得".$save['point'];
		}
		return $re;
	}





}