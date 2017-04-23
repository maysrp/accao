<?php
namespace Home\Controller;
use Think\Controller;
class PostController extends Controller {
	private $session;
	public function __construct(){
		parent::__construct();
		$this->session=session('user');
	}
	public function create_post(){//用户发布文章
		$this->login_false();
		//需要添加其他信息
		$info['title']=I('post.title');
		$info['post']=$_POST['post'];
		if(!($info['post']&&$info['title'])){
			$this->display('create_post');
			return;
		}
		if(!$info['post']){
			$this->error("必须使用标题");
			return;
		}
		if(!strlen($info['post'])>3){
			$this->error("文章必须大于3个字节！");
			return;
		}
		$info['is_video']=I('post.video_url')?1:0;
		$info['image']=I('post.image')?I('post.image'):0;
		$info['video_url']=I('post.video_url')?I('post.video_url'):0;
		$info['uid']=session('user.uid');
		$info['ip']=I('server.REMOTE_ADDR');
		$info['is_show']=0;
		$info['tag']=I('post.tag');
		D('Home/Post')->post_create($info);//跳转加入
		$this->success("发布成功，等待管理员审核后才能查看！",U("Home/User"));
	}
	public function edit_post(){//用户编辑自己的文章
		$this->login_false();
		$info['pid']=I('get.pid');
		$info['uid']=$this->session['uid'];
		$re=D('Home/Post')->my_post($info);
		if(!$re['status']){
			$this->error($re['con']);
			return; 
		}
		$info['title']=I('post.title');
		$info['post']=$_POST['post'];
		if(!($info['post']&&$info['title'])){
			$tag=D('Home/Tag')->pid($info['pid']);
			$re['con']['tag']=implode(' ',$tag);
			$this->assign("info",$re['con']);//传出修改
			$this->display('edit_post');
			return;
		}
		if(!$info['post']){
			$this->error("必须使用标题");
			return;
		}
		if(!strlen($info['post'])>3){
			$this->error("文章必须大于3个字节！");
			return;
		}
		$info['pid']=$re['con']['pid'];
		$info['uid']=session('user.uid');
		$info['image']=I('post.image')?I('post.image'):0;
		$info['is_video']=I('post.video_url')?1:0;
		$info['video_url']=I('post.video_url')?I('post.video_url'):0;
		$info['ip']=I('server.REMOTE_ADDR');
		$info['is_show']=0;
		$info['tag']=I('post.tag');
		D('Home/Post')->post_edit($info);//跳转加入
		D('Home/Userpoint')->post($this->session['uid'],0);//编辑文章减分
		$this->success("修改成功，等待管理员审核后才能查看！",U("Home/User"));
	}
	private function is_login(){
		if(isset($this->session['uid'])){
			return true;
		}else{
			return false;
		}
	}
	private function login_true(){//在登入情况下触发
		$re=$this->is_login();
		if($re){
			$this->error("您已登入",U('Home/User/index'));
		}

	}
	private function login_false(){//未登入情况下执行
		$re=$this->is_login();
		if(!$re){
			$this->error("请先登入",U('Home/User/login'));
			return;
		}
	}



}