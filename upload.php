<?php
if(@!$_GET['uploadPath']){
	die("You don't have the right to access this file!");
}
@$imagePath = 'upload/admin/'.$_GET['uploadPath'];
if(!is_dir($imagePath)){
  mkdir($imagePath);
}
require_once "backend/web/kindeditor-master/php/upload_json.php";
