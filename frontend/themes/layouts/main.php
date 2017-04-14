<?php

/* @var $this \yii\web\View */
/* @var $content string */
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;
use frontend\components\PostCatgWidget;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="description" content="技术博客，致力于原创探索和分享最给力的QQ玩机技巧，同时专注于提供最实用的电脑网络技术以及高大上的安卓手机玩法、QQ免费活动、Web网站教程等信息。" />
<?= Html::csrfMetaTags() ?>
     <title><?= Html::encode("技术博客 - 专注于探索分享最实用的QQ玩机宝典") ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
<div id="header">
<div class="width">
<a href="index.php" class="logo"><img src="./frontend/web/img/logo2016.jpg" border="0" height="47" width="160" alt="返回技术博客网首页" /></a>
<ul class="nav">
<!-- 网页头部栏目设定 -->
<?=PostCatgWidget::widget(['where' => ['is_show' => 1],'orderBy' => "id asc"]);?>
</ul>
<div id="search">

<input type="text" name="PostSearch[title]" id = "keyword" size="38" class="sea_text form-control" placeholder="搜索一下，So easy~" />
<input type="submit" value="" class="sea_sub" />

</div>
</div>
</div>
<?=$content;?>
<script src="frontend/web/js/jquery.min.js" type="text/javascript"></script>
<script src="frontend/web/js/jquery.show.min.js" type="text/javascript"></script>

<script>
$(function(){$("#kinMaxShow").kinMaxShow({height:318,button:{switchEvent:'mouseover',normal:{width:'8px',height:'8px',lineHeight:'14px',right:'6px',bottom:'12px',fontSize:'10px',background:"#cccaca",border:"1px solid #cccaca",color:"#666666",textAlign:'center',marginRight:'8px',fontFamily:"Verdana",float:'left'},focus:{background:"#93C43D",border:"1px solid #93C43D",color:"#000000"}}})});
</script>
<div class="width" id="foot">
<div class="foot_menu"><a href="" class="about-focus">关于技术博客</a>　|　<a href="">联系方式</a>　|　<a href="">版权申明</a>　|　<a href="">广告合作</a>　|　<script src="" language="JavaScript"></script>　|　<a href="#top">返回顶部</a></div>
  Copyright &copy; 2010 - 2016 技术博客网. All Rights Reserved <a href="http://www.miibeian.gov.cn/" target="_blank">晋ICP备12021353号-1</a> <span>晋公网安备13048102000199号</span><a style = "font-weight:500;"><?= Yii::powered() ?></a>
</div>
<div class="gotop" id="gotop" style="display:none">
<a href="javascript:;" title="返回顶部" class="gotopico" hidefocus="true"></a>
</div>
<script>$(function(){$(window).on('scroll',function(){var stop=$(document).scrollTop();if(stop>0){if($('#header').length!=0){var total=$(window).width(),page=1120;$('#gotop').css({'left':(total-page)/2+page+12});}$('#gotop').fadeIn()}else{$('#gotop').fadeOut()}});$('#gotop .gotopico').on('click',function(){$('html,body').animate({'scrollTop':0},500)})});</script>
<script>
$(".sea_sub").click(function(){
    location.href = "index.php?r=post/index&PostSearch[title]="+$("#keyword").val();
})
</script>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>