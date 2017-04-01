-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-01 21:25:55
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thinkphp`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_ad`
--

CREATE TABLE `think_ad` (
  `adid` int(11) NOT NULL,
  `station` int(11) NOT NULL COMMENT '广告位置',
  `html` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_ad`
--

INSERT INTO `think_ad` (`adid`, `station`, `html`, `time`) VALUES
(22, 1, '<h2>MM</h2>', 1490347861);

-- --------------------------------------------------------

--
-- 表的结构 `think_auth_group`
--

CREATE TABLE `think_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_auth_group`
--

INSERT INTO `think_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '默认管理组', 1, '1,2,3,4,5,6'),
(2, '审核组', 1, '1,2,3,4,5,6,7,8,9,10,11,12,13,14');

-- --------------------------------------------------------

--
-- 表的结构 `think_auth_group_access`
--

CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_auth_group_access`
--

INSERT INTO `think_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `think_auth_rule`
--

CREATE TABLE `think_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_auth_rule`
--

INSERT INTO `think_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`) VALUES
(1, 'Admin/Index/index', '后台首页', 1, 1, ''),
(2, 'Admin/Index/home', '系统桌面', 1, 1, '{score}>5 and {score}<100'),
(3, 'Admin/User/delete', '删除会员', 1, 1, '{delete}');

-- --------------------------------------------------------

--
-- 表的结构 `think_category`
--

CREATE TABLE `think_category` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) UNSIGNED NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类表';

--
-- 转存表中的数据 `think_category`
--

INSERT INTO `think_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(1, 'blog', '博客', 0, 0, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1', 0, 0, 1, 0, 0, '1', '', 1379474947, 1382701539, 1, 0, ''),
(2, 'default_blog', '默认分类', 1, 1, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1386839751, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `think_check`
--

CREATE TABLE `think_check` (
  `cid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `pid` int(11) NOT NULL COMMENT '已经审批的PID',
  `lastcheck` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '审批人uid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `think_comment`
--

