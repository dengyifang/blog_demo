<?php

namespace frontend\controllers;

use Yii;
use frontend\models\Post;
use frontend\models\PostSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * WxController implements the CRUD actions for Post model.
 */
class WxController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }
   
    /**
     *用户
     *获取特定用户信息
     */
    public function actionMemberInfo(){
         $app = Yii::$app->wechat->app;
         #or $app = new \EasyWeChat\Foundation\Application(Yii::$app->params['WECHAT']);
         $userService = $app->user;
         $user = $userService->get("oe3PmwbfSlg352sXldn7D713iZyg");
         return '<img src = "'.$user->headimgurl.'"/>';
    }

    /**
     *用户
     *获取用户列表
     */
    public function actionMemberList(){
         $app = Yii::$app->wechat->app;
         $userService = $app->user;
         return $user = var_dump(json_decode($userService->lists(),true));
    }

    /**
     *用户标签
     *获取所有的标签
     */
    public function actionLabel(){
         $app = Yii::$app->wechat;
         $tag = $app->user_tag;
         return $tag->lists();
    }
   
    /**
     *给指定用户发送消息
     */
    public function actionMessage(){
         $wechat = Yii::$app->wechat;
         $broadcast = $wechat->broadcast;
         return $broadcast->send("text", "我是客服人员","oe3PmwbfSlg352sXldn7D713iZyg");
         //return $broadcast->status(3147493689);

    }

    /**
     *access token的获取
     */
    public function actionAccessToken(){
         $wechat = Yii::$app->wechat;
         $access_token = $wechat->access_token;
         $token = $access_token->getToken();
         return $token;
    }

    /**
     *微信粉丝的变动统计
     */
    public function actionFans(){
         $wechat = Yii::$app->wechat;
         $stats = $wechat->stats;
         //$userSummary = $stats->userSummary('2017-03-09 00:00:00','2017-03-09 23:59:59');
         $userSummary = $stats->userCumulate('2017-03-10 00:00:00','2017-03-10 23:59:59');         
         var_dump($userSummary);         
    }

    /**
     *客服管理
     */
    public function actionKefuList(){
        $wechat = Yii::$app->wechat;
        $staff = $wechat->staff;
        //return $staff->lists();#获取所有客服列表
        //return $staff->onlines(); #获取在线客服列表
        return $records = $staff->records('2017-03-11 00:00:00', '2017-03-11 23:59:59', 1, 20);//$staff->records($startTime, $endTime, $pageIndex, $pageSize);
    }

    /**
     *客服绘会话状态管理
     */
    public function actionKefuStatus(){
         $wechat = Yii::$app->wechat;
         $session = $wechat->staff_session; // 客服会话管理
         return $session->waiters();
    }

    /**
     *jssdk
     */
    public function actionJsSdk(){
         $wechat = Yii::$app->wechat;
         $js = $wechat->js;
         return  $js->config(array('onMenuShareQQ', 'onMenuShareWeibo'), true);//true 为json false为数组
    }

    /**
     *获取菜单模块
     */
    public function actionMenuQuery(){
        $wechat = Yii::$app->wechat;
        $menu = $wechat->menu;
        $menus = $menu->all();
        return $menus;
    }   

    /**
     *获取自定义菜单
     */
    public function actionZidingMenu(){
        $wechat = Yii::$app->wechat;
        $menu = $wechat->menu;
        $menus = $menu->current();
        return $menus;
    }


    /**
     *创建临时二维码
     */
    public function actionErweiCode(){
         $wechat = Yii::$app->wechat;
         $qrcode = $wechat->qrcode;
         $result = $qrcode->temporary(56, 6 * 24 * 3600);
         $ticket = $result->ticket;// 或者 $result['ticket']
         $expireSeconds = $result->expire_seconds; // 有效秒数
         $url = $result->url; // 二维码图片解析后的地址，开发者可根据该地址自行生成需要的二维码图片
         $url = $qrcode->url($ticket);
         return '<img src = "'.$url.'"/>';
    }
    
    /**
     *创建永久二维码
     */
    public function actionForeverCode(){
         $wechat = Yii::$app->wechat;
         $qrcode = $wechat->qrcode;
         $result = $qrcode->forever(56);// 或者 $qrcode->forever("foo");
         $ticket = $result->ticket; // 或者 $result['ticket']
         $url = $result->url;
         $url = $qrcode->url($ticket);
         return '<img src = "'.$url.'"/>';
    }


    /**
     *模板消息发送
     */
    public function actionMubanSend(){
        $wechat = Yii::$app->wechat;
        $notice = $wechat->notice;
        $messageId = $notice->send([
        'touser' => 'oe3PmwT-XJP0M2vvvy7toV2K0O1g',
        'template_id' => 'GJxrkAzYBeVWGc6H90NoIiEQuJA6XmX8BEquBuPnaok',
        'url' => 'http://www.baidu.com',
        'data' => [
           "first"  => "微信模版消息测试！",
           "product" => "iphone 7 plus",
           "description" => "苹果手机最新版！",
           "remark" => "欢迎再次购买！",
        ],
       ]);
      return $messageId;
    }






}
