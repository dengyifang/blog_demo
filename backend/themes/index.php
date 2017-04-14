<!-- 内容展示 -->
<div class="public-ifame mt20">
	<div class="content">

		<div class="clearfix"></div>
		<!-- 左侧导航栏 -->
		<div class="public-ifame-leftnav">

			<ul class="left-nav-list">
				<li class="public-ifame-item">
					<a href="admin.php?r=site/basic" style="font-weight:900;font-size:16px;">基础设置</a>
					<div class="ifame-item-sub"  
                        <?php
                         if($banner == "basic"){
                         	echo 'style="display:block"';
                         }
                        ?>
					>
						<ul>
							<li 
                                <?php
                                  if($action == "catg"){
                                  	echo 'class="active"';
                                  }
                                  ?>
							><a href="admin.php?r=site/basic&action=catg">栏目设置</a></li>
							<li 
                                <?php
                                  if($action == "lantern"){
                                  	echo 'class="active"';
                                  }
                                  ?>
							><a href="admin.php?r=site/basic&action=lantern">首页幻灯</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="admin.php?r=site/member" style="font-weight:900;font-size:16px;">会员管理</a>
					<div class="ifame-item-sub" 
                        <?php
                         if($banner == "member"){
                         	echo 'style="display:block"';
                         }
                        ?>
					>
						<ul>
							<li 
                                <?php
                                  if($action == "operator"){
                                  	echo 'class="active"';
                                  }
                                ?>
							><a href="admin.php?r=site/member&action=operator">后台操作员</a></li>
							<li 
                                <?php
                                  if($action == "member"){
                                  	echo 'class="active"';
                                  }
                                ?>
							><a href="admin.php?r=site/member&action=member">网站会员</a></li>
							
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="admin.php?r=site/content" style="font-weight:900;font-size:16px;">内容管理</a>
					<div class="ifame-item-sub" 
                        <?php
                         if($banner == "content"){
                         	echo 'style="display:block"';
                         }
                        ?>
					>
						<ul>
							<li 
                                <?php
                                  if($action == "boke"){
                                  	echo 'class="active"';
                                  }
                                ?>
							><a href="admin.php?r=site/content&action=boke">博客列表</a></li>
						    <li 
                                <?php
                                  if($action == "boke_fabu"){
                                  	echo 'class="active"';
                                  }
                                ?>
						    ><a href="admin.php?r=site/content&action=boke_fabu">发布博客</a></li>
<!-- 							<li 
                                <?php
                                 // if($action == "comment"){
                                 //	echo 'class="active"';
                                 // }
                                ?>
							><a href="admin.php?r=site/content&action=comment">评论管理</a></li> -->
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<!-- 右侧内容展示部分 -->
		<div class="public-ifame-content">
		  <div class = "right-title">
            <p>您当前的位置:&nbsp;
             <?php
               echo $righttitle;
             ?> 
            </p>
          </div>
          <div class = "right-content">
             <?php 
                echo $rightstr;
             ?>
          </div>
		</div>
	</div>
</div>
<script>
</script>