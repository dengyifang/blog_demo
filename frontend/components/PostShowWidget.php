<?php
namespace frontend\components;

use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use frontend\models\Post;
use common\includes\CommonUtility;

class PostShowWidget extends Widget{
        public $where = [];
        public $orderBy = 'id';
        public $limit = 7;
        public $item = null;
        public $params = [];
        public $templeTpl = null;
        public function init(){
            parent::init();
        }
        
        public function run(){
             if(! strpos($this->templeTpl, '.php'))
			 {
				$this->templeTpl .= '.php';
			 }
             $post = Post::find()
                     ->where($this->where)
                     ->orderBy($this->orderBy)
                     ->limit($this->limit);
             $model = $post->all();
             if(!$count = count($model)){
                  $this->item = "未查到相应的文章列表";
             }else{
                $this->params['model'] = $model;
                $this->params['count'] = $count;
                $this->item = $this->renderFile(CommonUtility::getWidgetViewPath().$this->templeTpl,$this->params);
             
             }
             return $this->item;

        }
}


?>