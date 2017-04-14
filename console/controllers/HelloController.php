<?php
namespace console\controllers;
use yii\console\Controller;
use backend\models\Post;

class HelloController extends Controller{
   public function actionIndex(){
     while(1){
          echo date("Y-m-d H:i:s",time())."\n";   

     }
   }

   public function actionList(){
       $list  = Post::find()->all();
       foreach($list as $l){
       	echo $l->id.$l->title."\n";
       }
   }

   public function actionName(){
   	    //echo "hello ".$name."welcome to china";
   	   $fp = @fopen(dirname(dirname(__DIR__)).'\test.txt', 'a+');
      fwrite($fp,date("Y-m-d H:i:s",time()).' 让PHP定时运行吧！\n');
      fclose($fp);
      echo "success";
   }

}