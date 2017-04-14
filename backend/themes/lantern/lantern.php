    <script>
      KindEditor.ready(function(K) {
        var editor = K.editor({
          allowFileManager : true,
          uploadJson : 'upload.php?uploadPath=lantern',
        });
        K('#upimgbtn').click(function() {
          editor.loadPlugin('image', function() {
            editor.plugin.imageDialog({
              showRemote : false,
              imageUrl : K('#s_img').val(),
              clickFn : function(url, title, width, height, border, align) {
                K('#s_img').val(url);
                editor.hideDialog();
              }
            });
          });
        });
      });
    </script>
<div id="dialog" title="" style = "display:none;">
  <p class = "dialog-content">

  </p>
</div>

<div id="dialog-up" title="" style = "display:none;">
  <p class = "dialog-content-up">
    
   <table>
      <tr style = "height:35px;">
         <td>图片:</td>
         <td><input type="text"  readonly="readonly" value=""  id="s_img"/>&nbsp;&nbsp;<input type="button" id="upimgbtn" value="上传图片" class="btn" style="float:none; width:70px; height:28px; padding:0; margin:0 10px 0 0;" />
         </td>
      </tr>
      <tr style = "height:35px;"><td>主题:</td><td><input type="text" id = "title"></td></tr>
      <tr style = "height:35px;">
          <td>说明:</td><td><input type="text" id = "remark"></td>
      </tr>
      <tr style = "height:35px;">
          <td>链接:</td><td><input type = "text" id = "link_url"></td>
      </tr>
   </table>

  </p>
</div>
<table  class="table table-bordered" style = "text-align:center;">
<tr style = "font-weight:bold;">
  <td><input type = "checkbox" class = "qx_checkbox"></td><td>排序</td><td>幻灯图片</td><td>幻灯主题</td><td>幻灯说明</td><td>幻灯链接</td><td>是否显示</td><td>操作</td>
</tr>
<tbody class = "lantern_list">
<?=$ajaxLantern;?>
</tbody>
</table>
<script language = "javascript">
  $(".qx_checkbox").change(function(){
         $(".pl_checkbox").prop('checked',this.checked);
         $(".qx_checkbox_l").prop('checked',this.checked);
  });

  $(".qx_checkbox_l").change(function(){
  	     $(".pl_checkbox").prop('checked',this.checked);
  	     $('.qx_checkbox').prop('checked',this.checked);
  });

