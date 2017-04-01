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
		<div id="index" value="<?php echo index ?>">
</div>
<div class="row">
	<div class="row">
		<?php if(is_array($info)): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="row post" value="<?php echo ($vo['pid']); ?>">
			<div class="col-md-1 col-xs-1" >
				<div  id="<?php echo ($vo['pid']); ?>" style="background: #5BB75B;width: 60px;height: 60px; ">
					<a href="/Home/Index/post/pid/<?php echo ($vo['pid']); ?>">
						<h3 class="text-right" style="color: #FFF"><b> <?php echo (comment($vo['pid'])); ?></b></h3>
						<h4 class="text-right" style="color: #FFF"> 评论</h4>
					</a>
				</div>
			</div>
			<div class="col-md-11 col-xs-11" >
				<h3 >
					<?php if($vo['is_video']): ?><span class="text-primary glyphicon glyphicon-film" title="视频"></span>
  					<?php else: ?>
  						<span class="glyphicon glyphicon-book" title="文章"></span><?php endif; ?>
					<a href="/Home/Index/post/pid/<?php echo ($vo['pid']); ?>"><?php echo ($vo['title']); ?></a>
				</h3>
				<p>
					<small class="text-muted">
						发布时间:<?php echo (date("Y/m/d H:i",$vo['time'])); ?>|
						最后修改时间:
						<?php if($vo['edit_time']): echo (date("Y/m/d H:i",$vo['edit_time'])); ?>
						<?php else: ?>
							<?php echo (date("Y/m/d H:i",$vo['time'])); endif; ?>
						围观:<?php echo ($vo['view']); ?>
						收藏:<?php echo (savepid($vo['pid'])); ?>
						评论:<?php echo (comment($vo['pid'])); ?>
					</small>
				</p>
				<div>
				<?php if($vo['image']): ?><img  class="img-thumbnail" src="<?php echo ($vo['image']); ?>" width="500px;"><?php endif; ?>
				</div>
			</div>
		</div>
		<hr><?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
</div>
<div class="row addd">
	<?php ad_1() ?>
</div>
<script type="text/javascript">
	$(".post").mouseover(function(){
		var pid=$(this).attr("value");
		$("#"+pid).css("background","#0187C5");
		$("#"+pid).animate({"margin-left":"-5px"},120);  
	})
	$(".post").mouseleave(function(){
		var pid=$(this).attr("value");
		$("#"+pid).css("background","#5BB75B");
		$("#"+pid).animate({"margin-left":"5px"},100);

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