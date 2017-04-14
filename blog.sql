-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 �?04 �?13 �?10:53
-- 服务器版本: 5.5.53
-- PHP 版本: 5.6.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `blog_adminuser`
--

CREATE TABLE IF NOT EXISTS `blog_adminuser` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_open` smallint(2) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `blog_adminuser`
--

INSERT INTO `blog_adminuser` (`id`, `username`, `mobile`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `is_open`, `created_at`, `updated_at`) VALUES
(1, 'test', 18335102123, 'zogZ8wYgG4N8cgwnyD3bdm1qzLAmojRg', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', NULL, '905254174@qq.com', 1, 1486982408, 1487935189),
(5, 'test-admin', 15937728347, 'zogZ8wYgG4N8cgwnyD3bdm1qzLAmojRg', '$2y$13$zBBJXvUR0vI7DY4ve7nhk.ONW0B/KfSOnqKNCKd9ace/v9WSqCxWG', NULL, '905254174@qq.com', 1, 1486982408, 1487923235),
(9, 'test-guanli', 15537771431, 'zogZ8wYgG4N8cgwnyD3bdm1qzLAmojRg', '$2y$13$8Cb2B//tL.rl9wnS1CZCEumavDzEP.NZQ9zk8zn5yyAOidyJQ3bYC', NULL, '905254174@qq.com', 1, 1486982408, 1486982408);

-- --------------------------------------------------------

--
-- 表的结构 `blog_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `blog_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_auth_assignment`
--

INSERT INTO `blog_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('adminManger', '1', 1489889737),
('adminManger', '5', 1487923279),
('commentManger', '1', 1489889737),
('postManger', '1', 1489889737),
('postManger', '5', 1487923279);

-- --------------------------------------------------------

--
-- 表的结构 `blog_auth_item`
--

CREATE TABLE IF NOT EXISTS `blog_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_auth_item`
--

INSERT INTO `blog_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('adminManger', 1, '操作员管理员', NULL, NULL, 1487811707, 1487811707),
('commentManger', 1, '评论管理员', NULL, NULL, 1487811707, 1487811707),
('creatPost', 2, '创建文章权限', NULL, NULL, 1487811707, 1487811707),
('deleteAdmin', 2, '删除操作员权限', NULL, NULL, 1487811707, 1487811707),
('deleteComment', 2, '删除评论权限', NULL, NULL, 1487811707, 1487811707),
('deletePost', 2, '删除文章', NULL, NULL, 1487811707, 1487811707),
('postManger', 1, '文章管理员', NULL, NULL, 1487811707, 1487811707),
('readComment', 2, '阅读评论权限', NULL, NULL, 1487811707, 1487811707),
('statusAdmin', 2, '操作员状态改变权限', NULL, NULL, 1487811707, 1487811707);

-- --------------------------------------------------------

--
-- 表的结构 `blog_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `blog_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_auth_item_child`
--

INSERT INTO `blog_auth_item_child` (`parent`, `child`) VALUES
('postManger', 'creatPost'),
('adminManger', 'deleteAdmin'),
('commentManger', 'deleteComment'),
('postManger', 'deletePost'),
('commentManger', 'readComment'),
('adminManger', 'statusAdmin');

-- --------------------------------------------------------

--
-- 表的结构 `blog_auth_rule`
--

CREATE TABLE IF NOT EXISTS `blog_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `blog_comment`
--

CREATE TABLE IF NOT EXISTS `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `remind` int(4) DEFAULT '0' COMMENT '0:未提醒1：已提醒',
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`post_id`),
  KEY `FK_comment_user` (`userid`),
  KEY `FK_comment_status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=101 ;

--
-- 转存表中的数据 `blog_comment`
--

INSERT INTO `blog_comment` (`id`, `content`, `status`, `create_time`, `userid`, `email`, `url`, `post_id`, `remind`) VALUES
(88, '假设你想通过 RESTful 风格的 API 来展示用户数据。用户数据被存储在用户DB表， 你已经创建了 yii\\db\\ActiveRecord 类 app\\models\\User 来访问该用户数据.', 2, 1443004317, 1, 'sxb@hotmail.com', '', 41, 1),
(89, 'yii\\db\\Query::one() 方法只返回查询结果当中的第一条数据， 条件语句中不会加上 LIMIT 1 条件。如果你清楚的知道查询将会只返回一行或几行数据 （例如， 如果你是通过某些主键来查询的），这很好也提倡这样做。但是，如果查询结果 有机会返回大量的数据时，那么你应该显示调用 limit(1) 方法，以改善性能。 例如， (new \\yii\\db\\Query())->from(''user'')->limit(1)->one()。', 2, 1443004455, 1, 'somuchfun@gmail.com', '', 39, 1),
(90, '传说中的沙发', 2, 1443004561, 1, 'lsf@ggoc.com', '', 34, 1),
(91, '当你在调用 yii\\db\\Query::all() 方法时，它将返回一个以连续的整型数值为索引的数组。 而有时候你可能希望使用一个特定的字段或者表达式的值来作为索引结果集数组。那么你可以在调用 yii\\db\\Query::all() 之前使用 yii\\db\\Query::indexBy() 方法来达到这个目的。', 2, 1443047988, 1, 'ctq@qq.com', '', 39, 1),
(92, '如需使用表达式的值做为索引，那么只需要传递一个匿名函数给 yii\\db\\Query::indexBy() 方法即可', 1, 1443049673, 1, 'kiki@qq.com', '', 39, 1),
(93, 'yii\\db\\Query::one() 方法只返回查询结果当中的第一条数据， 条件语句中不会加上 LIMIT 1 条', 2, 1443927141, 2, 'csc@bing.com', '', 39, 1),
(94, '你应该在 响应格式 部分中过滤掉这些字段。', 1, 1444267750, 1, 'wj@163.com', 'www.wj.com', 41, 1),
(95, '适合用常规格式显示一个模型（例如在一个表格的一行中显示模型的每个属性）。', 2, 1444377054, 1, 'tester@example.com', 'www.baidu.com', 36, 1),
(96, '魏老师，看了你的视频深入浅出，受益匪浅。真的非常非常感谢您！', 2, 1479353395, 2, 'mchael@163.com', NULL, 42, 1),
(97, '老师权限控制讲的很好，想听老师讲下 管理员操作日志和数据库备份', 2, 1479353438, 2, 'mchael@163.com', NULL, 42, 1),
(98, '魏老师,看了你的视频学到了很多,真心不错.咱们这套视频学完,有用户搜索文章的功能么?', 2, 1479353455, 2, 'mchael@163.com', NULL, 42, 1),
(99, '魏老师，看了你的视频深入浅出，受益匪浅。真的非常非常感谢您！', 1, 1479353617, 2, 'mchael@163.com', NULL, 42, 1),
(100, ' 点赞，学生自学党，实战课程在很多网站都要钱。', 1, 1479364784, 2, 'mchael@163.com', NULL, 42, 1);

-- --------------------------------------------------------

--
-- 表的结构 `blog_lantern`
--

CREATE TABLE IF NOT EXISTS `blog_lantern` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `is_show` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `blog_lantern`
--

