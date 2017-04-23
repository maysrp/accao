<?php
	namespace Home\Model;
	use Think\Model;
	class CoolModel extends Model{
		function is_cool($pid,$uid){
			$where['pid']=$pid;
			$where['uid']=$uid;
			return $this->where($where)->select();
		}	
		function set_cool($pid,$uid,$cool){
			if($this->is_cool($pid,$uid)){
				$re['status']=false;
				$re['con']="你已经评价";
			}else{
				$add['uid']=$uid;
				$add['pid']=$pid;
				$add['cool']=$cool;
				$add['time']=time();
				$this->add($add);

				$re['status']=true;
			}
			return $re;
		}
		function cool($pid){
			$where['pid']=$pid;
			$all=$this->where($where)->select();
			$where['cool']=1;
			$true=$this->where($where)->select();
			$where['cool']=0;
			$false=$this->where($where)->select();
			$ba['t']=$true;
			$ba['f']=$false;
			$ba['a']=$all;
			return $ba;// t/f/a
		}
	}