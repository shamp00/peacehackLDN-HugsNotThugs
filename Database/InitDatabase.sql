USE [master]
GO
/****** Object:  Database [HugsNotThugsApp]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE DATABASE [HugsNotThugsApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialNetworkApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SocialNetworkApp.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SocialNetworkApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SocialNetworkApp_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HugsNotThugsApp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HugsNotThugsApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HugsNotThugsApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HugsNotThugsApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HugsNotThugsApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HugsNotThugsApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HugsNotThugsApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET RECOVERY FULL 
GO
ALTER DATABASE [HugsNotThugsApp] SET  MULTI_USER 
GO
ALTER DATABASE [HugsNotThugsApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HugsNotThugsApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HugsNotThugsApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HugsNotThugsApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HugsNotThugsApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HugsNotThugsApp', N'ON'
GO
USE [HugsNotThugsApp]
GO
/****** Object:  Table [dbo].[AllowedSubscriber]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllowedSubscriber](
	[GroupID] [int] NOT NULL,
	[AllowedUserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AllowedSubscriber] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[AllowedUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlockedPost]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlockedPost](
	[BlockedPostID] [int] NOT NULL,
	[BlockerUserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.BlockedPost] PRIMARY KEY CLUSTERED 
(
	[BlockedPostID] ASC,
	[BlockerUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlockedUser]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlockedUser](
	[BlockedUserID] [int] NOT NULL,
	[BlockerUserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.BlockedUser] PRIMARY KEY CLUSTERED 
(
	[BlockedUserID] ASC,
	[BlockerUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](max) NOT NULL,
	[IsPrivate] [bit] NOT NULL,
	[GroupDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupOwner]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupOwner](
	[GroupID] [int] NOT NULL,
	[OwnerUserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.GroupOwner] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[OwnerUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Longitude] [decimal](35, 15) NOT NULL,
	[Latitude] [decimal](35, 15) NOT NULL,
	[LocationName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[PostTitle] [nvarchar](max) NULL,
	[PostContent] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[VisibleProximity] [decimal](18, 2) NULL,
	[GroupID] [int] NULL,
	[LocationID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_dbo.Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[GroupID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Subscription] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[JoinDate] [datetime] NOT NULL,
	[ProfileDescription] [nvarchar](max) NULL,
	[UserProfileId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 9/29/2015 3:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([GroupID], [GroupName], [IsPrivate], [GroupDescription]) VALUES (1, N'Makers', 0, N'Group devoted to arts, crafts and maker activities')
INSERT [dbo].[Group] ([GroupID], [GroupName], [IsPrivate], [GroupDescription]) VALUES (2, N'Sports', 0, N'All sporting activities. Sign up if you like games and sports.')
INSERT [dbo].[Group] ([GroupID], [GroupName], [IsPrivate], [GroupDescription]) VALUES (3, N'Board games', 0, N'Chess, backgammon, Monopoly, etc.')
INSERT [dbo].[Group] ([GroupID], [GroupName], [IsPrivate], [GroupDescription]) VALUES (4, N'Drama and motion pictures', 0, N'All dramatic arts. Budding actors and directors welcome!')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [PostTitle], [PostContent], [CreationDate], [EndDate], [VisibleProximity], [GroupID], [LocationID], [UserID]) VALUES (1, N'Maker Fair', N'A fair devoted to making all manner of arts and crafts...', CAST(N'2015-09-28 00:00:00.000' AS DateTime), NULL, CAST(500.00 AS Decimal(18, 2)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [JoinDate], [ProfileDescription], [UserProfileId]) VALUES (1, N'olivia', CAST(N'2015-09-27 09:58:01.690' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [UserName], [JoinDate], [ProfileDescription], [UserProfileId]) VALUES (2, N'admin', CAST(N'2015-09-27 10:01:50.397' AS DateTime), NULL, 2)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (1, N'olivia')
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (2, N'admin')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(N'2015-09-27 08:58:01.670' AS DateTime), NULL, 1, NULL, 0, N'ALkZ1yA86gdiWGQtf0vAFzjSN0/kRTzDQNLEQjYDez6knKq5zMrs9PCiq5JMtyPWZw==', CAST(N'2015-09-27 08:58:01.670' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (2, CAST(N'2015-09-27 09:01:50.377' AS DateTime), NULL, 1, CAST(N'2015-09-27 13:35:30.440' AS DateTime), 0, N'AFUuWHSkJREnV5Q670pDUf7juf09Vxm0l+gJEwtJ0xRGr/uLoMtsaGfeQ0c1U71uCg==', CAST(N'2015-09-27 09:01:50.377' AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'Admin')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'User')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (2, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (2, 2)
/****** Object:  Index [IX_AllowedUserID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_AllowedUserID] ON [dbo].[AllowedSubscriber]
(
	[AllowedUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GroupID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_GroupID] ON [dbo].[AllowedSubscriber]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlockedPostID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlockedPostID] ON [dbo].[BlockedPost]
(
	[BlockedPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlockerUserID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlockerUserID] ON [dbo].[BlockedPost]
(
	[BlockerUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlockedUserID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlockedUserID] ON [dbo].[BlockedUser]
(
	[BlockedUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlockerUserID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlockerUserID] ON [dbo].[BlockedUser]
(
	[BlockerUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GroupID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_GroupID] ON [dbo].[GroupOwner]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OwnerUserID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_OwnerUserID] ON [dbo].[GroupOwner]
(
	[OwnerUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GroupID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_GroupID] ON [dbo].[Post]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LocationID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_LocationID] ON [dbo].[Post]
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[Post]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GroupID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_GroupID] ON [dbo].[Subscription]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[Subscription]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserProfileId]    Script Date: 9/29/2015 3:09:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserProfileId] ON [dbo].[User]
(
	[UserProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B6160CF2710E7]    Script Date: 9/29/2015 3:09:06 PM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllowedSubscriber]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AllowedSubscriber_dbo.Group_AllowedUserID] FOREIGN KEY([AllowedUserID])
REFERENCES [dbo].[Group] ([GroupID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AllowedSubscriber] CHECK CONSTRAINT [FK_dbo.AllowedSubscriber_dbo.Group_AllowedUserID]
GO
ALTER TABLE [dbo].[AllowedSubscriber]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AllowedSubscriber_dbo.User_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AllowedSubscriber] CHECK CONSTRAINT [FK_dbo.AllowedSubscriber_dbo.User_GroupID]
GO
ALTER TABLE [dbo].[BlockedPost]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlockedPost_dbo.Post_BlockerUserID] FOREIGN KEY([BlockerUserID])
REFERENCES [dbo].[Post] ([PostID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlockedPost] CHECK CONSTRAINT [FK_dbo.BlockedPost_dbo.Post_BlockerUserID]
GO
ALTER TABLE [dbo].[BlockedPost]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlockedPost_dbo.User_BlockedPostID] FOREIGN KEY([BlockedPostID])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlockedPost] CHECK CONSTRAINT [FK_dbo.BlockedPost_dbo.User_BlockedPostID]
GO
ALTER TABLE [dbo].[BlockedUser]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlockedUser_dbo.User_BlockedUserID] FOREIGN KEY([BlockedUserID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[BlockedUser] CHECK CONSTRAINT [FK_dbo.BlockedUser_dbo.User_BlockedUserID]
GO
ALTER TABLE [dbo].[BlockedUser]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BlockedUser_dbo.User_BlockerUserID] FOREIGN KEY([BlockerUserID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[BlockedUser] CHECK CONSTRAINT [FK_dbo.BlockedUser_dbo.User_BlockerUserID]
GO
ALTER TABLE [dbo].[GroupOwner]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GroupOwner_dbo.Group_OwnerUserID] FOREIGN KEY([OwnerUserID])
REFERENCES [dbo].[Group] ([GroupID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupOwner] CHECK CONSTRAINT [FK_dbo.GroupOwner_dbo.Group_OwnerUserID]
GO
ALTER TABLE [dbo].[GroupOwner]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GroupOwner_dbo.User_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupOwner] CHECK CONSTRAINT [FK_dbo.GroupOwner_dbo.User_GroupID]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Post_dbo.Group_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_dbo.Post_dbo.Group_GroupID]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Post_dbo.Location_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_dbo.Post_dbo.Location_LocationID]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Post_dbo.User_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_dbo.Post_dbo.User_UserID]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Subscription_dbo.Group_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Group] ([GroupID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_dbo.Subscription_dbo.Group_UserID]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Subscription_dbo.User_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_dbo.Subscription_dbo.User_GroupID]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_dbo.UserProfile_UserProfileId] FOREIGN KEY([UserProfileId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_dbo.User_dbo.UserProfile_UserProfileId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [HugsNotThugsApp] SET  READ_WRITE 
GO
