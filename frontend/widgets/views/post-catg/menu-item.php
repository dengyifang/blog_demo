<?php
foreach($model as $v){
?>
 <li><a href="<?= $v->catg_url;?>"><?= $v->catg_name?></a></li>
<?php
};
?>