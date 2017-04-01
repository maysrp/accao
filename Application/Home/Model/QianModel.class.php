<?php
namespace Home\Model;
use Think\Model;
class QianModel extends Model {
	function qiandao($uid){//Model如果今天没有钱到则签到
			if($this->jugg_qian($uid)){
				$re['status']=false;
				$re['con']="已经签到";
			}else{
				$add['uid']=$uid;
				$add['time']=time();
				$add['day']=date("Ymd");
				$lian=$this->yesterday($uid);
				$add['lian']=$lian+1;
				$this->add($add);
				$re['status']=true;
				$re['con']="签到成功,连续签到:".$add['lian']."天";
			}
			return $re;
		}
		function jugg_qian($uid){
			$where['uid']=$uid;
			$where['day']=date("Ymd");
			$ba=$this->where($where)->select();
			if($ba){
				return true;//已经签
			}else{
				return false;
			}
		}
		function isqian($uid){//如果已经签到则返回连续签到日期
			$where['uid']=$uid;
			$where['day']=date("Ymd");
			$ba=$this->where($where)->select();
			if($ba){
				return $ba[0]['lian'];//已经签天数
			}else{
				return false;
			}
		}
		function yesterday($uid){//查看昨日是否签到
			$where['day']=date("Ymd",strtotime("-1 day"));
			$where['uid']=$uid;
			$ba=$this->where($where)->select();
			if($ba){
				return $ba[0]['lian'];//昨天已经签,返回签到数
			}else{
				return false;
			}
		}


}