INSERT INTO `blog_lantern` (`id`, `title`, `img_url`, `link_url`, `remark`, `level`, `is_show`) VALUES
(1, '手机QQ话费券2-3元扫码秒领（长期更新', 'http://static.feifeiboke.com/img/201611/sjqq_hfq_idx.png', 'index.php?r=post%2Fview&id=2', 'QQ话费', 1, 1),
(2, '手机QQ话费券2-3元扫码秒领', 'http://p8.qhimg.com/t01c83ce79cd05242cd.jpg?size=582x418', 'index.php?r=post%2Fview&id=3', '京东券', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `blog_post`
--

CREATE TABLE IF NOT EXISTS `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catg_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cover_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `read_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_author` (`author_id`),
  KEY `FK_post_status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `blog_post`
--

INSERT INTO `blog_post` (`id`, `catg_id`, `title`, `cover_url`, `content`, `tags`, `status`, `create_time`, `update_time`, `author_id`, `read_count`) VALUES
(1, 2, '无需密码直接获取你的QQ空间主人权限', 'http://static.feifeiboke.com/img/201611/qqkjqx_idx.png', '<p>前段时间分享了关于<a href="http://www.feifeiboke.com/qqjiqiao/3679.html" target="_blank">QQSkey权限</a>的安全与防范，今天我们再来探讨另一权限代码大法：不用密码也能直接登陆你的QQ空间、并且轻松拿到QQ空间主人管理权限！</p>\n<p><b>简单原理</b></p>\n<p style="margin-top:8px">当我们从电脑QQ上直接进入QQ空间时，会发现不用登陆就可以直接进入自己的空间，这是如何实现的？很简单，QQ在调用浏览器打开空间时会传入一个用于自动登陆的 URL（网址）。</p>\n<p>QQ空间服务器就是通过这个URL传入的 ClientKey 来验证以及识别用户权限的，如果你的权限码被别人拿到了，那么<span style="color:#940000;">别人就可以轻易登陆你的QQ空间</span>，即使没有密码也可以办到！</p>\n<p><b>实战验证</b></p>\n<p style="margin-top:8px">干说不练假大空，为了让童鞋们获知QQ ClientKey 带来的安全隐患，我们来简单测试一下。</p>\n<p>很多朋友没有清理浏览器历史访问记录的习惯，而这恰恰给有心之人拿到权限码的可乘之机，要是私人电脑还好，如果是公共电脑，比如网吧、单位，或别人的电脑等等那就小心了~</p>\n<p>在浏览器地址栏输入【qq】两个字母，看看会发生什么？</p>\n<p style="text-align:center"><img alt="ptlogin开头的网址可以直接登陆空间" src="http://static.feifeiboke.com/img/201611/qzone_loginurl.jpg" width="617" height="297" /></p>\n<p>你会发现地址栏中出现了一个 <span style="color:#013add;">ssl.ptlogin2.qq.com</span> &nbsp;的网址，这个地址就是用于QQ直接调用自动登陆的验证URL，一旦这个验证地址被别人拿到了，别人也就可以自动登陆你的空间！</p>\n<p>Tips：当然这个验证URL有一定的时效性，如果你的QQ已经下线或者过期就可能会失效！</p>\n<p><b>封堵隐患</b></p>\n<p style="margin-top:8px">如果你经常在公共电脑上使用QQ，请养成良好的清理上网记录习惯，比如 360浏览器等等，可以直接使用 Ctrl+Shift+Delete 快捷键来清理上网痕迹。</p>\n<p style="text-align:center">最方便的方法就是，勾选“退出浏览器时完全清除痕迹”！</p>\n<p style="text-align:center"><img alt="最好养成经常清理浏览器访问记录的习惯" src="http://static.feifeiboke.com/img/201611/clean_data.jpg" width="503" height="350" /></p>', 'hello,world', 1, 1486955684, 1486959230, 1, 40),
(2, 2, 'QQ空间最新快速解除封禁的方法都在这里了', 'https://img12.360buyimg.com/n4/s130x130_jfs/t4003/15/1637857570/255280/19e4c26c/588469e7Nbff33ddf.jpg', '<p>最近收到不少Q友的求助，都是由于QQ空间被封锁而无法访问了。确实近年来腾讯封空间的打击力度一直在加强，稍不留神被别人举报就有可能中招。那么如何快速解封空间呢？</p>\n<p>据菲菲君多年来积攒下来的经验值来看，空间被封的严重级别不同，解封方法也不太一样。</p>\n<p>你可以直接访问 <a href="http://view.yutu.qq.com/yutu/activity/3856.html" target="_blank">http://view.yutu.qq.com/yutu/activity/3856.html</a> ，选择『<span style="color:#bb005f;">一键诊断</span>』自己的空间异常状态，按提示根据自己空间的封禁严重程度来解封空间。</p>\n<p><strong>1、轻度禁言</strong></p>\n<p>空间可以正常访问，但是不能发表说说、或不能发图片、回复评论等等，这种情况通常不太严重，只需要发送验证手机短信，一般就可以解除封禁。</p>\n<p style="text-align:center"><img alt="发送解禁短信费用为每条0.1元" src="http://static.feifeiboke.com/img/201611/qqkj_fsdx.jpg" width="629" height="167" /></p>\n<p>具体方法：编辑短信 <u>SZQJJ#QQ号</u> 发送至 <u>10690700394</u> （支持移动 联通 电信）</p>\n<p style="margin-top:8px">例如：需解禁的QQ号为12345，请新建短信内容 SZQJJ#12345 发给10690700394 即可。</p>\n<p><strong>2、重度被封</strong></p>\n<p>这种情况他人已经无法访问你的空间，但自己可以从电脑上进自己空间，顶部会出现“<span style="color:#940000;">小黄条</span>”提示，这种情况需要全部清理掉空间违规信息（包括说说、日志、留言、相册、分享等等），然后按提示进入“小黄条”的申诉入口，提交申诉申请。</p>\n<p style="text-align:center"><img alt="自己能进空间的情况，可以提交申诉" src="http://static.feifeiboke.com/img/201611/qqkj_jfss.jpg" width="650" height="146" /></p>\n<p>【重要提示】不对违规信息彻底清理，恶意提交申诉，可能会导致空间永久被封闭！</p>\n<p><strong>3、永久被封</strong></p>\n<p>QQ空间最严重的封禁级别，自己和别人都不能访问了。如果是这种情况通常就无能无力了，你只能抱着碰碰运气的想法，进入唯一的“我要申诉”入口，提交申诉表。</p>\n<p style="text-align:center"><img alt="QQ永久被封的情况，通常只能放弃了" src="http://static.feifeiboke.com/img/201611/qqkj_yjbf.jpg" width="530" height="277" /></p>\n<p>【温馨提醒】出现这种情况就很严重了，如果提交一次申诉没通过，那就放弃吧~ 悲剧了..</p>', 'hello,world', 1, 1487898609, 1486959230, 5, 140),
(3, 2, 'QQ音乐免流量听歌加速QQ等级 原来很简单', 'https://img1.360buyimg.com/da/jfs/t3133/89/5984232745/66970/beaf615c/589ac9bcNe544a72e.jpg', '<p>使用手机QQ音乐听歌儿就能免费享受QQ等级额外的加速特权，这一点是小伙伴们都晓得的，也是目前腾讯主打的QQ升级策略之一。其实，不需要耗费什么流量也能尊享加速哟！</p>\n<p>对了，插播一条消息：<span style="color:#d40a00;">QQ音乐听歌加速0.5天的特权，即将于2016年12月31日结束</span>！</p>\n<p>哎呀，还没怎么开始就快要结束了，还没有赶上车的同学最后一个月的末班车表在错过啦~</p>\n<p>切回正题，那么如何才能实现免流量也能享受加速QQ等级呢？流量党表示伤不起啊…… 其实，不知道大家注意到了没，在QQ音乐“我的等级”加速任务里已经说的很清楚咧~</p>\n<p style="text-align:center"><strong>使用手机QQ音乐听本地歌曲也是能享受加速的！</strong></p>\n<p style="text-align:center"><img alt="通过QQ音乐听已经下载好的歌曲也能获得加速的" src="http://static.feifeiboke.com/img/201611/qqyy_jstq.jpg" width="331" height="588" /></p>\n<p>如果单纯想要加速的话，完全可以提前下载好一首本地歌曲，将手机静音、关屏，静静的让它在后台播放1个小时，就完事儿啦~ 当然在后台播放的过程中，还是要耗费那么一丢丢儿流量，用于同步听歌时间，<span style="color:#c001cb;">不能关掉流量开关</span>，这一点别落下了噢~</p>\n<p style="text-align:center;margin:30px 50px;padding-bottom:10px;border-bottom: 1px dashed #827e7f;"><span style="color:#827e7f;">我是调皮的分割线~ </span></p>\n<p>另外顺手提一下，每周两次的分享加速任务也别浪费了啊，有童鞋来问至今也没找到分享任务的入口，这里看图吧。在听歌界面点击分享到QQ空间或微信朋友圈才算有效捏！</p>\n<p style="text-align:center"><img alt="分享任务加速QQ等级的操作入口" src="http://static.feifeiboke.com/img/201611/qqyy_fxjs.jpg" width="609" height="540" /></p>\n<p>Tips：QQ音乐分享歌曲加速特权，目前有效期截止到2017年12月31日，还有一年多呢。</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 98),
(4, 2, '利用PCQQ穿透内网 实现远程控制目标电脑', 'https://img1.360buyimg.com/da/jfs/t3133/89/5984232745/66970/beaf615c/589ac9bcNe544a72e.jpg', '<p>随着互联网爆炸性的发展，公网IP几乎已经耗尽，因此现在家庭宽带WAN出口IP都被运营商映射为了内网，给我们使用远程桌面控制带来了很多不便……</p>\n<p>其实利用我们平时最常用的<span style="color:#9b014f;">电脑QQ客户端，就可以轻松实现穿透内网</span>、直接远程控制家里或单位、学校等等掩藏在内网之下的电脑的目的，没啥技术含量哈，这里就简单介绍一二~</p>\n<p>平时我们使用PCQQ连接远程协助的时候，大多需要对方同意后才能连接。其实，只要简单设置一下，就可以自动接受远程请求，这样电脑无人值守也能连接成功。</p>\n<p><b>在被控制的目标电脑上登陆QQ小号，如下操作</b>：</p>\n<p>1、在QQ聊天窗口选择 远程桌面 → 设置 ，打开QQ远程桌面的选项；</p>\n<p style="text-align:center"><img alt="打开QQ远程桌面的设置选项" src="http://static.feifeiboke.com/img/201611/qqyczm_set.jpg" width="474" height="256" /></p>\n<p>2、选择“自动接受连接请求”（在前面打勾选中此功能）</p>\n<p style="text-align:center"><img alt="开启自动远程连接功能" src="http://static.feifeiboke.com/img/201611/qqyczm_enable.jpg" width="608" height="353" /></p>\n<p>3、最后选择可以自动连接此电脑的QQ好友（自己的大号），以及连接密码就可以了。</p>\n<p style="text-align:center"><img alt="添加允许连接此电脑的QQ好友" src="http://static.feifeiboke.com/img/201611/qqyczm_tjhy.jpg" width="486" height="418" /></p>\n<p>4、需要连接远程连接时，只需要在PCQQ上登陆大号，打开和自己小号的聊天窗口，选择 远程桌面 → 请求控制对方电脑 → 输入连接密码，即可成功建立远程桌面。</p>\n<p style="text-align:center"><img alt="输入上面小号设置的远程密码即可连接" src="http://static.feifeiboke.com/img/201611/qqyczm_passwd.png" width="525" height="363" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 125),
(5, 2, '火影VIP付费图标 唯独不花钱就能点亮', 'https://img1.360buyimg.com/da/jfs/t3133/89/5984232745/66970/beaf615c/589ac9bcNe544a72e.jpg', '<p>话说火影VIP这个QQ图标还真是够奇葩的，别的什么钻、什么VIP都是需要包月购买才能使用，而唯独火影VIP“忍”字这个任性哒小图标不能包月，也不能花钱来开通业务。</p>\n<p>更诡异的是菲菲君自个儿的宅枚图标不知道怎么，<span style="color:#940000;">无缘无故的自己就自动亮起来了</span>。有小伙伴来问道了，这里就简单介绍一下这个目前唯一可以免费点亮的“付费”图标咯！</p>\n<p>火影忍字VIP图标点亮入口：<a href="http://huoying.qq.com/cp/a20160420dltb/index.htm" target="_blank">http://huoying.qq.com/cp/a20160420dltb/index.htm</a></p>\n<p>简单看一下腾讯给出的点亮条件：</p>\n<ul style="padding:12px 0 0 26px">\n<li>在《火影忍者》游戏中<span style="color:#940000;">达到32级</span> → 领取VIP体验勋章 → 满足要求图标点亮</li>\n<li>继续练级，达到40级可升级二级图标、50级三级图标，以此类推 ……</li></ul>\n<p style="text-align:center"><img alt="满足游戏等级≥32级才能点亮" src="http://static.feifeiboke.com/img/201611/hyviptb.jpg" width="600" height="276" /></p>\n<p>可是我从未玩过此等游戏，更别说升32级了，为什么忍字图标也会自动亮了呢？</p>\n<p>目前来看暂时不得而知，不滋道大家有木有遇到这种情况，如果你发现其中的“蹊跷”，欢迎投稿和众多图标党一起分享自己的独到见解！~</p>\n<p>对了，刚刚发的<a href="http://www.feifeiboke.com/huodong/3698.html" target="_blank">VIP勋章领取活动</a>，不知道能不能用于直接点亮图标，小伙伴们可以一试（ps：刚刚上马一个小号测试了一下，暂时图标还没亮，后续进展会继续跟进）！</p>\n<p style="text-align:center"><img alt="我的忍字图标已经自动点亮了" src="http://static.feifeiboke.com/img/201611/hyvip_dl.jpg" width="421" height="173" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 128),
(6, 2, 'QQ名片超简单刷赞 每天5分钟日刷100+', 'https://img1.360buyimg.com/da/jfs/t3133/89/5984232745/66970/beaf615c/589ac9bcNe544a72e.jpg', '<p>昨天分享的全新<a href="http://www.feifeiboke.com/huodong/3695.html" target="_blank">电脑QQ8.8版本</a>不滋道小伙伴们是否更新了捏，其中最大的变化就是电脑QQ名片也支持点赞了，而且跟手机版完全无缝对接，刷赞党最爱，毕竟电脑上操作方便~</p>\n<p>我们利用的就是<strong>每个小号每天可以给QQ主号点赞10次</strong>、并且不需要加好友，直接打开大号QQ的名片卡，就能点赞了，快速点10次鼠标就搞定，没有频率限制~</p>\n<p>当然手机党也可以直接在手机QQ端操作，同样每个小号每天可以点10个赞</p>\n<p style="text-align:center"><img alt="电脑QQ客户端最新版也支持点赞啦" src="http://static.feifeiboke.com/img/201611/pcqq_dianzan.png" width="598" height="399" /></p>\n<p>多年来一直压箱底儿的QQ小号存货终于可以拿出来派上用场啦！10个小号每天点赞100次~</p>\n<p>那么问题来了，没有那么多小号马甲咋办？</p>\n<p>QQ注册入口：<a href="https://ssl.zc.qq.com/chs/index.html" target="_blank">https://ssl.zc.qq.com/chs/index.html</a></p>\n<p>菲菲君暂时就帮你到这儿了，当然偶尔会遇到频繁申请限制的问题，这种情况可以尝试清除浏览器缓存、以及更换IP地址再试。通常重启路由器可以直接更换外网IP。</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 124),
(7, 2, '查出电脑上所有曾经登过的QQ 包括删了的', 'https://img1.360buyimg.com/da/jfs/t3133/89/5984232745/66970/beaf615c/589ac9bcNe544a72e.jpg', '<p>这年头密码太多记不过来，常常忘记QQ密码这事儿相信童鞋们都干过，密码忘了好歹可以通过密保找回，但是忘掉了QQ号码（新号）这该咋整捏？其实很简单，一起来围观~</p>\n<p>只要你的QQ号码曾经在QQ客户端上正常使用过，就会在电脑C盘数据目录中留下历史记录，即便你<span style="color:#940000;">完全删除了QQ登录框中的记录信息</span>，或者卸载了QQ软件，也能轻松全部找回哟！</p>\n<p>按 <u>Win徽标+R</u> 快捷键打开运行框，输入如下代码：</p>\n<pre class="new_code" style="color:#444;font-size:14px">\n%AppData%\\Tencent\\QQMiniDL\n</pre>\n<p style="text-align:center"><img alt="或者在开始菜单里也能打开运行框" src="http://static.feifeiboke.com/img/201611/start_rundir.png" width="408" height="234" /></p>\n<p>点击“确定”后，就可以找到所有曾经在此台电脑上登陆过的QQ号码历史记录，除非你手动删除清理掉了，或者重装了操作系统。那么只能尝试文件恢复的办法来搞定了。。</p>\n<p style="text-align:center"><img alt="进入QQMiniDL文件夹，就能找到那些已删除的QQ啦" src="http://static.feifeiboke.com/img/201611/qqnum_history.png" width="633" height="378" /></p>\n<p><b>Tips：</b>以上方法对于XP和Win7+系统全适用。另外Win徽标键位于键盘的左下角，Ctrl键与Alt键中间的那一个键就是它了！</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 126),
(8, 3, '万能钥匙破解WiFi密码你所不懂的那点事儿', 'http://static.feifeiboke.com/img/201611/wifimm_idx.png', '<p>一把万能钥匙握在手，全城WiFi热点密码全都有。提到WiFi万能钥匙，大家都很熟悉了，利用这个APP基本上很大一部分的无线密码都可以轻松“破解”掉，绝对的蹭网神器也~</p>\n<p>这里所谓的破解为什么要加上引号呢？菲菲君先来简单扫盲。</p>\n<p>其实，WiFi钥匙之类的免费WiFi软件，其原理并不是真正意义上的暴力破解，而是利用云端的密钥共享机制。用我们的大白话来讲，就是当你使用万能钥匙连接WiFi时，你的无线密码和路由信息就可能被上传到人家的服务器了，这样别人来蹭你网的时候就可以直接连接而无需输入密码。同理，你也可以免密码连接别人家的WiFi，正所谓人人为我，我为人人也。</p>\n<p><b>有的小伙伴可能会疑惑，我并没有用过万能钥匙之类的APP，为什么自己家的密码也会被不明原因，不知何时何故泄漏出去呢？</b></p>\n<p>你不用不代表你的朋友家人没用过呀，<span style="color:#6d201b;">所有曾经连接过你家WiFi，知道你密码的人都有可能通过WiFi钥匙类的软件将密码泄漏出去</span>。这个时候，潜在的网络隐患就可能出现：</p>\n<ul style="padding:12px 0 0 33px">\n<li>自己家的无线密码如果是手机号之类的，导致个人隐私泄漏</li>\n<li style="margin-top:6px">不速之客悄无声息来蹭网，劫持内网盗取网络、支付帐号，危险！</li>\n<li style="margin-top:6px">自家“小水管”本来就不宽裕，蹭网者挂个迅雷/在线视频什么的，网速侵占</li>\n<li style="margin-top:6px">自家路由默认管理密码没有修改，或太过简单，被坏人获得管理权，篡改劫持DNS</li></ul>\n<p>童鞋们可以自行对号入座，看看自个人有木有躺枪。万一中枪咋么办？赶紧改密码呗！</p>\n<p>这里我们重点来围观第一条，在使用万能钥匙“破解”密码过程中，并没有明文密码可以看到啊，怎么会被人知道无线密码的明文呢？的确，这并不是万能钥匙类软件的Bug。</p>\n<p>真正的问题所在是，<strong>Android 手机系统的无线密码默认就是以明文形式存储的</strong>，只是由于默认无Root权限情况下不可见。但只要你的手机获取root，所有曾经连接过的无线热点密码都可以一览无余，包括你手动输入密码的，以及免费WiFi软件自动破解连接过的。</p>\n<p>在已经获取ROOT权限的安卓设备上，将手机连接电脑开启USB调试，通过<a href="http://www.feifeiboke.com/android/3150.html" target="_blank">adb工具</a>执行以下命令，所有之前连接成功过的无线热点和密码等信息，一目了然的出现了！</p>\n<pre class="new_code">adb shell su -c "cat /data/misc/wifi/wpa_supplicant.conf"</pre>\n<p>【Tips】不会使用adb工具或者不方便连接电脑也没有关系，请自行温习菲菲博客之前的文章，利用re管理器也可以<a href="http://www.feifeiboke.com/android/3125.html" target="_blank">查看WiFi本地密码</a>，当然前提是ROOT权限是必须哒~</p>\n<p style="text-align:center"><img alt="通过adb或手机模拟终端执行该命令即可查看" src="http://static.feifeiboke.com/img/201609/wifi_passwd.jpg" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 132),
(9, 3, '通过手机或PC对另一部手机进行远程控制', 'https://img14.360buyimg.com/n3/jfs/t3034/299/2060854617/119711/577e85cb/57d11b6cN1fd1194d.jpg', '<p>前几天和童鞋们一起学习了手机远程电脑的小招法，那么能不能反过来，在电脑上或者手机上远程控制（监控）另一部智能手机呐？这当然可以了，同样利用TeamViewer就能办到！</p>\n<p><b>温馨提示：</b>如果需要对目标手机进行实时远程操控，<span style="color:#bb005f;">目标受控手机需要ROOT权限</span></p>\n<p>1、在需要被控制的目标手机上下载安装，打开 QuickSupport APP（受控端）</p>\n<p><div class="dlbor"><a href="http://static.feifeiboke.com/dl/quick_support.apk" hidefocus="true" class="dl" target="_blank">QuickSupport　(10.9M)</a>　　<a href="javascript:;" class="bigimg"><img align="absMiddle" src="/css/images/qrcode.png" width="36" height="36" /><span><img src="http://static.feifeiboke.com/img/201611/tvskd_qrc.png" alt="扫描二维码，下载到手机" width="180" height="180" /></span></a></div></p>\n<p>2、如果你需要在电脑上控制手机，请下载安装 <a href="http://www.feifeiboke.com/pcjishu/3704.html" target="_blank">TeamViewer 电脑版</a>（控制端）</p>\n<p style="margin-top:12px">　 如果你需要在手机上控制手机，请下载安装 TeamViewer 手机版（控制端）</p>\n<p><div class="dlbor"><a href="http://static.feifeiboke.com/dl/teamviewer.apk" hidefocus="true" class="dl" target="_blank">最新 TeamViewer 手机版 (19.3M)</a>　　<a href="javascript:;" class="bigimg"><img align="absMiddle" src="/css/images/qrcode.png" width="36" height="36" /><span><img src="http://static.feifeiboke.com/img/201611/sjtvdl_qrc.png" alt="扫描二维码，下载到手机" width="180" height="180" /></span></a></div></p>\n<p style="margin-top:8px">　 注意：请重新下载安装<span style="color:#d801e5;">最新12.x版本</span>的控制端APP，才能实现手机远程控制手机功能！</p>\n<p>3、打开第二步装好的 TeamViewer 控制端（PC或手机版都可以），输入受控端手机APP上显示的数字ID，就可以开始连接了（无需注册，完全免费）。</p>\n<p style="text-align:center"><img alt="输入被控制端的ID号码，就能连接远程" src="http://static.feifeiboke.com/img/201611/skd_qsapp.jpg" width="606" height="515" /></p>\n<p>4、这时受控端手机会弹出是否允许远程连接的提示，选择“允许”。</p>\n<p>5、连接成功后，就可以开始远程遥控目标手机了，就跟操作自己的手机一样。</p>\n<p>如果你使用的是PC控制端，那么功能更强大，不但可以实时进行屏幕控制，还可以管理进程、应用和WiFi，以及对CPU、内存、存储、电池（电量 温度）进行监控。</p>\n<p style="text-align:center"><img alt="电脑也能直接远程控制手机，功能更强大" src="http://static.feifeiboke.com/img/201611/pckzd_tv.jpg" width="620" height="606" /></p>\n<p>Tips：至此为止，远程控制三部曲就完结了，菲菲博客简直就是把 TeamViewer 全家桶搬出来了，哈哈~ 不过说实话，人家歪果仁的软件确实好用，个人用户免费还没有广告，连接速度很畅快，手机APP也不会涉及任何隐私权限，值得我们学习借鉴！</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 127),
(10, 3, '轻松解包MIUI备份bak文件 还原出明文数据', 'https://img14.360buyimg.com/n3/jfs/t3034/299/2060854617/119711/577e85cb/57d11b6cN1fd1194d.jpg', '<p>之前小伙伴们学到了利用 Android 原生备份功能提取解包.ab文件的方法，但是有所限制有点不爽。而小米手机MIUI系统的自带备份工具则功能强大，可以备份出一切我们想得到的APP数据，那么又该如何解密小米的Bak备份文件并还原出原始数据呢？</p>\n<p><strong>1、将目标Bak备份数据拷贝到电脑端</strong></p>\n<p style="margin-top:9px">小米MIUI手机备份后的文件会存放在手机存储下 /MIUI/backup/Allbackup/xxx 目录中（xxx代表备份的时间）。童鞋们需要做的就是将需要解包的目标Bak文件复制到你的电脑上。怎么复制？QQ传文件、连接数据线等等都可以，这里就不罗嗦了。</p>\n<p><strong>2、借用WinHex简单修改一下Bak文件头</strong></p>\n<p style="margin-top:9px">打开咱们前几天刚刚分享的<a href="http://www.feifeiboke.com/pcjishu/3666.html" target="_blank">WinHex 神器</a>，直接将你拷贝好的Bak文件拖拽进去，这里就会发现其实MIUI备份只是多出了一个自定义文件头而已，那就简单啦，只要移除这个文件头就好！</p>\n<p style="margin-top:9px">操作时，只要按图示的方法选中并删除“41 4E”前面的数据即可，完成后记得保存！</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="选中小米备份额外的文件头，删除即可" src="http://static.feifeiboke.com/img/201610/winhex_deldata.png" width="606" height="276" /></p>\n<p><strong>3、最后直接使用abe.jar正常解包就搞定了</strong></p>\n<p style="margin-top:9px">完成第二步修改后的Bak文件，就跟正常的安卓原生备份格式一样了，菲菲博客的童鞋们只要再将Bak文件拖入abe解包批处理上，就可以一键解码还原出原始数据了，解包后的文件格式为tar，可以通过解压缩软件打开查看。</p>\n<p><div class="dlbor" style="padding:22px"><a href="http://static.feifeiboke.com/down/201610/Unpack%5FBak.rar" hidefocus="true" class="dl" target="_blank">abe解包批处理 (5.31M)</a>　|　<a href="http://www.feifeiboke.com/pcjishu/3638.html" target="_blank">（请先安装Java运行环境&gt;&gt;）</a></div></p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="将移除文件头的Bak文件拖入批处理" src="http://static.feifeiboke.com/img/201610/abebat_oper.png" width="510" height="313" /></p>\n<p>这里截图所演示的仅仅是是解包出了小米手机的WIFI密码明文数据，当然不单单是无线密码，只要是可以备份出的Bak文件都可以解密出来的，包括应用软件、短信、电话本等等都可以搞的定的，有兴趣的话不妨自己动手试试咯~</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="然后就可以一键还原出原始明文数据" src="http://static.feifeiboke.com/img/201610/bak2tar.png" width="462" height="277" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(11, 3, '手机存储内存老是不够用？一招帮你除根儿', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>对于一些老手机来说，本来存储容量就不多，再加上又划分给系统分区、内置SD分区一大部分，真正剩下来可用于安装软件的空间真的不够用，经常会出现“存储空间不足”的问题。</p>\n<p>解决存储不足的方法网上大搜一大推，什么清理大师了、卸软件啦、移动应用到SD卡，甚至还有恢复出厂设置的呢，这些没油没盐的大家都晓得的这里菲菲博客就不在啰嗦了...</p>\n<p><strong>1、挖出那些占用大量存储数据的APP</strong></p>\n<p>手机QQ、微信等等可能是每天用的最多的APP了，我们每天聊天、刷朋友圈，日积月累，产生的应用数据占用了大量的空间，看图你就明白了，而这些数据一般的清理软件根本删不掉！</p>\n<p>你需要做的是定期打开手机设置 -- 应用管理 -- 已下载，找到那些大量占用存储空间的应用，然后【清除数据】即可。注意：<span style="color:#940000;">清除数据会清空QQ/微信聊天记录</span>，如有需要请先备份！</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="清除应用数据可以有效腾出大量空间" src="http://static.feifeiboke.com/img/201610/wipe_data.jpg" width="354" height="629" /></p>\n<p style="text-align:center"><span style="color:#307f00;"> ---------------------- 分割线 · 以下为可选内容（需要ROOT权限） ----------------------</span></p>\n<p><strong>2、清空 Android 虚拟机缓存数据</strong></p>\n<p>安卓系统会在安装APP时在 <u>/data/dalvik-cache</u> 目录下自动生成虚拟机缓存文件，某些情况下可能造成数据残留，因此可以尝试清空 dalvik-cache 虚拟机缓存来腾出一些可用空间。</p>\n<p>【小提示】可以使用RE管理器来删除缓存，务必谨慎操作，完成后请立即重启手机。</p>\n<p><strong>3、删除手机厂商预留的应用安装包</strong></p>\n<p>某些手机厂商不光会给你预装很多全家桶，还有可能在内部存储中留下一些APP安装包。比如小米MIUI系统的 <u>/data/miui/app</u> 目录里的都是可以删掉的，可以腾出一部分的存储容量。</p>\n<p><strong>4、转移部分应用到 system 分区*</strong></p>\n<p>通常手机的system分区都会预留部分空余空间，反正闲着也是浪费，那就干脆将默认存放在data分区的部分常用的软件（比如QQ、微信等等）移动到系统分区目录下好咧。</p>\n<p>操作方法：使用RE管理器进入 <u>/data/app</u> 目录，长按移动文件到 <u>/system/app</u> 目录，完成需要重启生效。（此方法在MIUI中测试有效，新手请谨慎操作）</p>\n<p style="text-align:center"><span style="color:#307f00;">---------------------- 分割线 · 以下为扩展学习内容（需ROOT权限） ----------------------</span></p>\n<p>如果需要统计分析查看到底是哪些文件或目录大量占用了内部存储空间，可以直接通过执行<a href="http://www.feifeiboke.com/android/3150.html" target="_blank">adb命令</a>来实现，执行后可以看到data分区下从大到小的存储空间占用情况。</p>\n<pre class="new_code" style="color:#444;font-size:14px">adb shell su -c "busybox du -d1 /data | busybox sort -nr</pre>\n<p>由此可见，大量占用存储内存的排名前五名分别为：应用数据目录、虚拟机缓存、应用安装目录、以及应用lib库文件等。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="安卓Data分区各目录的空间占用情况" src="http://static.feifeiboke.com/img/201610/data_du_size.jpg" width="501" height="388" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 125),
(12, 3, '安卓花式玩法必备之Busybox的下载与安装', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>最近关于 Android 玩机频道给童鞋们分享了一系列的adb命令使用小技巧，在这其中用到了一个很关键的东东，那就是安卓应用程序的包名。对此部分小伙伴感到一头雾水，不造咋么弄~</p>\n<p>昨晚在编译安卓原生ROM时，菲菲君偶然发现了一枚谷歌原生提供的APP调试利器 - Dev Tools，这不就可以很好的解决大家不滋道如何查看安卓APP包名的疑惑了嘛~ </p>\n<p>将APP直接下载安装到手机上就可以使用了，只有105KB大小，不会占用额外的内存空间！</p>\n<p><div class="dlbor"><a href="http://static.feifeiboke.com/down/201610/development.apk" hidefocus="true" class="dl" target="_blank">Dev Tools (105K)</a>　　<a href="javascript:;" class="bigimg"><img align="absMiddle" src="/css/images/qrcode.png" width="36" height="36" /><span><img src="http://static.feifeiboke.com/img/201610/devtool_qrc.png" alt="扫描二维码，下载到手机" width="160" height="160" /></span></a></div></p>\n<p>打开 Dev Tools ，我们主要用到两个功能：</p>\n<ul style="padding:12px 0 0 30px">\n<li>Package Browser&nbsp;&nbsp;　--　查看应用包信息</li>\n<li>Running processes　--　查看运行进程名</li></ul>\n<p>在软件主界面中选择“<strong>Package Browser</strong>”，就可以查看到当前你的手机中所有已安装应用的包名信息。包括系统内置的应用，以及自己下载的第三方APP程序。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="选择“package browser”即可浏览应用列表" src="http://static.feifeiboke.com/img/201610/devtool_main.jpg" width="309" height="550" /></p>\n<p>继续点击选择某个应用，还可以查看到这个应用包的详细信息，包括进程名(Process)、用户ID(User ID)、存放位置(Source)、数据目录(Data)，以及具体的应用组件信息。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="应用名称下方的 com.xxx.xxx 就是APP包名" src="http://static.feifeiboke.com/img/201610/devtool_pgk.jpg" width="360" height="547" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(13, 3, '查看安卓应用包名进程 原生Dev Tools工具', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>最近关于 Android 玩机频道给童鞋们分享了一系列的adb命令使用小技巧，在这其中用到了一个很关键的东东，那就是安卓应用程序的包名。对此部分小伙伴感到一头雾水，不造咋么弄~</p>\n<p>昨晚在编译安卓原生ROM时，菲菲君偶然发现了一枚谷歌原生提供的APP调试利器 - Dev Tools，这不就可以很好的解决大家不滋道如何查看安卓APP包名的疑惑了嘛~ </p>\n<p>将APP直接下载安装到手机上就可以使用了，只有105KB大小，不会占用额外的内存空间！</p>\n<p><div class="dlbor"><a href="http://static.feifeiboke.com/down/201610/development.apk" hidefocus="true" class="dl" target="_blank">Dev Tools (105K)</a>　　<a href="javascript:;" class="bigimg"><img align="absMiddle" src="/css/images/qrcode.png" width="36" height="36" /><span><img src="http://static.feifeiboke.com/img/201610/devtool_qrc.png" alt="扫描二维码，下载到手机" width="160" height="160" /></span></a></div></p>\n<p>打开 Dev Tools ，我们主要用到两个功能：</p>\n<ul style="padding:12px 0 0 30px">\n<li>Package Browser&nbsp;&nbsp;　--　查看应用包信息</li>\n<li>Running processes　--　查看运行进程名</li></ul>\n<p>在软件主界面中选择“<strong>Package Browser</strong>”，就可以查看到当前你的手机中所有已安装应用的包名信息。包括系统内置的应用，以及自己下载的第三方APP程序。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="选择“package browser”即可浏览应用列表" src="http://static.feifeiboke.com/img/201610/devtool_main.jpg" width="309" height="550" /></p>\n<p>继续点击选择某个应用，还可以查看到这个应用包的详细信息，包括进程名(Process)、用户ID(User ID)、存放位置(Source)、数据目录(Data)，以及具体的应用组件信息。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="应用名称下方的 com.xxx.xxx 就是APP包名" src="http://static.feifeiboke.com/img/201610/devtool_pgk.jpg" width="360" height="547" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 126),
(14, 3, '简单突破安卓自带或第三方应用程序锁密码', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>很多童鞋为了保护自己的隐私都喜欢给特定的手机APP上把锁，比如不想让他人看到自己的QQ、短信、微信等等。而应用锁通常有两种模式，一种是手机系统内置的，另一种是自行下载的第三方的，比如360手机卫士提供的程序锁。</p>\n<p>但是这些所谓的“锁”真的安全靠谱么？记得之前给小伙伴们分享过<a href="http://www.feifeiboke.com/android/3634.html" target="_blank">破解锁屏密码</a>的方法，那这些对单个应用的加锁密码能否被轻易突破绕过呢？我们不妨前来一试！</p>\n<p><strong>第三方应用锁破解测试</strong></p>\n<p>不造童鞋们是否还记得菲菲博客曾经讲过“第三方APP锁几乎无卵用”，结合我们之前学到的姿势，只要卸载或冻结目标锁屏应用，那么这把应用锁基本上就废掉了。。</p>\n<ul style="padding:10px 0 0 28px">\n<li><b>卸载应用命令</b>：<u>adb uninstall PkgName</u> （这里的 PkgName = 应用包名，下同）</li>\n<li><b>一键冻结应用</b>：<u>adb shell pm block PkgName</u> （查看<a href="http://www.feifeiboke.com/android/3645.html" target="_blank">免Root冻结应用</a>的详细操作步骤）</li></ul>\n<p><strong>突破MIUI系统内置的应用锁</strong></p>\n<p>看来第三方的程序锁不堪一击，那么手机系统内置的应用锁功能能否破解呢？咱们接着来试试。这里就以手头比较玩得开的小米手机MIUI系统来简单做个实测喽~</p>\n<p>在手机设置 - 安全和隐私中打开访问限制后，使用RE管理器进入 /data/system 可以看到：</p>\n<p>其中多出一个 access_control.key 文件，正如其名，这个文件正是访问限制功能手势密码的存放位置。参照我们之前破解系统锁屏的方法，直接删除此文件就可以搞定~</p>\n<p><span style="color:#8d3901;">通过adb执行下列命令即可关闭MIUI应用锁</span>：</p>\n<pre class="new_code" style="color:#444;font-size:14px">adb shell su -c "rm /data/system/access_control.key"</pre>\n<p>从上面的破解方式不难发现，Android 手机提供的USB调试模式在方便我们玩机的同时，也给我们的手机隐私信息带来了很大的安全隐患，同时ROOT又是一把双刃剑，玩出花样团团转~ </p>\n<p>【安全建议】</p>\n<ol style="padding:5px 0 0 33px">\n<li>USB调试模式要关闭；</li>\n<li>不要轻易对手机ROOT；</li>\n<li>手机设置也要顺带上锁；</li>\n<li>手机备份功能也加把锁咯；</li>\n<li>第三方锁屏工具真的不太靠谱</li></ol>', 'hello,world', 1, 1486959230, 1486959230, 1, 124),
(15, 4, 'QQ管家感恩回馈：QQ黑钻14天你来我就送', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>腾讯管家嘉年华11月预热活动已经启动，全体管家用户及DNF玩家快来领黑钻体验呗~ 无论你是老司机、还是从未玩过DNF的新玩家，都可以免费领取<span style="color:#bb005f;">14天的QQ黑钻</span>体验时长！</p>\n<p>活动时间：即日起 - 11月22日</p>\n<p style="MARGIN-TOP: 6px">参与通道：<a href="http://amp.guanjia.qq.com/act/brand/20161101dnf/" target="_blank">http://amp.guanjia.qq.com/act/brand/20161101dnf/</a></p>\n<p>1、通过活动下载新版管家客户端，就能免费领取QQ黑钻*7天体验时长。</p>\n<p>2、新手玩家注册登入DNF游戏，还可以额外无条件一键再领7天黑钻。</p>\n<p>3、老玩家也是有福利滴，凡是10月份未登过游戏、40级以上的老玩家，均可获赠7天黑钻。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="管家嘉年华免费送QQ黑钻" src="http://static.feifeiboke.com/img/201611/dnfgj_shz.jpg" width="424" height="475" /></p>\n<p><b>Tips：</b>预计11月22日当天还有更多更给力的管家福利活动，每年都会各种Q钻Q币漫天飞，请小伙伴们到时候及时关注</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 125),
(16, 4, '2016管家嘉年华：Q币、VIP周边活动汇总', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>腾讯管家11.22嘉年华预热正式开启，各种Q币、Q钻、VIP豪礼大派送，错过机会再等一年噢！本页面菲菲君为你独家汇总整理，嘉年华周边相对不错的活动资讯。</p>\n<p>当然这些只是QQ管家11.22周边的一些预热活动，还是不太给力啊！真正的嘉年华主战场即将在<span style="color:#940000;"><u>11月22日（下周二）</u></span>正式打响，菲菲博客将持续追踪关注。</p>\n<p>1、<b>安装管家送VIP体验 + 3Q币 + 兑换蓝绿钻</b>（12月17日结束）</p>\n<p style="margin:10px 0 0 24px">参与入口：<a href="http://guanjia.qq.com/act/20161122/qvideovip/index.html" target="_blank" rel="nofollow">http://guanjia.qq.com/act/20161122/qvideovip/index.html</a></p>\n<p style="margin:10px 0 0 24px">活动提示：下载管家送1天VIP；开通视频VIP再送3Q币，集幸运星免费兑换QQ蓝绿钻！</p>\n<p style="text-align:center"><img alt="腾讯管家送VIP体验和Q币活动" src="http://static.feifeiboke.com/img/201611/qqgj2016jnh.jpg" width="506" height="522" /></p>\n<p>2、<b>4366联合活动抽Q币、年费会员等等</b></p>\n<p style="margin:10px 0 0 24px">参与入口：<a href="http://www.4366.com/s/gjjnh.html" target="_blank" rel="nofollow">http://www.4366.com/s/gjjnh.html</a></p>\n<p style="margin:10px 0 0 24px">活动提示：下载安装管家，抽Q币会员大礼，升级最高送100Q币！</p>\n<p>3、<b>QQ管家新人专享福利 每天限量领取5Q币</b></p>\n<p style="margin:10px 0 0 24px">参与入口：<a href="http://guanjia.qq.com/act/20161122/sszb/#getGift2" target="_blank" rel="nofollow">http://guanjia.qq.com/act/20161122/sszb/#getGift2</a></p>\n<p style="margin:10px 0 0 24px">　　　　　<a href="http://guanjia.qq.com/act/20161122/fish/#getGift2" target="_blank" rel="nofollow">http://guanjia.qq.com/act/20161122/fish/#getGift2</a></p>\n<p style="margin:10px 0 0 24px">活动提示：仅限电脑管家新用户领取，每日各限量100份，太少了啊！</p>\n<p>4、<b>管家用户30%概率领 5 ~ 8枚Q币</b></p>\n<p style="margin:10px 0 0 24px">参与入口：<a href="http://x5.qq.com/cp/a20116025xwj/index.htm" target="_blank" rel="nofollow">http://x5.qq.com/cp/a20116025xwj/index.htm</a></p>\n<p style="margin:10px 0 0 24px">　　　　　<a href="http://amp.guanjia.qq.com/act//agile2.0/66181/index.html" target="_blank" rel="nofollow">http://amp.guanjia.qq.com/act//agile2.0/66181/index.html</a></p>\n<p style="margin:10px 0 0 24px">活动提示：QQ炫舞、逆战联合活动，安装管家30%几率抽5/8Q币。</p>\n<p>更多管家周边预热活动信息：<a href="http://guanjia.qq.com/act/20161122/front/" target="_blank">http://guanjia.qq.com/act/20161122/front/</a></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 125),
(17, 4, '360百万红包之网易专场今日10点准时开抢', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>还是原来的套路，还有熟悉的红包，360手助每周五送红包活动准时开启！今天的网易红包专场，各位大侠走过路过，顺手来凑个热闹~ 当天共计500万枚红包来就送~</p>\n<p><strong>活动截止日期</strong>：2016年11月18日（<span style="color:#bb005f;">每周五10点开始</span>）</p>\n<p>1、还没有安装<a href="http://sj.360.cn/index.html" target="_blank">360手机助手</a>的同学请先下载后登陆360帐号就能抢红包咯~</p>\n<p>2、打开APP就能在首页看到红包入口，进入后下载一个应用就能100%领红包啦！</p>\n<p style="text-align:center"><img alt="360红包·网易专场正在进行中" src="http://static.feifeiboke.com/img/201611/360hb_163.jpg" width="617" height="556" /></p>\n<p>3、当天领取1个红包后，将活动分享给好友，还可以额外再获得一次抢红包的资格。</p>\n<p><b>Tips：</b>菲菲君强力建议大家在WiFi网络下参与活动哟，手机流量党干脆尽量找小一点的应用来下载，祝童鞋们好运！流量用之不易，且下且珍惜，月中不节制，月底徒伤悲。。。</p>\n<p style="text-align:center"><img alt="按提示分享活动再抢一次" src="http://static.feifeiboke.com/img/201611/360hb_1118.jpg" width="360" height="397" /></p>\n', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(18, 4, '你来玩腾讯刀锋铁骑 我送10Q币大礼包', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>有实力无畏惧，腾讯管家1122嘉年华预热之《刀锋铁骑》新人福利活动。参与活动，只要是11月11号以后注册角色的小伙伴，都有机会概率赢取10Q币+游戏大礼包一份。</p>\n<p><b>活动时间</b>：即日起 - 11月30日</p>\n<p style="margin-top:6px"><b>参与入口</b>：<a href="http://t7.qq.com/cp/a20161103gjznq/index.htm" target="_blank">http://t7.qq.com/cp/a20161103gjznq/index.htm</a></p>\n<p>1、感恩见面礼：只要是现在新注册游戏的玩家，均可领取豪华大礼包+<span style="color:#d40a00;">10Q币概率抽取</span>！</p>\n<p>2、老司机回馈：10月20日之后没有再上过游戏的老玩家，也有机会抽取20Q币回归奖励。</p>\n<p>3、以上奖励参与用户需满足：QQ等级≥10级，QQ好友数≥10个以上才有资格领取哟~ 可能是防范个别刷小号的情况吧。这一点请大家注意一下。另外本活动QB并非百分百有份，喜欢玩这个游戏的童鞋可以顺手试试手气。</p>\n<p style="text-align:center"><img alt="玩刀锋铁骑游戏领Q币礼包" src="http://static.feifeiboke.com/img/201611/t710qblb.jpg" width="575" height="388" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(19, 4, '下载头条APP至少送1元现金红包 仅此一天！', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>11月16日最新关注：今日头条APP普送红包福利，新用户下载打开应用，即可领取支付宝现金红包（1元）一枚，<strong>新用户人人有份、先到先得</strong>，送完截止，福利仅限今天有效哟！</p>\n<p>本期活动截止到：11月16日23:59</p>\n<p>1、从应用宝或下方的链接下载安装今日头条APP，其他方式下载的我不确定是否能领红包！</p>\n<p><div class="dlbor"><a href="http://dd.myapp.com/16891/48B14A72830BB5C0735CC0D6C54D59DB.apk?fsname=com.ss.android.article.news_5.8.7_587.apk" hidefocus="true" class="dl" target="_blank">今日头条APP (21.6M)</a>　　<a href="javascript:;" class="bigimg"><img align="absMiddle" src="/css/images/qrcode.png" width="36" height="36" /><span><img src="http://static.feifeiboke.com/img/201611/toutiaodl_qrc.png" alt="扫描二维码，下载到手机" width="180" height="180" /></span></a></div></p>\n<p>2、打开头条，进入我的 → 活动 → 【新用户大礼包】找到活动传送入口。</p>\n<p style="text-align:center"><img alt="打开APP，进入我的 - 头条活动入口" src="http://static.feifeiboke.com/img/201611/jrtt_1hb_1.jpg" width="620" height="499" /></p>\n<p>3、点击“开始刮奖”，最高100元支付宝红包随机派送，红包可以马上领取到支付宝！</p>\n<p style="text-align:center"><img alt="新人免费刮支付宝现金红包" src="http://static.feifeiboke.com/img/201611/jrtt_1hb_2.jpg" width="609" height="466" /></p>\n<p><b>Tips：</b>目前不确定是否100%都可以中得大红包，但是菲菲君亲测目前是可以的，重要的地方再说一遍，先到先得，只有新安装才能领取！仅此16号一天！</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(20, 4, '下载腾讯游戏助手 免费领火影VIP体验卡', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>腾讯游戏《火影忍者》全民有礼，下载游戏助手100%来就送你一枚VIP勋章体验卡（可用于点亮图标），福利截止日期已然不多，想要领VIP体验的同学表错过哦~</p>\n<p><b>活动截止日期为</b>：2016年11月20日</p>\n<p>1、使用手机扫码下载安装火影游戏助手APP，打开并通过QQ登陆</p>\n<p style="text-align:center"><img alt="扫码下载腾讯游戏助手APP" src="http://static.feifeiboke.com/img/201611/hyzsapp_qrc.png" width="220" height="220" /></p>\n<p>2、进入“发现” 频道 → 找到下载礼包，然后就可以找到并领取VIP勋章了。</p>\n<p>&nbsp;　小提示：首次领取前<span style="color:#940000;">必须绑定角色</span>，请先进入<a href="http://huoying.qq.com/server/website/" target="_blank">火影网页游戏</a>注册一个角色才能领取！</p>\n<p style="text-align:center"><img alt="进入火影助手后，绑定角色领取下载礼包" src="http://static.feifeiboke.com/img/201611/huoying_lqvip.jpg" width="603" height="507" /></p>\n<p>3、领取成功后，礼包会直接发送至游戏内邮箱，请进入游戏中查收并使用！</p>\n<p>&nbsp;　关于火影VIP图标点亮规则的细节可以参考<a href="http://huoying.qq.com/cp/a20160420hyff/index.htm" target="_blank">火眼忍者官网&gt;&gt;</a></p>\n<p style="text-align:center"><img alt="进入游戏内邮箱查收VIP勋章道具" src="http://static.feifeiboke.com/img/201611/hyviptyk.jpg" width="612" height="357" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(21, 4, 'QQ电脑版v8.8全新体验 PC端也能点赞了', 'http://static.feifeiboke.com/img/201611/qqdnfhz_idx.png', '<p>最近一年PC端的QQ版本一直没什么新亮点，也就没怎么关注。这几天突然放出了突然让人眼前一亮的V8.8版本，敢情这是在憋大招捏~&nbsp; QQ 8.8 全新视觉，好似清爽~ 速速体验吧！</p>\n<p><div class="dlbor" style="padding:22px"><a href="http://dldir1.qq.com/qqfile/qq/QQ8.8/19429/QQ8.8Trial.exe" hidefocus="true" class="dl" target="_blank">QQ8.8内测版 (58M)</a></div></p>\n<p>最重要的一点只说一遍！</p>\n<p><strong>QQ电脑版也支持点赞了</strong>，并且跟手机QQ平台数据完全互通，小号刷赞更方便了有木有！</p>\n<p>QQ经典的迷你资料卡界面也更加清爽简约，好似轻飘飘了好多哇。。</p>\n<p>另外菲菲目测暂时发现改版的还有好友QQ头像全部跟手Q端的风格统一了，变身圆形状~ 而且还支持PC端抢红包有木有，键盘党也能在电脑上撸红包了。。</p>\n<p>更多细节改版，大家伙儿自行下载体验好咯~ </p>\n<p style="text-align:center"><img alt="PC QQ8.8全新版本" src="http://static.feifeiboke.com/img/201611/pcqq8.8_test.png" width="594" height="425" /></p>\n<p style="text-align:right">（感谢 Q友·a可乐君℡ 的爆料）</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 124);
INSERT INTO `blog_post` (`id`, `catg_id`, `title`, `cover_url`, `content`, `tags`, `status`, `create_time`, `update_time`, `author_id`, `read_count`) VALUES
(22, 5, '一键开启网页夜间模式 无需任何插件就行', 'http://static.feifeiboke.com/img/201611/night_idx.png', '<p>夜深了，你最想要的就是这个了，夜猫子必备哦。现在的电脑显示器亮度实在是太高了，加上浏览器网页背景色大多都是刺眼的白色，看久了眼睛很累有木有！！</p>\n<p>菲菲君对此深有感知，于是乎给大家提供一个可以一键打开网页夜间模式的小妙招，而且不用安装任何浏览器插件，安全便捷，可以有效降低浏览网页的亮度，保护视力马上做起~</p>\n<p style="margin-left:184px"><a href="javascript:var%20a=document.createElement(''div'');a.innerHTML=''<div style=%22position:fixed;background-color:#000;top:0;left:0;z-index:999999;pointer-events:none;opacity:0.35;width:100%;height:100%%22></div>'';document.body.appendChild(a);" hidefocus="true" style="display:block;width:271px;height:52px;text-indent:-30em;overflow:hidden;background:url(http://static.feifeiboke.com/img/201611/night_btn.png)">夜间模式</a></p>\n<p style="color:#a44201;text-align:center;">（请将上面的按钮，用鼠标点住不放拖动到浏览器的收藏栏上）</p>\n<p>按上面的方法操作完成后，你的浏览器就会多出一个书签，当晚上感觉网页太刺眼时，只需要轻轻点一下这个书签，就可以自动开启当前浏览页面的夜间护眼模式了。</p>\n<p><b>小贴士</b>：连续点击这个神奇书签还能变得更暗呢，另外本方法<span style="color:#8f0197;">不适用老版的IE浏览器</span>。\n<p style="text-align:center"><img alt="直接点一下这个新书签，就能降低网页亮度" src="http://static.feifeiboke.com/img/201611/night_result.png" width="612" height="369" /></p>\n<p style="text-align:center"><img alt="百度首页开启夜间浏览模式的效果" src="http://static.feifeiboke.com/img/201611/bd_yjms.jpg" width="620" height="350" /></p>\n<p style="text-align:center">大家感受一下真实的开启效果，另外点击两次上面的书签，还能再变暗一点，就跟关灯一样。</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(23, 5, '手机一键远程控制电脑 突破内网小白也会用', 'http://static.feifeiboke.com/img/201611/night_idx.png', '<p>前几天有Q友提出，想要在手机上远程控制处于内网之中的电脑，而且没有外网IP，花生壳映射端口什么的又太复杂不会搞，问菲菲有木有什么好的法子，可以简单实现的方法！？</p>\n<p>昨儿晚上抽时间研究了一番，突然想起12年就推荐过的一款远控神器 -- TeamViewer，敢情那会儿智能手机还不太普及呢，现在好了，这个远程软件也有手机版本了。</p>\n<p><b>总体思路：</b>手机安装远程控制APP → PC端安装远控程序 → 通过ID密码连接远控</p>\n<p>1、下载安装最新版本的 TeamViewer 手机APP，官方原版支持中文哒！</p>\n<p><div class="dlbor"><a href="http://static.feifeiboke.com/dl/teamviewer.apk" hidefocus="true" class="dl" target="_blank">TeamViewer 手机版 (17.2M)</a>　　<a href="javascript:;" class="bigimg"><img align="absMiddle" src="/css/images/qrcode.png" width="36" height="36" /><span><img src="http://static.feifeiboke.com/img/201611/sjtvdl_qrc.png" alt="扫描二维码，下载到手机" width="180" height="180" /></span></a></div></p>\n<p>2、在电脑上下载安装 TeamViewer 远控工具，<span style="color:#8d3901;">必须是v11版</span>，百度提供的12版本不能用！</p>\n<p>　 <b>重要的地方来了，菲菲君特别提示：</b></p>\n<p style="margin-top:8px">　 <span style="color:#d6006d;">这里在安装时一定要选择【<strong>个人/非商务用途</strong>】，否则一旦选错，将永久无法挽回！</span></p>\n<p><div class="dlbor" style="padding:22px"><a href="http://static.feifeiboke.com/down/201611/TeamViewer_11.0.rar" hidefocus="true" class="dl" target="_blank">TeamViewer_v11 电脑版 (10.1M)</a></div></p>\n<p style="text-align:center"><img alt="" src="http://static.feifeiboke.com/img/201611/pctv_install.png" width="501" height="400" /></p>\n<p>3、安装好后在电脑上打开 TeamViewer，然后在APP上输入PC端显示的ID，开始远程控制。</p>\n<p style="text-align:center"><img alt="" src="http://static.feifeiboke.com/img/201611/pctv_idpw.png" width="617" height="433" /></p>\n<p>4、继续按提示输入PC端显示的密码，就可以连接成功啦！无论你的手机或电脑，是内网还是外网，不管有没有外网IP，都可以愉快的连接远程桌面，畅快无阻，方便快捷！</p>\n<p style="text-align:center"><img alt="输入PC端的ID和密码即可连接" src="http://static.feifeiboke.com/img/201611/sjtv_setid.jpg" width="360" height="552" /></p>\n<p style="text-align:center"><img alt="至此位置，手机远程桌面连接已经成功" src="http://static.feifeiboke.com/img/201611/sjtv_connok.jpg" width="309" height="550" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(24, 5, '新装或升级QQ电脑版后你需要做的事儿', 'http://static.feifeiboke.com/img/201611/night_idx.png', '<p>电脑QQ客户端经常会自动升级，当然也包括你自己手动重新安装的情况，这样就会在系统C盘之下残留很多垃圾文件或插件。所以简单清理一下，就可以为自己的爱机提速不少哟~</p>\n<p>注意清理前，先退出QQ客户端再操作</p>\n<p><strong>清理C盘应用数据目录</strong></p>\n<p>在计算机地址栏直接输入 <span style="color:#013add;"><u>%AppData%\\Tencent\\QQ</u></span>　回车打开文件夹，开始清理：</p>\n<ul style="padding:12px 0 0 33px">\n<li>Temp　-- QQ临时文件夹可清理</li>\n<li>STemp　-- QQ安装程序临时文件夹，删除！</li>\n<li>commonf_inst　-- QQ组件安装包，放心删吧</li>\n<li>webkit_cache　-- QQ客户端网页缓存文件，清理掉</li></ul>\n<p>返回上一级目录，顺手清理一下QQ的日志目录 -- <span style="color:#9b014f;">Logs</span>，没清理过的话占用空间很吓人~</p>\n<p><strong>卸载QQ顺带的额外组件（可选）</strong></p>\n<p>这些QQ安装时自带的组件或插件可有可无，删了也不会影响QQ的正常使用，菲菲博客的同学们可以根据自己的需要选择是否保留，还是卸载掉。</p>\n<p>同样在C盘，打开 <span style="color:#013add;"><u>C:\\Program Files\\Tencent</u> </span>目录：</p>\n<ul style="padding:12px 0 0 33px">\n<li>QQMusic　-- QQ空间的音乐播放控件，删了也没啥影响</li>\n<li>QQGameMicro　-- QQ页游相关迷你客户端，不玩游戏可删，开机自启很烦人</li></ul>\n<p>另外还可以进入 <span style="color:#013add;"><u>C:\\Program Files\\Common Files\\Tencent</u></span>　删除不需要的QQ插件：</p>\n<ul style="padding:12px 0 0 33px">\n<li>Npchrome　-- 浏览器插件，测试删了没什么影响，不会影响QQ网页快速登陆</li>\n<li>QQMiniDL　-- QQ下载组件，基本上也没啥用，可删不会出错。</li></ul>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(25, 5, '出自微软自家提供的md5和sha1效验工具', 'http://static.feifeiboke.com/img/201611/night_idx.png', '<p>在网上下载文件时经常会遇到校验文件Hash值的情况，校验一方面可以保证自己所下载文件的完整性，另外还可以验证文件是否被篡改破坏。而常用的Hash算法就包括md5和sha1等。</p>\n<p>在这里给童鞋分享一枚微软官方原汁原味提供的文件校验小工具（命令行），只有80KB大小，短巧精湛，轻巧易用，100%安全绿色有保障！而且支持子目录递归批量校验，很实用！</p>\n<p><div class="dlbor" style="padding:22px"><a href="http://static.feifeiboke.com/down/201611/md5.exe" hidefocus="true" class="dl" target="_blank">md5校验工具 (82K)</a></div></p>\n<p>将上面命令行工具下载到电脑后，复制到 <span style="color:#940000;"><u>C盘下的 Windows 目录</u></span>，就可以直接通过cmd窗口来调用进行文件的md5以及sha1的校验操作了。</p>\n<p>命令用法：</p>\n<ul style="padding:12px 0 0 33px">\n<li>校验md5：md5 文件路径或目录</li>\n<li>校验sha1：md5 文件路径或目录 -sha1</li>\n<li>同时校验两者：md5 文件路径或目录 -both</li></ul>\n<p>小技巧：输入命令 md5+空格后，将文件或目录直接拖拽到命令行窗口，按回车执行即可。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="微软提供的md5文件校验命令的使用方法" src="http://static.feifeiboke.com/img/201611/hash_cmdtool.png" width="598" height="418" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 124),
(26, 5, '谷歌浏览器下载文件“被阻止”的解决方法', 'http://static.feifeiboke.com/img/201611/night_idx.png', '<p>今天有个朋友的电脑出现了一个诡异的问题，所有通过谷歌 Chrome 浏览器下载的exe文件，一律被拦截，提示“您计算机的安全设置阻止了此文件”。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="Chrome下载可执行文件，通通被拦截" src="http://static.feifeiboke.com/img/201611/chrome_zuzhi.jpg" width="592" height="224" /></p>\n<p>找了网上很多方法无果，最后终于发现原来是系统自带的IE设置在捣鬼。所以菲菲君记录下来，如果你也遇到同样的问题，则可以按照下面的方法轻松解决！</p>\n<p>打开IE的设置 → 安全 → 自定义级别 → 找到“加载应用程序和不安全文件”选项</p>\n<p><strong>将此设置项由“禁用”改为“提示 (推荐)” ，确定保存设置即可搞定！</strong></p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="更改上面的设置，由禁用改为提示即可" src="http://static.feifeiboke.com/img/201611/ie_set.png" width="409" height="426" /></p>\n<p>（注意，直接点击重置默认级别是没用的，必须手动设置后才能生效）</p>\n<p>另外由IE（包括一些双核浏览器）出现的各种异常、疑难杂病等等问题，还可以通过 重置 Internet Explorer 来彻底解决故障，这个百试不爽，已经用过多次。。</p>\n<p>打开IE设置 → 高级选项卡&nbsp; → 点击“重置”IE设置即可</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(27, 5, '三步还你一个干净清爽无广告的360浏览器', 'http://static.feifeiboke.com/img/201611/night_idx.png', '<p>作为六年的老司机，说实话360旗下的浏览器（PC版）还是比较好用的。但是随着360浏览器装机量的膨胀，各种广告植入、推广、弹窗，这对于喜欢干净清爽简洁风格的用户来说很是不爽~ 是时候找个时间来给自己的浏览器做做大扫除咯~</p>\n<p><strong>No.1 干掉 新标签页 各种不爽的广告推荐模块</strong></p>\n<p>每当“新建标签”的时候，老套乏味的游戏推广、购物广告等等就出现了，看起来不爽果断干掉它。很简单，猛戳页面右上角的【设置】，随意更换一张新的标签页壁纸随手搞定！</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="随意更换一张新的标签壁纸，就可以屏蔽掉广告了" src="http://static.feifeiboke.com/img/201610/dis_newad.jpg" width="443" height="446" /></p>\n<p>对了还有最下面一排的直播、购物、游戏推荐等等，自己用不着的顺手也关掉好咧。继续点击上图设置中的“频道管理”，用不到的所谓的“频道”广告统统关掉，关掉！！</p>\n<p><strong>No.2 关掉 浏览页面 的各种植入的特卖广告包</strong></p>\n<p>很久前还以为是网站的广告，仔细一查原来是360浏览器自带的广告包啊，果断屏蔽之！右上角打开“菜单” → “选项/设置” →“实验室”（果然去广告的选项都躲在最深处...）</p>\n<p>找到什么“今日特卖”、“个性化推荐条”、“今日直播”等等根本用不到的话，统统点击去掉前面的“对勾”关掉，瞬间赶脚全世界都安静了。。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="进入实验室选项，可关闭各种购物推广" src="http://static.feifeiboke.com/img/201610/dis_pagead.jpg" width="545" height="315" /></p>\n<p><strong>No.3 关掉各种用不到却会拖慢浏览器速度的插件</strong></p>\n<p>这里所说的“插件”不同于正常用到的“扩展”，这些插件不全是浏览器自带的模块，不少都是其他软件注入浏览器的一些功能。很多根本是无用的，停用掉可以有效提升速度！</p>\n<p>在浏览器地址栏输入 <u><span style="color:#0162f4;">se://plugins/</span></u> &nbsp;按回车键打开即可打开插件管理功能。</p>\n<p>其中除了Flash插件外，其他不需要的完全都可以禁用掉，比如QQ自带的各种插件包。。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="停用各类额外无用的浏览器插件" src="http://static.feifeiboke.com/img/201610/dis_plugin.png" width="562" height="382" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(28, 5, '百度网盘VS腾讯微云大比拼 是时候搬家了', 'http://static.feifeiboke.com/img/201611/night_idx.png', '<p>360网盘倒下了，有人欢喜有人愁~ 相比这时候乐开花的莫过于360的竞争对手 -- 百度网盘、以及腾讯微云们了吧？既然360云盘倒闭已成事实，那么真的是时候该给数据搬新家了！</p>\n<p>百度网盘 VS 腾讯微云，那么问题来了，免费网盘到底哪家强？</p>\n<p><strong>1、免费空间容量 -- 百度略胜一筹</strong></p>\n<p style="margin:10px 0 0 15px">百度网盘（2T）：注册初始送5G大小，登陆APP再送1024G，绑定银行卡额外送1024G。</p>\n<p style="margin:7px 0 0 15px">腾讯微云（1T）：通过QQ号码或微信就可以直接使用，一次性赠送1024G永久容量。</p>\n<p><strong>2、上传、下载流量限额 -- 双方各有胜负</strong></p>\n<p style="margin:10px 0 0 15px">百度网盘：免费用户下载限速大概只有100-200KB，上传速度跟你的网速有关。</p>\n<p style="margin:7px 0 0 15px">腾讯微云：不开会员单日累积最多只能上传1GB的流量，但是下载速度要快很多</p>\n<p><strong>3、是否支持离线下载 -- 百度独领风骚</strong></p>\n<p style="margin:10px 0 0 15px">百度网盘：具备免费离线下载功能，支持BT、电炉等各种链接格式。</p>\n<p style="margin:7px 0 0 15px">腾讯微云：不支持直接离线下载（QQ会员可使用QQ旋风离线下载）</p>\n<p><strong>4、其他扩展功能对比 -- 。。。</strong></p>\n<p style="margin:10px 0 0 15px">百度网盘：支持外链分享，可以无限期分享，但是“某些”资源可能会封杀</p>\n<p style="margin:7px 0 0 15px">腾讯微云：支持外链分享，但免费用户有效期只有15天，同样审核很严格</p>\n<p>【<b>综合对比，得出结论</b>】</p>\n<p style="margin-top:11px">从上面菲菲博客总结来看，百度网盘更倾向于文件共享和离线功能，比较适合存放视频电影等大文件，而微云则倾向于存储备份个人私人文件为主，比如照片、个人视频、文档等等。</p>\n<p style="margin-top:10px">综上所述：百度和微云各有优势，小伙伴们可以根据自己的需要灵活选择，互补互用，两者兼得，<span style="color:#ba4b01;">不同类型的文件数据放到不同的网盘之上</span>，免费多注册一个帐号也不费什么事儿~</p>\n<p style="text-align:center">------------------------------- <span style="font-size:14px;color:#156200;">我是分割线，不要看我，人家会害羞滴~</span> -------------------------------</p>\n<p>Tips：看来容量大、不限速不限上传、支持自由分享、免费服务好功能足，还是人家360云盘独占鳌头啊！只是我们习惯了互联网的各种免费，免费的注定不长久~ 看来百度和微云终于找到各种收费、各种会员的理由了，预计一大波收费包正在上架之中...</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="百度和微云网盘各有优缺点，可以灵活选择使用" src="http://static.feifeiboke.com/img/201610/bdwp-txwy.jpg" width="399" height="524" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 124),
(29, 6, '百度网盘被塞满小电影？做对这些就够了！', 'http://static.feifeiboke.com/img/201611/bdwp_idx.png', '<p>最近爆出的“百度网盘一夜间被塞小电影儿”的消息可谓是抢了一把头条。众网友纷纷表示“吓的自个儿赶紧打开百度云，啥也没有太失望了...”，加上最近频繁上镜的“苹果手机ID被锁遭敲诈”的新闻，可谓是轮番轰炸，那么自己的密码好端端的为什么会失窃呢？</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="微博上网友纷纷评论炸开了锅" src="http://static.feifeiboke.com/img/201610/bdwp_safe.jpg" width="550" height="587" /></p>\n<p>据菲菲君个人了解到，很多网友在注册网络帐号时都使用的同一邮箱、同一密码，这样当某一个小网站的数据库被攻陷（脱库），你在其他平台注册的所有账户全部被沦陷，包括QQ、邮箱、百度等等。</p>\n<p>尤其很多网站以邮箱为依据来找回密码，如果恰巧你的邮箱密码已经被泄漏，那么所有通过这个邮箱注册的帐号都存在被盗风险。 Apple（苹果手机）账户ID被锁往往就是这个原因。</p>\n<p>为了自己的帐号和隐私安全，你需要做到：</p>\n<p><strong>1、扫一扫登陆更安全。</strong></p>\n<p>通过扫描二维码登陆要比直接输入密码要靠谱的多，其实不光手机QQ支持扫一扫登陆，其他比如百度、360、小米等等其他大站都支持扫码登陆方式，这样还省的老忘记密码！</p>\n<p><strong>2、论坛小站直接关联QQ登陆。</strong></p>\n<p>相信很多朋友常年混迹在多个坛子里，注册的帐号多了，密码就很容易忘记或搞窜，于是很多人喜欢用同一个密码，在加上小网站安全性往往不高，很容易被攻击导致后台数据泄漏。</p>\n<p>其实现在很多第三方网站都支持使用QQ关联登陆，这样只要使用QQ扫一扫登陆，就可以自动登陆所有网站了。可谓是QQ握在手、走遍全网全都有~ </p>\n<p><strong>3、警惕山寨手机应用、钓鱼网站</strong></p>\n<p>移动互联网时代，钓鱼产业链也在与时俱进，试想如果你下载使用的是山寨版的手机QQ，百度，xx卫士，那么相当于直接将自己的帐号密码亲手交给了一个坏人，骗子太多，傻子明显不够用啊！还有就是尽量不要在第三方网站软件上泄漏自己的网络账户密码！</p>\n<p><strong>4、网络劫持防不胜防 HTTPS更安全</strong></p>\n<p>长久以来，HTTP网站都是以明文传输数据的，这样无疑在网络通信链路传输过程中，用户隐私信息安全遭到很大挑战。之前某运营商就发生过大规模劫持用户QQ密码的先例，更别说一些二级小运营商强插广告、网址跳转、劫持DNS等劣迹了。</p>\n<p>我们需要做的就是尽量使用https来登陆敏感信息。比如360默认的登陆网址为：<u>http://i.360.cn/</u>，我们可以修改为 <u>https://i.360.cn/</u> 重新打开在登陆（<span style="color:#9b014f;">http后面多个一个字母s</span>）。</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 127),
(30, 6, '戏谈12306铁老大真的买不起安全证书吗', 'http://static.feifeiboke.com/img/201611/bdwp_idx.png', '<p>相信只要是从12306买过火车票的朋友，一定会碰到关于浏览器安全证书的问题。今天就着关于网络安全，HTTPS全加密的话题，咱们来聊聊关于12306网站证书的点点事儿~</p>\n<p>由于互联网环境的日益复杂和恶化，大概从前些年开始，国内互联网超级巨无霸，BAT（百度、阿里、腾讯）相继开始启用全站HTTPS加密通道，也就是你上百度、淘宝时浏览器地址栏显示的绿锁标志。</p>\n<p>作为掌握着全国几亿人个人信息的铁老大12306也不例外，<span style="color:#8d3901;">唯一有些另类的是12306的HTTPS证书不受系统信任！这就很尴尬</span>。。。</p>\n<p>有人说12306不想花钱，买不起安全证书？真的买不起吗？人家多卖几张高铁票分分钟资金回笼，整个售票系统软硬件几千万、上亿都花得起，真的不差一份证书的钱~</p>\n<p>还有人说12306自己想当CA（证书颁发机构），这样就可以达到某些xxx的目的…… 阴谋论，永不绝耳，信了你就真的认真了...</p>\n<p>其实很多人购票时并没有注意，当你提交订单支付时，人家是有正规的收费安全证书的，比如这个二级域名下的页面 <a href="https://epay.12306.cn/" target="_blank">https://epay.12306.cn/</a> 。而且是 Symantec 的证书，据说很贵。不过最贵审核最严格的当属 VeriSign 家的证书了，比如百度用的就是，有钱任性~</p>\n<p>在菲菲君看来，12306铁路售票网站之所以用的自签名证书（自己签发的证书默认肯定不会受系统信任），是<strong>为了全国数亿网络购票公民的个人隐私信息安全</strong>！</p>\n<p>整懵了？怎么理解，试想，证书颁发机构绝大多数都是国外的公司（国内基本都是代理），如果买国外的CA证书，这相当于将自家的钥匙交给了一个外人，你觉得作为掌握着数亿人个人信息的12306会这么做么？这就是涉及到上升到了国家安全的角度。当然不能买！</p>\n<p>对了，顺便提一下，如果你在12306遇到“证书不受信任”错误，不想或干脆不会安装证书，只要点一下“<u>仍然继续</u>”或者“是”就可以临时忽略错误提示，但一定要小心进错钓鱼网站！</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="Chrome浏览器中点击“继续”可以暂时忽略错误证书提示" src="http://static.feifeiboke.com/img/201609/12306_ssl.jpg" width="620" height="293" /></p>\n<p>不过这个操作只能适用于12306网站，<span style="color:#940000;">如果是上其他网站（比如百度、淘宝、腾讯等等）遇到证书错误提示，那可千万不能点“继续”，那可真的有可能遭到HTTPS级别的劫持了</span>。没错，HTTPS照样可以实现中间人劫持攻击，这个世界上没有绝对的安全！</p>\n<p>也正因为如此，如果经常在12306买火车票的话，安全起见，还是安装一下铁道部的官方根证书为妙，因为12306也有可能被假证书“中间人”恶意劫持~ 只要第一次安装好了以后就省事儿省心多了。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="在12306首页下载根证书，双击打开选择“安装”即可" src="http://static.feifeiboke.com/img/201609/srca_root.jpg" width="408" height="440" /></p>\n', 'hello,world', 1, 1486959230, 1486959230, 1, 124),
(31, 6, '免费WiFi背后有猫腻 蹭网不成QQ反被盗', 'http://static.feifeiboke.com/img/201611/bdwp_idx.png', '<p>又到一年3.15将至，想必很多童鞋对去年315晚会现场演示的免费WiFi“盗”取现场观众的网络帐号的过程记忆犹新。那么在免费蹭网时代的背后，那双无影的黑手到底是如何将你的个人网络帐号/隐私截获的？免费的无线真的有那么不靠谱么？</p>\n<p>去年，大多小伙伴应该都留心到了，百度/淘宝等等一线大站都接连启用了全站的HTTPS加密访问通道（就是浏览器地址栏的绿锁），有点网络基础的童鞋应该明白，传统的HTTP通讯过程中是完全透明的，任何一个网络节点（路由器）都可以轻易捕获到用户的通信数据，甚至恶意劫持用户的网络封包，比如前几年运营商非法劫持用户强插广告事件等等。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="百度和淘宝等大型网站均已启用https安全访问" src="http://static.feifeiboke.com/img/201603/tb_https.jpg" width="494" height="197" /></p>\n<p>这一切说明，<strong>传统的HTTP等非加密通信协议并不是完全可靠的</strong>，回到我们的WiFi局域网同样如此。由于是本地局域网，劫持蹭网用户变得更加的容易和隐蔽，甚至即便是没什么基础的小白都可以轻易的做到。</p>\n<p>举一个最简单的例子，假如菲菲君带着笔记本在KFC创建了一个跟KFC提供的WiFi完全相同SSID的免费热点。这时候一旦有人接入，就可以在自己的电脑端通过<a href="http://www.feifeiboke.com/pcjiqiao/pcgj/2539.html" target="_blank">Wireshark抓包软件</a>，轻而易举的捕获到他人的上网数据，可以知道对方访问了什么网站、拿到对方的QQ号的<a href="http://www.feifeiboke.com/anquan/3406.html" target="_blank">Skey登陆权限</a>、微博信息……</p>\n<p>再举个假设，比如我们借助万能钥匙连接上了隔壁小王家的WiFi，恰巧小王由于安全意识淡薄，并没有修改路由器默认的管理密码，或者密码过于简单，这时候我们就可以轻松的得到对方路由器的管理权，修改路由器的DNS为自己控制的DNS后，就可以轻而易举的劫持到小王的QQ/微博，甚至的支付宝、网银...</p>\n<p>当然啦，菲菲并不是危言耸听，并非所有的免费WiFi都是不靠谱的，就好比并不是所有某省打来的陌生电话都是骗子电话一样（没有任何地域的意思哈，仅打个比方）。</p>\n<p>这里只是想告诉大家，出身在外、难免蹭网，尤其是在连接陌生可疑的WiFi热点的时候，<strong>尽量不要使用网银、支付宝等等敏感的软件，转而使用数据流量也许更加靠谱一些</strong>。当然，如果只是蹭网看看网页，刷刷朋友圈，逛逛微博什么的，也那无所谓啦~ </p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(32, 6, '新方法一键获取QQ Skey权限代码(非软件)', 'http://static.feifeiboke.com/img/201611/bdwp_idx.png', '<p>众所周知，任何一个需要登陆的网站都会返回一个字符串（Cookie）用来记录和识别用户的登录状态。而QQ空间也不例外，那么问题就来了，如果可以获取某个QQ号码的字符串代码，那是不是就可以获得该QQ的主人权限呢？</p>\n<p>通常我们把这串代码称之为Skey权限代码，也就是说如果可以获得一个QQ号码的Skey代码，也就相应的拿到了对方QQ登陆和管理权限，这意味着你完全可以以主人的身份分分钟进入对方的空间、查看加密的相册，甚至发表说说，删除留言...</p>\n<p>正所谓知己知彼，方能百战不殆，那么这枚貌似神奇的Skey到底是什么东东？到底肿么才能将它搞到手呢？下面菲菲跟大家来实战演示：（以QQ空间为例）</p>\n<span class="lst">\n<p>1、进入你的QQ空间中心，确保空间已经处于登陆状态；</p>\n<p>2、复制下方的代码，粘贴到当前浏览器的地址栏上，按回车键即可。Ps. 使用360等浏览器可以直接在地址栏上右键选择“粘贴并访问”哦！</p>\n<pre class="new_code" style="margin-left:22px;color:#804000">\njavascript:var%20a,r=new%20RegExp("skey=(@.{9})");if(a=document.cookie.match(r))alert(a[1]);\n</pre>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="复制代码粘贴到浏览器地址栏并回车" src="http://img.feifeiboke.com/img/201501/qq_skey_paste.png" width="531" height="240" /></p>\n<p>3、这时会弹出一个网页对话框，上面显示的就是当前QQ对应的skey权限代码了。按下<span style="color:#6d201b;">Ctrl+C</span> 快捷键可以直接复制下来。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="在弹出的对话框上按Ctrl+C复制" src="http://img.feifeiboke.com/img/201501/qq_skey_copy.jpg" width="387" height="161" /></p>\n<p>4、关于QQ Skey代码的利用方式和安全隐患与防范，由于篇幅原因，菲菲将在下一篇教程中继续来分享。</p>\n</span>\n<p style="BORDER-BOTTOM: #d6d6d8 1px solid; PADDING-BOTTOM: 5px; MARGIN-BOTTOM: 10px"><strong style="FONT-SIZE: 18px">扩展学习篇</strong></p>\n<p style="MARGIN-TOP: 12px">如果你想随时随地更方便的一键调用代码查看QQ Skey权限码的话，推荐小伙伴们可以将代码添加到浏览器的收藏夹（书签）。方法为；</p>\n<span class="ls">\n<p>1. 将QQ空间的地址添加到收藏夹，快捷键为 Ctrl+D ；</p>\n<p>2. 在浏览器收藏栏找到刚添加好的书签，右键点击“编辑”；</p>\n<p>3. 将网页地址修改为本教程第二步中的代码，网页标题改为“读取Skey”，确定即可。</p>\n<p>4. 添加完成后，只需在浏览器收藏栏上点击该书签就可以弹出当前QQ的权限代码啦！很方便~</p>\n</span>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="编辑浏览器书签，修改为上面的代码" src="http://img.feifeiboke.com/img/201501/add_favorite.png" width="465" height="294" /></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(33, 6, '再谈QQ ClientKey的突破和安全防范', 'http://static.feifeiboke.com/img/201611/bdwp_idx.png', '<p>　　关于利用ClientKey代码获取主人QQ权限，在很久前本博就已经提到。直到有一天看到了“您的网络IP发生了变化，请重新验证”的登录提示，心想腾讯终于开始有所动作，对clientkey直接登录的请求加上了异地IP的安全验证……</p>\n<p>　　可是偶然一次竟发现这个所谓的IP验证确是形同虚设，有时甚至会误拦正常用户。因为利用者很容易就可以突破这个IP校验机制，原理是腾讯仅对旗下部分产品（如空间、微博等等）做了安全校验，而对其他产品则一律“放行”。。。</p>\n<p>　　举例来说，你从QQ上直接点空间图标进入网页时看到了IP变动的提示，但是若点击游戏类的图标则不会有任何提示。这就可以证实上面菲菲博客的推测是正确的。</p>\n<p align="center"><img hspace="0" alt="图为网络IP变动时出现的安全提示" src="/tu/t1/qqdlts.png" width="389" height="310" /></p>\n<p>　　【<strong>安全风险</strong>】通过ClientKey直接登陆QQ旗下网站，在QQ安全中心里我们是查不到登录记录的，甚至可以直接绕过QQ二代密保中的异地登录保护。所以很具有隐蔽性，一旦被坏人利用，对方就可以轻松获取你帐号下的所有权限，进而“为所欲为”。很多童鞋的空间被发垃圾信息很有可能就与key密钥泄漏有关。</p>\n<p>　　【<strong>几种可能会泄漏Key的情况</strong>】①公共上网场所，比如网吧或酒店；②电脑中了带有后门的木马/病毒；③遭到了ARP欺骗攻击或使用了非正规的IE代理；④网络链路存在劫持现象；⑤内网出口设备装有流量监控（可以查用户访问记录）；⑥其他场景，比如被他人手工复制窃取等等。</p>\n<p>　　【<strong>修复与防范</strong>】希望腾讯方面可以尽快完善和解决这方面的安全问题，对所有的ClientKey登录请求均增加IP绑定与验证，最好key密钥用过一次即失效。切实做好用户帐号的安全保障。而我们用户也要多多关注自己QQ号码的安全，养成经常修改密码的习惯，不要使用安全不明的软件，一定要开启安全卫士或电脑管家的实时防护，定期进行体检和木马的查杀。</p>\n<p>　　☆小技巧：说了半天可能有的小盆友还不知道ClientKey是什么呢？非常简单，当你从QQ客户端点击图标等方式进入QQ相关网站的时候，其实就是通过“<span style="color:#2690fe;">http://ptlogin2.qq.com/xxx?clientuin=QQ号&amp;clientkey=64位key字符串</span>”这样的形式自动登陆的，这样可以免去手动登陆的麻烦。因为点击后网址跳转很快，所以一般不容易发现。【来自 菲菲博客原创】</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(34, 6, '保障QQ帐号安全要从“二”开始', 'http://static.feifeiboke.com/img/201611/bdwp_idx.png', '<p>　　当前网络环境日益复杂，各种盗号劫持事件频频发生。这年头QQ要是没丢过密码什么的，你都不好意思跟人家说自己上过网。呵呵，开个玩笑哈。这里又牵扯到QQ帐号安全的问题了（其实也不单指QQ），究竟保护自己的账户安全该如何“二”呢？</p>\n<p>　　<strong>其一：建议增加设置QQ的二次独立密码</strong></p>\n<p>　　由于腾讯旗下产品众多，包括即时IM通讯、邮箱、网盘、游戏等等。一旦密码泄漏，则所有的这些产品都有可能被“沦陷”，后果相当严重哦，尤其是邮箱往往关联着其他重要网络账户（用于找回密码）、微云网盘里存放着隐私文件/照片、QQ通讯录则存有大量的敏感个人信息……所以我们有必要为这些业务产品单独加设一个有效的二次密码验证，就可以大大的降低重要信息泄漏的风险，提高账户安全指数。操作起来也非常简单：</p>\n<p>　　1）邮箱独立密码：进入QQ邮箱 - 设置 - 帐户 - 设置独立密码即可。</p>\n<p>　　2）QQ云通讯录：登录ic.qq.com - 设置 - 密码设置 - 设定后保存。</p>\n<p>　　3）腾讯微云网盘：QQ客户端上进入微云应用 - 进入“独立密码”设置。</p>\n<p>　　<strong>其二：启用腾讯二代高级密码保护手段</strong></p>\n<p>　　当前安卓手机早已盛行变身街机，基本人手一部。所以菲菲博客的朋友们一定要为自己的QQ号码绑定上手机令牌（QQ安全中心手机版），同时开启QQ登录保护、游戏保护和Q币Q点保护。还有如非必要，建议删除静态易引起安全风险的密保问答。相关操作请进入<a href="http://aq.qq.com/" target="_blank">http://aq.qq.com/</a>设置。【来自 菲菲博客原创】</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 124),
(35, 6, 'QQ私密说说或遭泄漏 请大家注意隐私安全', 'http://static.feifeiboke.com/img/201611/bdwp_idx.png', '<p>　　注意了！前段儿时间QQ空间推出的私密说说功能并不一定很靠谱哟！菲菲偶然发现其中一个小小的Bug，竟然可以轻轻松松的看到好友已设置为“仅自己可见”的说说内容。为了大家的隐私安全，请小心泄密哦。</p>\n<p>　　这里所说的私密说说分两种情况，一种是在QQ空间说说模块里发表时设为加密的，另一种是在更新QQ个性签名时，选择不同步到QZone的。这两种方式所发布的说说更新，通常都不会也不可能被好友看到，是吧？</p>\n<p>　　但是但是，越不容易出现问题的情况则越容易被我们所忽视。这个泄漏QZone主人加密说说的真凶，其实就是简版的空间（qz.qq.com），虽然私密说说的内容不会出现在好友的动态中，但是我们只要查看TA的说说列表，里面竟会出现对方“仅自己可见”的说说哦？菲菲博客这里可是有图见真相的噢：</p>\n<p align="center"><img hspace="0" alt="仅主人可见的说说，被我们看到了？" src="/tu/t1/qzssxm.png" width="525" height="181" /></p>\n<p>　　<strong>临时防范：在腾讯方面尚未完全修复该BUG前，请大家一定注意不要随便发表有可能造成个人隐私信息外泄或其他不适合的私密说说，否则只能是掩耳盗铃，你懂的！</strong>要是实在需要，建议可以发在空间的记事本或私密日志。同时也希望腾讯空间团队严谨对待，尽快修复此漏洞，并杜绝此类有可能造成用户隐私泄漏的问题再次发生。【来自 菲菲博客的原创分享】</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(36, 7, '实战5分钟免费搭建网站 可以绑定自己的域名', 'http://static.feifeiboke.com/img/201611/website_idx.png', '<p>这个帖子分享给想要入门学习网站技术的新人童鞋，很经典实用，从注册免费虚拟主机平台、开通网站FTP、绑定自己的顶级域名、上传网站程序源码、登陆网站后台管理自己的网站。如果全部学会了，基本上自己的第一个小小网站就诞生了。</p>\n<p><strong>注册免费空间</strong></p>\n<p style="margin-top:6px">好了，网站程序必须搭建在Web服务器平台（空间）上才能正常访问，所以首先我们来简单注册一个免费虚拟主机空间。这里建议大家可以去老牌免费空间提供商·<a href="http://www.zhujiwu.com/index/freehost.html" target="_blank">主机屋&gt;&gt;</a>免费申请。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="注册登陆主机屋后即可开通免费空间" src="http://static.feifeiboke.com/img/201609/web_build_1.jpg" width="577" height="282" /></p>\n<p>注册好帐号登陆后，点击“立即开通”，一键搞定！第一步至此顺利搞定ing...</p>\n<p><strong>开通网站FTP帐号</strong></p>\n<p style="margin-top:6px">同样只要一键搞定，点击“初始化网站”，进入右侧的“控制面板”，在这里可以进行虚拟空间各种管理操作，首先要设置网站FTP的密码，后面的步骤需要用它来上传网站源程序。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="点击按钮即可一键初始化网站FTP帐号" src="http://static.feifeiboke.com/img/201609/web_build_2.jpg" width="604" height="280" /></p>\n<p>小提示：首次开通空间后为一个月的有效期，别怕，到期前可以一直免费续期的哟~</p>\n<p><strong>绑定自己的域名</strong></p>\n<p style="margin-top:6px">系统默认赠送的域名是无法直接访问的，所以必须要绑定一个自己的域名。如果手头已经有域名可以直接添加绑定，然后去域名注册商那里作域名解析即可。</p>\n<p>初期没有自己域名的小伙伴也可以选择<a href="http://www.feifeiboke.com/website/2356.html" target="_blank">免费TK域名</a>来测试学习。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="按提示将绑定的域名解析到指定的别名记录" src="http://static.feifeiboke.com/img/201609/web_build_3a.jpg" width="605" height="283" /></p>\n<p>进入“常规功能” → 域名绑定，添加绑定后点“一键解析”，按提示完成域名解析记录。</p>\n<p><strong>上传网站源码</strong></p>\n<p style="margin-top:6px">一切就绪之后，就可以通过FTP来上传网站程序源代码。网站程序可以从网上找自己喜欢的下载，也可以直接在虚拟空间管理控制台，选择预装更方便一些。比如 WordPress 就是最流行的博客网站程序，Discuz/phpwind是论坛程序，DedeCMS是门户网站程序等等。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="Z-Blog博客网站程序可以免ftp上传在线安装" src="http://static.feifeiboke.com/img/201609/web_build_4.jpg" width="436" height="352" /></p>\n<p>对于入门新手来说，菲菲博客在这里强力建议大家优先学习ASP的网站程序更加容易入门一些，这些asp源码百度一搜一大把，也可以直接测试使用我们之前分享的<a href="http://www.feifeiboke.com/website/2351.html" target="_blank">成品网站源码</a>。</p>\n<p><strong>初始化网站程序</strong></p>\n<p style="margin-top:6px">对于一些Web开源程序，首次访问自己的网站首页，还需要初始化安装程序，主要是进行一些数据库以及后台帐号密码的配置，这些其实只要按照提示步骤一步步完成就可以了。</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="首次访问你的网站首页，即可自动进入初始化安装界面" src="http://static.feifeiboke.com/img/201609/web_build_5.jpg" width="560" height="320" /></p>\n<p>初始化完成后，就可以登陆你自己的网站后台来管理和配置自己的网站了，到此为止，一个初具雏形的小小网站就搭建好了，你可以自己更新网站内容，更换网站模版样式等等。过程看起来码字很多，其实掌握了基础几分钟轻轻松松搞定！</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 124),
(37, 7, '一键免费架设网站服务器 支持对外访问[新]', 'http://static.feifeiboke.com/img/201611/website_idx.png', '<p>最近收到粉多Q友的留言说自己也想搞一个网站玩玩儿，最好可以是不花钱、木有成本滴那就更爽咯！OK，介个小小的要求还是难不倒菲菲滴嘛，下面阿菲就来分享一个超简单搭建Web服务器的小方法，可以一键将你的普通电脑变身为网站服务器哟！</p>\n<span class="lst">\n<p>1、为了实现快速架设PHP(网站程序)+MySQL(数据库)Web运行环境，这里提供一款超级棒的免费工具 - USBWebserver，是国外汉化版的，绿色无需安装，解压即可使用！</p>\n<p><div class="dlbor" style="padding:22px"><a href="http://dlsw.baidu.com/sw-search-sp/soft/bf/24580/ha_USBWebserver.1393556071.rar" hidefocus="true" class="dl" target="_blank">USBWebserver工具包 (15.1M)</a></div></p>\n<p>2、下载上面的工具包，将里面全部的文件(夹)完整的解压出来，双击运行主程序“usbwebservercncn.exe”，这时一个完美的Web运行环境就搞定了！</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="双击鼠标启动USBWebserver主程序" src="http://img.feifeiboke.com/img/201412/webdj_1.png" width="454" height="282" /></p>\n<p>3、由于该工具包默认开启的网站端口为 8080 ，所以我们需要进入“设置”，将Apache端口手动修改为 <span style="color:#8d3901;">80</span> ，点击保存后如果没有生效，请关闭软件重新打开即可解决~</p>\n<p style="TEXT-ALIGN: center"><img hspace="0" alt="将默认的8080网站访问端口修改为80" src="http://img.feifeiboke.com/img/201412/webdj_2.png" width="496" height="243" /></p>\n<p>4、完成以上步骤后，在浏览器地址栏输入 <u>http://localhost/</u> （或<u>http://127.0.0.1/</u>），如果可以正常打开，则说明网站运行环境一切正常。下一步再在地址栏中输入 <u>http://localhost/phpmyadmin/</u> 回车即可打开MySQL数据库的管理登陆页面，默认用户名：root 密码：usbw ，登陆可以进行数据库的各项管理操作，如新建用户/数据库等等。</p>\n<p>5、到此为止关于Web服务器的架设和配置环节就可以基本搞定了。继续最重要的下一步 - 放置网站程序！这里大家也不用犯愁，网上有很多现成儿的PHP免费源码，或者有条件的话你也可以自己设计网页程序。篇幅关系本文不再详述，后续教程会继续跟进。</p></span>\n<p>Ps. USBWebserver工具包默认的网站根目录为 root 文件夹下，请将下载到的php源码解压到此目录，按照不同源码的安装提示完成初始化配置即可开始登陆网站后台管理和访问了。如果你对网站搭建有浓厚的兴趣，但是又有棘手的问题搞不定的话，欢迎加入 菲菲博客技术互助群（QQ群：<span style="color:#940000;">294051180</span>），我会为小伙伴们答疑解惑哒！</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(38, 7, '巧用安卓手机一分钟免费架设网站服务器', 'http://static.feifeiboke.com/img/201611/website_idx.png', '<p>普普通通的安卓手机竟然也能当网站服务器使？没错，还真别小看她哟，我们只需要安装一个小小的APK软件，就可以一分钟立马在自己的智能手机上免费架设一个基于PHP+MySQL的网站平台，轻松拥有自己的网站博客哦！</p>\n<p><strong>一、搭建基于安卓的Web服务器平台</strong></p>\n<p>1、下载本文最后的附件，将压缩包内的“KSWeb汉化版V2.82.apk”安装到手机；</p>\n<p>2、打开安装好的APP，首次启动后需按提示重启软件方可正常使用；</p>\n<p>3、按手机菜单键进入“选项”，将“启用root功能”打上对勾（获得root权限才能改端口哦），再将默认的服务器“端口”修改为80，退出程序后重启软件生效。</p>\n<p align="center"><img hspace="0" alt="开启root后将默认端口改为80" src="/tu/t1/webapk1118.jpg" width="509" height="308" /></p>\n<p><strong>二、安装配置必要的Web网站程序源码</strong></p>\n<p>1、手机通过数据线连接电脑，将附件压缩包内的“网站程序源码”目录里的所有文件复制到手机存储卡 - htdocs目录下（只全选复制目录里面的文件，不包括这个本身文件夹！）</p>\n<p>2、在电脑浏览器上，输入网址 http://手机内网ip/ 回车打开（ip地址会在app界面显示）。同意协议打勾，点“下一步”开始安装Z-Blog博客网站程序；</p>\n<p>3、继续“下一步”，在配置数据库时，菲菲博客建议大家选择“SQLite数据库”，然后下面的网站管理账号密码一定要记牢哟；</p>\n<p align="center"><img hspace="0" alt="配置数据库时建议大家选择“SQLite”" src="/tu/t1/web1118a.jpg" width="526" height="265" /></p>\n<p>4、接着再点“下一步”即可完成Web源码的安装，进入站点首页，在右侧的“控制面板”下登录后台就可以管理自己的网站啦（用户名/密码就是第三步中你填的那个）！</p>\n<p align="center"><img hspace="0" alt="配置成功后即可登陆后台管理自己的站点" src="/tu/t1/web1118b.png" width="516" height="298" /></p>\n<p>PS：至此为止，Z-Blog博客网站就已经被我们成功搭建在了安卓手机上，那么如何绑定域名到公网IP上供别人来访问呢？鉴于本文篇幅过长，不利于大家“消化”，菲菲将在明天继续为朋友们更新教程哦！ </p>\n<p><span style="font-family:黑体;font-size:16px;">教程附件</span>：<br /><a class="dl" href="/dl/d1/398.html" rel="nofollow" target="_blank">安卓手机建站apk+源码打包</a></p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(39, 7, '在自己的XP系统上免费搭建Nginx服务器', 'http://static.feifeiboke.com/img/201611/website_idx.png', '<p>如果你也对网站服务器感兴趣，那不妨来简单学习一下关于搭建Nginx WEB服务器的基础吧。当然Nginx主要是用在Linux的主机上的，但是它同时也可以运行在Windows上，下面菲菲就以XP系统为演示。</p>\n<p>　1、下载Nginx（1.2.4稳定版）程序包，仅有1M左右大小，相当小巧功能强大！比起臃肿庞大的微软IIS，那可真是。。。不过要说明的是Nginx只要是来搭建php的运行环境的，而IIS则是用来跑ASP，二者定位不同。<br /><a class="dl" href="http://nginx.org/download/nginx-1.2.4.zip" rel="nofollow" target="_blank">立即下载Nginx服务程序包&gt;&gt;</a></p>\n<p>　2、将下载好的zip压缩包的文件全部解压，双击运行nginx.exe，你会看到一个黑色窗口一闪而过就没了，这就说明Nginx服务器已经正式启动（没有程序界面的）。</p>\n<p>　3、在浏览器输入访问 127.0.0.1 回车，如果看到“Welcome to nginx!”则说明你在本机搭建的服务器已经成功运行。如果没有，请检查你的电脑的80端口是否被占用，或者打开任务管理器查看一下是否有两个“nginx.exe”进程在运行。</p>\n<p>PS：完成以上简单的三步后，我们的Nginx网页服务器就搭建完成了，但是呢到这里只能支持html的纯网页，如果想让它支持php脚本还需要进一步安装php的运行环境，为了更容易让大家上手，所以php环境的配置会在后面的教程文章中给朋友们分开来讲。</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 124);
INSERT INTO `blog_post` (`id`, `catg_id`, `title`, `cover_url`, `content`, `tags`, `status`, `create_time`, `update_time`, `author_id`, `read_count`) VALUES
(40, 7, '将TK域名免费解析到指定IP的方法', 'http://static.feifeiboke.com/img/201611/website_idx.png', '<p>看到有童鞋问TK域名如何解析到本机ip的问题，想到菲菲在之前的教程中只讲解了TK域名的申请但并没有详细提到域名解析IP的方法，所以下面就来简单的介绍一下吧，网站搭建之域名基本常识哦！</p>\n<p><strong>NO1. 申请TK域名时直接设置解析IP</strong></p>\n<p>这个比较简单，直接在免费<a href="http://www.feifeiboke.com/pcjiqiao/ziyuan/1971.html" target="_blank">申请TK域名</a>时在“使用你的新域名”下选择“Use DNS”默认使用人家Dot TK的DNS服务就好，然后在IP地址后输入你自己指定的ip地址继续申请就OK了。<br /><img hspace="0" alt="如图选择默认DNS填写ip" src="/tu/tkipjx.jpg" width="536" height="253" /></p>\n<p>注：你指定的IP地址必须是公网IP，不可以是本机或内网的地址，比如127.0.0.1或192.168.*.*等都是错误的。查询自己电脑外网ip请直接使用百度搜索IP即可看到。</p>\n<p><strong>NO2. 对于已经申请好的TK域名的解析</strong></p>\n<ol>\n<li>首先需要<a href="http://my.dot.tk/cgi-bin/login01.taloha" target="_blank" rel="nofollow">点击这里&gt;&gt;</a>登录Dot TK域名的管理平台（后台是英文哈，不懂的童鞋请在线翻译...），然后点“go to domains”，在你的域名后面点“Modify”就可以重新修改该域名的IP解析记录了。<br /><br /></li>\n<li>需要你选择中间的“Dot TK DNS Service”选项，Host Name 填写你的TK域名，IP Address 就是你想要解析的ip，和申请时一样只能填写外网的ip地址哦。完成后记得点“Save Changes”保存！看到“Your settings are updated succesfully.”的提示信息就证明你修改成功了。<br /><img hspace="0" alt="选择dot TK的DNS设置ip地址" src="/tu/tkipjx1.jpg" width="543" height="310" /></li></ol>\n<p>PS：由于域名解析系统生效是需要一定的时间的，所以大家修改成功后5分钟后可能才会生效。如何判断生效了呢？没错，就是利用ping命令就可以帮到你，如果ping返回的IP和你设置的ip一致就说明已经生效了。</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(41, 7, '10秒让你拥有一个自己的完整网站', 'http://static.feifeiboke.com/img/201611/website_idx.png', '<p>在平时和大家互动交流中看得出来，很多同学还是对网站搭建蛮有兴趣的，所以这个关于网站架设的动画教程就出炉了。希望可以帮大家在最短的时间里(说10秒有些夸张哈)，快速拥有一个完整的属于自己的个人站点！</p>\n<p>·视频教程下载(6.18 MB)：<br /><a class="dl" href="/dl/d/273.html" rel="nofollow" target="_blank">立即打包下载成品网站教程</a></p>\n<p>教程：本机免费搭建完整网站教程<br />制作：菲菲博客<br />备注：视频教程中所用到的工具和文件都会打包滴。</p>\n<p>1、首先将打包在www目录里的文件全部解压出来，运行 HTTP.exe 网站服务器程序；出现小图标就成功了。</p>\n<p>2、然后在浏览器中输入127.0.0.1 回车访问就看到效果咯，如果你是宽带直接连接上网也可以直接访问你的外网ip地址，而内网则需要做<a href="http://www.feifeiboke.com/pcjiqiao/pcjq/2332.html" target="_blank">端口映射</a>才能达到和外网一样的目的；</p>\n<p>3、现在直接访问到的是我们的网站前台，后台需要进入Admin目录下，就可以进行各种管理操作了，比如更新文章、增删栏目、网站配置等等.. 用户名和密码默认的都是admin 请大家一定要及时改掉哦！</p>\n<p>大家看 现在这个网站程序已经自带了很多的内容，大家不想要的话可以一键清空也可以保留。来这里清空初始化就行。logo图片也可以在这里上传修改。都是非常简单的，就向在你的空间发布日志一样方便。时间关系，大家就自己摸索吧，说重点的。</p>\n<p>如何让别人访问自己在本地电脑上搭建的网站呢？很简单，直接将自己的ip发给好友访问即可（需要外网环境，内网需要做端口映射）。另外还可以去申请自己喜欢的<a href="http://www.feifeiboke.com/pcjiqiao/ziyuan/1971.html" target="_blank">免费TK域名</a>，解析到自己的ip上就可以通过域名直接访问啦！！</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(42, 7, '本地搭建FTP和ftp工具上传网页的方法', 'http://static.feifeiboke.com/img/201611/website_idx.png', '<p>这节教程特别适合对网站有兴趣的新手同学学习，我们就从最简单的搭建FTP本地服务器并上传文件开始学起。看到部分童鞋对FTP工具还不太知道怎么使用，所以做了个演示教程提供给大家。</p>\n<p>动画演示教程（1.07 MB）：<br /><a class="dl" href="/dl/d/260.html" rel="nofollow" target="_blank">立即下载FTP使用教程</a></p>\n<p>教程：本地搭建FTP服务器+FTP上传教程<br />制作：菲菲博客 （www.feifeiboke.com）<br />备注：教程中所使用到的ftp相关工具都会打包滴！</p>\n<p>一：先在本地搭建一个FTP的服务器 </p>\n<p>打开FTP本地服务器程序，开始配置吧。</p>\n<p>完成后还需要启动ftp 最小化。 完成OK！</p>\n<p>二：演示一下8U FTP上传工具的具体使用方法</p>\n<p>还记得吗？刚才创建的ftp服务器帐号和密码？好了我们打开8U ftp，开始演示一下如何上传文件</p>\n<p>地址填写ftp服务器的地址，本机ip是127.0.0.1或你的内网ip，如果是申请的<a href="http://www.feifeiboke.com/pcjiqiao/ziyuan/2302.html" target="_blank">网站空间</a>的话，请填写你的空间的服务器ip地址。</p>\n<p>连接成功后，开始上传文件吧。直接选择需要上传的网页文件 拖拽到右侧即可自动上传！这里是我们本机搭建的ftp服务器演示的，所以比较快。</p>', 'hello,world', 1, 1486959230, 1486959230, 1, 123),
(52, 7, '让我来告诉你yii是什么学会Yii很简单', '/blog_demo/upload/admin/post/image/20170224/20170224065440_79614.png', '<h1>\n	Yii 是什么\n</h1>\n<p>\n	Yii 是一个高性能，基于组件的 PHP 框架，用于快速开发现代 Web 应用程序。\n名字 Yii （读作易）在中文里有“极致简单与不断演变”两重含义，\n也可看作 <strong>Yes It Is</strong>! 的缩写。\n</p>\n<h2>\n	Yii 最适合做什么？\n</h2>\n<p>\n	Yii 是一个通用的 Web 编程框架，即可以用于开发各种用 PHP 构建的 Web 应用。\n因为基于组件的框架结构和设计精巧的缓存支持，它特别适合开发大型应用，\n如门户网站、社区、内容管理系统（CMS）、电子商务项目\n和 RESTful Web 服务等。\n</p>\n<h2>\n	Yii 和其他框架相比呢？\n</h2>\n<p>\n	如果你有其它框架使用经验，那么你会很开心看到 Yii 所做的努力：\n</p>\n<ul>\n	<li>\n		和其他 PHP 框架类似，Yii 实现了 MVC（Model-View-Controller）\n设计模式并基于该模式组织代码。\n	</li>\n	<li>\n		Yii 的代码简洁优雅，这是它的编程哲学。它永远不会为了刻板地\n遵照某种设计模式而对代码进行过度的设计。\n	</li>\n	<li>\n		Yii 是一个全栈框架，提供了大量久经考验，开箱即用的特性：\n对关系型和 NoSQL 数据库都提供了查询生成器和 \nActiveRecord；RESTful API 的开发支持；多层缓存支持，等等。\n	</li>\n	<li>\n		Yii 非常易于扩展。你可以自定义或替换几乎任何一处核心代码。你还会受益于 Yii \n坚实可靠的扩展架构，使用、再开发或再发布扩展。\n	</li>\n	<li>\n		高性能始终是 Yii 的首要目标之一。\n	</li>\n</ul>\n<p>\n	Yii 不是一场独角戏，它由一个<a href="http://www.yiiframework.com/about/">强大的开发者团队</a> 提供支持，也有一个庞大的专家社区，持续不断地对 Yii 的开发作出贡献。Yii 开发者团队\n始终对 Web 开发趋势和其他框架及项目中的最佳实践和特性保持密切关注，\n那些有意义的最佳实践及特性会被不定期的整合进核心框架中，\n并提供简单优雅的接口。\n</p>\n<h2>\n	Yii 版本\n</h2>\n<p>\n	Yii 当前有两个主要版本：1.1 和 2.0。 1.1 版是上代的老版本，现在处于维护状态。\n2.0 版是一个完全重写的版本，采用了最新的技术和协议，包括依赖包管理器\nComposer、PHP 代码规范 PSR、命名空间、Traits（特质）等等。 2.0 版代表新一代框架，\n是未来几年中我们的主要开发版本。本指南主要基于 2.0 版编写。\n</p>\n<h2>\n	系统要求和先决条件\n</h2>\n<p>\n	Yii 2.0 需要 PHP 5.4.0 或以上版本支持。你可以通过运行任何 Yii 发行包\n中附带的系统要求检查器查看每个具体特性所需的 PHP 配置。\n</p>\n<p>\n	使用 Yii 需要对面向对象编程（OOP）有基本了解，因为 Yii 是一个纯面向对象的框架。\nYii 2.0 还使用了 PHP 的最新特性，例如<a href="http://www.php.net/manual/en/language.namespaces.php">命名空间</a> 和<a href="http://www.php.net/manual/en/language.oop5.traits.php">Trait（特质）</a> 。理解这些概念将有助于你更快地掌握 Yii 2.0。\n</p>', 'yii', 1, 1487919300, 1487919300, 1, 17),
(53, 4, 'QQ飞车庆典美女车展', '/blog_demo/upload/admin/post/image/20170224/20170224065842_84072.png', '<img src="/blog_demo/upload/admin/post/image/20170224/20170224065900_38910.jpg" alt="" />', '车展;车模', 1, 1487919544, 1487919544, 1, 14);

-- --------------------------------------------------------

--
-- 表的结构 `blog_post_catg`
--

CREATE TABLE IF NOT EXISTS `blog_post_catg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catg_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `catg_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_show` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `blog_post_catg`
--

INSERT INTO `blog_post_catg` (`id`, `catg_name`, `catg_url`, `is_show`) VALUES
(1, '首页', 'index.php', 1),
(2, 'QQ技巧', 'index.php?r=post/index&PostSearch[catg_id]=2', 1),
(3, '安卓玩机', 'index.php?r=post/index&PostSearch[catg_id]=3', 1),
(4, 'QQ活动', 'index.php?r=post/index&PostSearch[catg_id]=4', 1),
(5, '电脑技术', 'index.php?r=post/index&PostSearch[catg_id]=5', 1),
(6, '网站安全', 'index.php?r=post/index&PostSearch[catg_id]=6', 1),
(7, 'web实战', 'index.php?r=post/index&PostSearch[catg_id]=7', 1);

-- --------------------------------------------------------

--
-- 表的结构 `blog_test`
--

CREATE TABLE IF NOT EXISTS `blog_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `neme` varchar(30) NOT NULL DEFAULT 'test',
  `email` varchar(60) NOT NULL DEFAULT 'test@qq.com',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `blog_test`
--

INSERT INTO `blog_test` (`id`, `neme`, `email`) VALUES
(1, 'wangerxiao', '1575233134@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `blog_user`
--

CREATE TABLE IF NOT EXISTS `blog_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `blog_user`
--

INSERT INTO `blog_user` (`id`, `username`, `mobile`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dengsan_member', 18335102123, 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', 'NULL', '1575233134@qq.com', 10, 1462597929, 1477554091),
(2, 'dengyifang', 0, 'zogZ8wYgG4N8cgwnyD3bdm1qzLAmojRg', '$2y$13$8Cb2B//tL.rl9wnS1CZCEumavDzEP.NZQ9zk8zn5yyAOidyJQ3bYC', NULL, '905254174@qq.com', 10, 1486982408, 1486982408),
(3, 'dengzifan', 0, 'YlmRp5e_eXGJo7uAcSHWn2c6sUJhBrkW', '$2y$13$EXiRVoDOPnWupIIaO3tdMeXm0wPUxi2CRnMy9xe8LgPqMYI016RdC', NULL, '1985626@qq.com', 10, 1486985324, 1487923008);

-- --------------------------------------------------------

--
-- 表的结构 `blog_user_info`
--

CREATE TABLE IF NOT EXISTS `blog_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 限制导出的表
--

--
-- 限制表 `blog_auth_assignment`
--
ALTER TABLE `blog_auth_assignment`
  ADD CONSTRAINT `blog_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `blog_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `blog_auth_item`
--
ALTER TABLE `blog_auth_item`
  ADD CONSTRAINT `blog_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `blog_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `blog_auth_item_child`
--
ALTER TABLE `blog_auth_item_child`
  ADD CONSTRAINT `blog_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `blog_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blog_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `blog_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
