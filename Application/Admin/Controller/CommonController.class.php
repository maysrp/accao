<?php
namespace Admin\Controller;
use Think\Controller,
	Common\Controller\BaseController;
class CommonController extends BaseController {
	public function _initialize() {
		parent::_initialize();
	}

	/**
	 * [fuck 非法操作提醒]
	 * @author [阶级娃儿] <[<email 262877348@qq.com>]>
	 */
	protected function fuck(){
		$this->error('非法操作！');
	}
}
