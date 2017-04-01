<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<title>DM</title>
	<style type="text/css">
		img{
			max-width:66%;
		}
		
	</style>
</head>
<body>
	<div class="container">
		<div class="row" style="margin: 5px;">
  <form>
    <div class="input-group col-sm-6 col-sm-offset-6">
      <input type="number" placeholder="帖子的pid" name="pid" class="form-control">
      <div class="input-group-btn">
        <button class="btn btn-primary">提交</button>
      </div>
    </div>
  </form>
</div>
<link rel="stylesheet" type="text/css" href="/static/css/comment.css">
<link rel="stylesheet" href="/plugins/em/lib/css/jquery.mCustomScrollbar.min.css"/>
<link rel="stylesheet" href="/plugins/em/dist/css/jquery.emoji.css"/>
<link rel="stylesheet" href="/plugins/em/lib/css/railscasts.css"/>
<link rel="stylesheet" href="/plugins/em/dist/css/index.css"/>
<script src="/plugins/em/lib/script/jquery.min.js"></script>
<script src="/plugins/em/lib/script/highlight.pack.js"></script>
<script src="/plugins/em/lib/script/jquery.mousewheel-3.0.6.min.js"></script>
<script src="/plugins/em/lib/script/jquery.mCustomScrollbar.min.js"></script>
<script src="/plugins/em/dist/js/jquery.emoji.min.js"></script>
<script src="/static/js/time.js"></script>
	<div class="row">
		<div class="row">
			<div class="panel panel-default">
  			<div class="panel-heading"><h4>文章《<?php echo ($post['title']); ?>》评论管理</h4></div>
  				<table class="table">
  					<tr>
  						<th>
  							楼层
  						</th>
  						<th>
  							回复楼层
  						</th>
  						<th>
  							内容
  						</th>
  						<th>
  							时间
  						</th>
  						<th>
  							用户
  						</th>
  						<th>
  							操作
  						</th>
  					</tr>
  					<?php if(is_array($info)): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr id="<?php echo ($vo['cid']); ?>">
  							<td><?php echo ($vo['lou']); ?></td>
  							<td><?php echo ($vo['relou']); ?></td>
  							<td class="comment"><?php echo ($vo['comment']); ?></td>
  							<td><?php echo (date("Y/m/d H:i",$vo['time'])); ?></td>
  							<td><a href="/Admin/Index/user_comment/uid/<?php echo ($vo['uid']); ?>"><?php echo (uid($vo['uid'])); ?></a></td>
  							<td>
  								<span class="glyphicon glyphicon-trash text-danger del" value="<?php echo ($vo['cid']); ?>"></span>
  							</td>



  						</tr><?php endforeach; endif; else: echo "" ;endif; ?>
  				</table>
  				<div class="text-center">
  					<?php echo ($page); ?>
  				</div>
  			</div>
  			</div>
		</div>
	</div>

	<script type="text/javascript">
		hljs.initHighlightingOnLoad();
		$(".comment").emojiParse({
            icons: [
            {   path: "/plugins/em/dist/img/acfun/",
                maxNum: 54,
                file: ".gif",
                placeholder: "#acfun_{alias}#"
            }
            ]
        })
        $(".del").click(function(){
        	var cid=$(this).attr('value');
        	$.ajax({
        		url:'/Admin/Index/comment_del/cid/'+cid,
        		success:function(data){
        			if(data.status){
        				//confirm("删除成功！");
        				$("#"+cid).remove();
        			}else{
        				alert("删除失败！"+data.con);
        			}
        		}
        	})
        })

	</script>
	</div>
</body>
</html>