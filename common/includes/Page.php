<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2009 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// |         lanfengye <zibin_5257@163.com>
// +----------------------------------------------------------------------
namespace common\includes;

class Page {
	
    // 分页栏每页显示的页数
    public $rollPage = 5;
    // 页数跳转时要带的参数
    public $parameter  ;
    // 默认列表每页显示行数
    public $listRows = 20;
    // 起始行数
    public $firstRow	;
    // 分页总页面数
    public $totalPages  ;
    // 总行数
    protected $totalRows  ;
    // 当前页数
    protected $nowPage    ;
    // 分页的栏的总页数
    protected $coolPages   ;
    // 分页显示定制
    protected $config  =	array('header'=>'条记录','prev'=>'上一页','next'=>'下一页','first'=>'第一页','last'=>'最后一页','theme'=>' %totalRow% %header% %nowPage%/%totalPage% 页 %upPage% %downPage% %first%  %prePage%  %linkPage%  %nextPage% %end%');
    // 默认分页变量名
    protected $varPage;

    /**
     * 架构函数
     * @access public
     * @param array $totalRows  总的记录数
     * @param array $listRows  每页显示记录数
     * @param array $parameter  分页跳转的参数
     */
    public function __construct($totalRows,$listRows='',$nowpage=0,$parameter='') {
        $this->totalRows    =   $totalRows;
        $this->parameter    =   $parameter;
        $this->varPage      =   'p';//C('VAR_PAGE') ? C('VAR_PAGE') : 'p' ;
        if(!empty($listRows)) {
            $this->listRows =   intval($listRows);
        }
        $this->totalPages   =   ceil($this->totalRows/$this->listRows);     //总页数
        $this->coolPages    =   ceil($this->totalPages/$this->rollPage);
        $this->nowPage      =   intval($nowpage)>0?intval($nowpage):(!empty($_GET[$this->varPage])?intval($_GET[$this->varPage]):1);
        //exit("page=".$this->totalPages);
        if(!empty($this->totalPages) && $this->nowPage>$this->totalPages) {
            $this->nowPage  =   $this->totalPages;
        }
        $this->firstRow     =   $this->listRows*($this->nowPage-1);
    }
    

    public function setConfig($name,$value) {
        if(isset($this->config[$name])) {
            $this->config[$name]    =   $value;
        }
    }
    
