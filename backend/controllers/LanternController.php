<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\models\Lantern;
class LanternController extends Controller
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
     *首页幻灯排序
     */
    public function actionLanternPx($id,$level = ""){
        if(!Lantern::updateAll(['level' => intval($level)],"id = $id")){
            return json_encode(['error' => 1,"msg" => "操作失败！"]);
            exit();
        }
         $lantern = Lantern::find()
                    ->orderBy("level asc")
                    ->all();
         $ajaxLantern = $this->renderPartial('ajax-lantern',['model' => $lantern]);
         return json_encode(['error' => 2,'msg' => "批量显示成功","Tpl" => $ajaxLantern]);       
    }
    
    /**
     *首页幻灯更新
     */
    public function actionLanternUpdate($id,$title = "",$img_url = "",$link_url = "",$remark = ""){
        $LanternModel = Lantern::findOne($id);
        $LanternModel->title = $title;
        $LanternModel->img_url = $img_url;
        $LanternModel->link_url = $link_url;
        $LanternModel->remark = $remark;
        if(!$LanternModel->save()){
             return json_encode(['error' => 1,"msg" => "操作失败！"]);
             exit();
        }else{
             $lantern = Lantern::find()
                    ->orderBy("level asc")
                    ->all();
             $ajaxLantern = $this->renderPartial('ajax-lantern',['model' => $lantern]);
             return json_encode(['error' => 2,"msg" => "幻灯添加成功！","Tpl" =>$ajaxLantern]);           
        }
    }



    /**
     *首页幻灯添加
     */
    public function actionLanternAdd($title = "",$img_url = "",$link_url = "",$remark = ""){
        $maxLevel = Lantern::find()->max('level');
        $LanternModel = new Lantern();
        $LanternModel->title = $title;
        $LanternModel->img_url = $img_url;
        $LanternModel->link_url = $link_url;
        $LanternModel->remark = $remark;
        $LanternModel->level = ++$maxLevel;
        if(!$LanternModel->save()){
            return json_encode(['error' => 1,"msg" => "操作失败！"]);
        }else{
            $lantern = Lantern::find()
                    ->orderBy("level asc")
                    ->all();
            $ajaxLantern = $this->renderPartial('ajax-lantern',['model' => $lantern]);
            return json_encode(['error' => 2,"msg" => "幻灯添加成功！","Tpl" =>$ajaxLantern]);
        }
    }


    /**
     *首页幻灯列表
     */    
    public function actionLanternList(){
         $lantern = Lantern::find()
                    ->orderBy("level asc")
                    ->all();
         $ajaxLantern = $this->renderPartial('ajax-lantern',['model' => $lantern]);
         return $this->renderPartial("lantern",['ajaxLantern' => $ajaxLantern]);
    }

    /**
     *首页幻灯显示
     */
    public function actionLanternShow($pl){
        $pl = json_decode($pl);
        if(!count($pl)){
            return json_encode(['error' => 1,'msg' => "请选择要批量显示的内容"]);
            exit(); 
        }

        foreach($pl as $v){
            if(!Lantern::updateAll(['is_show' => 1],"id = $v")){
                return json_encode(['error' => 2,"msg" => "操作失败！"]);
                exit();  
            }
        }
         $lantern = Lantern::find()
                    ->orderBy("level asc")
                    ->all();
         $ajaxLantern = $this->renderPartial('ajax-lantern',['model' => $lantern]);        
        return json_encode(['error' => 3,'msg' => "批量显示成功","Tpl" => $ajaxLantern]);
    }

    /**
     *首页幻灯关闭
     */
    public function actionLanternClose($pl){
         $pl = json_decode($pl);
         if(!count($pl)){
         	return json_encode(['error' => 1,"msg" => "请选择要批量关闭的幻灯！"]);
         	exit();
         }
         foreach($pl as $v){
            if(!Lantern::updateAll(['is_show' => 0],"id = $v")){
            	return json_encode(['error' => 2,"msg" => "操作失败！"]);
            }
         }

         $lantern = Lantern::find()
                    ->orderBy("level asc")
                    ->all();
         $ajaxLantern = $this->renderPartial('ajax-lantern',['model' => $lantern]);        
         return json_encode(['error' => 3,'msg' => "批量关闭成功","Tpl" => $ajaxLantern]);
    }

    /**
     *首页幻灯删除
     */
    public function actionLanternDelete($pl){
         $pl = json_decode($pl);
         if(!count($pl)){
             return json_encode(['error' => 1,"msg" => "请选择要批量删除的项！"]);
             exit();
         };
         foreach($pl as $v){
             if(!Lantern::deleteAll(['id' => $v])){
                return json_encode(['error' => 2,"msg" => "操作失败！"]);
                exit();
             }
         }

         $lantern = Lantern::find()
                    ->orderBy("level asc")
                    ->all();
         $ajaxLantern = $this->renderPartial('ajax-lantern',['model' => $lantern]);        
         return json_encode(['error' => 3,'msg' => "批量关闭成功","Tpl" => $ajaxLantern]);
    }











}