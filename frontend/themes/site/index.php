<?php
use frontend\components\LanternWidget;
use frontend\components\PostShowWidget;
?>
<div align="center" class="tl_idx"> </div>
<div class="width">
<div id="left">
<div class="left_w">
<div id="index_ad">
<div id="kinMaxShow">
<?=LanternWidget::widget(['where' => ['is_show' => 1],'orderBy' => 'level asc']);?>
</div>
</div>
<div class="border new_left">
<?=PostShowWidget::widget(['where' => ['status' => 1],'orderBy' => 'create_time desc','limit' => 7,'templeTpl' => '/post/top-post-list']);?>
</div>
</div>

<div class="border index_left mr10">
<div class="subject_title">QQ技巧</div>
<?=PostShowWidget::widget(['where' => ['status' => 1,'catg_id' => 2],'orderBy' => 'create_time desc','limit' => 7,'templeTpl' => '/post/main-post-list']);?>
</div>

<div class="border index_left">
<div class="subject_title">安卓玩机</div>
<?=PostShowWidget::widget(['where' => ['status' => 1,'catg_id' => 3],'orderBy' => 'create_time desc','limit' => 7,'templeTpl' => '/post/main-post-list']);?>
</div>

<div class="border index_left mr10">
<div class="subject_title">QQ活动</div>
<?=PostShowWidget::widget(['where' => ['status' => 1,'catg_id' => 4],'orderBy' => 'create_time desc','limit' => 7,'templeTpl' => '/post/main-post-list']);?>
</div>

<div class="border index_left">
<div class="subject_title">电脑技术</div>
<?=PostShowWidget::widget(['where' => ['status' => 1,'catg_id' => 5],'orderBy' => 'create_time desc','limit' => 7,'templeTpl' => '/post/main-post-list']);?>
</div>

<div class="border index_left mr10">
<div class="subject_title">网络安全</div>
<?=PostShowWidget::widget(['where' => ['status' => 1,'catg_id' => 6],'orderBy' => 'create_time desc','limit' => 7,'templeTpl' => '/post/main-post-list']);?>
</div>

<div class="border index_left">
<div class="subject_title">Web实战</div>
<?=PostShowWidget::widget(['where' => ['status' => 1,'catg_id' => 7],'orderBy' => 'create_time desc','limit' => 7,'templeTpl' => '/post/main-post-list']);?>
</div>

</div>
<div id="right">
<div class="border">
<div class="subject_title">个人中心</div>
<ul class="recom_list_idx">
<li><a href="index.php?r=site/signup" target="_blank">会员注册</a></li>
<?php
if(Yii::$app->user->isGuest){
  echo	'<li><a href="index.php?r=site/login" target="_blank">会员登录</a></li>';
}else{
  echo	'<li><a href="index.php?r=site/logout" target="_self">注销(当前用户:<span style = "color:red;font-weight:bold">'.Yii::$app->user->identity->username.'</span>)</a></li>';	
}
?>

</ul>
</div>
<div class="border mt10">

<div class="index_label">

</div>
</div>
<div class="border mt10">
<div class="subject_title">人气排行</div>
<ul class="recom_list_idx">
<?=PostShowWidget::widget(['where' => ['status' => 1],'orderBy' => 'create_time desc','limit' => 15,'templeTpl' => '/post/hot-post-list']);?>
</ul>
</div>
</div>
</div>
