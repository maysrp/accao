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
			<div class="col-md-offset-8 col-md-4">
				<form>
					<div class="input-group">
						<input type="text" name="uid" placeholder="输入用户名查找" class="form-control">
						<div class="input-group-btn">
							<button class="btn btn-primary">搜索</button>
						</div>
					</div>
				</form>
			</div>
			</div>
			<div class="row" style="margin: 10px;">
				<?php if($user['info']['status']): ?><div class="row panel panel-default">
					<div class="panel-body">
						<div class="col-md-3 avatar">
							<img src="/Home/User/avatar/uid/<?php echo ($user['info']['con'][0]); ?>" class="img-rounded">
						</div>
						<div class="col-md-4">
							<p>用户名:<span id="user"><?php echo ($user['info']['con'][1]); ?></span> <span class="text-muted">ID:<?php echo ($user['info']['con'][0]); ?></span></p>
							<p>邮箱:<?php echo ($user['info']['con'][2]); ?></p>
							<p>今日积分:<?php echo ($user['today']); ?></p>
							<p>总积分:<span id="point"><?php echo ($user['point']['point']); ?></span></p>
						</div>
						<div class="col-md-5">
							<p>发帖数:<a href="/Admin/Index/user_post/uid/<?php echo ($user['info']['con'][0]); ?>"><?php echo ($user['post']); ?></a></p>
							<p>回帖数:<a href="/Admin/Index/user_comment/uid/<?php echo ($user['info']['con'][0]); ?>"><?php echo ($user['comment']); ?></a></p>
							<p>弹幕数:<a href="/Admin/Index/user_danmu/uid/<?php echo ($user['info']['con'][0]); ?>"><?php echo ($user['danmu']); ?></a></p>
						</div>
						<div class="row" style="padding:10px;">
							<button class="btn btn-info" id="pa">修改密码</button>
							<button class="btn btn-warning" id="po">修改积分</button>
							<button class="btn btn-danger" title="该操作是不可逆操作" id="del">删除用户</button>
						</div>
					</div>
				</div>

				<?php else: ?>
					<div class="row">
						<div class="jumbotron">
							<h1>未找到用户！</h1>
							<p>你可能输入了错误的用户名！</p>
						</div>
					</div><?php endif; ?>
			</div>
		</div>
	</div>

	<div class="modal fade zz">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">
						
					</h3>
				</div>
				<div class="modal-body">
					<input type="hide" name="uid" value="<?php echo ($user['info']['con'][0]); ?>" class="hide" id="uid">
					<input type="text"  class="form-control" id="xin">
					<input type="hide" name="uid"  class="hide" id="type">
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" id="up">提交</button>
				</div>
				
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#pa").click(function(){
			$("#xin").val("");
			$(".zz").modal('show');
			$(".modal-title").text("重置密码");
			$("#xin").attr("placeholder","请输入新的密码");
			$("#type").val("password");
		})
		$("#po").click(function(){

			var point=$("#point").text();
			$("#xin").attr("placeholder","");
			$(".zz").modal('show');
			$(".modal-title").text("修改积分");
			$("#xin").val(point);
			$("#type").val("point");
		})
		$("#del").click(function(){
			var uid=<?php echo ($user['info']['con'][0]); ?>;
			var user=$("#user").text();
			var make=confirm("该操作是不可逆操作，是否删除该用户:"+user);
			if(make){
				$.ajax({
					url:'/Admin/Index/user_del/uid/'+uid,
					success:function(data){
						if(data.status){
							confirm("删除成功！");
							history.go(0);
						}else{
							alert("删除失败;");
						}
					}
				})
			}
		})
		$("#up").click(function(){
			var type=$("#type").val();
			var xin=$("#xin").val();
			var uid=$("#uid").val();
			if(type=="password"){
				$.ajax({
					method:'post',
					url:'/Admin/Index/user_password',
					data:{
						xin:xin,
						uid:uid
					},
					success:function(data){
						if(data.status){
							confirm("密码修改成功！");
							$(".zz").modal('hide');
						}else{
							alert("错误"+data.con);
							$(".zz").modal('hide');

						}
					}
				})

			}else{
				$.ajax({
					method:'post',
					url:'/Admin/Index/user_change',
					data:{
						xin:xin,
						uid:uid
					},
					success:function(data){
						if(data.status){
							var m=confirm("积分修改成功！点击\"确定\"刷新页面！");
							if(m){
								history.go(0);
							}
						}else{
							alert("修改失败，未知错误！");
							$(".zz").modal('hide');
							
						}
					}
				})
			}
		})
	</script>
	</div>
</body>
</html>