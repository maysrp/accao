<?php
namespace Home\Model;
use Think\Model;
class MessageModel extends Model {
	function my($uid){
		$where['uid']=$uid;
		return $this->where($where)->order('time desc')->select();
	}
	function unmy($uid){
		$where['uid']=$uid;
		$where['view']=0;
		return $this->where($where)->order('time desc')->select();
	}
	function send($uid,$info){
		$add['uid']=$uid;
		$add['info']=$info;
		$add['time']=time();
		$this->add($add);

	}
	function post($pid,$suid){
		$ba=D('Home/Post')->post($pid);
		$info=$ba['con'];
		$uid=$info['uid'];
		$nr=uid($suid)."评论了你的帖子<a href=\"/Home/Index/post/pid/".$pid." \" target=\"_blank\">《".$info['title']."》!</a>";
		return $this->send($uid,$nr);

	}
	function comment($cid,$suid,$lou){
		$info=D('Home/Comment')->cid($cid);
		$uid=$info['uid'];
		$ba=D('Post')->post($info['pid']);
		$post=$ba['con'];
		$nr=uid($suid)."回复了你在帖子<a href=\"/Home/Index/post/pid/".$post['pid']."\" target=\"_blank\">《".$post['title']."》的评论，位置".$lou."楼!</a>";
		return $this->send($uid,$nr);
	}
	function view($uid){
		$where['uid']=$uid;
		$this->where($where)->setField('view',1);
	}




}