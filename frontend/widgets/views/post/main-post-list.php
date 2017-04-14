<?php
$k =1;
foreach($model as $v){
 if($k == 1){
   echo '<dl class="nice">
<dt class="picnice"><a href="'.$v->url.'" target="_blank"><img src="'.$v->cover_url.'" alt="'.$v->title.'" width="105" height="70" border="0" /></a></dt>
<dt class="txtnice"><h3><a href="'.$v->url.'" target="_blank">'.$v->title.'</a></h3></dt>
</dl>';
 }else{
    if($k == 2){
       	echo '<ul class="recom_list_idx">';
    }
        echo '<li><a href="'.$v->url.'" target="_blank" class="indexa">'.$v->title.'</a></li>';
 }
if($count == $k){
	echo '</ul>';
}
$k++;

}
?>
