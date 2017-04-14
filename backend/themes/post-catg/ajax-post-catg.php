<?php foreach($model as $v){ ?>
<tr>
  <td><input type = "checkbox" class = "pl_checkbox" value = "<?=$v->id;?>"></td>
  <td><?=$v->id;?></td>
  <td><?=$v->catg_name;?></td>
  <td><?=$v->catg_url;?></td>
  <td><?php
     if($v->is_show){
       ?>
     	显示/<a style = "color:red;font-weight:bold" href = 'javascript:pl_close("<?php echo $v->id;?>");'>[关闭]</a>
     <?php
     }else{
      ?>
     	关闭/<a style = "color:blue;font-weight:bold" href = 'javascript:pl_show("<?php echo $v->id;?>");'>[显示]</a>
     <?php
     }
  ?></td>
  <td>
    <a style = "color:#000;" href = 'javascript:pl_delete("<?=$v->id;?>");'>[删除]</a><a style = "color:#000;"  href = 'javascript:lanmu_update("<?=$v->id;?>","<?=$v->catg_name;?>","<?=$v->catg_url;?>");'>[修改]</a>
  </td>
</tr>
<?php
}
?>
<tr>
 <td><input type = "checkbox" class = "qx_checkbox_l" ></td><td colspan = 5  style = "text-align:left;"><button type="button"  class="btn btn-default"   onclick = "javascript:pl_delete();">批量删除</button>&nbsp;<button type="button"  class="btn btn-default"   onclick = "javascript:pl_show();">批量显示</button>&nbsp;<button type="button"  class="btn btn-default"   onclick = "javascript:pl_close();">批量关闭</button>&nbsp;<button type="button"  class="btn btn-default"   onclick = "javascript:lanmu_add();">栏目添加</button></td>
</tr>