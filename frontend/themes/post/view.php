<?php
use frontend\components\LanternWidget;
use frontend\components\PostShowWidget;
?>
<div align="center" class="tl_idx"> </div>
<div class="width">
<div id="left">
<div class="border">
<div class="m10">
<h1 class="new_title"><?=$model->title;?></h1>
<div class="new_other">
<span style="float:left;">来自菲菲 原创 发表于 <?=date("Y-m-d H:i:s",$model->create_time);?>　热度：★★★★☆　</span>
</div>
<div class="info_content">
<?=$model->content;?>
</div>
<p style="height:20px;border-bottom:1px dashed #5c585a;color:#5c585a"> 
所有原创博文版权归技术博客所有，转载必须注明文章出处地址</p>
<div class="xh">
    <div class="zi">猜你喜欢</div>
    <ul>
<?=PostShowWidget::widget(['where' => ['status' => 1],'orderBy' => 'create_time desc','limit' => 6,'templeTpl' => '/post/may-your-like']);?> 
    </ul>
</div>

<div id="SOHUCS" style="width:85%;" sid="3708"></div><script src="/js/shcy.js"></script>

<div class="info_next">上一篇：<a href="/qqjiqiao/3706.html">QQ音乐免流量听歌加速QQ等级 原来很简单</a></div>
<div class="info_next">下一篇：<a href="/qqjiqiao/3709.html">QQ空间最新快速解除封禁的方法都在这里了</a></div>
</div>
</div>
</div>
<div id="right">
<div class="border">
<div class="index_label">

</div>
</div>
<div class="border mt10">
<div class="subject_title">热门推荐</div>
<ul class="recom_list_idx">
<?=PostShowWidget::widget(['where' => ['status' => 1],'orderBy' => 'create_time desc','limit' => 15,'templeTpl' => '/post/hot-post-list']);?>
</ul></div>
<div class="border mt10">
<div class="index_label">

</div>
</div>
<div class="border mt10">
<div class="subject_title">互动交流</div>
<div class="m10" style="margin:17px">　<a href="/w/mail" target="_blank" class="url"><img src="http://static.feifeiboke.com/css/m.png" border="0" alt="给我发邮件" width="16" height="16" align="absmiddle" /> 留言反馈</a>　　<a href="/w/help" target="_blank" class="url"><img src="http://static.feifeiboke.com/css/q.ico" alt="加QQ求助" width="16" height="16" border="0" align="absmiddle" /> 在线求助</a>
</div></div></div></div>
