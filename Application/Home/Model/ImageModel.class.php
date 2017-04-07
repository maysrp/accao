<?php
namespace Home\Model;
use Think\Model;
class ImageModel extends Model {
	function image_add($info){
		$add['uid']=$info['uid'];
		$add['file']=$info['file'];
		$add['time']=time();
		$this->add($add);
	}



}