     /**
     * 分页显示输出 js
     * @access public
     * @author lanfengye <zibin_5257@163.com>
     */
    public function show_js($link_module) {
        if(0 == $this->totalRows) return '';
        $p              =   $this->varPage;
        $nowCoolPage    =   ceil($this->nowPage/$this->rollPage);
        
        //获取控制器名和方法名，并判断是否url不区分大小写
        // $url_case       =   C('URL_CASE_INSENSITIVE');
        // $group_name    =   $url_case?  parse_name(GROUP_NAME) :   GROUP_NAME;
        // $module_name    =   $url_case?  parse_name(MODULE_NAME) :   MODULE_NAME;
        // $action_name    =   $url_case?  parse_name(ACTION_NAME) :   ACTION_NAME;
        
        //替换附加参数中的分隔符
        $parameter      =   $this->parameter;//str_replace(array('&','='), C('URL_PATHINFO_DEPR'), $this->parameter);

        //增加附加参数
       // $url            =   rtrim(__APP__.'/'.$module_name.C('URL_PATHINFO_DEPR').$action_name.C('URL_PATHINFO_DEPR').$parameter,C('URL_PATHINFO_DEPR'));
        
       //$url            =   rtrim(__APP__.'/'.$module_name.C('URL_PATHINFO_DEPR').$action_name.C('URL_PATHINFO_DEPR').$parameter,C('URL_PATHINFO_DEPR'));
        $url=$link_module;
        
        //上下翻页字符串
        $upRow          =   $this->nowPage-1;
        $downRow        =   $this->nowPage+1;
        if ($upRow>0){
            $upPage     =   "<a href='javascript:;' onclick='".$link_module."(".$upRow.($parameter?",".$parameter:"").")'>".$this->config['prev']."</a>";
        }else{
            $upPage     =   '';
        }

        if ($downRow <= $this->totalPages){
            $downPage   =   "<a href='javascript:;'  onclick='".$link_module."(".$downRow.($parameter?",".$parameter:"").")'>".$this->config['next']."</a>";
        }else{
            $downPage   =   '';
        }
        // << < > >>
        if($nowCoolPage == 1){
            $theFirst   =   '';
            $prePage    =   '';
        }else{
            $preRow     =   $this->nowPage-$this->rollPage;
            $prePage    =   "<a href='javascript:;' onclick='".$link_module."(".$preRow.($parameter?",".$parameter:"").")' >...</a>";
            $theFirst   =   "<a href='javascript:;' onclick='".$link_module."(1".($parameter?",".$parameter:"").")' >".$this->config['first']."</a>";
        }
        if($nowCoolPage == $this->coolPages){
            $nextPage   =   '';
            $theEnd     =   '';
        }else{
            $nextRow    =   $this->nowPage+$this->rollPage;
            $theEndRow  =   $this->totalPages;
            $nextPage   =   "<a href='javascript:;'  onclick='".$link_module."(".$nextRow.($parameter?",".$parameter:"").")'  >...</a>";
            $theEnd     =   "<a href='javascript:;' onclick='".$link_module."(".$theEndRow.($parameter?",".$parameter:"").")' >".$this->config['last']."</a>";
        }
        // 1 2 3 4 5
        $linkPage = "";
        for($i=1;$i<=$this->rollPage;$i++){
            $page       =   ($nowCoolPage-1)*$this->rollPage+$i;
            if($page!=$this->nowPage){
                if($page<=$this->totalPages){
                    $linkPage .= "&nbsp;<a href='javascript:;'  onclick='".$link_module."(".$page.($parameter?",".$parameter:"").")'>&nbsp;".$page."&nbsp;</a>";
                }else{
                    break;
                }
            }else{
                if($this->totalPages != 1){
                    $linkPage .= "&nbsp;<span class='current'>".$page."</span>";
                }
            }
        }
        $pageStr	 =	 str_replace(
            array('%header%','%nowPage%','%totalRow%','%totalPage%','%upPage%','%downPage%','%first%','%prePage%','%linkPage%','%nextPage%','%end%'),
            array($this->config['header'],$this->nowPage,$this->totalRows,$this->totalPages,$upPage,$downPage,$theFirst,$prePage,$linkPage,$nextPage,$theEnd),$this->config['theme']);
         $pageStr.="<input style='width:20px' type='text' class='txtpage' id='_tz_page_' value='".$this->nowPage."' /><input type='button' value='跳转' class='txtbtn' onclick='".$link_module."(document.getElementById(\"_tz_page_\").value)' />";     
        return $pageStr;
    }
    
