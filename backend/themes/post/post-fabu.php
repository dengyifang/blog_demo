<?php
use backend\models\PostCatg;
?>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content-post"]', {
			allowFileManager : true,
			uploadJson : 'upload.php?uploadPath=post',
		});
	});
</script>

<script>
      KindEditor.ready(function(K) {
        var editor = K.editor({
          allowFileManager : true,
          uploadJson : 'upload.php?uploadPath=post',
        });
        K('#upimgbtn').click(function() {
          editor.loadPlugin('image', function() {
            editor.plugin.imageDialog({
              showRemote : false,
              imageUrl : K('#s_img').val(),
              clickFn : function(url, title, width, height, border, align) {
                K('#cover_url').val(url);
                K('#show_img').attr("src",url);
                editor.hideDialog();
              }
            });
          });
        });
      });
</script>


<div id="dialog" title="" style = "display:none;">
    <p class = "dialog-content"></p>
</div>
<table  class="table table-bordered">
<tr>
   <td style = "width:50px;">
     标题
   </td>
   <td>
     <input type = "text" id = "title">
   </td>
</tr>
<tr>
   <td>
     标签
   </td>
   <td>
     <input type = "text" id = "tags">
   </td>
</tr>
<tr>
   <td>
     栏目
   </td>
   <td>
    <select style = "width:155px;height:28px;" id = "catg_id">
      <option value = "-1">请选择栏目</option>
      <?php foreach (PostCatg::find()->where('catg_name != "首页"')->all() as $v){?> 
         <option value = "<?=$v->id;?>"><?=$v->catg_name;?></option>
      <?php }?>
    </select>
   </td>
</tr>
<tr>
   <td>
    封面
   </td>
   <td>
       <img id = "show_img" src = "backend/web/image/zwzp.gif"  style = "width:150px;height:100px;"/>
            <p><input type = "hidden" id = "cover_url"></p>
        <input type="button" id="upimgbtn" value="上传图片" class="btn" style="float:none; width:70px; height:28px; padding:0; margin:0 10px 0 0;" /><span style = "font-size:3px;">(建议上传图片大小为：210X150,不在超过100K)</span>

   </td>
</tr>
<tr>
   <td>
    内容
   </td>
   <td>
      <textarea id="content-post" name="content-post" style="width:700px;height:300px;visibility:hidden;"> </textarea>
   </td>
</tr>
<tr>
   <td>
   </td>
   <td>
       <button type="button" class="btn btn-default"  onclick = "javascript:boke_fabu();">发&nbsp;布</button>
   </td>
</tr>
</table>
<script language = "javascript">
   function boke_fabu(){
       var content = editor.html();
       var input = {
       	   title:$("#title").val(),
       	   tags:$("#tags").val(),
       	   catg_id:$("#catg_id").val(),
       	   cover_url:$("#cover_url").val(),
       	   content:content,
       };
       $(".loading").show();
       $.post("admin.php?r=post/post-fabu",input,function(data){
           $(".loading").hide();
           data = eval("("+data+")");
           $(".dialog-content").text(data.msg);
           $("#dialog").dialog({
           	  title:"提示",
           	  width:"330px",
           	  buttons:{"知道了":function(){
           	  	$("#dialog").dialog("close");
           	  }}
           })
       })
   }



</script>

