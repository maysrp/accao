<?php
	namespace Home\Controller;
	use Think\Controller;
	class GimController extends Controller{
		//EXEX函数 + libav安装好 若不是libav请把代码中的avconv换成ffmpeg
		public function index(){
			$this->addlist();
			$this->achieve();
		}
		protected function addlist(){
			//$where['is_video']=1;
			$where['image']=array("eq",'0');
			$where['del']=0;
			$info=M('Post')->where($where)->select();
			if($info){
				foreach($info as $value){
					$add['pid']=$value['pid'];
					$add['dir']=$value['video_url'];
			
					$this->add($add);
				}
			}
		}
		protected function add($info){
			$where['pid']=$info['pid'];
			$jugg=M('Video_image')->where($where)->select();
			if($jugg){
			}else{
				M('Video_image')->add($info);
			}
		}
		protected function achieve(){
			$where['do']=0;
			$info=M('Video_image')->where($where)->limit(5)->select();
			if($info){
				foreach ($info as $key => $value) {
					$dir=DIR.$value['dir'];
					$this->image($dir,$value['pid']);
				}
			}
		}
		protected function image($dir,$pid){
			if($this->is_mp4($dir)){//MP4才截图
				for ($i=1; $i <10 ; $i++) { 
    				$time=$i*60;
    				$r=mt_rand(1,999);
    				$rd="_".$r."_";
    				$image=DIR."/Image/video/".$pid.$rd.$i.".jpg";
    				$this->make_jpg($dir,$time,$image);	
    				$image_array[]="/Image/video/".$pid.$rd.$i.".jpg";
    			}
    			$this->image_sql($image_array,$pid);//写入数据库
			}else{
				$where['pid']=$pid;
				M('Video_image')->where($where)->setField('do',1);
			}
		}
		protected function make_jpg($video,$time,$image){
    		$exec="avconv -ss ".$time." -i ".$video." -t 0.01 -f image2 -y ".$image;
    		@exec($exec);
			//echo $exec;
    	}
    	protected function image_sql($image,$pid){
    		foreach ($image as $key => $value) {
				$add['do']=1;
				$add['time']=time();
    			$add['pid']=$pid;
    			$where['pid']=$pid;
    			if($this->is_file(DIR.$value)){
    				$img[]=$value;
    			}
				$key=array_rand($img);
				$add['main']=$img[$key];
    		}

    		$add['image']=json_encode($img);
				$add['do']=1;
    			M('Video_image')->where($where)->save($add);
    			$save['pid']=$pid;
   				$save['image']=$add['main'];
   				D('Post')->save($save);
   			

    	}
		protected function is_mp4($dir){
			if($this->is_file($dir)){
				$arr=explode(".", $dir);
				$ex=array_pop($arr);
				$ex=strtolower($ex);
				if($ex=="mp4"){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
		protected function is_file($dir){
			return is_file($dir);
		}
		
	}