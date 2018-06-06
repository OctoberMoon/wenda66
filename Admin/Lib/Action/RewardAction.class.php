<?php
/**
 * Created by PhpStorm.
 * User: 莫名私下里
 * Date: 2018/6/6 21:38
 */

class RewardAction extends CommonAction {

    /**
     *  金币奖励页面视图
     */
    public function index () {
        $this->display();
    }

    /**
     *  修改奖励设置
     */
    public function edit () {
        $file = './Conf/config.php';
        $config = array_merge(include $file, array_change_key_case($_POST, CASE_UPPER));
        $str = "<?php\r\nreturn " . var_export($config, true) . ";\r\n?>";
        if (file_put_contents($file, $str)) {
            $this->success('修改成功', $_SERVER['HTTP_REFERER']);
        } else {
            $this->error('修改失败');
        }
    }

    /**
 *      经验级别规则设置视图
     */
    public function level () {
        $this->display();
    }
}