<?php
$k = 1;
foreach($model as $v){
 if($k == 1){
   echo '<div class="intop"><strong><a href="'.$v->url.'" target="_blank">'.$v->title.'</a></strong></div>';
 }else{
    if($k == 2){
       	echo '<ul class="recom_list_new">';
    }
        echo '<li class="new_curr"><span></span><a href="'.$v->url.'" target="_blank">'.$v->title.'</a></li>';
 }
if($count == $k){
	echo '</ul>';
}
$k++;
}
?>
