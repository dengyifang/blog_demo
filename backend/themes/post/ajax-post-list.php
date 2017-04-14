<?php foreach ($list as $v): ?>
<tr>
  <td><input type="checkbox" class = "pl_checkbox" value = "<?=$v['id'];?>"></td>
  <td><?=$v['title'];?></td><td><?=$v['username'];?></td>
  <td><?=$v['catg_name'];?></td><td><?=date("Y-m-d H:i:s",$v['create_time']);?></td>
  <td>
  <a style = "color:#000;" href = 'javascript:pl_delete("<?=$v['id'];?>");'>[删除]</a>
  <a style = "color:#000;" href = "admin.php?r=site/content&action=boke&oper=boke_detail&id=<?=$v['id'];?>">[详情]</a>
  </td>
</tr>	
<?php endforeach ?>
<tr>
  <td><input type="checkbox" class = "qx_checkbox_l"></td>
  <td style = "border-right:0px;text-align:left;"><button type="button" class="btn btn-default"  onclick = "javascript:pl_delete();">批量删除</button></td>
  <td colspan = "5" style = "text-align:right;border-left:0px;"><div class="xx_page"> <div class="digg" ><?=$pagestr;?></div></div></td>

</tr>
