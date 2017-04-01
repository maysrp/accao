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
		<script type="text/javascript" src="/plugins/ue/ueditor.config.js"></script>  
<script type="text/javascript" src="/plugins/ue/ueditor.all.js"></script> 
<div class="row">
<div class="row">
<div class="panel panel-default">
<div class="panel-heading"><h4>编辑帖子</h4></div>
<div class="col-md-9" style="padding:20px">
    <form action="" method="post">
        <div class="row" style="padding:5px">
            <input type="text" name="title" class="form-control" placeholder="标题" value="<?php echo ($info['title']); ?>">
        </div>
        <div class="row" style="padding:5px">
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-picture"></span>
                </div>
                <input type="text" name="image" class="form-control" value="<?php echo ($info['image']); ?>">
            </div>
        </div>
        <div class="row" style="padding:5px">
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-film"></span>
                </div>
                <input type="text" name="video_url" class="form-control" value="<?php echo ($info['video_url']); ?>">
            </div>
        </div>
        <div class="row" style="padding:5px">
            <textarea name="post" id="post" style="height:450px;"><?php echo ($info['post']); ?></textarea>
        </div>
        <div class="row text-right" style="padding:10px">
            <a class="btn btn-default" onclick="window.history.go(-1)">取消发布</a>
            <button class="btn btn-primary">发布文章</button>
        </div>
    </form>
</div>
</div>
</div>
</div>
<script type="text/javascript">
    UE.getEditor('post' ,{
        toolbars: [
            [
                'source', //源代码
                'blockquote', //引用
                'insertcode', //代码语言
                'undo', //撤销
                'redo', //重做
                'bold', //加粗
                'italic', //斜体
                'underline', //下划线
                'strikethrough', //删除线
                'fontfamily', //字体
                'forecolor', //字体颜色
                'fontsize', //字号
                'link', //超链接
                'unlink', //取消链接
                'emotion', //表情
                'backcolor', //背景色
                'insertimage', //多图上传
                'attachment', //附件
                'removeformat', //清除格式
                'horizontal', //分隔线
                'inserttable', //插入表格
                'fullscreen', //全屏
            ]
        ]
    }
        )
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