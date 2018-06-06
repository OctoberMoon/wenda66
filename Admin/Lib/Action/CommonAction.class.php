<?php
/**
 * @desc Created by PhpStorm.
 * @author: 莫名私下里
 * @since: 2018/6/6 15:43
 * 公共控制器
 */

class CommonAction extends Action
{
    /**
     * tp自动运行的方法
     */
    public function _initialize()
    {
        if(!isset($_SESSION['uid']) || !isset($_SESSION['uname'])){
            $this->redirect('Login/index');
        }
    }
}