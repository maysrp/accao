<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends Controller {
	public $session;
	function __construct(){
		parent::__construct();
		$this->session['admin']=I('session.admin');
	}
	public function index(){
		$this->login_false();
		$this->display();

	}
	public function mypost(){
		$where['uid']=session('user.uid');
		$where['del']=0;
		$info=M('Post')->where($where)->order('time desc')->select();

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
		$this->assign("post",$list);
		$this->display();

	}
	public function post(){//创建
		$this->login_false();
		$info['post']=$_POST['post'];
		$info['title']=I('title');
		if(!($info['post']&&$info['title'])){
			$this->display();
			return ;
		}
		if(!$info['post']){
			$this->error("必须使用标题");
			return;
		}
		$info['is_show']=1;
		$info['image']=I('post.image')?I('post.image'):0;
		$info['is_video']=I('post.video_url')?1:0;
		$info['video_url']=I('post.video_url')?I('post.video_url'):0;
		$info['uid']=session('user.uid');
		$info['ip']=I('server.REMOTE_ADDR');
		$id=D('Home/Post')->post_create($info);
		if($id){
			D('Home/Userpoint')->post($info['uid'],1);//加分
			$this->success("发布成功！",U('Admin/Index/mypost'));
		}
	}
	public function view(){
		$pid=I('get.pid');
		$ba=M('Post')->find($pid);
		if($ba){
			$this->assign("post",$ba);
			$this->display();
		}else{
			$this->error("无该帖子信息！");
		}
	}
	public function edit(){//编辑
		$this->login_false();
		$info['uid']=session('user.uid');
		$info['pid']=I('get.pid');
		$re=D('Home/Post')->my_post($info);
		if(!$re['status']){
			$this->error($re['con']);
			return; 
		}
		$info['post']=$_POST['post'];
		$info['title']=I('title');
		if(!($info['post']&&$info['title'])){
			$this->assign("info",$re['con']);//传出修改
			$this->display();
			return ;
		}
		if(!$info['post']){
			$this->error("必须使用标题");
			return;
		}
		$info['is_show']=1;
		$info['is_video']=I('post.video_url')?1:0;
		$info['video_url']=I('post.video_url')?I('post.video_url'):0;
		$info['image']=I('post.image')?I('post.image'):0;
		$info['uid']=session('user.uid');
		$info['ip']=I('server.REMOTE_ADDR');
		$id=D('Home/Post')->post_edit($info);
		if($id){
			$this->success("修改成功！",U('Admin/Index/mypost'));
		}
	}
	public function all_ad(){
		$this->level_3();
		$info=M('Ad')->select();
		$count=count($info);
		$Page= new \Think\Page($count,10);
		//$Page->setConfig('header',"条弹幕");
        if($_GET['p']<1){
             $_GET['p']=1;
        }else{
               $_GET['p']=(int)$_GET['p'];//
        }
        $list=array_slice($info, 10*($_GET['p']-1),10);
        $show=$Page->show();
        $this->assign('page',$show);
		$this->assign("info",$list);
		$this->display();
	}
	public function edit_ad(){
		$this->level_3();
		$info['adid']=I('post.adid');
		$info['station']=I('post.station')?I('post.station'):1;
		$info['html']=$_POST['html'];
		$re=$this->ad_cn($info);
		$this->ajaxReturn($re);
	}
	public function add_ad(){
		$info['time']=time();
		$info['station']=I('post.station')?I('post.station'):1;
		$info['html']=$_POST['html'];
		$re=$this->add_add($info);
		$this->ajaxReturn($re);
	}
	public function del_ad(){
		$this->level_3();
		$adid=I('get.adid');
		$ba=M('Ad')->delete($adid);
		if($ba){
			$re['status']=true;
			$re['con']='操作成功';
		}else{
			$re['status']=false;
			$re['status']="失败";
		}
		$this->ajaxReturn($re);
	}
	public function tag_del(){
		$tid=I('get.tid');
		$ba=D('Home/Tag')->tid_del($tid);
		if($ba){
			$re['status']=true;
		}else{
			$re['status']=false;
		}
		$this->ajaxReturn($re);
	}
	public function all_post(){
		$this->login_false();
		$where['del']=0;
		$info=M('Post')->where($where)->order('time desc')->select();

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
	public function check(){//审批 一次请求就取反 is_show
		$this->level_3();
		$pid=I('get.pid');
		$ref=M('Post')->find($pid);
		if($ref){
			$ref['is_show']=!$ref['is_show'];
			$ba=M('Post')->save($ref);
			if($ba){
				D('Home/Userpoint')->post($ref['uid'],1);//加分
				$re['status']=true;
				$re['con']="操作成功";
			}else{
				$re['con']=false;
				$re['con']="无该信息";
			}
		}else{
			$re['con']=false;
			$re['con']="无该信息";
		}
		$this->ajaxReturn($re);
	}
	public function del(){//删除 level3
		$this->level_3();
		$pid=I('get.pid');
		$ref=M('Post')->find($pid);
		if($ref){
			$ref['del']=1;
			$ba=M('Post')->save($ref);
			if($ba){
				D('Home/Userpoint')->post($ref['uid'],0);//减去
				$re['status']=true;
				$re['con']="操作成功";
			}else{
				$re['con']=false;
				$re['con']="无该信息";
			}
		}else{
			$re['con']=false;
			$re['con']="无该信息";
		}
		$this->ajaxReturn($re);
	}
	public function danmu(){//弹幕列表
		$this->login_false();
		$info=M('Danmu')->order('id desc')->select();
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
	public function danmu_del(){
		$this->login_false();
		$id=I('get.id');
		$ba=M('Danmu')->delete($id);
		if($ba){
			$re['status']=true;
		}else{
			$re['status']=false;
		}
		$this->ajaxReturn($re);
	}
	public function danmu_do(){//弹幕各管理
		$this->level_3();
		$info['fid']=I('get.id');
		$re=D('Admin/Danmu')->delete_info($info);
		$this->ajaxReturn($re);
	}
	public function danmu_fobidden(){//设置弹幕替换词语页面
		$this->login_false();
		$dmf=M('Danmufobidden')->select();
		$this->assign('info',$dmf);
		$this->display();
	}
	public function danmu_fobidden_change(){//添加/删除:弹幕替换词语
		$this->level_3();
		$info['fid']=I('post.fid');
		$type=I('post.type');
		$info['forbidden']=I('post.forbidden');
		$info['changeto']=I('post.changeto')?I('post.changeto'):"***";//若没有设置则默认替换为“***”
		switch ($type) {
			case 'delete':
				$re=D('Admin/Danmufobidden')->delete_info($info);
				break;
			case 'add':
				$re=D('Admin/Danmufobidden')->add_info($info);
				break;
			default:
				$re=D('Admin/Danmufobidden')->change_info($info);
				break;
		}
		$this->ajaxReturn($re);

	}

	public function login(){
		$this->login_true();
		$password=I('post.password');
		$username=I('post.username');
		if(!($username&&$password)){
			$this->display();
			return;
		}
		for ($i=0; $i <3 ; $i++) { 
			$info['isuid']=$i;
			$info['username']=$username;
			$info['password']=$password;
			$re=D('Home/Uc')->user_login($info);
			if($re['status']){
				break;
			}
		}
		if($re['status']){
			$level=D('Admin/Group')->level(session('user.uid'));
			if($level){
				D('Admin/Group')->uid_info(session('user.uid'),I('server.REMOTE_ADDR'));//更新登入信息
				$this->success("Level:".$level."管理员欢迎你登入",U('Admin/Index/index'));

			}else{
				$this->error("你不是管理员！");
			}
		}else{
			$this->error($re['con']);
		}
	}
	public function user(){//用户信息
		$this->login_false();

		$uid=I('get.uid');//用户名查找
		if(false){
			$info['username']=$uid;
			$info['isuid']=1;
			$user['info']=D('Home/Uc')->user_info($info);//array 0/1/2/3:::uid/name/xxx/email
		}else{
			$info['username']=$uid;
			$user['info']=D('Home/Uc')->user_info($info);//array 0/1/2/3:::uid/name/xxx/email
			$uid=$user['info']['con'][0];
		}

		$user['point']=D('Home/Userpoint')->uid_point($uid);//用户积分 array uid/point/history
		$user['today']=D('Home/Pointmax')->uid($uid);//string


		$user_post=D('Home/Post')->uid($uid);
		$user['post']=count($user_post);
		$user_comment=D('Home/Comment')->uid($uid);
		$user['comment']=count($user_comment);
		$user_danmu=D('Home/Danmu')->uid($uid);
		$user['danmu']=count($user_danmu);
		$this->assign('user',$user);
		$this->display();
	}
	public function user_post(){
		$this->login_false();
		$uid=(int)I('get.uid');
		$info=D('Home/Post')->uid($uid);

		$infox['username']=$uid;
		$infox['isuid']=1;
		$user=D('Home/Uc')->user_info($infox);//array 0/1/2/3:::uid/name/xxx/email


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
        $this->assign("user",$user['con']);
        $this->assign('page',$show);
		$this->assign("info",$list);
		$this->display();

	}
	public function user_comment(){
		$this->login_false();
		$uid=(int)I('get.uid');

		$infox['username']=$uid;
		$infox['isuid']=1;
		$user=D('Home/Uc')->user_info($infox);//array 0/1/2/3:::uid/name/xxx/email


		$info=D('Home/Comment')->uid($uid);
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
        $this->assign("user",$user['con']);
        $this->assign('page',$show);
		$this->assign("info",$list);
		$this->display();
	}
	public function user_danmu(){
		$this->login_false();
		$uid=(int)I('get.uid');

		$infox['username']=$uid;
		$infox['isuid']=1;
		$user=D('Home/Uc')->user_info($infox);//array 0/1/2/3:::uid/name/xxx/email

		$info=D('Home/Danmu')->uid($uid);
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
        $this->assign("user",$user['con']);
        $this->assign('page',$show);
		$this->assign("info",$list);
		$this->display();

	}
	public function user_change(){//改分
		$this->level_3();
		$xin=I('post.xin');
		$uid=I('post.uid');
		$ba=D('Home/Userpoint')->admin_change($uid,$xin);
		if($ba){
			$re['status']=true;
		}else{
			$re['status']=false;
		}
		$this->ajaxReturn($re);
	}
	public function user_password(){
		$this->level_3();
		$xin=I('post.xin');
		$uid=I('post.uid');
		$info['username']=$uid;
		$info['isuid']=1;
		$user=D('Home/Uc')->user_info($info);//array 0/1/2/3:::uid/name/xxx/email
		$cn['username']=$user['con'][1];
		$cn['ignoreoldpw']=1;
		$cn['newpw']=$xin;
		$cn['oldpw']="";
		$cn['email']="";
		$re=D('Home/Uc')->user_update($cn);
		$this->ajaxReturn($re);
	}
	public function user_del(){
		$this->level_3();
		$uid=I('get.uid');
		$ba=D('Home/Uc')->user_del($uid);
		if($ba){
			$re['status']=true;
		}else{
			$re['status']=false;
		}
		$this->ajaxReturn($re);

	}
	public function comment_del(){
		$this->level_3();
		$cid=(int)I('get.cid');
		$re=D('Home/Comment')->del($cid);
		$this->ajaxReturn($re);
	}
	public function comment(){
		$info=D('Home/Comment')->all();
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
	public function post_comment(){
		$this->login_false();
		$pid=(int)I('get.pid');//获取文章
		$post=D('Home/Post')->post($pid);
		if(!$post['status']){
			//$this->error($post['con']);
			$this->display();
			return;
		}
		$ba=$post['con'];
		$info=D('Home/Comment')->pid($pid);
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
        $this->assign('post',$ba);
        $this->assign('page',$show);
		$this->assign("info",$list);
		$this->display();
	}
	public function post_danmu(){
		$this->login_false();
		$pid=(int)I('get.pid');//获取文章
		$info=D('Home/Danmu')->pid($pid);
		//var_dump($info);
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
        $this->assign("user",$user['con']);
        $this->assign('page',$show);
		$this->assign("info",$list);
		$this->display();
	}
	public function logout(){
		$this->login_false();
		session('user',null);
		session('admin',null);
		$this->success("已经登出",U('Admin/Index/login'));
	}
	public function recom_list(){
		$this->login_false();
		$info=D('Home/Recom')->recom();
		$count=count($info);
		$Page= new \Think\Page($count,25);
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
	public function recom_toggle(){
		$this->login_false();
		$pid=I('get.pid');
		$uid=session('user.uid');
		$re=D('Home/Recom')->recom_toggle($pid,$uid);
		$this->ajaxReturn($re);
	}
	private function is_login(){
		if(isset($this->session['admin']['level'])){//管理员团队
			return $this->session['admin']['level'];
		}else{
			return false;
		}
	}
	private function login_true(){//在登入情况下触发
		$re=$this->is_login();
		if($re){
			$this->error("您已登入",U('Admin/Index/index'));
		}

	}
	private function login_false(){//未登入情况下执行
		$re=$this->is_login();
		if(!$re){
			$this->error("请先登入",U('Admin/Index/login'));
			return;
		}
	}
	private function level_3(){
		$re=$this->is_login();
		if($re<3){
			$this->error("你的权限不够");
			return ;
		}
	}
	private function level_5(){
		if($re<5){
			$this->error("你的权限不够");
			return ;

		}
	}
	private function ad_cn($info){
		$save['adid']=$info['adid'];
		$save['station']=$info['station'];
		$save['html']=$info['html'];
		$save['time']=time();
		$im=M('Ad')->save($save);
		if($im){
			$re['status']=true;
			$re['con']="成功添加广告";
		}else{
			$re['status']=false;
			$re['con']="添加失败";
		}
		return $re;
	}
	private function add_add($info){
		$im=M('Ad')->add($info);
		if($im){
			$re['status']=true;
			$re['con']="成功添加广告";
		}else{
			$re['status']=false;
			$re['con']="添加失败";
		}
		return $re;
	}






}