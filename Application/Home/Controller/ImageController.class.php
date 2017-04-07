<?php
namespace Home\Controller;
use Think\Controller;
class ImageController extends Controller {
	function upload(){
		$uid=session('user.uid');
		if($uid){
			$upload=new \Think\Upload();
			$upload->maxSize=2073741824;//2GB
			$upload->exts=array('jpg','jpeg','png','gif','bmp');
			$upload->rootPath='./Image/';
			$upload->savePath='';
			$info=$upload->upload();
			if(!$info){
				$re['status']=false;
				$re['con']=$upload->getError();
			}else{
				$re['status']=true;
				$xinfo['file']="/Image/".$info['image']['savepath'].$info['image']['savename'];//video为上传的标签名称
				$xinfo['uid']=$uid;
				D('Home/Image')->image_add($xinfo);
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