     /**
     * 前台页面分页显示输出 js
     * @access public
     * @author lanfengye <zibin_5257@163.com>
     */
    public function home_show_js($link_module) {
        if(0 == $this->totalRows) return '';
        $p              =   $this->varPage;
        $nowCoolPage    =   ceil($this->nowPage/$this->rollPage);
        
        //获取控制器名和方法名，并判断是否url不区分大小写
        // $url_case       =   C('URL_CASE_INSENSITIVE');
        // $group_name    =   $url_case?  parse_name(GROUP_NAME) :   GROUP_NAME;
        // $module_name    =   $url_case?  parse_name(MODULE_NAME) :   MODULE_NAME;
        // $action_name    =   $url_case?  parse_name(ACTION_NAME) :   ACTION_NAME;
        
        //替换附加参数中的分隔符
        $parameter      =   $this->parameter;//str_replace(array('&','='), C('URL_PATHINFO_DEPR'), $this->parameter);

        //增加附加参数
       // $url            =   rtrim(__APP__.'/'.$module_name.C('URL_PATHINFO_DEPR').$action_name.C('URL_PATHINFO_DEPR').$parameter,C('URL_PATHINFO_DEPR'));
        
       //$url            =   rtrim(__APP__.'/'.$module_name.C('URL_PATHINFO_DEPR').$action_name.C('URL_PATHINFO_DEPR').$parameter,C('URL_PATHINFO_DEPR'));
        $url=$link_module;
        
        //上下翻页字符串
        $upRow          =   $this->nowPage-1;
        $downRow        =   $this->nowPage+1;
        if ($upRow>0){
            $upPage     =   "<a href='javascript:;' onclick='".$link_module."(".$upRow.($parameter?",".$parameter:"").")'>".$this->config['prev']."</a>";
        }else{
            $upPage     =   '';
        }

        if ($downRow <= $this->totalPages){
            $downPage   =   "<a href='javascript:;'  onclick='".$link_module."(".$downRow.($parameter?",".$parameter:"").")'>".$this->config['next']."</a>";
        }else{
            $downPage   =   '';
        }
        // << < > >>
        if($nowCoolPage == 1){
            $theFirst   =   '';
            $prePage    =   '';
        }else{
            $preRow     =   $this->nowPage-$this->rollPage;
            $prePage    =   "<a href='javascript:;' onclick='".$link_module."(".$preRow.($parameter?",".$parameter:"").")' >上".$this->rollPage."页</a>";
            $theFirst   =   "<a href='javascript:;' onclick='".$link_module."(1".($parameter?",".$parameter:"").")' >".$this->config['first']."</a>";
        }
        if($nowCoolPage == $this->coolPages){
            $nextPage   =   '';
            $theEnd     =   '';
        }else{
            $nextRow    =   $this->nowPage+$this->rollPage;
            $theEndRow  =   $this->totalPages;
            $nextPage   =   "<a href='javascript:;'  onclick='".$link_module."(".$nextRow.($parameter?",".$parameter:"").")'  >下".$this->rollPage."页</a>";
            $theEnd     =   "<a href='javascript:;' onclick='".$link_module."(".$theEndRow.($parameter?",".$parameter:"").")' >".$this->config['last']."</a>";
        }
        // 1 2 3 4 5
        $linkPage = "";
        for($i=1;$i<=$this->rollPage;$i++){
            $page       =   ($nowCoolPage-1)*$this->rollPage+$i;
            if($page!=$this->nowPage){
                if($page<=$this->totalPages){
                    $linkPage .= "&nbsp;<a href='javascript:;'  onclick='".$link_module."(".$page.($parameter?",".$parameter:"").")'>&nbsp;".$page."&nbsp;</a>";
                }else{
                    break;
                }
            }else{
                if($this->totalPages != 1){
                    $linkPage .= "&nbsp;<a href='javascript:;' class='xia2'>".$page."</a>";
                }
            }
        }
        if($upPage){
        	$upPage="<strong>".$upPage."</strong>";
        }
        
        if($theFirst){
        	$theFirst="<strong>".$theFirst."</strong>";
        }
        if($prePage){
        	$prePage="<strong>".$prePage."</strong>";
        }
        if($linkPage){
        	$linkPage="<span>".$linkPage."</span>";
        }
        if($downPage){
        	$downPage="<strong>".$downPage."</strong>";
        }
        if($nextPage){
        	$nextPage="<strong>".$nextPage."</strong>";
        }
        
        if($theEnd){
        	$theEnd="<strong>".$theEnd."</strong>";
        }
        $pageStr	 =	 str_replace(
            array('%header%','%nowPage%','%totalRow%','%totalPage%','%upPage%','%downPage%','%first%','%prePage%','%linkPage%','%nextPage%','%end%'),
            array($this->config['header'],$this->nowPage,$this->totalRows,$this->totalPages,$upPage,$downPage,$theFirst,$prePage,$linkPage,$nextPage,$theEnd),$this->config['theme']);
        // exit($this->config['theme']);
        return $pageStr;
    }
    
