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
		<div class="col-md-4 col-md-offset-4" style="margin-top:200px;border-radius: 5px;background-color: #AFAFAF" >
	<form method="post" action="">
		<div class="text-center"><h3>管理员</h3></div>
		<input type="text" name="username" class="form-control" style="margin: 5px;" placeholder="用户名">
		<input type="password" name="password" class="form-control" style="margin: 5px;" placeholder="密码">
		<div class="text-center" style="margin: 5px;">
			<button class="btn btn-success">登入</button>
			<input type="reset" name="reset" value="重置" class="btn btn-danger">
		</div>
	</form>
</div>
	</div>
</body>
</html>