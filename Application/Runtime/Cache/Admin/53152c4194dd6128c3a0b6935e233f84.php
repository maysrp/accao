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
		<div class="row" style="margin: 5px;">
  <form>
    <div class="input-group col-sm-6 col-sm-offset-6">
      <input type="number" placeholder="帖子的pid" name="pid" class="form-control">
      <div class="input-group-btn">
        <button class="btn btn-primary">提交</button>
      </div>
    </div>
  </form>
</div>
	<div class="row">
		<div class="row">
		<div class="panel panel-default">
  		<div class="panel-heading"><h4>《<?php echo (pidname($_GET['pid'])); ?>》的弹幕管理</h4></div>
			<table class="table">
				<tr >
					<th>
						弹幕ID
					</th>
					<th>
						视频
					</th>
					<th>
						发布人
					</th>
					<th>
						发布时间
					</th>
					<th>
						内容
					</th>
					<th>
						操作
					</th>
				</tr>
				<?php if(is_array($info)): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr id="<?php echo ($vo['id']); ?>">
						<td><?php echo ($vo['id']); ?></td>
						<td><?php echo (pidname($vo['pid'])); ?></td>
						<td><a href="/Admin/Index/user_danmu/uid/<?php echo ($vo['uid']); ?>"><?php echo (uid($vo['uid'])); ?></a></td>
						<td><?php echo (date("Y/m/d H:i",$vo['time'])); ?></td>
						<td><?php echo (danmu($vo['danmu'])); ?></td>
						<td>
							<span class="glyphicon glyphicon-trash text-danger delete" value="<?php echo ($vo['id']); ?>"></span>
						</td>
					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
			</table>
		</div>
		</div>
		<div class="row text-center">
			<?php echo ($page); ?>
		</div>
		</div>
	</div>
	<script type="text/javascript">
		$(".delete").click(function(){
			var id=$(this).attr('value');
			$.ajax({
				url:"/Admin/Index/danmu_del/id/"+id,
				success:function(data){
					if(data.status){
						$("#"+id).remove();
					}else{
						confrim("删除失败，未知原因！");
					}
				}
			})
		})
		
	</script>
	</div>
</body>
</html>