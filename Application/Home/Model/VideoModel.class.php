<?php
namespace Home\Model;
use Think\Model;
class VideoModel extends Model {
	function video_add($info){
		$add['file']=$info['file'];
		$add['uid']=$info['uid'];
		$add['md5']=$info['md5'];
		$add['name']=$info['name'];
		$add['time']=time();
		$this->add($add);
	}


}