USE [master]
GO
/****** Object:  Database [QLDH]    Script Date: 12/6/2021 2:09:28 PM ******/
CREATE DATABASE [QLDH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLBH.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLBH_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLDH] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLDH] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLDH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLDH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLDH] SET  MULTI_USER 
GO
ALTER DATABASE [QLDH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLDH', N'ON'
GO
USE [QLDH]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 12/6/2021 2:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[boardnew]    Script Date: 12/6/2021 2:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boardnew](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[image_link] [nvarchar](4000) NOT NULL,
	[author] [nvarchar](50) NOT NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[catalog]    Script Date: 12/6/2021 2:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catalog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[parent_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ordered]    Script Date: 12/6/2021 2:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordered](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[transaction_id] [int] NOT NULL,
	[qty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 12/6/2021 2:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[catalog_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [nvarchar](20) NOT NULL,
	[status] [int] NOT NULL,
	[description] [nvarchar](4000) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[discount] [int] NULL,
	[image_link] [nvarchar](4000) NOT NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[review]    Script Date: 12/6/2021 2:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[created] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[transactions]    Script Date: 12/6/2021 2:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_session] [nvarchar](50) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_mail] [nvarchar](50) NOT NULL,
	[user_phone] [nvarchar](20) NOT NULL,
	[address] [nvarchar](300) NOT NULL,
	[message] [nvarchar](4000) NOT NULL,
	[amount] [nvarchar](20) NOT NULL,
	[payment] [nvarchar](30) NOT NULL,
	[status] [nvarchar](30) NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 12/6/2021 2:09:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [username], [password], [name]) VALUES (1, N'admin', N'123456', N'Hồng Yến')
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[boardnew] ON 

INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created]) VALUES (1, N'Khắc lên yêu thương cùng Henry London – Ưu đãi 30% toàn bộ đồng hồ mùa cuối năm', N'Những ngày cuối năm bộn bề công việc nhưng bạn hãy dành thời gian để lựa chọn cho mình cùng người yêu thương một chiếc đồng hồ thật nhiều ý nghĩa.<br>

Thương hiệu đồng hồ Anh Quốc Henry London dành ưu đãi khủng thay lời tri ân đến hàng triệu khách hàng đã tin tưởng và lựa chọn đồng hành suốt thời gian qua. Khách hàng sẽ được GIẢM NGAY 30% trên tổng hóa đơn khi mua đồng hồ Henry London từ nay đến hết ngày 2/1/2021.<br>
Chiếc đồng hồ sẽ mang ý nghĩa vô cùng đặc biệt khi được khắc laser lên mặt sau thông điệp yêu thương gửi tặng đến những người thân yêu nhất của mình. Đây sẽ là món quà vô cùng ý nghĩa cho chính mình và những người thân.<br>
Những lý do bạn nên mua đồng hồ Anh Quốc Henry London khắc laser<br>
Thể hiện sở hữu độc quyền: Chiếc đồng hồ là duy nhất trên đời, không  trùng với bất kì chiếc nào khác bởi nó được khắc lên thông điệp độc đáo của bạn<br>
Quà tặng sinh nhật: Món quà sinh nhật ý nghĩa gửi tặng sinh nhật bạn bè và người thân<br>
Quà tặng cha mẹ: Thể hiện tình cảm với cha mẹ chỉ với những câu tự đơn giản<br>
Quà tặng người yêu: Thể hiện tình cảm với người thương bằng thông điệp khắc lên chiếc đồng hồ', N'blog_1.jpg', N'Thịnh Dương', CAST(0x0F430B00 AS Date))
INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created]) VALUES (2, N'Phát hiện loại rau củ chứa chất chữa được bệnh nan y', N'Rau củ "siêu giàu" vitamin A đã giúp các nhà khoa học tạo ra thuốc chữa. <br><br>Điều đáng ngạc nhiên là chất cơ bản để họ tạo nên "thần dược" này lại là axit retinoic, một chất rất dễ tìm kiếm trong tự nhiên. Axit retinoic là hóa chất được tạo ra trong quá trình cơ thể chúng ta phân hủy vitamin A "siêu nạp" – được tìm thấy trong các loại rau củ được biết đến rất giàu vitamin A như cà rốt hay các loại rau mầm như cải brussel.<br><br>Theo các tác giả, axit retinoic là một hóa chất cực kỳ tốt cho hệ thần kinh. Khi được ứng dụng vào thuốc, nó có thể đem lại tác động mạnh mẽ hơn nhiều so với cách ăn trực tiếp và sẽ có tác dụng chữa bệnh. <br><br>Giáo sư Peter McCaffery, đến từ Đại học Aberdeen, thành viên nhóm nghiên cứu mô tả thuốc như một phiên bản khuyếch đại những gì mà quá trình phân hủy vitamin A đã tạo ra cho cơ thể. <br><br>Với cách ăn trực tiếp, các loại rau củ giàu vitamin A chỉ dừng lại ở mức tăng cường sức khỏe mắt, hệ thần kinh, ngăn ngừa các nguy cơ bệnh tật, hỗ trợ điều trị… chưa thể tác động mạnh mẽ như một loại thuốc thực sự. <br><br>Axit retinoic kích thích khả năng tái tạo các dây thần kinh và tế bào não, vì vậy ngoài Alzheimer, họ còn định ứng dụng hóa chất kỳ diệu này làm thuốc chữa bệnh Parkinson và một số bệnh thần kinh vận động khác.<br><br>Dự án có giá trị lên đến 250.000 bảng Anh và đã được thực hiện suốt 2 năm qua. Nhóm nghiên cứu cho biết hóa chất họ tạo nên đang trong giai đoạn kiểm tra lần cuối. Sẽ cần thêm một số thủ tục để nó được ứng dụng ra thị trường. Chi tiết nghiên cứu sẽ được công bố trên tạp chí khoa học trong năm tới.', N'blog_2.jpg', N'Lê Thạch', CAST(0x1E410B00 AS Date))
INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created]) VALUES (3, N'Văn Anh tặng đồng hồ cho Tú Vi', N'– Nữ diễn viên khá bất ngờ khi nhận được chiếc đồng hồ in dòng chữ ‘VA love TV’ từ ông xã khi tham dự sự kiện vào tối ngày 5/12.<br>

Sau gần hai năm kết hôn, Vân Anh và Tú Vi vẫn đang tận hưởng cuộc sống vợ chồng son. Cặp đôi luôn dành cho nhau những cử chỉ âu yếm, sự quan tâm mỗi khi xuất hiện trước công chúng.<br>
Trong buổi ra mắt thương hiệu đồng hồ cao cấp Henry London tại Việt Nam vào tối ngày 5/12, Văn Anh bất ngờ tặng Tú Vi chiếc đồng hồ in dòng chữ “VA love TV” thể hiện tình yêu và sự quan tâm dành cho vợ. Tú Vi chia sẻ, đây là lần đầu tiên cả hai đeo đồng hồ đôi được khắc chữ theo ý muốn, lưu giữ kỷ niệm hạnh phúc trong hôn nhân của họ.<br>
Ngoài đồng hồ đôi, chàng diễn viên đa tài còn hát tặng vợ ca khúc “Giấc mơ ngọt ngào” trước đám đông. Anh hài hước cho biết: “Đây là bài hát rất mới với Tú Vi. Tôi hát không hay nhưng hôm nay quyết lên sân khấu làm liều, thử làm ca sĩ một hôm. Tôi hát dở, mọi người đừng chê, còn nếu mọi người chê, tôi sẽ hát tới sáng luôn”. Tú Vi chia sẻ đây không phải lần đầu tiên cô được chồng hát tặng nhưng là lần đầu, anh hát trọn vẹn một bài. Hai lần trước, anh đều chỉ hát nửa bài. Vì vậy, cô cảm thấy rất xúc động.<br>
Chiếc đồng hồ Văn Anh tặng Tú Vi có khắc dòng chữ ý nghĩa. Văn Anh tiết lộ anh rất thích đồng hồ nhưng bà xã thì ngược lại. Tú Vi chia sẻ đây là lần đầu cô đeo đồng hồ vì đó là món quà chồng tặng.<br>
Sự kiện có sự xuất hiện của Diễn viên Mai Thu Huyền với tư cách khách mời và MC của chương trình. Thông điệp “trao yêu thương” mà thương hiệu này truyền tải đã khiến nữ diễn viên quyết định đặt bộ đồng hồ cho gia đình nhỏ của mình.<br>', N'blog_3.jpg', N'Lan Ngọc', CAST(0x8B420B00 AS Date))
INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created]) VALUES (4, N'Diễn viên Hiếu Nguyễn chia sẻ bí quyết lựa chọn đồng hồ đẳng cấp Henry London', N'Tối qua, diễn viên Hiếu Nguyễn xuất hiện chỉnh chu và phong độ tại sự kiện ra mắt thương hiệu đồng hồ Henry London tại TPHCM. Được biết, anh chính là gương mặt đại diện cho dòng đồng hồ lịch lãm và đẳng cấp này.<br>

Tối 05/12/2017 vừa qua, Công TNHH TM&DV Thời gian là đã tổ chức sự kiện khai trương đánh dấu sự có mặt lần đầu tiên của thương hiệu Henry London tại Việt Nam. Không chỉ dừng lại ở việc tổ chức một buổi ra mắt thương hiệu thông thường, mà nhà phân phối còn tổ chức một bữa tiệc sôi nổi đậm chất sang trọng, quý phái mang phong cách Châu Âu. Sự kiện đã thu hút được sự quan tâm của nhiều nghệ sỹ tên tuổi như: diễn viên Mai Thu Huyền, cặp đôi Văn Anh – Tú Vi, diễn viên Hiếu Nguyễn, nhóm ca An Nhiên, doanh nhân Lâm Minh Chánh,… cùng nhiều đơn vị báo đài và đặc biệt là quý khách hàng, những người yêu thích thương hiệu đồng hồ Henry London đã đến tham dự.<br>

Là một trong những thương hiệu đồng hồ được ưa chuộng nhất hiện nay không chỉ tại châu Á mà cả Châu Âu với phong cách lịch lãm, đồng hồ Henry London đã mang đến một hơi hướng hoàn toàn mới về phong cách thời trang tại Việt Nam. Diễn viên Hiếu Nguyễn cũng chia sẻ, ngay lần đầu được may mắn chạm tay đến chiếc đồng hồ này, mà đặc biệt là nhận được sự quan tâm chân thành của chị Hải Yến – đại diện đơn vị phân phối độc quyền Henry London tại Việt Nam, lập tức anh đã bị thuyết phục về sự đẳng cấp và thanh lịch toát lên từ vẻ ngoại của chiếc đồng hồ này.<br>
Diễn viên Hiếu Nguyễn tiết lộ bí quyết lựa chọn dòng đồng hồ Henry London.<br>
Cũng trong sự kiện, nhà phân phối chính thức thương hiệu đồng hồ Henry London cũng đã giới thiệu và trưng bày bộ sưu tập đồng hồ mới nhất thể hiện sự đa dạng và chiều sâu trong cách thời trang lịch lãm sang trọng hay phong cách thời trang dạo phố. Bộ sưu tập đồng hồ này hội ngộ sự đa dạng trong thiết kế.<br>

Sự ra đời của thương hiệu Henry London luôn được truyền tụng như một giai thoại hấp dẫn và truyền cảm hứng đến nhiều đời sau. Vào một ngày cuối tuần, hai thành viên trong nhóm đã khám phá ra những gian hàng mang đậm phong cách cổ điển ngay tại con đường nổi tiếng của nước Anh – Portobello – nơi mà họ đã tìm ra chiếc đồng hồ cơ học cổ điển có từ giữa thế kỷ trước. Mặc dù bị tàn phá ít nhiều bởi sức mạnh của thời gian, họ vẫn bị quyến rũ bởi sự khéo léo, sự tinh xảo đến từng chi tiết và mang đậm dấu ấn của thời đại.<br>

Lấy cảm hứng từ chiếc đồng hồ vintage cổ, các nhà thiết kế của Henry London đã sử dụng công nghệ tiên tiến để tạo ra bộ sưu tập đồng hồ với độ chính xác cao, vượt xa người tiền nhiệm giữa thế kỷ, nhưng vẫn độc đáo và sang trọng trong kiểu dáng. Một trong những điểm đặc biệt của Henry London là đặc tính có thể khắc thông điệp yêu thương lên mặt sau đồng hồ bằng máy khắc hay thủ công. Chính vì thế, chiếc đồng hồ trở thành món quà đặc biệt bạn gửi tặng đến người thân như nhân viên tặng sếp, con tặng ba mẹ, bạn bè với bạn bè cũng như các cặp đôi tình nhân để nhắc nhở họ về con đường chinh phục thành công trong tương lai.<br>
Đồng hồ Henry London sử dụng mặt kính acrylic, cho phép đánh bóng thành công bất kì vết trầy xước nhỏ nào, giúp bạn khôi phục như mới chiếc đồng hồ mình yêu thích. Mỗi chiếc đồng hồ được chế tạo từ nguyên liệu cao cấp như máy Nhật, pin Nhật, thép không gỉ và đặc biệt là đá Swarovski. Đối với sắc màu vàng hay đồng, Henry London sử dụng công nghệ mạ ion chân không, giúp đồng hồ lưu giữ được màu sắc óng ánh trong nhiều năm. Bên cạnh đó, khả năng chống thấm nước 3ATM, cơ kính cứng khoáng cũng góp phần hoàn thiện cho sự hoàn hảo của đồng hồ Henry London.', N'blog_4.jpg', N'Kim Vy', CAST(0x8B420B00 AS Date))
SET IDENTITY_INSERT [dbo].[boardnew] OFF
SET IDENTITY_INSERT [dbo].[catalog] ON 

INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (1, N'Đồng Hồ Nam', 1)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (2, N'Đồng Hồ Nữ', 1)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (3, N'Đồng Hồ Cặp Đôi', 1)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (4, N'Phụ Kiện Đồng Hồ', 1)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (5, N'Đồng Hồ Sale', 1)
SET IDENTITY_INSERT [dbo].[catalog] OFF
SET IDENTITY_INSERT [dbo].[ordered] ON 

INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (4, 2, 5, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (5, 1, 6, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (6, 4, 7, 1)
SET IDENTITY_INSERT [dbo].[ordered] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (1, 1, N'ĐỒNG HỒ NAM JIUSKO J039L-AZ1WWW (BẠC)', N'2160.000', 1, N'THƯƠNG HIỆU JIUSKO Thương hiệu đồng hồ JIUSKO được ra mắt thị trường vào năm 2002 và được đăng ký thương hiệu lần đầu tiên tại HONGKONG. Chỉ sau 1 năm ra mắt JIUSKO đã trở thành thương hiệu lớn mang tầm quốc tế. Đây là một trong những thương hiệu của nhà máy Guangzhou yonghong watch Technology Development Co., Ltd nổi tiếng có trụ sở tại trung quốc. JIUSKO ra đời tạo nên sự khác biệt so với các dòng đồng hồ khác bởi các bộ phận chi tiết dù là nhỏ nhất cũng được làm từ các nguyên vật liệu cao cấp như: toàn bộ là máy nhật, thép không gỉ SS306, kính sappire cao cấp chống xước tuyện đối…. Với mong muốn đưa đến khách hàng một sản phẩm chất lượng, ngang tầm với các hãng đồng hồ danh tiếng lâu đời từ thụy sỹ bằng một mức giá phải chăng, hợp lý. Những người thợ chế tác đồng hồ được hãng đào tạo nâng cao tại Nhật Bản, Thụy Sỹ để có tay nghể tốt nhất, mang đến cho khách hàng những sản phẩm ưu việt và vượt trội. Đồng thời từng bước nâng tầm JIUSKO thành một thương hiệu lớn mang tính quốc tế. Đặc biệt hơn nữa, với sự quản lý chất lượng chăm sóc khách hàng và hậu mãi dịch vụ được quản lý bởi bộ phận cao cấp theo tiêu chuẩn quốc tế đặt tại New York mang lại sự hài long cho quý khách về chất lượng và dịch vụ.', N'Thương hiệu: JIUSKO. <br>
Mã sản phẩm: J0393L-AZ1WWW ( Bạc).<br>
 Dành cho: Sinh viên, nam nhân viên văn phòng, doanh nhân. <br>
Chất liệu dây: Dây kim loại.<br>
 Chất liệu mặt kính: Kính Sapphire.<br>
 Kích thước bề mặt: 4cm,  40mm (Mặt tròn).<br>
 Độ dày: 0.8 cm ( 8mm). <br>
Tổng độ dài của dây: 22cm. <br>
Độ rộng của dây: 2cm. <br>
Chất liệu vỏ máy: Thép chống gỉ. <br>
Máy: Japan. <br>
Khả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. <br>
Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội. <br>
Bảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành.', 0, N'J039L-AZ1WWW.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (2, 1, N'Đ.HỒ NAM JIUSKO JEL0279L-RG0107(NÂU)', N'1098.000', 1, N'THƯƠNG HIỆU JIUSKO Thương hiệu đồng hồ JIUSKO được ra mắt thị trường vào năm 2002 và được đăng ký thương hiệu lần đầu tiên tại HONGKONG. Chỉ sau 1 năm ra mắt JIUSKO đã trở thành thương hiệu lớn mang tầm quốc tế. Đây là một trong những thương hiệu của nhà máy Guangzhou yonghong watch Technology Development Co., Ltd nổi tiếng có trụ sở tại trung quốc. JIUSKO ra đời tạo nên sự khác biệt so với các dòng đồng hồ khác bởi các bộ phận chi tiết dù là nhỏ nhất cũng được làm từ các nguyên vật liệu cao cấp như: toàn bộ là máy nhật, thép không gỉ SS306, kính sappire cao cấp chống xước tuyện đối…. Với mong muốn đưa đến khách hàng một sản phẩm chất lượng, ngang tầm với các hãng đồng hồ danh tiếng lâu đời từ thụy sỹ bằng một mức giá phải chăng, hợp lý. Những người thợ chế tác đồng hồ được hãng đào tạo nâng cao tại Nhật Bản, Thụy Sỹ để có tay nghể tốt nhất, mang đến cho khách hàng những sản phẩm ưu việt và vượt trội. Đồng thời từng bước nâng tầm JIUSKO thành một thương hiệu lớn mang tính quốc tế. Đặc biệt hơn nữa, với sự quản lý chất lượng chăm sóc khách hàng và hậu mãi dịch vụ được quản lý bởi bộ phận cao cấp theo tiêu chuẩn quốc tế đặt tại New York mang lại sự hài long cho quý khách về chất lượng và dịch vụ.', N'Thương hiệu: JIUSKO<br>

Mã sản phẩm: J0392S-AZ1RBW (Xanh)<br>

Dành cho: Sinh viên, nam nhân viên văn phòng, doanh nhân<br>

Chất liệu dây: Dây da<br>

Chất liệu mặt kính: Kính Sapphire<br>

Chất liệu vỏ máy: Thép chống gỉ<br>

Máy: Japan.<br>

Khả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>

Bảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành.', 0, N'JEL0279L-RG0107.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (3, 1, N'ĐỒNG HỒ NAM JIUSKO J0401L-BZ1RBB (XANH)', N'1161.000', 1, N'THƯƠNG HIỆU JIUSKO Thương hiệu đồng hồ JIUSKO được ra mắt thị trường vào năm 2002 và được đăng ký thương hiệu lần đầu tiên tại HONGKONG. Chỉ sau 1 năm ra mắt JIUSKO đã trở thành thương hiệu lớn mang tầm quốc tế. Đây là một trong những thương hiệu của nhà máy Guangzhou yonghong watch Technology Development Co., Ltd nổi tiếng có trụ sở tại trung quốc. JIUSKO ra đời tạo nên sự khác biệt so với các dòng đồng hồ khác bởi các bộ phận chi tiết dù là nhỏ nhất cũng được làm từ các nguyên vật liệu cao cấp như: toàn bộ là máy nhật, thép không gỉ SS306, kính sappire cao cấp chống xước tuyện đối…. Với mong muốn đưa đến khách hàng một sản phẩm chất lượng, ngang tầm với các hãng đồng hồ danh tiếng lâu đời từ thụy sỹ bằng một mức giá phải chăng, hợp lý. Những người thợ chế tác đồng hồ được hãng đào tạo nâng cao tại Nhật Bản, Thụy Sỹ để có tay nghể tốt nhất, mang đến cho khách hàng những sản phẩm ưu việt và vượt trội. Đồng thời từng bước nâng tầm JIUSKO thành một thương hiệu lớn mang tính quốc tế. Đặc biệt hơn nữa, với sự quản lý chất lượng chăm sóc khách hàng và hậu mãi dịch vụ được quản lý bởi bộ phận cao cấp theo tiêu chuẩn quốc tế đặt tại New York mang lại sự hài long cho quý khách về chất lượng và dịch vụ.', N'Thương hiệu: JIUSKO<br>

Mã sản phẩm: J0401L-BZ1RBB<br>

Dành cho: Sinh viên, nam nhân viên văn phòng, doanh nhân<br>

Chất liệu dây: Dây da<br>

Chất liệu mặt kính: Kính Sapphire<br>

Chất liệu vỏ máy: Thép chống gỉ<br>

Máy: Japan.<br>

Khả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>

Bảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành.', 0, N'J0401L-BZ1RBB.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (4, 1, N'ĐỒNG HỒ NAM HENRY LONDON HL41-JS-0188 CHISWICK', N'2911.000', 1, N'Tên model: HL41-JS-0188.', N'Thương hiệu: Henry London / Anh Quốc.<br>
Xem thêm thông tin thương hiệu: Tại đây.<br>
Tên bộ sưu tập: Chiswick.<br>
Giới tính: Nam Giới.<br>
Vỏ đồng hồ: Thép không gỉ.<br>
Màu viền: Công nghệ mạ vàng IPG Pale Hamiton chân không, màu vàng sáng khác biệt, được nhiều khách hàng yêu thích.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 41mm.<br>
Độ dày mặt: 10mm.<br>
Loại mặt kính: Kính Acrylic lồi chuyên dụng trong dòng đồng hồ thời đầu Omega, rolex , công dụng nhẹ, rõ, kháng va đập tốt, trầy xước có thể lau chùi hết.<br>
Kiểu hiển thị: Kim, Analogue.<br>
Chức năng lịch: Có.<br>
Pin: Số lượng 1 pin, pin SR621sw – Made In Janpan. 2-3 năm sử dụng.<br>
Máy: VJ76BE2.<br>
Dây: Dây da bò, màu nâu.<br>
Khóa / Clasp: Loại gài và khóa.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng, bảo hành kích hoạt code điện tử SMS, Miễn phí thay pin chọn đời, Miễn phí thay pin 5 năm tại tại trung tâm bảo hành cả nước.”', 0, N'HL41-JS-0188.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (5, 1, N'ĐỒNG HỒ NAM HENRY LONDON HL39-M-0008 WESTMINSTER', N'3139.000', 1, N'Tên model: HL39-M-0008', N'Thương hiệu: Henry London / Anh Quốc.<br>
Xem thêm thông tin thương hiệu: Tại đây.<br>
Tên bộ sưu tập: Westminster.<br>
Giới tính: Nam giới.<br>
Vỏ đồng hồ: Thép không gỉ<br>
Màu viền: Công nghệ mạ vàng IPG Pale Hamiton chân không được nhiều khách hàng yêu thích.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 38.5mm.<br>
Độ dày mặt: 8mm.<br>
Loại mặt kính: Kính Acrylic lồi chuyên dụng trong dòng đồng hồ thời đầu cổ Omega, rolex , công dụng nhẹ, rõ, kháng va đập tốt, trầy xước có thể lau chùi hết.<br>
Kiểu hiển thị:  Kim, Analogue.<br>
Chức năng lịch: Có.<br>
Pin: Số lượng 1 pin, pin SR626sw made in Japan, 2-3 năm sử dụng.<br>
Máy: 2315 – Make in japan.<br>
Dây: Kiểu Thời Trang.<br>
Chất liệu dây: Thép không gỉ.<br>
Khóa / Clasp: Loại thanh trượt tăng đơ, free size, ko cần cắt.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng, bảo hành kích hoạt code điện tử SMS, Miễn phí thay pin chọn đời, Miễn phí thay pin 5 năm tại tại trung tâm bảo hành cả nước.”', 0, N'HL39-M-0008.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (6, 1, N'ĐỒNG HỒ NAM JIUSKO J0383L-BZ2RQQ (XANH)', N'1784.000', 1, N'THƯƠNG HIỆU JIUSKO Thương hiệu đồng hồ JIUSKO được ra mắt thị trường vào năm 2002 và được đăng ký thương hiệu lần đầu tiên tại HONGKONG. Chỉ sau 1 năm ra mắt JIUSKO đã trở thành thương hiệu lớn mang tầm quốc tế. Đây là một trong những thương hiệu của nhà máy Guangzhou yonghong watch Technology Development Co., Ltd nổi tiếng có trụ sở tại trung quốc. JIUSKO ra đời tạo nên sự khác biệt so với các dòng đồng hồ khác bởi các bộ phận chi tiết dù là nhỏ nhất cũng được làm từ các nguyên vật liệu cao cấp như: toàn bộ là máy nhật, thép không gỉ SS306, kính sappire cao cấp chống xước tuyện đối…. Với mong muốn đưa đến khách hàng một sản phẩm chất lượng, ngang tầm với các hãng đồng hồ danh tiếng lâu đời từ thụy sỹ bằng một mức giá phải chăng, hợp lý. Những người thợ chế tác đồng hồ được hãng đào tạo nâng cao tại Nhật Bản, Thụy Sỹ để có tay nghể tốt nhất, mang đến cho khách hàng những sản phẩm ưu việt và vượt trội. Đồng thời từng bước nâng tầm JIUSKO thành một thương hiệu lớn mang tính quốc tế. Đặc biệt hơn nữa, với sự quản lý chất lượng chăm sóc khách hàng và hậu mãi dịch vụ được quản lý bởi bộ phận cao cấp theo tiêu chuẩn quốc tế đặt tại New York mang lại sự hài long cho quý khách về chất lượng và dịch vụ.', N'Thương hiệu: JIUSKO <br>

Mã sản phẩm: J0383L-BZ2RQQ (Xanh)<br>

Dành cho: Sinh viên, nam nhân viên văn phòng, doanh nhân<br>

Chất liệu dây: Dây da<br>

Chất liệu mặt kính: Kính Sapphire<br>

Chất liệu vỏ máy: Thép chống gỉ<br>

Máy: Japan.<br>

Khả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>

Bảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành.

', 0, N'J0383L-BZ2RQQ.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (7, 1, N'ĐỒNG HỒ NAM VC-047MC VALENCE HÀN QUỐC', N'3129.000', 1, N'ĐỒNG HỒ NAM VC-047MC VALENCE HÀN QUỐC DÂY DA AUTOMATIC (CƠ TỰ ĐỘNG) (ĐEN VÀNG)', N'Thương hiệu: Valence – Hàn Quốc<br>

Mã sản phẩm: VC-047 (Đen Vàng)<br>

Dành cho: Sinh viên, nam nhân viên văn phòng, doanh nhân<br>

Chất liệu dây: Dây da Genuine Leather bền bỉ<br>

Chất liệu mặt kính: Kính cứng cao cấp<br>

Kích thước bề mặt: 3,8cm (Mặt tròn)<br>

Độ dày: 1,1cm<br>

Tổng độ dài của dây: 24cm<br>

Độ rộng của dây: 2cm<br>

Chất liệu vỏ máy: Thép chống gỉ<br>

Máy: Cơ<br>

Khả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>

Bảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành.', 0, N'VC-047MC.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (8, 1, N'ĐỒNG HỒ NAM VC-047MB VALENCE HÀN QUỐC', N'3129.000', 1, N'ĐỒNG HỒ NAM VC-047MB VALENCE HÀN QUỐC DÂY DA AUTOMATIC (CƠ TỰ ĐỘNG) (NÂU BẠC)', N'Thương hiệu: Valence – Hàn Quốc<br>

Mã sản phẩm: VC-047 (Nâu Bạc)<br>

Dành cho: Sinh viên, nam nhân viên văn phòng, doanh nhân<br>

Chất liệu dây: Dây da Genuine Leather bền bỉ<br>

Chất liệu mặt kính: Kính cứng cao cấp<br>

Kích thước bề mặt: 3,8cm (Mặt tròn)<br>

Độ dày: 1,1cm<br>

Tổng độ dài của dây: 24cm<br>

Độ rộng của dây: 2cm<br>

Chất liệu vỏ máy: Thép chống gỉ<br>

Máy: Cơ<br>

Khả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>

Bảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành.

', 0, N'VC-047MB.jpg', CAST(0x2E430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (9, 2, N'ĐỒNG HỒ NỮ VC-047LC VALENCE HÀN QUỐC', N'3219.000', 1, N'ĐỒNG HỒ NỮ VC-047LC VALENCE HÀN QUỐC DÂY DA AUTOMATIC (CƠ TỰ ĐỘNG) (ĐEN VÀNG)', N'Thương hiệu: Valence – Hàn Quốc<br>

Mã sản phẩm: VC-047 (Đen Vàng)<br>

Dành cho: Sinh viên, nhân viên văn phòng, doanh nhân<br>

Chất liệu dây: Dây da Genuine Leather bền bỉ<br>

Chất liệu mặt kính: Kính cứng cao cấp<br>

Kích thước bề mặt:<br>

Độ dày: <br>

Tổng độ dài của dây:<br>

Độ rộng của dây: <br>

Chất liệu vỏ máy: Thép chống gỉ<br>

Máy: Cơ<br>

Khả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>

Bảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành.', 0, N'VC-047LC.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (10, 2, N'ĐỒNG HỒ NỮ VC-047LD VALENCE HÀN QUỐC', N'3219.000', 1, N'ĐỒNG HỒ NỮ VC-047LD VALENCE HÀN QUỐC AUTOMATIC (CƠ TỰ ĐỘNG) (NÂU ĐỒNG)', N'Thương hiệu: Valence – Hàn Quốc<br>

Mã sản phẩm: VC-047 (Nâu Đồng)<br>

Dành cho: Nữ<br>

Chất liệu dây: Dây da Genuine Leather bền bỉ<br>

Chất liệu mặt kính: Kính saphire<br>

Kích thước bề mặt: 3,5cm (Mặt tròn)<br>

Độ dày: 1cm<br>

Tổng độ dài của dây: 22cm<br>

Độ rộng của dây: 1,8cm<br>

Chất liệu vỏ máy: Thép chống gỉ ss304<br>

Máy: Cơ 8N24 JAPAN AUTOMETIC SKELETON MOVEMENT<br>

Khả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>

Bảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành.', 0, N'VC-047LD1.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (11, 2, N'ĐỒNG HỒ NỮ HENRY LONDON', N'2415.000', 1, N'ĐỒNG HỒ NỮ HENRY LONDON HL26-QM-0264 HERITAGE SQUARE', N'Thương hiệu: Henry London / Anh Quốc.<br>
Xem thêm thông tin thương hiệu: Tại đây.<br>
Tên bộ sưu tập: Heritage Square.<br>
Giới tính: Nữ giới.<br>
Vỏ đồng hồ: Thép không gỉ<br>
Màu viền: Công nghệ mạ vàng đồng IPG Pale Hamiton chân không được nhiều khách hàng yêu thích.<br>
Loại mặt: Vuông.<br>
Đường kính mặt: 26mm.<br>
Độ dày mặt: 6mm.<br>
Loại mặt kính: Kính cứng khoáng.<br>
Kiểu hiển thị:  Kim.<br>
Chức năng lịch: Không có.<br>
Pin: Số lượng 1 pin make in Japan, 2-3 năm sử dụng.<br>
Máy: VJ20 Máy Nhật.<br>
Chất liệu dây: Thép không gỉ.<br>
Khóa / Clasp: Loại Thanh trượt.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng, bảo hành kích hoạt code điện tử SMS, Miễn phí thay pin chọn đời, Miễn phí thay pin 5 năm tại tại trung tâm bảo hành cả nước.”', 0, N'HL26-QM-0264.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (12, 2, N'ĐỒNG HỒ NỮ HENRY LONDON', N'3020.000', 1, N'ĐỒNG HỒ NỮ HENRY LONDON HL35-LS-0327 MOON PHASE', N'Thương hiệu: Henry London / Anh Quốc.<br>
Xem thêm thông tin thương hiệu: Tại đây.<br>
Tên bộ sưu tập: Moon Phase<br>
Giới tính: Nữ giới.<br>
Vỏ đồng hồ: Thép không gỉ<br>
Màu viền: Công nghệ mạ màu bạc IPG Pale Hamiton chân không được nhiều khách hàng yêu thích.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 35mm.<br>
Độ dày mặt: 8mm.<br>
Loại mặt kính: Kính Acrylic lồi chuyên dụng trong dòng đồng hồ thời đầu cổ Omega, rolex , công dụng nhẹ, rõ, kháng va đập tốt, trầy xước có thể lau chùi hết.<br>
Kiểu hiển thị:  Kim, Analogue.<br>
Chức năng lịch: Có lịch ngày, tháng, thứ, lịch trăng độc đáo.<br>
Pin: Số lượng 1 pin, pin SR621sw make in Japan, 2-3 năm sử dụng.<br>
Máy: 6P80 Make in japan.<br>
Dây: Kiểu Thời Trang.<br>
Chất liệu dây: Dây da cừu.<br>
Khóa / Clasp: Gài và khóa.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng, bảo hành kích hoạt code điện tử SMS, Miễn phí thay pin chọn đời, Miễn phí thay pin 5 năm tại tại trung tâm bảo hành cả nước.“', 0, N'HL35-LS-0327.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (13, 2, N'ĐỒNG HỒ NỮ HENRY LONDON', N'3220.000', 1, N'ĐỒNG HỒ NỮ HENRY LONDON HL35-LM-0322 MOON PHASE', N'Thương hiệu: Henry London / Anh Quốc.<br>
Xem thêm thông tin thương hiệu: Tại đây.<br>
Tên bộ sưu tập: Moon Phase<br>
Giới tính: Nữ giới.<br>
Vỏ đồng hồ: Thép không gỉ<br>
Màu viền: Công nghệ mạ vàng hồng IPG Pale Hamiton chân không được nhiều khách hàng yêu thích.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 35mm.<br>
Độ dày mặt: 8mm.<br>
Loại mặt kính: Kính Acrylic lồi chuyên dụng trong dòng đồng hồ thời đầu cổ Omega, rolex , công dụng nhẹ, rõ, kháng va đập tốt, trầy xước có thể lau chùi hết.<br>
Kiểu hiển thị:  Kim, Analogue.<br>
Chức năng lịch: Có lịch ngày, tháng, thứ, lịch trăng độc đáo.<br>
Pin: Số lượng 1 pin, pin SR621sw make in Japan, 2-3 năm sử dụng.<br>
Máy: 6P80 Make in japan.<br>
Dây: Kiểu Thời Trang.<br>
Chất liệu dây: Thép không gỉ.<br>
Khóa / Clasp: Loại thanh trượt tăng đơ, free size, ko cần cắt.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng, bảo hành kích hoạt code điện tử SMS, Miễn phí thay pin chọn đời, Miễn phí thay pin 5 năm tại tại trung tâm bảo hành cả nước.“', 0, N'HL35-LM-0322.jpg', CAST(0x18430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (14, 2, N'ĐỒNG HỒ NỮ JIUSKO J0392S-AZ1RBW MẶT XÀ CỪ', N'2414.000', 1, N'THƯƠNG HIỆU JIUSKO Thương hiệu đồng hồ JIUSKO được ra mắt thị trường vào năm 2002 và được đăng ký thương hiệu lần đầu tiên tại HONGKONG. Chỉ sau 1 năm ra mắt JIUSKO đã trở thành thương hiệu lớn mang tầm quốc tế. Đây là một trong những thương hiệu của nhà máy Guangzhou yonghong watch Technology Development Co., Ltd nổi tiếng có trụ sở tại trung quốc. JIUSKO ra đời tạo nên sự khác biệt so với các dòng đồng hồ khác bởi các bộ phận chi tiết dù là nhỏ nhất cũng được làm từ các nguyên vật liệu cao cấp như: toàn bộ là máy nhật, thép không gỉ SS306, kính sappire cao cấp chống xước tuyện đối…. Với mong muốn đưa đến khách hàng một sản phẩm chất lượng, ngang tầm với các hãng đồng hồ danh tiếng lâu đời từ thụy sỹ bằng một mức giá phải chăng, hợp lý. Những người thợ chế tác đồng hồ được hãng đào tạo nâng cao tại Nhật Bản, Thụy Sỹ để có tay nghể tốt nhất, mang đến cho khách hàng những sản phẩm ưu việt và vượt trội. Đồng thời từng bước nâng tầm JIUSKO thành một thương hiệu lớn mang tính quốc tế. Đặc biệt hơn nữa, với sự quản lý chất lượng chăm sóc khách hàng và hậu mãi dịch vụ được quản lý bởi bộ phận cao cấp theo tiêu chuẩn quốc tế đặt tại New York mang lại sự hài long cho quý khách về chất lượng và dịch vụ. JIUSKO thường được viết tắt các từ như: Joy, Idea, Up, Self, Keep, Only Để biết thêm chi tiết về thương hiệu của sản phẩm vui lòng xem', N'Thương hiệu: JIUSKO<br>

Mã sản phẩm: J0392S-AZ1RBW (Xanh)<br>

Chất liệu dây: Dây thép<br>

Chất liệu mặt kính: Kính Sapphire<br>

Chất liệu vỏ máy: Thép chống gỉ<br>

Máy: Japan.<br>

Khả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>

Bảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành.', 0, N'J0392S-AZ1RBW.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (15, 2, N'ĐỒNG HỒ NỮ JIUSKO JFO0018M-SY01 DÂY ĐÁ CERAMIC', N'1161.000', 1, N'THƯƠNG HIỆU JIUSKO Thương hiệu đồng hồ JIUSKO được ra mắt thị trường vào năm 2002 và được đăng ký thương hiệu lần đầu tiên tại HONGKONG. Chỉ sau 1 năm ra mắt JIUSKO đã trở thành thương hiệu lớn mang tầm quốc tế. Đây là một trong những thương hiệu của nhà máy Guangzhou yonghong watch Technology Development Co., Ltd nổi tiếng có trụ sở tại trung quốc. JIUSKO ra đời tạo nên sự khác biệt so với các dòng đồng hồ khác bởi các bộ phận chi tiết dù là nhỏ nhất cũng được làm từ các nguyên vật liệu cao cấp như: toàn bộ là máy nhật, thép không gỉ SS306, kính sappire cao cấp chống xước tuyện đối…. Với mong muốn đưa đến khách hàng một sản phẩm chất lượng, ngang tầm với các hãng đồng hồ danh tiếng lâu đời từ thụy sỹ bằng một mức giá phải chăng, hợp lý. Những người thợ chế tác đồng hồ được hãng đào tạo nâng cao tại Nhật Bản, Thụy Sỹ để có tay nghể tốt nhất, mang đến cho khách hàng những sản phẩm ưu việt và vượt trội. Đồng thời từng bước nâng tầm JIUSKO thành một thương hiệu lớn mang tính quốc tế. Đặc biệt hơn nữa, với sự quản lý chất lượng chăm sóc khách hàng và hậu mãi dịch vụ được quản lý bởi bộ phận cao cấp theo tiêu chuẩn quốc tế đặt tại New York mang lại sự hài long cho quý khách về chất lượng và dịch vụ. JIUSKO thường được viết tắt các từ như: Joy, Idea, Up, Self, Keep, Only', N'Thương hiệu: JIUSKO<br>

Mã sản phẩm:  JFO0018M-RGY01 (Trắng Viền Đồng)<br>

Chất liệu dây: Dây Đá caramic<br>

Chất liệu mặt kính: Kính Sapphire<br>

Chất liệu vỏ máy: Thép chống gỉ<br>

Máy: Japan.<br>

Khả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>

Bảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành.', 0, N'JFO0018M-SY01.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (16, 2, N'ĐỒNG HỒ HENRY LONDON', N'3789.000', 1, N'ĐỒNG HỒ HENRY LONDON HL39-CS-0158 WESTMINSTER', N'Thương hiệu: Henry London / Anh Quốc.<br>
Xem thêm thông tin thương hiệu: Tại đây.<br>
Tên bộ sưu tập: Westminster.<br>
Giới tính: Unisex.<br>
Vỏ đồng hồ: Thép không gỉ.<br>
Màu viền: Công nghệ mạ vàng hồng IPG Pale Hamiton chân không được nhiều khách hàng yêu thích.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 38.5mm.<br>
Độ dày mặt: 8mm.<br>
Loại mặt kính: Kính Acrylic lồi chuyên dụng trong dòng đồng hồ thời đầu cổ Omega, rolex , công dụng nhẹ, rõ, kháng va đập tốt, trầy xước có thể lau chùi hết.<br>
Kiểu hiển thị:  Kim, Chronograph.<br>
Chức năng lịch: Có.<br>
Pin: Số lượng 1 pin, pin SR621sw made in japan. Sử dụng 2-3 nằm.<br>
Máy: JS25-00X – Make In Janpan.<br>
Dây: Dây da bò, màu hồng.<br>
Khóa / Clasp: Gài và khóa thép không gỉ.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng, bảo hành kích hoạt code điện tử SMS, Miễn phí thay pin chọn đời, Miễn phí thay pin 5 năm tại tại trung tâm bảo hành cả nước.”', 0, N'HL39-CS-0158.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (17, 3, N'ĐỒNG HỒ CẶP HL40-S-0348 – HL34-S-0340 REGENCY', N'8538.000', 1, N'ĐỒNG HỒ CẶP HL40-S-0348 – HL34-S-0340 REGENCY', N'Thương hiệu: Henry London / Anh Quốc<br>
Tên model: HL40-S-0348<br>
Xem thêm chi tiết thương hiệu : Tại đây.<br>
Tên bộ sưu tập: Regency<br>
Vỏ đồng hồ: Thép không gỉ<br>
Màu viền: Công nghệ mạ vàng đồng sáng IPG Pale Hamiton chân không được nhiều khách hàng yêu thích.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 40mm.<br>
Độ dày mặt: 8mm.<br>
Loại mặt kính: Kính Khoáng cao cấp.<br>
Kiểu hiển thị:  Kim, Analogue<br>
Chức năng lịch: Có<br>
Pin: Số lượng 1 pin, pin SR626sw made in Japan, 2-3 năm sử dụng.<br>
Máy: 2315 – Make in japan.<br>
Dây: Kiểu Thời Trang.<br>
Chất liệu dây: Dây da.<br>
Khóa / Clasp: Khóa gài.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.', 0, N'HL40-S-0348.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (18, 3, N'ĐỒNG HỒ CẶP HL40-S-0347 – HL34-S-0341 REGENCY', N'7998.000', 1, N'ĐỒNG HỒ CẶP HL40-S-0347 – HL34-S-0341 REGENCY', N'Thương hiệu: Henry London / Anh Quốc<br>
Tên model: HL40-S-0347<br>
Xem thêm chi tiết thương hiệu : Tại đây.<br>
Tên bộ sưu tập: Regency<br>
Vỏ đồng hồ: Thép không gỉ<br>
Màu viền: Công nghệ mạ vàng đồng sáng IPG Pale Hamiton chân không được nhiều khách hàng yêu thích.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 40mm.<br>
Độ dày mặt: 8mm.<br>
Loại mặt kính: Kính Khoáng cao cấp.<br>
Kiểu hiển thị:  Kim, Analogue<br>
Chức năng lịch: Có<br>
Pin: Số lượng 1 pin, pin SR626sw made in Japan, 2-3 năm sử dụng.<br>
Máy: 2315 – Make in japan.<br>
Dây: Kiểu Thời Trang.<br>
Chất liệu dây: Dây da.<br>
Khóa / Clasp: Khóa gài.
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.', 0, N'HL40-S-0347.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (19, 3, N'ĐỒNG HỒ CẶP HL40-M-0374 – HL34-M-0376 REGENCY', N'6704.000', 1, N'ĐỒNG HỒ CẶP HL40-M-0374 – HL34-M-0376 REGENCY', N'Thương hiệu: Henry London / Anh Quốc<br>
Tên model: HL40-M-0374<br>
Xem thêm chi tiết thương hiệu : Tại đây.<br>
Tên bộ sưu tập: Regency<br>
Vỏ đồng hồ: Thép không gỉ<br>
Màu viền: Công nghệ mạ vàng đồng sáng IPG Pale Hamiton chân không được nhiều khách hàng yêu thích.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 40mm.<br>
Độ dày mặt: 8mm.<br>
Loại mặt kính: Kính Khoáng cao cấp.<br>
Kiểu hiển thị:  Kim, Analogue<br>
Chức năng lịch: Có<br>
Pin: Số lượng 1 pin, pin SR626sw made in Japan, 2-3 năm sử dụng.<br>
Máy: 2315 – Make in japan.<br>
Dây: Kiểu Thời Trang.<br>
Chất liệu dây: Thép không gỉ.<br>
Khóa / Clasp: Loại thanh trượt tăng đơ, free size, ko cần cắt.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.', 0, N'HL40-M-0374.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (20, 3, N'ĐỒNG HỒ CẶP VC-065B VALENCE HÀN QUỐC', N'3024.000', 1, N'ĐỒNG HỒ CẶP VC-065B VALENCE HÀN QUỐC DÂY DA (ĐEN VIỀN BẠC)', N'Tên model: VC-065LB (Đen Viền Bạc)<br>
Thương hiệu: Valence Hàn Quốc.<br>
Giới tính: Nữ giới.<br>
Vỏ đồng hồ: Thép không gỉ cao cấp.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 29mm.<br>
Độ dày mặt: 7mm.<br>
Tổng độ dài của dây: 220mm<br>
Độ rộng của dây: 15mm<br>
Loại mặt kính: Kính cứng cao cấp, độ cứng cao<br>
Kiểu hiển thị: Kim<br>
Chức năng lịch: Có<br>
Pin: Có<br>
Máy: Quartz Nhật MIYOTA 2035 động cơ mạnh mẽ thời gian chuẩn xác<br>
Dây: Genuine Leather bền bỉ<br>
Khóa / Clasp: Loại gài và khóa.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa, Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng.', 0, N'VC-065B.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (21, 3, N'ĐỒNG HỒ ĐÔI HL39-S-0080 – HL30-US-0076', N'5313.000', 1, N'ĐỒNG HỒ ĐÔI HL39-S-0080 – HL30-US-0076', N'Tên model: HL30-US-0076.<br>
Thương hiệu: Henry London / Anh Quốc.<br>
Xem thêm thông tin thương hiệu: Tại đây.<br>
Tên bộ sưu tập: Hampstead.<br>
Giới tính: Nữ giới, yêu thích thời trang phong cách Châu Âu.<br>
Vỏ đồng hồ: Thép không gỉ<br>
Màu viền: Công nghệ mạ vàng đồng IPG Pale Hamiton chân không được nhiều khách hàng yêu thích.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 30mm.<br>
Độ dày mặt: 8mm.<br>
Loại mặt kính: Kính Acrylic lồi chuyên dụng trong dòng đồng hồ thời đầu cổ Omega, rolex , công dụng nhẹ, rõ, kháng va đập tốt, trầy xước có thể lau chùi hết.<br>
Kiểu hiển thị:  Kim.<br>
Chức năng lịch: Không có.<br>
Pin: Số lượng 1 pin, pin SR621sw made in Japan, 2-3 năm sử dụng.<br>
Máy: 1L45 máy Nhật.<br>
Chất liệu dây: Dây da bò, màu tím.<br>
Khóa / Clasp: Gài và khóa.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.', 0, N'HL39-S-0080.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (22, 3, N'ĐỒNG HỒ CẶP VC-080 VALENCE HÀN QUỐC', N'4821.000', 1, N'ĐỒNG HỒ CẶP VC-080 VALENCE HÀN QUỐC MẶT KÍNH SAPPHIRE (VÀNG)', N'Tên model: VC-080L (Vàng)<br>
Thương hiệu: Valence Hàn Quốc.<br>
Giới tính: Nữ giới.<br>
Vỏ đồng hồ: Thép không gỉ cao cấp.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 34mm.<br>
Độ dày mặt: 12mm.<br>
Tổng độ dài của dây: 220mm<br>
Độ rộng của dây: 18mm<br>
Loại mặt kính: Kính sapphire cao cấp chống trầy xước tuyệt đối.<br>
Kiểu hiển thị: Tự động<br>
Chức năng lịch: Không<br>
Pin: Có<br>
Máy: Quartz Nhật 1L45 chuyển động khép kín<br>
Dây: Dây thép không gỉ cao cấp<br>
Khóa / Clasp: Loại gài và khóa.<br>
Buckle vật liệu: Thép không gỉ.', 0, N'VC-080.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (25, 4, N'DÂY ĐỒNG HỒ DA BÒ', N'349.000', 1, N'DÂY ĐỒNG HỒ DA BÒ MILL HAND MADE TRƠN ESME ES10 ( XANH)', N'Thương Hiệu: ESME<br>
Mã SP: ES10 Hand made in Vietj Nam<br>
size 8, Size 10, Size 12, Size 14, Size 16, Size 18 (Xanh)<br>
Dây đồng hồ da bò thật 100%<br>
Da Bò Mill Trơn , dây make by hand  với trình độ kỹ thuật lâu năm tại việt nam', 0, N'ES10.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (26, 4, N'DÂY DA ĐỒNG HỒ NAM DA BÒ', N'349.000', 1, N'DÂY DA ĐỒNG HỒ NAM DA BÒ VÂN ALRAN ESME ES09', N'Thương Hiệu: ESME<br>
Mã SP: ES09<br>
Size 20, Size 22. Size 24.<br>
Dây đồng hồ da bò thật 100%<br>
Dập giả vân Alran<br>
Màu sắc: Đen, Nâu Đậm, Nâu Nhạt, Xanh(Navy), Xanh Lá', 0, N'ES09.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (27, 4, N'DÂY DA ĐỒNG HỒ VALENCE', N'300.000', 1, N'DÂY DA ĐỒNG HỒ VALENCE SIZE 14', N'Sản phẩm dây Da = 300.000/cặp dây<br>

Giá trên chưa bao gồm phí vạn chuyển', 0, N'VALENC.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (28, 4, N'DÂY DA ĐỒNG HỒ VALENCE SIZE 16', N'300.000', 1, N'DÂY DA ĐỒNG HỒ VALENCE SIZE 16', N'Sản phẩm dây Da = 300.000/cặp dây<br>

Giá trên chưa bao gồm phí vạn chuyển', 0, N'VALENCE.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (29, 4, N'VÍ DA BÒ NỮ ES05 ESME (XÁM)', N'789.000', 1, N'Mỗi sản phẩm của ESME là kết tinh của  một sự đầu tư nghiêm túc từ chất liệu cho đến nguyên phụ liệu. Với lòng nhiệt huyết và sự say mê muốn làm những sản phẩm thật sự chất lượng, chúng tôi tạo ra niềm kiêu hãnh cho khách hàng và cho riêng mình.<br>

ES05 Chất liệu da ý 100% . Công nghệ thuộc da cao cấp, đạt tiêu chuẩn Châu Âu. Đảm bảo độ mịn màng, bóng mướt tự nhiên, đồ đàn hồi và độ bền vượt trội. Lót bên trong bằng da dê thảo mộc được thuộc theo phương pháp tự nhiên, bằng các loại thảo mộc đặc biệt, hạn chế tối đa các hóa chất độc hại. Thân thiện với môi trường, an toàn tới sứ khỏe người sử dụng.<br>

Phụ Kiện: Nhập Khẩu Hàn Quốc, đảm bảo độ mượt mà, kéo êm tay, không  lo sợ bong tróc lớp xi.<br>

Gia công: Tại Việt Nam.', N'Mã sản phẩm: ES05<br>
Thương hiệu:  ESME<br>
Chất liệu: Chất liệu da ý 100%<br>
Kích thước: 210mm X 90mm (21cmX9cm)<br>
Ứng dụng: Phù hợp để đi làm văn phòng, đi học, dạo phố…<br>
Màu sắc: Xám', 0, N'ES05.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (30, 4, N'TÚI XÁCH NỮ THIẾT KẾ CAO CẤP', N'589.000', 1, N'Thương hiệu Just Star tập trung vào khai thác thế mạnh của vật liệu giả da. Túi xách thương hiệu Just Star thường sử dụng các  vật liệu khác nhau để tạo ra một phong cách độc đáo của các loại túi này như da PU, da sáp dầu, vải, PVC, v..v tất cả đều các loại tốt, vật liệu dễ chăm sóc. Virgo luôn bảo hành 1 năm cho các dòng sản phẩm này nên khách hàng yên tâm về chất lượng dù không phải là da thật.<br>

Một chiếc túi xách, ngoài các da, nổi bật nhất là giá trị và vẻ đẹp của kim loại. Với yêu cầu chất lượng cao của Just Star thậm chí còn được kiểm soát chặt chẽ nên khách hàng luôn yên tâm.', N'Mã sản phẩm: 172610-02<br>
Thương hiệu: JUST STAR<br>
Chất liệu: Da PU cao cấp<br>
Kích thước: Ngang 190mm (19cm). Cao 120mm (12cm), Rộng 70mm (7cm)  Dây đeo: 1120mm (112cm)<br>
Ứng dụng: Phù hợp để đi làm văn phòng, đi học, dạo phố…<br>
Màu sắc: Trắng/ Hồng<br>
Khóa: Khóa kéo', 0, N'172610-02.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (31, 5, N'ĐỒNG HỒ HENRY LONDON HL28-S-0450 (DÂY DA)', N'299.000', 1, N'ĐỒNG HỒ HENRY LONDON HL28-S-0450 (DÂY DA)', N'Thương hiệu: Henry London / Anh Quốc.<br>
Xem thêm thông tin thương hiệu: Tại đây.<br>
Giới tính: Nam Nữ unisex<br>
Vỏ đồng hồ: Thép không gỉ<br>
Màu viền: Công nghệ mạ vàng hồng IPG Pale Hamiton chân không được nhiều khách hàng yêu thích.<br>
Đường kính mặt: size 28<br>
Độ dày mặt: size 28<br>
Loại mặt kính: Kính Acrylic lồi chuyên dụng trong dòng đồng hồ thời đầu cổ Omega, rolex , công dụng nhẹ, rõ, kháng va đập tốt, trầy xước có thể lau chùi hết.<br>
Kiểu hiển thị:  Kim, Analogue.<br>
Pin: Số lượng 1 pin, pin SR621sw make in Japan, 2-3 năm sử dụng.<br>
Dây: Kiểu Thời Trang.<br>
Chất liệu dây: Dây da<br>
Khóa / Clasp: Loại thanh trượt tăng đơ, free size, ko cần cắt.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa.<br>
Xuất xứ lắp ráp: Trung Quốc.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng, bảo hành kích hoạt code điện tử SMS, Miễn phí thay pin chọn đời, Miễn phí thay pin 5 năm tại tại trung tâm bảo hành cả nước.“', 30, N'HL28-S-0450.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (32, 5, N'ĐỒNG HỒ NỮ VC-012B VALENCE HÀN QUỐC', N'1442.000', 1, N'ĐỒNG HỒ NỮ VC-012B VALENCE HÀN QUỐC MẶT KÍNH SAPPHIRE (TRẮNG BẠC)', N'Thương hiệu: Valence Hàn Quốc.<br>
Giới tính: Nữ giới.<br>
Vỏ đồng hồ: Thép không gỉ.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 21mm.<br>
Độ dày mặt: 7mm.<br>
Tổng độ dài của dây: 190mm<br>
Độ rộng của dây: 8mm<br>
Loại mặt kính: Mặt kính Sapphire chống trày tuyệt đối.<br>
Kiểu hiển thị: Tự động<br>
Chức năng lịch: Không<br>
Pin: Có<br>
Máy: Quartz Nhật MIYOTA 2305 động cơ mạnh mẽ thời gian chuẩn xác<br>
Dây: Dây thép không gỉ cao cấp<br>
Khóa / Clasp: Loại gài và khóa.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa, Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng.', 30, N'VC-012B.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (33, 5, N'ĐỒNG HỒ NỮ VC-053A VALENCE HÀN QUỐC', N'1253.000', 1, N'ĐỒNG HỒ NỮ VC-053A VALENCE HÀN QUỐC MẶT KÍNH SAPPHIRE (TRẮNG BẠC)', N'Thương hiệu: Valence Hàn Quốc.<br>
Giới tính: Nữ giới.<br>
Vỏ đồng hồ: Thép không gỉ cao cấp SS306<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 25mm.<br>
Độ dày mặt: 10mm.<br>
Tổng độ dài của dây: 175mm<br>
Độ rộng của dây: 13mm<br>
Loại mặt kính: Kính sapphire chống trầy 100%<br>
Kiểu hiển thị: Tự động<br>
Chức năng lịch: Không <br>
Pin: Có<br>
Máy: Quartz Nhật MIYOTA 2305 động cơ mạnh mẽ thời gian chuẩn xác<br>
Dây: Dây thép không gỉ cao cấp<br>
Khóa / Clasp: Loại gài và khóa.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa, Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng.', 35, N'VC-053A.jpg', CAST(0x0F430B00 AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (34, 5, N'ĐỒNG HỒ NỮ VALENCE HÀN QUỐC', N'1190.000', 1, N'ĐỒNG HỒ NỮ VALENCE HÀN QUỐC VC-SP001B (VÀNG)', N'Thương hiệu: Valence Hàn Quốc.<br>
Giới tính: Nữ giới.<br>
Vỏ đồng hồ: Thép không gỉ.<br>
Loại mặt: Tròn.<br>
Đường kính mặt: 20mm.<br>
Độ dày mặt: 8mm.<br>
Tổng độ dài của dây: 170mm<br>
Độ rộng của dây: 10mm<br>
Loại mặt kính: Kính cứng cao cấp<br>
Kiểu hiển thị: Tự động<br>
Chức năng lịch: Không<br>
Pin: Có<br>
Máy: Quartz Nhật MIYOTA 2305 động cơ mạnh mẽ thời gian chuẩn xác<br>
Dây: Dây thép không gỉ cao cấp<br>
Khóa / Clasp: Loại gài và khóa.<br>
Buckle vật liệu: Thép không gỉ.<br>
Độ chống nước: 30M, 3ATM, 3BAR chịu nước ở mức rửa tay, đi mưa, Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.<br>
Dịch Vụ Bảo Hành: “2 năm cho máy và tính kháng nước, Hậu mãi 3 năm sau đó phụ kiện (dây, code, khóa..) chị phí thấp chính hãng.', 25, N'VC-SP001B.jpg', CAST(0x0F430B00 AS Date))
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[review] ON 

INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created]) VALUES (1, 3, N'Kim Vy', N'kimvy@gmail.com', N'An toàn, sạch sẽ!', CAST(0xAB410B00 AS Date))
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created]) VALUES (2, 4, N'Kim Vy', N'kimvy@gmail.com', N'Sản phẩm chất lượng', CAST(0xAC410B00 AS Date))
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created]) VALUES (1002, 25, N'Lê Hồng Yến', N'lehongyen98@gmail.com', N'abcd', CAST(0x40430B00 AS Date))
SET IDENTITY_INSERT [dbo].[review] OFF
SET IDENTITY_INSERT [dbo].[transactions] ON 

INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (5, N'yen', N'lê hồng yến', N'lehongyen98@gmail.com', N'0344964466', N'bằng lăng', N'', N'12.600', N'0', NULL, CAST(0x40430B00 AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (6, N'yen', N'lê hồng yến', N'lehongyen98@gmail.com', N'0344964466', N'le duc tho', N'', N'650.000', N'1', NULL, CAST(0x41430B00 AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (7, N'yen', N'lê hồng yến', N'lehongyen98@gmail.com', N'0344964466', N'vbn', N'', N'2138.000', N'0', NULL, CAST(0x41430B00 AS Date))
SET IDENTITY_INSERT [dbo].[transactions] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (7, N'Lê Hồng Yến', N'lehongyen98@gmail.com', N'0344964466', N'yen', N'123456', CAST(0x40430B00 AS Date))
SET IDENTITY_INSERT [dbo].[users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__admin__F3DBC57297013DDA]    Script Date: 12/6/2021 2:09:28 PM ******/
ALTER TABLE [dbo].[admin] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__users__AB6E6164D8BC4DE4]    Script Date: 12/6/2021 2:09:28 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__users__F3DBC572AF9C78BA]    Script Date: 12/6/2021 2:09:28 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD FOREIGN KEY([transaction_id])
REFERENCES [dbo].[transactions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([catalog_id])
REFERENCES [dbo].[catalog] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [QLDH] SET  READ_WRITE 
GO
