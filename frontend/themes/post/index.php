<?php
use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ListView;
use frontend\components\PostShowWidget;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>
<style>
//源码
.pagination {
  display: inline-block;
  padding-left: 0;
  margin: 20px 0;
  border-radius: 4px;
}
.pagination > li {
  display: inline;
}
.pagination > li > a,
.pagination > li > span {
  position: relative;
  float: left;
  padding: 6px 12px;
  margin-left: -1px;
  line-height: 1.42857143;
  color: #337ab7;
  text-decoration: none;
  background-color: #fff;
  border: 1px solid #ddd;
}
.pagination > li:first-child > a,
.pagination > li:first-child > span {
  margin-left: 0;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.pagination > li:last-child > a,
.pagination > li:last-child > span {
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.pagination > li > a:hover,
.pagination > li > span:hover,
.pagination > li > a:focus,
.pagination > li > span:focus {
  z-index: 2;
  color: #23527c;
  background-color: #eee;
  border-color: #ddd;
}
.pagination > .active > a,
.pagination > .active > span,
.pagination > .active > a:hover,
.pagination > .active > span:hover,
.pagination > .active > a:focus,
.pagination > .active > span:focus {
  z-index: 3;
  color: #fff;
  cursor: default;
  background-color: #337ab7;
  border-color: #337ab7;
}
.pagination > .disabled > span,
.pagination > .disabled > span:hover,
.pagination > .disabled > span:focus,
.pagination > .disabled > a,
.pagination > .disabled > a:hover,
.pagination > .disabled > a:focus {
  color: #777;
  cursor: not-allowed;
  background-color: #fff;
  border-color: #ddd;
}
.pagination-lg > li > a,
.pagination-lg > li > span {
  padding: 10px 16px;
  font-size: 18px;
  line-height: 1.3333333;
}
.pagination-lg > li:first-child > a,
.pagination-lg > li:first-child > span {
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}
.pagination-lg > li:last-child > a,
.pagination-lg > li:last-child > span {
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}
.pagination-sm > li > a,
.pagination-sm > li > span {
  padding: 5px 10px;
  font-size: 12px;
  line-height: 1.5;
}
.pagination-sm > li:first-child > a,
.pagination-sm > li:first-child > span {
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
}
.pagination-sm > li:last-child > a,
.pagination-sm > li:last-child > span {
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
}
</style>
<div align="center" class="tl_idx"> </div>
<div class="width">
<div id="left">
<div class="border">
<div class="m10list">
<?= ListView::widget([
    'id'=>'postList',
    'dataProvider'=>$dataProvider,
    'itemView'=>'_listitem',//子视图,显示一篇文章的标题等内容.
    'layout'=>'{items} {pager}',
    'pager'=>[
        'maxButtonCount'=>6,
        'firstPageLabel'=>Yii::t('app','首页'),
        'prevPageLabel'=>Yii::t('app','上一页'),
        'nextPageLabel'=>Yii::t('app','下一页'),
        'lastPageLabel'=>Yii::t('app',"尾页")
        ],
])?>
</div>
</div>  
</div>
<div id="right">
<div class="border">
<div class="index_label">
<script src="/js/a_up.js"></script>
</div>
</div>
 <div class="border mt10">
    <div class="subject_title">热门推荐</div>
    <ul class="recom_list_idx">
      <?=PostShowWidget::widget(['where' => ['status' => 1],'orderBy' => 'create_time desc','limit' => 15,'templeTpl' => '/post/hot-post-list']);?>
    </ul>
 </div>
 <div class="border mt10">
   <div class="index_label">
     <script src="/js/a_down.js"></script>
  </div>
 </div>
</div>
</div>
