/*
 Navicat Premium Data Transfer

 Source Server         : Sql Server
 Source Server Type    : SQL Server
 Source Server Version : 11003128
 Source Host           : localhost:1433
 Source Catalog        : qfsm
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 11003128
 File Encoding         : 65001

 Date: 24/09/2018 18:31:45
*/


-- ----------------------------
-- Table structure for list
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[list]') AND type IN ('U'))
	DROP TABLE [dbo].[list]
GO

CREATE TABLE [dbo].[list] (
  [id] varchar(max) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [name] varchar(25) COLLATE Chinese_PRC_CI_AS NULL,
  [sex] varchar(5) COLLATE Chinese_PRC_CI_AS NULL,
  [school] varchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [qq] varchar(15) COLLATE Chinese_PRC_CI_AS NULL,
  [tel] varchar(15) COLLATE Chinese_PRC_CI_AS NULL,
  [xh] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [type] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [ggxq] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [location] varchar(10) COLLATE Chinese_PRC_CI_AS NULL,
  [address] varchar(30) COLLATE Chinese_PRC_CI_AS NULL,
  [status] varchar(10) COLLATE Chinese_PRC_CI_AS NULL,
  [person] varchar(10) COLLATE Chinese_PRC_CI_AS NULL,
  [pay] int NULL,
  [xq] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [private] varchar(100) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[list] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'id号码 唯一',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'姓名',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'性别',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'sex'
GO

EXEC sp_addextendedproperty
'MS_Description', N'区域',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'school'
GO

EXEC sp_addextendedproperty
'MS_Description', N'qq号码',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'qq'
GO

EXEC sp_addextendedproperty
'MS_Description', N'电话号码',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'tel'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机型含颜色',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'xh'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更多需求',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'ggxq'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地点',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'location'
GO

EXEC sp_addextendedproperty
'MS_Description', N'门牌',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'负责人',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'person'
GO

EXEC sp_addextendedproperty
'MS_Description', N'金额',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'pay'
GO

EXEC sp_addextendedproperty
'MS_Description', N'需求',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'xq'
GO

EXEC sp_addextendedproperty
'MS_Description', N'特有',
'SCHEMA', N'dbo',
'TABLE', N'list',
'COLUMN', N'private'
GO

