<?php
use backend\models\PostCatg;
?>
<div id="dialog" title="" style = "display:none;">
    <p class = "dialog-content"></p>
</div>
<table  class="table table-bordered" style = "text-align:center;">
<tr>
   <td colspan = "6" style = "text-align:left;">
   	<input type = "text" placeholder="请输入标题" id = "title">
    <input type = "text" placeholder="请输入作者" id = "authName">
    <select style = "width:140px;height:28px;" id = "catgId">
     <option value = "-1">请选择栏目</option>
     <?php foreach (PostCatg::find()->where('catg_name != "首页"')->all() as $v){?> 
        <option value = "<?=$v->id;?>"><?=$v->catg_name;?></option>
     <?php }?>
    </select>
    <input style="width:150px;height:26px;" class="Wdate" type="text" id="sdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})" placeholder="起始时间" />&nbsp;至&nbsp;<input style="width:150px;height:26px;" class="Wdate" type="text" id="edate" onFocus="WdatePicker({isShowClear:false,readOnly:true})" placeholder="结束时间"/>
    <button type="button" class="btn btn-primary" onclick = "javascript:page_js(1);">查询</button>
   </td>
</tr>
<tr style = "font-weight:bold;">
  <td><input type = "checkbox" class = "qx_checkbox"></td><td>标题</td><td>作者</td><td>栏目</td><td>创建时间</td><td>操作</td>
</tr>
<tbody id = "post-list">
<?=$ajaxPost;?>
</tbody>
</table>
<script type="text/javascript">
  $(".qx_checkbox").change(function(){
      $(".qx_checkbox_l").prop("checked",this.checked);
      $(".pl_checkbox").prop("checked",this.checked);
 });
 $(".qx_checkbox_l").change(function(){
      $(".qx_checkbox").prop("checked",this.checked);
      $(".pl_checkbox").prop("checked",this.checked);
 });

  page = "";
  function page_js(_page){
     page = _page;
     var input = {
         title:$("#title").val(),
         authName:$("#authName").val(),
         catgId:$("#catgId").val(),
         sdate:$("#sdate").val(),
         edate:$("#edate").val(),
     };
     $(".loading").show();
     $.get("admin.php?r=post/ajax-post-list&page="+page,input,function(data){
        $(".loading").hide();
        data = eval("("+data+")");
        if(data.error == 1){
          $("#post-list").html(data.ajaxPost);
        }
     })
  }


  function pl_delete(id = ""){
     var pl = new Array;
     if(!id == ""){
        pl.push(id);
     }else{
        $(".pl_checkbox").each(function(){
             if(this.checked){
                pl.push(this.value);
             }
        });
     }
     if(!pl.length){
        $(".dialog-content").text("请选择要删除的项");
        $("#dialog").dialog({
           title:"提示",
           width:"330px",
           buttons:{"知道了":function(){
               $("#dialog").dialog("close");
           }}
        });
     }else{
        $(".loading").show();
        $.get("admin.php?r=post/delete-post",{pl:JSON.stringify(pl),title:$("#title").val(),authName:$("#authName").val(),catgId:$("#catgId").val(),sdate:$("#sdate").val(),edate:$("#edate").val(),page:page},function(data){
              $(".loading").hide();
              data = eval("("+data+")");
              if(data.error == 1){
                $("#post-list").html(data.ajaxPost);
              }else{
              $(".dialog-content").text(data.msg);
              $("#dialog").dialog({
                 title:"提示",
                 width:"330px",
                 buttons:{"知道了":function(){
                     $("#dialog").dialog("close");
                 }}
              });
              }
        })
     }
  }



</script>