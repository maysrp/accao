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
  		<div class="panel-heading"><h4><img src="/Home/User/avatar/uid/<?php echo ($user[0]); ?>/type/small" class="img-rounded"><?php echo ($user['1']); ?>的帖子</h4></div>
			<table class="table">
				<tr>
					<th>
						类型
					</th>
					<th>
						帖子
					</th>
					<th>
						发帖人
					</th>
					
					<th>
						最后修改时间
					</th>
					<th>
						审核
					</th>
					<th>
						删除
					</th>
				</tr>
				<?php if(is_array($info)): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr id="<?php echo ($vo['pid']); ?>">
						<td >
  							<?php if($vo['is_video']): ?><span class="text-primary glyphicon glyphicon-film"></span>
  							<?php else: ?>
  								<span class="glyphicon glyphicon-book"></span><?php endif; ?>
  						</td>
						<td><?php echo ($vo['title']); ?> <a href="/Admin/Index/view/pid/<?php echo ($vo['pid']); ?>" title="查看帖子"><span class="glyphicon glyphicon-eye-open"></span></a></td>
						<td><img src="/Home/User/avatar/uid/<?php echo ($vo['uid']); ?>/type/small" title="<?php echo (uid($vo['uid'])); ?>" class="img-rounded" width="30px;" /></td>
						<?php if($vo['edit_time']): ?><td><?php echo (date("Y/m/d H:i",$vo['edit_time'])); ?></td>
						<?php else: ?>
							<td><?php echo (date("Y/m/d H:i",$vo['time'])); ?></td><?php endif; ?>
						<?php if($vo['is_show']): ?><td><span class="label label-success check" value="<?php echo ($vo['pid']); ?>" tye="success">通过</span></td>
						<?php else: ?>
							<td><span class="label label-warning check" value="<?php echo ($vo['pid']); ?>" tye="warning">未通过</span></td><?php endif; ?>
						<td><span class="glyphicon glyphicon-remove text-danger del_post" value="<?php echo ($vo['pid']); ?>"></span></td>

					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
			</table>
		</div>
		</div>
		<div class="row text-center">
			<?php echo ($page); ?>
		</div>
	</div>		

	<script type="text/javascript">
		$(".check").click(function(){
			var value=$(this).attr('value');
			var tye=$(this).attr('tye');
			var one=$(this);
			$.ajax({
				method:"get",
				url:"/Admin/Index/check/pid/"+value,
				success:function(data){
					if(data.status){
						if(tye=="success"){
							one.removeClass('label-success');
							one.addClass('label-warning');
							one.attr('tye','warning');
							one.text('未通过');
						}else{
							one.removeClass('label-warning');
							one.addClass('label-success');
							one.attr('tye','success');
							one.text('通过');
						}
					}else{
						confirm("操作失败，可能原因：权限不够!");
					}
				}
			})
		})
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