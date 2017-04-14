<?php
namespace frontend\components;
use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use frontend\models\PostCatg;
use common\includes\CommonUtility;

class PostCatgWidget extends Widget{
      public $where = [];
      public $orderBy = 'id';
      public $item = null;
      public $params = [];
      
      public function init(){
		parent::init();
	  }

      public function run(){
          $postCatg = PostCatg::find()
                      ->where($this->where)
                      ->orderBy($this->orderBy)
                      ->all();
          if(!$postCatg){
          	   $this->item = "无相应的栏目";
          }else{
               
          	    $this->params['model'] = $postCatg;
                $this->item = $this->renderFile(CommonUtility::getWidgetViewPath()."/post-catg/menu-item.php",$this->params);
          }
          return $this->item;
      }








}