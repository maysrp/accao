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
	<title><?php echo ($post['title']); ?></title>
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

<div  class="container-fluid" style="background:#FAFAFA">
<div class="container">
<div class="col-md-10 col-md-offset-1">
	<div class="row" style="margin-left:5px; ">
		<h3><?php echo ($post['title']); ?></h3>
		<h5 class="text-muted">
			<span class="glyphicon glyphicon-user text-primary" title="发布时间"></span> <?php echo (uid($post['uid'])); ?>
			| <span class="glyphicon glyphicon-time text-primary" title="发布时间"></span> <?php echo (date("Y/m/d H:i",$post['time'])); ?> 
			| <span class="glyphicon glyphicon-pencil text-primary" title="修改时间"></span>
			<?php if($vo['edit_time']): echo (date("Y/m/d H:i",$post['edit_time'])); ?>
			<?php else: ?>
				<?php echo (date("Y/m/d H:i",$post['time'])); endif; ?>
			| <span class="glyphicon glyphicon-eye-open text-primary" title="阅读量"></span> <?php echo ($post['view']); ?>
			| <span class="glyphicon glyphicon-star text-success" title="收藏数"></span> <?php echo (savepid($post['pid'])); ?>
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
<script type="text/javascript">  			
function exitFullscreen() {
  if(document.exitFullscreen) {
    document.exitFullscreen();
  } else if(document.mozCancelFullScreen) {
    document.mozCancelFullScreen();
  } else if(document.webkitExitFullscreen) {
    document.webkitExitFullscreen();
  }
 $(".full-screen").attr("onclick","launchFullScreen(document.documentElement)");
}
function launchFullScreen(element) { 
 if(element.requestFullscreen) { 
  element.requestFullscreen(); 
 } else if(element.mozRequestFullScreen) { 
  element.mozRequestFullScreen(); 
 } else if(element.webkitRequestFullscreen) { 
  element.webkitRequestFullscreen(); 
 } else if(element.msRequestFullscreen) { 
  element.msRequestFullscreen(); 
 } 
 $(".full-screen").attr("onclick","exitFullscreen()")
} 
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
				<?php if($post['image']): ?><img src="<?php echo ($post['image']); ?>" width="400px;"><?php endif; ?>
			</div>
			<div class="row">
				<?php echo ($post['post']); ?>
			</div>
			<div class="row">
			<hr/>
			</div>
		</div><?php endif; ?>
	<div class="row">
		<hr>
		<div class="col-md-6">
			<div class="btn btn-danger save" style="background:#FD4C4C;">收藏 <span class="glyphicon glyphicon-star text-center" ></span></div> 
		</div>
		<div class="col-md-6" >
			<img src="/Home/User/avatar/uid/<?php echo ($post['uid']); ?>/type/small" class="img-circle"/> <span> <?php echo (uid($post['uid'])); ?></span> <a href="">关注</a>
		</div>
	</div>
</div>
</div>
</div>
<div class="container-fluid" style="background:#FFF">
	<div class="container" >
		<link rel="stylesheet" type="text/css" href="/static/css/comment.css">
<link rel="stylesheet" href="/plugins/em/lib/css/jquery.mCustomScrollbar.min.css"/>
<link rel="stylesheet" href="/plugins/em/dist/css/jquery.emoji.css"/>
<link rel="stylesheet" href="/plugins/em/lib/css/railscasts.css"/>
<link rel="stylesheet" href="/plugins/em/dist/css/index.css"/>
<script src="/plugins/em/lib/script/jquery.min.js"></script>
<script src="/plugins/em/lib/script/highlight.pack.js"></script>
<script src="/plugins/em/lib/script/jquery.mousewheel-3.0.6.min.js"></script>
<script src="/plugins/em/lib/script/jquery.mCustomScrollbar.min.js"></script>
<script src="/plugins/em/dist/js/jquery.emoji.min.js"></script>
<script src="/static/js/time.js"></script>
<style>
	.emoji_icon{
		width:66px;
	}

