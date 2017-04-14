<?php 
foreach($model as $v){
?>
<tr style = "height:110px;text-align:center;">
  <td style = "line-height:110px;"><input type = "checkbox" class = "pl_checkbox" value = "<?=$v->id;?>"></td>
  <td style = "line-height:110px;" ><input type = "text" onchange = 'javascript:lantern_px("<?=$v->id;?>")' id = 'lan<?=$v->id;?>' style = "text-align:center;width:40px;height:20px;" value = "<?=$v->level;?>"></td>
  <td style = "line-height:110px;"><img style = "width:200px;height:110px;" src = "<?=$v->img_url;?>"></td>
  <td style = "line-height:110px;"><?=$v->title;?></td>
  <td style = "line-height:110px;"><?=$v->remark;?></td>
  <td style = "line-height:110px;"><?=$v->link_url;?></td>
  <td style = "line-height:110px;">
      <?php
          if($v->is_show){
       ?>
          显示/<a style = "color:red;font-weight:bold;" href = 'javascript:pl_close("<?=$v->id;?>");'>[关闭]</a>      
      <?php
          }else{
       ?>
          关闭/<a style = "color:blue;font-weight:bold;" href = 'javascript:pl_show("<?=$v->id;?>");'>[显示]</a>
      <?php
          }
      ?>
  </td>
  <td style = "line-height:110px;">
      <a style = "color:#000;" href = 'javascript:pl_delete("<?=$v->id;?>");'>[删除]</a>
      <a style = "color:#000;" href = 'javascript:pl_update("<?=$v->id;?>","<?=$v->title;?>","<?=$v->img_url;?>","<?=$v->link_url;?>","<?=$v->remark;?>");'>[修改]</a>
  </td>
</tr>
<?php
} 
?>
<tr>
  <td style = "text-align:center;"><input type = "checkbox" class = "qx_checkbox_l"></td>
  <td colspan = 7 style = "text-align:left"><button type="button" class="btn btn-default"  onclick = "javascript:pl_delete();">批量删除</button>&nbsp;<button type="button" class="btn btn-default"  onclick = "javascript:pl_show();">批量显示</button>&nbsp;<button type="button" class="btn btn-default"   onclick = "javascript:pl_close();">批量关闭</button>&nbsp;<button type="button" class="btn btn-default"   onclick = "javascript:lantern_add();">幻灯添加</button>&nbsp;</td>

</tr>
