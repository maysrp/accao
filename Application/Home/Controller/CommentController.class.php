<?php
namespace Home\Controller;
use Think\Controller;
class CommentController extends Controller {
	public $session;
	public function __construct(){
		parent::__construct();
		$this->session=A('Session')->index();
	}
	public function add(){
		$info['pid']=I('post.pid');
		$info['comment']=$_POST['comment'];
		$info['ccid']=I('post.ccid');
		$info['name']=$this->session['name'];
		$info['uid']=$this->session['uid'];
		$info['relou']=I('post.relou');
		if($this->session['uid']){
			$re=D('Home/Comment')->add_comment($info);
			$re['con']=D('Home/Comment')->cid($re['con']);
		}else{
			$re['status']=false;
			$re['con']="请先登入";
		}
		$this->ajaxReturn($re);//返回评论//返回是否评论成功
	}
	public function show(){
		$pid=I('get.pid');
		$page=I('get.page')?I('get.page'):0;//评论页[25]
		$all=D('Home/Comment')->pid($pid);
		$count=count($all);
		$ba=array_slice($all, 25*($page-1),25);
		if($ba){
			$re['status']=true;
			$re['con']['comment']=$ba;
			$re['con']['count']=$count;
			$re['con']['page']=$page;
		}else{
			$re['status']=false;
			$re['con']='已经加载完成';
		}
		$this->ajaxReturn($re);//返回评论
	}



}