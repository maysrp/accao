<?php
namespace Common\Controller;
use Think\Controller;
class BaseController extends Controller {
    public function _initialize(){
        header("Content-Type: Text/Html;Charset=UTF-8");
        //获取当前Url此地方写成函数是为了方便多地方调用
        $Action_Url = getActionUrl();

        //说明：Admin模块 Public控制器  checkLogin方便检测以后登录成功以后保存SESSION['S_AUTHID']
        //14行 只是简单写了一下，如果有SESSION则过滤  与21行$auth->check($Action_Url, 1) 里面 1 到时候需要动态获取

        //检测是否登录  目前默认是没有登录
        if( !$_SESSION['S_AUTHID'] ){                //********将此处取反***********
            // 还没登录 跳转到登录页面
            redirect(PHP_FILE . C('USER_AUTH_GATEWAY'));
        }

        //权限检测
        $auth =  new \Think\Auth();
        //$auth->check('您要访问的权限地址', '用户ID')
        if (!$auth->check($Action_Url, 1)) {        //********将此处取用户ID 1改为用户ID 2***********
            $this->error('没有权限！');
        }
    }
}