<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<title>Nyaa动漫</title>
	<style type="text/css">
		img{
			max-width:66%;
		}
		body{
			
			background-color:#FFF;
			background-repeat: no-repeat;
			background-position: top;
			background-repeat: no-repeat;
			background-position: bottom left;
			background-attachment: fixed;
			
		}
	</style>
</head>
<body>
	<div class="container">
	<h1 class="col-md-3 col-md-xs-6"><a href="/">Nyaa动漫</a></h1>
	<div class="col-md-3 col-md-offset-6">
		<a href="/Home/User" class="btn btn-link" title="用户中心 <?php echo ($_SESSION['user']['name']); ?>"><img src="/Home/User/avatar/uid/<?php echo ($_SESSION['user']['uid']); ?>" width="100px" class="img-circle"></a>
	</div>
</div>

<div class="row show_header_image" style="background-image:url(http://bilibara.com/images/2017/02/08/maxresdefault.jpg);">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var index=$('#index').attr("value");
		if(index){
		}else{
			$(".show_header_image").hide();
		}
	})
</script>
	<div class="container">
		<div class="row">
	
</div>
<div class="row">
	<div class="col-md-2" title="头像">
		<img src="/Home/User/avatar/uid/<?php echo ($_SESSION['user']['uid']); ?>" class="img-circle" title="点击修改" data-toggle="modal" data-target=".change_image">
	</div>
	<div class="col-md-4">
		<p title="用户信息:ID">ID:<?php echo ($_SESSION['user']['uid']); ?></p>
		<p title="用户信息:用户名">用户名:<?php echo ($_SESSION['user']['name']); ?></p>
		<p title="用户信息:邮箱">邮箱:<?php echo ($_SESSION['user']['email']); ?></p>
		<p>总积分:<?php echo ($point); ?> 今日获得积分:<?php echo ($today); ?></p>
		<p>
		<?php if($qian): ?><span class="label label-success">已经连续签到<?php echo ($qian); ?>天</span>
		<?php else: ?>
			<span class="label label-info" title="点击签到" id="qian">未签到</span>
			<script type="text/javascript">
			$("#qian").click(function(){
				$.ajax({
					url:"/Home/User/qian",
					success:function(data){
						if(data.status){
							$("#qian").removeClass('label-info');
							$("#qian").addClass("label-success");
							$("#qian").text(data.con);
						}else{
							confrim("签到可能失败！");
						}
					}
				})
			})
			</script><?php endif; ?>
		</p>
		<p><button class="btn btn-info" id="save">收藏 <span class="badeg"><?php echo (saveuid($_SESSION['user']['uid'])); ?></span></button> <a href="/Home/Post/create_post" class="btn btn-primary">发布</a> <a href="/Home/User/logout" class="btn btn-danger">登出</a></p>
	</div>
</div>
<div class="row">
	<div class="panel panel-default">
	<table class="table">
		<tr>
			<th>类型</th>
			<th>帖子名称</th>
			<th>发帖时间</th>
			<th>修改时间</th>
			<th>审核</th>
		</tr>
	<?php if(is_array($post)): $i = 0; $__LIST__ = $post;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
			<td >
  				<?php if($vo['is_video']): ?><span class="text-primary glyphicon glyphicon-film"></span>
  				<?php else: ?>
  					<span class="glyphicon glyphicon-book"></span><?php endif; ?>
  			</td>
			<td>
				<a href="/Home/Index/post/pid/<?php echo ($vo['pid']); ?>" title="未通过审核前无法查看"><?php echo ($vo['title']); ?></a>
				<a href="/Home/Post/edit_post/pid/<?php echo ($vo['pid']); ?>" class="text-warning" title="编辑修改"><span class="glyphicon glyphicon-pencil"></span></a>
			</td>
			<td><?php echo (date("Y/m/d H:i",$vo['time'])); ?></td>
			<?php if($vo['edit_time']): ?><td><?php echo (date("Y/m/d H:i",$vo['edit_time'])); ?></td>
			<?php else: ?>

				<td><?php echo (date("Y/m/d H:i",$vo['time'])); ?></td><?php endif; ?>
			<?php if($vo['is_show']): ?><td><span class="label label-success">通过</span></td>
			<?php else: ?>
				<td><span class="label label-warning">未通过</span></td><?php endif; ?>
		</tr><?php endforeach; endif; else: echo "" ;endif; ?>
	</table>
	</div>
</div>

<div class="modal fade"  id="modal" role="dialog">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">
					
				</h3>
			</div>
			<div class="modal-body">
				<iframe src="" id="iframe" width="95%" frameborder="no"  scrolling="no" allowtransparency="yes"></iframe>
				<div id="content">
					
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

<script type="text/javascript">
	$("#save").click(function(){
		$('#modal').modal('show');
		$(".modal-title").text("收藏夹");
		$("#iframe").attr("src","/Home/User/save");
	})

</script>

























<div class="modal fade change_image">
	<div class="modal-dialog modal-md" role="document">
		<?php echo ($cn); ?>
	</div>
</div>
	</div>
	<div class="container">
		<div class="container">
		<hr/>
		<p>
			这里是footer [./Application/Home/View/Public]
		</p>
	
</div>
	</div>
</body>
</html>