<?php
namespace Home\Controller;
use Think\Controller;
class UserController extends Controller {
	private $session;
	public function __construct(){
		parent::__construct();
		$this->session=A('Session')->index();
	}
	public function index(){//用户信息
		$this->login_false();
		$info=$this->my_post();
		$cn=$this->c_avatar();
		$point=D('Home/Userpoint')->uid_point($this->session['uid']);
		$qian=D('Home/Qian')->isqian($this->session['uid']);
		$today=D('Home/pointmax')->uid($this->session['uid']);
		$tz=D('Home/Message')->unmy($this->session['uid']);
		$message=D('Home/Uc')->unmessage_count($this->session['uid']);


		$count=count($info);
		$Page= new \Think\Page($count,25);
		//$Page->setConfig('header',"条弹幕");
        if($_GET['p']<1){
             $_GET['p']=1;
        }else{
               $_GET['p']=(int)$_GET['p'];//
        }
        $list=array_slice($info, 25*($_GET['p']-1),25);
        $show=$Page->show();
        $this->assign('page',$show);
		$this->assign("tz",count($tz));
		$this->assign("message",$message);
		$this->assign("today",$today);
		$this->assign("qian",$qian);//签到非false 返回连续签到
		$this->assign("point",$point['point']);
		$this->assign("post",$list);
		$this->assign("cn",$cn);
		$this->display();
	}
	public function tz(){
		$this->login_false();
		$info=D('Home/Message')->my($this->session['uid']);

		D('Home/Message')->view($this->session['uid']);

		$count=count($info);
		$Page= new \Think\Page($count,25);
		//$Page->setConfig('header',"条弹幕");
        if($_GET['p']<1){
             $_GET['p']=1;
        }else{
               $_GET['p']=(int)$_GET['p'];//
        }
        $list=array_slice($info, 25*($_GET['p']-1),25);
        $show=$Page->show();
        $this->assign('page',$show);
		$this->assign("info",$list);
		$this->display();
	}
	public function pm(){
		$suid=$this->session['uid'];
		if($suid){
			$uid=I('post.uid');
			$pm=I('post.pm');
			$su="私信";
			$re=D('Home/Uc')->message($suid,$uid,$su,$pm);
		}else{
			$re['status']=false;
			$re['con']="未登入";
		}
		$this->ajaxReturn($re);
	}
	public function message(){
		$this->login_false();
		$message=D('Home/Uc')->user_message($this->session['uid']);
		echo $message;
	}
	public function qian(){//签到
		$this->login_false();
		$uid=$this->session['uid'];
		$re=D('Home/Qian')->qiandao($uid);
		D('Home/Userpoint')->qian($uid);
		$this->ajaxReturn($re);
	}
	public function login(){
		$this->login_true();
		$this->display('User:login');
	}
	public function slogin(){
		$password=I('post.password');
		$username=I('post.username');
		if(!($username&&$password)){
		//	$this->display('User:slogin');
			return;
		}
		for ($i=0; $i <3 ; $i++) { 
			$info['isuid']=$i;
			$info['username']=$username;
			$info['password']=$password;
			$re=D('Home/Uc')->user_login($info);
			if($re['status']){
				//var_dump($re);
				$this->success("登入中...",U('Home/User/index'));
				break;
			}else{
				$this->error("登入失败：".$re['con']);
			}
		}
		
	}
	public function logout(){
		session('user',null);
		$this->success("退出中",U('Home/User/login'));
	}
	public function login_jugg(){//AJAX登入
		$password=I('post.password');
		$username=I('post.username');
		for ($i=0; $i <3 ; $i++) { 
			$info['isuid']=$i;
			$info['username']=$username;
			$info['password']=$password;
			$re=D('Home/Uc')->user_login($info);
			if($re['status']){
				break;
			}
		}
		$this->ajaxReturn($re);
	}
	public function join(){//注册
		$this->login_true();
		$info['password']=I('post.password');
		$info['password_2']=I('post.password_2');
		if(!($info['password']&&$info['password_2'])){
			$this->display('User:join');
			return;
		}
		if($info['password']!=$info['password_2']){
			$re['status']=false;
			$re['con']="两次的密码不同！";
		}else{
			$info['username']=I('post.username');
			$info['email']=I('post.email');
			$re=D('Home/Uc')->user_add($info);
		}
		//$this->ajaxReturn($re);
		if($re['status']){
			$this->success("注册成功",U('Home/User/index'));//可以修改为直接跳转
		}else{
			//var_dump($info);
			$this->error($re['con']);
		}
	}
	public function is_email(){
		$email=I('get.email');
		$re=D('Home/Uc')->email($email);
		$this->ajaxReturn($re);
	}
	public function is_name(){
		$name=I('get.name');
		$re=D('Home/Uc')->name($name);
		$this->ajaxReturn($re);
	}
	public function c_avatar(){//返回修改头像代码
		$this->login_false();
		$uid=$this->session['uid'];
		return  D('Home/Uc')->avatar($uid);//该为HTML代码
	}
	public function avatar(){//需要更具具体的修改[目录不同]
		$uid=I("get.uid");
		$type=I("get.type")?I("get.type"):"middle";
		header("Location:/uc/avatar.php?uid=".$uid."&type=real&size=".$type);
		//echo  "<img src=\"/ucenter/uc/avatar.php?uid=".$uid."&type=real&size=".$type."\"/>";
	}
	public function save(){
		$this->login_false();
		$info=A('Home/Save')->uid($this->session['uid']);
		$count=count($info);
		$Page= new \Think\Page($count,25);
		//$Page->setConfig('header',"条弹幕");
        if($_GET['p']<1){
             $_GET['p']=1;
        }else{
               $_GET['p']=(int)$_GET['p'];//
        }
        $list=array_slice($info, 25*($_GET['p']-1),25);
        $show=$Page->show();
        $this->assign('page',$show);
		$this->assign("info",$list);
		$this->display();
	}
	private function my_post(){
		$where['uid']=$this->session['uid'];
		$where['del']=0;
		$ba=M('Post')->where($where)->order('time desc')->select();
		return $ba;
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