CREATE TABLE `think_comment` (
  `cid` int(11) NOT NULL COMMENT '评论ID',
  `ccid` int(11) NOT NULL COMMENT '跟帖',
  `time` int(11) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL COMMENT '评论',
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `del` int(11) NOT NULL,
  `lou` int(11) NOT NULL COMMENT '楼层',
  `relou` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_comment`
--

INSERT INTO `think_comment` (`cid`, `ccid`, `time`, `comment`, `pid`, `uid`, `name`, `del`, `lou`, `relou`) VALUES
(1, 0, 1490803521, '钱钱钱钱钱钱钱钱钱钱钱钱钱', 7, 4, '123', 1, 1, 0),
(2, 0, 1490803522, '钱钱钱钱钱钱钱钱钱钱钱钱钱', 7, 4, '123', 1, 2, 0),
(3, 1, 1490803533, '阿斯达斯的#acfun_3#', 7, 4, '123', 0, 3, 0),
(4, 0, 1490820386, 'vvvvvvvvvv', 7, 4, '123', 0, 4, 0),
(5, 0, 1490821155, '程序写错v想', 7, 4, '123', 0, 5, 0),
(6, 0, 1490821819, '啊啊啊啊啊啊啊', 7, 4, '123', 0, 6, 0),
(7, 0, 1490821923, '生生世世', 7, 4, '123', 0, 7, 0),
(8, 0, 1490822055, '生生世世', 7, 4, '123', 0, 8, 0),
(9, 0, 1490822090, '水水水水水水水水水水', 7, 4, '123', 0, 9, 0),
(10, 0, 1490822188, '杀杀杀杀杀杀杀杀杀', 7, 4, '123', 0, 10, 0),
(11, 0, 1490822215, '水水水水水水水水水水水水', 7, 4, '123', 0, 11, 0),
(12, 0, 1490822262, '水水水水水水水水水水水水#acfun_3#', 7, 4, '123', 0, 12, 0),
(13, 0, 1490822807, 'rfgedrrtreterte', 7, 4, '123', 1, 13, 0),
(14, 0, 1490822817, 'dfgdfgdfgdfgdfgdfg', 7, 4, '123', 1, 14, 0),
(15, 0, 1490822938, 'sadfsfsdfsdfsdfsdf', 7, 4, '123', 1, 15, 0),
(16, 0, 1490822950, 'sadasdasdasdasd', 7, 4, '123', 1, 16, 0),
(17, 0, 1490822953, 'sadasdasdasdasd', 7, 4, '123', 1, 17, 0),
(18, 0, 1490822997, 'ddddddddddddd', 7, 4, '123', 0, 18, 0),
(19, 0, 1490823094, 'dfsdfsdfsdfsdfsdf', 7, 4, '123', 0, 19, 0),
(20, 0, 1490823103, '#acfun_23#', 7, 4, '123', 0, 20, 0),
(21, 0, 1490823165, '#acfun_29#', 7, 4, '123', 0, 21, 0),
(22, 0, 1490823174, '#acfun_2#', 7, 4, '123', 0, 22, 0),
(23, 0, 1490823228, '#acfun_14#', 7, 4, '123', 0, 23, 0),
(24, 0, 1490823257, '#acfun_1#', 7, 4, '123', 0, 24, 0),
(25, 0, 1490823448, '444844848489', 7, 4, '123', 0, 25, 0),
(26, 0, 1490823451, '41418541854854', 7, 4, '123', 1, 26, 0),
(27, 0, 1490825244, 'ssssssssssssssssssssssssssssss#acfun_2#ssssssssss', 7, 4, '123', 0, 27, 0),
(28, 0, 1490827034, 'aaaaaaaaaaaaaaaa', 7, 4, '123', 1, 28, 0),
(29, 0, 1490827125, 'sssssssssssssssssssssssssssss', 7, 4, '123', 1, 29, 28),
(30, 29, 1490827184, 'xxxxxxxxxxxxxxxxxxxxxxxxx', 7, 4, '123', 1, 30, 29),
(31, 30, 1490827287, 'dssssssssssssssss', 7, 4, '123', 1, 31, 30),
(32, 30, 1490827290, 'dssssssssssssssss', 7, 4, '123', 1, 32, 30),
(33, 30, 1490827294, 'dssssssssssssssss', 7, 4, '123', 1, 33, 30),
(34, 33, 1490827312, 'cccccccccccccccccccc', 7, 4, '123', 1, 34, 33),
(35, 33, 1490827314, 'cccccccccccccccccccc', 7, 4, '123', 1, 35, 33),
(36, 35, 1490827407, '4444854545', 7, 4, '123', 1, 36, 35),
(37, 36, 1490827465, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 7, 4, '123', 1, 37, 36),
(38, 37, 1490827498, 'dddddddddddddddddddddd', 7, 4, '123', 1, 38, 37),
(39, 27, 1490827816, 'dsfsdfsdfsdfsdf#acfun_23#', 7, 4, '123', 0, 39, 27),
(40, 0, 1490827821, '#acfun_26#', 7, 4, '123', 0, 40, 0),
(41, 0, 1490827825, '#acfun_21#', 7, 4, '123', 0, 41, 0),
(42, 0, 1490827828, '#acfun_29#', 7, 4, '123', 0, 42, 0),
(43, 41, 1490827848, '#acfun_45#', 7, 4, '123', 0, 43, 41),
(44, 42, 1490828205, 'aaaaaaaaaaaaaaaaaaaaaa', 7, 4, '123', 0, 44, 42),
(45, 44, 1490828281, 'xxxxxxxxxxxxxxxxx', 7, 4, '123', 0, 45, 44),
(46, 0, 1490828384, '现在可以了#acfun_13#', 7, 4, '123', 0, 46, 0),
(47, 46, 1490828398, '不怎么好！！！！', 7, 4, '123', 0, 47, 46),
(48, 0, 1490828535, '什么鬼？？？？#acfun_2#', 8, 4, '123', 0, 48, 0),
(49, 0, 1490828580, '水水水水水水水水水水水水水水水水水水水', 82, 4, '123', 0, 49, 0),
(50, 0, 1490828584, '#acfun_3#', 82, 4, '123', 0, 50, 0),
(51, 0, 1490828753, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', 82, 4, '123', 1, 51, 0),
(52, 0, 1490828979, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', 82, 4, '123', 1, 52, 0),
(53, 0, 1490855369, '666666666666666', 82, 4, '123', 1, 53, 0),
(54, 0, 1490855376, '#acfun_13#', 82, 4, '123', 0, 54, 0),
(55, 0, 1490855834, '847488888878', 7, 4, '123', 1, 55, 0),
(56, 54, 1490856304, '85485485485485', 82, 4, '123', 1, 56, 54),
(57, 56, 1490856311, '5845848484848848484', 82, 4, '123', 1, 57, 56),
(58, 0, 1490856577, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa', 7, 4, '123', 1, 58, 0),
(59, 0, 1490856611, 'wwwwwwwwwwwwwwwwwwww', 7, 4, '123', 1, 59, 0),
(60, 0, 1490856814, '#acfun_28# 终于写好了   评论系统', 7, 4, '123', 0, 60, 0),
(61, 60, 1490856828, '累死我了', 7, 4, '123', 0, 61, 60),
(62, 0, 1490901361, '2222222222222222', 83, 4, '123', 0, 62, 0),
(63, 0, 1490901608, '55555555555555555', 83, 4, '123', 0, 2, 0),
(64, 0, 1490901625, '5555555555555555555555555', 83, 4, '123', 0, 3, 0),
(65, 0, 1490901637, '4555555551555151', 83, 4, '123', 0, 4, 0),
(66, 0, 1490901644, '8418566', 83, 4, '123', 0, 5, 0),
(67, 0, 1490901654, '8459895489', 83, 4, '123', 0, 6, 0),
(68, 0, 1490901667, '4444444444444444444444444', 83, 4, '123', 0, 7, 0),
(69, 0, 1490901678, '444444444444444444444444444444444444444444', 83, 4, '123', 0, 8, 0),
(70, 0, 1490955774, '22222222222222222222', 7, 4, '123', 0, 53, 0),
(71, 0, 1490955782, '22222222222222222222', 7, 4, '123', 0, 54, 0),
(72, 0, 1490955783, '22222222222222222222', 7, 4, '123', 0, 55, 0),
(73, 0, 1490955784, '22222222222222222222', 7, 4, '123', 0, 56, 0),
(74, 0, 1490955785, '22222222222222222222', 7, 4, '123', 0, 57, 0),
(75, 0, 1490955786, '22222222222222222222', 7, 4, '123', 0, 58, 0),
(76, 0, 1490955787, '22222222222222222222', 7, 4, '123', 0, 59, 0),
(77, 0, 1490955902, '呃呃呃', 7, 4, '123', 0, 60, 0),
(78, 0, 1490955950, '<img class=\"emoji_icon\" src=\"/plugins/em/dist/img/acfun/23.gif\">22222', 7, 4, '123', 0, 61, 0),
(79, 0, 1490956057, '<img class=\"emoji_icon\" src=\"/plugins/em/dist/img/acfun/19.gif\">2222222', 7, 4, '123', 0, 62, 0),
(80, 0, 1490956427, '#acfun_1#', 7, 4, '123', 0, 63, 0),
(81, 0, 1490957072, '<img class=\"emoji_icon\" src=\"/plugins/em/dist/img/acfun/3.gif\">', 7, 4, '123', 0, 64, 0),
(82, 0, 1490957915, '<img class=\"emoji_icon\" src=\"/plugins/em/dist/img/acfun/23.gif\">', 7, 4, '123', 0, 65, 0),
(83, 0, 1491059819, '8585456485456456446', 8, 4, '123', 0, 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `think_danmu`
--

CREATE TABLE `think_danmu` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `danmu` text CHARACTER SET utf8 NOT NULL,
  `ip` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_danmu`
--

INSERT INTO `think_danmu` (`id`, `pid`, `uid`, `time`, `danmu`, `ip`) VALUES
(7, 7, 4, 1490295951, '{ \"text\":\"水水水水水水水\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":1334}', ''),
(8, 7, 4, 1490295994, '{ \"text\":\"大师傅士大夫似的\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":15}', ''),
(11, 7, 4, 1490296002, '{ \"text\":\"豆腐干豆腐干豆腐干豆腐干\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":92}', ''),
(12, 7, 4, 1490296005, '{ \"text\":\"梵蒂冈地方官地方官地方官地方官地方官\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":122}', ''),
(13, 7, 4, 1490296008, '{ \"text\":\"打发手动阀手动阀手动阀手动阀手动阀是\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":156}', ''),
(14, 7, 4, 1490296439, '{ \"text\":\"额的人访问日本\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":2249}', ''),
(23, 7, 4, 1490303010, '{ \"text\":\"你个傻逼***\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":13889}', '127.0.0.1'),
(25, 7, 4, 1490332084, '{ \"text\":\"233333\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":38}', '127.0.0.1'),
(26, 7, 4, 1490786455, '{ \"text\":\"6621665656\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":7}', '127.0.0.1'),
(27, 7, 4, 1490786465, '{ \"text\":\"265656565\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":105}', '127.0.0.1'),
(28, 7, 4, 1490787261, '{ \"text\":\"ddddd\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":8064}', '127.0.0.1'),
(29, 7, 4, 1490787271, '{ \"text\":\"fffffffffffffffffff\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":8163}', '127.0.0.1'),
(30, 7, 4, 1490787472, '{ \"text\":\"nnnnnnnnnnnnnnn\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":10179}', '127.0.0.1'),
(31, 7, 4, 1490787486, '{ \"text\":\"nnnnnnnnnnnnnnnn\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":10318}', '127.0.0.1'),
(32, 7, 4, 1490788274, '{ \"text\":\"222222222222222222\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":1906}', '127.0.0.1'),
(33, 7, 4, 1490788283, '{ \"text\":\"噩噩噩噩噩噩噩噩噩噩噩噩\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":1993}', '127.0.0.1'),
(34, 7, 4, 1490794735, '{ \"text\":\"呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":3}', '127.0.0.1'),
(35, 7, 4, 1490794738, '{ \"text\":\"噩噩噩噩噩噩噩噩噩噩噩噩噩噩\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":30}', '127.0.0.1'),
(36, 7, 4, 1490794742, '{ \"text\":\"噩噩噩噩噩噩噩噩噩噩噩噩噩噩噩\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":64}', '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `think_danmufobidden`
--

CREATE TABLE `think_danmufobidden` (
  `fid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `forbidden` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL COMMENT '禁止词语',
  `changeto` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '***' COMMENT '被替换词语 默认*'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_danmufobidden`
--

INSERT INTO `think_danmufobidden` (`fid`, `uid`, `time`, `forbidden`, `changeto`) VALUES
(1, 4, 1490366027, 'sb', '***'),
(2, 4, 1490351602, '傻逼', '***'),
(3, 0, 0, '共产党', '***');

-- --------------------------------------------------------

--
-- 表的结构 `think_group`
--

CREATE TABLE `think_group` (
  `gid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL COMMENT '管理名称',
  `info` text NOT NULL COMMENT '登入信息',
  `level` int(11) NOT NULL COMMENT '[1/2/3/4/5]管理能力'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_group`
--

INSERT INTO `think_group` (`gid`, `uid`, `name`, `info`, `level`) VALUES
(1, 4, '管理组', '[{\"time\":1490340069,\"ip\":\"127.0.0.1\"},{\"time\":1490342123,\"ip\":\"127.0.0.1\"},{\"time\":1490365890,\"ip\":\"127.0.0.1\"},{\"time\":1490367231,\"ip\":\"127.0.0.1\"},{\"time\":1490367374,\"ip\":\"127.0.0.1\"},{\"time\":1490409633,\"ip\":\"127.0.0.1\"},{\"time\":1490794780,\"ip\":\"127.0.0.1\"},{\"time\":1491063702,\"ip\":\"127.0.0.1\"}]', 3);

-- --------------------------------------------------------

--
-- 表的结构 `think_member`
--

CREATE TABLE `think_member` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `score` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_member`
--

INSERT INTO `think_member` (`id`, `username`, `score`) VALUES
(1, '小朱', 3);

-- --------------------------------------------------------

--
-- 表的结构 `think_pointhistory`
--

CREATE TABLE `think_pointhistory` (
  `hid` int(11) NOT NULL,
  `history` text NOT NULL COMMENT '每次操作记录'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_pointhistory`
--

INSERT INTO `think_pointhistory` (`hid`, `history`) VALUES
(1, '[{\"rid\":7,\"time\":1490785511,\"by\":\"system\"}]'),
(2, '[{\"rid\":7,\"time\":1490785516,\"by\":\"system\"}]'),
(3, '[{\"rid\":7,\"time\":1490785529,\"by\":\"system\"}]'),
(4, '[{\"rid\":7,\"time\":1490785702,\"by\":\"system\"}]'),
(5, '[{\"rid\":7,\"time\":1490785861,\"by\":\"system\"}]'),
(6, '[{\"rid\":7,\"time\":1490785989,\"by\":\"system\"}]'),
(7, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"}]'),
(8, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"}]'),
(9, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"}]'),
(10, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"}]'),
(11, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"}]'),
(12, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"}]'),
(13, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"}]'),
(14, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"}]'),
(15, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"}]'),
(16, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"}]'),
(17, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"}]'),
(18, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"}]'),
(19, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"}]'),
(20, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"}]'),
(21, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"}]'),
(22, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"}]'),
(23, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"}]'),
(24, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"}]'),
(25, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"}]'),
(26, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"}]'),
(27, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"}]'),
(28, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"}]'),
(29, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"}]'),
(30, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"}]'),
(31, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"}]'),
(32, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"}]'),
(33, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"}]'),
(34, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"}]'),
(35, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"}]'),
(36, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"}]'),
(37, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"}]'),
(38, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"}]'),
(39, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"}]'),
(40, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"}]'),
(41, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"}]'),
(42, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"}]'),
(43, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"}]'),
(44, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"}]'),
(45, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"}]'),
(46, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"}]'),
(47, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"}]'),
(48, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"}]'),
(49, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"}]');
INSERT INTO `think_pointhistory` (`hid`, `history`) VALUES
(50, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"}]'),
(51, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"}]'),
(52, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"}]'),
(53, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"}]'),
(54, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"}]'),
(55, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"}]'),
(56, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"}]'),
(57, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"}]'),
(58, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"}]'),
(59, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"}]'),
(60, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"}]'),
(61, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"}]'),
(62, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"}]'),
(63, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"}]'),
(64, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"}]'),
(65, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"}]'),
(66, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"}]'),
(67, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"}]');
INSERT INTO `think_pointhistory` (`hid`, `history`) VALUES
(68, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"}]'),
(69, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"}]'),
(70, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"}]'),
(71, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"},{\"rid\":3,\"time\":1490828979,\"by\":\"system\"}]'),
(72, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"},{\"rid\":3,\"time\":1490828979,\"by\":\"system\"},{\"rid\":3,\"time\":1490855369,\"by\":\"system\"}]'),
(73, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"},{\"rid\":3,\"time\":1490828979,\"by\":\"system\"},{\"rid\":3,\"time\":1490855369,\"by\":\"system\"},{\"rid\":3,\"time\":1490855376,\"by\":\"system\"}]'),
(74, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"},{\"rid\":3,\"time\":1490828979,\"by\":\"system\"},{\"rid\":3,\"time\":1490855369,\"by\":\"system\"},{\"rid\":3,\"time\":1490855376,\"by\":\"system\"},{\"rid\":3,\"time\":1490855834,\"by\":\"system\"}]'),
(75, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"},{\"rid\":3,\"time\":1490828979,\"by\":\"system\"},{\"rid\":3,\"time\":1490855369,\"by\":\"system\"},{\"rid\":3,\"time\":1490855376,\"by\":\"system\"},{\"rid\":3,\"time\":1490855834,\"by\":\"system\"},{\"rid\":3,\"time\":1490856304,\"by\":\"system\"}]'),
(76, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"},{\"rid\":3,\"time\":1490828979,\"by\":\"system\"},{\"rid\":3,\"time\":1490855369,\"by\":\"system\"},{\"rid\":3,\"time\":1490855376,\"by\":\"system\"},{\"rid\":3,\"time\":1490855834,\"by\":\"system\"},{\"rid\":3,\"time\":1490856304,\"by\":\"system\"},{\"rid\":3,\"time\":1490856311,\"by\":\"system\"}]'),
(77, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"},{\"rid\":3,\"time\":1490828979,\"by\":\"system\"},{\"rid\":3,\"time\":1490855369,\"by\":\"system\"},{\"rid\":3,\"time\":1490855376,\"by\":\"system\"},{\"rid\":3,\"time\":1490855834,\"by\":\"system\"},{\"rid\":3,\"time\":1490856304,\"by\":\"system\"},{\"rid\":3,\"time\":1490856311,\"by\":\"system\"},{\"rid\":3,\"time\":1490856577,\"by\":\"system\"}]'),
(78, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"},{\"rid\":3,\"time\":1490828979,\"by\":\"system\"},{\"rid\":3,\"time\":1490855369,\"by\":\"system\"},{\"rid\":3,\"time\":1490855376,\"by\":\"system\"},{\"rid\":3,\"time\":1490855834,\"by\":\"system\"},{\"rid\":3,\"time\":1490856304,\"by\":\"system\"},{\"rid\":3,\"time\":1490856311,\"by\":\"system\"},{\"rid\":3,\"time\":1490856577,\"by\":\"system\"},{\"rid\":3,\"time\":1490856612,\"by\":\"system\"}]'),
(79, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"},{\"rid\":3,\"time\":1490828979,\"by\":\"system\"},{\"rid\":3,\"time\":1490855369,\"by\":\"system\"},{\"rid\":3,\"time\":1490855376,\"by\":\"system\"},{\"rid\":3,\"time\":1490855834,\"by\":\"system\"},{\"rid\":3,\"time\":1490856304,\"by\":\"system\"},{\"rid\":3,\"time\":1490856311,\"by\":\"system\"},{\"rid\":3,\"time\":1490856577,\"by\":\"system\"},{\"rid\":3,\"time\":1490856612,\"by\":\"system\"},{\"rid\":3,\"time\":1490856814,\"by\":\"system\"}]'),
(80, '[{\"rid\":7,\"time\":1490786052,\"by\":\"system\"},{\"rid\":7,\"time\":1490786098,\"by\":\"system\"},{\"rid\":7,\"time\":1490786122,\"by\":\"system\"},{\"rid\":7,\"time\":1490786434,\"by\":\"system\"},{\"rid\":1,\"time\":1490786455,\"by\":\"system\"},{\"rid\":1,\"time\":1490786465,\"by\":\"system\"},{\"rid\":7,\"time\":1490788255,\"by\":\"system\"},{\"rid\":1,\"time\":1490788275,\"by\":\"system\"},{\"rid\":1,\"time\":1490788283,\"by\":\"system\"},{\"rid\":1,\"time\":1490794735,\"by\":\"system\"},{\"rid\":1,\"time\":1490794738,\"by\":\"system\"},{\"rid\":1,\"time\":1490794742,\"by\":\"system\"},{\"rid\":6,\"time\":1490794756,\"by\":\"system\"},{\"rid\":5,\"time\":1490794787,\"by\":\"system\"},{\"rid\":7,\"time\":1490794854,\"by\":\"system\"},{\"rid\":3,\"time\":1490820386,\"by\":\"system\"},{\"rid\":3,\"time\":1490821155,\"by\":\"system\"},{\"rid\":3,\"time\":1490821820,\"by\":\"system\"},{\"rid\":3,\"time\":1490821924,\"by\":\"system\"},{\"rid\":3,\"time\":1490822055,\"by\":\"system\"},{\"rid\":3,\"time\":1490822090,\"by\":\"system\"},{\"rid\":3,\"time\":1490822188,\"by\":\"system\"},{\"rid\":3,\"time\":1490822215,\"by\":\"system\"},{\"rid\":3,\"time\":1490822262,\"by\":\"system\"},{\"rid\":3,\"time\":1490822807,\"by\":\"system\"},{\"rid\":3,\"time\":1490822817,\"by\":\"system\"},{\"rid\":3,\"time\":1490822938,\"by\":\"system\"},{\"rid\":3,\"time\":1490822950,\"by\":\"system\"},{\"rid\":3,\"time\":1490822953,\"by\":\"system\"},{\"rid\":7,\"time\":1490822981,\"by\":\"system\"},{\"rid\":3,\"time\":1490822997,\"by\":\"system\"},{\"rid\":3,\"time\":1490823094,\"by\":\"system\"},{\"rid\":3,\"time\":1490823103,\"by\":\"system\"},{\"rid\":3,\"time\":1490823165,\"by\":\"system\"},{\"rid\":3,\"time\":1490823174,\"by\":\"system\"},{\"rid\":3,\"time\":1490823228,\"by\":\"system\"},{\"rid\":3,\"time\":1490823257,\"by\":\"system\"},{\"rid\":3,\"time\":1490823448,\"by\":\"system\"},{\"rid\":3,\"time\":1490823451,\"by\":\"system\"},{\"rid\":3,\"time\":1490825244,\"by\":\"system\"},{\"rid\":3,\"time\":1490827034,\"by\":\"system\"},{\"rid\":3,\"time\":1490827125,\"by\":\"system\"},{\"rid\":3,\"time\":1490827184,\"by\":\"system\"},{\"rid\":3,\"time\":1490827287,\"by\":\"system\"},{\"rid\":3,\"time\":1490827290,\"by\":\"system\"},{\"rid\":3,\"time\":1490827294,\"by\":\"system\"},{\"rid\":3,\"time\":1490827312,\"by\":\"system\"},{\"rid\":3,\"time\":1490827314,\"by\":\"system\"},{\"rid\":3,\"time\":1490827407,\"by\":\"system\"},{\"rid\":3,\"time\":1490827465,\"by\":\"system\"},{\"rid\":3,\"time\":1490827498,\"by\":\"system\"},{\"rid\":3,\"time\":1490827816,\"by\":\"system\"},{\"rid\":3,\"time\":1490827821,\"by\":\"system\"},{\"rid\":3,\"time\":1490827825,\"by\":\"system\"},{\"rid\":3,\"time\":1490827828,\"by\":\"system\"},{\"rid\":3,\"time\":1490827848,\"by\":\"system\"},{\"rid\":3,\"time\":1490828205,\"by\":\"system\"},{\"rid\":3,\"time\":1490828281,\"by\":\"system\"},{\"rid\":3,\"time\":1490828384,\"by\":\"system\"},{\"rid\":3,\"time\":1490828398,\"by\":\"system\"},{\"rid\":3,\"time\":1490828535,\"by\":\"system\"},{\"rid\":5,\"time\":1490828559,\"by\":\"system\"},{\"rid\":3,\"time\":1490828580,\"by\":\"system\"},{\"rid\":3,\"time\":1490828584,\"by\":\"system\"},{\"rid\":3,\"time\":1490828979,\"by\":\"system\"},{\"rid\":3,\"time\":1490855369,\"by\":\"system\"},{\"rid\":3,\"time\":1490855376,\"by\":\"system\"},{\"rid\":3,\"time\":1490855834,\"by\":\"system\"},{\"rid\":3,\"time\":1490856304,\"by\":\"system\"},{\"rid\":3,\"time\":1490856311,\"by\":\"system\"},{\"rid\":3,\"time\":1490856577,\"by\":\"system\"},{\"rid\":3,\"time\":1490856612,\"by\":\"system\"},{\"rid\":3,\"time\":1490856814,\"by\":\"system\"},{\"rid\":3,\"time\":1490856828,\"by\":\"system\"}]'),
(81, '{\"rid\":\"0\",\"time\":1490878919,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490881206,\"by\":\"system\"}}'),
(82, '{\"rid\":\"0\",\"time\":1490878919,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490881206,\"by\":\"system\"},\"1\":{\"rid\":5,\"time\":1490881207,\"by\":\"system\"}}'),
(83, '{\"rid\":\"0\",\"time\":1490878919,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490881206,\"by\":\"system\"},\"1\":{\"rid\":5,\"time\":1490881207,\"by\":\"system\"},\"2\":{\"rid\":5,\"time\":1490881584,\"by\":\"system\"}}'),
(84, '{\"rid\":\"0\",\"time\":1490878919,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490881206,\"by\":\"system\"},\"1\":{\"rid\":5,\"time\":1490881207,\"by\":\"system\"},\"2\":{\"rid\":5,\"time\":1490881584,\"by\":\"system\"},\"3\":{\"rid\":5,\"time\":1490881586,\"by\":\"system\"}}'),
(85, '{\"rid\":\"0\",\"time\":1490878919,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490881206,\"by\":\"system\"},\"1\":{\"rid\":5,\"time\":1490881207,\"by\":\"system\"},\"2\":{\"rid\":5,\"time\":1490881584,\"by\":\"system\"},\"3\":{\"rid\":5,\"time\":1490881586,\"by\":\"system\"},\"4\":{\"rid\":5,\"time\":1490881587,\"by\":\"system\"}}'),
(86, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"}}'),
(87, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"}}'),
(88, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"}}'),
(89, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"}}'),
(90, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"}}'),
(91, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"}}'),
(92, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"}}'),
(93, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"}}'),
(94, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"}}'),
(95, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"}}');
INSERT INTO `think_pointhistory` (`hid`, `history`) VALUES
(96, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"}}'),
(97, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"}}'),
(98, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"}}'),
(99, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"}}'),
(100, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"}}'),
(101, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"}}'),
(102, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"}}'),
(103, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"}}'),
(104, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"},\"18\":{\"rid\":3,\"time\":1490955950,\"by\":\"system\"}}'),
(105, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"},\"18\":{\"rid\":3,\"time\":1490955950,\"by\":\"system\"},\"19\":{\"rid\":3,\"time\":1490956057,\"by\":\"system\"}}'),
(106, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"},\"18\":{\"rid\":3,\"time\":1490955950,\"by\":\"system\"},\"19\":{\"rid\":3,\"time\":1490956057,\"by\":\"system\"},\"20\":{\"rid\":3,\"time\":1490956427,\"by\":\"system\"}}'),
(107, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"},\"18\":{\"rid\":3,\"time\":1490955950,\"by\":\"system\"},\"19\":{\"rid\":3,\"time\":1490956057,\"by\":\"system\"},\"20\":{\"rid\":3,\"time\":1490956427,\"by\":\"system\"},\"21\":{\"rid\":3,\"time\":1490957072,\"by\":\"system\"}}'),
(108, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"},\"18\":{\"rid\":3,\"time\":1490955950,\"by\":\"system\"},\"19\":{\"rid\":3,\"time\":1490956057,\"by\":\"system\"},\"20\":{\"rid\":3,\"time\":1490956427,\"by\":\"system\"},\"21\":{\"rid\":3,\"time\":1490957072,\"by\":\"system\"},\"22\":{\"rid\":3,\"time\":1490957915,\"by\":\"system\"}}'),
(109, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"},\"18\":{\"rid\":3,\"time\":1490955950,\"by\":\"system\"},\"19\":{\"rid\":3,\"time\":1490956057,\"by\":\"system\"},\"20\":{\"rid\":3,\"time\":1490956427,\"by\":\"system\"},\"21\":{\"rid\":3,\"time\":1490957072,\"by\":\"system\"},\"22\":{\"rid\":3,\"time\":1490957915,\"by\":\"system\"},\"23\":{\"rid\":7,\"time\":1491059391,\"by\":\"system\"}}'),
(110, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"},\"18\":{\"rid\":3,\"time\":1490955950,\"by\":\"system\"},\"19\":{\"rid\":3,\"time\":1490956057,\"by\":\"system\"},\"20\":{\"rid\":3,\"time\":1490956427,\"by\":\"system\"},\"21\":{\"rid\":3,\"time\":1490957072,\"by\":\"system\"},\"22\":{\"rid\":3,\"time\":1490957915,\"by\":\"system\"},\"23\":{\"rid\":7,\"time\":1491059391,\"by\":\"system\"},\"24\":{\"rid\":3,\"time\":1491059819,\"by\":\"system\"}}'),
(111, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"},\"18\":{\"rid\":3,\"time\":1490955950,\"by\":\"system\"},\"19\":{\"rid\":3,\"time\":1490956057,\"by\":\"system\"},\"20\":{\"rid\":3,\"time\":1490956427,\"by\":\"system\"},\"21\":{\"rid\":3,\"time\":1490957072,\"by\":\"system\"},\"22\":{\"rid\":3,\"time\":1490957915,\"by\":\"system\"},\"23\":{\"rid\":7,\"time\":1491059391,\"by\":\"system\"},\"24\":{\"rid\":3,\"time\":1491059819,\"by\":\"system\"},\"25\":{\"rid\":7,\"time\":1491062485,\"by\":\"system\"}}'),
(112, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"},\"18\":{\"rid\":3,\"time\":1490955950,\"by\":\"system\"},\"19\":{\"rid\":3,\"time\":1490956057,\"by\":\"system\"},\"20\":{\"rid\":3,\"time\":1490956427,\"by\":\"system\"},\"21\":{\"rid\":3,\"time\":1490957072,\"by\":\"system\"},\"22\":{\"rid\":3,\"time\":1490957915,\"by\":\"system\"},\"23\":{\"rid\":7,\"time\":1491059391,\"by\":\"system\"},\"24\":{\"rid\":3,\"time\":1491059819,\"by\":\"system\"},\"25\":{\"rid\":7,\"time\":1491062485,\"by\":\"system\"},\"26\":{\"rid\":5,\"time\":1491063710,\"by\":\"system\"}}');

-- --------------------------------------------------------

--
-- 表的结构 `think_pointmax`
--

CREATE TABLE `think_pointmax` (
  `uid` int(11) NOT NULL COMMENT '用户IP',
  `day` int(11) NOT NULL COMMENT '每日更新',
  `point` int(11) NOT NULL COMMENT '每日积分'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_pointmax`
--

INSERT INTO `think_pointmax` (`uid`, `day`, `point`) VALUES
(0, 20170330, 0),
(1, 20170330, 0),
(2, 20170330, 0),
(3, 20170330, 0),
(4, 20170402, 11),
(113, 20170330, 0);

-- --------------------------------------------------------

--
-- 表的结构 `think_pointrule`
--

CREATE TABLE `think_pointrule` (
  `rid` int(11) NOT NULL,
  `point` int(11) NOT NULL COMMENT '分数',
  `type` int(11) NOT NULL COMMENT '加减【1/+:0/-】',
  `con` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL COMMENT '【说明】'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_pointrule`
--

INSERT INTO `think_pointrule` (`rid`, `point`, `type`, `con`) VALUES
(1, 1, 1, '弹幕+1'),
(2, 1, 0, '弹幕-1'),
(3, 1, 1, '评论+1'),
(4, 1, 0, '评论-1'),
(5, 10, 1, '审核文章'),
(6, 10, 0, '修改或删除文章'),
(7, 1, 1, '签到'),
(8, 1, 1, '积分操作+1'),
(9, 1, 0, '积分操作-1');

-- --------------------------------------------------------

--
-- 表的结构 `think_post`
--

CREATE TABLE `think_post` (
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `post` longtext CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `time` int(11) NOT NULL,
  `edit_time` int(11) NOT NULL,
  `is_video` int(11) NOT NULL,
  `video_url` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `is_show` int(11) NOT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `ip` varchar(64) NOT NULL,
  `view` int(11) NOT NULL,
  `del` int(11) NOT NULL,
  `save` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_post`
--

INSERT INTO `think_post` (`pid`, `uid`, `title`, `post`, `time`, `edit_time`, `is_video`, `video_url`, `is_show`, `image`, `ip`, `view`, `del`, `save`) VALUES
(1, 4, '', '<p>为爱空间日哦起我就挨人家富婆去啊额为柔肤实</p><p><br/></p><p>打实打算</p><p>dsfgdfg</p><p><img src=\"/Uploads/image/20170322/1490172485101253.png\" title=\"1490172485101253.png\" alt=\"d31602c6a830b8bbec84c3c4eaf014ec.png\"/></p>', 1490171102, 1490200780, 0, '0', 0, '', '', 35, 1, 0),
(2, 4, '你你', '<p style=\"white-space: normal;\">dsfsdfsdfs撒旦撒打算的dfsd</p><p style=\"white-space: normal;\">hfgvyuvfyuv864864848546514531531531531531515<img src=\"http://127.0.0.1/Uploads/image/20170322/1490172333132043.jpg\" title=\"1490172333132043.jpg\" alt=\"qrcode_for_gh_69ecc7490dbe_258.jpg\"/></p><p style=\"white-space: normal;\">dsfsdfsdfs撒旦撒打算的dfsd</p><p style=\"white-space: normal;\">hfgvyuvfyuv864864848546514531531531531531515<img src=\"http://127.0.0.1/Uploads/image/20170322/1490172333132043.jpg\" title=\"1490172333132043.jpg\" alt=\"qrcode_for_gh_69ecc7490dbe_258.jpg\"/></p><p><br/></p>', 1490171300, 1490172461, 0, '0', 0, '', '127.0.0.1', 7, 1, 0),
(3, 4, 'asdada', '<p>sdasdasdasd</p>', 1490260607, 0, 0, '0', 1, '', '127.0.0.1', 0, 1, 0),
(4, 4, 'sssssssssssssss ', '<p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p>$info[&#39;post&#39;]=$_POST[&#39;post&#39;];</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>$info[&#39;title&#39;]=I(&#39;title&#39;);</p><p><br/></p>', 1490263111, 0, 0, '0', 0, '', '127.0.0.1', 0, 1, 0),
(5, 4, '8418484', '<p>814847847847/847/847</p>', 1490268117, 0, 0, '/874/74/8475', 1, '0', '127.0.0.1', 4, 1, 0),
(6, 4, '59596529652', '<p>1485148514851485148514854185</p>', 1490268184, 0, 1, 'https://moeclub-my.sharepoint.com/personal/acfun_moeclub_onmicrosoft_com/_layouts/15/download.aspx?UniqueId=fadb2bd4-2e98-43c2-96a5-5dcb19326439&Translate=false&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvbW9lY2x1Yi1teS5zaGFyZXBvaW50LmNvbUBmN2YxYmM0OS0xZjVkLTRlNTgtOGRhNS0zMDNiZTk2NDcwMjgiLCJpc3MiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAiLCJuYmYiOjE0OTAyOTA1MDQsImV4cCI6MTQ5MDI5NDEwNCwiZW5kcG9pbnR1cmwiOiJFcHBwZVdDaGFFWjFyemFnRWJXMEpvMHFoOENwZ1JRc1daUEV3OU9lUUFBPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTYwIiwiaXNsb29wYmFjayI6IlRydWUiLCJuYW1laWQiOiIwIy5mfG1lbWJlcnNoaXB8YWNmdW5AbW9lY2x1Yi5vbm1pY3Jvc29mdC5jb20iLCJuaWkiOiJtaWNyb3NvZnQuc2hhcmVwb2ludCIsImlzdXNlciI6InRydWUiLCJjYWNoZWtleSI6IjBoLmZ8bWVtYmVyc2hpcHwxMDAzN2ZmZTlmOWM4ZGRmQGxpdmUuY29tIiwidXNlUGVyc2lzdGVudENvb2tpZSI6bnVsbH0.gc5tGUVa6pYDDDBPmfVUBbR7MImwXw2kBEWBv0QlRuE&prooftoken=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6ImpOX1RsZ1otUUk0UHZpc2pTVnpKMW9ySnRnOCJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDBAKiIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMEAqIiwibmJmIjoiMTQ5MDIzNTI0MCIsImV4cCI6IjE0OTA4NDAwNDAiLCJwcmYiOiJheGJXT0pjMEFWU2pvc3ZNUXJ5YWliRXgvNklKYnU4MXR5endwUEtRakE0SHJqaDFxakQyanBzK1dYM3JVR24zR2M5c1pUdUJCMnNvOUw5M0lwcFB3bkU3VVM0eVRGNTNMOWhZS3ZycjBZYTZ2Wng3OXhZd2JXYXh6WS9tQzBsTGRJNlJ0S09vbUhlMEcyNVVTUHUwZ2NBdlFKeUtBQkN1NWJjZnBFRFVGM3NpWm5rWnUwMXRhV3RFZ3R3NGxKdVBvMDMyYUZvOEp6RUtQeGxMYmk1L1IzN3RReWtHcFlzcEY3RHhSLy9GUUtIaFhHQ3ozZWtRcm5yR1JLZGxSa1FLK3VzaTRHazArL1VPbkd4U1dQR0krU2lMMHFGSWE1aGVISXVsREp0eUViTVhwMWY5ZXA2U2hZTEJjZHFKWDJaQjY1a1lUNFB6NWpKa3RTUFUzbGZZT3c9PSIsImlzdXNlciI6InRydWUifQ.Pq7pZjX6ixg1lh2MI1ck1vrqFhNaCYoDY-i80DO6yttC50KeKqfctF4FhWlXbUWTXUnSvIj82hilqjy3hj6J3Xjmoh7KdBIZ0bnmRqJVxA46pXhucECe_PQ2dSsBb4Oifhvz2Zla58clDsF3LB2soSJyREc2qVxcVADBToEHHExYWatH_JZIwQN_WjrS3bbnbd223gD6iJNiM6t36h5F_VaFaxx0zTqbLO91hkXLsC2ncapEjQHxoAjHyNxkzy6zvDdPXH1x4iIxvMheYCjz7hZt9XeWGJmSnjvEv-4u7VtV09w8_uuoq3kkGvkB7IMrXtAaFDRRZCwN-o4jtF9riA', 1, '52524894185', '127.0.0.1', 20, 1, 0),
(7, 4, '银魂', '<p>银魂！！！！</p>', 1490268253, 1490794756, 1, 'http://ks.nyanya.tv/1.mp4', 1, 'http://inory.net/images/2017/03/19/timthumb9.jpg', '127.0.0.1', 338, 0, 0),
(8, 4, '测试文章', '<p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">萨德事件发酵下，限韩程度的不断加强，给日本动漫IP的引入创造了新的机会。但是敏感的历史遗留问题和长期的右翼文化浸染也给中国买家带来了更大的政治风险，社交网络下无限放大的个人行为和一呼百应的抵制热潮使得出品方不得不加倍小心，对于他们而言，已经不存在过度反应这个概念了。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">作者 | 张一童</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">限韩之下，中国企业“买买买”的名单上日本动漫IP越来越多。对于中国买家们而言，这是个前景不错的生意，日本动漫储量惊人且在中国粉丝众多。但是，也暗藏风险。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">3月8日，距离《刀剑乱舞》国服登陆IOS平台仅仅半个月，其日服公布的线下活动因包含靖国神社这个对于中国而言颇为敏感的地点而受到国内玩家的抵制，相关微博转发已经过千，大部分玩家表示如果问题得不到妥善解决，将会选择卸载游戏。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\"><img alt=\"\" src=\"/Uploads/image/20170325/1490411942247561.jpg\" style=\"border: 0px; margin: 0px auto; padding: 0px; vertical-align: baseline; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; display: block; max-width: 100%; background: 0px 50%;\"/></p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">《刀剑乱舞》是由日本游戏开发及运营商DMM与游戏制作公司Nitro+合作开发的女性向网页游戏，页游与手游的中国大陆地区独家发行权已被授予游族网络。尽管游族网络迅速做出回应，但这个事件仍然很可能在社交媒体上发展为一次自发性的爱国运动。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">这可以说是笼罩在日本文化产品出口亚洲市场的传统阴影。在复杂的区域关系背景下，玩家的政治神经在日本相关的问题上格外敏感，而日本右翼势力对于本国ACG行业确实有着长期的渗透历史，都让“政治”风险成为引入日本IP这桩生意的隐形导火索。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\"><img alt=\"\" src=\"/Uploads/image/20170325/1490411942265721.png\" style=\"border: 0px; margin: 0px auto; padding: 0px; vertical-align: baseline; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; display: block; max-width: 100%; background: 0px 50%;\"/></p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">右翼传统与敏感的政治神经</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">过去，日本影视产品在中国市场的宣发都格外谨慎，IP的引进也严守“政治正确”的底线。但是，随着IP越来越多，擦枪走火的事件开始出现。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">《刀剑乱舞》事件在中国社交网络被玩家主动传播之后，代理方游族迅速联系了日本出品方N+公司，并于3月10号凌晨上传了N+社长的书面回复，对本次活动的争议之处表达歉意，并表示将会迅速处理。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\"><img alt=\"\" src=\"/Uploads/image/20170325/1490411942365813.jpg\" style=\"border: 0px; margin: 0px auto; padding: 0px; vertical-align: baseline; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; display: block; max-width: 100%; background: 0px 50%;\"/></p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">10日凌晨游族上传的N+社长书面信息</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 20px; padding: 0px; vertical-align: baseline; font-stretch: inherit; line-height: 1.8; font-family: STHeiti, &#39;Microsoft YaHei&#39;, simsun, sans-serif, Arial; color: rgb(14, 14, 14); white-space: normal; background: 0px 50% rgb(255, 255, 255);\">事实上，中国用户并不是仅针对日本产品。在微博等社交网络上，也不时看到针对欧美明星反华言论的抵制号召。而国内娱乐的话语体系里也一直不乏政治身影。例如，香港导演彭浩翔因为其在占中期间的言论</p><p><br/></p>', 1490358462, 1490411944, 0, '0', 1, 'http://inory.net/images/2017/03/19/timthumb15.jpg', '127.0.0.1', 27, 0, 0),
(9, 4, '2222222222222', '<p>wwwwwwwwwwwwwwwwwaawaaaaaaw</p>', 1490358690, 1490359071, 1, 'ssssssssssssss', 1, 'wwwwwwwww', '127.0.0.1', 0, 1, 0),
(10, 4, 'wredwqarfwer', '<p>hhhhhhhhhhhhhhhhhhhhhh</p>', 1490360396, 0, 0, '0', 0, 'werwer', '127.0.0.1', 0, 1, 0),
(11, 4, 'fdgvsdfgs', '<p>sdfgsdssdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgs</p><p><br/></p><p>sdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsddsdfgsdsdfgsdsdfgsdsdfgsdsdfgsdsdfgsddfgsdsdfgsdsdfgsd</p>', 1490361345, 0, 0, '0', 1, '0', '127.0.0.1', 0, 1, 0),
(12, 4, 'ZX', '<p>adasdasda</p>', 1490361445, 0, 0, '0', 0, '0', '127.0.0.1', 0, 1, 0),
(13, 4, 'ddd', '<p>erfwef</p><p>dsfsd</p><p>sdfsdf</p><p>sdfsdfs</p><p>sdfsdfsd</p><p>fsdfsdfsdf</p><p>sdf</p><p>sdf</p><p>s</p><p>fs</p><p>dfsdfsd</p><p>f</p><p>sdfsdf</p><p>s</p><p>f</p><p>s</p><p>fs</p><p>f</p><p>sfsdfs</p><p style=\"white-space: normal;\">erfwef</p><p style=\"white-space: normal;\">dsfsd</p><p style=\"white-space: normal;\">sdfsdf</p><p style=\"white-space: normal;\">sdfsdfs</p><p style=\"white-space: normal;\">sdfsdfsd</p><p style=\"white-space: normal;\">fsdfsdfsdf</p><p style=\"white-space: normal;\">sdf</p><p style=\"white-space: normal;\">sdf</p><p style=\"white-space: normal;\">s</p><p style=\"white-space: normal;\">fs</p><p style=\"white-space: normal;\">dfsdfsd</p><p style=\"white-space: normal;\">f</p><p style=\"white-space: normal;\">sdfsdf</p><p style=\"white-space: normal;\">s</p><p style=\"white-space: normal;\">f</p><p style=\"white-space: normal;\">s</p><p style=\"white-space: normal;\">fs</p><p style=\"white-space: normal;\">f</p><p style=\"white-space: normal;\">sfsdfs</p><p style=\"white-space: normal;\">erfwef</p><p style=\"white-space: normal;\">dsfsd</p><p style=\"white-space: normal;\">sdfsdf</p><p style=\"white-space: normal;\">sdfsdfs</p><p style=\"white-space: normal;\">sdfsdfsd</p><p style=\"white-space: normal;\">fsdfsdfsdf</p><p style=\"white-space: normal;\">sdf</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">fsdfsdfsdf</p><p style=\"white-space: normal;\">sdf</p><p style=\"white-space: normal;\">sdf</p><p style=\"white-space: normal;\">s</p><p style=\"white-space: normal;\">fs</p><p style=\"white-space: normal;\">dfsdfsd</p><p style=\"white-space: normal;\">f</p><p style=\"white-space: normal;\">sdfsdf</p><p style=\"white-space: normal;\">s</p><p style=\"white-space: normal;\">f</p><p style=\"white-space: normal;\">s</p><p style=\"white-space: normal;\">fs</p><p style=\"white-space: normal;\">f</p><p style=\"white-space: normal;\">sfsdfs</p><p><br/></p>', 1490361546, 1490361968, 0, '0', 0, '0', '127.0.0.1', 0, 1, 0),
(14, 4, 'aaaaaaaaaaaaaaaa', '<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>', 1490363591, 0, 0, '0', 0, '0', '127.0.0.1', 0, 1, 0),
(15, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(16, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(17, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(18, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(19, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(20, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(21, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(22, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(23, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(24, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(25, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(26, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(27, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(28, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(29, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(30, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 1, '', '', 0, 1, 0),
(31, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(32, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(33, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(34, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(35, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(36, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(37, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(38, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(39, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(40, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(41, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(42, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(43, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(44, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(45, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(46, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(47, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(48, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(49, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(50, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(51, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(52, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(53, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(54, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(55, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(56, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(57, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(58, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(59, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(60, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(61, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(62, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(63, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(64, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(65, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(66, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(67, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(68, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(69, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(70, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(71, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(72, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(73, 0, '', 'aaaaaaaaaaaaaaa', 0, 0, 0, '', 0, '', '', 0, 1, 0),
(74, 4, 'wwww', '<p>wwwwwwwwwwwwwwwwwww</p>', 1490363971, 0, 0, '0', 0, '0', '127.0.0.1', 0, 1, 0),
(75, 4, 'wwwww', '<p>wwwwwwwwwwwwwwwwwww</p>', 1490363975, 1490365939, 0, '0', 0, '0', '127.0.0.1', 0, 1, 0),
(76, 4, 'wxxxxxxxxxx', '<p>xxxxxxxxxxxxxxxxxxxxx</p>', 1490363980, 0, 0, '0', 1, '0', '127.0.0.1', 0, 1, 0),
(77, 4, 'dddddddd', '<p>ddddddddddddddddddddddd</p>', 1490363984, 0, 0, '0', 0, '0', '127.0.0.1', 0, 1, 0),
(78, 4, '威威威威威威威威威威', '<p>ccccccccccccccc</p>', 1490409816, 0, 0, 'ccc', 0, '0', '127.0.0.1', 0, 1, 0),
(79, 4, 'sssssssss', '<p>sssssssssssssssssss</p>', 1490409843, 0, 1, 'sssssssssssssssss', 1, 'sssssssssssss', '127.0.0.1', 1, 1, 0),
(80, 4, 'aaaaaaaaaaa', '<p>aaaaaaaaaaaaaaaaaaaaa</p>', 1490409943, 0, 1, 'aaaaaaaaaaaa', 0, 'aaaaaaaaaaaaaaaaaaa', '127.0.0.1', 0, 1, 0),
(81, 4, 'vvvvvvvvvvvvvvvvvvvvv', '<p>cccccccccccccccccccccccccvvvvvvvvvvvvvvvvvv</p>', 1490410064, 1490410226, 1, 'ccccccccccccccccccvvvvvvvvvvvvvvvvvvvvvv', 0, '0vvvvvvvvvvvvvvvvvvvvv', '127.0.0.1', 0, 1, 0),
(82, 4, '水水水水水水水水水水水水水水水水水水水', '<p>&nbsp; 水水水水水水水水水水水水水水水水水水水</p>', 1490828559, 0, 0, '0', 1, '0', '127.0.0.1', 9, 0, 0),
(83, 4, 'aaaaaaaaaaaaaaaaxxaaaa', '<p>xxxxxxxxxxxxxx</p>', 1490899253, 0, 0, '0', 1, '0', '127.0.0.1', 102, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `think_qian`
--

CREATE TABLE `think_qian` (
  `qd` int(11) NOT NULL,
  `time` int(11) NOT NULL COMMENT '签到时间戳',
  `day` int(11) NOT NULL COMMENT '签到日起',
  `uid` int(11) NOT NULL,
  `lian` int(11) NOT NULL COMMENT '连续签到日'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_qian`
--

INSERT INTO `think_qian` (`qd`, `time`, `day`, `uid`, `lian`) VALUES
(1, 1490774646, 20170326, 4, 34),
(2, 1490774938, 20170328, 4, 33),
(3, 1490785459, 20170321, 4, 35),
(4, 1490785529, 20170322, 4, 35),
(5, 1490785702, 20170311, 4, 35),
(6, 1490785861, 20170129, 4, 35),
(7, 1490785989, 20170229, 4, 35),
(8, 1490786052, 20160129, 4, 35),
(9, 1490786098, 20170325, 4, 35),
(10, 1490786122, 20140129, 4, 1),
(11, 1490788207, 20130329, 4, 1),
(12, 1490794854, 20170329, 4, 34),
(13, 1490822981, 20170330, 4, 35),
(14, 1490954420, 20170331, 4, 36),
(15, 1491059391, 20170401, 4, 37),
(16, 1491062485, 20170402, 4, 38);

-- --------------------------------------------------------

--
-- 表的结构 `think_save`
--

CREATE TABLE `think_save` (
  `sid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL COMMENT '收藏',
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `think_uc`
--

CREATE TABLE `think_uc` (
  `uc` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `think_userpoint`
--

CREATE TABLE `think_userpoint` (
  `uid` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `history` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `think_userpoint`
--

INSERT INTO `think_userpoint` (`uid`, `point`, `time`, `history`) VALUES
(0, 0, 1490873131, ''),
(1, 0, 1490869941, ''),
(2, 0, 1490872780, ''),
(3, 0, 1490871099, ''),
(4, 144, 1491063710, '{\"rid\":\"0\",\"time\":1490882201,\"by\":\"\\u7ba1\\u7406\\u5458\\u76f4\\u63a5\\u64cd\\u4f5c\",\"0\":{\"rid\":5,\"time\":1490899253,\"by\":\"system\"},\"1\":{\"rid\":3,\"time\":1490901361,\"by\":\"system\"},\"2\":{\"rid\":3,\"time\":1490901608,\"by\":\"system\"},\"3\":{\"rid\":3,\"time\":1490901625,\"by\":\"system\"},\"4\":{\"rid\":3,\"time\":1490901637,\"by\":\"system\"},\"5\":{\"rid\":3,\"time\":1490901644,\"by\":\"system\"},\"6\":{\"rid\":3,\"time\":1490901655,\"by\":\"system\"},\"7\":{\"rid\":3,\"time\":1490901667,\"by\":\"system\"},\"8\":{\"rid\":3,\"time\":1490901678,\"by\":\"system\"},\"9\":{\"rid\":7,\"time\":1490954420,\"by\":\"system\"},\"10\":{\"rid\":3,\"time\":1490955774,\"by\":\"system\"},\"11\":{\"rid\":3,\"time\":1490955782,\"by\":\"system\"},\"12\":{\"rid\":3,\"time\":1490955783,\"by\":\"system\"},\"13\":{\"rid\":3,\"time\":1490955784,\"by\":\"system\"},\"14\":{\"rid\":3,\"time\":1490955785,\"by\":\"system\"},\"15\":{\"rid\":3,\"time\":1490955786,\"by\":\"system\"},\"16\":{\"rid\":3,\"time\":1490955787,\"by\":\"system\"},\"17\":{\"rid\":3,\"time\":1490955902,\"by\":\"system\"},\"18\":{\"rid\":3,\"time\":1490955950,\"by\":\"system\"},\"19\":{\"rid\":3,\"time\":1490956057,\"by\":\"system\"},\"20\":{\"rid\":3,\"time\":1490956427,\"by\":\"system\"},\"21\":{\"rid\":3,\"time\":1490957072,\"by\":\"system\"},\"22\":{\"rid\":3,\"time\":1490957915,\"by\":\"system\"},\"23\":{\"rid\":7,\"time\":1491059391,\"by\":\"system\"},\"24\":{\"rid\":3,\"time\":1491059819,\"by\":\"system\"},\"25\":{\"rid\":7,\"time\":1491062485,\"by\":\"system\"},\"26\":{\"rid\":5,\"time\":1491063710,\"by\":\"system\"}}'),
(113, 0, 1490872762, '');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_ad`
--

CREATE TABLE `uchome_ad` (
  `adid` smallint(6) UNSIGNED NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL DEFAULT '',
  `pagetype` varchar(20) NOT NULL DEFAULT '',
  `adcode` text NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_adminsession`
--

CREATE TABLE `uchome_adminsession` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `errorcount` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_album`
--

CREATE TABLE `uchome_album` (
  `albumid` mediumint(8) UNSIGNED NOT NULL,
  `albumname` varchar(50) NOT NULL DEFAULT '',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `picnum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `pic` varchar(60) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(10) NOT NULL DEFAULT '',
  `target_ids` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_appcreditlog`
--

CREATE TABLE `uchome_appcreditlog` (
  `logid` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `appid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `credit` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_blacklist`
--

CREATE TABLE `uchome_blacklist` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `buid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_block`
--

CREATE TABLE `uchome_block` (
  `bid` smallint(6) UNSIGNED NOT NULL,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `blocksql` text NOT NULL,
  `cachename` varchar(30) NOT NULL DEFAULT '',
  `cachetime` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `startnum` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `num` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `perpage` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `htmlcode` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_blog`
--

CREATE TABLE `uchome_blog` (
  `blogid` mediumint(8) UNSIGNED NOT NULL,
  `topicid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `classid` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `replynum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `hot` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pic` char(120) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `noreply` tinyint(1) NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `password` char(10) NOT NULL DEFAULT '',
  `click_1` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_2` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_3` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_4` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_5` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_blog`
--

INSERT INTO `uchome_blog` (`blogid`, `topicid`, `uid`, `username`, `subject`, `classid`, `viewnum`, `replynum`, `hot`, `dateline`, `pic`, `picflag`, `noreply`, `friend`, `password`, `click_1`, `click_2`, `click_3`, `click_4`, `click_5`) VALUES
(1, 0, 2, 'admin', 'fdddddddddddd', 0, 0, 0, 0, 1490005309, '', 0, 0, 0, '', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_blogfield`
--

CREATE TABLE `uchome_blogfield` (
  `blogid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `tag` varchar(255) NOT NULL DEFAULT '',
  `message` mediumtext NOT NULL,
  `postip` varchar(20) NOT NULL DEFAULT '',
  `related` text NOT NULL,
  `relatedtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `target_ids` text NOT NULL,
  `hotuser` text NOT NULL,
  `magiccolor` tinyint(6) NOT NULL DEFAULT '0',
  `magicpaper` tinyint(6) NOT NULL DEFAULT '0',
  `magiccall` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_blogfield`
--

INSERT INTO `uchome_blogfield` (`blogid`, `uid`, `tag`, `message`, `postip`, `related`, `relatedtime`, `target_ids`, `hotuser`, `magiccolor`, `magicpaper`, `magiccall`) VALUES
(1, 2, '', 'ddddddddddddddddddddddddddddddddd', '127.0.0.1', '', 0, '', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_cache`
--

CREATE TABLE `uchome_cache` (
  `cachekey` varchar(16) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `mtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_class`
--

CREATE TABLE `uchome_class` (
  `classid` mediumint(8) UNSIGNED NOT NULL,
  `classname` char(40) NOT NULL DEFAULT '',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_click`
--

CREATE TABLE `uchome_click` (
  `clickid` smallint(6) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `displayorder` tinyint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_click`
--

INSERT INTO `uchome_click` (`clickid`, `name`, `icon`, `idtype`, `displayorder`) VALUES
(1, '路过', 'luguo.gif', 'blogid', 0),
(2, '雷人', 'leiren.gif', 'blogid', 0),
(3, '握手', 'woshou.gif', 'blogid', 0),
(4, '鲜花', 'xianhua.gif', 'blogid', 0),
(5, '鸡蛋', 'jidan.gif', 'blogid', 0),
(6, '漂亮', 'piaoliang.gif', 'picid', 0),
(7, '酷毙', 'kubi.gif', 'picid', 0),
(8, '雷人', 'leiren.gif', 'picid', 0),
(9, '鲜花', 'xianhua.gif', 'picid', 0),
(10, '鸡蛋', 'jidan.gif', 'picid', 0),
(11, '搞笑', 'gaoxiao.gif', 'tid', 0),
(12, '迷惑', 'mihuo.gif', 'tid', 0),
(13, '雷人', 'leiren.gif', 'tid', 0),
(14, '鲜花', 'xianhua.gif', 'tid', 0),
(15, '鸡蛋', 'jidan.gif', 'tid', 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_clickuser`
--

CREATE TABLE `uchome_clickuser` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `clickid` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_comment`
--

CREATE TABLE `uchome_comment` (
  `cid` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `idtype` varchar(20) NOT NULL DEFAULT '',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `magicflicker` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_config`
--

CREATE TABLE `uchome_config` (
  `var` varchar(30) NOT NULL DEFAULT '',
  `datavalue` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_config`
--

INSERT INTO `uchome_config` (`var`, `datavalue`) VALUES
('sitename', '我的空间'),
('template', 'default'),
('adminemail', 'webmaster@127.0.0.1'),
('onlinehold', '1800'),
('timeoffset', '8'),
('maxpage', '100'),
('starcredit', '100'),
('starlevelnum', '5'),
('cachemode', 'database'),
('cachegrade', '0'),
('allowcache', '1'),
('allowdomain', '0'),
('allowrewrite', '0'),
('allowwatermark', '0'),
('allowftp', '0'),
('holddomain', 'www|*blog*|*space*|x'),
('mtagminnum', '5'),
('feedday', '7'),
('feedmaxnum', '100'),
('feedfilternum', '10'),
('importnum', '100'),
('maxreward', '10'),
('singlesent', '50'),
('groupnum', '8'),
('closeregister', '0'),
('closeinvite', '0'),
('close', '0'),
('networkpublic', '1'),
('networkpage', '1'),
('seccode_register', '1'),
('uc_tagrelated', '1'),
('manualmoderator', '1'),
('linkguide', '1'),
('showall', '1'),
('sendmailday', '0'),
('realname', '0'),
('namecheck', '0'),
('namechange', '0'),
('name_allowviewspace', '1'),
('name_allowfriend', '1'),
('name_allowpoke', '1'),
('name_allowdoing', '1'),
('name_allowblog', '0'),
('name_allowalbum', '0'),
('name_allowthread', '0'),
('name_allowshare', '0'),
('name_allowcomment', '0'),
('name_allowpost', '0'),
('showallfriendnum', '10'),
('feedtargetblank', '1'),
('feedread', '1'),
('feedhotnum', '3'),
('feedhotday', '2'),
('feedhotmin', '3'),
('feedhiddenicon', 'friend,profile,task,wall'),
('uc_tagrelatedtime', '86400'),
('privacy', 'a:2:{s:4:\"view\";a:12:{s:5:\"index\";i:0;s:7:\"profile\";i:0;s:6:\"friend\";i:0;s:4:\"wall\";i:0;s:4:\"feed\";i:0;s:4:\"mtag\";i:0;s:5:\"event\";i:0;s:5:\"doing\";i:0;s:4:\"blog\";i:0;s:5:\"album\";i:0;s:5:\"share\";i:0;s:4:\"poll\";i:0;}s:4:\"feed\";a:21:{s:5:\"doing\";i:1;s:4:\"blog\";i:1;s:6:\"upload\";i:1;s:5:\"share\";i:1;s:4:\"poll\";i:1;s:8:\"joinpoll\";i:1;s:6:\"thread\";i:1;s:4:\"post\";i:1;s:4:\"mtag\";i:1;s:5:\"event\";i:1;s:4:\"join\";i:1;s:6:\"friend\";i:1;s:7:\"comment\";i:1;s:4:\"show\";i:1;s:9:\"spaceopen\";i:1;s:6:\"credit\";i:1;s:6:\"invite\";i:1;s:4:\"task\";i:1;s:7:\"profile\";i:1;s:5:\"album\";i:1;s:5:\"click\";i:1;}}'),
('cronnextrun', '1490005500'),
('my_status', '0'),
('uniqueemail', '1'),
('updatestat', '1'),
('my_showgift', '1'),
('topcachetime', '60'),
('newspacenum', '3'),
('sitekey', '210e3eSQLlSqd1t1');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_creditlog`
--

CREATE TABLE `uchome_creditlog` (
  `clid` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `rid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `cyclenum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `credit` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `experience` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `starttime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `user` text NOT NULL,
  `app` text NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_creditlog`
--

INSERT INTO `uchome_creditlog` (`clid`, `uid`, `rid`, `total`, `cyclenum`, `credit`, `experience`, `starttime`, `info`, `user`, `app`, `dateline`) VALUES
(1, 2, 1, 1, 1, 10, 0, 0, '', '', '', 1490005239),
(2, 2, 10, 1, 1, 15, 15, 0, '', '', '', 1490005239),
(3, 2, 8, 3, 3, 3, 3, 0, '', '', '', 1490005295),
(4, 2, 16, 1, 1, 5, 5, 0, '', '', '', 1490005309);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_creditrule`
--

CREATE TABLE `uchome_creditrule` (
  `rid` mediumint(8) UNSIGNED NOT NULL,
  `rulename` char(20) NOT NULL DEFAULT '',
  `action` char(20) NOT NULL DEFAULT '',
  `cycletype` tinyint(1) NOT NULL DEFAULT '0',
  `cycletime` int(10) NOT NULL DEFAULT '0',
  `rewardnum` tinyint(2) NOT NULL DEFAULT '1',
  `rewardtype` tinyint(1) NOT NULL DEFAULT '1',
  `norepeat` tinyint(1) NOT NULL DEFAULT '0',
  `credit` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `experience` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_creditrule`
--

INSERT INTO `uchome_creditrule` (`rid`, `rulename`, `action`, `cycletype`, `cycletime`, `rewardnum`, `rewardtype`, `norepeat`, `credit`, `experience`) VALUES
(1, '开通空间', 'register', 0, 0, 1, 1, 0, 10, 0),
(2, '实名认证', 'realname', 0, 0, 1, 1, 0, 20, 20),
(3, '邮箱认证', 'realemail', 0, 0, 1, 1, 0, 40, 40),
(4, '成功邀请好友', 'invitefriend', 4, 0, 20, 1, 0, 10, 10),
(5, '设置头像', 'setavatar', 0, 0, 1, 1, 0, 15, 15),
(6, '视频认证', 'videophoto', 0, 0, 1, 1, 0, 40, 40),
(7, '成功举报', 'report', 4, 0, 0, 1, 0, 2, 2),
(8, '更新心情', 'updatemood', 1, 0, 3, 1, 0, 3, 3),
(9, '热点信息', 'hotinfo', 4, 0, 0, 1, 0, 10, 10),
(10, '每天登陆', 'daylogin', 1, 0, 1, 1, 0, 15, 15),
(11, '访问别人空间', 'visit', 1, 0, 10, 1, 2, 1, 1),
(12, '打招呼', 'poke', 1, 0, 10, 1, 2, 1, 1),
(13, '留言', 'guestbook', 1, 0, 20, 1, 2, 2, 2),
(14, '被留言', 'getguestbook', 1, 0, 5, 1, 2, 1, 0),
(15, '发表记录', 'doing', 1, 0, 5, 1, 0, 1, 1),
(16, '发表日志', 'publishblog', 1, 0, 3, 1, 0, 5, 5),
(17, '上传图片', 'uploadimage', 1, 0, 10, 1, 0, 2, 2),
(18, '拍大头贴', 'camera', 1, 0, 5, 1, 0, 3, 3),
(19, '发表话题', 'publishthread', 1, 0, 5, 1, 0, 5, 5),
(20, '回复话题', 'replythread', 1, 0, 10, 1, 1, 1, 1),
(21, '创建投票', 'createpoll', 1, 0, 5, 1, 0, 2, 2),
(22, '参与投票', 'joinpoll', 1, 0, 10, 1, 1, 1, 1),
(23, '发起活动', 'createevent', 1, 0, 1, 1, 0, 3, 3),
(24, '参与活动', 'joinevent', 1, 0, 1, 1, 1, 1, 1),
(25, '推荐活动', 'recommendevent', 4, 0, 0, 1, 0, 10, 10),
(26, '发起分享', 'createshare', 1, 0, 3, 1, 0, 2, 2),
(27, '评论', 'comment', 1, 0, 40, 1, 1, 1, 1),
(28, '被评论', 'getcomment', 1, 0, 20, 1, 1, 1, 0),
(29, '安装应用', 'installapp', 4, 0, 0, 1, 3, 5, 5),
(30, '使用应用', 'useapp', 1, 0, 10, 1, 3, 1, 1),
(31, '信息表态', 'click', 1, 0, 10, 1, 1, 1, 1),
(32, '修改实名', 'editrealname', 0, 0, 1, 0, 0, 5, 0),
(33, '更改邮箱认证', 'editrealemail', 0, 0, 1, 0, 0, 5, 0),
(34, '头像被删除', 'delavatar', 0, 0, 1, 0, 0, 10, 10),
(35, '获取邀请码', 'invitecode', 0, 0, 1, 0, 0, 0, 0),
(36, '搜索一次', 'search', 0, 0, 1, 0, 0, 1, 0),
(37, '日志导入', 'blogimport', 0, 0, 1, 0, 0, 10, 0),
(38, '修改域名', 'modifydomain', 0, 0, 1, 0, 0, 5, 0),
(39, '日志被删除', 'delblog', 0, 0, 1, 0, 0, 10, 10),
(40, '记录被删除', 'deldoing', 0, 0, 1, 0, 0, 2, 2),
(41, '图片被删除', 'delimage', 0, 0, 1, 0, 0, 4, 4),
(42, '投票被删除', 'delpoll', 0, 0, 1, 0, 0, 4, 4),
(43, '话题被删除', 'delthread', 0, 0, 1, 0, 0, 4, 4),
(44, '活动被删除', 'delevent', 0, 0, 1, 0, 0, 6, 6),
(45, '分享被删除', 'delshare', 0, 0, 1, 0, 0, 4, 4),
(46, '留言被删除', 'delguestbook', 0, 0, 1, 0, 0, 4, 4),
(47, '评论被删除', 'delcomment', 0, 0, 1, 0, 0, 2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_cron`
--

CREATE TABLE `uchome_cron` (
  `cronid` smallint(6) UNSIGNED NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('user','system') NOT NULL DEFAULT 'user',
  `name` char(50) NOT NULL DEFAULT '',
  `filename` char(50) NOT NULL DEFAULT '',
  `lastrun` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nextrun` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `weekday` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '0',
  `hour` tinyint(2) NOT NULL DEFAULT '0',
  `minute` char(36) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_cron`
--

INSERT INTO `uchome_cron` (`cronid`, `available`, `type`, `name`, `filename`, `lastrun`, `nextrun`, `weekday`, `day`, `hour`, `minute`) VALUES
(1, 1, 'system', '更新浏览数统计', 'log.php', 1490005284, 1490005500, -1, -1, -1, '0	5	10	15	20	25	30	35	40	45	50	55'),
(2, 1, 'system', '清理过期feed', 'cleanfeed.php', 1490005298, 1490036640, -1, -1, 3, '4'),
(3, 1, 'system', '清理个人通知', 'cleannotification.php', 1490005281, 1490043960, -1, -1, 5, '6'),
(4, 1, 'system', '同步UC的feed', 'getfeed.php', 1490005321, 1490005620, -1, -1, -1, '2	7	12	17	22	27	32	37	42	47	52'),
(5, 1, 'system', '清理脚印和最新访客', 'cleantrace.php', 1490005243, 1490032980, -1, -1, 2, '3');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_data`
--

CREATE TABLE `uchome_data` (
  `var` varchar(20) NOT NULL DEFAULT '',
  `datavalue` text NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_data`
--

INSERT INTO `uchome_data` (`var`, `datavalue`, `dateline`) VALUES
('mail', 'a:3:{s:8:\"mailsend\";s:1:\"1\";s:13:\"maildelimiter\";s:1:\"0\";s:12:\"mailusername\";s:1:\"1\";}', 1490005221),
('setting', 'a:4:{s:10:\"thumbwidth\";s:3:\"100\";s:11:\"thumbheight\";s:3:\"100\";s:12:\"watermarkpos\";s:1:\"4\";s:14:\"watermarktrans\";s:2:\"75\";}', 1490005221),
('network', 'a:5:{s:4:\"blog\";a:2:{s:4:\"hot1\";s:1:\"3\";s:5:\"cache\";s:3:\"600\";}s:3:\"pic\";a:2:{s:4:\"hot1\";s:1:\"3\";s:5:\"cache\";s:3:\"700\";}s:6:\"thread\";a:2:{s:4:\"hot1\";s:1:\"3\";s:5:\"cache\";s:3:\"800\";}s:5:\"event\";a:1:{s:5:\"cache\";s:3:\"900\";}s:4:\"poll\";a:1:{s:5:\"cache\";s:3:\"500\";}}', 1490005221),
('newspacelist', 'a:1:{i:0;a:6:{s:3:\"uid\";s:1:\"2\";s:8:\"username\";s:5:\"admin\";s:4:\"name\";s:0:\"\";s:10:\"namestatus\";s:1:\"0\";s:11:\"videostatus\";s:1:\"0\";s:8:\"dateline\";s:10:\"1490005239\";}}', 1490005239);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_docomment`
--

CREATE TABLE `uchome_docomment` (
  `id` int(10) UNSIGNED NOT NULL,
  `upid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `doid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `grade` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_doing`
--

CREATE TABLE `uchome_doing` (
  `doid` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `from` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `replynum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mood` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_doing`
--

INSERT INTO `uchome_doing` (`doid`, `uid`, `username`, `from`, `dateline`, `message`, `ip`, `replynum`, `mood`) VALUES
(1, 2, 'admin', '', 1490005287, 'rrrrrrrrrrrrrrrrrrrrr', '127.0.0.1', 0, 0),
(2, 2, 'admin', '', 1490005291, 'fffffffffffffffffff', '127.0.0.1', 0, 0),
(3, 2, 'admin', '', 1490005295, 'vvvvvvvvvvvvvvvvvvvvvvvv', '127.0.0.1', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_event`
--

CREATE TABLE `uchome_event` (
  `eventid` mediumint(8) UNSIGNED NOT NULL,
  `topicid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `classid` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `location` varchar(80) NOT NULL DEFAULT '',
  `poster` varchar(60) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `deadline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `starttime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `endtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `public` tinyint(3) NOT NULL DEFAULT '0',
  `membernum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `follownum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `grade` tinyint(3) NOT NULL DEFAULT '0',
  `recommendtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `picnum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `threadnum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hot` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_eventclass`
--

CREATE TABLE `uchome_eventclass` (
  `classid` smallint(6) UNSIGNED NOT NULL,
  `classname` varchar(80) NOT NULL DEFAULT '',
  `poster` tinyint(1) NOT NULL DEFAULT '0',
  `template` text NOT NULL,
  `displayorder` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_eventclass`
--

INSERT INTO `uchome_eventclass` (`classid`, `classname`, `poster`, `template`, `displayorder`) VALUES
(1, '生活/聚会', 0, '费用说明：\r\n集合地点：\r\n着装要求：\r\n联系方式：\r\n注意事项：', 1),
(2, '出行/旅游', 0, '路线说明:\r\n费用说明:\r\n装备要求:\r\n交通工具:\r\n集合地点:\r\n联系方式:\r\n注意事项:', 2),
(3, '比赛/运动', 0, '费用说明：\r\n集合地点：\r\n着装要求：\r\n场地介绍：\r\n联系方式：\r\n注意事项：', 4),
(4, '电影/演出', 0, '剧情介绍：\r\n费用说明：\r\n集合地点：\r\n联系方式：\r\n注意事项：', 3),
(5, '教育/讲座', 0, '主办单位：\r\n活动主题：\r\n费用说明：\r\n集合地点：\r\n联系方式：\r\n注意事项：', 5),
(6, '其它', 0, '', 6);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_eventfield`
--

CREATE TABLE `uchome_eventfield` (
  `eventid` mediumint(8) UNSIGNED NOT NULL,
  `detail` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '',
  `limitnum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `verify` tinyint(1) NOT NULL DEFAULT '0',
  `allowpic` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowinvite` tinyint(1) NOT NULL DEFAULT '0',
  `allowfellow` tinyint(1) NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_eventinvite`
--

CREATE TABLE `uchome_eventinvite` (
  `eventid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `touid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `tousername` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_eventpic`
--

CREATE TABLE `uchome_eventpic` (
  `picid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `eventid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_feed`
--

CREATE TABLE `uchome_feed` (
  `feedid` int(10) UNSIGNED NOT NULL,
  `appid` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` text NOT NULL,
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `hot` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_feed`
--

INSERT INTO `uchome_feed` (`feedid`, `appid`, `icon`, `uid`, `username`, `dateline`, `friend`, `hash_template`, `hash_data`, `title_template`, `title_data`, `body_template`, `body_data`, `body_general`, `image_1`, `image_1_link`, `image_2`, `image_2_link`, `image_3`, `image_3_link`, `image_4`, `image_4_link`, `target_ids`, `id`, `idtype`, `hot`) VALUES
(1, 2, 'profile', 2, 'admin', 1490005239, 0, '3a7101a64ea7927f0b3f5179b7a457b3', 'ec7d775d9211880bca2ba1d401e3bcb9', '{actor} 开通了自己的个人主页', 'a:0:{}', '', 'a:0:{}', '', '', '', '', '', '', '', '', '', '', 0, '', 0),
(2, 2, 'doing', 2, 'admin', 1490005287, 0, '7405fddb51d86fcb3dce6bfa66d591b3', '02e5727a78ed83f29437e0618b50f22a', '{actor}：{message}', 'a:1:{s:7:\"message\";s:21:\"rrrrrrrrrrrrrrrrrrrrr\";}', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'doid', 0),
(3, 2, 'doing', 2, 'admin', 1490005291, 0, '7405fddb51d86fcb3dce6bfa66d591b3', '5c19e933d42705df7e3d449f13e3a63d', '{actor}：{message}', 'a:1:{s:7:\"message\";s:19:\"fffffffffffffffffff\";}', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'doid', 0),
(4, 2, 'doing', 2, 'admin', 1490005295, 0, '7405fddb51d86fcb3dce6bfa66d591b3', 'dd13a4858786ec20f6fab3b8c848e349', '{actor}：{message}', 'a:1:{s:7:\"message\";s:24:\"vvvvvvvvvvvvvvvvvvvvvvvv\";}', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'doid', 0),
(5, 2, 'blog', 2, 'admin', 1490005309, 0, '2c24ba00fafd81b79f331389e04a26cb', 'e199e97cbf22bb7afac169499e40dfa6', '{actor} 发表了新日志', 'N;', '<b>{subject}</b><br>{summary}', 'a:2:{s:7:\"subject\";s:56:\"<a href=\"space.php?uid=2&do=blog&id=1\">fdddddddddddd</a>\";s:7:\"summary\";s:33:\"ddddddddddddddddddddddddddddddddd\";}', '', '', '', '', '', '', '', '', '', '', 1, 'blogid', 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_friend`
--

CREATE TABLE `uchome_friend` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `fuid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `fusername` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `gid` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `note` varchar(50) NOT NULL DEFAULT '',
  `num` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_friendguide`
--

CREATE TABLE `uchome_friendguide` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `fuid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `fusername` char(15) NOT NULL DEFAULT '',
  `num` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_friendlog`
--

CREATE TABLE `uchome_friendlog` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `fuid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_invite`
--

CREATE TABLE `uchome_invite` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `code` varchar(20) NOT NULL DEFAULT '',
  `fuid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `fusername` varchar(15) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `appid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_log`
--

CREATE TABLE `uchome_log` (
  `logid` mediumint(8) UNSIGNED NOT NULL,
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `idtype` char(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_magic`
--

CREATE TABLE `uchome_magic` (
  `mid` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `forbiddengid` text NOT NULL,
  `charge` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `experience` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `provideperoid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `providecount` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `useperoid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `usecount` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `displayorder` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `custom` text NOT NULL,
  `close` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_magic`
--

INSERT INTO `uchome_magic` (`mid`, `name`, `description`, `forbiddengid`, `charge`, `experience`, `provideperoid`, `providecount`, `useperoid`, `usecount`, `displayorder`, `custom`, `close`) VALUES
('invisible', '隐身草', '让自己隐身登录，不显示在线，24小时内有效', '', 50, 5, 86400, 10, 86400, 1, 0, '', 0),
('friendnum', '好友增容卡', '在允许添加的最多好友数限制外，增加10个好友名额', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('attachsize', '附件增容卡', '使用一次，可以给自己增加 10M 的附件空间', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('thunder', '雷鸣之声', '发布一条全站信息，让大家知道自己上线了', '', 500, 5, 86400, 5, 86400, 1, 0, '', 0),
('updateline', '救生圈', '把指定对象的发布时间更新为当前时间', '', 200, 5, 86400, 999, 0, 1, 0, '', 0),
('downdateline', '时空机', '把指定对象的发布时间修改为过去的时间', '', 250, 5, 86400, 999, 0, 1, 0, '', 0),
('color', '彩色灯', '把指定对象的标题变成彩色的', '', 50, 5, 86400, 999, 0, 1, 0, '', 0),
('hot', '热点灯', '把指定对象的热度增加站点推荐的热点值', '', 50, 5, 86400, 999, 0, 1, 0, '', 0),
('visit', '互访卡', '随机选择10个好友，向其打招呼、留言或访问空间', '', 20, 2, 86400, 999, 0, 1, 0, '', 0),
('icon', '彩虹蛋', '给指定对象的标题前面增加图标（最多8个图标）', '', 20, 2, 86400, 999, 0, 1, 0, '', 0),
('flicker', '彩虹炫', '让评论、留言的文字闪烁起来', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('gift', '红包卡', '在自己的空间埋下积分红包送给来访者', '', 20, 2, 86400, 999, 0, 1, 0, '', 0),
('superstar', '超级明星', '在个人主页，给自己的头像增加超级明星标识', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('viewmagiclog', '八卦镜', '查看指定用户最近使用的道具记录', '', 100, 5, 86400, 999, 0, 1, 0, '', 0),
('viewmagic', '透视镜', '查看指定用户当前持有的道具', '', 100, 5, 86400, 999, 0, 1, 0, '', 0),
('viewvisitor', '偷窥镜', '查看指定用户最近访问过的10个空间', '', 100, 5, 86400, 999, 0, 1, 0, '', 0),
('call', '点名卡', '发通知给自己的好友，让他们来查看指定的对象', '', 50, 5, 86400, 999, 0, 1, 0, '', 0),
('coupon', '代金券', '购买道具时折换一定量的积分', '', 0, 0, 0, 0, 0, 1, 0, '', 0),
('frame', '相框', '给自己的照片添上相框', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('bgimage', '信纸', '给指定的对象添加信纸背景', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('doodle', '涂鸦板', '允许在留言、评论等操作时使用涂鸦板', '', 30, 3, 86400, 999, 0, 1, 0, '', 0),
('anonymous', '匿名卡', '在指定的地方，让自己的名字显示为匿名', '', 50, 5, 86400, 999, 0, 1, 0, '', 0),
('reveal', '照妖镜', '可以查看一次匿名用户的真实身份', '', 100, 5, 86400, 999, 0, 1, 0, '', 0),
('license', '道具转让许可证', '使用许可证，将道具赠送给指定好友', '', 10, 1, 3600, 999, 0, 1, 0, '', 0),
('detector', '探测器', '探测埋了红包的空间', '', 10, 1, 86400, 999, 0, 1, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_magicinlog`
--

CREATE TABLE `uchome_magicinlog` (
  `logid` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `mid` varchar(15) NOT NULL DEFAULT '',
  `count` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `fromid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `credit` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_magicstore`
--

CREATE TABLE `uchome_magicstore` (
  `mid` varchar(15) NOT NULL DEFAULT '',
  `storage` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `lastprovide` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sellcount` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `sellcredit` int(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_magicuselog`
--

CREATE TABLE `uchome_magicuselog` (
  `logid` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `mid` varchar(15) NOT NULL DEFAULT '',
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `idtype` varchar(20) NOT NULL DEFAULT '',
  `count` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expire` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_mailcron`
--

CREATE TABLE `uchome_mailcron` (
  `cid` mediumint(8) UNSIGNED NOT NULL,
  `touid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `sendtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_mailqueue`
--

CREATE TABLE `uchome_mailqueue` (
  `qid` mediumint(8) UNSIGNED NOT NULL,
  `cid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_member`
--

CREATE TABLE `uchome_member` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_member`
--

INSERT INTO `uchome_member` (`uid`, `username`, `password`) VALUES
(2, 'admin', 'd27a54a7b206ef1af13b41ea9317272d');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_mtag`
--

CREATE TABLE `uchome_mtag` (
  `tagid` mediumint(8) UNSIGNED NOT NULL,
  `tagname` varchar(40) NOT NULL DEFAULT '',
  `fieldid` smallint(6) NOT NULL DEFAULT '0',
  `membernum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `threadnum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `postnum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `close` tinyint(1) NOT NULL DEFAULT '0',
  `announcement` text NOT NULL,
  `pic` varchar(150) NOT NULL DEFAULT '',
  `closeapply` tinyint(1) NOT NULL DEFAULT '0',
  `joinperm` tinyint(1) NOT NULL DEFAULT '0',
  `viewperm` tinyint(1) NOT NULL DEFAULT '0',
  `threadperm` tinyint(1) NOT NULL DEFAULT '0',
  `postperm` tinyint(1) NOT NULL DEFAULT '0',
  `recommend` tinyint(1) NOT NULL DEFAULT '0',
  `moderator` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_mtaginvite`
--

CREATE TABLE `uchome_mtaginvite` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `tagid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `fromusername` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_myapp`
--

CREATE TABLE `uchome_myapp` (
  `appid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `narrow` tinyint(1) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `version` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `displaymethod` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_myinvite`
--

CREATE TABLE `uchome_myinvite` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `typename` varchar(100) NOT NULL DEFAULT '',
  `appid` mediumint(8) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `touid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `myml` text NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hash` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_notification`
--

CREATE TABLE `uchome_notification` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_pic`
--

CREATE TABLE `uchome_pic` (
  `picid` mediumint(8) NOT NULL,
  `albumid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `topicid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `postip` varchar(20) NOT NULL DEFAULT '',
  `filename` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `filepath` varchar(60) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `hot` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `click_6` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_7` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_8` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_9` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_10` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `magicframe` tinyint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_picfield`
--

CREATE TABLE `uchome_picfield` (
  `picid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_poke`
--

CREATE TABLE `uchome_poke` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `fromusername` varchar(15) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `iconid` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_poll`
--

CREATE TABLE `uchome_poll` (
  `pid` mediumint(8) UNSIGNED NOT NULL,
  `topicid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `voternum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `replynum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  `maxchoice` tinyint(3) NOT NULL DEFAULT '0',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `noreply` tinyint(1) NOT NULL DEFAULT '0',
  `credit` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `percredit` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `expiration` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastvote` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hot` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_pollfield`
--

CREATE TABLE `uchome_pollfield` (
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `summary` text NOT NULL,
  `option` text NOT NULL,
  `invite` text NOT NULL,
  `hotuser` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_polloption`
--

CREATE TABLE `uchome_polloption` (
  `oid` mediumint(8) UNSIGNED NOT NULL,
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `votenum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `option` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_polluser`
--

CREATE TABLE `uchome_polluser` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `pid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `option` text NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_post`
--

CREATE TABLE `uchome_post` (
  `pid` int(10) UNSIGNED NOT NULL,
  `tagid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `tid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `pic` varchar(255) NOT NULL DEFAULT '',
  `isthread` tinyint(1) NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_profield`
--

CREATE TABLE `uchome_profield` (
  `fieldid` smallint(6) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `formtype` varchar(20) NOT NULL DEFAULT '0',
  `inputnum` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `choice` text NOT NULL,
  `mtagminnum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `manualmoderator` tinyint(1) NOT NULL DEFAULT '0',
  `manualmember` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_profield`
--

INSERT INTO `uchome_profield` (`fieldid`, `title`, `note`, `formtype`, `inputnum`, `choice`, `mtagminnum`, `manualmoderator`, `manualmember`, `displayorder`) VALUES
(1, '自由联盟', '', 'text', 100, '', 0, 0, 1, 0),
(2, '地区联盟', '', 'text', 100, '', 0, 0, 1, 0),
(3, '兴趣联盟', '', 'text', 100, '', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_profilefield`
--

CREATE TABLE `uchome_profilefield` (
  `fieldid` smallint(6) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `formtype` varchar(20) NOT NULL DEFAULT '0',
  `maxsize` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `allowsearch` tinyint(1) NOT NULL DEFAULT '0',
  `choice` text NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_report`
--

CREATE TABLE `uchome_report` (
  `rid` mediumint(8) UNSIGNED NOT NULL,
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `num` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  `uids` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_session`
--

CREATE TABLE `uchome_session` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `lastactivity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `magichidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_share`
--

CREATE TABLE `uchome_share` (
  `sid` mediumint(8) UNSIGNED NOT NULL,
  `topicid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title_template` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_link` varchar(255) NOT NULL DEFAULT '',
  `hot` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_show`
--

CREATE TABLE `uchome_show` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `credit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `note` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_space`
--

CREATE TABLE `uchome_space` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `groupid` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `credit` int(10) NOT NULL DEFAULT '0',
  `experience` int(10) NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `namestatus` tinyint(1) NOT NULL DEFAULT '0',
  `videostatus` tinyint(1) NOT NULL DEFAULT '0',
  `domain` char(15) NOT NULL DEFAULT '',
  `friendnum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `viewnum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `notenum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `addfriendnum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `mtaginvitenum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `eventinvitenum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `myinvitenum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `pokenum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `doingnum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `blognum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `albumnum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `threadnum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `pollnum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `eventnum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `sharenum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastsearch` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastpost` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastlogin` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastsend` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachsize` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `addsize` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `addfriend` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `newpm` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `ip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mood` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_space`
--

INSERT INTO `uchome_space` (`uid`, `groupid`, `credit`, `experience`, `username`, `name`, `namestatus`, `videostatus`, `domain`, `friendnum`, `viewnum`, `notenum`, `addfriendnum`, `mtaginvitenum`, `eventinvitenum`, `myinvitenum`, `pokenum`, `doingnum`, `blognum`, `albumnum`, `threadnum`, `pollnum`, `eventnum`, `sharenum`, `dateline`, `updatetime`, `lastsearch`, `lastpost`, `lastlogin`, `lastsend`, `attachsize`, `addsize`, `addfriend`, `flag`, `newpm`, `avatar`, `regip`, `ip`, `mood`) VALUES
(2, 1, 39, 29, 'admin', '', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 1490005239, 1490005309, 0, 1490005309, 1490005239, 0, 0, 0, 0, 1, 0, 0, '127.0.0.1', 127000000, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_spacefield`
--

CREATE TABLE `uchome_spacefield` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `newemail` varchar(100) NOT NULL DEFAULT '',
  `emailcheck` tinyint(1) NOT NULL DEFAULT '0',
  `mobile` varchar(40) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `msn` varchar(80) NOT NULL DEFAULT '',
  `msnrobot` varchar(15) NOT NULL DEFAULT '',
  `msncstatus` tinyint(1) NOT NULL DEFAULT '0',
  `videopic` varchar(32) NOT NULL DEFAULT '',
  `birthyear` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `birthmonth` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `birthday` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `blood` varchar(5) NOT NULL DEFAULT '',
  `marry` tinyint(1) NOT NULL DEFAULT '0',
  `birthprovince` varchar(20) NOT NULL DEFAULT '',
  `birthcity` varchar(20) NOT NULL DEFAULT '',
  `resideprovince` varchar(20) NOT NULL DEFAULT '',
  `residecity` varchar(20) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `spacenote` text NOT NULL,
  `authstr` varchar(20) NOT NULL DEFAULT '',
  `theme` varchar(20) NOT NULL DEFAULT '',
  `nocss` tinyint(1) NOT NULL DEFAULT '0',
  `menunum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `css` text NOT NULL,
  `privacy` text NOT NULL,
  `friend` mediumtext NOT NULL,
  `feedfriend` mediumtext NOT NULL,
  `sendmail` text NOT NULL,
  `magicstar` tinyint(1) NOT NULL DEFAULT '0',
  `magicexpire` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `timeoffset` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_spacefield`
--

INSERT INTO `uchome_spacefield` (`uid`, `sex`, `email`, `newemail`, `emailcheck`, `mobile`, `qq`, `msn`, `msnrobot`, `msncstatus`, `videopic`, `birthyear`, `birthmonth`, `birthday`, `blood`, `marry`, `birthprovince`, `birthcity`, `resideprovince`, `residecity`, `note`, `spacenote`, `authstr`, `theme`, `nocss`, `menunum`, `css`, `privacy`, `friend`, `feedfriend`, `sendmail`, `magicstar`, `magicexpire`, `timeoffset`) VALUES
(2, 0, '', '', 0, '', '', '', '', 0, '', 0, 0, 0, '', 0, '', '', '', '', 'vvvvvvvvvvvvvvvvvvvvvvvv', 'vvvvvvvvvvvvvvvvvvvvvvvv', '', '', 0, 0, '', '', '', '', '', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_spaceinfo`
--

CREATE TABLE `uchome_spaceinfo` (
  `infoid` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `subtype` varchar(20) NOT NULL DEFAULT '',
  `title` text NOT NULL,
  `subtitle` varchar(255) NOT NULL DEFAULT '',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `startyear` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `endyear` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `startmonth` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `endmonth` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_spacelog`
--

CREATE TABLE `uchome_spacelog` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `opuid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `opusername` char(15) NOT NULL DEFAULT '',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `expiration` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_stat`
--

CREATE TABLE `uchome_stat` (
  `daytime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `login` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `register` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `invite` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `appinvite` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `doing` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `blog` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `pic` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `poll` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `event` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `share` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `thread` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `docomment` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `blogcomment` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `piccomment` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `pollcomment` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `pollvote` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `eventcomment` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `eventjoin` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `sharecomment` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `post` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `wall` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `poke` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_stat`
--

INSERT INTO `uchome_stat` (`daytime`, `login`, `register`, `invite`, `appinvite`, `doing`, `blog`, `pic`, `poll`, `event`, `share`, `thread`, `docomment`, `blogcomment`, `piccomment`, `pollcomment`, `pollvote`, `eventcomment`, `eventjoin`, `sharecomment`, `post`, `wall`, `poke`, `click`) VALUES
(20170320, 1, 1, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_statuser`
--

CREATE TABLE `uchome_statuser` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `daytime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` char(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_statuser`
--

INSERT INTO `uchome_statuser` (`uid`, `daytime`, `type`) VALUES
(2, 0, 'login');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_tag`
--

CREATE TABLE `uchome_tag` (
  `tagid` mediumint(8) UNSIGNED NOT NULL,
  `tagname` char(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `blognum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `close` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_tagblog`
--

CREATE TABLE `uchome_tagblog` (
  `tagid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `blogid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_tagspace`
--

CREATE TABLE `uchome_tagspace` (
  `tagid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `grade` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_task`
--

CREATE TABLE `uchome_task` (
  `taskid` smallint(6) UNSIGNED NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `num` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `maxnum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(150) NOT NULL DEFAULT '',
  `filename` varchar(50) NOT NULL DEFAULT '',
  `starttime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `endtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nexttime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nexttype` varchar(20) NOT NULL DEFAULT '',
  `credit` smallint(6) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_task`
--

INSERT INTO `uchome_task` (`taskid`, `available`, `name`, `note`, `num`, `maxnum`, `image`, `filename`, `starttime`, `endtime`, `nexttime`, `nexttype`, `credit`, `displayorder`) VALUES
(1, 1, '更新一下自己的头像', '头像就是你在这里的个人形象。<br>设置自己的头像后，会让更多的朋友记住您。', 0, 0, 'image/task/avatar.gif', 'avatar.php', 0, 0, 0, '', 20, 1),
(2, 1, '将个人资料补充完整', '把自己的个人资料填写完整吧。<br>这样您会被更多的朋友找到的，系统也会帮您找到朋友。', 0, 0, 'image/task/profile.gif', 'profile.php', 0, 0, 0, '2', 20, 0),
(3, 1, '发表自己的第一篇日志', '现在，就写下自己的第一篇日志吧。<br>与大家一起分享自己的生活感悟。', 0, 0, 'image/task/blog.gif', 'blog.php', 0, 0, 0, '', 5, 3),
(4, 1, '寻找并添加五位好友', '有了好友，您发的日志、图片等会被好友及时看到并传播出去；<br>您也会在首页方便及时的看到好友的最新动态。', 0, 0, 'image/task/friend.gif', 'friend.php', 0, 0, 0, '', 50, 4),
(5, 1, '验证激活自己的邮箱', '填写自己真实的邮箱地址并验证通过。<br>您可以在忘记密码的时候使用该邮箱取回自己的密码；<br>还可以及时接受站内的好友通知等等。', 0, 0, 'image/task/email.gif', 'email.php', 0, 0, 0, '', 10, 5),
(6, 1, '邀请10个新朋友加入', '邀请一下自己的QQ好友或者邮箱联系人，让亲朋好友一起来加入我们吧。', 0, 0, 'image/task/friend.gif', 'invite.php', 0, 0, 0, '', 100, 6),
(7, 1, '领取每日访问大礼包', '每天登录访问自己的主页，就可领取大礼包。', 0, 0, 'image/task/gift.gif', 'gift.php', 0, 0, 0, 'day', 5, 99);

-- --------------------------------------------------------

--
-- 表的结构 `uchome_thread`
--

CREATE TABLE `uchome_thread` (
  `tid` mediumint(8) UNSIGNED NOT NULL,
  `topicid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `tagid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `eventid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `subject` char(80) NOT NULL DEFAULT '',
  `magiccolor` tinyint(6) UNSIGNED NOT NULL DEFAULT '0',
  `magicegg` tinyint(6) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `replynum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `lastpost` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastauthor` char(15) NOT NULL DEFAULT '',
  `lastauthorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `displayorder` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `digest` tinyint(1) NOT NULL DEFAULT '0',
  `hot` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `click_11` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_12` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_13` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_14` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `click_15` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_topic`
--

CREATE TABLE `uchome_topic` (
  `topicid` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(80) NOT NULL DEFAULT '',
  `message` mediumtext NOT NULL,
  `jointype` varchar(255) NOT NULL DEFAULT '',
  `joingid` varchar(255) NOT NULL DEFAULT '',
  `pic` varchar(100) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `joinnum` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `lastpost` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `endtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_topicuser`
--

CREATE TABLE `uchome_topicuser` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `topicid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_userapp`
--

CREATE TABLE `uchome_userapp` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `appid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `privacy` tinyint(1) NOT NULL DEFAULT '0',
  `allowsidenav` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeed` tinyint(1) NOT NULL DEFAULT '0',
  `allowprofilelink` tinyint(1) NOT NULL DEFAULT '0',
  `narrow` tinyint(1) NOT NULL DEFAULT '0',
  `menuorder` smallint(6) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_userappfield`
--

CREATE TABLE `uchome_userappfield` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `appid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `profilelink` text NOT NULL,
  `myml` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_userevent`
--

CREATE TABLE `uchome_userevent` (
  `eventid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `fellow` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `template` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_usergroup`
--

CREATE TABLE `uchome_usergroup` (
  `gid` smallint(6) UNSIGNED NOT NULL,
  `grouptitle` varchar(20) NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `banvisit` tinyint(1) NOT NULL DEFAULT '0',
  `explower` int(10) NOT NULL DEFAULT '0',
  `maxfriendnum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `maxattachsize` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowcomment` tinyint(1) NOT NULL DEFAULT '0',
  `searchinterval` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `searchignore` tinyint(1) NOT NULL DEFAULT '0',
  `postinterval` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `spamignore` tinyint(1) NOT NULL DEFAULT '0',
  `videophotoignore` tinyint(1) NOT NULL DEFAULT '0',
  `allowblog` tinyint(1) NOT NULL DEFAULT '0',
  `allowdoing` tinyint(1) NOT NULL DEFAULT '0',
  `allowupload` tinyint(1) NOT NULL DEFAULT '0',
  `allowshare` tinyint(1) NOT NULL DEFAULT '0',
  `allowmtag` tinyint(1) NOT NULL DEFAULT '0',
  `allowthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowcss` tinyint(1) NOT NULL DEFAULT '0',
  `allowpoke` tinyint(1) NOT NULL DEFAULT '0',
  `allowfriend` tinyint(1) NOT NULL DEFAULT '0',
  `allowpoll` tinyint(1) NOT NULL DEFAULT '0',
  `allowclick` tinyint(1) NOT NULL DEFAULT '0',
  `allowevent` tinyint(1) NOT NULL DEFAULT '0',
  `allowmagic` tinyint(1) NOT NULL DEFAULT '0',
  `allowpm` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewvideopic` tinyint(1) NOT NULL DEFAULT '0',
  `allowmyop` tinyint(1) NOT NULL DEFAULT '0',
  `allowtopic` tinyint(1) NOT NULL DEFAULT '0',
  `allowstat` tinyint(1) NOT NULL DEFAULT '0',
  `magicdiscount` tinyint(1) NOT NULL DEFAULT '0',
  `verifyevent` tinyint(1) NOT NULL DEFAULT '0',
  `edittrail` tinyint(1) NOT NULL DEFAULT '0',
  `domainlength` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `closeignore` tinyint(1) NOT NULL DEFAULT '0',
  `seccode` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(10) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `manageconfig` tinyint(1) NOT NULL DEFAULT '0',
  `managenetwork` tinyint(1) NOT NULL DEFAULT '0',
  `manageprofilefield` tinyint(1) NOT NULL DEFAULT '0',
  `manageprofield` tinyint(1) NOT NULL DEFAULT '0',
  `manageusergroup` tinyint(1) NOT NULL DEFAULT '0',
  `managefeed` tinyint(1) NOT NULL DEFAULT '0',
  `manageshare` tinyint(1) NOT NULL DEFAULT '0',
  `managedoing` tinyint(1) NOT NULL DEFAULT '0',
  `manageblog` tinyint(1) NOT NULL DEFAULT '0',
  `managetag` tinyint(1) NOT NULL DEFAULT '0',
  `managetagtpl` tinyint(1) NOT NULL DEFAULT '0',
  `managealbum` tinyint(1) NOT NULL DEFAULT '0',
  `managecomment` tinyint(1) NOT NULL DEFAULT '0',
  `managemtag` tinyint(1) NOT NULL DEFAULT '0',
  `managethread` tinyint(1) NOT NULL DEFAULT '0',
  `manageevent` tinyint(1) NOT NULL DEFAULT '0',
  `manageeventclass` tinyint(1) NOT NULL DEFAULT '0',
  `managecensor` tinyint(1) NOT NULL DEFAULT '0',
  `managead` tinyint(1) NOT NULL DEFAULT '0',
  `managesitefeed` tinyint(1) NOT NULL DEFAULT '0',
  `managebackup` tinyint(1) NOT NULL DEFAULT '0',
  `manageblock` tinyint(1) NOT NULL DEFAULT '0',
  `managetemplate` tinyint(1) NOT NULL DEFAULT '0',
  `managestat` tinyint(1) NOT NULL DEFAULT '0',
  `managecache` tinyint(1) NOT NULL DEFAULT '0',
  `managecredit` tinyint(1) NOT NULL DEFAULT '0',
  `managecron` tinyint(1) NOT NULL DEFAULT '0',
  `managename` tinyint(1) NOT NULL DEFAULT '0',
  `manageapp` tinyint(1) NOT NULL DEFAULT '0',
  `managetask` tinyint(1) NOT NULL DEFAULT '0',
  `managereport` tinyint(1) NOT NULL DEFAULT '0',
  `managepoll` tinyint(1) NOT NULL DEFAULT '0',
  `manageclick` tinyint(1) NOT NULL DEFAULT '0',
  `managemagic` tinyint(1) NOT NULL DEFAULT '0',
  `managemagiclog` tinyint(1) NOT NULL DEFAULT '0',
  `managebatch` tinyint(1) NOT NULL DEFAULT '0',
  `managedelspace` tinyint(1) NOT NULL DEFAULT '0',
  `managetopic` tinyint(1) NOT NULL DEFAULT '0',
  `manageip` tinyint(1) NOT NULL DEFAULT '0',
  `managehotuser` tinyint(1) NOT NULL DEFAULT '0',
  `managedefaultuser` tinyint(1) NOT NULL DEFAULT '0',
  `managespacegroup` tinyint(1) NOT NULL DEFAULT '0',
  `managespaceinfo` tinyint(1) NOT NULL DEFAULT '0',
  `managespacecredit` tinyint(1) NOT NULL DEFAULT '0',
  `managespacenote` tinyint(1) NOT NULL DEFAULT '0',
  `managevideophoto` tinyint(1) NOT NULL DEFAULT '0',
  `managelog` tinyint(1) NOT NULL DEFAULT '0',
  `magicaward` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uchome_usergroup`
--

INSERT INTO `uchome_usergroup` (`gid`, `grouptitle`, `system`, `banvisit`, `explower`, `maxfriendnum`, `maxattachsize`, `allowhtml`, `allowcomment`, `searchinterval`, `searchignore`, `postinterval`, `spamignore`, `videophotoignore`, `allowblog`, `allowdoing`, `allowupload`, `allowshare`, `allowmtag`, `allowthread`, `allowpost`, `allowcss`, `allowpoke`, `allowfriend`, `allowpoll`, `allowclick`, `allowevent`, `allowmagic`, `allowpm`, `allowviewvideopic`, `allowmyop`, `allowtopic`, `allowstat`, `magicdiscount`, `verifyevent`, `edittrail`, `domainlength`, `closeignore`, `seccode`, `color`, `icon`, `manageconfig`, `managenetwork`, `manageprofilefield`, `manageprofield`, `manageusergroup`, `managefeed`, `manageshare`, `managedoing`, `manageblog`, `managetag`, `managetagtpl`, `managealbum`, `managecomment`, `managemtag`, `managethread`, `manageevent`, `manageeventclass`, `managecensor`, `managead`, `managesitefeed`, `managebackup`, `manageblock`, `managetemplate`, `managestat`, `managecache`, `managecredit`, `managecron`, `managename`, `manageapp`, `managetask`, `managereport`, `managepoll`, `manageclick`, `managemagic`, `managemagiclog`, `managebatch`, `managedelspace`, `managetopic`, `manageip`, `managehotuser`, `managedefaultuser`, `managespacegroup`, `managespaceinfo`, `managespacecredit`, `managespacenote`, `managevideophoto`, `managelog`, `magicaward`) VALUES
(1, '站点管理员', -1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 'red', 'image/group/admin.gif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ''),
(2, '信息管理员', -1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, 1, 0, 'blue', 'image/group/infor.gif', 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(3, '贵宾VIP', 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 3, 0, 0, 'green', 'image/group/vip.gif', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4, '受限会员', 0, 0, -999999999, 10, 10, 0, 0, 600, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(5, '普通会员', 0, 0, 0, 100, 20, 0, 1, 60, 0, 60, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(6, '中级会员', 0, 0, 100, 200, 50, 0, 1, 30, 0, 30, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 5, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(7, '高级会员', 0, 0, 1000, 300, 100, 1, 1, 10, 1, 10, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8, '禁止发言', -1, 0, 0, 1, 1, 0, 0, 9999, 0, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 99, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(9, '禁止访问', -1, 1, 0, 1, 1, 0, 0, 9999, 0, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 99, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `uchome_userlog`
--

CREATE TABLE `uchome_userlog` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `action` char(10) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_usermagic`
--

CREATE TABLE `uchome_usermagic` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `mid` varchar(15) NOT NULL DEFAULT '',
  `count` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_usertask`
--

CREATE TABLE `uchome_usertask` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `taskid` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `credit` smallint(6) NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isignore` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uchome_visitor`
--

CREATE TABLE `uchome_visitor` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `vuid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `vusername` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_admins`
--

CREATE TABLE `uc_admins` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `allowadminsetting` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminapp` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminuser` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminbadword` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmintag` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminpm` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincredits` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindomain` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindb` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminnote` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincache` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminlog` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_applications`
--

CREATE TABLE `uc_applications` (
  `appid` smallint(6) UNSIGNED NOT NULL,
  `type` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `authkey` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `viewprourl` varchar(255) NOT NULL,
  `apifilename` varchar(30) NOT NULL DEFAULT 'uc.php',
  `charset` varchar(8) NOT NULL DEFAULT '',
  `dbcharset` varchar(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  `recvnote` tinyint(1) DEFAULT '0',
  `extra` text NOT NULL,
  `tagtemplates` text NOT NULL,
  `allowips` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_applications`
--

INSERT INTO `uc_applications` (`appid`, `type`, `name`, `url`, `authkey`, `ip`, `viewprourl`, `apifilename`, `charset`, `dbcharset`, `synlogin`, `recvnote`, `extra`, `tagtemplates`, `allowips`) VALUES
(1, 'OTHER', 'tp', 'http://localhost', '1ebfIDaGCy0kwswH2Jn6rlVick0MDp2VdjXI5COOCwtmCigEDf1q', '', '', 'uc.php', '', '', 1, 1, 'a:2:{s:7:\"apppath\";s:0:\"\";s:8:\"extraurl\";a:0:{}}', '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"template\"><![CDATA[]]></item>\r\n</root>', ''),
(2, 'UCHOME', '个人家园', 'http://127.0.0.1/home', '9debNcbC3RrV1CO4FSWpKqqKIdyHjsGdAdkbca87GdZn+piKFUpeKk9bA1KS/DWHcQvmII9KUdK70EzGvawkD6LAdWQGvVcCEf6DkVgX7joex+9oDlpnBCC3igna', '', '', 'uc.php', 'utf-8', 'utf8', 1, 1, 'a:2:{s:7:\"apppath\";s:0:\"\";s:8:\"extraurl\";a:0:{}}', '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"template\"><![CDATA[<a href=\"{url}\" target=\"_blank\">{subject}</a>]]></item>\r\n	<item id=\"fields\">\r\n		<item id=\"subject\"><![CDATA[日志标题]]></item>\r\n		<item id=\"uid\"><![CDATA[用户 ID]]></item>\r\n		<item id=\"username\"><![CDATA[用户名]]></item>\r\n		<item id=\"dateline\"><![CDATA[日期]]></item>\r\n		<item id=\"spaceurl\"><![CDATA[空间地址]]></item>\r\n		<item id=\"url\"><![CDATA[日志地址]]></item>\r\n	</item>\r\n</root>', '');

-- --------------------------------------------------------

--
-- 表的结构 `uc_badwords`
--

CREATE TABLE `uc_badwords` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `find` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `findpattern` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_domains`
--

CREATE TABLE `uc_domains` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` char(40) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_failedlogins`
--

CREATE TABLE `uc_failedlogins` (
  `ip` char(15) NOT NULL DEFAULT '',
  `count` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lastupdate` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_failedlogins`
--

INSERT INTO `uc_failedlogins` (`ip`, `count`, `lastupdate`) VALUES
('127.0.0.1', 2, 1489995239);

-- --------------------------------------------------------

--
-- 表的结构 `uc_feeds`
--

CREATE TABLE `uc_feeds` (
  `feedid` mediumint(8) UNSIGNED NOT NULL,
  `appid` varchar(30) NOT NULL DEFAULT '',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_friends`
--

CREATE TABLE `uc_friends` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `friendid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `direction` tinyint(1) NOT NULL DEFAULT '0',
  `version` int(10) UNSIGNED NOT NULL,
  `delstatus` tinyint(1) NOT NULL DEFAULT '0',
  `comment` char(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_mailqueue`
--

CREATE TABLE `uc_mailqueue` (
  `mailid` int(10) UNSIGNED NOT NULL,
  `touid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `tomail` varchar(32) NOT NULL,
  `frommail` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `charset` varchar(15) NOT NULL,
  `htmlon` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `failures` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `appid` smallint(6) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_memberfields`
--

CREATE TABLE `uc_memberfields` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `blacklist` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_memberfields`
--

INSERT INTO `uc_memberfields` (`uid`, `blacklist`) VALUES
(1, ''),
(2, ''),
(4, '');

-- --------------------------------------------------------

--
-- 表的结构 `uc_members`
--

CREATE TABLE `uc_members` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `myid` char(30) NOT NULL DEFAULT '',
  `myidkey` char(16) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `salt` char(6) NOT NULL,
  `secques` char(8) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_members`
--

INSERT INTO `uc_members` (`uid`, `username`, `password`, `email`, `myid`, `myidkey`, `regip`, `regdate`, `lastloginip`, `lastlogintime`, `salt`, `secques`) VALUES
(1, '11a', '193f835d76131b600b9c74cf0a5ef39b', 'aas@fs.cc', '', '', '127.0.0.1', 1489991616, 0, 0, '038703', ''),
(2, 'admin', 'c89363e58c0306adef203a06ea9050ed', 'webmastor@yourdomain.com', '', '', '127.0.0.1', 1490005239, 0, 0, '72cf59', ''),
(4, '123', '1c49e2f603b27391f13d422d269c0c2f', 'dfs@ee.nn', '', '', '127.0.0.1', 1490089901, 0, 0, 'd34a66', '');

-- --------------------------------------------------------

--
-- 表的结构 `uc_mergemembers`
--

CREATE TABLE `uc_mergemembers` (
  `appid` smallint(6) UNSIGNED NOT NULL,
  `username` char(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_newpm`
--

CREATE TABLE `uc_newpm` (
  `uid` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_notelist`
--

CREATE TABLE `uc_notelist` (
  `noteid` int(10) UNSIGNED NOT NULL,
  `operation` char(32) NOT NULL,
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `succeednum` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `getdata` mediumtext NOT NULL,
  `postdata` mediumtext NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pri` tinyint(3) NOT NULL DEFAULT '0',
  `app1` tinyint(4) NOT NULL,
  `app2` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_notelist`
--

INSERT INTO `uc_notelist` (`noteid`, `operation`, `closed`, `totalnum`, `succeednum`, `getdata`, `postdata`, `dateline`, `pri`, `app1`, `app2`) VALUES
(1, 'updateapps', 1, 0, 0, '', '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"1\">\r\n		<item id=\"appid\"><![CDATA[1]]></item>\r\n		<item id=\"type\"><![CDATA[OTHER]]></item>\r\n		<item id=\"name\"><![CDATA[tp]]></item>\r\n		<item id=\"url\"><![CDATA[http://localhost/ucenter/api]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"viewprourl\"><![CDATA[]]></item>\r\n		<item id=\"apifilename\"><![CDATA[uc.php]]></item>\r\n		<item id=\"charset\"><![CDATA[]]></item>\r\n		<item id=\"synlogin\"><![CDATA[0]]></item>\r\n		<item id=\"extra\">\r\n			<item id=\"apppath\"><![CDATA[]]></item>\r\n		</item>\r\n		<item id=\"recvnote\"><![CDATA[0]]></item>\r\n	</item>\r\n	<item id=\"UC_API\"><![CDATA[http://127.0.0.1/ucenter/uc]]></item>\r\n</root>', 0, 0, 0, 0),
(2, 'updateapps', 1, 0, 0, '', '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"1\">\r\n		<item id=\"appid\"><![CDATA[1]]></item>\r\n		<item id=\"type\"><![CDATA[OTHER]]></item>\r\n		<item id=\"name\"><![CDATA[tp]]></item>\r\n		<item id=\"url\"><![CDATA[http://localhost/ucenter/api]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"viewprourl\"><![CDATA[]]></item>\r\n		<item id=\"apifilename\"><![CDATA[uc.php]]></item>\r\n		<item id=\"charset\"><![CDATA[]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\">\r\n			<item id=\"apppath\"><![CDATA[]]></item>\r\n			<item id=\"extraurl\">\r\n			</item>\r\n		</item>\r\n		<item id=\"recvnote\"><![CDATA[1]]></item>\r\n	</item>\r\n	<item id=\"UC_API\"><![CDATA[http://127.0.0.1/ucenter/uc]]></item>\r\n</root>', 0, 0, 0, 0),
(3, 'updateapps', 1, 5, 0, '', '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"1\">\r\n		<item id=\"appid\"><![CDATA[1]]></item>\r\n		<item id=\"type\"><![CDATA[OTHER]]></item>\r\n		<item id=\"name\"><![CDATA[tp]]></item>\r\n		<item id=\"url\"><![CDATA[http://localhost/ucenter/]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"viewprourl\"><![CDATA[]]></item>\r\n		<item id=\"apifilename\"><![CDATA[uc.php]]></item>\r\n		<item id=\"charset\"><![CDATA[]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\">\r\n			<item id=\"apppath\"><![CDATA[]]></item>\r\n			<item id=\"extraurl\">\r\n			</item>\r\n		</item>\r\n		<item id=\"recvnote\"><![CDATA[1]]></item>\r\n	</item>\r\n	<item id=\"UC_API\"><![CDATA[http://127.0.0.1/ucenter/uc]]></item>\r\n</root>', 1489991536, 0, -5, 0),
(4, 'updateapps', 1, 6, 1, '', '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"1\">\r\n		<item id=\"appid\"><![CDATA[1]]></item>\r\n		<item id=\"type\"><![CDATA[OTHER]]></item>\r\n		<item id=\"name\"><![CDATA[tp]]></item>\r\n		<item id=\"url\"><![CDATA[http://localhost/ucenter/]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"charset\"><![CDATA[]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\"><![CDATA[a:2:{s:7:\"apppath\";s:0:\"\";s:8:\"extraurl\";a:0:{}}]]></item>\r\n	</item>\r\n	<item id=\"2\">\r\n		<item id=\"appid\"><![CDATA[2]]></item>\r\n		<item id=\"type\"><![CDATA[UCHOME]]></item>\r\n		<item id=\"name\"><![CDATA[个人家园]]></item>\r\n		<item id=\"url\"><![CDATA[http://127.0.0.1/ucenter/home]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"charset\"><![CDATA[utf-8]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\"><![CDATA[]]></item>\r\n	</item>\r\n	<item id=\"UC_API\"><![CDATA[http://127.0.0.1/ucenter/uc]]></item>\r\n</root>', 1490086414, 0, -5, 1),
(5, 'updatecreditsettings', 1, 5, 0, '', '', 1490087488, 0, -5, 0),
(6, 'updateapps', 1, 6, 1, '', '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"1\">\r\n		<item id=\"appid\"><![CDATA[1]]></item>\r\n		<item id=\"type\"><![CDATA[OTHER]]></item>\r\n		<item id=\"name\"><![CDATA[tp]]></item>\r\n		<item id=\"url\"><![CDATA[http://localhost/]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"viewprourl\"><![CDATA[]]></item>\r\n		<item id=\"apifilename\"><![CDATA[uc.php]]></item>\r\n		<item id=\"charset\"><![CDATA[]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\">\r\n			<item id=\"apppath\"><![CDATA[]]></item>\r\n			<item id=\"extraurl\">\r\n			</item>\r\n		</item>\r\n		<item id=\"recvnote\"><![CDATA[1]]></item>\r\n	</item>\r\n	<item id=\"2\">\r\n		<item id=\"appid\"><![CDATA[2]]></item>\r\n		<item id=\"type\"><![CDATA[UCHOME]]></item>\r\n		<item id=\"name\"><![CDATA[个人家园]]></item>\r\n		<item id=\"url\"><![CDATA[http://127.0.0.1/ucenter/home]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"viewprourl\"><![CDATA[]]></item>\r\n		<item id=\"apifilename\"><![CDATA[uc.php]]></item>\r\n		<item id=\"charset\"><![CDATA[utf-8]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\"><![CDATA[]]></item>\r\n		<item id=\"recvnote\"><![CDATA[1]]></item>\r\n	</item>\r\n	<item id=\"UC_API\"><![CDATA[http://127.0.0.1/uc]]></item>\r\n</root>', 1490167892, 0, -5, 1),
(7, 'updateapps', 1, 4, 0, '', '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"1\">\r\n		<item id=\"appid\"><![CDATA[1]]></item>\r\n		<item id=\"type\"><![CDATA[OTHER]]></item>\r\n		<item id=\"name\"><![CDATA[tp]]></item>\r\n		<item id=\"url\"><![CDATA[http://localhost/]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"viewprourl\"><![CDATA[]]></item>\r\n		<item id=\"apifilename\"><![CDATA[uc.php]]></item>\r\n		<item id=\"charset\"><![CDATA[]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\">\r\n			<item id=\"apppath\"><![CDATA[]]></item>\r\n			<item id=\"extraurl\">\r\n			</item>\r\n		</item>\r\n		<item id=\"recvnote\"><![CDATA[1]]></item>\r\n	</item>\r\n	<item id=\"2\">\r\n		<item id=\"appid\"><![CDATA[2]]></item>\r\n		<item id=\"type\"><![CDATA[UCHOME]]></item>\r\n		<item id=\"name\"><![CDATA[个人家园]]></item>\r\n		<item id=\"url\"><![CDATA[http://127.0.0.1/home]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"viewprourl\"><![CDATA[]]></item>\r\n		<item id=\"apifilename\"><![CDATA[uc.php]]></item>\r\n		<item id=\"charset\"><![CDATA[utf-8]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\">\r\n			<item id=\"apppath\"><![CDATA[]]></item>\r\n			<item id=\"extraurl\">\r\n			</item>\r\n		</item>\r\n		<item id=\"recvnote\"><![CDATA[1]]></item>\r\n	</item>\r\n	<item id=\"UC_API\"><![CDATA[http://127.0.0.1/uc]]></item>\r\n</root>', 1490880182, 0, -4, 0),
(8, 'updateapps', 1, 1, 0, '', '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<root>\r\n	<item id=\"1\">\r\n		<item id=\"appid\"><![CDATA[1]]></item>\r\n		<item id=\"type\"><![CDATA[OTHER]]></item>\r\n		<item id=\"name\"><![CDATA[tp]]></item>\r\n		<item id=\"url\"><![CDATA[http://localhost]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"viewprourl\"><![CDATA[]]></item>\r\n		<item id=\"apifilename\"><![CDATA[uc.php]]></item>\r\n		<item id=\"charset\"><![CDATA[]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\">\r\n			<item id=\"apppath\"><![CDATA[]]></item>\r\n			<item id=\"extraurl\">\r\n			</item>\r\n		</item>\r\n		<item id=\"recvnote\"><![CDATA[1]]></item>\r\n	</item>\r\n	<item id=\"2\">\r\n		<item id=\"appid\"><![CDATA[2]]></item>\r\n		<item id=\"type\"><![CDATA[UCHOME]]></item>\r\n		<item id=\"name\"><![CDATA[个人家园]]></item>\r\n		<item id=\"url\"><![CDATA[http://127.0.0.1/home]]></item>\r\n		<item id=\"ip\"><![CDATA[]]></item>\r\n		<item id=\"viewprourl\"><![CDATA[]]></item>\r\n		<item id=\"apifilename\"><![CDATA[uc.php]]></item>\r\n		<item id=\"charset\"><![CDATA[utf-8]]></item>\r\n		<item id=\"synlogin\"><![CDATA[1]]></item>\r\n		<item id=\"extra\">\r\n			<item id=\"apppath\"><![CDATA[]]></item>\r\n			<item id=\"extraurl\">\r\n			</item>\r\n		</item>\r\n		<item id=\"recvnote\"><![CDATA[1]]></item>\r\n	</item>\r\n	<item id=\"UC_API\"><![CDATA[http://127.0.0.1/uc]]></item>\r\n</root>', 1490880190, 0, -1, 0),
(9, 'updatepw', 1, 1, 0, 'username=123&password=', '', 1490880221, 0, -1, 0),
(10, 'updatepw', 1, 1, 0, 'username=123&password=', '', 1490880336, 0, -1, 0),
(11, 'updatepw', 1, 1, 0, 'username=123&password=', '', 1490880389, 0, -1, 0),
(12, 'deleteuser', 1, 1, 0, 'ids=\'3\'', '', 1490888637, 0, -1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_indexes`
--

CREATE TABLE `uc_pm_indexes` (
  `pmid` mediumint(8) UNSIGNED NOT NULL,
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_pm_indexes`
--

INSERT INTO `uc_pm_indexes` (`pmid`, `plid`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_lists`
--

CREATE TABLE `uc_pm_lists` (
  `plid` mediumint(8) UNSIGNED NOT NULL,
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `pmtype` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL,
  `members` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `min_max` varchar(17) NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastmessage` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_pm_lists`
--

INSERT INTO `uc_pm_lists` (`plid`, `authorid`, `pmtype`, `subject`, `members`, `min_max`, `dateline`, `lastmessage`) VALUES
(1, 4, 1, 'asdasd', 2, '2_4', 1490114839, 'a:3:{s:12:\"lastauthorid\";s:1:\"4\";s:10:\"lastauthor\";s:3:\"123\";s:11:\"lastsummary\";s:9:\"咽唾液\";}');

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_members`
--

CREATE TABLE `uc_pm_members` (
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `isnew` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `pmnum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastupdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastdateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_pm_members`
--

INSERT INTO `uc_pm_members` (`plid`, `uid`, `isnew`, `pmnum`, `lastupdate`, `lastdateline`) VALUES
(1, 2, 0, 3, 0, 1490114898),
(1, 4, 0, 3, 1490114898, 1490114898);

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_0`
--

CREATE TABLE `uc_pm_messages_0` (
  `pmid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_1`
--

CREATE TABLE `uc_pm_messages_1` (
  `pmid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_pm_messages_1`
--

INSERT INTO `uc_pm_messages_1` (`pmid`, `plid`, `authorid`, `message`, `delstatus`, `dateline`) VALUES
(1, 1, 4, '1', 0, 1490114839),
(2, 1, 4, 'asdsdasda', 0, 1490114856),
(3, 1, 4, '咽唾液', 0, 1490114898);

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_2`
--

CREATE TABLE `uc_pm_messages_2` (
  `pmid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_3`
--

CREATE TABLE `uc_pm_messages_3` (
  `pmid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_4`
--

CREATE TABLE `uc_pm_messages_4` (
  `pmid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_5`
--

CREATE TABLE `uc_pm_messages_5` (
  `pmid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_6`
--

CREATE TABLE `uc_pm_messages_6` (
  `pmid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_7`
--

CREATE TABLE `uc_pm_messages_7` (
  `pmid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_8`
--

CREATE TABLE `uc_pm_messages_8` (
  `pmid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_pm_messages_9`
--

CREATE TABLE `uc_pm_messages_9` (
  `pmid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `plid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_protectedmembers`
--

CREATE TABLE `uc_protectedmembers` (
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `appid` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `admin` char(15) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_protectedmembers`
--

INSERT INTO `uc_protectedmembers` (`uid`, `username`, `appid`, `dateline`, `admin`) VALUES
(2, 'admin', 2, 1490005239, 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `uc_settings`
--

CREATE TABLE `uc_settings` (
  `k` varchar(32) NOT NULL DEFAULT '',
  `v` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uc_settings`
--

INSERT INTO `uc_settings` (`k`, `v`) VALUES
('accessemail', ''),
('censoremail', ''),
('censorusername', ''),
('dateformat', 'y-n-j'),
('doublee', '0'),
('nextnotetime', '0'),
('timeoffset', '28800'),
('privatepmthreadlimit', '25'),
('chatpmthreadlimit', '30'),
('chatpmmemberlimit', '35'),
('pmfloodctrl', '15'),
('pmcenter', '1'),
('sendpmseccode', '1'),
('pmsendregdays', '0'),
('maildefault', 'username@21cn.com'),
('mailsend', '1'),
('mailserver', 'smtp.21cn.com'),
('mailport', '25'),
('mailauth', '1'),
('mailfrom', 'UCenter <username@21cn.com>'),
('mailauth_username', 'username@21cn.com'),
('mailauth_password', 'password'),
('maildelimiter', '0'),
('mailusername', '1'),
('mailsilent', '1'),
('version', '1.6.0'),
('credits', 'a:1:{i:2;a:1:{i:1;a:2:{i:0;s:6:\"积分\";i:1;s:3:\"个\";}}}');

-- --------------------------------------------------------

--
-- 表的结构 `uc_sqlcache`
--

CREATE TABLE `uc_sqlcache` (
  `sqlid` char(6) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL,
  `expiry` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_tags`
--

CREATE TABLE `uc_tags` (
  `tagname` char(20) NOT NULL,
  `appid` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `data` mediumtext,
  `expiration` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uc_vars`
--

CREATE TABLE `uc_vars` (
  `name` char(32) NOT NULL DEFAULT '',
  `value` char(255) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `think_ad`
--
ALTER TABLE `think_ad`
  ADD PRIMARY KEY (`adid`);

--
-- Indexes for table `think_auth_group`
--
ALTER TABLE `think_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_auth_group_access`
--
ALTER TABLE `think_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `think_auth_rule`
--
ALTER TABLE `think_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `think_category`
--
ALTER TABLE `think_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `think_check`
--
ALTER TABLE `think_check`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `think_comment`
--
ALTER TABLE `think_comment`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `think_danmu`
--
ALTER TABLE `think_danmu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_danmufobidden`
--
ALTER TABLE `think_danmufobidden`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `think_group`
--
ALTER TABLE `think_group`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `think_member`
--
ALTER TABLE `think_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_pointhistory`
--
ALTER TABLE `think_pointhistory`
  ADD PRIMARY KEY (`hid`);

--
-- Indexes for table `think_pointmax`
--
ALTER TABLE `think_pointmax`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `think_pointrule`
--
ALTER TABLE `think_pointrule`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `think_post`
--
ALTER TABLE `think_post`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `think_qian`
--
ALTER TABLE `think_qian`
  ADD PRIMARY KEY (`qd`);

--
-- Indexes for table `think_save`
--
ALTER TABLE `think_save`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `think_uc`
--
ALTER TABLE `think_uc`
  ADD PRIMARY KEY (`uc`);

--
-- Indexes for table `think_userpoint`
--
ALTER TABLE `think_userpoint`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `uchome_ad`
--
ALTER TABLE `uchome_ad`
  ADD PRIMARY KEY (`adid`);

--
-- Indexes for table `uchome_adminsession`
--
ALTER TABLE `uchome_adminsession`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `uchome_album`
--
ALTER TABLE `uchome_album`
  ADD PRIMARY KEY (`albumid`),
  ADD KEY `uid` (`uid`,`updatetime`),
  ADD KEY `updatetime` (`updatetime`);

--
-- Indexes for table `uchome_appcreditlog`
--
ALTER TABLE `uchome_appcreditlog`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `appid` (`appid`);

--
-- Indexes for table `uchome_blacklist`
--
ALTER TABLE `uchome_blacklist`
  ADD PRIMARY KEY (`uid`,`buid`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `uchome_block`
--
ALTER TABLE `uchome_block`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `uchome_blog`
--
ALTER TABLE `uchome_blog`
  ADD PRIMARY KEY (`blogid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `topicid` (`topicid`,`dateline`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `uchome_blogfield`
--
ALTER TABLE `uchome_blogfield`
  ADD PRIMARY KEY (`blogid`);

--
-- Indexes for table `uchome_cache`
--
ALTER TABLE `uchome_cache`
  ADD PRIMARY KEY (`cachekey`);

--
-- Indexes for table `uchome_class`
--
ALTER TABLE `uchome_class`
  ADD PRIMARY KEY (`classid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `uchome_click`
--
ALTER TABLE `uchome_click`
  ADD PRIMARY KEY (`clickid`),
  ADD KEY `idtype` (`idtype`,`displayorder`);

--
-- Indexes for table `uchome_clickuser`
--
ALTER TABLE `uchome_clickuser`
  ADD KEY `id` (`id`,`idtype`,`dateline`),
  ADD KEY `uid` (`uid`,`idtype`,`dateline`);

--
-- Indexes for table `uchome_comment`
--
ALTER TABLE `uchome_comment`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `authorid` (`authorid`,`idtype`),
  ADD KEY `id` (`id`,`idtype`,`dateline`);

--
-- Indexes for table `uchome_config`
--
ALTER TABLE `uchome_config`
  ADD PRIMARY KEY (`var`);

--
-- Indexes for table `uchome_creditlog`
--
ALTER TABLE `uchome_creditlog`
  ADD PRIMARY KEY (`clid`),
  ADD KEY `uid` (`uid`,`rid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `uchome_creditrule`
--
ALTER TABLE `uchome_creditrule`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `action` (`action`);

--
-- Indexes for table `uchome_cron`
--
ALTER TABLE `uchome_cron`
  ADD PRIMARY KEY (`cronid`),
  ADD KEY `nextrun` (`available`,`nextrun`);

--
-- Indexes for table `uchome_data`
--
ALTER TABLE `uchome_data`
  ADD PRIMARY KEY (`var`);

--
-- Indexes for table `uchome_docomment`
--
ALTER TABLE `uchome_docomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doid` (`doid`,`dateline`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `uchome_doing`
--
ALTER TABLE `uchome_doing`
  ADD PRIMARY KEY (`doid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `uchome_event`
--
ALTER TABLE `uchome_event`
  ADD PRIMARY KEY (`eventid`),
  ADD KEY `grade` (`grade`,`recommendtime`),
  ADD KEY `membernum` (`membernum`),
  ADD KEY `uid` (`uid`,`eventid`),
  ADD KEY `tagid` (`tagid`,`eventid`),
  ADD KEY `topicid` (`topicid`,`dateline`);

--
-- Indexes for table `uchome_eventclass`
--
ALTER TABLE `uchome_eventclass`
  ADD PRIMARY KEY (`classid`),
  ADD UNIQUE KEY `classname` (`classname`);

--
-- Indexes for table `uchome_eventfield`
--
ALTER TABLE `uchome_eventfield`
  ADD PRIMARY KEY (`eventid`);

--
-- Indexes for table `uchome_eventinvite`
--
ALTER TABLE `uchome_eventinvite`
  ADD PRIMARY KEY (`eventid`,`touid`);

--
-- Indexes for table `uchome_eventpic`
--
ALTER TABLE `uchome_eventpic`
  ADD PRIMARY KEY (`picid`),
  ADD KEY `eventid` (`eventid`,`picid`);

--
-- Indexes for table `uchome_feed`
--
ALTER TABLE `uchome_feed`
  ADD PRIMARY KEY (`feedid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `dateline` (`dateline`),
  ADD KEY `hot` (`hot`),
  ADD KEY `id` (`id`,`idtype`);

--
-- Indexes for table `uchome_friend`
--
ALTER TABLE `uchome_friend`
  ADD PRIMARY KEY (`uid`,`fuid`),
  ADD KEY `fuid` (`fuid`),
  ADD KEY `status` (`uid`,`status`,`num`,`dateline`);

--
-- Indexes for table `uchome_friendguide`
--
ALTER TABLE `uchome_friendguide`
  ADD PRIMARY KEY (`uid`,`fuid`),
  ADD KEY `uid` (`uid`,`num`);

--
-- Indexes for table `uchome_friendlog`
--
ALTER TABLE `uchome_friendlog`
  ADD PRIMARY KEY (`uid`,`fuid`);

--
-- Indexes for table `uchome_invite`
--
ALTER TABLE `uchome_invite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `uchome_log`
--
ALTER TABLE `uchome_log`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `uchome_magic`
--
ALTER TABLE `uchome_magic`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `uchome_magicinlog`
--
ALTER TABLE `uchome_magicinlog`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `type` (`type`,`fromid`,`dateline`);

--
-- Indexes for table `uchome_magicstore`
--
ALTER TABLE `uchome_magicstore`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `uchome_magicuselog`
--
ALTER TABLE `uchome_magicuselog`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `uid` (`uid`,`mid`),
  ADD KEY `id` (`id`,`idtype`);

--
-- Indexes for table `uchome_mailcron`
--
ALTER TABLE `uchome_mailcron`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `sendtime` (`sendtime`);

--
-- Indexes for table `uchome_mailqueue`
--
ALTER TABLE `uchome_mailqueue`
  ADD PRIMARY KEY (`qid`),
  ADD KEY `mcid` (`cid`,`dateline`);

--
-- Indexes for table `uchome_member`
--
ALTER TABLE `uchome_member`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `uchome_mtag`
--
ALTER TABLE `uchome_mtag`
  ADD PRIMARY KEY (`tagid`),
  ADD KEY `tagname` (`tagname`),
  ADD KEY `threadnum` (`threadnum`);

--
-- Indexes for table `uchome_mtaginvite`
--
ALTER TABLE `uchome_mtaginvite`
  ADD PRIMARY KEY (`uid`,`tagid`);

--
-- Indexes for table `uchome_myapp`
--
ALTER TABLE `uchome_myapp`
  ADD PRIMARY KEY (`appid`),
  ADD KEY `flag` (`flag`,`displayorder`);

--
-- Indexes for table `uchome_myinvite`
--
ALTER TABLE `uchome_myinvite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `uid` (`touid`,`dateline`);

--
-- Indexes for table `uchome_notification`
--
ALTER TABLE `uchome_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`,`new`,`dateline`);

--
-- Indexes for table `uchome_pic`
--
ALTER TABLE `uchome_pic`
  ADD PRIMARY KEY (`picid`),
  ADD KEY `albumid` (`albumid`,`dateline`),
  ADD KEY `topicid` (`topicid`,`dateline`);

--
-- Indexes for table `uchome_picfield`
--
ALTER TABLE `uchome_picfield`
  ADD PRIMARY KEY (`picid`);

--
-- Indexes for table `uchome_poke`
--
ALTER TABLE `uchome_poke`
  ADD PRIMARY KEY (`uid`,`fromuid`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `uchome_poll`
--
ALTER TABLE `uchome_poll`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `topicid` (`topicid`,`dateline`),
  ADD KEY `voternum` (`voternum`),
  ADD KEY `dateline` (`dateline`),
  ADD KEY `lastvote` (`lastvote`),
  ADD KEY `hot` (`hot`),
  ADD KEY `percredit` (`percredit`);

--
-- Indexes for table `uchome_pollfield`
--
ALTER TABLE `uchome_pollfield`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `uchome_polloption`
--
ALTER TABLE `uchome_polloption`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `uchome_polluser`
--
ALTER TABLE `uchome_polluser`
  ADD PRIMARY KEY (`uid`,`pid`),
  ADD KEY `pid` (`pid`,`dateline`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `uchome_post`
--
ALTER TABLE `uchome_post`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `tid` (`tid`,`dateline`);

--
-- Indexes for table `uchome_profield`
--
ALTER TABLE `uchome_profield`
  ADD PRIMARY KEY (`fieldid`);

--
-- Indexes for table `uchome_profilefield`
--
ALTER TABLE `uchome_profilefield`
  ADD PRIMARY KEY (`fieldid`);

--
-- Indexes for table `uchome_report`
--
ALTER TABLE `uchome_report`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `id` (`id`,`idtype`,`num`,`dateline`),
  ADD KEY `new` (`new`,`dateline`);

--
-- Indexes for table `uchome_session`
--
ALTER TABLE `uchome_session`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `lastactivity` (`lastactivity`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `uchome_share`
--
ALTER TABLE `uchome_share`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `topicid` (`topicid`,`dateline`),
  ADD KEY `hot` (`hot`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `uchome_show`
--
ALTER TABLE `uchome_show`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `credit` (`credit`);

--
-- Indexes for table `uchome_space`
--
ALTER TABLE `uchome_space`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `username` (`username`),
  ADD KEY `domain` (`domain`),
  ADD KEY `ip` (`ip`),
  ADD KEY `updatetime` (`updatetime`),
  ADD KEY `mood` (`mood`);

--
-- Indexes for table `uchome_spacefield`
--
ALTER TABLE `uchome_spacefield`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `uchome_spaceinfo`
--
ALTER TABLE `uchome_spaceinfo`
  ADD PRIMARY KEY (`infoid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `uchome_spacelog`
--
ALTER TABLE `uchome_spacelog`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `flag` (`flag`);

--
-- Indexes for table `uchome_stat`
--
ALTER TABLE `uchome_stat`
  ADD PRIMARY KEY (`daytime`);

--
-- Indexes for table `uchome_statuser`
--
ALTER TABLE `uchome_statuser`
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `uchome_tag`
--
ALTER TABLE `uchome_tag`
  ADD PRIMARY KEY (`tagid`),
  ADD KEY `tagname` (`tagname`);

--
-- Indexes for table `uchome_tagblog`
--
ALTER TABLE `uchome_tagblog`
  ADD PRIMARY KEY (`tagid`,`blogid`);

--
-- Indexes for table `uchome_tagspace`
--
ALTER TABLE `uchome_tagspace`
  ADD PRIMARY KEY (`tagid`,`uid`),
  ADD KEY `grade` (`tagid`,`grade`),
  ADD KEY `uid` (`uid`,`grade`);

--
-- Indexes for table `uchome_task`
--
ALTER TABLE `uchome_task`
  ADD PRIMARY KEY (`taskid`),
  ADD KEY `displayorder` (`displayorder`);

--
-- Indexes for table `uchome_thread`
--
ALTER TABLE `uchome_thread`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `tagid` (`tagid`,`displayorder`,`lastpost`),
  ADD KEY `uid` (`uid`,`lastpost`),
  ADD KEY `lastpost` (`lastpost`),
  ADD KEY `topicid` (`topicid`,`dateline`),
  ADD KEY `eventid` (`eventid`,`lastpost`);

--
-- Indexes for table `uchome_topic`
--
ALTER TABLE `uchome_topic`
  ADD PRIMARY KEY (`topicid`),
  ADD KEY `lastpost` (`lastpost`),
  ADD KEY `joinnum` (`joinnum`);

--
-- Indexes for table `uchome_topicuser`
--
ALTER TABLE `uchome_topicuser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `topicid` (`topicid`,`dateline`);

--
-- Indexes for table `uchome_userapp`
--
ALTER TABLE `uchome_userapp`
  ADD KEY `uid` (`uid`,`appid`),
  ADD KEY `menuorder` (`uid`,`menuorder`),
  ADD KEY `displayorder` (`uid`,`displayorder`);

--
-- Indexes for table `uchome_userappfield`
--
ALTER TABLE `uchome_userappfield`
  ADD KEY `uid` (`uid`,`appid`);

--
-- Indexes for table `uchome_userevent`
--
ALTER TABLE `uchome_userevent`
  ADD PRIMARY KEY (`eventid`,`uid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `eventid` (`eventid`,`status`,`dateline`);

--
-- Indexes for table `uchome_usergroup`
--
ALTER TABLE `uchome_usergroup`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `uchome_userlog`
--
ALTER TABLE `uchome_userlog`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `uchome_usermagic`
--
ALTER TABLE `uchome_usermagic`
  ADD PRIMARY KEY (`uid`,`mid`);

--
-- Indexes for table `uchome_usertask`
--
ALTER TABLE `uchome_usertask`
  ADD PRIMARY KEY (`uid`,`taskid`),
  ADD KEY `isignore` (`isignore`,`dateline`);

--
-- Indexes for table `uchome_visitor`
--
ALTER TABLE `uchome_visitor`
  ADD PRIMARY KEY (`uid`,`vuid`),
  ADD KEY `dateline` (`uid`,`dateline`);

--
-- Indexes for table `uc_admins`
--
ALTER TABLE `uc_admins`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `uc_applications`
--
ALTER TABLE `uc_applications`
  ADD PRIMARY KEY (`appid`);

--
-- Indexes for table `uc_badwords`
--
ALTER TABLE `uc_badwords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `find` (`find`);

--
-- Indexes for table `uc_domains`
--
ALTER TABLE `uc_domains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uc_failedlogins`
--
ALTER TABLE `uc_failedlogins`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `uc_feeds`
--
ALTER TABLE `uc_feeds`
  ADD PRIMARY KEY (`feedid`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `uc_friends`
--
ALTER TABLE `uc_friends`
  ADD PRIMARY KEY (`version`),
  ADD KEY `uid` (`uid`),
  ADD KEY `friendid` (`friendid`);

--
-- Indexes for table `uc_mailqueue`
--
ALTER TABLE `uc_mailqueue`
  ADD PRIMARY KEY (`mailid`),
  ADD KEY `appid` (`appid`),
  ADD KEY `level` (`level`,`failures`);

--
-- Indexes for table `uc_memberfields`
--
ALTER TABLE `uc_memberfields`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `uc_members`
--
ALTER TABLE `uc_members`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `uc_mergemembers`
--
ALTER TABLE `uc_mergemembers`
  ADD PRIMARY KEY (`appid`,`username`);

--
-- Indexes for table `uc_newpm`
--
ALTER TABLE `uc_newpm`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `uc_notelist`
--
ALTER TABLE `uc_notelist`
  ADD PRIMARY KEY (`noteid`),
  ADD KEY `closed` (`closed`,`pri`,`noteid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `uc_pm_indexes`
--
ALTER TABLE `uc_pm_indexes`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`);

--
-- Indexes for table `uc_pm_lists`
--
ALTER TABLE `uc_pm_lists`
  ADD PRIMARY KEY (`plid`),
  ADD KEY `pmtype` (`pmtype`),
  ADD KEY `min_max` (`min_max`),
  ADD KEY `authorid` (`authorid`,`dateline`);

--
-- Indexes for table `uc_pm_members`
--
ALTER TABLE `uc_pm_members`
  ADD PRIMARY KEY (`plid`,`uid`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `lastdateline` (`uid`,`lastdateline`),
  ADD KEY `lastupdate` (`uid`,`lastupdate`);

--
-- Indexes for table `uc_pm_messages_0`
--
ALTER TABLE `uc_pm_messages_0`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `uc_pm_messages_1`
--
ALTER TABLE `uc_pm_messages_1`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `uc_pm_messages_2`
--
ALTER TABLE `uc_pm_messages_2`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `uc_pm_messages_3`
--
ALTER TABLE `uc_pm_messages_3`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `uc_pm_messages_4`
--
ALTER TABLE `uc_pm_messages_4`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `uc_pm_messages_5`
--
ALTER TABLE `uc_pm_messages_5`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `uc_pm_messages_6`
--
ALTER TABLE `uc_pm_messages_6`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `uc_pm_messages_7`
--
ALTER TABLE `uc_pm_messages_7`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `uc_pm_messages_8`
--
ALTER TABLE `uc_pm_messages_8`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `uc_pm_messages_9`
--
ALTER TABLE `uc_pm_messages_9`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `uc_protectedmembers`
--
ALTER TABLE `uc_protectedmembers`
  ADD UNIQUE KEY `username` (`username`,`appid`);

--
-- Indexes for table `uc_settings`
--
ALTER TABLE `uc_settings`
  ADD PRIMARY KEY (`k`);

--
-- Indexes for table `uc_sqlcache`
--
ALTER TABLE `uc_sqlcache`
  ADD PRIMARY KEY (`sqlid`),
  ADD KEY `expiry` (`expiry`);

--
-- Indexes for table `uc_tags`
--
ALTER TABLE `uc_tags`
  ADD KEY `tagname` (`tagname`,`appid`);

--
-- Indexes for table `uc_vars`
--
ALTER TABLE `uc_vars`
  ADD PRIMARY KEY (`name`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `think_ad`
--
ALTER TABLE `think_ad`
  MODIFY `adid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- 使用表AUTO_INCREMENT `think_auth_group`
--
ALTER TABLE `think_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `think_auth_rule`
--
ALTER TABLE `think_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `think_category`
--
ALTER TABLE `think_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID', AUTO_INCREMENT=39;
--
-- 使用表AUTO_INCREMENT `think_check`
--
ALTER TABLE `think_check`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `think_comment`
--
ALTER TABLE `think_comment`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID', AUTO_INCREMENT=84;
--
-- 使用表AUTO_INCREMENT `think_danmu`
--
ALTER TABLE `think_danmu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- 使用表AUTO_INCREMENT `think_danmufobidden`
--
ALTER TABLE `think_danmufobidden`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `think_group`
--
ALTER TABLE `think_group`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_member`
--
ALTER TABLE `think_member`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_pointhistory`
--
ALTER TABLE `think_pointhistory`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- 使用表AUTO_INCREMENT `think_pointrule`
--
ALTER TABLE `think_pointrule`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `think_post`
--
ALTER TABLE `think_post`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- 使用表AUTO_INCREMENT `think_qian`
--
ALTER TABLE `think_qian`
  MODIFY `qd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `think_save`
--
ALTER TABLE `think_save`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- 使用表AUTO_INCREMENT `think_uc`
--
ALTER TABLE `think_uc`
  MODIFY `uc` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_ad`
--
ALTER TABLE `uchome_ad`
  MODIFY `adid` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_album`
--
ALTER TABLE `uchome_album`
  MODIFY `albumid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_appcreditlog`
--
ALTER TABLE `uchome_appcreditlog`
  MODIFY `logid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_block`
--
ALTER TABLE `uchome_block`
  MODIFY `bid` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_blog`
--
ALTER TABLE `uchome_blog`
  MODIFY `blogid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `uchome_class`
--
ALTER TABLE `uchome_class`
  MODIFY `classid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_click`
--
ALTER TABLE `uchome_click`
  MODIFY `clickid` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `uchome_comment`
--
ALTER TABLE `uchome_comment`
  MODIFY `cid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_creditlog`
--
ALTER TABLE `uchome_creditlog`
  MODIFY `clid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `uchome_creditrule`
--
ALTER TABLE `uchome_creditrule`
  MODIFY `rid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- 使用表AUTO_INCREMENT `uchome_cron`
--
ALTER TABLE `uchome_cron`
  MODIFY `cronid` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `uchome_docomment`
--
ALTER TABLE `uchome_docomment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_doing`
--
ALTER TABLE `uchome_doing`
  MODIFY `doid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `uchome_event`
--
ALTER TABLE `uchome_event`
  MODIFY `eventid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_eventclass`
--
ALTER TABLE `uchome_eventclass`
  MODIFY `classid` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `uchome_eventfield`
--
ALTER TABLE `uchome_eventfield`
  MODIFY `eventid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_feed`
--
ALTER TABLE `uchome_feed`
  MODIFY `feedid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `uchome_invite`
--
ALTER TABLE `uchome_invite`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_log`
--
ALTER TABLE `uchome_log`
  MODIFY `logid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_magicinlog`
--
ALTER TABLE `uchome_magicinlog`
  MODIFY `logid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_magicuselog`
--
ALTER TABLE `uchome_magicuselog`
  MODIFY `logid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_mailcron`
--
ALTER TABLE `uchome_mailcron`
  MODIFY `cid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_mailqueue`
--
ALTER TABLE `uchome_mailqueue`
  MODIFY `qid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_member`
--
ALTER TABLE `uchome_member`
  MODIFY `uid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `uchome_mtag`
--
ALTER TABLE `uchome_mtag`
  MODIFY `tagid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_myinvite`
--
ALTER TABLE `uchome_myinvite`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_notification`
--
ALTER TABLE `uchome_notification`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_pic`
--
ALTER TABLE `uchome_pic`
  MODIFY `picid` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_poll`
--
ALTER TABLE `uchome_poll`
  MODIFY `pid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_polloption`
--
ALTER TABLE `uchome_polloption`
  MODIFY `oid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_post`
--
ALTER TABLE `uchome_post`
  MODIFY `pid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_profield`
--
ALTER TABLE `uchome_profield`
  MODIFY `fieldid` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `uchome_profilefield`
--
ALTER TABLE `uchome_profilefield`
  MODIFY `fieldid` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_report`
--
ALTER TABLE `uchome_report`
  MODIFY `rid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_share`
--
ALTER TABLE `uchome_share`
  MODIFY `sid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_spaceinfo`
--
ALTER TABLE `uchome_spaceinfo`
  MODIFY `infoid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_tag`
--
ALTER TABLE `uchome_tag`
  MODIFY `tagid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_task`
--
ALTER TABLE `uchome_task`
  MODIFY `taskid` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `uchome_thread`
--
ALTER TABLE `uchome_thread`
  MODIFY `tid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_topic`
--
ALTER TABLE `uchome_topic`
  MODIFY `topicid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_topicuser`
--
ALTER TABLE `uchome_topicuser`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uchome_usergroup`
--
ALTER TABLE `uchome_usergroup`
  MODIFY `gid` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `uc_admins`
--
ALTER TABLE `uc_admins`
  MODIFY `uid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uc_applications`
--
ALTER TABLE `uc_applications`
  MODIFY `appid` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `uc_badwords`
--
ALTER TABLE `uc_badwords`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uc_domains`
--
ALTER TABLE `uc_domains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uc_feeds`
--
ALTER TABLE `uc_feeds`
  MODIFY `feedid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uc_friends`
--
ALTER TABLE `uc_friends`
  MODIFY `version` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uc_mailqueue`
--
ALTER TABLE `uc_mailqueue`
  MODIFY `mailid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `uc_members`
--
ALTER TABLE `uc_members`
  MODIFY `uid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `uc_notelist`
--
ALTER TABLE `uc_notelist`
  MODIFY `noteid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `uc_pm_indexes`
--
ALTER TABLE `uc_pm_indexes`
  MODIFY `pmid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `uc_pm_lists`
--
ALTER TABLE `uc_pm_lists`
  MODIFY `plid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
