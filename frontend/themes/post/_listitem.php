<?php
use yii\helpers\Html;
?>
<div class="list_1">
<div class="list_picinfo">
<div class="list_title"><a href="<?=$model->url;?>" target="_blank"><?=$model->title;?></a></div>
<div class="list_jj"><?=$model->beginning;?></div>
<div class="list_other">栏目：<span><?=$model->catg;?></span>　时间：<span><?=date("Y-m-d H:i:s",$model->create_time);?></span>
<?php
if($model->read_count>100){
 echo	"<i>推荐</i>";
}
?>
</div>
</div>
</div>