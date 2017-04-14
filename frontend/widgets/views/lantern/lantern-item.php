<?php
foreach($model as $v){
?>
<div><a href="<?=$v->link_url;?>" target="_blank" title="<?=$v->title;?>"><img src="<?=$v->img_url;?>" alt="<?=$v->remark;?>"></a></div>
<?php
};
?>