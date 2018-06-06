<?php
/**
 * @desc Created by PhpStorm.
 * @author: 莫名私下里
 * @since: 2018/6/6 11:21
 * 后台首页控制器
 */
class IndexAction extends CommonAction
{
    /**
     * 后台首页
     */
    public function index()
    {
        $this->display();
    }
    /**
     *  用户信息
     */
    Public function copy () {
        $time = date('Y-m-d H:i:s');
        $ip = get_client_ip();
        $info = <<<str
    {$_SESSION['uname']} 您好！<br/>
    您上一次登录时间是：{$_SESSION['logintime']}<br/>
    您本次的登录时间是：{$time}<br/>
    您上一次登录IP是：{$_SESSION['loginip']}<br/>
    您的本次登录IP是：{$ip}
str;
        echo $info;
    }
    /**
     *  退出登录
     */
    Public function loginOut () {
        session_unset();
        session_destroy();
        $this->redirect('Login/index');
    }


}