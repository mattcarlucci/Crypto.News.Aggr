USE [master]
GO
/****** Object:  Database [CIK_News]    Script Date: 11/09/2012 19:22:01 ******/
CREATE DATABASE [CIK_News] ON  PRIMARY 
( NAME = N'CIK_News', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CIK_News.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CIK_News_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CIK_News_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CIK_News] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CIK_News].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CIK_News] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CIK_News] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CIK_News] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CIK_News] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CIK_News] SET ARITHABORT OFF
GO
ALTER DATABASE [CIK_News] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CIK_News] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CIK_News] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CIK_News] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CIK_News] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CIK_News] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CIK_News] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CIK_News] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CIK_News] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CIK_News] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CIK_News] SET  DISABLE_BROKER
GO
ALTER DATABASE [CIK_News] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CIK_News] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CIK_News] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CIK_News] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CIK_News] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CIK_News] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CIK_News] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CIK_News] SET  READ_WRITE
GO
ALTER DATABASE [CIK_News] SET RECOVERY FULL
GO
ALTER DATABASE [CIK_News] SET  MULTI_USER
GO
ALTER DATABASE [CIK_News] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CIK_News] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'CIK_News', N'ON'
GO
USE [CIK_News]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 11/09/2012 19:22:03 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 11/09/2012 19:22:03 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[webpages_OAuthMembership] ([Provider], [ProviderUserId], [UserId]) VALUES (N'twitter', N'74188930', 3)
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 11/09/2012 19:22:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (3, CAST(0x0000A10400C99094 AS DateTime), NULL, 1, NULL, 0, N'AIlCDth8UjauzjuspslgIq4b5vyvD9OS8fl7p9xZuRXmfMbOp6cH4/ZWQMS9EzbVng==', CAST(0x0000A10400C99094 AS DateTime), N'', NULL, NULL)
/****** Object:  Table [dbo].[User]    Script Date: 11/09/2012 19:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[DisplayName] [nvarchar](200) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Role] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([Id], [UserName], [DisplayName], [Password], [Email], [Role], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (1, N'thangchung1', N'Thang Chung', N'123456', N'thangchung@ymail.com', 3, CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[User] ([Id], [UserName], [DisplayName], [Password], [Email], [Role], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (3, N'thangchung', N'thangchung', N'Ðª¾š6,²q.é	ó', N'SiteAdmin@cik.com', 2, CAST(0x0000A1040131EBF1 AS DateTime), N'SiteAdmin', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[ItemContent]    Script Date: 11/09/2012 19:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[SortDescription] [text] NOT NULL,
	[Content] [text] NOT NULL,
	[SmallImage] [varchar](200) NOT NULL,
	[MediumImage] [varchar](200) NOT NULL,
	[BigImage] [varchar](200) NOT NULL,
	[NumOfView] [bigint] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_ItemContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ItemContent] ON
INSERT [dbo].[ItemContent] ([Id], [Title], [SortDescription], [Content], [SmallImage], [MediumImage], [BigImage], [NumOfView], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (1, N'This is just demo news', N'<p>
	Police in the restive Indonesian province of Papua shoot dead separatist leader Mako Tabuni, sparking violent protests by locals.</p>
', N'<p>
	Police in the restive Indonesian province of Papua shoot dead separatist leader Mako Tabuni, sparking violent protests by locals.</p>
<p>
	cas</p>
<p>
	cas</p>
<p>
	cas</p>
<p>
	c</p>
', N'Penguins.jpg', N'news-image-med-1.jpg', N'news-image-big.jpg', 6, CAST(0x0000A07500000000 AS DateTime), N'thangchung', CAST(0x0000A07C00EC9F88 AS DateTime))
INSERT [dbo].[ItemContent] ([Id], [Title], [SortDescription], [Content], [SmallImage], [MediumImage], [BigImage], [NumOfView], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (2, N'Article title', N'Integer diam elit, condimentum ac semper ut, tincidunt non diam. Ut congue rutrum justo at commodo. Aenean euismod tincidunt lorem scelerisque euismod.', N'Integer diam elit, condimentum ac semper ut, tincidunt non diam. Ut congue rutrum justo at commodo. Aenean euismod tincidunt lorem scelerisque euismod.', N'news-image-small-1.jpg', N'news-image-med-2.jpg', N'news-image-big.jpg', 30, CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[ItemContent] ([Id], [Title], [SortDescription], [Content], [SmallImage], [MediumImage], [BigImage], [NumOfView], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (3, N'Second Article Title', N'Sed congue lacinia leo, sed dignissim odio pharetra vel. Fusce a dignissim dui. Fusce semper porttitor enim dapibus venenatis.', N'Sed congue lacinia leo, sed dignissim odio pharetra vel. Fusce a dignissim dui. Fusce semper porttitor enim dapibus venenatis.', N'news-image-small-2.jpg', N'news-image-med-3.jpg', N'news-image-big.jpg', 21, CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[ItemContent] ([Id], [Title], [SortDescription], [Content], [SmallImage], [MediumImage], [BigImage], [NumOfView], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (5, N'casca', N'cascas', N'cascas', N'Chrysanthemum.jpg', N'Desert.jpg', N'Hydrangeas.jpg', 11, CAST(0x0000A07500E184F8 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[ItemContent] ([Id], [Title], [SortDescription], [Content], [SmallImage], [MediumImage], [BigImage], [NumOfView], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (6, N'cascaca', N'<p>
	cascas</p>
', N'<p>
	cascasc</p>
', N'Chrysanthemum.jpg', N'Desert.jpg', N'Hydrangeas.jpg', 3, CAST(0x0000A07500EE544F AS DateTime), N'thangchung', NULL)
INSERT [dbo].[ItemContent] ([Id], [Title], [SortDescription], [Content], [SmallImage], [MediumImage], [BigImage], [NumOfView], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (7, N'Sample article', N'<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: normal; font-style: normal; font-size: 16px; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; vertical-align: baseline; line-height: 22px; color: rgb(51, 51, 51); font-variant: normal; letter-spacing: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	In ASP.NET MVC 2, we shipped both client- and server-side validation support. The client-side validation that we included in MVC 2 was a custom validation system written against ASP.NET Ajax. We also included an experimental version written against jQuery in the MVC Futures project.</p>
<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: normal; font-style: normal; font-size: 16px; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; vertical-align: baseline; line-height: 22px; color: rgb(51, 51, 51); font-variant: normal; letter-spacing: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	In ASP.NET MVC 3 Beta, we&rsquo;ve updated the runtime to enable a feature we&rsquo;re calling &ldquo;Unobtrusive Client Validation&rdquo;. We have also created a consumer for these unobtrusive client validation attributes that uses jQuery and jQuery Validate to perform the validation on our behalf.</p>
', N'<h3 class="entry-header" style="margin: 0px 0px 15px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: normal; font-size: 18px; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; vertical-align: baseline; line-height: 1.3; color: rgb(51, 51, 51); font-variant: normal; letter-spacing: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	Unobtrusive Client Validation in ASP.NET MVC 3</h3>
<div class="entry-content" style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: normal; font-style: normal; font-size: 14px; font-family: georgia; vertical-align: baseline; line-height: 1.5; color: rgb(51, 51, 51); font-variant: normal; letter-spacing: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	<div class="entry-body" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif !important; vertical-align: baseline; ">
		<h2 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Introduction</h2>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			In ASP.NET MVC 2, we shipped both client- and server-side validation support. The client-side validation that we included in MVC 2 was a custom validation system written against ASP.NET Ajax. We also included an experimental version written against jQuery in the MVC Futures project.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			In ASP.NET MVC 3 Beta, we&rsquo;ve updated the runtime to enable a feature we&rsquo;re calling &ldquo;Unobtrusive Client Validation&rdquo;. We have also created a consumer for these unobtrusive client validation attributes that uses jQuery and jQuery Validate to perform the validation on our behalf.</p>
	</div>
	<div class="entry-more" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif !important; vertical-align: baseline; ">
		<h2 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Disclaimer</h2>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 16px; font-family: inherit; vertical-align: baseline; ">This blog post talks about ASP.NET MVC 3 Beta, which is a pre-release version. Specific technical details may change before the final release of MVC 3. This release is designed to elicit feedback on features with enough time to make meaningful changes before MVC 3 ships, so please comment on this blog post or<span class="Apple-converted-space">&nbsp;</span><a data-bitly-type="bitly_hover_card" href="http://bradwilson.typepad.com/about.html" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; color: rgb(0, 85, 153); ">contact me</a><span class="Apple-converted-space">&nbsp;</span>if you have comments.</em></p>
		<h2 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Rendering: Traditional</h2>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			The client-side validation system in MVC 2 was decoupled from the server-side validation system through the use of JSON. With a model like this:</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px none; outline: 0px none; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px;">
			With client-side validation enabled, you get the following markup: (some unimportant HTML removed)With unobtrusive JavaScript turned off, you will get this behavior, which is the same as MVC 2. (Make sure you scroll all the way to the right, to see the extent of the JSON.)</p>
		<h2 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Rendering: Unobtrusive</h2>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			When unobtrusive Ajax mode is enabled in MVC, the HTML that we generate looks significantly different:(Again, make sure you scroll all the way to the right, to see the extent of the HTML attributes.)</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			The biggest change is obviously that we don&rsquo;t emit the JSON blob any more. Instead, we&rsquo;ve replaced the JSON with HTML 5-compatible attributes which describe the validators to be attached to the input fields. We&rsquo;ve also attached some HTML attributes to the validation message spans so that they can be related to the input field they&rsquo;re attached to. Since the HTML attributes are all directly attached to the HTML elements they affect, we were also able to get rid of several cases of auto-generated IDs that were no longer necessary.</p>
		<h2 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Enabling Unobtrusive JavaScript</h2>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			In MVC 3, we have a single flag to turn on unobtrusive JavaScript mode, which enables both unobtrusive Ajax and unobtrusive client validation. Unobtrusive JavaScript mode is turned off by default for backward compatibility with projects upgraded from MVC 1.0 and MVC 2. However, we have turned it on in the MVC 3 project template, so new projects will begin using the unobtrusive JavaScript support by default. Additionally, you will need to enable client side validation (which remains off by default).</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			To turn unobtrusive JavaScript mode on/off and enable/disable client validation by default for the entire application, you can use Web.config:</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			You can also turn them on or off with code:</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px none; outline: 0px none; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px;">
			Using code to turn these features on or off actually behaves contextually. If those lines of code are present in your Global.asax file, then it turns unobtrusive JavaScript and client validation on or off for the whole application. If they appear within your controller or view, on the other hand, it will turn the features on or off for the current action only.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			In addition to setting the flag, you will also need to include three script files: jQuery (~/Scripts/jquery-1.4.1.js), jQuery Validate (~/Scripts/jquery.validate.js) and the MVC plugin for unobtrusive client validation with jQuery Validate (~/Scripts/jquery.validate.unobtrusive.js).</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 16px; font-family: inherit; vertical-align: baseline; ">An interesting note: since there is no actual JavaScript being emitted when you use unobtrusive client validation, if you forget to include the scripts, you won&rsquo;t see any errors when loading the page; the form values will simply not validate on the client side.</em></p>
		<h2 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			How Attributes Are Generated</h2>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			When an input field has any client side validation rule attached to it, it will receive the data-val=&quot;true&quot; attribute to trigger unobtrusive client validation.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			<b>Important note:</b><span class="Apple-converted-space">&nbsp;</span>jQuery Validate requires your input elements to be inside of a &lt;form&gt; element in order to be validated. In addition, MVC 3 requires that you have called Html.BeginForm() to render this form, so that it can find its book-keeping object to help render the HTML attributes. Starting with MVC 4, we&#39;ve eliminated the need for Html.BeginForm(), but the requirement for the HTML &lt;form&gt; element is still there.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			For each client validation rule, an attribute is added with data-val-<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 16px; font-family: inherit; vertical-align: baseline; ">rulename</em>=&quot;<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 16px; font-family: inherit; vertical-align: baseline; ">message</em>&quot;. If the validators wants to the use the default client-side validation message, you can leave the attribute value as an empty string. Then, for each parameter in the client validation rule, an attribute is added with data-val-<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 16px; font-family: inherit; vertical-align: baseline; ">rulename</em>-<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 16px; font-family: inherit; vertical-align: baseline; ">paramname</em>=&quot;<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 16px; font-family: inherit; vertical-align: baseline; ">paramvalue</em>&quot;.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			For each Html.ValidationMessage call, the generated &lt;span&gt; will have data-valmsg-for=&quot;<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 16px; font-family: inherit; vertical-align: baseline; ">inputname</em>&quot; and data-valmsg-replace=&quot;true/false&quot; attached to it.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			If you call Html.ValidationSummary, the generated &lt;div&gt; will have data-valmsg-summary=&quot;true&quot; applied to it.</p>
		<h2 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Bridging HTML and jQuery Validate: Adapters</h2>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			Writing a client-side validator involves two steps: writing the validator for jQuery Validate, and writing the adapter which takes the parameter values from the HTML attributes and turns it into jQuery Validate metadata. The former topic is not in the scope of this blog post (since it&rsquo;s really not MVC specific).</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			There is an adapter collection available at jQuery.validator.unobtrusive.adapters. Hanging off the adapter collection is the adapter registration method (add) and three helpers that can be used to register very common types of adapters (addBool, addSingleVal, and addMinMax).</p>
		<h3 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Boolean validators</h3>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			The most common form of validator in jQuery Validate is a boolean validator; that is, the only data the validator needs to know is whether it&rsquo;s on or not. Examples of boolean validators in jQuery Validate include &ldquo;creditcard&rdquo;, &ldquo;date&rdquo;, &ldquo;digits&rdquo;, &ldquo;email&rdquo;, &ldquo;number&rdquo;, &ldquo;required&rdquo;, and &ldquo;url&rdquo;.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
			To automatically create an adapter for a boolean validator, you can call the following helper method:</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px none; outline: 0px none; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px;">
			<b>adapterName</b><span class="Apple-converted-space">&nbsp;</span>is the name of the adapter, and matches the name of the rule in the HTML element.</p>
		<blockquote style="margin: 0px 20px 10px; padding: 10px 0px 5px; border-width: 1px 0px; border-top-style: dotted; border-bottom-style: dotted; border-top-color: rgb(238, 238, 238); border-bottom-color: rgb(238, 238, 238); outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: arial; vertical-align: baseline; quotes: '''', ''''; color: rgb(119, 119, 119); ">
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>ruleName</b><span class="Apple-converted-space">&nbsp;</span>is the name of the jQuery Validate rule, and is optional. If it&#39;s not provided, then the adapterName is used.</p>
		</blockquote>
		<h3 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Single value validators</h3>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			A single value validator in jQuery Validate is one whose rule receives just a single value. An example of a single rule validators in jQuery Validate is &quot;accept&quot;.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			To automatically create an adapter for a single value validator, you can call the following helper method:</p>
		<div style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; ">
			<div class="syntaxhighlighter  javascript" id="highlighter_551715" style="margin: 1em 0px !important; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 1em !important; font-family: inherit; vertical-align: baseline; width: 563px; position: relative !important; overflow: auto !important; background-color: white !important; ">
				<div class="toolbar" style="margin: 0px !important; padding: 0px !important; border: none !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 10px !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-color: rgb(108, 226, 108) !important; bottom: auto !important; float: none !important; height: 11px !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: absolute !important; right: 1px !important; text-align: left !important; top: 1px !important; width: 11px !important; box-sizing: content-box !important; min-height: inherit !important; z-index: 10 !important; color: white !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
					<span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; "><a class="toolbar_item command_help help" data-bitly-type="bitly_hover_card" href="http://bradwilson.typepad.com/blog/2010/10/mvc3-unobtrusive-validation.html#" style="margin: 0px !important; padding: 1px 0px 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; color: white !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: center !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; display: block !important; text-decoration: none !important; background-position: initial initial !important; background-repeat: initial initial !important; ">?</a></span></div>
				<table border="0" cellpadding="0" cellspacing="0" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-collapse: separate; border-spacing: 0px; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: 756px; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
					<tbody style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
						<tr style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
							<td class="gutter" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 14px !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; text-align: left !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; color: rgb(175, 175, 175) !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
								<div class="line number1 index0 alt2" style="margin: 0px !important; padding: 0px 0.5em 0px 1em !important; border-width: 0px 3px 0px 0px !important; border-right-style: solid !important; border-right-color: rgb(108, 226, 108) !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; background-color: white !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: right !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; white-space: pre !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
									1</div>
							</td>
							<td class="code" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 14px !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; text-align: left !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; top: auto !important; width: 724px; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
								<div class="container" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: relative !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
									<div class="line number1 index0 alt2" style="margin: 0px !important; padding: 0px 1em !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; background-color: white !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; white-space: pre !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
										<code class="javascript plain" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; color: black !important; background-position: initial initial !important; background-repeat: initial initial !important; ">jQuery.validator.unobtrusive.adapters.addSingleVal(adapterName, attribute, [ruleName]);</code></div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<blockquote style="margin: 0px 20px 10px; padding: 10px 0px 5px; border-width: 1px 0px; border-top-style: dotted; border-bottom-style: dotted; border-top-color: rgb(238, 238, 238); border-bottom-color: rgb(238, 238, 238); outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: arial; vertical-align: baseline; quotes: '''', ''''; color: rgb(119, 119, 119); ">
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>adapterName</b><span class="Apple-converted-space">&nbsp;</span>is the name of the adapter, and matches the name of the rule in the HTML element.</p>
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>attribute</b><span class="Apple-converted-space">&nbsp;</span>is the postfix name of the HTML attribute that contains the value for the validator (for example, if the HTML attribute is data-val-myvalidator-myvalue, then the value for attribute would be &quot;myvalue&quot;).</p>
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>ruleName</b><span class="Apple-converted-space">&nbsp;</span>is the name of the jQuery Validate rule, and is optional. If it&#39;s not provided, then the adapterName is used.</p>
		</blockquote>
		<h3 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Min/max validators</h3>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			A min/max validator is actually a set of validators that represent the possibility of validating for a minimum value, a maximum value, or both. The rule you use depends on whether you have one or the other values (or both). Examples of min/max validators in jQuery Validate include &quot;min&quot;/&quot;max&quot;/&quot;range&quot; and &quot;minlength&quot;/&quot;maxlength&quot;/&quot;rangelength&quot;.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			To automatically create an adapter for a min/max validator, you can call the following helper method:</p>
		<div style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; ">
			<div class="syntaxhighlighter  javascript" id="highlighter_828200" style="margin: 1em 0px !important; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 1em !important; font-family: inherit; vertical-align: baseline; width: 563px; position: relative !important; overflow: auto !important; background-color: white !important; ">
				<div class="toolbar" style="margin: 0px !important; padding: 0px !important; border: none !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 10px !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-color: rgb(108, 226, 108) !important; bottom: auto !important; float: none !important; height: 11px !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: absolute !important; right: 1px !important; text-align: left !important; top: 1px !important; width: 11px !important; box-sizing: content-box !important; min-height: inherit !important; z-index: 10 !important; color: white !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
					<span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; "><a class="toolbar_item command_help help" data-bitly-type="bitly_hover_card" href="http://bradwilson.typepad.com/blog/2010/10/mvc3-unobtrusive-validation.html#" style="margin: 0px !important; padding: 1px 0px 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; color: white !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: center !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; display: block !important; text-decoration: none !important; background-position: initial initial !important; background-repeat: initial initial !important; ">?</a></span></div>
				<table border="0" cellpadding="0" cellspacing="0" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-collapse: separate; border-spacing: 0px; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: 748px; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
					<tbody style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
						<tr style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
							<td class="gutter" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 14px !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; text-align: left !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; color: rgb(175, 175, 175) !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
								<div class="line number1 index0 alt2" style="margin: 0px !important; padding: 0px 0.5em 0px 1em !important; border-width: 0px 3px 0px 0px !important; border-right-style: solid !important; border-right-color: rgb(108, 226, 108) !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; background-color: white !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: right !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; white-space: pre !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
									1</div>
								<div class="line number2 index1 alt1" style="margin: 0px !important; padding: 0px 0.5em 0px 1em !important; border-width: 0px 3px 0px 0px !important; border-right-style: solid !important; border-right-color: rgb(108, 226, 108) !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; background-color: white !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: right !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; white-space: pre !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
									2</div>
							</td>
							<td class="code" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 14px !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; text-align: left !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; top: auto !important; width: 716px; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
								<div class="container" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: relative !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
									<div class="line number1 index0 alt2" style="margin: 0px !important; padding: 0px 1em !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; background-color: white !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; white-space: pre !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
										<code class="javascript plain" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; color: black !important; background-position: initial initial !important; background-repeat: initial initial !important; ">jQuery.validator.unobtrusive.adapters.addMinMax(adapterName, minRuleName, maxRuleName,</code></div>
									<div class="line number2 index1 alt1" style="margin: 0px !important; padding: 0px 1em !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; background-color: white !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; white-space: pre !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
										<code class="javascript spaces" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class="javascript plain" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; color: black !important; background-position: initial initial !important; background-repeat: initial initial !important; ">minMaxRuleName, [minAttribute, [maxAttribute]]);</code></div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<blockquote style="margin: 0px 20px 10px; padding: 10px 0px 5px; border-width: 1px 0px; border-top-style: dotted; border-bottom-style: dotted; border-top-color: rgb(238, 238, 238); border-bottom-color: rgb(238, 238, 238); outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: arial; vertical-align: baseline; quotes: '''', ''''; color: rgb(119, 119, 119); ">
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>adapterName</b><span class="Apple-converted-space">&nbsp;</span>is the name of the adapter, and matches the name of the rule in the HTML element.</p>
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>minRuleName</b><span class="Apple-converted-space">&nbsp;</span>is the name of jQuery Validate rule to be used when only a minimum value is provided.</p>
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>maxRuleName</b><span class="Apple-converted-space">&nbsp;</span>is the name of jQuery Validate rule to be used when only a maximum value is provided.</p>
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>minMaxRuleName</b><span class="Apple-converted-space">&nbsp;</span>is the name of jQuery Validate rule to be used when both a minimum value and a maximum value are provided.</p>
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>minAttribute</b><span class="Apple-converted-space">&nbsp;</span>is the HTML attribute name for the minimum value, and is optional. If it is not provided, it is assumed to be &quot;min&quot;.</p>
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>maxAttribute</b><span class="Apple-converted-space">&nbsp;</span>is the HTMl attribute name for the maximum value, and is optional. If it is not provided, it is assumed to be &quot;max&quot;.</p>
		</blockquote>
		<h3 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Custom adapters for unusual validators</h3>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			If the validator you&#39;re writing doesn&#39;t match one of the patterns above, or you need to do some interesting processing on the HTML values before sending along the information to jQuery Validate, then you&#39;ll have to write your own adapter method.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			To add a custom adapter for a validator, you can call the following method:</p>
		<div style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; ">
			<div class="syntaxhighlighter  javascript" id="highlighter_429023" style="margin: 1em 0px !important; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 1em !important; font-family: inherit; vertical-align: baseline; width: 563px; position: relative !important; overflow: auto !important; background-color: white !important; ">
				<div class="toolbar" style="margin: 0px !important; padding: 0px !important; border: none !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 10px !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-color: rgb(108, 226, 108) !important; bottom: auto !important; float: none !important; height: 11px !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: absolute !important; right: 1px !important; text-align: left !important; top: 1px !important; width: 11px !important; box-sizing: content-box !important; min-height: inherit !important; z-index: 10 !important; color: white !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
					<span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; "><a class="toolbar_item command_help help" data-bitly-type="bitly_hover_card" href="http://bradwilson.typepad.com/blog/2010/10/mvc3-unobtrusive-validation.html#" style="margin: 0px !important; padding: 1px 0px 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; color: white !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: center !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; display: block !important; text-decoration: none !important; background-position: initial initial !important; background-repeat: initial initial !important; ">?</a></span></div>
				<table border="0" cellpadding="0" cellspacing="0" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-collapse: separate; border-spacing: 0px; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: 612px; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
					<tbody style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
						<tr style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
							<td class="gutter" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 14px !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; text-align: left !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; color: rgb(175, 175, 175) !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
								<div class="line number1 index0 alt2" style="margin: 0px !important; padding: 0px 0.5em 0px 1em !important; border-width: 0px 3px 0px 0px !important; border-right-style: solid !important; border-right-color: rgb(108, 226, 108) !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; background-color: white !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: right !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; white-space: pre !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
									1</div>
							</td>
							<td class="code" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 14px !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; text-align: left !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; top: auto !important; width: 580px; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
								<div class="container" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: relative !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
									<div class="line number1 index0 alt2" style="margin: 0px !important; padding: 0px 1em !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; background-color: white !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; white-space: pre !important; background-position: initial initial !important; background-repeat: initial initial !important; ">
										<code class="javascript plain" style="margin: 0px !important; padding: 0px !important; border: 0px !important; outline: 0px !important; font-weight: normal !important; font-style: normal !important; font-size: 1em !important; font-family: Consolas, ''Bitstream Vera Sans Mono'', ''Courier New'', Courier, monospace !important; vertical-align: baseline !important; border-top-left-radius: 0px !important; border-top-right-radius: 0px !important; border-bottom-right-radius: 0px !important; border-bottom-left-radius: 0px !important; background-image: none !important; bottom: auto !important; float: none !important; height: auto !important; left: auto !important; line-height: 1.1em !important; overflow: visible !important; position: static !important; right: auto !important; text-align: left !important; top: auto !important; width: auto !important; box-sizing: content-box !important; min-height: inherit !important; color: black !important; background-position: initial initial !important; background-repeat: initial initial !important; ">jQuery.validator.unobtrusive.adapters.add(adapterName, [params], fn);</code></div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<blockquote style="margin: 0px 20px 10px; padding: 10px 0px 5px; border-width: 1px 0px; border-top-style: dotted; border-bottom-style: dotted; border-top-color: rgb(238, 238, 238); border-bottom-color: rgb(238, 238, 238); outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: arial; vertical-align: baseline; quotes: '''', ''''; color: rgb(119, 119, 119); ">
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>adapterName</b><span class="Apple-converted-space">&nbsp;</span>is the name of the adapter, and matches the name of the rule in the HTML element.</p>
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>params</b><span class="Apple-converted-space">&nbsp;</span>is an array of parameter names that you&#39;re expecting in the HTML attributes, and is optional. If it is not provided, then it is presumed that the validator has no parameters.</p>
			<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
				<b>fn</b><span class="Apple-converted-space">&nbsp;</span>is a function which is called to adapt the HTML attribute values into jQuery Validate rules and messages. The function will receive a single parameter which is an options object with the following values in it:</p>
			<blockquote style="margin: 0px 20px 10px; padding: 10px 0px 5px; border-width: 1px 0px; border-top-style: dotted; border-bottom-style: dotted; border-top-color: rgb(238, 238, 238); border-bottom-color: rgb(238, 238, 238); outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: arial; vertical-align: baseline; quotes: '''', ''''; color: rgb(119, 119, 119); ">
				<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
					<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 14px; font-family: inherit; vertical-align: baseline; ">element</em><br />
					The HTML element that the validator is attached to</p>
				<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
					<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 14px; font-family: inherit; vertical-align: baseline; ">form</em><br />
					The HTML form element</p>
				<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
					<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 14px; font-family: inherit; vertical-align: baseline; ">message</em><br />
					The message string extract from the HTML attribute</p>
				<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
					<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 14px; font-family: inherit; vertical-align: baseline; ">params</em><br />
					The array of name/value pairs of the parameters extracted from the HTML attributes</p>
				<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
					<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 14px; font-family: inherit; vertical-align: baseline; ">rules</em><br />
					The jQuery rules array for this HTML element. The adapter is expected to add item(s) to this rules array for the specific jQuery Validate validators that it wants to attach. The name is the name of the jQuery Validate rule, and the value is the parameter values for the jQuery Validate rule.</p>
				<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 14px; font-family: inherit; vertical-align: baseline; line-height: 19px; ">
					<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: italic; font-size: 14px; font-family: inherit; vertical-align: baseline; ">messages</em><br />
					The jQuery messages array for this HTML element. The adapter is expected to add item(s) to this messages array for the specific jQuery Validate validators that it wants to attach, if it wants a custom error message for this rule. The name is the name of the jQuery Validate rule, and the value is the custom message to be displayed when the rule is violated.</p>
			</blockquote>
		</blockquote>
		<h2 style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-size: 16px; font-family: arial; vertical-align: baseline; ">
			Parsing New HTML For Validation</h2>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			The unobtrusive client validation script automatically parses the initial set of HTML for validation rules when the page has finished loading. If your page dynamically adds new HTML content (perhaps throught Ajax or through client-side application code), you may wish to parse that new HTML for client validation on the new HTML elements.</p>
		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 16px; font-family: inherit; vertical-align: baseline; line-height: 22px; ">
			To parse new HTML, you can call the jQuery.validator.unobtrusive.parse() method, passing it a selector for the HTML that you would like to be parsed. You can also call the jQuery.validator.unobtrusive.parseElement() function to parse a single HTML element.</p>
	</div>
</div>
<p>
	&nbsp;</p>
', N'Penguins.jpg', N'Tulips.jpg', N'Koala.jpg', 8, CAST(0x0000A07500EF93F5 AS DateTime), N'thangchung', CAST(0x0000A07C011604F6 AS DateTime))
INSERT [dbo].[ItemContent] ([Id], [Title], [SortDescription], [Content], [SmallImage], [MediumImage], [BigImage], [NumOfView], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (8, N'Trẻ bỏng nặng do người lớn bất cẩn', N'<p>
	<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none; ">B?ng l&agrave; m?t trong nh?ng nguy&ecirc;n nh&acirc;n tai n?n thuong t&iacute;ch h&agrave;ng d?u ? tr?. H?u h?t tr? b? b?ng n?ng d?u x?y ra t?i gia d&igrave;nh v&agrave; do ngu?i l?n b?t c?n.</span></p>
', N'<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	Ngh? h&egrave;, s? tr? b? b?ng d?n b?nh vi?n di?u tr? tang l&ecirc;n d&aacute;ng k?. H?u h?t tai n?n b?ng ? tr? em d?u do s? b?t c?n c?a ngu?i l?n.&nbsp;Ð?c bi?t tr? t? 1 d?n 3 tu?i. Ð? tu?i n&agrave;y tr? chua nh?n th?c du?c nh?ng tai n?n r&igrave;nh r?p xung quanh.</p>
<p class="pBody" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	T?i Khoa B?ng tr? em c?a Vi?n B?ng qu?c gia hi?n kho?ng g?n 50 b?nh nhi, 80% trong s? d&oacute; l&agrave; b?nh nh&acirc;n ? c&aacute;c v&ugrave;ng n&ocirc;ng th&ocirc;n chuy?n v?. V&agrave;o m&ugrave;a cao di?m (gi?a h&egrave;), con s? b?nh nhi di?u tr? t?i khoa c&oacute; th? l&ecirc;n d?n 60 ngu?i.</p>
<p class="pBody" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	Theo BS Nguy?n Th?ng, Tru?ng khoa B?ng B?nh vi?n Xanh P&ocirc;n, th?i di?m n&agrave;y dang di?u tr? kho?ng 40 b?nh nhi b? b?ng n?ng. H?u h?t l&agrave; do b?ng nu?c s&ocirc;i, b?ng ch&aacute;o, b?ng canh ho?c b?ng hoi c?a n?i com di?n.</p>
<p class="pBody" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	Tru?ng h?p c?a ch&aacute;u H.K 18 th&aacute;ng tu?i, ch? T ng? t?i T&acirc;y H? cho bi?t, ch? v?a d? b&aacute;t ch&aacute;o n&oacute;ng, do kh&ocirc;ng d? &yacute; n&ecirc;n ch&aacute;u H.K nh&uacute;ng c? b&agrave;n tay v&agrave;o.&nbsp;Do&nbsp; ch&aacute;o v?a b?c t? b?p, nhi?t d? qu&aacute; cao n&ecirc;n ch&aacute;u b? b?ng n?ng.</p>
<p class="pBody" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	Ch&aacute;u N.L 8 th&aacute;ng tu?i, ng? t?i Ð?ng Ða, H&agrave; N?i b? b?ng n?ng dang di?u tr? t?i BV Xanh P&ocirc;n. B&agrave; n?i b&eacute; L &acirc;n h?n k? l?i, h&ocirc;m d&oacute; ch&aacute;u L ch?y xe t?p di, s? ch&aacute;u ng&atilde;, b&agrave; M v?a c?m ph&iacute;ch v?a du?i theo, n?p ph&iacute;ch kh&ocirc;ng du?c d&oacute;ng k? n&ecirc;n c? ph&iacute;ch nu?c d? &ograve;a v&agrave;o ngu?i.</p>
<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-align: center; ">
	<img alt="Tr? b?ng n?ng do ngu?i l?n b?t c?n, S?c kh?e d?i s?ng, Tre bong, tai nan, tre mang hoa, benh nhi, bong nuoc soi, bong chao, bong canh, bong hoi noi com dien, bong chao, suc khoe, bao." class="news-image" src="http://us.24h.com.vn/upload/2-2012/images/2012-06-19/1340073952-bong1.jpg" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; border: 0px; " /></p>
<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-align: center; font-style: italic; color: rgb(0, 0, 255); ">
	Tr? b? b?ng n?ng dang di?u tr? t?i Khoa B?ng, B?nh vi?n Xanh P&ocirc;n. (?nh. Thu Tr?nh)</p>
<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	M&ugrave;a h&egrave;, tr? du?c ? nh&agrave; c&ugrave;ng gia d&igrave;nh nhung do ngu?i l?n m?i l&agrave;m vi?c ho?c kh&ocirc;ng d? ph&ograve;ng du?c nh?ng nguy co b?t ng? g&acirc;y b?ng cho tr? nhu d? b&aacute;t canh n&oacute;ng g?n ch? tr? choi, d?t n?i com di?n dang s&ocirc;i du?i n?n nh&agrave;&hellip; ch? c?n m?t ph&uacute;t ngu?i l?n b?t c?n, tr? d&atilde; c&oacute; th? b? b?ng.</p>
<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	Theo BS Nguy?n Th?ng, di?u d&aacute;ng lo l&agrave; c&oacute; d?n g?n m?t n?a s? tr? b? b?ng n?m vi?n d? l?i di ch?ng tr&ecirc;n co th?. Nhi?u tru?ng h?p tr? b? b?ng s&acirc;u ph?i c?y gh&eacute;p da. Ph?n l?n tr? b? b?ng n?ng l&agrave; do gia d&igrave;nh kh&ocirc;ng bi?t c&aacute;ch so c?u cho tr?.</p>
<p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
	Ch?ng ki?n nhi?u tai n?n b?ng thuong t&acirc;m ? tr? t?i B?nh vi?n&nbsp;Xanh P&ocirc;n, BS. Nguy?n Th?ng khuy?n c&aacute;o cho c&aacute;c b?c ph? huynh: C&aacute;ch t?t nh?t d? gi?m nhi?t cho v&ugrave;ng b? b?ng l&agrave; ng&acirc;m ho?c d?i nu?c s?ch, nu?c dun s&ocirc;i d? ngu?i nh?m h?n ch? v?t thuong kh&ocirc;ng an s&acirc;u v&agrave;o b&ecirc;n trong; kh&ocirc;ng d&ugrave;ng d&aacute; l?nh d? chu?m v&igrave; tr? c&oacute; th? b? b?ng l?nh.</p>
', N'Penguins.jpg', N'Lighthouse.jpg', N'Koala.jpg', 6, CAST(0x0000A075011A3AAF AS DateTime), N'thangchung', NULL)
SET IDENTITY_INSERT [dbo].[ItemContent] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 11/09/2012 19:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (1, N'Sport', CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (2, N'Fashion', CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (3, N'Books', CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (4, N'Politics', CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (5, N'Movies', CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (6, N'Music', CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (7, N'News', CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (8, N'Culture', CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 11/09/2012 19:22:04 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/09/2012 19:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Id] [int] NOT NULL,
	[ItemContentId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON
INSERT [dbo].[Item] ([Id], [Category_Id], [ItemContentId], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (1, 1, 1, CAST(0x0000A07500000000 AS DateTime), N'thangchung', CAST(0x0000A07C00EC9F88 AS DateTime))
INSERT [dbo].[Item] ([Id], [Category_Id], [ItemContentId], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (2, 1, 2, CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[Item] ([Id], [Category_Id], [ItemContentId], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (5, 1, 3, CAST(0x0000A07500000000 AS DateTime), N'thangchung', NULL)
INSERT [dbo].[Item] ([Id], [Category_Id], [ItemContentId], [CreatedDate], [CreatedBy], [ModifiedDate]) VALUES (8, 7, 7, CAST(0x0000A07500EF93F5 AS DateTime), N'thangchung', CAST(0x0000A07C011604F6 AS DateTime))
SET IDENTITY_INSERT [dbo].[Item] OFF
/****** Object:  Default [DF__webpages___IsCon__0EA330E9]    Script Date: 11/09/2012 19:22:03 ******/
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
/****** Object:  Default [DF__webpages___Passw__0F975522]    Script Date: 11/09/2012 19:22:03 ******/
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
/****** Object:  ForeignKey [fk_RoleId]    Script Date: 11/09/2012 19:22:04 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
/****** Object:  ForeignKey [fk_UserId]    Script Date: 11/09/2012 19:22:04 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
/****** Object:  ForeignKey [FK_Item_Category]    Script Date: 11/09/2012 19:22:04 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
/****** Object:  ForeignKey [FK_Item_ItemContent]    Script Date: 11/09/2012 19:22:04 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemContent] FOREIGN KEY([ItemContentId])
REFERENCES [dbo].[ItemContent] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemContent]
GO
