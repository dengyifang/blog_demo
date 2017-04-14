<div id="dialog" title="" style = "display:none;">
  <p class = "dialog-content">

  </p>
</div>

<table  class="table table-bordered" >
 <tr>
    <td style = "width:100px;">用户名:</td>
    <td><input type = "text" id = "username">&nbsp;<span class = "username-info error" style = "font-weight:bold;color:red;"></span></td>
 </tr>
 <tr>
    <td>密码:</td>
    <td><input type = "password" id = "password">&nbsp;<span class = "password-info error" style = "font-weight:bold;color:red;"></span></td>
 </tr>
 <tr>
    <td>手机号:</td>
    <td><input type = "text" id = "mobile">&nbsp;<span class = "mobile-info error" style = "font-weight:bold;color:red;"></span></td>
 </tr>
 <tr>
    <td>邮箱:</td>
    <td><input type = "text" id = "email">&nbsp;<span class = "email-info error" style = "font-weight:bold;color:red;"></span></td>
 </tr>
 <tr>
    <td></td>
    <td ><button type="button" class="btn btn-primary" onclick = "javascript:oper_add();">新&nbsp;增</button></td>
 </tr>

</table>

<script language = "javascript">
   function oper_add(){
       $(".error").html('');
       var input = {
            username:$("#username").val(),
            password:$("#password").val(),
            mobile:$("#mobile").val(),
            email:$("#email").val(),
       }
       $(".loading").show();
       $.get("admin.php?r=adminuser/adminuser-add",input,function(data){
           $(".loading").hide();
           data = eval("("+data+")");
           if(data.error == 1){
           $(".dialog-content").html(data.msg);
           $("#dialog").dialog({
             title:"提示",
             width:"330px",
             buttons:{"知道了":function(){
                 $("#dialog").dialog("close");
                 if(data.error == 1){
                    location.href = "admin.php?r=site/member&action=operator";
                 }                 
             }}
           })
           }else if(data.error == 2){
              for(k in data.msg){
                 $("#"+k).focus();
                 $("."+k+"-info").text(data.msg[k])  
              }
           }
       })
   }



</script>