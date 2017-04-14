<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\AdminLoginForm;

/**
 * Site controller
 */
class SiteController extends Controller
{   
    public $params = [];
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
      return [
       'access' => [
          'class' => AccessControl::className(),
          'except'=>['login'],
          'rules' => [
          [
            'allow' => true,
            'roles' => ['@'],
          ],
        ],
      ],
      'verbs' => [
        'class' => VerbFilter::className(),
        'actions' => [
          'logout' => ['post','get'],
         ],
       ],
     ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }


    public function actionBasic($oper = "",$action = ""){
        $this->params['banner'] = "basic";
        if(empty($action)){
            $action = 'catg';
        }

        switch($action){
              case "catg":
               $righttitle = "基础设置->栏目设置";
               $rightstr = Yii::$app->runAction('post-catg/post-catg-list');
              break;
              case 'lantern':
               $righttitle = "基础设置->首页幻灯";
               $rightstr = Yii::$app->runAction('lantern/lantern-list');
              break;
        }

        $this->params['action'] = $action;
        $this->params['oper'] = $oper;
        $this->params['righttitle'] = $righttitle;
        $this->params['rightstr'] = $rightstr;
        return $this->render("../index",$this->params);
    }

    public function actionMember($oper = "",$action = ""){
        $this->params['banner'] = "member";
        if(empty($action)){
            $action = 'operator';
        }
        switch($action){
              case "operator":
                  if($oper == ""){
                    $righttitle = "会员管理->后台操作员";
                    $rightstr = Yii::$app->runAction("adminuser/adminuser-list");                    
                  }else if($oper == "operAdd"){
                    $righttitle = "会员管理->后台操作员->新增操作员"; 
                    $rightstr = Yii::$app->runAction('adminuser/adminuser-add');
                  }else if($oper == "operQuanxian"){
                    $righttitle = "会员管理->后台操作员->权限设置";
                    $rightstr = Yii::$app->runAction('adminuser/adminuser-quanxian',['id' => Yii::$app->request->get('id')]);
                  }
              break;
              case 'member':
               $righttitle = "会员管理->网站会员";
               $rightstr = Yii::$app->runAction("user/user-list");
              break;
        }
        $this->params['action'] = $action;
        $this->params['oper'] = $oper;
        $this->params['righttitle'] = $righttitle;
        $this->params['rightstr'] = $rightstr;
        return $this->render("../index",$this->params);
    }

    public function actionContent($oper = "",$action = ""){
        $this->params['banner'] = "content";
        if(empty($action)){
            $action = 'boke';
        }
        switch($action){
              case "boke":
              if($oper == ""){
                $righttitle = "内容管理->博客列表";
                $rightstr = Yii::$app->runAction("post/post-list");               
              }else if($oper == "boke_detail"){
                $righttitle = "内容管理->博客列表->博客详情";
                $rightstr = Yii::$app->runAction('post/detail-post',['id' => Yii::$app->request->get('id')]);
              }
              break;
              case 'boke_fabu':
               $righttitle = "内容管理->发布博客";
               $rightstr = Yii::$app->runAction('post/post-fabu');

              break;
              case 'comment':
               $righttitle = "内容管理->评论列表";
               $rightstr = "<h2>评论列表</h2>";

              break;
        }
        $this->params['action'] = $action;
        $this->params['oper'] = $oper;
        $this->params['righttitle'] = $righttitle;
        $this->params['rightstr'] = $rightstr;
        return $this->render("../index",$this->params);
    }


















    public function actionLogin()
    {   
        $this->layout = false;
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new AdminLoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
}