     /**
     * 手机页面分页显示输出 js
     * @access public
     * @author lanfengye <zibin_5257@163.com>
     */
    public function mobile_show_js($link_module) {
        if(0 == $this->totalRows) return '';
        $p              =   $this->varPage;
        
        //获取控制器名和方法名，并判断是否url不区分大小写
        // $url_case       =   C('URL_CASE_INSENSITIVE');
        // $group_name    =   $url_case?  parse_name(GROUP_NAME) :   GROUP_NAME;
        // $module_name    =   $url_case?  parse_name(MODULE_NAME) :   MODULE_NAME;
        // $action_name    =   $url_case?  parse_name(ACTION_NAME) :   ACTION_NAME;
        
        //替换附加参数中的分隔符
        $parameter      =   $this->parameter;//str_replace(array('&','='), C('URL_PATHINFO_DEPR'), $this->parameter);

        //增加附加参数
       // $url            =   rtrim(__APP__.'/'.$module_name.C('URL_PATHINFO_DEPR').$action_name.C('URL_PATHINFO_DEPR').$parameter,C('URL_PATHINFO_DEPR'));
        
       //$url            =   rtrim(__APP__.'/'.$module_name.C('URL_PATHINFO_DEPR').$action_name.C('URL_PATHINFO_DEPR').$parameter,C('URL_PATHINFO_DEPR'));
        $url=$link_module;
        
        //上下翻页字符串
        $upRow          =   $this->nowPage-1;
        $downRow        =   $this->nowPage+1;
        if ($upRow>0){
            $upPage     =   "<a href='javascript:;' onclick='".$link_module."(".$upRow.($parameter?",".$parameter:"").")'>".$this->config['prev']."</a>";
        }else{
            $upPage     =   "<span>".$this->config['prev']."</span>";
        }

        if ($downRow <= $this->totalPages){
            $downPage   =   "<a href='javascript:;'  onclick='".$link_module."(".$downRow.($parameter?",".$parameter:"").")'>".$this->config['next']."</a>";
        }else{
            $downPage   =   "<span>".$this->config['next']."</span>";
        }
        // << < > >>
        if($this->nowPage <= 1){
            $theFirst   =   "<span>首页</span>";
        }else{
            $theFirst   =   "<a href='javascript:;' onclick='".$link_module."(1".($parameter?",".$parameter:"").")' >首页</a>";
        }
        if($this->nowPage >= $this->totalPages){
            $nextPage   =   '';
            $theEnd     =   "<span>尾页</span>";
        }else{
           $theEnd     =   "<a href='javascript:;' onclick='".$link_module."(".$this->totalPages.($parameter?",".$parameter:"").")' >尾页</a>";
        }
        
        	$upPage="<strong>".$upPage."</strong>";
        
        
        	$theFirst="<strong>".$theFirst."</strong>";
       
        	$downPage="<strong>".$downPage."</strong>";
       
        
        	$theEnd="<strong>".$theEnd."</strong>";
        
        $pageStr	 =	 str_replace(
            array('%header%','%nowPage%','%totalRow%','%totalPage%','%upPage%','%downPage%','%first%','%end%'),
            array($this->config['header'],$this->nowPage,$this->totalRows,$this->totalPages,$upPage,$downPage,$theFirst,$theEnd),$this->config['theme']);
        // exit($this->config['theme']);    
        return $pageStr;
    }
    

    /**
     * 分页显示输出
     * @access public
     * @author lanfengye <zibin_5257@163.com>
     */
    // public function show() {
    //     if(0 == $this->totalRows) return '';
    //     $p              =   $this->varPage;
    //     $nowCoolPage    =   ceil($this->nowPage/$this->rollPage);
        
