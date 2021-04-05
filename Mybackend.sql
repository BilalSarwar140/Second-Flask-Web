-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2021 at 01:52 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flaskblog2`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL,
  `country` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `message`, `date`, `country`) VALUES
(1, 'Hammad', 'first@gamil.com', '0315454545454545', 'Hello Bilal, Kasay ho?', '2021-03-30 16:27:52', 'Pakistan'),
(2, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:29:52', 'Pakistan'),
(3, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:38:42', 'Pakistan'),
(4, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:40:02', 'Pakistan'),
(5, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:42:39', 'Pakistan'),
(6, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:43:24', 'Pakistan'),
(7, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:44:48', 'Pakistan'),
(8, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:45:29', 'Pakistan'),
(9, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:46:41', 'Pakistan'),
(10, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:47:49', 'Pakistan'),
(11, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:49:02', 'Pakistan'),
(12, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:54:16', 'Pakistan'),
(13, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:54:41', 'Pakistan'),
(14, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 19:58:36', 'Pakistan'),
(15, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 20:01:14', 'Pakistan'),
(16, 'Heaas', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 20:07:44', 'Pakistan'),
(17, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 20:10:24', 'Pakistan'),
(18, 'Muhammad Bilal Sarwar', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 20:13:17', 'Pakistan'),
(19, 'Sarwar Sandhu', 'Zbroken@gmail.com', '03154679237', '', '2021-03-30 20:19:25', 'India'),
(20, 'Bilal', 'Zbroken@gmail.com', '03845131321351', '', '2021-03-30 20:31:51', 'Pakistan'),
(21, 'Zunnoorain', 'Zbroken@gmail.com', '8455', 'Hello', '2021-03-30 20:36:56', 'India'),
(22, 'Hafiz', 'Hassan123@gmail.com', '11223344', 'Hello bro, how are you', '2021-03-30 22:23:36', 'USA'),
(23, 'Invinclible', 'Jutt134@gmaol.com', '11223344', 'Hello Bro', '2021-03-31 09:52:27', 'USA'),
(24, 'Ultron', 'Ultron134@gmail.com', '11223344', 'Hello Bro', '2021-03-31 09:54:13', 'Pakistan');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `subtitle` text NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `img_file` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `name`, `title`, `subtitle`, `slug`, `content`, `date`, `img_file`) VALUES
(1, 'Bilal Sarwar', 'My First Post', 'First Post', 'post-1', 'Originally Answered: how can change color in hover with inline css?\r\nwith js you can do that in inline means you have to use “onMouseOver” and “onMouseOut” function..but it’s not good to use hover in inline cause if you changing another div style with this hover then this time it’ll be very complicated.\r\n\r\nthat’s why you should use hover in external or internal css not in inline and it’s also very good to understanding for browsers.', '2021-04-05 14:35:57', 'blog-1.jpg'),
(2, 'Sohaib Sarwar', 'My Second Post', 'Second Post', 'post-2', 'GEICO Auto Insurance – The Best Auto Insurance Company in USA\r\nAmong the five auto insurance companies, GEICO auto insurance company is famous for its lifetime alliance with the US army and old hand group of people. GEICO offer huge facilities such as scholarships, assistance programs and donations to the retired from military and who are still in military. It also has special facilities such as cheap car insurance, low cost auto insurance and affordable car insurance for veterans and their families. The great feature of GEICO is it offers low cost car insurance that car drivers can save half of insurance premiums. They assist car drivers every 24/7 when and wherever the drivers have problems.\r\n\r\nProgressive Auto Insurance – The Second Best Auto Insurance Companies\r\nProgressive auto insurance is well-known for discount auto insurance because it offers a wide range of discount policies for home owners, multiple car insurance, students, mileage and online shoppers.', '2021-03-31 22:17:00', 'blog-2.jpg'),
(3, 'Sarwar Sandhu', 'My Third Post', 'third post', 'post-3', 'Where is this documented? Did you actually get it to work? Why does HOST include http://? – Big McLargeHuge Aug 17 \'20 at 17:46\r\nHi @BigMcLargeHuge, please see this section on the linked docs: flask.palletsprojects.com/en/0.12.x/config/…. I don\'t think you need http:// in localhost, it should work either way – kip2 Aug 18 \'20 at 11:01\r\nSpecifically, I was asking about the HOST and PORT values. I can\'t find any documentation for either of those settings. – Big McLargeHuge Aug 18 \'20 at 20:15\r\nAh I see. I think the Flask docs have since changed. From a comment to this answer above, it appears that the default values for \'host\' and \'port\' are 127.0.0.1 and 5000, respectively. Actually, to run my app on the CLI I typically do: flask run --host=localhost --port=PORT_NUMBER', '2021-03-31 19:19:38', 'blog-3.jpg'),
(4, 'Zunnoorain', 'My Fourth Post', 'Fourth post', 'post-4', 'Installation\r\nInstall Bootstrap’s source Sass and JavaScript files via npm, Composer, or Meteor.\r\n\r\nPackage managed installs don’t include documentation or our full build scripts. You can also use our npm template repo to quickly generate a Bootstrap project via npm.\r\n\r\n', '2021-04-01 12:18:22', 'img_bg_4.jpg'),
(5, 'Hassan', 'My Fifth Post', 'Fifth Post', 'post-5', 'Build fast, responsive sites with Bootstrap\r\nQuickly design and customize responsive mobile-first sites with Bootstrap, the world’s most popular front-end open source toolkit, featuring Sass variables and mixins, responsive grid system, extensive prebuilt components, and powerful JavaScript plugins.', '2021-04-01 12:18:22', 'blog-1.jpg'),
(6, 'Sultan Khan', 'My Sixth Post', 'Sixth Post', 'post-6', 'Originally Answered: how can change color in hover with inline css?\r\nwith js you can do that in inline means you have to use “onMouseOver” and “onMouseOut” function..but it’s not good to use hover in inline cause if you changing another div style with this hover then this time it’ll be very complicated.\r\n\r\nthat’s why you should use hover in external or internal css not in inline and it’s also very good to understanding for browsers.', '2021-04-05 11:20:55', 'img_bg_4.jpg'),
(7, 'Umer', 'My Seventh Post', 'Seventh Post', 'seventh-post', 'Originally Answered: how can change color in hover with inline css?\r\nwith js you can do that in inline means you have to use “onMouseOver” and “onMouseOut” function..but it’s not good to use hover in inline cause if you changing another div style with this hover then this time it’ll be very complicated.\r\n\r\nthat’s why you should use hover in external or internal css not in inline and it’s also very good to understanding for browsers.', '2021-04-03 11:05:09', 'blog-3.jpg'),
(8, 'Usman', 'My Eighth Post', 'Eighth Post', 'post-8', 'Originally Answered: how can change color in hover with inline css?\r\nwith js you can do that in inline means you have to use “onMouseOver” and “onMouseOut” function..but it’s not good to use hover in inline cause if you changing another div style with this hover then this time it’ll be very complicated.\r\n\r\nthat’s why you should use hover in external or internal css not in inline and it’s also very good to understanding for browsers.', '2021-04-03 11:07:41', 'blog-2.jpg'),
(9, 'Bilal (edited)', 'My Ninth Post', 'Ninth Post', 'Post-9', 'Originally Answered: how can change color in hover with inline css?\r\nwith js you can do that in inline means you have to use “onMouseOver” and “onMouseOut” function..but it’s not good to use hover in inline cause if you changing another div style with this hover then this time it’ll be very complicated.\r\n\r\nthat’s why you should use hover in external or internal css not in inline and it’s also very good to understanding for browsers.', '2021-04-03 15:12:47', 'blog-1.jpg'),
(10, 'Muhammad Bilal Sarwar', 'My Tenth Post', 'Tenth Post', 'post-10', '44\r\n\r\nI recommend using Flask-SQLAlchemy\'s pagination: http://flask-sqlalchemy.pocoo.org/2.1/api/?highlight=pagination#flask.ext.sqlalchemy.Pagination\r\n\r\nThere\'s a well-written example here: https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-ix-pagination\r\n\r\nHere\'s the basic idea for the view:\r\n\r\n@app.route(\'/myview/<int:page>\',methods=[\'GET\'])\r\ndef view(page=1):\r\n    per_page = 10\r\n    posts = Posts.query.order_by(Posts.time.desc()).paginate(page,per_page,error_out=False)\r\n    return render_template(\'view.html\',posts=posts)\r\n\r\n\r\n<html>\r\n  <head>\r\n    Posts\r\n  </head>\r\n  <body>\r\n\r\n{% for post in posts.items %}\r\n<p>\r\n  {{ post.post_name }} post body: <b>{{ post.body }}</b>\r\n</p>\r\n{% endfor %}\r\n{% if posts.has_prev %}<a href=\"{{ url_for(\'view\', page=posts.prev_num) }}\">&lt;&lt; Newer posts</a>{% else %}&lt;&lt; Newer posts{% endif %} | \r\n{% if posts.has_next %}<a href=\"{{ url_for(\'view\', page=posts.next_num) }}\">Older posts &gt;&gt;</a>{% else %}Older posts &gt;&gt;{% endif %}\r\n\r\n  </body>\r\n</html>', '2021-04-05 16:28:15', 'bg.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