/**
 *修改幻灯
 */
 function pl_update(id = "",title = "",img_url = "",link_url = "",remark = ""){
     $("#s_img").val(img_url);
     $("#title").val(title);
     $("#remark").val(remark);
     $("#link_url").val(link_url);
     $("#dialog-up").dialog({
          title:"修改幻灯",
          width:"330px",
          buttons:{
            "取消":function(){
                $("#dialog-up").dialog('close');
            },"确认":function(){
                $("#dialog-up").dialog("close");
                $(".loading").show();
                $.get("admin.php?r=lantern/lantern-update",{id:id,title:$("#title").val(),img_url:$("#s_img").val(),link_url:$("#link_url").val(),remark:$("#remark").val()},function(data){
                        $(".loading").hide();
                        data = eval("("+data+")");
                        if(data.error == 2){
                            $(".lantern_list").html(data.Tpl);
                        }else{
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
     });
 }

/**
 *添加幻灯
 */
 function lantern_add(){
     $("#dialog-up").dialog({
         title:"添加幻灯",
         width:"330px",
         buttons:{
             "取消":function(){
                   $("#dialog-up").dialog("close");
             },"确认":function(){
                   var info = {
                      title:$("#title").val(),
                      img_url:$("#s_img").val(),
                      link_url:$("#link_url").val(),
                      remark:$("#remark").val(),
                   };
                   $(".loading").show();
                   $.get("admin.php?r=lantern/lantern-add",info,function(data){
                      $(".loading").hide();
                      data = eval("("+data+")");
                      if(data.error == 2){
                          $("#dialog-up").dialog("close");                          
                          $(".lantern_list").html(data.Tpl);
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
     })
 }


/**
 *排序更改
 */
 function lantern_px(id){
   $(".loading").show();
   $.get("admin.php?r=lantern/lantern-px",{id:id,level:$("#lan"+id).val()},function(data){
        $(".loading").hide();
        data = eval("("+data+")");
        if(data.error == 2){
          $(".lantern_list").html(data.Tpl);
        }else{
          $(".dialog-content").text(data.msg);
          $("#dialog").dialog({
             title:"提示",
             width:"330px",
             buttons:{"知道了":function(){
              $("#dialog").dialog("close");
             }}
          })
        }
   })
 }

/**
 *批量删除
 */
 function pl_delete(id = ""){
        var pl = new Array();
        if(id == ""){
          $(".pl_checkbox").each(function(){
             if(this.checked){
              pl.push(this.value);
             }
          })
        }else{
             pl.push(id);
        }

        if(!pl.length){
          $(".dialog-content").text("请选择要批量删除的项！");
          $("#dialog").dialog({
              title:"提示",
              width:"330px",
              buttons:{"知道了":function(){
                $("#dialog").dialog("close");
              }}
          });
        }else{
          $(".loading").show();
          $.get("admin.php?r=lantern/lantern-delete",{pl:JSON.stringify(pl)},function(data){
                $(".loading").hide();
                data = eval("("+data+")");
                if(data.error == 3){
                  $(".lantern_list").html(data.Tpl);
                }else{
                  $(".dialog-content").text(data.msg);
                  $("#dialog").dialog({
                     title:"提示",
                     width:"330px",
                     buttons:{
                        "知道了":function(){
                          $("#dialog").dialog("close");
                        }
                     }
                  });
                }
          })
      }
 }



/**
 *批量关闭
 */
  function pl_close(id = ""){
        var pl = new Array();
        if(id == ""){
            $(".pl_checkbox").each(function(){
              if(this.checked){
                pl.push(this.value);
              }
            });
        }else{
            pl.push(id);
        }

        if(!pl.length){
          $(".dialog-content").text("请选择要批量关闭的项!");
          $("#dialog").dialog({
                  title:"提示",
                  width:"330px",
                  buttons:{
                    "知道了":function(){
                      $("#dialog").dialog('close');
                    }
                  }
          });
        }else{
          $(".loading").show();
            $.get("admin.php?r=lantern/lantern-close",{pl:JSON.stringify(pl)},function(data){
                 $(".loading").hide();
                 data = eval("("+data+")");
                 if(data.error == 3){
                    $(".lantern_list").html(data.Tpl);
                 }else{
                    $(".dialog-content").text(data.msg);
                    $("#dialog").dialog({
                        title:"提示",
                        width:"330px",
                        buttons:{"知道了":function(){
                          $("#dialog").dialog('close');
                        }}
                    });
                 }                  
            });
        }
  }

/**
 *批量显示
 */
  function pl_show(id = ""){
        var pl = new Array();
        if(id == ""){
            $(".pl_checkbox").each(function(){
            	if(this.checked){
            		pl.push(this.value);
            	}
            });
        }else{
            pl.push(id);
        }

        if(!pl.length){
        	$(".dialog-content").text("请选择要批量显示的项!");
        	$("#dialog").dialog({
                  title:"提示",
                  width:"330px",
                  buttons:{
                  	"知道了":function(){
                  		$("#dialog").dialog('close');
                  	}
                  }
        	});
        }else{
        	$(".loading").show();
            $.get("admin.php?r=lantern/lantern-show",{pl:JSON.stringify(pl)},function(data){
                 $(".loading").hide();
                 data = eval("("+data+")");
                 if(data.error == 3){
                    $(".lantern_list").html(data.Tpl);
                 }else{
                    $(".dialog-content").text(data.msg);
                    $("#dialog").dialog({
                        title:"提示",
                        width:"330px",
                        buttons:{"知道了":function(){
                          $("#dialog").dialog('close');
                        }}
                    });
                 }                 	
            });
        }
  }


</script>