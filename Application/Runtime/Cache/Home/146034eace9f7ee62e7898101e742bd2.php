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
	<div class="row">
		<div class="col-md-3 col-md-xs-6">
			<h2 ><a href="/">Nyaa动漫</a></h2>
		</div>
		<div class="col-md-4 col-md-xs-6" style="margin-top:20px; ">
			<form action="/Home/Index/search" >
			<div class="input-group">
			<input type="text" placeholder="搜索一下" class="form-control" name="search">
				<div class="input-group-btn">
					<button class="btn btn-danger"><span class="glyphicon glyphicon-search"></span></button>
				</div>
			</div>
			</form>
		</div>
		<div class="col-md-3 col-md-offset-2">
			<a href="/Home/User" class="btn btn-link" title="用户中心 <?php echo ($_SESSION['user']['name']); ?>"><img src="/Home/User/avatar/uid/<?php echo ($_SESSION['user']['uid']); ?>" width="70px" class="img-circle"></a>
		</div>
	</div>
</div>

<div class="container-fluid show_header_image" style="background-image:url(http://bilibara.com/images/2017/02/08/maxresdefault.jpg);">
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
			<script src="https://cdn.bootcss.com/messenger/1.5.0/js/messenger.min.js"></script>
	<link href="https://cdn.bootcss.com/messenger/1.5.0/css/messenger.min.css" rel="stylesheet">
	<link href="https://cdn.bootcss.com/messenger/1.5.0/css/messenger-theme-future.min.css" rel="stylesheet">
	<div class="row">
		<div class="row" style="background: #FFF;margin-top:50px; ">
			<div class="col-md-2 col-md-offset-1" >
				<img src="/Home/User/avatar/uid/<?php echo ($_GET['uid']); ?>/type/big" class="img-circle"  width="100px" style="border:5px;margin-top:-50px; ">
			</div>
			<div class="col-md-3">
				<h2><b ><?php echo (uid($_GET['uid'])); ?> </b> <small>投稿:<?php echo ($user['post']); ?>    关注:<?php echo ($user['follow']); ?>    粉丝:<?php echo ($user['fans']); ?></small></h2>
			</div>
			<div class="col-md-3 text-right" >
				<?php echo (is_fans($_GET['uid'])); ?>
			</div>
		</div>
	</div>
	<div class="row" style="margin-top:20px; ">
		<div class="row" style="background: #FFF">
			<div class="row" style="margin: 20px;">
				<p>
					<span style="font-size: 30px; margin: 10px;" class="text-muted select" id="all">综合</span>
					<span style="font-size: 30px; margin: 10px;" class="text-muted select" id="video">视频</span>
					<span style="font-size: 30px; margin: 10px;" class="text-muted select" id="post">文章</span>
				</p>
			</div>
			<hr/>
			<?php if(is_array($info)): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="col-md-6 post_div" style="padding: 10px;" value="<?php echo ($vo['pid']); ?>">
					<h3>
						<a href="/Home/Index/Post/pid/<?php echo ($vo['pid']); ?>">
							<?php if($vo['is_video']): ?><span class="glyphicon glyphicon-film" title="视频"></span> 
							<?php else: ?>
								<span class="glyphicon glyphicon-book" title="文章"></span><?php endif; ?>
							<?php echo ($vo['title']); ?>
						</a>
					</h3>
					<p>
						<small>发布于:<?php echo (date("Y/m/d H:i",$vo['time'])); ?> 围观:<?php echo ($vo['view']); ?> 评论:<?php echo (comment($vo['pid'])); ?></small>
					</p>
					<?php if($vo['image']): ?><img  class="img-thumbnail hide " src="<?php echo ($vo['image']); ?>" width="40%" id="<?php echo ($vo['pid']); ?>"><?php endif; ?>
				</div><?php endforeach; endif; else: echo "" ;endif; ?>
		</div>
	</div>

	<script type="text/javascript">

		$("#<?php echo ($_GET['type']); ?>").removeClass("text-muted");
		$("#<?php echo ($_GET['type']); ?>").addClass("text-danger");
		$("#<?php echo ($_GET['type']); ?>").css("font-weight","bold");

		$(".follow").click(function(){
			$.ajax({
				url:'/Home/Index/follow/uid/<?php echo ($_GET['uid']); ?>',
				success:function(data){
					if(data.status){
						var value=$(".follow").attr("value");
						if(value=="label-default"){
							$(".follow").attr("value","label-danger");
							$(".follow").removeClass("label-default");
							$(".follow").addClass("label-danger");
							$(".follow").text("关注");
							mx=Messenger().post(data.con);
						}else{
							$(".follow").attr("value","label-default");
							$(".follow").removeClass("label-danger");
							$(".follow").addClass("label-default");
							$(".follow").text("已经关注");
							mx=Messenger().post(data.con);
						}
					}else{
						mx=Messenger().post(data.con);
					}
				}
			})
		});
		$(".select").click(function(){
		var value=$(this).attr("id");
			window.location.href="?type="+value;
		})
		$("body").css('background','url(http://bilibara.com/images/2017/02/08/maxresdefault.jpg)');
		$(".post_div").mouseover(function(){
			var value=$(this).attr("value");
			$("#"+value).removeClass('hide');
		});
		$(".post_div").mouseleave(function(){
			var value=$(this).attr("value");
			$("#"+value).addClass('hide');
		})
	</script>
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