<?php
 foreach ($list as $l) {
?>
<tr>
   <td><input type = "checkbox" class = "pl_checkbox"  value = "<?=$l->id;?>"></td>
   <td><?=$l->username;?></td>
   <td><?=$l->mobile;?></td>
   <td><?=$l->email;?></td>
   <td>
   <?php 
       if($l->is_open){
   ?>
       开启-<a href = 'javascript:pl_close("<?=$l->id;?>");' style = "font-weight:bold;color:red">[关闭]</a>
   <?php
     }else{
    ?>

      关闭-<a href = 'javascript:pl_open("<?=$l->id;?>");' style = "font-weight:bold;color:blue">[开启]</a>
   <?php
     }
   ?> 
   </td>
   <td><a style = "color:#000" href = 'javascript:pl_delete("<?=$l->id;?>");'>[删除]</a><a style = "color:#000;" href = 'javascript:reset_password("<?=$l->id;?>")';>[重置密码]</a><a style = "color:#000;" href = "admin.php?r=site/member&action=operator&oper=operQuanxian&id=<?=$l->id;?>">[权限设置]</a></td>
</tr>
<?php
}
?>
<tr>
  <td>
    <input type = "checkbox" class = "qx_checkbox_l">
  </td><td style = "border-right:0px;text-align:left;"><button type="button" class="btn btn-default"  onclick = "javascript:pl_delete();">批量删除</button></td>
  <td colspan = "4" style = "text-align:right;border-left:0px;"><div class="xx_page"> <div class="digg" ><?=$pagestr;?></div></div></td>

</tr>