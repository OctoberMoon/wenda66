<?php

/**
 * @desc Created by PhpStorm.
 * @author: 莫名私下里
 * @since: 2018/6/6 11:57
 */
class LoginAction extends Action
{
    /**
     *  后台登录页
     */
    public function index()
    {
        $this->display();
    }

    /**
     *  登录验证
     */
    public function login()
    {
        if(!$this -> isPost()) halt('页面不存在');
        if ($_SESSION['verify'] != $this->_post('code', 'md5')) {
            $this ->error('验证码错误');
        }
        $account = $this ->_post('username');
        $pwd = $this ->_post('password','md5');
        $where = array('account'=> $account);
        $db = M('admin');
        $user = $db->where($where)->find();

        if(!$user || $user['password'] != $pwd){
            $this->error('账号或密码错误');
        }

        if($user['lock']){
            $this->error('账号被锁定');
        }

        $data =array(
          'id' => $user['id'],
          'logintime'=> time(),
          'loginip' => get_client_ip()
        );
        $db->save($data);

        session('uid',$user['id']);
        session('uname',$user['account']);
        session('logintime',date('Y-m-d H:i:s',$user['logintime']));
        session('loginip',$user['loginip']);
        redirect(__APP__);
    }

    /**
     * 异步验证管理员登录账号
     */
    public function checkAccount()
    {
        if(!$this->isAjax()){
            halt('页面不存在');
        }

        $account = $this->_post('username');
        $where = array('account'=> $account);

        if(M('admin')->where($where)->count('id')){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     * 异步验证管理员密码
     */
    public function checkPwd()
    {
        if(!$this->isAjax()){
            halt('页面不存在');
        }
        $account = $this->_post('username');
        $pwd = $this->_post('password','md5');
        $where = array('account'=> $account);

        $password = M('admin')->where($where)->getField('password');
        if($password && $password == $pwd){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     * 异步验证验证码
     */
    public function checkVerify()
    {
        if(!$this->isAjax()){
            halt('页面不存在');
        }
        if ($_SESSION['verify'] == $this->_post('code', 'md5')) {
            echo 1;
        } else {
            echo 0;
        }
    }

    /**
     * 验证码图片
     */
    public function verify()
    {
        import('ORG.Util.Image');
        Image::buildImageVerify();
    }
}