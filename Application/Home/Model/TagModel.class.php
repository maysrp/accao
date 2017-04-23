<?php
    namespace Home\Model;
    use Think\Model;
    class TagModel extends Model{
        function tag_done($info,$pid,$uid){
            $tag=preg_replace('/\s+/', ' ', $info);
            $tag_array=explode(" ", $tag);
            $tag_array=array_unique($tag_array);
            if(count($tag_array)!=0){
                foreach ($tag_array as $key => $value) {
                    $this->tag_add($value,$pid,$uid);
                }
            }
        }
        function tag_add($tag,$pid,$uid){
            $add['name']=trim($tag);
            $add['pid']=$pid;
            $add['uid']=$uid;
            $add['time']=time();
            $this->add($add);
        }
        function tag_name($name){//搜索
            $where['name']=$name;
            $ba=$this->where($where)->select();
            return $ba;//用于统计
        }
        function tag_del($name){//删除整个标签
            $where['name']=$name;
            $ba=$this->where($where)->delect();
            return $ba;
        }
        function tid_del($tid){
            return $this->delete($tid);
        }
        function pid($pid){
            $where['pid']=$pid;
            $ba=$this->where($where)->select();
            foreach ($ba as $key => $value) {
                $m[]=$value['name'];
            }
            return $m;//用于返回文章标签
        }
        function pid_tag($pid){
            $where['pid']=$pid;
            $ba=$this->where($where)->select();
            return $ba;
        }
        function tag_change($info,$pid,$uid){
            $where['pid']=$pid;
            $this->where($where)->delete();
            $this->tag_done($info,$pid,$uid);
        }
        
      
    }
    