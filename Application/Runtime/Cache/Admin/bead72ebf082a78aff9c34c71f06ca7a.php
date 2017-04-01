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
			<table class="table">
				<tr>
					<th>
						广告ID
					</th>
					<th>
						位置
					</th>
					<th>
						代码
					</th>
					<th>
						时间
					</th>
					<th>
						操作
					</th>
				</tr>
				<?php if(is_array($info)): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr id="<?php echo ($vo['adid']); ?>">
						<td>
							<?php echo ($vo['adid']); ?>
						</td>
						<td id="station_<?php echo ($vo['adid']); ?>" value="<?php echo ($vo['station']); ?>">
							<?php echo ($vo['station']); ?>
						</td>
						<td >
							<textarea id="html_<?php echo ($vo['adid']); ?>" class="form-control" style="height: 120px;"><?php echo ($vo['html']); ?></textarea>
						</td>
						<td>
							<?php echo (date("Y/m/d h:i",$vo['time'])); ?>
						</td>
						<td>
							<span class="glyphicon glyphicon-pencil text-warning change" title="修改" value="<?php echo ($vo['adid']); ?>"></span>
							|
							<span class="glyphicon glyphicon-remove text-danger delete" title="删除" value="<?php echo ($vo['adid']); ?>"></span>
						</td>

					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
				<tr id="add_one">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<span class="glyphicon glyphicon-file text-success" title="添加" ></span>
					</td>
				</tr>
			</table>			
		</div>
	</div>


	<div class="modal fade ad" rolr="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">广告</h3>
				</div>
				<div class="modal-body">
					<div>
						<input type="hide" name="adid" class="hide adid" >
						<input type="number" name="station" class="form-control station" placeholder="广告位置" style="margin:5px;">
						<textarea class="form-control html" name="html" placeholder="广告代码" style="margin:5px;height: 400px;"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        			<button type="button" class="btn btn-primary ad_up" >提交</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$("#add_one").click(function(){
			$('.station').val("");
			$('.html').html("");
			$('.ad').modal('show');
		})
		$(".ad_up").click(function(){
			var adid=$(".adid").val();
			var station=$(".station").val();
			var html=$(".html").val();
			if(adid){
				$.ajax({
					method:'post',
					url:'/Admin/Index/edit_ad',
					data:{
						station:station,
						html:html,
						adid:adid
					},
					success:function(data){
						if(data.status){
							//可能要刷新网页
							$("#station_"+adid).attr('value',station);
							$("#station_"+adid).text(station);
							$("#html_"+adid).html(html);
							$('.ad').modal('hide');
						}else{
							confrim("添加失败，可能原因权限错误");
						}
					}
				})
			}else{
				$.ajax({
					method:'post',
					url:'/Admin/Index/add_ad',
					data:{
						station:station,
						html:html
					},
					success:function(data){
						if(data.status){
							//可能要刷新网页
							window.history.go(0);
						}else{
							confrim("添加失败，可能原因权限错误");
						}
					}
				})
			}
		})
		$(".delete").click(function(){
			var adid=$(this).attr('value');
			$.ajax({
				method:'get',
				url:"/Admin/Index/del_ad/adid/"+adid,
				success:function(data){
					if(data.status){
						$("#"+adid).remove();
					}else{
						confrim("添加失败，可能原因权限错误");
					}
				}
			})
		})
		$(".change").click(function(){
			var adid=$(this).attr('value');
			var station=$("#station_"+adid).attr('value');
			var html=$("#html_"+adid).html();
			$('.adid').val(adid);
			$('.station').val(station);
			$('.html').html(html);
			$('.ad').modal('show');

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