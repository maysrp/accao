<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function siindex(){
    	header("Content-Type: Text/Html;Charset=UTF-8");
    	//实例化Sitemap类
    	$Sitemap = new \Library\Sitemap();

    	//获取数据库分类数据  //这一张表通常可以是菜单表、分类表，文章表可以
		$categoryData = M('Category')->field(array('id'))->select();

		foreach ($categoryData as $v){
		    $Sitemap->AddItem('http://www.baidu.com/list.html?id='.$v['id'], 1);
		}

		//生成到网站根目录
		$Sitemap->SaveToFile('sitemap.xml');

		echo '已生成Sitemap网站地图到根目录';
    }
    public function index(){
        $type=I('get.type');
        if($type=="video"){
            $where['is_video']=1;
        }elseif ($type=="post") {
           $where['is_video']=0;
        }else{
        }
        $where['del']=0;
        $where['is_show']=1;
        $info=M('Post')->where($where)->order('time desc')->select(); 

        $count=count($info);
        $Page= new \Think\Page($count,25);
        //$Page->setConfig('header',"条弹幕");
        if($_GET['p']<1){
             $_GET['p']=1;
        }else{
               $_GET['p']=(int)$_GET['p'];//
        }
        $list=array_slice($info, 25*($_GET['p']-1),25);
        $show=$Page->show();
        $hot=D('Post')->hot('month',10);
        $nim=D('Post')->nim('month',5);
        $nic=D('Comment')->nic();
        $this->assign('hot',$hot);
        $this->assign('nim',$nim);
        $this->assign('nic',$nic);
        $this->assign('page',$show);
        $this->assign("info",$list);
        $this->display();
    }
    public function post(){
    	$pid=I('get.pid');
    	$re=D('Home/Post')->post($pid);
    	if($re['status']){
    		$this->assign("post",$re['con']);
    		$this->display();

    	}else{
    		$this->error($re['con']);
    	}
    }
    public function search(){
        $search=I('get.search');
        $where['title']=array('like','%'.$search.'%');
        $type=I('get.type');
        if($type=="video"){
            $where['is_video']=1;
        }elseif ($type=="post") {
           $where['is_video']=0;
        }else{
        }
        $where['del']=0;
        $where['is_show']=1;
        $info=M('Post')->where($where)->order('time desc')->select(); 

        $count=count($info);
        $Page= new \Think\Page($count,25);
        //$Page->setConfig('header',"条弹幕");
        if($_GET['p']<1){
             $_GET['p']=1;
        }else{
               $_GET['p']=(int)$_GET['p'];//
        }
        $list=array_slice($info, 25*($_GET['p']-1),25);
        $show=$Page->show();
        $this->assign('page',$show);
        $this->assign("info",$list);
        $this->display();
    }
    Public function profile(){
        $uid=I('get.uid')?I('get.uid'):session('user.uid');//可以修改
        $my_fans=D('Home/Fans')->uid($uid);
        $my_follow=D('Home/Fans')->fans($uid);

        $type=I('get.type');
        if($type=="video"){
            $where['is_video']=1;
        }elseif ($type=="post") {
           $where['is_video']=0;
        }else{
        }
        $where['del']=0;
        $where['is_show']=1;
        $where['uid']=$uid;
        $info=M('Post')->where($where)->order('time desc')->select(); 

        $count=count($info);
        $Page= new \Think\Page($count,25);
        //$Page->setConfig('header',"条弹幕");
        if($_GET['p']<1){
             $_GET['p']=1;
        }else{
               $_GET['p']=(int)$_GET['p'];//
        }
        $list=array_slice($info, 25*($_GET['p']-1),25);
        $show=$Page->show();
        $this->assign('page',$show);
        $this->assign("info",$list);
        $user['fans']=count($my_fans);
        $user['follow']=count($my_follow);
        $user['post']=count($info);
        $this->assign('user',$user);
        $this->display();
    }
    public function follow(){
        $uid=I('get.uid');
        $fans=session('user.uid');
        if($uid==$fans){
            $re['status']=false;
            $re['con']="不可以自恋！";
            $this->ajaxReturn($re);
            return;
        }
        if($fans){
            $re=D('Home/Fans')->toggle($uid,$fans);
        }else{
            $re['status']=false;
            $re['con']="请先登入！";
        }
        $this->ajaxReturn($re);
    }
}