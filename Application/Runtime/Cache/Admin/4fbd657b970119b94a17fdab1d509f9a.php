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

	<div class="row">
		<h3><?php echo ($post['title']); ?></h3>
		<h5 class="text-muted">
			<span class="glyphicon glyphicon-user text-primary" title="发布时间"></span> <?php echo (uid($post['uid'])); ?>
			| <span class="glyphicon glyphicon-time text-primary" title="发布时间"></span> <?php echo (date("Y/m/d H:i",$post['time'])); ?> 
			| <span class="glyphicon glyphicon-pencil text-primary" title="修改时间"></span>
			<?php if($vo['edit_time']): echo (date("Y/m/d H:i",$post['edit_time'])); ?>
			<?php else: ?>
				<?php echo (date("Y/m/d H:i",$post['time'])); endif; ?>
			| <span class="glyphicon glyphicon-book text-primary" title="阅读量"></span> <?php echo ($post['view']); ?>
			| <span class="glyphicon glyphicon-star text-success" title="收藏数"></span> <?php echo ($post['save']); ?>
		</h5>
	</div>
	<?php if($post['is_video']): ?><div class="css">
			<link href="/plugins/danmu/css/scojs.css" rel="stylesheet">
  			<link href="/plugins/danmu/css/colpick.css" rel="stylesheet">
  			<link href="/plugins/danmu/css/bootstrap.css" rel="stylesheet">
  			<link rel="stylesheet" href="/plugins/danmu/css/main.css">
		</div>
		<div id="danmu"></div>
		<div class="js">
			<script src="/plugins/danmu/js/jquery-2.1.4.min.js"></script>
			<script src="/plugins/danmu/js/jquery.shCircleLoader.js"></script>
			<script src="/plugins/danmu/js/sco.tooltip.js"></script>
			<script src="/plugins/danmu/js/colpick.js"></script>
			<script src="/plugins/danmu/js/jquery.danmu.js"></script>
			<script src="/plugins/danmu/js/main.js"></script>
		</div>
		<script type="text/javascript">
			$("#danmu").DanmuPlayer({
    			src:"<?php echo ($post['video_url']); ?>",
    			height: "480px", //区域的高度
    			width: "800px" //区域的宽度
    			,urlToGetDanmu:"/Home/Danmu/index/pid/<?php echo ($post['pid']); ?>"
   				,urlToPostDanmu:"/Home/Danmu/send/pid/<?php echo ($post['pid']); ?>"
  			});
  			$("video").attr('poster',"<?php echo ($post['image']); ?>");
		</script>
		<?php if($_SESSION['user']['uid']== NULL): ?><script type="text/javascript">
				$(".danmu-input").attr('placeholder','登入后才能发送弹幕！');
				$(".danmu-input").attr('readonly','readonly');
				$(".send-btn").html("<a class=\"text-danger\" href=\"/Home/User/login\">请先登入</a>");
			</script>
		<?php else: endif; ?>
	<?php else: ?>
		<div class="row">
			<div class="row">
				<?php echo ($post['post']); ?>
			</div>
			<div class="row">
			<hr/>
			</div>
		</div><?php endif; ?>
</div>

</div>
	</div>
</body>
</html>