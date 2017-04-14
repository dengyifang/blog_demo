<?php
foreach($model as $v){
?>
<li><a href="<?=$v->url;?>" target="_blank"><?=$v->title;?></a></li>
<?php
}
?>