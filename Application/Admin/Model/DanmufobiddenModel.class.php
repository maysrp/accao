<?php
namespace Admin\Model;
use Think\Model;
class DanmufobiddenModel extends Model {
	public function delete_info($info){
		$ba=$this->delete($info['fid']);
		if($ba){
			$re['status']=true;
			$re['con']="success";
		}else{
			$re['status']=false;
			$re['con']="error";
		}
		return $re;
	}
	public function add_info($info){
		$add['forbidden']=$info['forbidden'];
		$add['time']=time();
		$add['changeto']=$info['changeto'];
		$add['uid']=session('user.uid');
		$ba=$this->add($add);
		if($ba){
			$re['status']=true;
			$re['con']="success";
		}else{
			$re['status']=false;
			$re['con']="error";
		}
		return $re;
	}
	public function change_info($info){
		$save['fid']=$info['fid'];
		$save['forbidden']=$info['forbidden'];
		$save['time']=time();
		$save['changeto']=$info['changeto'];
		$save['uid']=session('user.uid');
		$ba=$this->save($save);
		if($ba){
			$re['status']=true;
			$re['con']="success";
		}else{
			$re['status']=false;
			$re['con']="error";
		}
		return $re;
	}






}