<?php
return array(
	/* 模块访问 */
	'MODULE_ALLOW_LIST'    =>  array('Home','Admin'), 						// 配置所有分组列表
	'MODULE_DENY_LIST'     =>  array('Common','Runtime'),    				// 禁止访问的分组列表
	'DEFAULT_MODULE'       =>  'Home', 									// 访问时默认分组

	/* 数据库设置一 采用PDO方式 */
	'DB_TYPE'   		   => 'mysql', 										// 数据库类型
	'DB_USER'   		   => 'root', 										// 用户名
	'DB_PWD'    		   => '',											// 密码
	'DB_PREFIX'            => 'think_', 									// 数据库表前缀 
	'DB_DSN'    		   => 'mysql:host=localhost;dbname=thinkphp;charset=UTF8',

	/* 数据库设置二 采用MySQL方式 */
	// 'DB_TYPE'              =>  'mysql',     								// 数据库类型
	// 'DB_HOST'              =>  'localhost', 								// 服务器地址
	// 'DB_NAME'              =>  'thinkphp',          						// 数据库名
	// 'DB_USER'              =>  'root',      								// 用户名
	// 'DB_PWD'               =>  '',          								// 密码
	// 'DB_PORT'              =>  '3306',        							// 端口
	// 'DB_PREFIX'            =>  'think_',    								// 数据库表前缀
	// 'DB_PARAMS'            =>  array(), 									// 数据库连接参数
	// 'DB_DEBUG'  		      =>  TRUE, 									// 数据库调试模式 开启后可以记录SQL日志
	// 'DB_LITE'              =>  false,    								// 使用数据库Lite模式
	// 'DB_FIELDS_CACHE'      =>  true,        								// 启用字段缓存
	// 'DB_CHARSET'           =>  'utf8',      								// 数据库编码默认采用utf8
	// 'DB_DEPLOY_TYPE'       =>  0, 										// 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
	// 'DB_RW_SEPARATE'       =>  false,       								// 数据库读写是否分离 主从式有效
	// 'DB_MASTER_NUM'        =>  1, 										// 读写分离后 主服务器数量
	// 'DB_SLAVE_NO'          =>  '', 										// 指定从服务器序号
	//'SESSION_TYPE'          => 'Db',        								// 数据库存储

	/* 全局过滤配置 */
    'DEFAULT_FILTER' 	   => 'strip_tags,stripslashes', 					// 全局过滤函数

    /* 标签库 */
    //'TAGLIB_BUILD_IN'    =>    'cx,article'								// 是否加入为内置标签
    //'TAGLIB_PRE_LOAD'    =>    ''											// 是否加入为内置标签

	/* URL设置 */
	'URL_CASE_INSENSITIVE' =>  true,   										// 默认false 表示URL区分大小写 true则表示不区分大小写
	'URL_MODEL'            =>  2,       									// URL访问模式,可选参数0、1、2、3,代表以下四种模式：0 (普通模式); 1 (PATHINFO 模式); 2 (REWRITE  模式); 3 (兼容模式)  默认为PATHINFO 模式
	'URL_PATHINFO_DEPR'    =>  '/',    										// PATHINFO模式下，各参数之间的分割符号
	'URL_HTML_SUFFIX'      =>  'html',  									// URL伪静态后缀设置
	'URL_DENY_SUFFIX'      =>  'css|js|ico|png|gif|jpg|ttf|eot|woff|svg', 	// URL禁止访问的后缀设置
	'URL_PARAMS_BIND'      =>  true, 										// URL变量绑定到Action方法参数
	'URL_PARAMS_BIND_TYPE' =>  0, 											// URL变量绑定的类型 0 按变量名绑定 1 按变量顺序绑定
	'URL_404_REDIRECT'     =>  '', 											// 404 跳转页面 部署模式有效
	'URL_ROUTER_ON'        =>  false,   									// 是否开启URL路由
	'URL_ROUTE_RULES'      =>  array(), 									// 默认路由规则 针对模块
	'URL_MAP_RULES'        =>  array(), 									// URL映射定义规则
	
	/* 模板引擎设置 */
	'TMPL_CONTENT_TYPE'    =>  'text/html', 								// 默认模板输出类型
	'TMPL_TEMPLATE_SUFFIX' =>  '.html',     								// 默认模板文件后缀
	'TMPL_FILE_DEPR'       =>  '/', 										//模板文件CONTROLLER_NAME与ACTION_NAME之间的分割符
	'TMPL_CACHFILE_SUFFIX' =>  '.php',      								// 默认模板缓存后缀
	'TMPL_DENY_FUNC_LIST'  =>  'echo,exit',    								// 模板引擎禁用函数
	'TMPL_DENY_PHP'        =>  false, 										// 默认模板引擎是否禁用PHP原生代码
	'TMPL_L_DELIM'         =>  '{',            								// 模板引擎普通标签开始标记
	'TMPL_R_DELIM'         =>  '}',            								// 模板引擎普通标签结束标记

	/* 权限认证 */
	'AUTH_ON'              => true,                      					// 认证开关
	'AUTH_TYPE'            => 1,                         					// 认证方式，1为实时认证；2为登录认证。
	'AUTH_GROUP'           => 'think_auth_group',        				    // 用户组数据表名
	'AUTH_GROUP_ACCESS'    => 'think_auth_group_access', 					// 用户-用户组关系表
	'AUTH_RULE'            => 'think_auth_rule',         					// 权限规则表
	'AUTH_USER'            => 'think_member',             					// 用户信息表
);