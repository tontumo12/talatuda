-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2020 at 05:53 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_room`
--

CREATE TABLE `booking_room` (
  `id` int(11) NOT NULL,
  `id_user` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `id_room` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `state` int(11) NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking_room`
--

INSERT INTO `booking_room` (`id`, `id_user`, `id_room`, `comment`, `date`, `state`, `date_in`, `date_out`) VALUES
(1, '2', '4', 'test', '2020-04-26 17:08:01', 3, '2020-04-27', '2020-04-29'),
(2, '2', '8', 'thử', '2020-04-29 23:36:22', 1, '2020-04-30', '2020-05-09'),
(3, '1', '11', 'vi[', '2020-05-05 11:24:56', 2, '2020-05-06', '2020-05-08'),
(4, '2', '1', 'sẽ đến vào 9h sáng t4', '2020-05-27 10:45:40', 1, '2020-05-27', '2020-05-31'),
(5, '2', '95', 'testtttststts', '2020-05-27 10:47:35', 1, '2020-05-04', '2020-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `comment_room`
--

CREATE TABLE `comment_room` (
  `id` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `point` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment_room`
--

INSERT INTO `comment_room` (`id`, `id_hotel`, `id_user`, `detail`, `point`, `date`) VALUES
(1, 1, 1, 'texy', 4, '2020-04-23 22:39:48'),
(2, 1, 1, 'hệ thống tốt', 5, '2020-04-23 22:48:25'),
(3, 9, 1, 'test thử', 0, '2020-04-27 22:47:26'),
(4, 9, 2, 'test', 4, '2020-04-29 23:35:52'),
(5, 11, 1, 'tesst', 3, '2020-05-16 20:58:16'),
(6, 12, 1, 'good', 2, '2020-05-21 20:48:41'),
(7, 13, 2, 'test', 5, '2020-05-23 16:46:00'),
(8, 32, 2, 'Thái độ phục vụ chu đáo nhiệt tình', 5, '2020-05-27 10:43:40'),
(9, 1, 2, 'hệ thống tiện ích', 5, '2020-05-27 10:46:56'),
(10, 25, 2, 'teststtts', 5, '2020-05-27 10:47:47');

-- --------------------------------------------------------

--
-- Table structure for table `hosbi_user`
--

CREATE TABLE `hosbi_user` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hosbi_user`
--

INSERT INTO `hosbi_user` (`id`, `id_user`, `name`, `value`) VALUES
(1, 1, 'fish', 'cá biển'),
(2, 1, 'fish', 'tôm'),
(3, 1, 'fish', 'cua'),
(4, 1, 'meet', 'bò'),
(5, 1, 'vegetable', 'Lẩu cua đồng');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `location` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id`, `name`, `address`, `level`, `location`, `detail`, `type`, `img`) VALUES
(1, 'Khách sạn vinpeal', 'số 1 Thanh niên, phường thanh niên, quận tây hồ', 5, 'HN', 'Khách sạn thuộc tập đoàn vingroup 5 năm trong lĩnh vực vui chơi giải trí', 1, 'http://localhost:3000/images/hotel1.jpg'),
(2, 'Nhà hàng của Tú', 'số 1 Nguyễn Chí Thanh', 3, 'HN', 'Nhà hàng 3 sao đủ món âu á', 2, 'http://localhost:3000/images/hotel2.jpg'),
(11, 'The Hanoi Club Hotel & Lake Palais', '76 Yen Phu Street Tay Ho District', 4, 'HN', 'Nằm gần các địa danh như Chua Tran Quoc (0,4 km) và Imperial Citadel of Thang Long (1,9 km) đã làm The Hanoi Club Hotel & Lake Palais Residences trở thành lựa chọn lý tưởng khi đến Hà Nội. Là “ngôi nhà xa xứ,” các phòng khách sạn cung cấp tv màn hình phẳng, quầy bar mini và tủ lạnh, và kết nối mạng thật dễ dàng, với wifi miễn phí sẵn có. Khách có thể dùng nhân viên hỗ trợ khách và dịch vụ phòng khi nghỉ tại The Hanoi Club Hotel & Lake Palais Residences. Ngoài ra, The Hanoi Club Hotel & Lake Palais Residences còn có bể bơi và bữa sáng, sẽ làm cho kì nghỉ của bạn ở Hà Nội trở nên tuyệt vời hơn nữa. Thuận tiện hơn nữa, còn có đỗ xe miễn phí có sẵn cho khách. Khách du lịch thích thưởng thức món dim sum có thể tới Nhà hàng Madame Hiên, Tim Ho Wan hoặc Ming Restaurant.\n', 1, 'http://localhost:3000/images/1588180076378.jpg'),
(12, 'Lotte Hotel Hanoi', '54 Liễu Giai Phường Cống Vị, Quận Ba Đình', 5, 'HN', 'Nằm gần các địa danh như Lăng Chủ Tịch Hồ Chí Minh (2,3 km) và Văn Miếu Quốc Tử Giám (2,4 km) đã làm Lotte Hotel Hanoi trở thành lựa chọn lý tưởng khi đến Hà Nội. Lotte Hotel Hanoi cung cấp cho khách nhiều tiện nghi bao gồm tv màn hình phẳng, điều hòa nhiệt độ và quầy bar mini, và kết nối mạng là có thể vì wifi miễn phí có sẵn. Khách sạn cung cấp nhân viên hỗ trợ khách, dịch vụ phòng và sân thượng, làm cho kỳ nghỉ của bạn dễ chịu hơn nữa. Khách sạn còn cung cấp bể bơi và bữa sáng. Khách đi đến khách sạn bằng phương tiện của mình có thể dùng đỗ xe miễn phí', 1, 'http://localhost:3000/images/1588180131301.jpg'),
(13, 'Khách sạn Conifer Boutique', '09 Ly Dao Thanh Street Hoan Kiem Dist', 3, 'HN', 'Khách sạn Conifer Boutique là khách sạn lãng mạn cung cấp tv màn hình phẳng, quầy bar mini và điều hòa nhiệt độ trong phòng và thật dễ dàng kết nối khi ở đây vì wifi miễn phí được cung cấp cho khách. Khách sạn cung cấp dịch vụ phòng và nhân viên hỗ trợ khách. Hơn nữa, khách có thể tận hưởng bữa sáng, vốn đã làm cho khách sạn trở thành lựa chọn phổ biến của khách du lịch khi đến Hà Nội. Gần các địa danh như Nhà Hát Lớn Hà Nội (0,3 km) và Nhà Thờ Lớn (0,9 km) đã làm Khách sạn Conifer Boutique trở thành lựa chọn lý tưởng cho những ai muốn đến thăm những địa danh yêu thích này ở Hà Nội\n', 1, 'http://localhost:3000/images/1588180208310.jpg'),
(14, 'Hanoi E Central Hotel', 'No. 18 Lo Su Street, Old Quarter Hoan Kiem District', 3, 'HN', 'Nằm gần các địa danh như Nhà Thờ Lớn (0,7 km) và Imperial Citadel of Thang Long (1,6 km) đã làm Hanoi E Central Hotel trở thành lựa chọn lý tưởng khi đến Hà Nội. Các phòng khách sạn cung cấp tv màn hình phẳng, quầy bar mini và điều hòa nhiệt độ, và Hanoi E Central Hotel làm cho việc kết nối internet trở nên dễ dàng vì wifi miễn phí có sẵn. Bạn cũng có thể tận hưởng một số tiện nghi được cung cấp bởi khách sạn, bao gồm dịch vụ phòng và nhân viên hỗ trợ khách. Hơn nữa, khách có thể tận hưởng bữa sáng trong suốt thời gian ở đây.\n', 1, 'http://localhost:3000/images/1588180286808.jpg'),
(15, 'Hotel de l\'Opera Hanoi', '29 Tràng Tiền Quận Hoàn Kiếm', 5, 'HN', 'Hotel de l\'Opera Hanoi nằm không xa Nhà Hát Lớn Hà Nội (0,4 km) và Nhà Thờ Lớn (0,8 km). Wifi miễn phí được cung cấp cho khách, và các phòng của Hotel de l\'Opera Hanoi đều có tv màn hình phẳng, quầy bar mini và điều hòa nhiệt độ. Trong thời gian ở đây, hãy tận hưởng những tiện nghi được cung cấp bao gồm dịch vụ phòng và nhân viên hỗ trợ khách. Du khách tại Hotel de l\'Opera Hanoi cũng được chào đón thử nghiệm bể bơi và bữa sáng, ngay trong khách sạn. Đối với du khách có xe cộ, đỗ xe miễn phí có sẵn. Khi ở đây, hãy chắc chắn thử một số nhà hàng kiểu pháp, bao gồm Green Tangerine, La Badiane restaurant và Emm\'s Cafe Bistro, đều nằm gần Hotel de l\'Opera Hanoi.\n', 1, 'http://localhost:3000/images/1588180352445.jpg'),
(16, 'Hanoi Old Quarter Hotel', '02-04 Nguyễn Hữu Huân, Quận Hoàn Kiếm, Hà Nội', 3, 'HN', 'Khách sạn Hanoi Old Quarter là một khách sạn có nét kiến trúc châu Âu độc đáo thu hút sự chú ý của rất nhiều người khi đến đây. Mỗi phòng đều sở hữu tiện nghi hiện đại với sàn gỗ, điều hòa, truyền hình cáp cùng tủ lạnh mini, bar mini,…Phòng tắm riêng có nóng lạnh đầy đủ, đồ vệ sinh cá nhân miễn phí và máy sấy tóc phục vụ nhu cầu của quý khách. Có Wifi miễn phí,\nPhòng không hút thuốc, Chỗ đậu xe riêng miễn phí, Tiện nghi cho người khuyết tật, Đưa đón sân bay.\n', 1, 'http://localhost:3000/images/1590257070570.jpg'),
(17, 'Splendid Holiday Hotel', '16 Thọ Xương, Hoàn Kiếm, Hà Nội', 3, 'HN', ' Khách sạn Splendid Holiday Hotel là khách sạn 3 sao gần phố cổ Hà Nội đảm bảo tiêu chuẩn với các phòng được thiết kế với phong cách hiện đại, sang trọng. Du khách sẽ có thể lựa chọn được không gian phù hợp, thoải mái dành cho bản thân và gia đình. Các phòng đều được trang bị các thiết bị chất lượng cao cấp cùng những tiện nghi như tivi truyền hình cáp, trà, khăn tắm, dép giúp bạn có được sự nghỉ ngơi tốt nhất. Nhà hàng. Có phòng massage, Wifi miễn phí, Đỗ xe miến phí, Bồn tắm nước nóng, Phòng bao gồm bữa sáng, Hỗ trợ đặt tour, Tiếp tân 24/24.', 1, 'http://localhost:3000/images/1590257533922.jpg'),
(18, 'The Royal Hotel', '60 Nghi Tàm, Quận Tây Hồ, Hà Nội', 3, 'HN', 'The Royal Hotel là một địa chỉ tuyệt vời dành cho những người thích khám phá lịch sử và ẩm thực quận Tây Hồ. Mỗi phòng nghỉ tại đây đều được trang bị máy điều hòa, internet không dây, ấm đun nước cùng phòng tắm riêng có bồn tắm/vòi sen và đồ dùng cá nhân miễn phí. Quầy lễ tân phục vụ 24 giờ/ngày sẽ giúp bạn giải quyết những vấn đề phát sinh và đưa đến sự hài lòng nhất cho khách hàng. Khung cảnh hồ Tây và các khu vực lân cận từ góc nhìn của The Royal Hotel đưa đến cho du khách ấn tượng cực kì tốt đẹp. Không chỉ có thể chiêm ngưỡng vẻ đẹp hồ Tây, hồ Trúc Bạch, du khách còn có thể ngắm nhìn sự tấp nập và nhịp sống của thành phố Hà Nội từ trên cao. Có chỗ đậu xe riêng miễn phí, dịch vụ phòng, bữa sáng, nhà hàng trong khuôn viên.', 1, 'http://localhost:3000/images/1590257833173.jpg'),
(19, 'Khách sạn Daewoo Hà Nội', '360 Kim Ma Street, Ba Dinh District, Hà Nội', 5, 'HN', 'Các phòng khách sạn cung cấp tv màn hình phẳng, quầy bar mini và điều hòa nhiệt độ, và Khách sạn Daewoo Hà Nội làm cho việc kết nối internet trở nên dễ dàng vì wifi miễn phí có sẵn. Bạn cũng có thể tận hưởng một số tiện nghi được cung cấp bởi khách sạn, bao gồm dịch vụ phòng và nhân viên hỗ trợ khách. Hơn nữa, khách có thể tận hưởng bể bơi và bữa sáng trong suốt thời gian ở đây. Gần với một số địa danh nổi tiếng ở Hà Nội như Lăng Chủ Tịch Hồ Chí Minh (2,4 km) và Văn Miếu Quốc Tử Giám (2,5 km), Khách sạn Daewoo Hà Nội là lựa chọn lý tưởng của khách du lịch. Khi đến Hà Nội, bạn có thể muốn thử tôm hùm tại một trong những nhà hàng lân cận như Quán Ăn Ngon, Grandma\'s Restaurant hoặc JW Cafe.', 1, 'http://localhost:3000/images/1590258280813.jpg'),
(20, 'Khách sạn One Opera Đà Nẵng', '115 Nguyễn Văn Linh Quận Hải Châu, Đà Nẵng ', 5, 'DN', 'Nằm gần các địa danh như Phap Lam Pagoda (0,0 km) và Nhà Thờ Chính Tòa Đà Nẵng (1,0 km) đã làm Khách sạn One Opera Đà Nẵng trở thành lựa chọn lý tưởng khi đến Đà Nẵng. Các phòng khách sạn cung cấp tv màn hình phẳng, điều hòa nhiệt độ và tủ lạnh, và Hagl (hoang Anh) Plaza Da Nang Hotel làm cho việc kết nối internet trở nên dễ dàng vì wifi miễn phí có sẵn. Bạn cũng có thể tận hưởng một số tiện nghi được cung cấp bởi khách sạn, bao gồm nhân viên hỗ trợ khách và dịch vụ phòng. Hơn nữa, khách có thể tận hưởng bể bơi và bữa sáng trong suốt thời gian ở đây. Một điểm thuận tiện nữa đó là đỗ xe miễn phí có sẵn cho khách. Khi bạn đói, hãy nhớ thử Hải Sản Bé Mặn, Madame Lân và Bánh Xèo Bà Dưỡng, là nhà hàng kiểu á, được ưa chuộng bởi người dân địa phương cũng như du khách.', 1, 'http://localhost:3000/images/1590258602764.jpg'),
(21, 'Brilliant Hotel', '162 Bạch Đằng, Đà Nẵng', 4, 'DN', 'Khách sạn Brilliant tọa lạc ở một vị trí tuyệt đẹp trên con đường Bạch Đằng. Nằm bên bờ sông Hàn thơ mộng, bạn có thể ngắm nhìn toàn cảnh thành phố biển Đà Nẵng với những cây cầu nổi tiếng rực rỡ ánh sáng nghệ thuật về đêm góp phần làm nên vẻ đẹp hiện đại và độc đáo của thành phố này. Nằm ngay tại trung tâm thành phố, chỉ cách sân bay quốc tế 10 phút đi xe, khách sạn có vị trí rất thuận tiện cho du khách để khám phá các điểm tham quan và giải trí thú vị trong thành phố như Trung tâm Hành chính mới, nhà thờ Con Gà, viện cổ Chàm, chợ Hàn, các trung tâm mua sắm, nhà hàng và quán bar nhộn nhịp. Kết hợp sự sang trọng và thanh lịch của kiến trúc Á Âu đương đại với phong cách phục vụ hiếu khách của người Việt Nam, Khách sạn Brilliant là ngôi nhà ấm áp cho quý khách tại Đà Nẵng, nơi quý khách có thể tận hưởng cuộc sống của mình một cách thú vị trong không gian hoàn hảo với những tiện nghi hiện đại cùng những dịch vụ chất lượng và đẳng cấp theo tiêu chuẩn khách sạn 4 sao quốc tế.', 1, 'http://localhost:3000/images/1590300583969.jpg'),
(22, 'Paris Deli Hotel', '236 Vo Nguyen Giap, Son Tra, Đà Nẵng', 4, 'DN', 'Paris Deli Hotel gần các địa danh như DHC Marina (1,6 km) và Linh Ung Pagoda (2,1 km) đã làm Paris Deli Hotel trở thành lựa chọn lý tưởng cho những ai muốn đến thăm những địa danh yêu thích này ở Đà Nẵng. Các phòng tại Paris Deli Hotel cung cấp tv màn hình phẳng, điều hòa nhiệt độ và quầy bar mini đưa lại sự thoải mái và thuận tiện tuyệt vời và khách có thể online với wifi miễn phí. Nhân viên hỗ trợ khách và dịch vụ phòng là một trong những điểm thuận tiện có được tại khách sạn. Bể bơi và bữa sáng sẽ giúp chuyến đi của bạn trở nên đặc biệt hơn. Nếu bạn lái xe tới Paris Deli Hotel, đỗ xe miễn phí có sẵn.', 1, 'http://localhost:3000/images/1590306827024.jpg'),
(23, 'Hyatt Regency Danang Resort & Spa', '5 Trường Sa Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', 5, 'HN', 'Các phòng tại Hyatt Regency Danang Resort & Spa cung cấp tv màn hình phẳng, điều hòa nhiệt độ và tủ lạnh đưa lại sự thoải mái và thuận tiện tuyệt vời và khách có thể online với wifi miễn phí. Bàn lễ tân 24 giờ, nhân viên hỗ trợ khách và dịch vụ phòng là một trong những điểm thuận tiện có được tại khu nghỉ dưỡng. Bể bơi và bữa sáng sẽ giúp chuyến đi của bạn trở nên đặc biệt hơn. Nếu bạn lái xe tới Hyatt Regency Danang Hotel, đỗ xe miễn phí có sẵn. Khi ở đây, hãy chắc chắn thử một số hải sản, bao gồm Cây Me Restaurant, Cape Nao Beach Club và Hải Sản Phố, đều nằm gần Hyatt Regency Danang Resort & Spa. Trên hết, Hyatt Regency Danang Resort & Spa làm đơn giản hoá việc trải nghiệm vài điểm đến tuyệt vời ở Đà Nẵng như Hải đăng Tiên Sa, cũng là ngọn hải đăng được yêu thích.', 1, 'http://localhost:3000/images/1590307130787.jpg'),
(24, 'Premier Village Danang Resort - Managed by Accorhotels', '99 Võ Nguyên Giáp Ngũ Hành Sơn, Đà Nẵng', 5, 'DN', 'Khách sạn là sự tổng hợp của những giá trị lý tưởng, sự thoải mái và thuận tiện như khung cảnh sang trọng cùng với loạt tiện nghi được thiết kế cho những khách du lịch như bạn. Nằm gần các địa danh như DHC Marina (3,1 km) và Nhà Thờ Chính Tòa Đà Nẵng (3,9 km) đã làm Premier Village Danang Resort - Managed by Accorhotels trở thành lựa chọn lý tưởng khi đến Đà Nẵng. Các phòng tại Premier Village Danang Resort - Managed by Accorhotels cung cấp tv màn hình phẳng, điều hòa nhiệt độ và tủ lạnh, và khách có thể được kết nối wifi miễn phí. Ngoài ra, khi nghỉ dưỡng tại Premier Village Danang Resort - Managed by Accorhotels khách có thể dùng dịch vụ phòng và nhân viên hỗ trợ khách. Bạn cũng có thể tận hưởng bể bơi và bữa sáng. Cần chỗ đỗ xe? Đỗ xe miễn phí có sẵn tại Premier Village Danang Resort - Managed by Accorhotels. Khi ở đây, hãy chắc chắn thử một số nhà hàng kiểu ấn độ, bao gồm Family Indian Restaurant, Mumtaz Indian Restaurant và Nhà Hàng Ấn Độ Maharaja, đều nằm gần Premier Village Danang Resort - Managed by Accorhotels.', 1, 'http://localhost:3000/images/1590307282591.jpg'),
(25, 'Vinpearl Resort & Spa Da Nang', '23 Trường Sa Phường Hòa Hải, Quận Ngũ Hành Sơn, Đà Nẵng ', 4, 'DN', 'Khách sạn là sự tổng hợp của những giá trị lý tưởng, sự thoải mái và thuận tiện như khung cảnh dành cho gia đình cùng với loạt tiện nghi được thiết kế cho những khách du lịch như bạn. Là “ngôi nhà xa xứ,” các phòng khu nghỉ dưỡng cung cấp tv màn hình phẳng, điều hòa nhiệt độ và quầy bar mini, và kết nối mạng thật dễ dàng, với wifi miễn phí sẵn có. Khách có thể dùng bàn lễ tân 24 giờ, nhân viên hỗ trợ khách và dịch vụ phòng khi nghỉ tại Vinpearl Resort & Spa Da Nang. Ngoài ra, Vinpearl Resort & Spa Da Nang còn có bể bơi và bữa sáng, sẽ làm cho kì nghỉ của bạn ở Đà Nẵng trở nên tuyệt vời hơn nữa. Thuận tiện hơn nữa, còn có đỗ xe miễn phí có sẵn cho khách. Khách du lịch tìm kiếm nhà hàng kiểu á có thể tới Cape Nao Beach Club, Holy Pig hoặc Nhà Hàng Beach House. Không thiếu hoạt động trong vùng: hãy khám phá viện bảo tàng nghệ thuật nổi tiếng như Art in Paradise (3D TRICK ART) và Bảo Tàng Mỹ Thuật Đà Nẵng. ', 1, 'http://localhost:3000/images/1590307477791.jpg'),
(26, 'Khu Nghỉ Dưỡng Sheraton Grand Danang Resort', '35 Trường Sa Phường Hòa Hải, Quận Ngũ Hành Sơn, Đà Nẵng', 5, 'DN', 'Sheraton Grand Danang Resort là khách sạn 5 sao cao cấp tọa lạc trên bờ cát xinh đẹp của bãi biển Non Nước, và là một địa điểm với thiết kế độc đáo, phù hợp cho những chuyến đi nghỉ dưỡng cùng gia đình và bạn bè, cũng như các chuyến công tác hay nghỉ dưỡng cá nhân. Thức giấc và tận hưởng hương biển và ánh nắng rực rỡ khi quý khách nghỉ tại một trong 258 phòng nghỉ thanh lịch.', 1, 'http://localhost:3000/images/1590307696658.jpg'),
(27, 'Pearl River Hotel', 'Km 8 Pham Van Dong Street Duong Kinh District, Thành phố Hải Phòng', 5, 'HP', 'Khách sạn 5 sao duy nhất tại Hải Phòng nổi tiếng với đội ngũ quản lý và dịch vụ xuất sắc. Trải nghiệm khách sạn thực sự có thể được cảm nhận, nếm và chạm vào tại The Pearl river Hải Phòng. Mỗi lần lưu trú sẽ được trải nghiệm tốt; khách sạn đã nhận được rất nhiều ý kiến tuyệt vời cho các dịch vụ và tiện nghi của nó.', 1, 'http://localhost:3000/images/1590307841403.jpg'),
(28, 'AVANI Hai Phong Harbour View', '12 Trần Phú, Phường Máy Tơ, Quận Ngô Quyền, thành phố Hải Phòng', 4, 'HP', 'Nếu bạn đang tìm kiếm khách sạn sang trọng ở Thành phố Hải Phòng, hãy thử nghiệm AVANI Hai Phong Harbour View. Du Hang Pagoda (2,1 km) ở gần kề đã làm AVANI Hai Phong Harbour View trở thành lựa chọn lý tưởng cho những ai muốn khám phá địa danh nổi tiếng này ở Thành phố Hải Phòng. Bạn sẽ tận hưởng căn phòng với tv màn hình phẳng, và bạn chắc chắn sẽ được kết nối internet trong thời gian này bởi AVANI Hai Phong Harbour View cung cấp cho du khách wifi. Khách sạn còn cung cấp dịch vụ phòng và nhân viên hỗ trợ khách. Hơn nữa, AVANI Hai Phong Harbour View với bể bơi và bữa sáng, mang lại những giây phút thư giãn trốn khỏi một ngày bận rộn. Với khách có xe cộ đỗ xe miễn phí có sẵn. Khách du lịch thích thưởng thức cua có thể tới Quán Bánh Đa Cua Bể Bà Cụ. Nếu không, bạn có thể thử nhà hàng kiểu trung quốc như Nha Hang Hong Kong. Trong kỳ nghỉ của bạn, nhớ ghé thăm những điểm đến yêu thích như Bảo tàng Thành phố Hải Phòng (0,7 km), nằm trong vòng đi bộ từ khách sạn. Các nhân viên của AVANI Hai Phong Harbour View mong muốn được phục vụ bạn trong kì nghỉ sắp tới.', 1, 'http://localhost:3000/images/1590308537513.jpg'),
(29, 'Sea Stars Hotel', '1/3A Le Hong Phong Str. Ngo Quyen Dist, Thành phố Hải Phòng', 4, 'HP', 'Các phòng tại Sea Stars Hotel cung cấp điều hòa nhiệt độ, tủ lạnh và quầy bar mini đưa lại sự thoải mái và thuận tiện tuyệt vời và khách có thể online với wifi miễn phí. Dịch vụ phòng là một trong những điểm thuận tiện có được tại khách sạn. Bể bơi và bữa sáng sẽ giúp chuyến đi của bạn trở nên đặc biệt hơn. Nếu bạn lái xe tới Sea Stars Hotel, đỗ xe miễn phí có sẵn. Gần với Du Hang Pagoda (2,6 km), một địa danh nổi tiếng ở Thành phố Hải Phòng, Sea Stars Hotel là một lưạ chọn lý tưởng cho khách du lịch. Khi bạn đói, hãy nhớ thử Indian Kitchen, là nhà hàng kiểu ấn độ được ưa chuộng bởi người dân địa phương cũng như du khách. Hơn nữa, trong suốt kỳ nghỉ của bạn đừng quên ghé thăm một số di tích cổ nổi tiếng, như Đình Hàng Kênh.', 1, 'http://localhost:3000/images/1590308638714.jpg'),
(30, 'Khách sạn Level', '71 Lạch Tray, Ngô Quyền, Thành phố Hải Phòng ', 3, 'HP', 'Khách sạn Level có 12 tâng với 60 phòng nghỉ và căn hộ được trang thiết bị đồng bộ, tiện nghi tiêu chuẩn quốc tế tất cả các phòng đều có bồn tắm, tivi LCD/Plasma, máy sấy tóc. Đưa đón khách sạn/sân bay, két sắt, nhà hàng là các tiện nghi có thêm bạn sẽ thấy trong khách sạn ở Haiphong này. Du khách có thể tận dụng các tiện nghi thư giãn và giải trí gồm cả mát xa, phòng tắm hơi. ', 1, 'http://localhost:3000/images/1590309295553.jpg'),
(31, 'Lac Long Hotel Hai Phong', '83 Bach Dang St,, Thành phố Hải Phòng', 3, 'HP', 'Khách sạn Lac Long theo phong cách tân cổ điển chào đón bạn thêm nhiều khoảnh khắc của dịch vụ thật và tiện nghi tinh tế. Với vị trí trung tâm, Laclong Hotel, Hải Phòng có vị trí hoàn hảo cho tất cả các điểm tham quan chính của thành phố. Nằm ở trung tâm Khu Tài chính của thành phố,Trong khoảng cách đi bộ đến Nhà hát lớn, Bưu điện Trung tâm và Phà đến Đảo Cát Bà, được UNESCO công nhận vào tháng 12 năm 2004 là khu dự trữ sinh quyển của thế giới, Gần với các nhà hàng và địa điểm mua sắm tốt nhất trong thành phố, 15 phút lái xe từ sân bay quốc tế Hải Phòng Catbi.', 1, 'http://localhost:3000/images/1590310266650.jpg'),
(32, 'Khách sạn New World Sài Gòn', '76, Lê Lai, Phường Bến Thành, Quận 1, Hồ Chí Minh', 5, 'HCM', 'Khách sạn New World Sài Gòn được biết đến bởi không gian rộng rãi, sang trọng với 552 phòng nghỉ đạt tiêu chuẩn 5 sao được thiết kế và trang trí theo phong cách Châu Âu.\n\nKhách sạn 5 sao New World Sài Gòn  có những bức tranh, bình hoa được trang trí trong phòng và sảnh mang đến cho bạn cảm giác thoải mái, giấc ngủ ngon, kỳ nghỉ tuyệt bên gia đình và bạn bè hay những chuyến đi công tác xa\n\nĐặc biệt ở khách sạn 5 sao bạn còn có thể đi bộ vào công viên 23 tháng 9 vào buổi sáng sớm hay chiều tối, Ngoài ra khách sạn còn cung cấp dịch vụ spa dành cho nam và nữ với phương pháp trị liệu dầu thơm  và massage Thụy Điển, hồ bơi ngòa trời,  nhiều món ăn trung Hoa\n\nKhách sạn 5 saoNew World Sài Gòn đem đến cho quý khách kỳ nghỉ hoàn hảo nhất', 1, 'http://localhost:3000/images/1590337913923.jpg'),
(33, 'Khách sạn Majestic Sài Gòn ', '1 Đồng Khởi, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh ', 5, 'HCM', 'Các phòng khách sạn cung cấp tv màn hình phẳng, tủ lạnh và quầy bar mini, và Khách sạn Majestic Sài Gòn làm cho việc kết nối internet trở nên dễ dàng vì wifi miễn phí có sẵn.\n\nBạn cũng có thể tận hưởng một số tiện nghi được cung cấp bởi khách sạn, bao gồm dịch vụ phòng, nhân viên hỗ trợ khách và sân thượng. Hơn nữa, khách có thể tận hưởng bể bơi và quầy bar cạnh bể bơi trong suốt thời gian ở đây.\n\nGần các địa danh như The World of Heineken (0,3 km) và Phố đi bộ Nguyễn Huệ (0,3 km) đã làm Majestic Hotel Saigon trở thành lựa chọn lý tưởng cho những ai muốn đến thăm những địa danh yêu thích này ở Thành phố Hồ Chí Minh.', 1, 'http://localhost:3000/images/1590338465452.jpg'),
(34, 'Khách sạn Rex', '141 Nguyen Hue Blvd District 1, Thành phố Hồ Chí Minh', 5, 'HCM', 'Nằm gần các địa danh như Nhà hát Thành Phố Hồ Chí Minh (0,2 km) và Phố đi bộ Nguyễn Huệ (0,3 km) đã làm Rex Hotel Saigon trở thành lựa chọn lý tưởng khi đến Thành phố Hồ Chí Minh.\n\nCác phòng khách sạn cung cấp các tiện nghi như tv màn hình phẳng, quầy bar mini và tủ lạnh, và khách có thể kết nối internet với wifi miễn phí được cung cấp bởi khách sạn.\n\nKhách sạn Rex cung cấp dịch vụ phòng, sân thượng và nhân viên hỗ trợ khách, giúp cho kỳ nghỉ của bạn trở nên dễ chịu hơn nữa. Khách sạn còn cung cấp bể bơi trên sân thượng và bữa sáng. Nếu bạn lái xe đến Khách sạn Rex, bãi đỗ xe có sẵn.', 1, 'http://localhost:3000/images/1590338715440.jpg'),
(35, 'Khách sạn Pullman Sài Gòn ', '148 Trần Hưng Đạo, quận 1, Hồ Chí Minh', 5, 'HCM', ' Là khách sạn 5 sao quốc tế mới nhất được xây dựng tại thành phố, Pullman bao gồm 306 phòng với các loại superior, deluxe, executive, suite... Mỗi phòng đều mang phong cách riêng biệt, được trang bị đầy đủ các thiết bị tiện nghi như TV màn hình LED, dụng cụ pha trà, cà phê, Wi-Fi, bồn tắm... Nhà hàng trên tầng mái khách sạn phục vụ bữa sáng có thiết kế nướng thịt hình tròn độc đáo, đầu bếp biểu diễn trực tiếp.', 1, 'http://localhost:3000/images/1590338978900.jpg'),
(36, 'Khách sạn Caravelle Sài Gòn', '19-23 Công Trường Lam Sơn, Quận 1, Thành phố Hồ Chí Minh', 5, 'HCM', 'Gần với một số địa danh nổi tiếng ở Thành phố Hồ Chí Minh như Nhà hát Thành Phố Hồ Chí Minh (0,1 km) và Phố đi bộ Nguyễn Huệ (0,3 km), Caravelle Hotel Saigon là lựa chọn lý tưởng của khách du lịch.\n\nCác phòng tại Caravelle Hotel Saigon cung cấp tv màn hình phẳng và điều hòa nhiệt độ, và khách có thể được kết nối wifi miễn phí.\n\nNgoài ra, khi nghỉ dưỡng tại Caravelle Hotel Saigon khách có thể dùng sân thượng, dịch vụ phòng và nhân viên hỗ trợ khách. Bạn cũng có thể tận hưởng bể bơi và bữa sáng. Cần chỗ đỗ xe ? Bãi đỗ xe có sẵn tại Khách sạn Caravelle Sài Gòn.', 1, 'http://localhost:3000/images/1590339197519.jpg'),
(37, 'Khách sạn Windsor Plaza', '18 An Dương Vương Quận 5, Thành phố Hồ Chí Minh Việt Nam', 5, 'HCM', 'Nổi tiếng với không khí dành cho gia đình, và vị trí gần nhà hàng, Khách sạn Windsor Plaza sẽ giúp bạn tận hưởng những gì tuyệt nhất ở Thành phố Hồ Chí Minh.\n\nCác phòng khách sạn cung cấp tv màn hình phẳng, tủ lạnh và quầy bar mini, và Khách sạn Windsor Plaza làm cho việc kết nối internet trở nên dễ dàng vì wifi miễn phí có sẵn.\n\nBạn cũng có thể tận hưởng một số tiện nghi được cung cấp bởi khách sạn, bao gồm dịch vụ phòng, nhân viên hỗ trợ khách và sân thượng. Hơn nữa, khách có thể tận hưởng bể bơi trên sân thượng và bữa sáng trong suốt thời gian ở đây.\n\nGần các địa danh như Đường Bùi Viện (2,4 km) và Pham Ngu Lao Street (2,5 km) đã làm Khách sạn Windsor Plaza trở thành lựa chọn lý tưởng cho những ai muốn đến thăm những địa danh yêu thích này ở Thành phố Hồ Chí Minh.', 1, 'http://localhost:3000/images/1590342273200.jpg'),
(38, 'Ladalat Hotel', '106A, đường Mai Anh Đào, phường 8, thành phố Đà Lạt Ward 8, Đà Lạt Việt Nam', 5, 'DL', '   Tọa lạc tại 106A Mai Anh Đào Đà Lạt. Đây là một khách sạn mới xây và có nhiều ưu đãi lớn dành cho các bạn. Là 1 trong những khách sạn mới xây nên tại đây đã được cải thiện. Khác với những khách sạn đã xuất hiện từ trước.\n    Tại đây có rất nhiều kiểu phòng cho các bạn lựa chọn. Như: Deluxe, Deluxe Tripble, Junio Deluxe, Suite, President. Tuy là khách sạn mới xây. Nhưng mà đã có được rất nhiều sự tin tưởng. Của các du khách khi tham quan du lịch.\n   Hầu hết mọi người đặt khách sạn tại đây vì khách sạn này đáp ứng như cầu. Và đạt cấp 5 sao nhưng lại có giá thành tương đối ổn định.\n', 1, 'http://localhost:3000/images/1590342564922.jpg'),
(39, 'Khu nghỉ dưỡng & Spa Ana Mandara Villas Đà Lạt', 'Le Lai Street, Ward 5, Đà Lạt, Việt Nam', 5, 'DL', 'Nằm gần những địa danh yêu thích như Dinh Bảo Đại (1,6 km) và Linh Son Pagoda (1,6 km), du khách tại Ana Mandara Villas Dalat Hotel có thể dễ dàng đến thăm những điểm đến nổi tiếng này ở Đà Lạt.\n\nKhu nghỉ dưỡng & Spa Ana Mandara Villas Đà Lạt cung cấp cho khách nhiều tiện nghi bao gồm tv màn hình phẳng, và kết nối mạng là có thể vì wifi miễn phí có sẵn.\n\nKhu nghỉ dưỡng cung cấp bàn lễ tân 24 giờ, dịch vụ phòng và nhân viên hỗ trợ khách, làm cho kỳ nghỉ của bạn dễ chịu hơn nữa. Khách sạn còn cung cấp bể bơi và bữa sáng. Khách đi đến khách sạn bằng phương tiện của mình có thể dùng đỗ xe miễn phí.\n\nNếu bạn tìm kiếm nhà hàng bít tết, có thể ghé thăm Quán Botea Bistro, Barn House BBQ and BEER hoặc Carrot Restaurant, nằm cách chỉ vài bước chân từ Khu nghỉ dưỡng & Spa Ana Mandara Villas Đà Lạt.', 1, 'http://localhost:3000/images/1590342777789.jpg'),
(40, 'Khách sạn Đà Lạt Palace Heritage', '2 Trần Phú, P.3, Đà Lạt Việt Nam', 5, 'DL', 'Gần với một số địa danh nổi tiếng ở Đà Lạt như Lam Vien Square (0,5 km) và Dalat Railway Station (1,3 km), Sofitel Dalat là lựa chọn lý tưởng của khách du lịch.\n\nCác phòng khách sạn cung cấp tv màn hình phẳng, và online là có thể vì wifi miễn phí có sẵn, cho phép bạn thư giãn nghỉ ngơi không phải lo lắng gì.\n\nSofitel Dalat cung cấp bàn lễ tân 24 giờ, dịch vụ phòng và nhân viên hỗ trợ khách. Hơn nữa, là khách hàng giá trị của Sofitel Dalat, bạn có thể tận hưởng trung tâm thể dục thẩm mỹ và phòng khách, có sẵn tại khách sạn. Khách đi đến khách sạn bằng phương tiện của mình có thể dùng đỗ xe miễn phí.', 1, 'http://localhost:3000/images/1590343470880.jpg'),
(41, 'DaLat Edensee Lake Resort & Spa', 'Tuyen Lam Lake, Zone VII.2, Đà Lạt Việt Nam', 5, 'DL', 'Các phòng khách sạn cung cấp các tiện nghi như tv màn hình phẳng và quầy bar mini, và khách có thể kết nối internet với wifi miễn phí được cung cấp bởi khu nghỉ dưỡng.\n\nDalat Edensee Resort & Spa cung cấp dịch vụ phòng và nhân viên hỗ trợ khách, giúp cho kỳ nghỉ của bạn trở nên dễ chịu hơn nữa. Khách sạn còn cung cấp bể bơi và bữa sáng. Nếu bạn lái xe đến Dalat Edensee Resort & Spa, đỗ xe miễn phí có sẵn.\n\nNếu bạn đang tìm kiếm các món ăn địa phương nổi tiếng như lẩu, có thể thử Léguda Buffet Rau Đà Lạt, nằm không xa Dalat Edensee Resort & Spa.', 1, 'http://localhost:3000/images/1590344099765.jpg'),
(42, 'Khách sạn Imperial Vũng Tàu', '159 Thùy Vân, Thắng Tam, Vũng Tàu, Việt Nam', 5, 'VT', 'Các phòng tại Khách sạn Imperial Vũng Tàu cung cấp tv màn hình phẳng, tủ lạnh và quầy bar mini đưa lại sự thoải mái và thuận tiện tuyệt vời và khách có thể online với wifi miễn phí.\n\nNhân viên hỗ trợ khách và dịch vụ phòng là một trong những điểm thuận tiện có được tại khách sạn. Bể bơi và bữa sáng sẽ giúp chuyến đi của bạn trở nên đặc biệt hơn. Nếu bạn lái xe tới Khách sạn Imperial Vũng Tàu, đỗ xe miễn phí có sẵn.\n\nGần với những địa danh nổi tiếng ở Vũng Tàu như Đài tưởng niệm liệt sỹ Vũng Tàu (0,6 km) và Lăng cá ông (1,2 km), Khách sạn Imperial Vũng Tàu là một lựa chọn lý tưởng cho khách du lịch.\n\nNếu bạn tìm kiếm nhà hàng kiểu ý, có thể ghé thăm David Pizzeria, Ly\'s Coffee & Cakes hoặc Prego Yogurt, nằm cách chỉ vài bước chân từ Khách sạn Imperial Vũng Tàu.', 1, 'http://localhost:3000/images/1590375025123.jpg'),
(43, 'Khách sạn Pullman Vung Tau', '15 Thi Sach Street Thang Tam Ward, Vũng Tàu Việt Nam', 5, 'VT', 'Là “ngôi nhà xa xứ,” các phòng khách sạn cung cấp tv màn hình phẳng, điều hòa nhiệt độ và tủ lạnh, và kết nối mạng thật dễ dàng, với wifi miễn phí sẵn có.\n\nKhách có thể dùng dịch vụ phòng và nhân viên hỗ trợ khách khi nghỉ tại Pullman Vung Tau. Ngoài ra, Pullman Vung Tau còn có bể bơi và nhà hàng, sẽ làm cho kì nghỉ của bạn ở Vũng Tàu trở nên tuyệt vời hơn nữa. Thuận tiện hơn nữa, còn có đỗ xe miễn phí có sẵn cho khách.\n\nNếu muốn ở gần những địa danh yêu thích như Đài tưởng niệm liệt sỹ Vũng Tàu (0,9 km) và Lăng cá ông (1,7 km), du khách tại Pullman Vung Tau có thể dễ dàng đến thăm những địa điểm nổi tiếng nhất này của Vũng Tàu.\n\nNếu bạn tìm kiếm nhà hàng kiểu ý, có thể ghé thăm David Pizzeria, Ly\'s Coffee & Cakes hoặc Prego Yogurt, nằm cách chỉ vài bước chân từ Pullman Vung Tau.', 1, 'http://localhost:3000/images/1590376828916.jpg'),
(44, 'The Grand Ho Tram Resort & Casino', 'Phuoc Thuan, Xuyen Moc, Hồ Tràm, Phuoc Thuan, Bà Rịa-Vũng Tàu, Việt Nam', 5, 'VT', 'Khu nghỉ dưỡng này rộng tới 164ha với số phòng lên tới 1.100 phòng. Nằm dọc bãi biển Hồ Tràm, The Grand Hồ Tràm Strip có 3 hồ bơi nhìn ra bãi biển. Điều thú vị là ở khu vực hồ bơi này, du khách có thể trải nghiệm khu trò chơi trượt nước Gragon Slide cao tới 18m.\n\nỞ The Grand Hồ Tràm Strip có nhiều hệ thống phòng chất lượng cho du khách trải nghiệm những dịch vụ tốt nhất, đẳng cấp nhất\nBên cạnh đó, The Grand Hồ Tràm Strip còn có khu vui chơi dành riêng cho trẻ em với rất nhiều hoạt động giải trí. Ở đây còn có dịch vụ trông giữ trẻ để du khách có thể dành thời gian riêng tư cho nhau hoặc tham gia các hoạt động vui chơi trên bãi biển đầy hấp dẫn khác.\n\nỞ The Grand Hồ Tràm Strip có hệ thống hồ bơi chất lượng, đẳng cấp cho du khách tha hồ giải trí\nNăm 2018 vừa qua, The Grand Hồ Tràm Strip đã đạt giải thưởng Khách sạn có sân golf tốt nhất châu Á trong khuôn khổ giải World Golf Award.\nCác phòng ở đây có hướng view biển, view đồi đều rất đẹp. Đồng thời, tiện ích chung của các hạng phòng là đệm lông ngỗng, phòng tắm đứng và bồn tắm nằm. Bãi biển riêng của The Grand Hồ Tràm Strip cũng rất đẹp với nhiều nét còn hoang sơ với những hàng cây xanh mát đầy thơ mộng trên bờ.\n\n', 1, 'http://localhost:3000/images/1590377688209.jpg'),
(45, 'Sanctuary Residential Resort Community', 'Ho Tram, Phuoc Thuan Ward, Xuyen Moc, Ba Ria Vung Tau, Việt Nam', 5, 'VT', 'Resort có nhiều biệt thư, mỗi biệt thự đều có khu vườn riêng được chăm sóc kỹ càng và hồ bơi rất đẹp. Điểm nổi bật của Sanctuary Hồ Tràm Resort Community là không gian rất yên tĩnh, mát mẻ và đầy riêng tư. Resort có nhiều biệt thư, mỗi biệt thự đều có khu vườn riêng được chăm sóc kỹ càng và hồ bơi rất đẹp. Điểm nổi bật của Sanctuary Hồ Tràm Resort Community là không gian rất yên tĩnh, mát mẻ và đầy riêng tư.', 1, 'http://localhost:3000/images/1590377925962.jpg'),
(46, 'Saint Simeon Resort & Spa', 'Phuoc Tinh Commune Xã Phước Tỉnh, Huyện Long Điền, Vũng Tàu, Việt Nam', 4, 'VT', 'Saint Simeon Resort & Spa nằm dọc theo biển Long Hải của Vũng Tàu. Long Hải vốn nổi tiếng là bãi biển mộc mạc, còn những nét hoang sơ, do đó bãi biển riêng của Saint Simeon Resort & Spa cũng mang đầy đủ những nét đẹp này. Với Saint Simeon, có thể dùng câu “đại dương ngay trước cửa” để mô tả về nơi nghỉ dưỡng xinh đẹp này. Saint Simeon Resort & Spa gồm 133 biệt thự nghỉ dưỡng biển đầy sang trọng, mỗi biệt thự gồm 2 – 3 phòng ngủ với thiết kế rất sang trọng và tiện nghi. Loại Deluxe là những biệt thự có view hồ bơi và sân vườn xanh mát. Hạng Premium có không gian mở và lối đi thẳng ra biển đầy lãng mạn. Loại phòng Suite nằm giữa khu vườn xinh đẹp hoặc nằm ngay trên bãi biển rì rào sóng vỗ.\n\nMỗi biệt thự ở Saint Simeon Resort đều có hệ thống phòng ngủ rộng rãi, được thiết kế theo kiến trúc sang trọng\nLoại phòng Princess có sân vườn, hồ bơi và quản gia riêng trong suốt kỳ nghỉ của du khách. Saint Simeon Resort & Spa có 3 nhà hàng với 3 phong cách chế biến khác nhau để đáp ứng các nhu cầu đa dạng của du khách. Trong đó, phục vụ du khách ăn sáng và ăn uống cả ngày là nhà hàng Bettina Cucina.\n\nỞ Saint Simeon Resort cũng có hồ bơi khá chất lượng cho du khách trải nghiệm\nNhà hàng ẩm thực cao cấp với thực đơn phong phú, bao gồm cả hải sản tươi sống là Bettina Signature. Còn nhà hàng Bettina Lounge chính là quầy bar ngay trên bờ biển với các món nước ngon miệng. Nơi này còn có dịch vụ Spa riêng sử dụng các loại tinh dầu nhập khẩu từ Bottega.\n', 1, 'http://localhost:3000/images/1590378172269.jpg'),
(47, 'Oceanami Villas & Beach Club', 'Quốc Lộ 44A Huyện Đất Đỏ, Phước Hải, Tỉnh Bà Rịa-Vũng Tàu, Việt Nam', 4, 'VT', 'Oceanami Villas & Beach Club Long Hải có vị trí rất tốt khi lưng dựa vào núi Minh Đạm nổi tiếng, trước mặt là biển Long Hải. Nơi này có bãi biển riêng dài 700m tuyệt đẹp với cát mịn, biển xanh và những hàng phi lao xanh mát.\n\nOceanami Villas & Beach Club Long Hải gồm 347 căn biệt thự. Mỗi căn biệt thự đều được thiết kế để nằm giữa một khu vườn tươi tốt, do đó không khí vừa trong lành vừa yên tĩnh, thanh bình. Tầng thượng mỗi căn biệt thự đều có view biển nên làm hài lòng được những du khách yêu biển. Một điểm nổi bật nữa của Oceanami Villas & Beach Club Long Hải là hồ bơi vô cực rộng lớn gần 2.000m2, khiến du khách cảm thấy gần gũi với biển khơi hơn. Oceanami Villas & Beach Club Long Hải có 2 nhà hàng và 3 louge, 1 club trên bãi biển rất sôi động, dịch vụ spa, khu vui chơi cho trẻ em, khu tập gym và fitness cho người lớn… Tất cả đều tạo nên sức hấp dẫn lớn cho Oceanami Villas & Beach Club Long Hải và do đó, được xem là một trong những địa điểm nghỉ dưỡng đáng nhớ.\n', 1, 'http://localhost:3000/images/1590378414669.jpg'),
(48, 'Khu Nghỉ Dưỡng Cam Ranh Riviera', 'D4B, Bai Dai, Cam Hải Đông, Khánh Hòa, Việt Nam', 5, 'KH', 'Khu nghỉ dưỡng Cam Ranh Riviera cung cấp cho khách nhiều tiện nghi bao gồm tv màn hình phẳng, tủ lạnh và quầy bar mini, và kết nối mạng là có thể vì wifi miễn phí có sẵn. Khách sạn cung cấp dịch vụ phòng, làm cho kỳ nghỉ của bạn dễ chịu hơn nữa. Khách sạn còn cung cấp bể bơi và bữa sáng. Khách đi đến khách sạn bằng phương tiện của mình có thể dùng đỗ xe miễn phí. Cam Ranh cũng là nơi sinh ra Tượng đài Hữu nghị Việt - Nga, một đài kỷ niệm nổi tiếng nằm không xa Khu nghỉ dưỡng Cam Ranh Riviera. Khu nghỉ dưỡng Cam Ranh Riviera mong muốn được chào đón bạn trong chuyến đi đến Cam Ranh của bạn.', 1, 'http://localhost:3000/images/1590379023688.jpg'),
(49, 'Khách sạn & Spa Bãi biển Sunrise Nha Trang', '12 - 14 Tran Phu St., Nha Trang, Khánh Hòa, Việt Nam', 5, 'KH', 'Các phòng khách sạn cung cấp tv màn hình phẳng, quầy bar mini và điều hòa nhiệt độ, và online là có thể vì wifi miễn phí có sẵn, cho phép bạn thư giãn nghỉ ngơi không phải lo lắng gì.\n\nSunrise Nha Trang Beach Hotel cung cấp dịch vụ phòng và nhân viên hỗ trợ khách. Hơn nữa, là khách hàng giá trị của Sunrise Nha Trang Beach Hotel, bạn có thể tận hưởng bể bơi và bữa sáng, có sẵn tại khách sạn. Khách đi đến khách sạn bằng phương tiện của mình có thể dùng đỗ xe miễn phí.\n\nNằm gần các địa danh như Thap Tram Huong (0,3 km) và King\'s palace (0,6 km) đã làm Sunrise Nha Trang Beach Hotel trở thành lựa chọn lý tưởng khi đến Nha Trang.\n\nKhi ở đây, hãy chắc chắn thử một số nhà hàng kiểu tây ban nha, bao gồm La Mancha Restaurant, Smoke Villa Lounge và Nhà Hàng Villa LM, đều nằm gần Khách sạn & Spa Bãi biển Sunrise Nha Trang.', 1, 'http://localhost:3000/images/1590379191842.jpg'),
(50, 'Khách sạn và Spa Sheraton Nha Trang', '26 - 28 Tran Phu Street, Nha Trang, Khánh Hòa, Việt Nam', 5, 'KH', 'Các phòng tại Sheraton Nha Trang Hotel cung cấp tv màn hình phẳng, quầy bar mini và điều hòa nhiệt độ đưa lại sự thoải mái và thuận tiện tuyệt vời và khách có thể online với wifi miễn phí.\n\nDịch vụ phòng, nhân viên hỗ trợ khách và sân thượng là một trong những điểm thuận tiện có được tại khách sạn. Bể bơi và bữa sáng sẽ giúp chuyến đi của bạn trở nên đặc biệt hơn. Nếu bạn lái xe tới Sheraton Nha Trang Hotel, đỗ xe miễn phí có sẵn.\n\nGần với những địa danh nổi tiếng ở Nha Trang như Bac Thanh Church (0,5 km) và Thap Tram Huong (0,5 km), Sheraton Nha Trang Hotel là một lựa chọn lý tưởng cho khách du lịch.\n\nNếu bạn thích nhà hàng kiểu pháp, Sheraton Nha Trang Hotel nằm gần Refuge, Time House Bistro và Nhà Hàng Villa LM.', 1, 'http://localhost:3000/images/1590379448234.jpg'),
(51, 'Vinpearl Resort & Spa Nha Trang Bay', 'Hon Tre Island, Nha Trang, Khánh Hòa, Việt Nam', 5, 'KH', 'Gần với một số địa danh nổi tiếng ở Nha Trang như Tran Phu Bridge (4,4 km) và Giáo Xứ Thánh Giuse (4,9 km), Vinpearl Resort & Spa Nha Trang Bay là lựa chọn lý tưởng của khách du lịch.\n\nCác phòng tại Vinpearl Resort & Spa Nha Trang Bay cung cấp tv màn hình phẳng, điều hòa nhiệt độ và quầy bar mini, và khách có thể được kết nối wifi miễn phí.\n\nNgoài ra, khi nghỉ dưỡng tại Vinpearl Resort & Spa Nha Trang Bay khách có thể dùng nhân viên hỗ trợ khách và dịch vụ phòng. Bạn cũng có thể tận hưởng bể bơi và bữa sáng. Cần chỗ đỗ xe ? Đỗ xe miễn phí có sẵn tại Vinpearl Resort & Spa Nha Trang Bay.\n\nKhi ở đây, hãy chắc chắn thử một số nhà hàng kiểu á, bao gồm Sailing Club Nha Trang, Louisiane Brewhouse và Nhà Hàng Yến, đều nằm gần Vinpearl Resort & Spa Nha Trang Bay.', 1, 'http://localhost:3000/images/1590379628139.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `repas`
--

CREATE TABLE `repas` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pices` int(11) NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `energi` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room_hotel`
--

CREATE TABLE `room_hotel` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `prices` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_hotel` int(11) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room_hotel`
--

INSERT INTO `room_hotel` (`id`, `name`, `type`, `prices`, `detail`, `id_hotel`, `number`) VALUES
(1, 'Phòng cặp đôi', 3, '2500000', 'Phòng cupbe cho cặp tình nhân', 1, 10),
(2, 'Phòng đôi vip', 2, '5000000', 'Phòng cupbe vip cho cặp đôi hưởng tuần trăng mật', 1, 10),
(3, 'Phòng 4 gia đình', 3, '5000000', 'Phòng dành cho gia đình nhỏ', 1, 10),
(4, 'Phòng 4 cho gia đình vip', 2, '10000000', 'Phòng vip dành cho gia đình', 1, 10),
(5, 'Phòng 8 dành cho gia đình lớn hoặc nhóm nhỏ', 3, '15000000', 'Phòng dành cho gia đình lớn hoặc nhóm nhỏ', 1, 10),
(7, 'ád', 1, '12312312', 'đá', 9, 12),
(8, '124', 2, '12312312321', 'ádadad', 9, 43),
(9, 'qưeqwe', 2, '12312321', 'adasd', 10, 12),
(10, 'test', 1, '124707890', 'test', 10, 2),
(15, 'Phòng Standard (STD)', 3, '500000', 'là loại phòng có diện tích nhỏ, đơn giản với những trang bị tối thiểu, không có view hoặc view không đẹp', 11, 10),
(20, 'Phòng đôi Superior, 1 giường cỡ king (City View)', 1, '3000000', 'Phòng cách âm được trang bị Wi-Fi và Internet có dây miễn phí cùng minibar. Khách có thể tận hưởng lò sưởi, bên cạnh nhiều tiện nghi, dịch vụ tiêu chuẩn khác như dịch vụ phòng và TV LCD. Phòng thích hợp cho các hộ gia đình có con nhỏ và được miễn phí bữa sáng.', 11, 50),
(21, 'Phòng 2 giường đơn Superior, 2 giường đơn (City View)', 2, '2000000', 'Phòng cách âm được trang bị Wi-Fi và Internet có dây miễn phí cùng minibar. Khách có thể tận hưởng lò sưởi, bên cạnh nhiều tiện nghi, dịch vụ tiêu chuẩn khác như dịch vụ phòng và TV LCD. Thích hợp với những cặp vợ chồng có thêm con nhỏ hay các cặp đôi.', 11, 50),
(23, 'Phòng đôi Premier, Quang cảnh hồ', 1, '3500000', 'Phòng cách âm được trang bị Wi-Fi và Internet có dây miễn phí cùng minibar. Khách có thể tận hưởng lò sưởi, bên cạnh nhiều tiện nghi, dịch vụ tiêu chuẩn khác như dịch vụ phòng và TV LCD. Phòng thích hợp cho các hộ gia đình có con nhỏ hay các couple và được miễn phí bữa sáng.', 11, 50),
(24, 'Phòng 2 giường đơn Premier, Quang cảnh hồ', 1, '3500000', 'Phòng cách âm được trang bị Wi-Fi và Internet có dây miễn phí cùng minibar. Khách có thể tận hưởng lò sưởi, bên cạnh nhiều tiện nghi, dịch vụ tiêu chuẩn khác như dịch vụ phòng và TV LCD. Phòng thích hợp cho các hộ gia đình có con nhỏ hay các couple và được miễn phí bữa sáng.', 11, 50),
(26, 'Phòng Signature Giường Đôi', 1, '3500000', 'Phòng lớn có tầm nhìn ra thành phố. Loại phòng này không thể chứa một giường phụ. Bao bữa sáng - Miễn phí hủy phòng - Đặt phòng trước, thanh toán khi đến nghỉ - Giá bao. Ở tối đa đươc 2 người lớn và 1 trẻ e.\n', 11, 5),
(27, 'Studio', 1, '3500000', 'Studio được trang bị tốt với nhà bếp và một phòng lớn. Nhà bếp có tủ lạnh lớn, bếp điện và lò vi sóng. Quan điểm của thành phố có thể được thưởng thức từ các studio. Bao bữa sáng - Miễn phí hủy phòng - Đặt phòng trước, thanh toán khi đến nghỉ - Giá bao gồm bữa sáng - WiFi. Ở tối đa được 2 người lớn và 1 trẻ em.', 11, 5),
(28, 'Phòng Premier 2 Giường Đơn với Tầm nhìn ra Hồ', 1, '3900000', 'Phòng 2 Giường Đơn này có TV truyền hình vệ tinh, ấm đun nước điện và áo choàng tắm. Bao bữa sáng  - Miễn phí hủy phòng - Đặt phòng trước, thanh toán khi. Ở tối đa 2 người lớn và 1 trẻ em.', 11, 5),
(29, 'Phòng Deluxe, 1 giường cỡ king', 3, '3500000', 'Phòng 42 mét vuông mét vuông với quang cảnh thành phố. Internet - Truy cập Wifi và internet có dây miễn phí.\nGiải trí - TV LED 48 inch với các kênh truyền hình cáp.\nĂn uống - Dụng cụ pha cà phê/trà, minibar, dịch vụ phòng 24 giờ và nước đóng chai miễn phí.\nGiấc ngủ - Bộ trải giường cao cấp, chăn bông, danh sách các loại gối cho khách chọn lựa, màn/rèm cản sáng và dịch vụ dọn phòng buổi tối.\nPhòng tắm - Phòng tắm riêng, dép đi trong nhà cùng bồn tắm và buồng tắm vòi sen riêng với vòi sen phun mưa (cố định).\nTiện nghi - Két an toàn, bàn ủi/dụng cụ ủi quần áo và bàn; giường gấp/giường phụ theo yêu cầu.\nTiện nghi - Máy điều hòa nhiệt độ và dịch vụ dọn phòng hàng ngày\n\nThông tin cần biết - Không có nôi (cũi)/giường cho trẻ sơ sinh, không có bộ trải giường.\n-Không hút thuốc', 12, 5),
(30, 'Phòng 2 giường đơn Deluxe', 3, '4500000', 'Phòng 42 mét vuông mét vuông với quang cảnh thành phố. Internet - Truy cập Wifi và internet có dây miễn phí. Giải trí - TV LED 48 inch với các kênh truyền hình cáp. Ăn uống - Dụng cụ pha cà phê/trà, minibar, dịch vụ phòng 24 giờ và nước đóng chai miễn phí. Giấc ngủ - Bộ trải giường cao cấp, chăn bông, danh sách các loại gối cho khách chọn lựa, màn/rèm cản sáng và dịch vụ dọn phòng buổi tối. Phòng tắm - Phòng tắm riêng, dép đi trong nhà cùng bồn tắm và buồng tắm vòi sen riêng với vòi sen phun mưa (cố định). Tiện nghi - Két an toàn, bàn ủi/dụng cụ ủi quần áo và bàn; giường gấp/giường phụ theo yêu cầu. Tiện nghi - Máy điều hòa nhiệt độ và dịch vụ dọn phòng hàng ngày. Thông tin cần biết - Không có nôi (cũi)/giường cho trẻ sơ sinh, không có bộ trải giường. -Không hút thuốc và miễn phí bữa sáng cho 2 người.', 12, 5),
(31, 'Phòng Suite Junior (Twins)', 3, '6000000', 'Phòng 61 mét vuông mét vuông với quang cảnh thành phố.\nInternet - Truy cập Wifi và internet có dây miễn phí.\nGiải trí - TV LED 48 inch với các kênh truyền hình cáp.\nĂn uống - Dụng cụ pha cà phê/trà, minibar, dịch vụ phòng 24 giờ và nước đóng chai miễn phí.\nGiấc ngủ - Bộ trải giường cao cấp, chăn bông, danh sách các loại gối cho khách chọn lựa, màn/rèm cản sáng và dịch vụ dọn phòng buổi tối.\nPhòng tắm - Phòng tắm riêng với bồn tắm và buồng tắm vòi sen riêng, áo choàng tắm và dép đi trong nhà.\nTiện nghi - Két an toàn, bàn ủi/dụng cụ ủi quần áo và bàn; giường gấp/giường phụ theo yêu cầu.\nTiện nghi - Máy điều hòa nhiệt độ và dịch vụ dọn phòng hàng ngày.\nThông tin cần biết - Không có nôi (cũi)/giường cho trẻ sơ sinh, không có bộ trải giường và không hút thuốc, miễn phí ăn sáng cho 2 người.', 12, 5),
(32, 'Phòng Suite Deluxe, 1 giường cỡ king', 2, '10000000', 'Phòng 99 mét vuông mét vuông với quang cảnh thành phố.\nInternet - Truy cập Wifi và internet có dây miễn phí.\nGiải trí - TV LED 48 inch với các kênh truyền hình cáp.\nĂn uống - Dụng cụ pha cà phê/trà, minibar, dịch vụ phòng 24 giờ và nước đóng chai miễn phí.\nGiấc ngủ - Bộ trải giường cao cấp, chăn bông, danh sách các loại gối cho khách chọn lựa, màn/rèm cản sáng và dịch vụ dọn phòng buổi tối.\nPhòng tắm - Phòng tắm riêng với bồn tắm và buồng tắm vòi sen riêng, dép đi trong nhà và đồ dùng nhà tắm được thiết kế riêng.\nTiện nghi - Két an toàn, bàn ủi/dụng cụ ủi quần áo và bàn; giường gấp/giường phụ và nôi/giường cho trẻ sơ sinh miễn phí theo yêu cầu.\nTiện nghi - Máy điều hòa nhiệt độ và dịch vụ dọn phòng hàng ngày.\nHỗ trợ người khuyết tật - Có lối đi dành cho xe lăn.\nThông tin cần biết - Không có bộ trải giường, không hút thuốc, miến phí bữa sáng cho 2 người', 12, 15),
(34, 'Phòng Junior (Club King- No Children Allowed)', 2, '8000000', 'Phòng 61 mét vuông mét vuông với quang cảnh thành phố. Internet - Truy cập Wifi và internet có dây miễn phí. Giải trí - TV LED 48 inch với các kênh truyền hình cáp. Ăn uống - Dụng cụ pha cà phê/trà, minibar, dịch vụ phòng 24 giờ và nước đóng chai miễn phí. Giấc ngủ - Bộ trải giường cao cấp, chăn bông, danh sách các loại gối cho khách chọn lựa, màn/rèm cản sáng và dịch vụ dọn phòng buổi tối. Phòng tắm - Phòng tắm riêng với bồn tắm và buồng tắm vòi sen riêng, áo choàng tắm và dép đi trong nhà. Tiện nghi - Két an toàn, bàn ủi/dụng cụ ủi quần áo và bàn; giường gấp/giường phụ theo yêu cầu. Tiện nghi - Máy điều hòa nhiệt độ và dịch vụ dọn phòng hàng ngày. Thông tin cần biết - Không có nôi (cũi)/giường cho trẻ sơ sinh, không có bộ trải giường và không hút thuốc, miễn phí ăn sáng cho 2 người.', 12, 15),
(35, 'Phòng Suite Premier, 1 giường cỡ king', 1, '15000000', 'Phòng 147 mét vuông mét vuông với quang cảnh thành phố. Internet - Truy cập Wifi và internet có dây miễn phí. Giải trí - TV LED 48 inch với các kênh truyền hình cáp. Ăn uống - Dụng cụ pha cà phê/trà, minibar, dịch vụ phòng 24 giờ và nước đóng chai miễn phí. Giấc ngủ - Bộ trải giường cao cấp, chăn bông, danh sách các loại gối cho khách chọn lựa, màn/rèm cản sáng và dịch vụ dọn phòng buổi tối. Phòng tắm - Phòng tắm riêng với bồn tắm và buồng tắm vòi sen riêng, áo choàng tắm và dép đi trong nhà. Tiện nghi - Két an toàn, bàn ủi/dụng cụ ủi quần áo và bàn; giường gấp/giường phụ theo yêu cầu. Tiện nghi - Máy điều hòa nhiệt độ và dịch vụ dọn phòng hàng ngày. Thông tin cần biết - Không có nôi (cũi)/giường cho trẻ sơ sinh, không có bộ trải giường và không hút thuốc, miễn phí ăn sáng cho 2 người.', 12, 15),
(37, 'Phòng trải chiếu Tatami', 3, '1200000', 'Phòng đôi này có máy sấy quần áo. Bao bữa sáng - Miễn phí hủy phòng - Đặt phòng trước, thanh toán khi đến nghỉ', 13, 10),
(38, 'Phòng Deluxe Giường Đôi/2 Giường Đơn Nhìn Ra Thành Phố', 2, '3900000', 'Bao bữa sáng- Miễn phí hủy phòng - Giá bao gồm bữa sáng. Ở tối đa 2 người lớn và 1 trẻ em.', 13, 10),
(39, 'Phòng Cổ Điển Giường Đôi/2 Giường Đơn', 2, '3500000', 'Với sàn gỗ, các phòng máy lạnh được trang bị két an toàn, TV truyền hình cáp màn hình phẳng, minibar và khu vực tiếp khách. Mỗi phòng đều có phòng tắm riêng với vòi sen và đồ vệ sinh cá nhân miễn phí. Ở tối đa 2 người lớn và 1 trẻ em.', 13, 10),
(40, 'Phòng Deluxe có ban công', 1, '4500000', 'Căn phòng này đặc trưng với một ban công riêng với tầm nhìn ra khung cảnh thành phố. Phòng tắm riêng được trang bị bồn tắm. Bao bữa sáng - Miễn phí hủy phòng - Giá bao gồm bữa sáng - WiFi miễn phí.\n\n', 13, 10),
(41, 'Suite có Ban công', 1, '5500000', 'Phòng rộng rãi có 2 giường đơn/1 giường cỡ King, khu vực ghế ngồi với ghế sofa và ban công riêng nhìn ra quang cảnh thành phố. Phòng tắm riêng được trang bị bồn tắm. Bao bữa sáng - Miễn phí hủy phòng - Giá bao gồm bữa sáng - WiFi miễn phí. Ở tối đa 2 người lớn và 1 trẻ em.', 13, 10),
(42, 'Deluxe Room', 3, '1600000', 'Phòng có diện tích 25m2, có phòng ngủ lớn, Thiết kế hoàn hảo với phong cách Euro với nội thất nhập khẩu từ Singapore, sàn gỗ thơm. Bạn có thể tham gia chợ đêm, con phố buôn bán sầm uất nhất Hà Nội. Windows được trang bị kính hai lớp để bạn không phải lo lắng về tiếng ồn từ đường phố. Miễn phí bữa sáng.', 14, 10),
(43, 'Family Room', 2, '2600000', 'Phòng Suite rộng rãi với trang thiết bị hiện đại.  Miễn phí bữa sáng. Ở tối đa 2 người lớn và 1 trẻ em.', 14, 10),
(44, 'Penthouse Suite', 1, '3600000', 'Phòng ba người (tối đa 3 người lớn) và 1 trẻ em. Phòng có diện tích 35m2, có phòng ngủ lớn, Thiết kế hoàn hảo với phong cách Euro với nội thất nhập khẩu từ Singapore, sàn gỗ thơm. Bạn có thể tham gia chợ đêm, con phố buôn bán sầm uất nhất Hà Nội. Windows được trang bị kính hai lớp để bạn không phải lo lắng về tiếng ồn từ đường phố. Miễn phí bữa sáng.', 14, 10),
(45, 'Phòng Deluxe 2 Giường Đơn', 3, '2700000', 'Với thiết kế nội thất trang nhã và độc đáo, phòng rộng rãi này có sàn gỗ và phòng tắm sang trọng được trang bị tiện nghi vòi sen cũng như đồ vệ sinh cá nhân cao cấp. Khách có thể truy cập miễn phí hơn 2.000 tờ báo và tạp chí trên máy tính bảng hoặc điện thoại thông minh của mình trong suốt thời gian lưu trú. Ở tối đa 2 người và wifi miễn phí.', 15, 10),
(46, 'Phòng đôi vip', 2, '3000000', 'phòng cho cặp đôi', 15, 10),
(47, 'Phòng Deluxe có giường cỡ King', 3, '2700000', 'Với thiết kế nội thất hiện đại, phòng này có sàn gỗ, TV màn hình phẳng (đi kèm kết nối laptop) và phòng tắm sang trọng được trang bị tiện nghi vòi sen riêng biệt cũng như đồ vệ sinh cá nhân cao cấp. Phòng nhìn ra quang cảnh thành phố, nhà hát lớn hoặc giếng trời giữa khách sạn. Bao gồm quyền đọc miễn phí trên 2.000 tờ báo và tạp chí trên máy tính bảng hoặc điện thoại thông minh của quý khách trong suốt thời gian lưu trú của khách.  Ở tối đa 2 người và wifi miễn phí.', 15, 10),
(48, 'Phòng Deluxe có giường cỡ King ', 2, '3700000', 'Với thiết kế nội thất hiện đại, phòng này có sàn gỗ, TV màn hình phẳng (đi kèm kết nối laptop) và phòng tắm sang trọng được trang bị tiện nghi vòi sen riêng biệt cũng như đồ vệ sinh cá nhân cao cấp. Phòng nhìn ra quang cảnh thành phố, nhà hát lớn hoặc giếng trời giữa khách sạn. Bao gồm quyền đọc miễn phí trên 2.000 tờ báo và tạp chí trên máy tính bảng hoặc điện thoại thông minh của quý khách trong suốt thời gian lưu trú của khách. Ở tối đa 2 người và wifi miễn phí, bao bữa sáng.', 15, 10),
(49, 'Phòng Giường Đôi Grand Deluxe', 1, '4700000', 'Với lối trang trí độc đáo và thanh lịch, phòng rộng rãi này có sàn gỗ, TV truyền hình cáp màn hình LCD 32 inch và kết nối máy tính xách tay với TV. Nhìn ra giếng trời giữa khách sạn, phòng này được trang bị tiện nghi pha trà/cà phê và minibar. Phòng tắm riêng đi kèm tiện vòi sen và đồ vệ sinh cá nhân cao cấp. Khách có thể truy cập miễn phí hơn 2.000 tờ báo và tạp chí trên máy tính bảng hoặc điện thoại thông minh của mình trong suốt thời gian lưu trú. Ở tối đa 2 người và wifi miễn phí, bao bữa sáng.', 15, 10),
(50, ' Suite L\'Opera King', 1, '5500000', 'Với tầm nhìn ra quang cảnh thành phố/Nhà Hát Lớn, Suite này có lối trang trí lấy cảm hứng từ Pháp, khu vực phòng ngủ và tiếp khách tích hợp, sàn gỗ, TV truyền hình cáp màn hình phẳng 36 inch với kết nối máy tính xách tay với TV, ổ cắm cho iPod và phòng tắm riêng với tiện nghi bồn tắm cùng vòi sen riêng biệt. Quyền lợi của khách bao gồm: - Nhận phòng/trả phòng cấp tốc ngay tại phòng theo yêu cầu - Miễn phí các cuộc gọi điện thoại nội hạt không hạn chế (ngoại trừ các số điện thoại di động) - Miễn phí sử dụng phòng họp cho tối đa 6 người trong 1 giờ/đợt lưu trú (tùy vào tình trạng sẵn có) - Miễn phí trả phòng trễ đến 16:00 (tùy vào tình trạng phòng trống) - Miễn phí cocktail và bánh canapé vào buổi tối tại quán La Fee Verte Bar từ 17:00 - 19:30 hàng ngày - Miễn phí cocktail tại quán La Fee Verte Bar từ 17:00 - 19:30 hàng ngày - Đồ vệ sinh cá nhân sang trọng hiệu L\'Occitane. Ở tối đa 2 người và wifi miễn phí, bao bữa sáng.', 15, 10),
(51, ' Phòng Cổ Điển Có Giường Cỡ King ', 3, '1000000', 'Nằm trên các tầng 5-6, suite lắp máy điều hòa rộng rãi này có tầm nhìn ra Khu phố cổ và thành phố. Suite có phòng sinh hoạt riêng biệt, tủ lạnh mini và tiện nghi pha trà/cà phê. Bao bữa sáng , ở tối đa 2 người lớn và 1 trẻ em.', 16, 10),
(52, 'Phòng Giường Đôi Với Tầm Nhìn Ra Toàn Cảnh ', 2, '2000000', 'Phòng gắn máy điều hòa rộng rãi này nằm ở tầng trên và có tầm nhìn ra quang cảnh Khu Phố Cổ, Sông Hồng cũng như thành phố. Phòng đi kèm tủ lạnh mini và tiện nghi pha trà/cà phê. Bao bữa sáng , ở tối đa 2 người lớn và 1 trẻ em.', 16, 10),
(53, 'Suite Gia Đình', 1, '3000000', 'Nằm trên tầng 3-4 và nhìn ra quang cảnh Khu Phố Cổ cũng như thành phố, các phòng rộng rãi này có khu vực ghế ngồi riêng biệt, tủ lạnh mini và tiện nghi pha trà/cà phê. Bao bữa sáng , ở tối đa 4 người lớn và 1 trẻ em.', 16, 10),
(54, 'King Classic', 3, '950000', 'Tất cả 15 khu phòng cách âm được trang bị Wi-Fi và Internet có dây miễn phí cùng dịch vụ phòng 24 giờ. Bộ đồ giường cao cấp và chăn bông mang đến sự thoải mái cho khách; ngoài ra, phòng còn được trang bị khu tiếp khách tách biệt và tủ lạnh tiện lợi. Bao bữa sáng , ở tối đa 3 người.', 16, 15),
(55, 'Phòng đôi Superior, 1 giường cỡ queen', 3, '750000', 'Khu phòng cách âm được trang bị Wi-Fi và Internet có dây miễn phí cùng dịch vụ phòng 24 giờ. Bên cạnh khu tiếp khách tách biệt và tủ lạnh tiện lợi cho kỳ lưu trú, khách có thể giải trí cùng TV LCD với các kênh truyền hình cáp và đầu đĩa DVD. Ở tối đa 2 người và miễn phí bữa sáng.', 17, 10),
(56, 'Phòng đôi Deluxe, 1 giường cỡ queen', 3, '850000', 'Khu phòng cách âm được trang bị Wi-Fi và Internet có dây miễn phí cùng dịch vụ phòng 24 giờ. Bên cạnh khu tiếp khách tách biệt và tủ lạnh tiện lợi cho kỳ lưu trú, khách có thể giải trí cùng TV LCD với các kênh truyền hình cáp và đầu đĩa DVD. Ở tối đa 2 người và miễn phí bữa sáng.', 17, 8),
(57, 'Phòng Suite Junior, Nhiều giường, Ban công, Quang cảnh thành phố', 2, '1250000', 'Khu phòng cách âm được trang bị Wi-Fi và Internet có dây miễn phí cùng dịch vụ phòng 24 giờ. Bên cạnh khu tiếp khách tách biệt và tủ lạnh tiện lợi cho kỳ lưu trú, khách có thể giải trí cùng TV LCD với các kênh truyền hình cáp và đầu đĩa DVD. Ở tối đa 3 người và miễn phí bữa sáng.', 17, 8),
(58, 'Phòng Suite dành cho gia đình, 2 giường cỡ queen, Quang cảnh thành phố', 1, '1650000', 'Khu phòng cách âm được trang bị Wi-Fi và Internet có dây miễn phí cùng dịch vụ phòng 24 giờ. Bên cạnh khu tiếp khách tách biệt và tủ lạnh tiện lợi cho kỳ lưu trú, khách có thể giải trí cùng TV LCD với các kênh truyền hình cáp và đầu đĩa DVD. Ở tối đa 5 người và miễn phí bữa sáng.', 17, 8),
(59, 'Phòng Superior', 3, '650000', 'Phòng dành cho các cặp đôi, vợ chồng mới cưới. Bao bữa sáng.', 18, 8),
(60, 'Phòng Deluxe', 3, '750000', 'Phòng dành cho các cặp đôi, gia đình, nhóm bạn đi đu lịch.Ở tối đa 4 người và Bao bữa sáng.', 18, 8),
(61, 'Family Room', 2, '950000', 'Phòng dành cho các gia đình, nhóm bạn đi đu lịch.Ở tối đa 4 người và Bao bữa sáng.', 18, 8),
(62, 'Suite', 2, '1050000', 'Phòng dành cho các gia đình, nhóm bạn đi đu lịch.Ở tối đa 3 người và Bao bữa sáng.', 18, 8),
(63, 'Phòng Deluxe giường đôi hoặc 2 giường đơn', 3, '1150000', 'Phòng rộng rãi, thoáng mát, sạch sẽ. Không giới hạn số người và có bao gồm bữa sáng.', 19, 8),
(64, 'Deluxe giường King hoặc 2 giường', 3, '1550000', 'Phòng rộng rãi, thoáng mát, sạch sẽ. Ở tối đa  2 người và có bao gồm bữa sáng, view nhìn ra thành phố, an toàn và có wifi miễn phí.', 19, 8),
(65, 'Grand Deluxe hướng hồ', 2, '2550000', 'Phòng dành cho 2 người, có view nhìn ra hồ, miễn phí bữa sáng. Phòng thoáng mát sạch sẽ, đầy đủ tiện nghi.', 19, 8),
(66, 'Suite Deluxe Nhìn Ra Hồ', 1, '3550000', 'Phòng dành cho 2 người, có view nhìn ra hồ, miễn phí bữa sáng. Phòng thoáng mát sạch sẽ, đầy đủ tiện nghi.Tiết kiệm khi đặt phòng sớm. Giá phòng đã có giảm giá 30%!', 19, 8),
(67, 'Phòng Superior', 3, '1342500', '45m2 với 01 giường đôi hoặc 2 giường đơn. Các Phòng Superior đều được trang bị đầy đủ tiện nghi với nội thất trang nhã, sàn gỗ sáng bóng, tủ quần áo không cửa ngăn và phòng tắm lát đá cẩm thạch rộng rãi với bồn tắm và vòi sen sang trọng rộng 42,1m2. Mỗi Phòng Superior cũng được trang bị cửa sổ kính rộng rãi cho phép du khách tận hưởng Mountainview, Riverview hoặc Cityview hoàn hảo.', 20, 10),
(68, 'Phòng Deluxe Twin', 3, '1552500', 'Phòng Deluxe được trang bị đầy đủ tiện nghi, tao nhã và hết sức sang trọng. Đặc biệt diện tích bồn tắm, nhà vệ sinh lên đến 44,1m2. Mỗi Phòng Deluxe được trang bị khu vực tiếp khách hoặc chào đón khách bao gồm bàn uống cà phê trang nhã và ghế bành thoải mái, nơi quý khách có thể nói chuyện với đối tác của mình. Từ phòng Deluxe, quý khách có thể dễ dàng bắt gặp quang cảnh núi non tuyệt đẹp hoặc Riverview. 45m2 với 01 giường đôi hoặc 2 giường đơn. \n\n', 20, 10),
(69, 'Phòng Premier Deluxe', 3, '1770000', 'Nằm trên các tầng 20 và 21 của khách sạn, tất cả các Phòng Premier Deluxe thật sự cao cấp . phòng tắm lát đá cẩm thạch rộng rãi. bồn tắm trong một khu vực 45,1m2. Với chiều cao đặc biệt này, Phòng Premier Deluxe cho phép bạn ngắm nhìn toàn cảnh sông Hàn và biển núi phía xa. 45m2 với 01 giường đôi hoặc 2 giường đơn.', 20, 10),
(70, 'Phòng Executive Suite', 2, '13570000', 'Suite Executive được thiết kế theo phong cách thuộc địa Pháp tráng lệ pha trộn với các nét đặc trưng truyền thống của Việt Nam. Các phòng được thiết kế với 2 khu vực riêng biệt để làm việc và nghỉ ngơi với bàn làm việc rộng rãi cùng giường và đệm kiểu hoàng gia. Bàn ăn lớn với ghế bành thoải mái cho phép bạn dùng bữa hoặc nói chuyện kinh doanh. Một máy tập thể dục riêng được thiết lập để tập thể dục hàng ngày trong phòng. Các phòng này có diện tích 96,1m2, nằm ở tầng 20 và 21 của khách sạn và có thể khiến bạn say mê trong tầm nhìn toàn cảnh thành phố Đà Nẵng. 96m2 với 01 giường đôi cỡ lớn', 20, 10),
(71, 'Phòng President Suite', 1, '30570000', 'President Suite Room đều được trang bị đầy đủ tiện nghi và bồn tắm trong phòng tắm hơi rộng 215m2. Phòng này bao gồm các khu vực phòng ngủ của tổng thống, phòng ngủ hỗ trợ, phòng ăn, phòng họp và phòng khách. Tất cả dịch vụ cũng như chất lượng tại phòng đèu thuộc dạng cao cấp bậc nhất của khách sạn. 02 giường đôi cỡ lớn', 20, 10),
(72, 'Standard Double room, No view & Smoking', 3, '1070000', 'khu phòng đều được trang bị nhiều tiện nghi chu đáo như áo choàng tắm hay dép đi trong nhà, cùng Wi-Fi và Internet có dây miễn phí và TV màn hình phẳng với các kênh truyền hình cáp. Khách còn có thể tận hưởng nhiều tiện nghi, dịch vụ như iPod dock, minibar và dịch vụ phòng. Ở tối đa 2 người.\n\n', 21, 10),
(73, 'Phòng Suite Junior', 3, '2270000', '2 giường đơn, Quang cảnh sông, ở tối đa được 3 người lớn và 1 trẻ e. Khu phòng đều được trang bị nhiều tiện nghi chu đáo như áo choàng tắm hay dép đi trong nhà, cùng Wi-Fi và Internet có dây miễn phí và TV màn hình phẳng với các kênh truyền hình cáp. Khách còn có thể tận hưởng nhiều tiện nghi, dịch vụ như iPod dock, minibar và dịch vụ phòng.', 21, 10),
(74, 'Căn hộ, 2 phòng ngủ (Suite)', 2, '4270000', 'ở tối đa được 4 người lớn và 1 trẻ e, miễn phí bữa sáng. Khu phòng đều được trang bị nhiều tiện nghi chu đáo như áo choàng tắm hay dép đi trong nhà, cùng Wi-Fi và Internet có dây miễn phí và TV màn hình phẳng với các kênh truyền hình cáp. Khách còn có thể tận hưởng nhiều tiện nghi, dịch vụ như iPod dock, minibar và dịch vụ phòng.', 21, 10),
(75, 'Căn hộ, 2 phòng ngủ (Presidential)', 1, '5427000', 'ở tối đa được 4 người lớn và 1 trẻ e, miễn phí bữa sáng. Khu phòng đều được trang bị nhiều tiện nghi chu đáo như áo choàng tắm hay dép đi trong nhà, cùng Wi-Fi và Internet có dây miễn phí và TV màn hình phẳng với các kênh truyền hình cáp. Khách còn có thể tận hưởng nhiều tiện nghi, dịch vụ như iPod dock, minibar và dịch vụ phòng. Được1 lượt  đưa hoặc đón sân bay miễn phí.', 21, 10),
(76, 'PHÒNG DELUXE CITY VIEW', 3, '1500000', 'có diện tích 23 m². Loại phòng sang trọng tại Khách sạn. Với các tiện ích : Sức chứa 2 người lớn + 1 trẻ em, Cửa sổ view phố, Điều Hòa 2 chiều, Wifi, TV Truyền Hình Cáp,\nMáy sấy tóc, Ăn Sáng Buffet Miễn Phí, Sàn Gỗ, Dịch vụ dọn dẹp phòng mỗi ngày, Sử dụng miễn phí bể bơi & phòng gym tại khách sạn.', 22, 10),
(77, 'PHÒNG PREMIER OCEAN VIEW ', 2, '2150000', 'có diện tích 33 m². Loại phòng sang trọng tại Khách sạn. Với các tiện ích : Sức chứa 2 người lớn + 1 trẻ em, Cửa sổ view biển, Điều Hòa 2 chiều, Wifi, TV Truyền Hình Cáp, Máy sấy tóc, Ăn Sáng Buffet Miễn Phí, Sàn Gỗ, Dịch vụ dọn dẹp phòng mỗi ngày, Sử dụng miễn phí bể bơi & phòng gym tại khách sạn.', 22, 10),
(78, 'PHÒNG CĂN HỘ STUDIO', 1, '3350000', 'có diện tích 38 m². Loại phòng đặc biệt sang trọng tại Khách sạn. Với các tiện ích : Sức chứa 2 người lớn + 1 trẻ em, Cửa sổ view biển, Phòng khách, Bếp, Bàn ăn, Điều Hòa 2 Chiều, Bồn tắm, Wifi, TV Truyền Hình Cáp, Máy sấy tóc, Ăn Sáng Buffet Miễn Phí, Sàn Gỗ, Dịch vụ dọn dẹp phòng mỗi ngày, Sử dụng miễn phí bể bơi & phòng gym tại khách sạn.', 22, 10),
(82, 'Ocean View', 3, '5553000', 'Diện tích rộng rãi, Hướng biển, Nhà bếp tiện nghi, Phòng tắm hiện đại, Tiện nghi đầy đủ, sang trọng, Khách được sử dụng mọi tiện ích của Regency. Trẻ em nếu đi chung với bố mẹ dưới 12 tuổi, ngủ chung sẽ được miễn phí tiền phòng. Các khoản phụ thu ăn sáng chỉ từ 220.000 vnd, tối đa cho 1 trẻ.', 23, 10),
(83, 'Regency Club', 3, '6055300', 'Phòng hướng biển, Hai giường đôi, 42 mét vuông (452 ​​dặm vuông), Một bàn làm việc rộng rãi với ánh sáng nâng cao', 23, 10),
(84, 'Căn hộ 1 phòng ngủ', 2, '7700000', 'Đặc trưng với tông màu đất và đồ nội thất hiện đại, chỗ nghỉ này chào đón khách với 1 giường cỡ King có gối lông vũ đặt đầu giường. Cửa trượt lớn ra vào ban công mở ra không gian bên ngoài trong khi vòi sen riêng biệt làm nổi bật phòng tắm rộng rãi. Các tiện ích bao gồm nhà bếp đầy đủ tiện nghi, khu vực tiếp khách riêng biệt, dịch vụ phòng trong giờ hành chính, giường gấp, khu vực làm việc riêng biệt và truy cập Internet không dây miễn phí. Phòng này có thể chứa thêm 1 giường phụ.\n\n', 23, 10),
(85, 'Regency Suite', 2, '9200000', 'Các tông màu đất và đồ nội thất hiện đại chào đón du khách đến với bộ sản phẩm này với một chiếc giường cỡ king nằm trên đầu với những chiếc gối lông vũ. Cửa trượt lớn và ban công đôi mở ra tầm nhìn ra bên ngoài và đại dương, trong khi vòi hoa sen riêng biệt giúp tăng cường phòng tắm cực lớn. Các tiện nghi bao gồm quyền sử dụng Câu lạc bộ Regency với đồ uống giải khát cả ngày và cocktail trước bữa tối, cũng như Internet không dây miễn phí. Gói bao gồm: • Bữa sáng hàng ngày • 01 bữa tối gồm ba món cho hai khách mỗi lần lưu trú (tùy theo kế hoạch giá) • Cocktail chào mừng cho hai khách •', 23, 10),
(87, 'căn hộ 3 phòng ngủ hướng biển', 2, '13200000', 'Căn hộ này có ban công, TV màn hình phẳng và máy sấy quần áo. Gói bao gồm: • Bữa sáng hàng ngày • 01 bữa tối gồm ba món cho hai khách mỗi lần lưu trú (tùy theo kế hoạch giá) • Cocktail chào mừng cho hai khách .', 23, 10),
(88, 'Villa 3 phòng ngủ hướng biển', 1, '22200000', 'Tông màu đất và đồ nội thất hiện đại chào đón du khách đến biệt thự ba phòng ngủ này với tầm nhìn bao quát và toàn cảnh ra đại dương. Chỉ cần đi bộ một quãng ngắn từ phía trước bãi biển, biệt thự đi kèm với cửa ban công trượt lớn mở ra bên ngoài, trong khi kết thúc bằng đá cẩm thạch làm tăng thêm các phòng tắm riêng. Tiện nghi phòng bao gồm bếp đầy đủ, khu vực tiếp khách riêng biệt, dịch vụ phòng trong giờ thường xuyên, xe lăn theo yêu cầu, khu vực làm việc riêng và truy cập Internet không dây miễn phí. Gói bao gồm: • Bữa sáng hàng ngày • 01 bữa tối gồm ba món cho hai khách mỗi lần lưu trú (tùy theo kế hoạch giá) • Cocktail chào mừng cho hai khách.', 23, 10),
(89, 'Villa 3 Phòng ngủ với Lối đi ra Bãi biển', 1, '24500000', 'Tông màu đất và đồ nội thất hiện đại chào đón du khách đến biệt thự ba phòng ngủ này với lối ra bãi biển từ sân phơi nắng ngoài trời. Nằm trên bãi biển, biệt thự đi kèm với cửa ban công trượt lớn mở ra bên ngoài, trong khi kết thúc bằng đá cẩm thạch làm tăng thêm phòng tắm riêng. Tiện nghi phòng bao gồm bếp đầy đủ, khu vực tiếp khách riêng biệt, dịch vụ phòng trong giờ thường xuyên, xe lăn theo yêu cầu, khu vực làm việc riêng và truy cập Internet không dây miễn phí. Gói bao gồm: • Bữa sáng hàng ngày • 01 bữa tối gồm ba món cho hai khách mỗi lần lưu trú (tùy theo kế hoạch giá) • Cocktail chào mừng cho hai khách.', 23, 10),
(90, 'Villa 2 Phòng Ngủ Nhìn Ra Vườn Với Hồ Bơi Riêng', 3, '8210000', 'Biệt thự này có ban công, đồ dùng nhà bếp và sàn gạch / đá cẩm thạch. Thích hợp cho các hộ gia đình có con nhỏ đi du lịch.', 24, 10),
(91, 'Villa 2 Phòng Ngủ Với Hồ Bơi Riêng Có Lối Ra Biển', 3, '10210000', 'Biệt thự này có ban công, ấm đun nước điện và đầu đĩa DVD. Ở tối đa 3 người lớn và 2 trẻ em.', 24, 10),
(92, 'Villa 4 Phòng Ngủ Với Hồ Bơi Riêng Có Lối Ra Biển ', 2, '16210000', 'Biệt thự này có hồ bơi riêng, khu vực tiếp khách và áo choàng tắm. Bao bữa sáng và  Ở tối đa 5 người lớn và 3 trẻ em.', 24, 10),
(93, 'Villa Hướng Biển Có Hồ Bơi Riêng', 2, '24010000', 'Biệt thự này có một ban công, điều hòa không khí và bếp. Bao bữa sáng và Ở tối đa 6 người lớn và 3 trẻ em.', 24, 10),
(94, 'BiVilla Hướng Biển Có Hồ Bơi Riêng', 1, '29310000', 'Biệt thự này có một ban công, điều hòa không khí và bếp. Bao bữa sáng và Ở tối đa 6 người lớn và 4 trẻ em.', 24, 10),
(95, 'Villa 2 Phòng ngủ', 3, '7310000', 'Biệt thự này có ban công, áo choàng tắm và ghế sofa. Giá biệt thự được áp dụng cho 4 người lớn. Biệt thự có thể chứa được tối đa 4 người lớn và 4 trẻ em. Biệt thự không thể kê thêm giường phụ. Bao bữa sáng, ở tối đa 4 người lớn và 4 trẻ em.', 25, 10),
(96, 'Villa 2 Phòng Ngủ ', 3, '10310000', 'Biệt thự này có máy điều hòa. Giá được áp dụng cho 4 người lớn. Biệt thự có thể chứa được tối đa 4 người lớn kèm 4 trẻ em và không thể chứa giường phụ. Gói bao 3 bữa sẽ bắt đầu bằng bữa tối vào ngày nhận phòng và kết thúc bằng bữa trưa vào ngày trả phòng. Nếu quý khách muốn dùng bữa trưa vào ngày đến thay vì ngày trả phòng, vui lòng thông báo cho chỗ nghỉ trước ít nhất 5 ngày.', 25, 10),
(97, 'Vila 3 Phòng Ngủ Nhìn Ra Biển', 2, '15031000', 'Biệt thự này có ban công, ghế sofa và hồ bơi riêng. Bao bữa sáng, ở tối đa 6 người lớn và 4 trẻ em.', 25, 10),
(99, 'Villa 3 Phòng Ngủ	', 1, '19331000', 'Biệt thự này có máy điều hòa. Giá được áp dụng cho 6 người lớn. Biệt thự có thể chứa được tối đa 6 người lớn kèm 6 trẻ em và không thể chứa giường phụ. Gói bao 3 bữa sẽ bắt đầu bằng bữa tối vào ngày nhận phòng và kết thúc bằng bữa trưa vào ngày trả phòng. Nếu quý khách muốn dùng bữa trưa vào ngày đến thay vì ngày trả phòng, vui lòng thông báo cho chỗ nghỉ trước ít nhất 5 ngày.', 25, 10),
(100, 'Villa 3 Phòng Ngủ nhìn ra biển', 1, '20331000', 'Biệt thự này có ban công, khu vực tiếp khách và điều hòa không khí. Bao 3 bữa ăn,  ở tối đa 6 người lớn và 4 trẻ em.', 25, 10),
(101, 'Phòng Deluxe', 3, '4331000', '1 giường cỡ king, Ban công, Quang cảnh vịnh, ở tối đa 3 người. Khu phòng được trang bị những tiện nghi chu đáo như áo choàng tắm và dép đi trong nhà, bên cạnh Wi-Fi miễn phí và TV LED với các kênh truyền hình vệ tinh. Khách còn có thể tận hưởng nhiều tiện nghi, dịch vụ như ban công, dịch vụ phòng 24 giờ và minibar.', 26, 10),
(102, 'Phòng Suite dành cho gia đình', 3, '10331000', '2 phòng ngủ, Quyền sử dụng Business Lounge (Connecting Suite), ở tối đa 5 người. Khu phòng được trang bị những tiện nghi chu đáo như áo choàng tắm và dép đi trong nhà, bên cạnh Wi-Fi miễn phí và TV LED với các kênh truyền hình vệ tinh. Khách còn có thể tận hưởng nhiều tiện nghi, dịch vụ như ban công, dịch vụ phòng 24 giờ và minibar.', 26, 10),
(104, 'Phòng Suite trăng mật', 3, '14331000', '1 phòng ngủ, Quyền sử dụng Business Lounge và bao bữa sáng. Thích hợp cho các cặp mới cưới đi trăng mật. Khu phòng được trang bị những tiện nghi chu đáo như áo choàng tắm và dép đi trong nhà, bên cạnh Wi-Fi miễn phí và TV LED với các kênh truyền hình vệ tinh. Khách còn có thể tận hưởng nhiều tiện nghi, dịch vụ như ban công, dịch vụ phòng 24 giờ và minibar.', 26, 10),
(105, 'Phòng Suite Presidential', 2, '24331000', '1 phòng ngủ, Quang cảnh biển bao bữa sáng. Khu phòng được trang bị những tiện nghi chu đáo như áo choàng tắm và dép đi trong nhà, bên cạnh Wi-Fi miễn phí và TV LED với các kênh truyền hình vệ tinh. Khách còn có thể tận hưởng nhiều tiện nghi, dịch vụ như ban công, dịch vụ phòng 24 giờ và minibar.', 26, 10),
(106, 'Phòng Suite Royal', 1, '42331000', 'Phòng Suite Royal, 2 phòng ngủ, Quang cảnh biển, bao bữa sáng. Ở tối đa 5 người, view nhìn ra biển, có bồn tắm cỡ lớn.', 26, 10),
(107, 'Suite Junior', 2, '3331000', 'Kích thước phòng 55 m²\nSuite có giường đôi, 2 phòng tắm, phòng khách cùng sảnh khách riêng biệt, ghế sofa và ban công. View nhìn ra hồ bơi và thành phố.', 27, 10),
(108, 'Suite Gia đình sang trọng', 1, '5331000', ' Chỗ đậu xe miễn phí,\nKích thước phòng 75 m²,\nTrong phòng tắm riêng của bạn:\n Đồ vệ sinh cá nhân miễn phí,\n Áo choàng tắm,\n Phòng tắm phụ,\n Nhà vệ sinh,\n Bồn tắm hoặc Vòi sen,\n Khăn tắm,\n Dép,\n Máy sấy tóc,\n Toilet phụ,\n Giấy vệ sinh. Có view nhìn ra hồ bơi và thành phố và bao ăn sáng.', 27, 10),
(109, 'Phòng Superior 2 Giường Đơn', 3, '1531000', 'Kích thước phòng 35 m²\nPhòng giường đôi/2 giường đơn này có ban công, minibar và khu vực tiếp khách.\nTrong phòng tắm riêng của bạn:\n Đồ vệ sinh cá nhân miễn phí,\n Áo choàng tắm,\n Nhà vệ sinh,\n Bồn tắm hoặc Vòi sen,\n Khăn tắm,\n Dép,\n Máy sấy tóc,\n Giấy vệ sinh,', 27, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `userName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `userName`, `pass`, `level`) VALUES
(1, 'tunt20158412', 'Vietnam1205', 0),
(2, 'test', 'test', 2),
(3, 'test1', 'testt1', 2),
(6, 'testthem', 'manmo', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_hotel`
--

CREATE TABLE `user_hotel` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_hotel`
--

INSERT INTO `user_hotel` (`id`, `id_user`, `id_hotel`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 5),
(4, 1, 6),
(5, 1, 7),
(6, 1, 8),
(9, 1, 11),
(10, 1, 12),
(11, 1, 13),
(12, 1, 14),
(13, 1, 15),
(14, 1, 16),
(15, 1, 17),
(16, 1, 18),
(17, 1, 19),
(18, 1, 20),
(19, 1, 21),
(20, 1, 22),
(21, 1, 23),
(22, 1, 24),
(23, 1, 25),
(24, 1, 26),
(25, 1, 27),
(26, 1, 28),
(27, 1, 29),
(28, 1, 30),
(29, 1, 31),
(30, 1, 32),
(31, 1, 33),
(32, 1, 34),
(33, 1, 35),
(34, 1, 36),
(35, 1, 37),
(36, 1, 38),
(37, 1, 39),
(38, 1, 40),
(39, 1, 41),
(40, 1, 42),
(41, 1, 43),
(42, 1, 44),
(43, 1, 45),
(44, 1, 46),
(45, 1, 47),
(46, 1, 48),
(47, 1, 49),
(48, 1, 50),
(49, 1, 51);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `firstName`, `lastName`, `phone`, `email`, `location`, `city`, `id_user`) VALUES
(1, 'Lê Thị Hoài', 'Thương', 355547997, 'thuongthuong@gmail.cọm', 'long biên', 'PT', 1),
(2, 'test', 'test', 369569156, 'tets@gmail.com', 'test', 'hn', 2),
(3, NULL, NULL, NULL, NULL, NULL, NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_info_repas`
--

CREATE TABLE `user_info_repas` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_info_repas`
--

INSERT INTO `user_info_repas` (`id`, `id_user`, `weight`, `height`, `type`) VALUES
(1, 1, 47, 167, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_room`
--
ALTER TABLE `booking_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_room`
--
ALTER TABLE `comment_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hosbi_user`
--
ALTER TABLE `hosbi_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repas`
--
ALTER TABLE `repas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_hotel`
--
ALTER TABLE `room_hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userName_UNIQUE` (`userName`);

--
-- Indexes for table `user_hotel`
--
ALTER TABLE `user_hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info_repas`
--
ALTER TABLE `user_info_repas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_room`
--
ALTER TABLE `booking_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comment_room`
--
ALTER TABLE `comment_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hosbi_user`
--
ALTER TABLE `hosbi_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `repas`
--
ALTER TABLE `repas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_hotel`
--
ALTER TABLE `room_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_hotel`
--
ALTER TABLE `user_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_info_repas`
--
ALTER TABLE `user_info_repas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
