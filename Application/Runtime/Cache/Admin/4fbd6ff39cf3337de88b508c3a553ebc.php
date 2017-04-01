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
		
	<div class="row">
		<div class="row">
		<div class="panel panel-default">
  		<div class="panel-heading"><h4>我的帖子</h4></div>
  		<table class="table">
  			<tr>
  				<th>类型</th>
  				<th>帖子名称</th>
  				<th>发帖时间</th>
  				<th>编辑时间</th>
  				<th>审核状态</th>
  				<TH>操作</TH>
  			</tr>
  			<?php if(is_array($post)): $i = 0; $__LIST__ = $post;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr id="<?php echo ($vo['pid']); ?>">
  					<td >
  						<?php if($vo['is_video']): ?><span class="text-primary glyphicon glyphicon-film"></span>
  						<?php else: ?>
  							<span class="glyphicon glyphicon-book"></span><?php endif; ?>
  					</td>
  					<td><a href="/Admin/Index/edit/pid/<?php echo ($vo['pid']); ?>"><?php echo ($vo['title']); ?></a> <a href="/Admin/Index/view/pid/<?php echo ($vo['pid']); ?>" title="查看帖子"><span class="glyphicon glyphicon-eye-open"></span></a></td>
  					<td><?php echo (date("Y/m/d H:i",$vo['time'])); ?></td>
					<?php if($vo['edit_time']): ?><td><?php echo (date("Y/m/d H:i",$vo['edit_time'])); ?></td>
					<?php else: ?>
						<td><?php echo (date("Y/m/d H:i",$vo['time'])); ?></td><?php endif; ?>
					<?php if($vo['is_show']): ?><td><span class="label label-success">通过</span></td>
					<?php else: ?>
						<td><span class="label label-warning">未通过</span></td><?php endif; ?>
					<td>
						<span class="text-danger glyphicon glyphicon-trash del_post" value="<?php echo ($vo['pid']); ?>"></span>
					</td>
  				</tr><?php endforeach; endif; else: echo "" ;endif; ?>
  		</table>
  		</div>
		</div>
		<div class="text-center row">
			<?php echo ($page); ?>
		</div>
	</div>		
	

	<script type="text/javascript">
		$(".del_post").click(function(){
			var value=$(this).attr('value');
			var one=$(this);
			$.ajax({
				method:'get',
				url:'/Admin/Index/del/pid/'+value,
				success:function(data){
					if(data.status){
						var type=$(this).attr('type');
						$("#"+value).remove();
					}else{
						confirm("操作失败，可能原因：权限不够！");
					}
				}
			})
		})
	</script>
	</div>
</body>
</html>