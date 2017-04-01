<?php
namespace Home\Model;
use Think\Model;
class UcModel extends Model {
	public function __construct(){
		parent::__construct();
		include_once('./Application/Ucenter/Conf/config.php');
    	include_once('./Uc_client/client.php');
	}
	public function user_del($uid){
		 return uc_user_delete($uid);
	}
	public function user_add($info){
		$uid = uc_user_register($info['username'], $info['password'], $info['email']);
		if($uid>0){
			$re['status']=true;
			$re['con']="注册成功";
			session('user.uid',$uid);
			session('user.name',$info['username']);
			session('user.email',$info['password']);
		}elseif($uid==-1){
			$re['status']=false;
			$re['con']="用户名不合法";
		}elseif($uid==-2){
			$re['status']=false;
			$re['con']="包含不允许注册的词语";
		}elseif($uid==-3){
			$re['status']=false;
			$re['con']="用户名已经存在";
			
		}elseif($uid==-4){
			$re['status']=false;
			$re['con']="Email 格式有误";
			
		}elseif($uid==-5){
			$re['status']=false;
			$re['con']="Email 不允许注册";
		}elseif($uid==-6){
			$re['status']=false;
			$re['con']="该 Email 已经被注册";
		}
		return $re;
	}
	public function mes(){
		return uc_pm_location(2);
	}
	public function avatar($uid){
		return uc_avatar($uid,'real',1);
	}
	public function user_login($info){
		$r_a=uc_user_login($info['username'],$info['password'],$info['isuid']);
		if($r_a[0]>0){
			session('user.uid',$r_a[0]);
			session('user.name',$r_a[1]);
			session('user.email',$r_a[3]);
			$re['status']=true;
			$re['con']="成功登入";
		}elseif($r_a[0]==-1){
			$re['status']=false;
			$re['con']="用户不存在!或者被删除！";
		}elseif($r_a[0]==-2){
			$re['status']=false;
			$re['con']="密码错误！";
		}else{
			$re['status']=false;
			$re['con']="未知错误";
		}
		return $re;
	}
	public function user_info($info){//获取用户信息
		$r_a=uc_get_user($info['username'],$info['isuid']);
		if($r_a[0]){
			$re['status']=true;
			$re['con']=$r_a;
		}else{
			$re['status']=false;
			$re['con']="无该用户";
		}
		return $re;
	}
	function user_update($info){//更新
		$r_a=uc_user_edit($info['username'],$info['oldpw'],$info['newpw'],$info['email'],$info['ignoreoldpw']);
		switch ($r_a) {
			case '1':
				$re['status']=true;
				$re['con']="更新成功!";
				break;
			case '0':
				$re['status']=false;
				$re['con']="没有做任何修改";
				break;
			case '-1':
				$re['status']=false;
				$re['con']="旧密码不正确";
				break;
			case '-4':
				$re['status']=false;
				$re['con']="Email 格式有误";
				break;
			case '-5':
				$re['status']=false;
				$re['con']="Email 不允许注册";
				break;
			case '-6':
				$re['status']=false;
				$re['con']="该 Email 已经被注册";
				break;
			case '-7':
				$re['status']=false;
				$re['con']="没有做任何修改";
				break;
			default:
				$re['status']=false;
				$re['con']="该用户受保护无权限更改";
				break;
		}
		return $re;
	}
	function sync($uid){
		return uc_user_synlogin($uid);
		//返回的 HTML 输出在页面中即可完成对其它应用程序的通知。输出的 HTML 中包含执行远程的 javascript 脚本，请让页面在此脚本运行完毕后再进行跳转操作
	}
	function email($email){
		$r_a=uc_user_checkemail($email);
		switch ($r_a) {
			case '1':
				$re['status']=true;
				$re['con']="成功！";
				break;
			case '-4':
				$re['status']=false;
				$re['con']="Email 格式有误";
				break;
			case '-5':
				$re['status']=false;
				$re['con']="Email 不允许注册";
				break;
			default:
				$re['status']=false;
				$re['con']="该 Email 已经被注册";
				break;
		}
		return $re;
	}
	function name($name){
		$r_a=uc_user_checkname($name);
		switch ($r_a) {
			case '1':
				$re['status']=true;
				$re['con']="成功！";
				break;
			case '-1':
				$re['status']=false;
				$re['con']="用户名不合法";
				break;
			case '-2':
				$re['status']=false;
				$re['con']="包含要允许注册的词语";
				break;
			default:
				$re['status']=false;
				$re['con']="用户名已经存在";
				break;
		}
		return $re;
	}
	function mail($info){

	}
	function del_avatar($uid){
		uc_user_deleteavatar($uid);
	}



}