<?php
	namespace Home\Model;
	use Think\Model;
	class RecomModel extends Model{
		function recom($type="week",$num=10){
			$time=time();
			switch ($type) {
				case 'week':
					$where['time']=array('gt',$time-86400*7);
					break;
				case 'month':
					$where['time']=array('gt',$time-86400*30);
					break;
				default:
					$where['time']=array('gt',$time-86400*300);
					break;
			}
			return $this->where($where)->order('time desc')->limit($num)->select();
		}
		function is_recom($pid){
			$where['pid']=$pid;
			return $this->where($where)->select();
		}
		function recom_add($pid,$uid){
			$add['pid']=$pid;
			$add['uid']=$uid;
			
			$add['time']=time();
			return $this->add($add);
			
		}
		function recom_del($pid){
			$where['pid']=$pid;
			return $this->where($where)->delete();
		}
		function recom_toggle($pid,$uid){
			if($this->is_recom($pid)){
				$re['status']=$this->recom_del($pid);
				$re['con']="删除";

			}else{
				$re['status']=$this->recom_add($pid,$uid);
				$re['con']="添加";
			}
			return $re;
		}
	}
