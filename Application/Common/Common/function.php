<?php
	/**
	 * [getActionUrl 获取当前URL]
	 * @return [string] [Url]
	 */
	function getActionUrl($true){
	    if ($true) {
	        return U(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME);
	    }else{
	        return MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
	    }
	}
	function uid($uid,$type="name"){//获取UID的用户名
		$info['username']=$uid;
		$info['isuid']=1;
		$back=D('Home/Uc')->user_info($info);
		if($back['status']){
			if($type=="name"){
				return "<a class=\"text-danger\" href=\"/Home/Index/profile/uid/".$uid."\">".$back['con'][1]."</a>";
			}else{
				return $back['con'][2];
			}
		}
	}
	function uidname($uid){
		$info['username']=$uid;
		$info['isuid']=1;
		$back=D('Home/Uc')->user_info($info);
		return $back['con'][1];
	}
	function danmu($info){
		$en=json_decode($info,true);
		return $en['text'];
	}
	function pidname($pid){
		$m=M('Post')->find($pid);
		return $m['title'];
	}
	function pidview($pid){
		$m=M('Post')->find($pid);
		return $m['view'];
	}
	function pidtime($pid){
		$m=M('Post')->find($pid);
		return date("Y/m/d H:i",$m['time']);
	}
	function ad_all(){
		$info=M('ad')->select();
		return $info;
	}
	function ad_1(){//1号广告位
		$info=ad_all();
		foreach ($info as $key => $value) {
			if($value['station']==1){
				echo $value['html'];
				break;
			}
		}
	}
	function ad_2(){//1号广告位
		$info=ad_all();
		foreach ($info as $key => $value) {
			if($value['station']==2){
				echo $value['html'];
				break;
			}
		}
	}
	function savepid($pid){
		$array=A('Home/Save')->pid($pid);
		echo count($array);
	}
	function saveuid($uid){
		$array=A('Home/Save')->uid($uid);
		echo count($array);
	}
	function comment($pid){
		$array=D('Home/Comment')->pid($pid);
		echo count($array);
	}
	function is_fans($uid){
		$ba=D('Home/Fans')->check_fans($uid,session('user.uid'));
		if($ba){
			return "<h3><span class=\"label label-default follow\" value=\"label-default\">已经关注</span></h3>";
		}else{
			return "<h3><span class=\"label label-danger follow\" value=\"label-danger\">关注</span></h3>";
		}
	}
	function cool($pid){
		$pid=(int)$pid;
		return D('Home/Cool')->cool($pid);
	}
	function cool_t_num($pid){
		$all=cool($pid);
		return count($all['t']);
	}
	function cool_f_num($pid){
		$all=cool($pid);
		return count($all['f']);
	}
	function cool_a_num($pid){
		$all=cool($pid);
		return count($all['a']);
	}
	function is_recom($pid){
		if(D('Home/Recom')->is_recom($pid)){
			return true;
		}else{
			return 0;
		}
	}
	function pid_tag($pid){
		$info=D('Home/Tag')->pid($pid);
		if(count($info)!=0){
			foreach ($info as $key => $value) {
				echo "<div class=\"label label-info\"><a href=\"/Home/Index/tag/name/".$value."\">".$value."</a></div> ";
			}
		}
	}
	function admin_pid_tag($pid){
			$info=D('Home/Tag')->pid_tag($pid);
			if(count($info)!=0){
			foreach ($info as $key => $value) {
				echo "<div class=\"label label-info admin_tag\" value=\"".$value['tid']."\" id=\"tid".$value['tid']."\" >".$value['name']."  <span class=\"text-danger glyphicon glyphicon-trash\"></span></div> ";
			}
		}
	}
?>