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
		<a href="/Home/User" class="btn btn-link" title="用户:<?php echo ($_SESSION['user']['name']); ?>"><img src="/Home/User/avatar/uid/<?php echo ($_SESSION['user']['uid']); ?>" width="100px" class="img-circle"></a>
	</div>
</div>

<div class="row" style="background-image:url(http://bilibara.com/images/2017/02/08/maxresdefault.jpg);">
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
	<div class="container">
			<div class="row">
		<div class="row">
			<div class="col-md-4 col-md-offset-4" style="margin-top:200px;border-radius: 10px;background-color: #EAEAEA;  ">
				<form action="/Home/User/slogin" method="post">
					<div class="row text-center" style="margin: 5px;">
						<h3>用户登入</h3>
					</div>
					<input type="text" name="username" class="form-control" style="margin: 5px;">
					<input type="password" name="password" class="form-control" style="margin: 5px;">
					<div class=" text-center" style="margin: 5px;">
						<button class="btn btn-success">登入</button>
						<a href="/Home/User/join" class="btn btn-primary">注册</a>
					</div>
				</form>
			</div>
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