<?php
	namespace Home\Controller;
	use Think\Controller;
	class CoolController extends Controller{
		public $session;
		function __construct(){
			$this->session=A('Session')->index();
		}
		public function index(){
			$pid=I('get.pid');
			$cool=I('get.cool');
			if($this->session&&$pid){
				$uid=$this->session['uid'];
				$re=D('Cool')->set_cool($pid,$uid,$cool);
			}else{
				$re['status']=false;
				$re['con']="请先登入";
			}
			$this->ajaxReturn($re);
		}
	}