</style>
<div class="col-md-10 col-md-offset-1">
	<div class="row" >
	<?php if($_SESSION['user']['uid']== NULL): ?><div class="col-md-12" style="margin-top:20px;">
			<div class="row text-center">
					<b><a href="/Home/User/login">登入</a>或者<a href="/Home/User/join">注册</a></b>
			</div>
		</div>
	<?php else: ?>
		<div class="col-md-12" style="margin-top:20px;padding:20px;border:1px solid #BBB;" >
			<a name="replay"></a>
			<span class="text-muted" style="margin:10px;">用户:<?php echo ($_SESSION['user']['name']); ?> <b class="rep text-primary"> </b></span>
			<input type="number" class="hide" name="cid" id="cid">
			<input type="number" class="hide" name="relou" id="relou">
			<div class="row"  style="margin:10px;">
				<div class="row">
					<img  id="btn" src="/plugins/em/dist/img/acfun/6.gif" width="25px;">
				</div>
				<div>
					<div style="border:solid 1px #EEE;border-radius:5px; height:150px;" id="com" contenteditable="true" class="row" ></div>
				</div>
				<div class="row text-right" style="margin-top:5px;">
					<button class="btn btn-info comment_click">回复</button>
				</div>
			</div>
		</div><?php endif; ?>
	</div>
	<div class="row comment" style="margin-top:40px;">
		
	</div>
	<div class="row page text-center">
		<div class="row">
			<div class="col-md-2 col-md-offset-5">
				<span>共<span class="pl"></span>条评论跳转到: <span contentEditable="true" class="text-info" id="num">1</span>页 <button class="jump btn-sm btn btn-info">跳页</button></span>
			</div>
		</div>
		<div class="row">
			<span class="glyphicon glyphicon-chevron-up" onClick="page_pre()"></span>
			<span class="xpage"></span>
			<span class="glyphicon glyphicon-chevron-down" onClick="page_next()"></span>
		</div>
	</div>
</div>


