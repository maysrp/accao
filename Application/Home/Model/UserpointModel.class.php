<?php
namespace Home\Model;
use Think\Model;
class UserpointModel extends Model {
	function qian($uid,$lian){
		$this->change_point($uid,7);
	}
	function danmu($uid,$type=1){
		if($type){
			$this->change_point($uid,1);
		}else{
			$this->change_point($uid,2);
		}

	}
	function post($uid,$type=1){
		if($type){
			$this->change_point($uid,5);//审核
		}else{
			$this->change_point($uid,6);
		}

	}
	function comment($uid,$type=1){
		if($type){
			$this->change_point($uid,3);//评论
		}else{
			$this->change_point($uid,4);
		}

	}
	function admin($uid,$type=1){//管理员操作+1-1
		if($type){
			$this->change_point($uid,3);
		}else{
			$this->change_point($uid,4);
		}
	}
	function admin_change($uid,$point){
		$now=$this->uid_point($uid);//防止不存在
		$save['uid']=$uid;
		$save['point']=(int)$point;
		$history=array("rid"=>"0","time"=>time(),"by"=>"管理员直接操作");
		$save['history']=json_encode($history);
		return $this->save($save);
	}
	function uid_point($uid){//返回分数
			$where['uid']=$uid;
			$ba=$this->where($where)->select();
			if($ba){
				return $ba[0];
			}else{
				$add['uid']=$uid;
				$add['time']=time();
				$poi=$this->add($add);
				return $this->find($poi);
			}
		}
		function change_point($uid,$rid,$by="system"){//积分处理
			$rule=M('Pointrule')->find($rid);
			if($rule){
				$ba=$this->uid_point($uid);
				if($rule['type']){//1+
					$ba['uid']=$uid;
					$history=json_decode($ba['history'],true);
					$history[]=array("rid"=>$rid,"time"=>time(),"by"=>$by);
					$ba['history']=json_encode($history);
					$ba['point']=$ba['point']+$rule['point'];
					$ba['time']=time();
					//var_dump($ba);
					$max=D('Home/Pointmax')->uid_add($uid,$rule['point']);
					if($max['status']){
						$this->save($ba);
					//添加历史
						D('Home/Pointhistory')->add_history($ba['history']);
						$re['status']=true;
						$re['con']="操作成功！";
					}else{
						$re=$max;
					}
				}else{//0-
					$ba['uid']=$uid;
					$history=json_decode($ba['history'],true);
					$history[]=array("rid"=>$rid,"time"=>time(),"by"=>$by);
					$ba['history']=json_encode($history);
					$ba['point']=$ba['point']-$rule['point'];
					$ba['time']=time();
					D('Home/Pointhistory')->add_history($ba['history']);
					$this->save($ba);
					$re['status']=true;
					$re['con']="操作成功！";
				}
			}else{
				$re['status']=false;
				$re['con']="没有该规则!";
			}
			return $re;
		}






}