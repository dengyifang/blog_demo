<?php

/* @var $this \yii\web\View */
/* @var $content string */
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use backend\assets\AppAsset;
use common\widgets\Alert;
AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
   <html>
    <head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="backend/web/css/reset.css">
	<link rel="stylesheet" href="backend/web/css/public.css">
    <link rel="stylesheet" href="backend/web/css/loaders.css">
    <link rel="stylesheet" href="backend/web/css/page.css">
    <script type="text/javascript" src="backend/web/kindeditor-master/kindeditor-all-min.js"></script>
    <link rel="stylesheet" href="backend/web/kindeditor-master/themes/default/default.css">
    <script type="text/javascript" src="backend/web/kindeditor-master/lang/zh-CN.js"></script>
    <script type="text/javascript" src="backend/web/My97DatePicker/WdatePicker.js"></script>   
    <script type="text/javascript" src="backend/web/js/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="backend/web/jquery-ui-1.12.0/jquery-ui.min.css">
    <script src="backend/web/jquery-ui-1.12.0/jquery-ui.min.js"></script>
	<style>
		.public-ifame-leftnav{font-family:微软雅黑;}
		a:hover{text-decoration:none;}
		a{display:inline-block;}
	</style>
<?= Html::csrfMetaTags() ?>
     <title><?= Html::encode("技术博客 - 专注于探索分享最实用的QQ玩机宝典") ?></title>
    <?php $this->head() ?>
   </head>
  <body>
<?php $this->beginBody() ?>
<!--进度条特效-->
<div class="loading" style="position:fixed;top:50%;left:50%;margin-left:-5px;margin-top:-3px;z-index:999;display:none">
    <div class="loaders">
      <div class="loader">
        <div class="loader-inner line-scale-pulse-out">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    </div>
</div>
<div class="public-header-warrp">
	<div class="public-header">
		<div class="content">
			<div class="public-header-logo" style="padding-top:10px;"><a href=""><img src="./frontend/web/img/logo2016.jpg" width="159px"; height="38px"/></a></div>
			<div class="public-header-admin fr">
				<p class="admin-name"><span style="color:red;font-weight:900;"><?=Yii::$app->user->identity->username;?></span>管理员 您好！</p>
				<div class="public-header-fun fr">
					<a href="admin.php?r=site/logout" class="public-header-loginout">安全退出</a>	
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
     <?=$content;?>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>