<script type="text/javascript">
	var page=1;
	var count=1
	comment(page,<?php echo ($post['pid']); ?>)
	function comment(page,pid) {
		$.ajax({
			url:'/Home/Comment/show/pid/'+pid+'/page/'+page,
			beforeSend:function(data){
				$(".comment").html("");
				var loading=$("<div class=\"text-center\"><img src=\"/static/img/loading.gif\"/></div>");
				loading.appendTo(".comment");
			},
			success:function(data){
				if(data.status){
					all_page=data.con.count/25;
					count=data.con.count;
					show(data.con.comment);//评论
					page=data.con.page;
					xpage();
					pl();
				}else{
					$(".comment").html("<div class=\"text-center\"><h2 class=\"text-muted\">暂无评论</h2></div>");
				}
			}

		})
	}
	function show(data){
		$(".comment").html("");
		for(x in data){
			var box=$("<div class=\"row comment_list\"></div>")
			var image=$("<div class=\"user col-md-1\"><a name=\""+data[x].lou+"\"></a><img class=\"img-rounded\" src=\"/Home/User/avatar/uid/"+data[x].uid+"/type/small\"/></div>");
			var div_c=$("<div class=\"col-md-11\"></div>");
			if(data[x].relou>0){
				var relou=$("<div  class=\"row text-warning\">回复#"+data[x].relou+"</di>");
				relou.appendTo(div_c);

			}
			var user=$("<div class=\"row\"><div class=\"col-md-6 text-primary\">#"+data[x].lou+" "+data[x].name+"</div><small class=\"col-md-6 text-right\"><span class=\"text-primary\" onClick=\"re("+data[x].cid+","+data[x].lou+")\">回复 </span>发布于:"+gettime(data[x].time)+"</small> </div>");
			var comment=$("<div class=\"row\">"+data[x].comment+"</div>");
			$("<hr>").appendTo(".comment");
			user.appendTo(div_c);
			comment.appendTo(div_c);
			image.appendTo(box);
			div_c.appendTo(box);
			box.appendTo(".comment");
		}
		show_ac();
	}
	function add(data){
		var box=$("<div class=\"row comment_list\"></div>")
			var image=$("<div class=\"user col-md-1\"><a name=\""+data.lou+"\"></a><img class=\"img-rounded\" src=\"/Home/User/avatar/uid/"+data.uid+"/type/small\"/></div>");
			var div_c=$("<div class=\"col-md-11\"></div>");
			if(data.relou>0){
				var relou=$("<div  class=\"row text-warning\">回复#"+data.relou+"</di>");
				relou.appendTo(div_c);

			}
			var user=$("<div class=\"row\"><div class=\"col-md-6 text-primary\">#"+data.lou+" "+data.name+"</div><small class=\"col-md-6 text-right\"><span class=\"text-primary\" onClick=\"re("+data.cid+","+data.lou+")\">回复 </span>发布于:"+gettime(data.time)+"</small> </div>");
			var comment=$("<div class=\"row\">"+data.comment+"</div>");
			//$("<hr>").prependTo(".comment");
			user.appendTo(div_c);
			comment.appendTo(div_c);
			image.appendTo(box);
			div_c.appendTo(box);
			box.prependTo(".comment");
			show_ac();
			pl();
	}
	$(".comment_click").click(function(){
		var com=$("#com").html();
		var cid=$("#cid").val();
		var relou=$("#relou").val();
		console.log(com);
		$.ajax({
			url:'/Home/Comment/add',
			method:'post',
			data:{
				ccid:cid,
				comment:com,
				pid:<?php echo ($post['pid']); ?>,
				relou:relou
			},
			success:function(data){
				if(data.status){
					count=count+1;
					add(data.con);
					$("#com").text("");
					$("#com").text("已经发布评论！");
					$("#cid").val("");
					$("#relou").val("");
					$(".rep").text("");
				}else{
					confirm(data.con);
				}
			}

		})
	})


	hljs.initHighlightingOnLoad();
	$("#com").emoji({
			button: "#btn",
            showTab: true,
            animation: 'fade',
            icons: [ {
            name: "AC娘",
            path: "/plugins/em/dist/img/acfun/",
            maxNum: 54,
            file: ".gif",
            placeholder: "#acfun_{alias}#"
        }]
        });
	function show_ac(){
		$(".comment_list").emojiParse({
            icons: [
            {   path: "/plugins/em/dist/img/acfun/",
                maxNum: 54,
                file: ".gif",
                placeholder: "#acfun_{alias}#"
            }
            ]
        })
	}
	function page_pre(){
		page=page-1;
		if(page>0){
			comment(page,<?php echo ($post['pid']); ?>)
		}
	}
	function page_next(){
		page=page+1;
		if(page<=Math.ceil(count/25)){
			comment(page,<?php echo ($post['pid']); ?>)
		}
	}
	function re(cid,lou){
		$(".rep").text("回复"+lou+"楼:");
		$("#relou").val(lou);
		$("#cid").val(cid);
		location.href = "#replay"; 


	}
	function xpage(){
		var now="第"+page+"页/共"+Math.ceil(count/25)+"页";
		$(".xpage").html(now);
	}
	function pl(){
		$(".pl").text(count);
	}
	$(".jump").click(function(){
		page=$("#num").text();
		if(page<=Math.ceil(count/25)&&page>0){
			comment(page,<?php echo ($post['pid']); ?>);
		}
	})

</script>
	
	</div>
</div>

<div class="container-fluid" style="background:#F3F3F3">
	<div class="container">
		<div class="row addd">
			<?php ad_2() ?>
		</div>
	</div>
</div>
</body>

<script type="text/javascript">
	$(".save").click(function(){
		$.ajax({
			url:'/Home/Save/click/pid/<?php echo ($post['pid']); ?>',
			success:function(data){
				if(data.status){
					mx=Messenger().post(data.con);
				}else{
					mx=Messenger().post("添加失败:"+data.con);
				}
			}
		})
	})








</script>
</html>