<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\models\PostCatg;
/**
 * Site controller
 */
class PostCatgController extends Controller
{   
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
   *首页栏目列表
   */
    public function actionPostCatgList(){
        $postCatg = PostCatg::find()
                    ->all();
        $ajaxPostCatg = $this->renderPartial('ajax-post-catg',['model' => $postCatg]);
        return $this->renderPartial('post-catg',['ajaxPostCatg' => $ajaxPostCatg]);
      }

 /**
   *首页栏目的删除
   */
    public function actionDeletePostCatgList($pl){
           $pl = json_decode($pl);
           if (!count($pl)){
                return json_encode(['error' => 1,'msg' => '请选择要批量删除的内容']);
                exit();
           };
            foreach($pl as $v){
                if(!PostCatg::deleteAll(['id' => $v])){
                  return json_encode(['error' => 2,'msg' => '操作失败']);
                  exit();
                }
            };
           $postCatg = PostCatg::find()
                    ->all();
           $ajaxPostCatg = $this->renderPartial('ajax-post-catg',['model' => $postCatg]);          
           return json_encode(['error' => 3,'msg' => '批量删除成功','Tpl' => $ajaxPostCatg]);
      }
  
  /**
    *首页栏目的显示[操作]
    */
    public function actionShowPostCatgList($pl){
           $pl = json_decode($pl);
           if(!count($pl)){
               return json_encode(['error' => 1,'msg' => '请选择要批量显示的内容']);
               exit();
           };
           foreach($pl as $v){
               if(!PostCatg::updateAll(['is_show' => 1],"id = {$v}")){
                  return json_encode(['error' => 2,'msg' => '操作失败']);
                  exit();
               }
           };
           $postCatg = PostCatg::find()
                    ->all();
           $ajaxPostCatg = $this->renderPartial('ajax-post-catg',['model' => $postCatg]);          
           return json_encode(['error' => 3,'msg' => '批量显示成功','Tpl' => $ajaxPostCatg]);

    }
  /**
    *首页栏目的关闭[操作]
    */
    public function actionClosePostCatgList($pl){
           $pl = json_decode($pl);
           if(!count($pl)){
               return json_encode(['error' => 1,'msg' => '请选择要批量关闭的内容']);
               exit();
           };
           foreach($pl as $v){
               if(!PostCatg::updateAll(['is_show' => 0],"id = {$v}")){
                  return json_encode(['error' => 2,'msg' => '操作失败']);
                  exit();
               }
           };
           $postCatg = PostCatg::find()
                    ->all();
           $ajaxPostCatg = $this->renderPartial('ajax-post-catg',['model' => $postCatg]);          
           return json_encode(['error' => 3,'msg' => '批量关闭成功','Tpl' => $ajaxPostCatg]);
    }

    /**
      *首页栏目更新[操作]
      */
    public function actionUpdatePostCatgList($id,$catgName = "",$catgUrl = ""){
          $postCatgModel = PostCatg::findOne($id);
          $postCatgModel->catg_name = $catgName;
          $postCatgModel->catg_url = $catgUrl;
          if($postCatgModel->save()){
            $postCatg = PostCatg::find()
                    ->all();
            $ajaxPostCatg = $this->renderPartial('ajax-post-catg',['model' => $postCatg]);   
            return json_encode(['error' => 1,"msg" => "栏目更新成功","Tpl" => $ajaxPostCatg]);
          }else{
            return json_encode(['error' => 2,"msg" => "操作失败"]);
          }
    }


    /**
      *首页栏目添加
      */
    public function actionAddPostCatgList($catgName = "",$catgUrl = ""){
          $postCatgModel = new PostCatg();
          $postCatgModel->catg_name = $catgName;
          $postCatgModel->catg_url = $catgUrl;
          $postCatgModel->is_show = 1;
          if($postCatgModel->save()){
            $postCatg = PostCatg::find()
                    ->all();
            $ajaxPostCatg = $this->renderPartial('ajax-post-catg',['model' => $postCatg]);     
            return json_encode(['error' => 1,"msg" => "栏目添加成功","Tpl" => $ajaxPostCatg]);
          }else{
            return json_encode(['error' => 2,"msg" => "操作失败"]);            
          }
    }

}

