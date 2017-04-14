<?php
namespace frontend\components;
use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use frontend\models\Lantern;
use common\includes\CommonUtility;

class LanternWidget extends Widget{

  public $where = [];
  public $orderBy = 'id';
  public $item = null;
  public $params = [];

  public function init(){
		parent::init();
  }
  
  public function run(){
     $lantern = Lantern::find()
                ->where($this->where)
                ->orderBy($this->orderBy)
                ->all();

     if(!$lantern){
         $this->item = "未查到相应的幻灯片信息";
     }else{
         $this->params['model'] = $lantern;
         $this->item = $this->renderFile(CommonUtility::getWidgetViewPath().'/lantern/lantern-item.php',$this->params);
  	 }
     return $this->item;  	
     }

  }


