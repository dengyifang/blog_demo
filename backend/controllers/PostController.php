<?php
namespace backend\controllers;
use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\includes\Page;
use backend\models\Post;

class PostController extends Controller{
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
          'boke-fabu' => ['post'],
         ],
       ],
     ];
    }
    public $enableCsrfValidation = false;
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

    public function actionPostList($authName = "",$title = "",$catgId = "",$sdate = "",$edate = "",$page = 1,$pagenum = 20){
        $rr = $this->pagePostList($authName,$title,$catgId,$sdate,$edate,$page,$pagenum);
        $ajaxPost = $this->renderPartial("ajax-post-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
        return $this->renderPartial('post-list',['ajaxPost' => $ajaxPost]);
    }
   
    public function actionAjaxPostList($authName = "",$title = "",$catgId = "",$sdate = "",$edate = "",$page = 1,$pagenum = 20){
        $rr = $this->pagePostList($authName,$title,$catgId,$sdate,$edate,$page,$pagenum);
        $ajaxPost = $this->renderPartial("ajax-post-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
        return json_encode(['error' => 1,"ajaxPost" => $ajaxPost]);
    }


    private function pagePostList($authName = "",$title = "",$catgId = "",$sdate = "",$edate = "",$page = 1,$pagenum = 20){

       $count = Post::find()
                ->select(["{{%post}}.*","{{%adminuser}}.username","{{%post_catg}}.catg_name"])
                ->join("LEFT JOIN",'{{%adminuser}}',"{{%adminuser}}.id = {{%post}}.author_id")
                ->join("LEFT JOIN",'{{%post_catg}}',"{{%post_catg}}.id = {{%post}}.catg_id")
                ->andFilterWhere(['{{%adminuser}}.username' => $authName])
                ->andFilterWhere(['like',"{{%post}}.title",$title])
                ->andFilterWhere(['>',"{{%post}}.create_time",$sdate?strtotime($sdate." 00:00:00"):""])
                ->andFilterWhere(['<',"{{%post}}.create_time",$edate?strtotime($edate." 23:59:59"):""])
                ->andFilterWhere(["{{%post}}.catg_id" => $catgId==-1?"":$catgId])
                ->asArray()
                ->count();
       $Page = new Page($count,$pagenum,$page);
       $records = Post::find()
                ->select(["{{%post}}.*","{{%adminuser}}.username","{{%post_catg}}.catg_name"])
                ->join("LEFT JOIN",'{{%adminuser}}',"{{%adminuser}}.id = {{%post}}.author_id")
                ->join("LEFT JOIN",'{{%post_catg}}',"{{%post_catg}}.id = {{%post}}.catg_id")
                ->andFilterWhere(['{{%adminuser}}.username' => $authName])
                ->andFilterWhere(['like',"{{%post}}.title",$title])
                ->andFilterWhere(['>',"{{%post}}.create_time",$sdate?strtotime($sdate." 00:00:00"):""])
                ->andFilterWhere(['<',"{{%post}}.create_time",$edate?strtotime($edate." 23:59:59"):""])
                ->andFilterWhere(["{{%post}}.catg_id" => $catgId==-1?"":$catgId])
                ->offset($Page->firstRow)
                ->limit($Page->listRows)
                ->asArray()
                ->all();
       $Page->setConfig('theme', ' <span class="total">共 %totalRow% %header% %nowPage%/%totalPage% 页</span> %first%%upPage%%prePage%%linkPage%%nextPage%%downPage%%end%'); 
       $page = $Page->show_js("page_js");
       $rr = ["count"=>$count,"list"=>$records,"pagestr"=>$page];
       return $rr;        
    }

    public function actionDeletePost($pl,$authName = "",$title = "",$catgId = "",$sdate = "",$edate = "",$page = 1,$pagenum = 20){
           if(!Yii::$app->user->can("deletePost")){
              return json_encode(['error' => 4,"msg" => "你无操作此应用的权限"]);
              exit();
           }
           $pl = json_decode($pl);
           if(!count($pl)){
              return json_encode(['error' => 3,"msg" => "请选择要删除的项"]);
              exit();
           }
           foreach ($pl as $v) {
              if(!Post::deleteAll(['id' => $v])){
                 return json_encode(['error' => 2,"msg" => "操作失败"]);
                 exit();
              }
           }
        $rr = $this->pagePostList($authName,$title,$catgId,$sdate,$edate,$page,$pagenum);
        $ajaxPost = $this->renderPartial("ajax-post-list",['list' => $rr['list'],'count' => $rr['count'],'pagestr' => $rr['pagestr']]);
        return json_encode(['error' => 1,"msg" => "操作成功","ajaxPost" => $ajaxPost]);
    }

    public function actionDetailPost($id){
        if(!$id){
          return "<p style = 'color:red;'>缺少参数id;<p>";
          exit();
        }
        $post = Post::findOne($id);
        return $this->renderPartial('post-detail',['model' => $post]);
    }

    public function actionPostFabu(){
        if(!Yii::$app->user->can('creatPost')){
             return "你无操作此应用的权限";
             exit();
        }
        if(Yii::$app->request->isAjax){
            $postModel = new Post();
            $postModel->title = $_POST['title'];
            $postModel->tags = $_POST['tags'];
            $postModel->catg_id = $_POST['catg_id'];
            $postModel->cover_url = $_POST['cover_url'];
            $postModel->content = $_POST['content'];
            $postModel->status = 1;
            $postModel->create_time = time();
            $postModel->update_time = time();
            $postModel->author_id = Yii::$app->user->id;
            $postModel->read_count = 0;
            if($postModel->save()){
                return json_encode(['error' => 1,'msg' => "已成功发布！"]);
                exit();
            }else{
                $errorInfo = '';
                foreach($postModel->getErrors() as $k => $v){
                   $errorInfo .= $v[0];
                }
                return json_encode(['error' => 2,"msg" => $errorInfo]);
                exit();
            }
        }
        return $this->renderPartial("post-fabu");
    }



}