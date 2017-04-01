<?php
namespace Home\Controller;
use Think\Controller;
class DanmuController extends Controller {
    public function index(){//获取弹幕
    	$where['pid']=I('get.pid');
    	$info=M('Danmu')->where($where)->select();
    	foreach ($info as $key => $value) {
    		$ret[]=$value['danmu'];
    	}
    	$this->ajaxReturn($ret);
    }
    public function send(){
    	if(session('user.uid')){
    		$add['pid']=I('get.pid');
    		$add['uid']=session('user.uid');
    		$add['time']=time();
    		$add['danmu']=$this->auto_check(I('post.danmu'));
    		$add['ip']=I('server.REMOTE_ADDR');
    		M('Danmu')->add($add);
    		$re['status']=true;
    		$re['con']="发送成功!";
            D('Home/Userpoint')->danmu($add['uid'],1);
    	}else{
    		$re['status']=false;
    		$re['con']="请先登入!";
    	}
    	$this->ajaxReturn($re);
    }
    private function auto_check($text){//正则替换违禁词
    	$cka=M('danmufobidden')->select();
    	foreach ($cka as $key => $value) {
    		$text=$this->jugg($value['forbidden'],$value['changeto'],$text);//正则替换后再添加
    	}
    	return $text;
    }
    private function jugg($par,$to,$text){
    	$par=trim($par);
    	$pg="/".$par."/i";
    	return preg_replace($pg,$to,$text);
    }

}