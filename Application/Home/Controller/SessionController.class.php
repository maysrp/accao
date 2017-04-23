<?php
	namespace Home\Controller;
	use Think\Controller;
	class SessionController extends Controller{
		public function index(){
			$session=session('user');
			return $session;
		}
	}