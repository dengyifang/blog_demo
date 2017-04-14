<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\includes\Page;
use common\models\User;

class UserController extends Controller{
        /**
     * @inheritdoc
     */
    public function behaviors()
    {
      return [
       'access' => [
          'class' => AccessControl::className(),
          'except'=>[],
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

    public function actionUserList($username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
       $rr = $this->pageUserList($username,$mobile,$email,$page,$pagenum);
       $ajaxUser = $this->renderPartial("ajax-user-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
       return $this->renderPartial("user-list",['ajaxUser' => $ajaxUser]);
    }

   public function actionAjaxUserList($username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
      $rr = $this->pageUserList($username,$mobile,$email,$page,$pagenum);
      $ajaxUser = $this->renderPartial("ajax-user-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
      return json_encode(['error' => 1,'msg' => "查询成功",'ajaxUser' => $ajaxUser]);
   }


    private function pageUserList($username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
       $count = User::find()
          ->andFilterWhere([
                'username' => $username,
                'mobile' => $mobile,
                'email' => $email,
            ])
          ->count();

       $Page = new Page($count,$pagenum,$page);
       $records = User::find()
          ->andFilterWhere([
                'username' => $username,
                'mobile' => $mobile,
                'email' => $email,
            ])
          ->offset($Page->firstRow)
          ->limit($Page->listRows)
          ->all();
      $Page->setConfig('theme', ' <span class="total">共 %totalRow% %header% %nowPage%/%totalPage% 页</span> %first%%upPage%%prePage%%linkPage%%nextPage%%downPage%%end%'); 
      $page = $Page->show_js("page_js");
      $rr = ["count"=>$count,"list"=>$records,"pagestr"=>$page];
      return $rr;
    }

   /**
    *会员的开启
    */
   public function actionUserOpen($pl,$username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
      $pl = json_decode($pl);
      if(!count($pl)){
        return json_encode(['error' => 3,'msg' => "请选择要开启的项"]);
        exit();
      }
      foreach($pl as $v){
        if(!User::updateAll(['status' => 10],"id = $v")){
              return json_encode(['error' => 2,'msg' => "操作失败"]);
              exit();
        }
      }
      $rr = $this->pageUserList($username,$mobile,$email,$page,$pagenum);
      $ajaxUser = $this->renderPartial("ajax-user-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
      return json_encode(['error' => 1,'msg' => "查询成功",'ajaxUser' => $ajaxUser]);      
   }

   /**
    *会员的关闭
    */
   public function actionUserClose($pl,$username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
      $pl = json_decode($pl);
      if(!count($pl)){
        return json_encode(['error' => 3,'msg' => "请选择要关闭的项"]);
        exit();
      }
      foreach($pl as $v){
        if(!User::updateAll(['status' => 0],"id = $v")){
              return json_encode(['error' => 2,'msg' => "操作失败"]);
              exit();
        }
      }
      $rr = $this->pageUserList($username,$mobile,$email,$page,$pagenum);
      $ajaxUser = $this->renderPartial("ajax-user-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
      return json_encode(['error' => 1,'msg' => "查询成功",'ajaxUser' => $ajaxUser]);      
   }

   public function actionUserDelete($pl,$username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
      $pl = json_decode($pl);
      if(!count($pl)){
         return json_encode(['error' => 3,'msg' => "请选择要删除的项"]);
         exit();
      }
      foreach($pl as $v){
         if(!User::deleteAll(['id' => $v])){
            return json_encode(['error' => 2,"msg" => "操作失败"]);
            exit();
          }
      }
      $rr = $this->pageUserList($username,$mobile,$email,$page,$pagenum);
      $ajaxUser = $this->renderPartial("ajax-user-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
      return json_encode(['error' => 1,'msg' => "查询成功",'ajaxUser' => $ajaxUser]);          
   }


  /**
    *会员的密码重置
    */
    public function actionResetPassword(){
         $newPassword = rand(10000000,99999999);
         $User = User::findOne(Yii::$app->request->get('id'));
         $User->setPassword($newPassword);
         if($User->save()){
             return json_encode(['error' => 1,"msg" => "新密码:".$newPassword]);
         }else{
             return json_encode(['error' => 2,"msg" => "重置失败"]);
         }
    }









}