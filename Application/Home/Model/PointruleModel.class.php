<?php
namespace Home\Model;
use Think\Model;
class PointruleModel extends Model {
	function rid($rid){
			$rid=(int)$rid;
			$ba=$this->find($rid);
			if($ba){
				return $ba;
			}else{
				return false;
			}
		}
		function add_one($info){
			$add['type']=isset($info['type'])?1:0;
			$add['point']=(int)$info['point'];
			$add['con']=trim($info['trim']);
			return $this->add($add);
		}
		function del_one($rid){
			$rid=(int)$rid;
			if($rid<=9){
				return false;//不允许删除保留端
			}
			return $this->delete($rid);
		}
		function change_one($info){
			$save['rid']=(int)$info['rid'];
			$save['type']=isset($info['type'])?1:0;
			$save['point']=(int)$info['point'];
			$save['con']=trim($info['trim']);
			return $this->save($save);
		}
		//固定方法 1 弹幕删除扣分rid 1  2签到加分rid 2 3文章审核通过 rid 3 4文章修改-1 rid 4 5评论删除扣分rid 5 6评论添加加分 rid 6  
		//弹幕 + - 
		//签到 +
		//文章 审核+ 未通过/删除 - 
		//评论 + - 
		//日最多 积分MAX100？





}