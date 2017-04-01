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
				return $back['con'][1];
			}else{
				return $back['con'][2];
			}
		}
	}
	function danmu($info){
		$en=json_decode($info,true);
		return $en['text'];
	}
	function pidname($pid){
		$m=M('Post')->find($pid);
		return $m['title'];
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
?>