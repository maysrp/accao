<?php
namespace Home\Model;
use Think\Model;
class PostModel extends Model {
	function post($pid){
		$where['pid']=$pid;
		$where['is_show']=1;
		$where['del']=0;
		$ba=$this->where($where)->select();
		if($ba){
			$re['status']=true;
			$re['con']=$ba[0];
			$this->view($ba[0]['pid']);//阅读+1
		}else{
			$re['status']=false;
			$re['con']="无该信息！";
		}
		return $re;
	}
	function video($num=10){
		$where['is_show']=1;
		$where['is_video']=1;
		$where['image']=array('neq','0');
	 $n=$this->where($where)->order('time desc')->limit($num)->select();
	 return $n;

	}
	function novideo($num=10){
		$where['is_show']=1;
		$where['is_video']=0;
		$where['image']=array('neq','0');
		$where['del']=0;
		return $this->where($where)->order('time desc')->limit($num)->select();

	}
	function post_create($info){
		$add['image']=isset($info['image'])?$info['image']:0;
		$add['uid']=$info['uid'];
		$add['title']=$info['title'];
		$add['post']=$info['post'];
		$add['time']=time();
		$add['is_video']=$info['is_video'];
		$add['video_url']=$info['video_url'];
		$add['ip']=$info['ip'];
		$add['is_show']=$info['is_show'];
		$pid=$this->add($add);
		D('Home/Tag')->tag_done($info['tag'],$pid,$info['uid']);
		return $pid;
	}
	function post_edit($info){
		$save['image']=isset($info['image'])?$info['image']:0;
		$save['pid']=$info['pid'];
		$save['title']=$info['title'];
		$save['post']=$info['post'];
		$save['is_show']=$info['is_show'];
		$save['is_video']=$info['is_video'];
		$save['video_url']=$info['video_url'];
		$save['edit_time']=time();
		D('Home/Tag')->tag_change($info['tag'],$info['pid'],$info['uid']);
		return $this->save($save);
	}
	function post_show($pid){
		$info=$this->pid($pid);
		if($info){
			$info['is_show']=1;
			$this->save($info);
		}
	}
	function post_hide($pid){
		$info=$this->pid($pid);
		if($info){
			$info['is_show']=0;
			$this->save($info);
		}
	}
	function post_del($pid){
		$info=$this->pid($pid);
		if($info){
			$info['del']=1;
			$this->save($info);
		}
	}
	function post_undel($pid){
		$info=$this->pid($pid);
		if($info){
			$info['del']=0;
			$this->save($info);
		}
	}
	function pid($pid){
		$where['del']=0;
		$where['pid']=$pid;
		$ba=$this->where($where)->select();
		return $ba[0];
	}
	function view($pid){
		$where['pid']=$pid;
		$this->where($where)->setInc('view',1);
	}
	function my_post($info){
		$where['pid']=$info['pid'];
		$where['uid']=$info['uid'];
		$be=$this->where($where)->order('time desc')->select();
		if($be){
			$re['status']=true;
			$re['con']=$be['0'];
		}else{
			$re['status']=false;
			$re['con']="无权限编辑该文章！";
		}
		return $re;
	}
	function uid($uid){//用户自己或者管理员查看，显示不能展现的帖子
		$where['uid']=$uid;
		$where['del']=0;
		return $this->where($where)->order('time desc')->select();
	}
	function my($uid){//外部展现
		$where['is_show']=1;
		$where['uid']=$uid;
		$where['del']=0;
		return $this->where($where)->order('time desc')->select();	
	}
	function hot($type="week",$num=5){//热门帖子
		$time=time();
		switch ($type) {
			case 'day':
				$where['time']=array('gt',$time-86400);
				break;
			case 'week':
				$where['time']=array('gt',$time-7*86400);
				break;
			case 'month':
				$where['time']=array('gt',$time-30*86400);
				break;
			default:
				break;
		}
		$where['is_show']=1;
		$where['del']=0;
		$ba=$this->where($where)->order('view desc')->limit($num)->select();
		return $ba;
	}
	function nim($type="week",$num=5){//新贴
		$time=time();
		switch ($type) {
			case 'day':
				$where['time']=array('gt',$time-86400);
				break;
			case 'week':
				$where['time']=array('gt',$time-7*86400);
				break;
			case 'month':
				$where['time']=array('gt',$time-30*86400);
				break;
			default:
				break;
		}
		$where['image']=array('neq',"0");
		$where['is_show']=1;
		$where['del']=0;
		$ba=$this->where($where)->order('time desc')->limit($num)->select();
		return $ba;
	}


}