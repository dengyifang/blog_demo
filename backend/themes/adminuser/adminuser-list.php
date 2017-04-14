<div id="dialog" title="" style = "display:none;">
  <p class = "dialog-content">

  </p>
</div>

<table  class="table table-bordered" style = "text-align:center;">
<tr style = "text-align:left;">
  <td colspan = "5" style = "border-right:0px;"><input type = 'text' id = 'username' placeholder = "输入用户名">&nbsp;&nbsp;<input type = "text" id = "mobile" placeholder = "输入手机号">&nbsp;&nbsp;<input type = "text" id = "email" placeholder = "输入邮箱"> <button type="button" class="btn btn-primary" onclick = "javascript:page_js(1);">查询</button></td>
  <td style = "text-align:right;border-left:0px;"><button type="button" class="btn btn-primary" onclick = "javascript:xinzeng()">新增</button></td>
</tr>
<tr style = "font-weight:bold;">
  <td><input type = "checkbox" class = "qx_checkbox"></td><td>用户名</td><td>手机号</td><td>邮箱</td><td>是否开启</td><td>操作</td>
</tr>
<tbody class = "adminuser_list">
<?=$ajaxAdminuser;?>
</tbody>
</table>
<script language = "javascript">
  page = "";
  function page_js(_page){
     page = _page;
     var input = {
         username:$("#username").val(),
         mobile:$("#mobile").val(),
         email:$("#email").val()
     };
     $(".loading").show();
     $.get("admin.php?r=adminuser/ajax-adminuser-list&page="+page,input,function(data){
         $(".loading").hide();
         data = eval("("+data+")");
         if(data.error === 1){
             $(".adminuser_list").html(data.ajaxAdminuser);
         }
     })
  }

function xinzeng(){
  location.href="admin.php?r=site/member&action=operator&oper=operAdd";
}


 $(".qx_checkbox").change(function(){
      $(".qx_checkbox_l").prop("checked",this.checked);
      $(".pl_checkbox").prop("checked",this.checked);
 });
 $(".qx_checkbox_l").change(function(){
      $(".qx_checkbox").prop("checked",this.checked);
      $(".pl_checkbox").prop("checked",this.checked);
 });

//批量删除
 function pl_delete(id = ""){
      var pl = new Array();
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
            width:'330px',
            buttons:{
              "知道了":function(){
                $("#dialog").dialog("close");
              }
            }
          });
      }else{
          $(".loading").show();
          $.get("admin.php?r=adminuser/adminuser-delete",{pl:JSON.stringify(pl)},function(data){
            $(".loading").hide();
            data = eval("("+data+")");
            if(data.error === 1){
               $(".adminuser_list").html(data.ajaxAdminuser);
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
 }


//开启
 function pl_open(id = ""){
      var pl = new Array;
      pl.push(id);
      $(".loading").show();
      $.get("admin.php?r=adminuser/adminuser-open",{pl:JSON.stringify(pl),username:$("#username").val(),mobile:$("#mobile").val(),email:$("#email").val(),page:page},function(data){
        $(".loading").hide();
         data = eval("("+data+")");
         if(data.error === 1){
             $(".adminuser_list").html(data.ajaxAdminuser);
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

//关闭
 function pl_close(id = ""){
      var pl = new Array;
      pl.push(id);
      $(".loading").show();
      $.get("admin.php?r=adminuser/adminuser-close",{pl:JSON.stringify(pl),username:$("#username").val(),mobile:$("#mobile").val(),email:$("#email").val(),page:page},function(data){
        $(".loading").hide();
         data = eval("("+data+")");
         if(data.error === 1){
             $(".adminuser_list").html(data.ajaxAdminuser);
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

 function reset_password(id){
      $(".loading").show();
      $.get("admin.php?r=adminuser/reset-password",{id:id},function(data){
            $(".loading").hide();
            data = eval("("+data+")");
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
      })
 }


</script>