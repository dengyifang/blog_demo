<div id="dialog" title="" style = "display:none;">
    <p class = "dialog-content"></p>
</div>
<table  class="table table-bordered" style = "text-align:center;">
<tr style = "font-weight:bold;">
  <td><input type = "checkbox" class = "qx_checkbox"></td><td>序号</td><td>栏目名称</td><td>栏目链接</td><td>是否显示</td><td>操作</td>
</tr>
<tbody class = "catg_list">
<?=$ajaxPostCatg;?>
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
    *添加栏目
    */
  function lanmu_add(){
         $(".dialog-content").html('<p>栏目名称:<input type = "text" style = "width:180px;" id = "catg-name" value = ""></p><p>栏目链接:<input type = "text" style = "width:180px;" id = "catg-url" value = "">');
         $("#dialog").dialog({
            title:"添加栏目",
            width:"330px",
            buttons:{"取消":function(){
              $("#dialog").dialog("close");
            },"确认添加":function(){
                var info = {
                   catgName:$("#catg-name").val(),
                   catgUrl:$("#catg-url").val(),
                };
               $(".loading").show();
               $.get("admin.php?r=post-catg/add-post-catg-list",info,function(data){
                       $(".loading").hide();
                       data = eval("("+data+")");
                       $(".dialog-content").text(data.msg);
                       $("#dialog").dialog({
                         title:"提示",
                         width:"330px",
                         buttons:{"知道了":function(){
                          if(data.error == 1){
                            $(".catg_list").html(data.Tpl);
                          }
                          $("#dialog").dialog("close");
                       }},
                    })
               })
            }

          }
         });
  }

  /**
    *修改栏目
    */
  function lanmu_update(id,catg_name = "",catg_url = ""){
         $(".dialog-content").html('<p>栏目名称:<input type = "text" style = "width:180px;" id = "catg-name" value = "'+catg_name+'"></p><p>栏目链接:<input type = "text" style = "width:180px;" id = "catg-url" value = "'+catg_url+'">');
         $("#dialog").dialog({
            title:"修改栏目",
            width:"330px",
            buttons:{"取消":function(){
              $("#dialog").dialog("close");
            },"确认修改":function(){
                var info = {
                   id:id,
                   catgName:$("#catg-name").val(),
                   catgUrl:$("#catg-url").val(),
                };
               $(".loading").show();
               $.get("admin.php?r=post-catg/update-post-catg-list",info,function(data){
                       $(".loading").hide();
                       data = eval("("+data+")");
                       $(".dialog-content").text(data.msg);
                       $("#dialog").dialog({
                         title:"提示",
                         width:"330px",
                         buttons:{"知道了":function(){
                          if(data.error == 1){
                            $(".catg_list").html(data.Tpl);
                          }
                          $("#dialog").dialog("close");
                       }},
                    })
               })
            }

          }
         });
  }

  /**
    *批量删除
    */
  function pl_delete(id = ""){
         var pl = new Array();
         if(id == ""){
          $('.pl_checkbox').each(function(){
         	if(this.checked){
         		pl.push(this.value);
         	}
          });
         }else{
         	 pl.push(id);
         }

         if(!pl.length){
           $(".dialog-content").text("请选择要批量删除的内容!");
           $("#dialog").dialog({
             title:"提示",
             width:"330px",
             buttons:{"知道了":function(){
                $("#dialog").dialog('close');
             }},
           });
         }else{
         	$(".loading").show();
            $.get("admin.php?r=post-catg/delete-post-catg-list",{pl:JSON.stringify(pl)},function(data){
                    $(".loading").hide();
                    data = eval("("+data+")");
                    $(".dialog-content").text(data.msg);
                    $("#dialog").dialog({
                       title:"提示",
                       width:"330px",
                       buttons:{"知道了":function(){
                          $("#dialog").dialog("close");
                       }},
                    })
                    if(data.error == 3){
                    	$(".catg_list").html(data.Tpl);
                    }
            })
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
        };

        if(!pl.length){
           $(".dialog-content").text("请选择要批量显示的内容!");
           $("#dialog").dialog({
             title:"提示",
             width:"330px",
             buttons:{"知道了":function(){
                $("#dialog").dialog('close');
             }},
           });          
        }else{
            $(".loading").show();
            $.get("admin.php?r=post-catg/show-post-catg-list",{pl:JSON.stringify(pl)},function(data){
            	$(".loading").hide();
                 data = eval("("+data+")");
                 if(data.error == 3){
                 	  $(".catg_list").html(data.Tpl);
                 }else{
                    $(".dialog-content").text(data.msg);
                    $("#dialog").dialog({
                       title:"提示",
                       width:"330px",
                       buttons:{"知道了":function(){
                          $("#dialog").dialog("close");
                       }},
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
        };

        if(!pl.length){
           $(".dialog-content").text("请选择要批量关闭的内容!");
           $("#dialog").dialog({
             title:"提示",
             width:"330px",
             buttons:{"知道了":function(){
                $("#dialog").dialog('close');
             }},
           });    
        }else{
            $(".loading").show();
            $.get("admin.php?r=post-catg/close-post-catg-list",{pl:JSON.stringify(pl)},function(data){
            	$(".loading").hide();
                 data = eval("("+data+")");
                 if(data.error == 3){
                 	  $(".catg_list").html(data.Tpl);
                 }else{
                      //alert(data.msg);
                    $(".dialog-content").text(data.msg);
                    $("#dialog").dialog({
                       title:"提示",
                       width:"330px",
                       buttons:{"知道了":function(){
                          $("#dialog").dialog("close");
                       }},
                    });
                 }
            })
        }
  }



</script>