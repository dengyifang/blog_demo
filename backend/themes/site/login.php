<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
?>
<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>技术博客-管理系统</title>

<link rel="stylesheet" type="text/css" href="backend/web/css/styles.css">
<script type="text/javascript" src="backend/web/js/jquery.min.js"></script>
</head>
<body>


<div class="wrapper">

	<div class="container">
		<h1>Welcome</h1>
      <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>
		<div class="form">
			<input type="text" placeholder="用户名" id="adminloginform-username" class="form-control" name="AdminLoginForm[username]" autofocus>
			<input type="password" id="adminloginform-password" class="form-control" name="AdminLoginForm[password]" placeholder="密码">
            <p class="help-block help-block-error"></p>
			<button id="login-button">登录</button>
		</div>
	  <?php ActiveForm::end(); ?>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	
</div>
</body>
</html>