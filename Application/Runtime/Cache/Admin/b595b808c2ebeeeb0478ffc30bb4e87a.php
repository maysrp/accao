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
		<br>
		<br>
	</div>
	<div class="row">
		<div class="col-md-2">
			<div class="panel panel-default">
				<div class="panel-heading"><h3>网站管理</h3></div>
				<ul class="list-group">
					<li class="list-group-item ckk" value="/Admin/Index/post">发布帖子</li>
					<li class="list-group-item ckk" value="/Admin/Index/mypost">我的帖子</li>


					<li class="list-group-item ckk" value="/Admin/Index/comment">评论管理</li>
					<li class="list-group-item ckk" value="/Admin/Index/post_comment">帖子评论</li>
					<li class="list-group-item ckk" value="/Admin/Index/user_comment">用户评论</li>

					<li class="list-group-item ckk" value="/Admin/Index/user">用户管理</li>
					
					<li class="list-group-item ckk" value="/Admin/Index/all_post">审核帖子</li>
					
					<li class="list-group-item ckk" value="/Admin/Index/danmu">弹幕管理</li>
					<li class="list-group-item ckk" value="/Admin/Index/user_danmu">用户弹幕</li>
					<li class="list-group-item ckk" value="/Admin/Index/post_danmu">帖子弹幕</li>
					<li class="list-group-item ckk" value="/Admin/Index/danmu_fobidden">弹幕屏蔽</li>
					
					<li class="list-group-item ckk" value="/Admin/Index/all_ad">广告管理</li>
					<li class="list-group-item"><span class="label label-info">Level<?php echo ($_SESSION['admin']['level']); ?>:<?php echo (uid($_SESSION['user']['uid'])); ?></span></li>
					<li class="list-group-item"><a href="/Admin/Index/logout" class="btn btn-danger">登出</a></li>
				</ul>
			</div>
		</div>
		<iframe class="col-md-10 ckk_iframe" id="myiframe" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" height="12000px;" src="/Admin/Index/danmu" ></iframe>
	</div>
	<script type="text/javascript">
		$(".ckk").click(function(){
			var src=$(this).attr("value");
			$(".ckk_iframe").attr("src",src);
		})
	</script>
	</div>
</body>
</html>