    //     //获取控制器名和方法名，并判断是否url不区分大小写
    //     $url_case       =   C('URL_CASE_INSENSITIVE');
    //     $group_name    =   $url_case?  parse_name(GROUP_NAME) :   GROUP_NAME;
    //     $module_name    =   $url_case?  parse_name(MODULE_NAME) :   MODULE_NAME;
    //     $action_name    =   $url_case?  parse_name(ACTION_NAME) :   ACTION_NAME;
        
    //     //替换附加参数中的分隔符
    //     $parameter      =   $this->parameter;//str_replace(array('&','='), C('URL_PATHINFO_DEPR'), $this->parameter);

    //     //增加附加参数
    //    // $url            =   rtrim(__APP__.'/'.$module_name.C('URL_PATHINFO_DEPR').$action_name.C('URL_PATHINFO_DEPR').$parameter,C('URL_PATHINFO_DEPR'));
        
    //    //$url            =   rtrim(__APP__.'/'.$module_name.C('URL_PATHINFO_DEPR').$action_name.C('URL_PATHINFO_DEPR').$parameter,C('URL_PATHINFO_DEPR'));
    //     $url=$group_name."/".$module_name."/".$action_name;
    //     //上下翻页字符串
    //     $upRow          =   $this->nowPage-1;
    //     $downRow        =   $this->nowPage+1;
    //     if ($upRow>0){
    //         $upPage     =   "<a href='".U($url,$parameter."&".$p."=".$upRow)."'>".$this->config['prev']."</a>";
    //     }else{
    //         $upPage     =   '';
    //     }

    //     if ($downRow <= $this->totalPages){
    //         $downPage   =   "<a href='".U($url,$parameter."&".$p."=".$downRow)."'>".$this->config['next']."</a>";
    //     }else{
    //         $downPage   =   '';
    //     }
    //     // << < > >>
    //     if($nowCoolPage == 1){
    //         $theFirst   =   '';
    //         $prePage    =   '';
    //     }else{
    //         $preRow     =   $this->nowPage-$this->rollPage;
    //         $prePage    =   "<a href='".U($url,$parameter."&".$p."=".$preRow)."' >上".$this->rollPage."页</a>";
    //         $theFirst   =   "<a href='".U($url,$parameter."&".$p."=1")."' >".$this->config['first']."</a>";
    //     }
    //     if($nowCoolPage == $this->coolPages){
    //         $nextPage   =   '';
    //         $theEnd     =   '';
    //     }else{
    //         $nextRow    =   $this->nowPage+$this->rollPage;
    //         $theEndRow  =   $this->totalPages;
    //         $nextPage   =   "<a href='".U($url,$parameter."&".$p."=".$nextRow)."' >下".$this->rollPage."页</a>";
    //         $theEnd     =   "<a href='".U($url,$parameter."&".$p."=".$theEndRow)."' >".$this->config['last']."</a>";
    //     }
    //     // 1 2 3 4 5
    //     $linkPage = "";
    //     for($i=1;$i<=$this->rollPage;$i++){
    //         $page       =   ($nowCoolPage-1)*$this->rollPage+$i;
    //         if($page!=$this->nowPage){
    //             if($page<=$this->totalPages){
    //                 $linkPage .= "&nbsp;<a href='".U($url,$parameter."&".$p."=".$page)."'>&nbsp;".$page."&nbsp;</a>";
    //             }else{
    //                 break;
    //             }
    //         }else{
    //             if($this->totalPages != 1){
    //                 $linkPage .= "&nbsp;<span class='current'>".$page."</span>";
    //             }
    //         }
    //     }
    //     $pageStr	 =	 str_replace(
    //         array('%header%','%nowPage%','%totalRow%','%totalPage%','%upPage%','%downPage%','%first%','%prePage%','%linkPage%','%nextPage%','%end%'),
    //         array($this->config['header'],$this->nowPage,$this->totalRows,$this->totalPages,$upPage,$downPage,$theFirst,$prePage,$linkPage,$nextPage,$theEnd),$this->config['theme']);
    //     return $pageStr;
    // }
    
    public function now_page(){
    	return $this->nowPage;
    }

}