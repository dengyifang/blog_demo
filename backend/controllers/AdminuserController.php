<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\includes\Page;
use common\models\Adminuser;
use backend\models\AdminSignUp;
use common\models\AuthAssignment;
use common\models\AuthItem;

class AdminuserController extends Controller{

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

/**
  *后台操作员列表
  */
    public function actionAdminuserList($username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
       $rr = $this->pageAdminuserList($username,$mobile,$email,$page,$pagenum);
       $ajaxAdminuser = $this->renderPartial("ajax-adminuser-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
       return $this->renderPartial("adminuser-list",['ajaxAdminuser' => $ajaxAdminuser]);
    }
/**
  *局部刷新分页功能
  */
   public function actionAjaxAdminuserList($username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
      $rr = $this->pageAdminuserList($username,$mobile,$email,$page,$pagenum);
      $ajaxAdminuser = $this->renderPartial("ajax-adminuser-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
      return json_encode(['error' => 1,'msg' => "查询成功",'ajaxAdminuser' => $ajaxAdminuser]);
   }

/**
  *后台操作员分页功能
  */
   private function pageAdminuserList($username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
       $count = Adminuser::find()
          ->andFilterWhere([
                'username' => $username,
                'mobile' => $mobile,
                'email' => $email,
            ])
          ->count();

       $Page = new Page($count,$pagenum,$page);
       $records = Adminuser::find()
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
    *后台操作员的开启
    */
   public function actionAdminuserOpen($pl,$username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
      if(!Yii::$app->user->can("statusAdmin")){
         return json_encode(['error' => 4,'msg' => "你无操作此应用的权限"]);
         exit();
      }
      $pl = json_decode($pl);
      if(!count($pl)){
        return json_encode(['error' => 3,'msg' => "请选择要开启的项"]);
        exit();
      }
      foreach($pl as $v){
        if(!Adminuser::updateAll(['is_open' => 1],"id = $v")){
              return json_encode(['error' => 2,'msg' => "操作失败"]);
              exit();
        }
      }
      $rr = $this->pageAdminuserList($username,$mobile,$email,$page,$pagenum);
      $ajaxAdminuser = $this->renderPartial("ajax-adminuser-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
      return json_encode(['error' => 1,'msg' => "查询成功",'ajaxAdminuser' => $ajaxAdminuser]);      
   }

   /**
    *后台操作员的开启
    */
   public function actionAdminuserClose($pl,$username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
       if(!Yii::$app->user->can("statusAdmin")){
         return json_encode(['error' => 4,'msg' => "你无操作此应用的权限"]);
         exit();
      }
      $pl = json_decode($pl);
      if(!count($pl)){
        return json_encode(['error' => 3,'msg' => "请选择要关闭的项"]);
        exit();
      }
      foreach($pl as $v){
        if(!Adminuser::updateAll(['is_open' => 0],"id = $v")){
              return json_encode(['error' => 2,'msg' => "操作失败"]);
              exit();
        }
      }
      $rr = $this->pageAdminuserList($username,$mobile,$email,$page,$pagenum);
      $ajaxAdminuser = $this->renderPartial("ajax-adminuser-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
      return json_encode(['error' => 1,'msg' => "查询成功",'ajaxAdminuser' => $ajaxAdminuser]);      
   }


   /**
    *后台操作员的删除
    */
   public function actionAdminuserDelete($pl,$username ='',$mobile = "",$email = "",$page = 1,$pagenum = 30){
       if(!Yii::$app->user->can("deleteAdmin")){
         return json_encode(['error' => 4,'msg' => "你无操作此应用的权限"]);
         exit();
      }      
      $pl = json_decode($pl);
      if(!count($pl)){
         return json_encode(['error' => 3,'msg' => "请选择要删除的项"]);
         exit();
      }
      foreach($pl as $v){
         if(!Adminuser::deleteAll(['id' => $v])){
            return json_encode(['error' => 2,"msg" => "操作失败"]);
            exit();
          }
      }
      $rr = $this->pageAdminuserList($username,$mobile,$email,$page,$pagenum);
      $ajaxAdminuser = $this->renderPartial("ajax-adminuser-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
      return json_encode(['error' => 1,'msg' => "查询成功",'ajaxAdminuser' => $ajaxAdminuser]);          
   }

   /**
    *后台操作员的新增
    */
   public function actionAdminuserAdd($username = "",$password = "",$email = "",$mobile = ""){
      //$msg = '';
      $msg = [];
      if(Yii::$app->request->isAjax){
        $adminSignUp = new AdminSignUp();
        $adminSignUp->username = $username;
        $adminSignUp->password = $password;
        $adminSignUp->mobile = $mobile;
        $adminSignUp->email = $email;
        if($adminSignUp->validate()){
            if($adminSignUp->signup()){
              return json_encode(['error' => 1,"msg" => '管理员注册成功']);
              exit();
            }
        }else{
            $errors = $adminSignUp->getErrors();
            foreach($errors as $k => $v){
               $msg[$k] = $v[0];
            }
            return json_encode(['error' => 2,"msg" => $msg]);
            exit();
        }
     }
     return $this->renderPartial("adminuser-add");
   }


   /**
    *后台人员权限设置
    */

   public function actionAdminuserQuanxian($id){

       $allPrivileges = AuthItem::find()
                        ->select(['name','description'])
                        ->where(['type' => 1])
                        ->orderBy('description')
                        ->all();
       foreach($allPrivileges as $v){
           $allPrivilegesArray[$v->name] = $v->description;
       }

       //当前用户的权限
       $AuthAssignments = AuthAssignment::find()
                          ->select(['item_name'])
                          ->where(['user_id' => $id])
                          ->orderBy('item_name')
                          ->all();
       $AuthAssignmentsArray = [];
       foreach($AuthAssignments as $AuthAssignment){
           array_push($AuthAssignmentsArray,$AuthAssignment->item_name);
       }

       if($newPri = Yii::$app->request->post('newPri')){
          AuthAssignment::deleteAll('user_id=:id',[':id'=>$id]);
          $arrlength = count($newPri);
          for($x=0;$x<$arrlength;$x++){
              $aPri = new AuthAssignment();
              $aPri->item_name = $newPri[$x];
              $aPri->user_id = $id;
              $aPri->created_at = time();
              $aPri->save();
          }
          $this->redirect(['site/member','action' => 'operator']);
       }
       return $this->renderPartial("privilege",['AuthAssignmentArray' => $AuthAssignmentsArray,'allPrivilegesArray' => $allPrivilegesArray]);
   }

   /**
    *后台操作员的密码重置
    */
    public function actionResetPassword(){
         if(Yii::$app->request->get('id') != Yii::$app->user->id){
            return json_encode(['error' => 3,"msg" => "你无权修改其他管理员密码！"]);
            exit();
         }
         $newPassword = rand(10000000,99999999);
         $Adminuser = Adminuser::findOne(Yii::$app->request->get('id'));
         $Adminuser->setPassword($newPassword);
         if($Adminuser->save()){
             return json_encode(['error' => 1,"msg" => "新密码:".$newPassword]);
         }else{
             return json_encode(['error' => 2,"msg" => "重置失败"]);
         }
    }












}