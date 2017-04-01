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
		<div class="panel panel-default">
  		<div class="panel-heading "><h4>弹幕屏蔽</h4></div>
			<table class="table">
				<tr>
					<th>禁止词语</th>
					<th>替换词语</th>
					<th>操作</th>
				</tr>
				<?php if(is_array($info)): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr id=<?php echo ($vo['fid']); ?>>
						<td id="forbidden_<?php echo ($vo['fid']); ?>"><?php echo ($vo['forbidden']); ?></td>
						<td id="changeto_<?php echo ($vo['fid']); ?>"><?php echo ($vo['changeto']); ?></td>
						<td>
							<span class="text-primary glyphicon glyphicon-pencil change" title="修改" value="<?php echo ($vo['fid']); ?>"></span>
							|
							<span class="text-danger glyphicon glyphicon-trash delete" title="删除" value="<?php echo ($vo['fid']); ?>"></span>
						</td>
					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
				<tr class="add_one">
					<td></td>
					<td></td>
					<td><span class="text-success glyphicon glyphicon-plus" title="添加"></span></td>
				</tr>
			</table>
		</div>
		</div>
		</div>
	</div>


	<div class="modal fade dm" rolr="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">弹幕屏蔽</h3>
				</div>
				<div class="modal-body">
					<div>
						<input type="hide" name="fid" class="hide fid" >
						<input type="text" name="station" class="form-control forbidden" placeholder="屏蔽词语" style="margin:5px;">
						<input type="text" name="station" class="form-control changeto" placeholder="替换词语：默认为***" style="margin:5px;">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        			<button type="button" class="btn btn-primary dm_up" >提交</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(".add_one").click(function(){
			$(".fid").val("");
			$(".forbidden").val("");
			$(".changeto").val("");
			$('.dm').modal('show');
		})
		$(".change").click(function(){
			var fid=$(this).attr("value");
			var changeto=$("#changeto_"+fid).text();
			var forbidden=$("#forbidden_"+fid).text();
			$(".fid").val(fid);
			$(".forbidden").val(forbidden);
			$(".changeto").val(changeto);
			$('.dm').modal('show');
		})
		$(".dm_up").click(function(){
			var fid=$(".fid").val();
			var forbidden=$(".forbidden").val();
			var changeto=$(".changeto").val();
			if(fid){
				$.ajax({
					method:'post',
					url:'/Admin/Index/danmu_fobidden_change',
					data:{
						type:'change',
						fid:fid,
						forbidden:forbidden,
						changeto:changeto
					},
					success:function(data){
						if(data.status){
							$("#forbidden_"+fid).text(forbidden);
							$("#changeto_"+fid).text(changeto);
							$('.dm').modal('hide');
						}else{
							confrim("错误:权限不符！");
						}
					}
				})
			}else{
				$.ajax({
					method:'post',
					url:'/Admin/Index/danmu_fobidden_change',
					data:{
						type:'add',
						forbidden:forbidden,
						changeto:changeto
					},
					success:function(data){
						if(data.status){
							//刷新
							window.history.go(0);
						}else{
							confrim("错误:权限不符！");
						}
					}
				})
			}
		})
		$(".delete").click(function(){
			var fid=$(this).attr("value");
			$.ajax({
				method:'post',
				url:'/Admin/Index/danmu_fobidden_change',
				data:{
					fid:fid,
					type:'delete'
				},
				success:function(data){
					if(data.status){
							$("#"+fid).remove();
						}else{
							confrim("错误:权限不符！");
						}
				}
			})
		})

	</script>
	</div>
</body>
</html>