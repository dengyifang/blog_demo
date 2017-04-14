<div id="dialog" title="" style = "display:none;">
    <p class = "dialog-content"></p>
</div>
<table  class="table table-bordered">
  <tr>
     <td style = "width:100px;">
        标题
     </td>
     <td>
        <?=$model->title;?><span style="font-size:10px;">[<?=date("Y-m-d H:i:s",$model->create_time);?>]</span>
     </td>
  </tr>
  <tr>
     <td>
     	栏目
     </td>
     <td>
        <?=$model->catg;?>
     </td>
  </tr>
  <tr>
     <td>
        作者
     </td>
     <td>
       <?=$model->authName;?>
     </td>
  </tr>
  <tr>
     <td>
       标签
     </td>
     <td>
       <?=$model->tags;?>
     </td>
  </tr>
  <tr>
     <td>
      封面
     </td>
     <td>
        <img style = "width:150px;height:100px;" src = "<?=$model->cover_url;?>">
     </td>
  </tr>
  <tr>
     <td>
      内容
     </td>
     <td>
       <?=$model->content;?>
     </td>
  </tr>


</table>
