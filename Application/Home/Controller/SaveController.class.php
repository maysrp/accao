<?php
namespace Home\Controller;
use Think\Controller;
class SaveController extends Controller {
	private $session;
	public function __construct(){
		parent::__construct();
		$this->session=session('user');
	}
	public function click(){
		if($this->is_login()){
			$pid=I('get.pid');
			$uid=$this->session['uid'];
			$re=D('Home/Save')->click($uid,$pid);
		}else{
			$re['status']=true;
			$re['con']="请先登入";
		}
		$this->ajaxReturn($re);
	}
	public function pid(){
		$pid=I('get.pid');
		return D('Home/Save')->pid($pid);
	}
	public function uid(){
		$uid=$this->session['uid'];
		return D('Home/Save')->uid($uid);
	}
	public function del(){
		$uid=$this->session['uid'];
		$pid=I('get.pid');
		$re=D('Home/Save')->del_save($uid,$pid);
		$this->ajaxReturn($re);
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