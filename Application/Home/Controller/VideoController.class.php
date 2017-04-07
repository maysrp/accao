<?php
namespace Home\Controller;
use Think\Controller;
class VideoController extends Controller {
	function upload(){
		$uid=session('user.uid');
		if($uid){
			$upload=new \Think\Upload();
			$upload->maxSize=2073741824;//2GB
			$upload->exts=array('mp4');
			$upload->rootPath='./Video/';
			$upload->savePath='';
			$info=$upload->upload();
			if(!$info){
				$re['status']=false;
				$re['con']=$upload->getError();
			}else{
				$re['status']=true;
				$xinfo['file']="/Video/".$info['video']['savepath'].$info['video']['savename'];//video为上传的标签名称
				$xinfo['md5']=$info['video']['md5'];
				$xinfo['name']=$info['video']['name'];
				$xinfo['uid']=$uid;
				D('Home/Video')->video_add($xinfo);
				$re['con']=$xinfo['file'];//回传地址
			}
		}else{
			$re['status']='false';
			$re['con']="请先登入@";
		}
		$this->ajaxReturn($re);
	}
	function index(){
		$this->display();
	}





}