<?php
namespace Home\Model;
use Think\Model;
class CommentModel extends Model {
	function all(){
		$where['del']=0;
		return $this->where($where)->order('time desc')->select();
	}
	function cid($cid){
		$where['cid']=$cid;
		$where['del']=0;
		$ba=$this->where($where)->select();
		return $ba[0];
	}
	function uid($uid){//用户所有评论
		$where['uid']=$uid;
		$where['del']=0;
		return $this->where($where)->order('time desc')->select();
	}
	function pid($pid){//帖子下所有评论
		$where['pid']=$pid;
		$where['del']=0;
		return $this->where($where)->order('time desc')->select();
	}
	function add_comment($info){
		$pid=$info['pid'];
		$cid=$info['ccid'];
		if(!$this->cid($cid)&&$cid){
			$re['status']=false;
			$re['con']="无该回复";
			return $re;
		}
		if(!D('Home/Post')->pid($pid)){
			$re['status']=false;
			$re['con']="无该贴";
			return $re;
		}
		$add['ccid']=$info['ccid'];
		$add['uid']=$info['uid'];
		$add['pid']=$info['pid'];
		$add['name']=$info['name'];
		$add['comment']=$info['comment'];
		$add['time']=time();
		$add['lou']=$this->lou($info['pid']);
		$add['relou']=$info['relou'];
		$cid=$this->add($add);
		if($cid){
			D('Home/Userpoint')->comment($add['uid'],1);
			$re['status']=true;
			$re['con']=$cid;//返回楼层数
			if($info['ccid']>0){
				D('Home/Message')->comment($add['ccid'],$add['uid'],$add['lou']);
			}else{
				D('Home/Message')->post($add['pid'],$add['uid']);
			}
		}else{
			$re['status']=false;
			$re['con']="未知错误";
		}
		return $re;

	}	
	function lou($pid){
		$where['pid']=$pid;
		$ba=$this->where($where)->count();
		return $ba+1;
	}
	function del($cid){//管理员删除【可以放到admin下】
		$ba=$this->cid($cid);
		if($ba){
			$save['cid']=$cid;
			$save['del']=1;
			$ba=$this->save($save);
			if($ba){
				$re['status']=true;
				$re['con']="删除成功！";
			}else{
				$re['status']=false;
				$re['con']="未知错误！";
			}
		}else{
			$re['status']=false;
			$re['con']="无该回复或已经删除该回复！";
		}
		return $re;
	}





}