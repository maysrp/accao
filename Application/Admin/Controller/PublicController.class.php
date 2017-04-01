<?php
namespace Admin\Controller;
use Think\Controller;
class PublicController extends Controller {
    public function index(){
        redirect(PHP_FILE . C('USER_AUTH_GATEWAY'));
    }

    public function login(){
    	header("Content-Type: Text/Html;Charset=UTF-8");
    	echo '这是登录页面';
    }
}