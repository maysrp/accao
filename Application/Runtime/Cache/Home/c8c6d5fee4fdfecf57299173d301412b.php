<?php if (!defined('THINK_PATH')) exit();?> 

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="https://cdn.bootcss.com/messenger/1.5.0/js/messenger.min.js"></script>
	<link href="https://cdn.bootcss.com/messenger/1.5.0/css/messenger.min.css" rel="stylesheet">
	<link href="https://cdn.bootcss.com/messenger/1.5.0/css/messenger-theme-future.min.css" rel="stylesheet">
</head>	
<body>
<div class="container">
	<div class="row">
		<div class="panel panel-default">
			<table class="table">
				<tr>
					<th>文章名</th>
					<th>关注时间</th>
					<th>操作</th>
				</tr>
				<?php if(is_array($info)): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr id="<?php echo ($vo['pid']); ?>">
						<td><?php echo (pidname($vo['pid'])); ?></td>
						<td><?php echo (date("Y/m/d H:i",$vo['time'])); ?></td>
						<td><span class="del_save glyphicon glyphicon-trash text-danger" value="<?php echo ($vo['pid']); ?>"></span></td>
					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
			</table>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(".del_save").click(function(){
		var pid=$(this).attr("value");
		$.ajax({
			url:'/Home/Save/del/pid/'+pid,
			success:function(data){
				if(data.status){
					confirm(data.con);
					$("#"+pid).remove();
				}else{
					confirm("失败:"+data.con);
				}
			}
		})
	})
</script>