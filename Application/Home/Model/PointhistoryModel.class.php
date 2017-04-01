<?php
namespace Home\Model;
use Think\Model;
class PointhistoryModel extends Model {
function add_history($info){
 	$add['time']=time();
 	$add['history']=$info;
 	$this->add($add);
}





}