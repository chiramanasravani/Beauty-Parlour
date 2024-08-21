-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 05, 2022 at 07:09 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `prettyparlour`
--
CREATE DATABASE IF NOT EXISTS `prettyparlour` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prettyparlour`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add appointment model', 7, 'add_appointmentmodel'),
(26, 'Can change appointment model', 7, 'change_appointmentmodel'),
(27, 'Can delete appointment model', 7, 'delete_appointmentmodel'),
(28, 'Can view appointment model', 7, 'view_appointmentmodel'),
(29, 'Can add customer model', 8, 'add_customermodel'),
(30, 'Can change customer model', 8, 'change_customermodel'),
(31, 'Can delete customer model', 8, 'delete_customermodel'),
(32, 'Can view customer model', 8, 'view_customermodel'),
(33, 'Can add feedback model', 9, 'add_feedbackmodel'),
(34, 'Can change feedback model', 9, 'change_feedbackmodel'),
(35, 'Can delete feedback model', 9, 'delete_feedbackmodel'),
(36, 'Can view feedback model', 9, 'view_feedbackmodel'),
(37, 'Can add beautician model', 10, 'add_beauticianmodel'),
(38, 'Can change beautician model', 10, 'change_beauticianmodel'),
(39, 'Can delete beautician model', 10, 'delete_beauticianmodel'),
(40, 'Can view beautician model', 10, 'view_beauticianmodel'),
(41, 'Can add services model', 11, 'add_servicesmodel'),
(42, 'Can change services model', 11, 'change_servicesmodel'),
(43, 'Can delete services model', 11, 'delete_servicesmodel'),
(44, 'Can view services model', 11, 'view_servicesmodel'),
(45, 'Can add parlour model', 12, 'add_parlourmodel'),
(46, 'Can change parlour model', 12, 'change_parlourmodel'),
(47, 'Can delete parlour model', 12, 'delete_parlourmodel'),
(48, 'Can view parlour model', 12, 'view_parlourmodel'),
(49, 'Can add services model', 13, 'add_servicesmodel'),
(50, 'Can change services model', 13, 'change_servicesmodel'),
(51, 'Can delete services model', 13, 'delete_servicesmodel'),
(52, 'Can view services model', 13, 'view_servicesmodel'),
(53, 'Can add contact model', 14, 'add_contactmodel'),
(54, 'Can change contact model', 14, 'change_contactmodel'),
(55, 'Can delete contact model', 14, 'delete_contactmodel'),
(56, 'Can view contact model', 14, 'view_contactmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE IF NOT EXISTS `contact_details` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` longtext NOT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`contact_id`, `name`, `email`, `subject`, `message`, `reg_date`) VALUES
(1, 'Chanu', 'chanuchiramana1800@gmail.com', '', '', '2022-04-04'),
(2, 'Sravani Naidu', 'sravaninaidu@gmail.com', '', '', '2022-04-04'),
(3, 'Sravani Naidu', 'sravaninaidu@gmail.com', 'Hiiiiiiiiiiiii', 'Haiiiiiiiiiii\r\n', '2022-04-04'),
(4, 'Sravani Naidu', 'sravaninaidu@gmail.com', 'hhhhhhhhhhhhh', 'hhhhhhhhhhhhhhh', '2022-04-05'),
(5, 'Sravani Naidu', 'sravaninaidu@gmail.com', 'hhhhhhhhhhhhh', 'hhhhhhhhhhhhhhh', '2022-04-05'),
(6, 'vinay reddy', 'vinayvinnu5132@gmail.com', 'Hiiiiiiiiiiiii', 'hhhhhhhhhhhhhhh', '2022-04-05'),
(7, 'vinay reddy', 'vinayvinnu5132@gmail.com', 'Hiiiiiiiiiiiii', 'hhhhhhhhhhhhhhh', '2022-04-05'),
(8, 'vinay reddy', 'vinayvinnu5132@gmail.com', 'Hiiiiiiiiiiiii', 'hhhhhhhhhhhhhhh', '2022-04-05'),
(9, 'vinay reddy', 'vinayvinnu5132@gmail.com', 'Hiiiiiiiiiiiii', 'hhhhhhhhhhhhhhh', '2022-04-05'),
(10, 'vinay reddy', 'vinayvinnu5132@gmail.com', 'Hiiiiiiiiiiiii', 'hhhhhhhhhhhhhhh', '2022-04-05');

-- --------------------------------------------------------

--
-- Table structure for table `customer_appoinment`
--

CREATE TABLE IF NOT EXISTS `customer_appoinment` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mobile_number` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `type_of_address` varchar(200) NOT NULL,
  `home_address` varchar(200) NOT NULL,
  `parlour` varchar(200) NOT NULL,
  `beautician` varchar(50) NOT NULL,
  `members` varchar(10) NOT NULL,
  `service` varchar(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `parlour_id` int(11) DEFAULT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `customer_appoinment_parlour_id_11d54e2e_fk_parlour_d` (`parlour_id`),
  KEY `customer_appoinment_Customer_id_aa4d0480_fk_customer_` (`Customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `customer_appoinment`
--

INSERT INTO `customer_appoinment` (`booking_id`, `name`, `mobile_number`, `email`, `date`, `time`, `type_of_address`, `home_address`, `parlour`, `beautician`, `members`, `service`, `status`, `reg_date`, `parlour_id`, `Customer_id`) VALUES
(7, 'vinay reddy', 7729851577, 'vinayvinnu5132@gmail.com', '2022-04-15', '18:00:00.000000', 'Parlour', '', 'beauty-lab', 'Stella', '1-3', 'Hair service', 'Accepted', '2022-04-01', NULL, NULL),
(8, 'CHIRAMANA SRAVANI', 919059501800, 'sravanichiramana1800@gmail.com', '2022-04-21', '20:04:00.000000', 'Home', 'hyderabad', 'Honeyz', 'Anshi', '1-3', 'Eye_Lash', 'Accepted', '2022-04-01', NULL, NULL),
(9, 'Sravani Naidu', 919059501800, 'sravaninaidu@gmail.com', '2022-04-01', '15:14:00.000000', 'Home', 'secunderabad', 'beauty-lab', 'chanu', '4-6', 'Lip-care', 'Accepted', '2022-04-01', NULL, NULL),
(11, 'ramesh', 7896541238, 'ramesh@gmail.com', '2022-04-16', '19:16:00.000000', 'Parlour', 'Nellore', 'Honeyz', 'Anshi', '4-6', 'Eye_Lash', 'Accepted', '2022-04-01', NULL, NULL),
(12, 'abhinav', 8686876108, 'abhistone98@gmail.com', '2022-04-21', '20:22:00.000000', 'Home', 'jhbxcjysd', 'Honeyz', 'Anshi', '1-3', 'Eye_Lash', 'Accepted', '2022-04-01', 3, NULL),
(28, 'CHIRAMANA SRAVANI', 9059501800, 'chanuchiramana1800@gmail.com', '2022-04-07', '14:58:00.000000', 'Parlour', 'Nellore vedayapalem', 'beauty-lab', 'chanu', '1-3', 'Lip-care', 'Accepted', '2022-04-05', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE IF NOT EXISTS `customer_details` (
  `Customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile_number` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`Customer_id`, `name`, `password`, `mobile_number`, `email`, `image`, `status`, `reg_date`, `location`, `birthday`) VALUES
(1, 'Sravani Naidu', '8886', 919059501800, 'sravanichiramana@gmail.com', 'logo/images/beauticion-3_7udT6PP.jpg', 'Accepted', '2022-03-28', 'Nellore', '1998-06-07'),
(2, 'abhinav', 'abhi', 8686876108, 'abhistone98@gmail.com', 'logo/images/drake.jpg', 'Accepted', '2022-03-28', 'Hyderabad', '2000-06-07'),
(3, 'Sravani', '1800', 919059501800, 'chanuchiramana1800@gmail.com', 'logo/images/beauticion-1_D1TtvEC.jpg', 'Accepted', '2022-03-29', 'Chennai', '1999-04-11'),
(4, 'Saddam', 'saddam', 123456789, 'saddam@gmail.com', 'logo/images/face1.jpg', 'Accepted', '2022-03-31', 'Bangalore', '2018-06-07'),
(5, 'Srinad', 'srinad', 123456789, 'srinad@gmail.com', 'logo/images/face7.jpg', 'Accepted', '2022-03-31', 'Vizag', '2018-06-07'),
(6, 'ramesh', 'ramesh', 7896541238, 'ramesh@gmail.com', 'logo/images/face15.jpg', 'Accepted', '2022-03-31', 'Nellore', '2018-06-07'),
(7, 'vinay reddy', 'vinay', 7729851577, 'vinayvinnu5132@gmail.com', 'logo/images/face28.jpg', 'Accepted', '2022-03-31', 'Nellore', '2018-06-07'),
(8, 'mamatha', 'mamatha', 123456789, 'mamatha@gmail.com', 'logo/images/face5.jpg', 'Accepted', '2022-03-31', 'Nellore', '2018-06-07');

-- --------------------------------------------------------

--
-- Table structure for table `customer_feedback`
--

CREATE TABLE IF NOT EXISTS `customer_feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `feedback` longtext,
  `reg_date` date DEFAULT NULL,
  `customer_image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `customer_feedback`
--

INSERT INTO `customer_feedback` (`feedback_id`, `name`, `email`, `feedback`, `reg_date`, `customer_image`) VALUES
(1, 'Sravani Naidu', 'sravaninaidu@gmail.com', 'Loved the service and care taken by ayesha in making it good experience. Spa and\n                            facial was very nice', '2022-03-30', 'logo/images/beauticion-3.jpg'),
(2, 'Chiramana Sravani', 'chanuchiramana1800@gmail.com', 'Highly satisfied with the services.takes care of hygience, use quality products\n                            and professional people', '2022-03-30', 'logo/images/beauticion-3.jpg'),
(4, 'abhinav', 'abhistone98@gmail.com', 'Iam really satisfied with the hygiene maintained by BEAUTICION and the products\n                            used. I would always prefer Getlook.', '2022-03-30', 'logo/images/drake.jpg'),
(6, 'vinay reddy', 'vinayvinnu5132@gmail.com', 'Loved the service and care taken by ayesha in making it good experience. Spa and\n                            facial was very nice', '2022-04-05', 'logo/images/face28.jpg'),
(7, 'Srinad', 'srinad@gmail.com', 'Highly satisfied with the services.takes care of hygience, use quality products\n                            and professional people', '2022-04-05', 'logo/images/face7.jpg'),
(8, 'ramesh', 'ramesh@gmail.com', 'Iam really satisfied with the hygiene maintained by BEAUTICION and the products\n                            used. I would always prefer Getlook.', '2022-04-05', 'logo/images/face15.jpg'),
(11, 'CHIRAMANA SRAVANI', 'chanuchiramana1800@gmail.com', 'good', '2022-04-05', 'logo/images/beauticion-1_D1TtvEC.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(10, 'beauticianapp', 'beauticianmodel'),
(11, 'beauticianapp', 'servicesmodel'),
(5, 'contenttypes', 'contenttype'),
(7, 'customerapp', 'appointmentmodel'),
(8, 'customerapp', 'customermodel'),
(9, 'customerapp', 'feedbackmodel'),
(14, 'mainapp', 'contactmodel'),
(12, 'parlourapp', 'parlourmodel'),
(13, 'parlourapp', 'servicesmodel'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-03-28 08:19:55.832344'),
(2, 'auth', '0001_initial', '2022-03-28 08:19:57.056678'),
(3, 'admin', '0001_initial', '2022-03-28 08:19:57.294258'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-03-28 08:19:57.315270'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-28 08:19:57.324865'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-03-28 08:19:57.498535'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-03-28 08:19:57.597110'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-03-28 08:19:57.696904'),
(9, 'auth', '0004_alter_user_username_opts', '2022-03-28 08:19:57.718377'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-03-28 08:19:57.810209'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-03-28 08:19:57.814856'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-03-28 08:19:57.832323'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-03-28 08:19:57.929786'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-03-28 08:19:58.078768'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-03-28 08:19:58.212777'),
(16, 'auth', '0011_update_proxy_permissions', '2022-03-28 08:19:58.223435'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-03-28 08:19:58.331134'),
(18, 'beauticianapp', '0001_initial', '2022-03-28 08:19:58.484168'),
(19, 'customerapp', '0001_initial', '2022-03-28 08:19:58.611585'),
(20, 'sessions', '0001_initial', '2022-03-28 08:19:58.714203'),
(21, 'beauticianapp', '0002_remove_servicesmodel_beautician_name_and_more', '2022-03-28 12:56:50.583832'),
(22, 'beauticianapp', '0003_remove_servicesmodel_bname_and_more', '2022-03-28 13:01:22.694396'),
(23, 'beauticianapp', '0004_rename_beautician_name_beauticianmodel_parlour_name', '2022-03-28 14:16:36.943109'),
(24, 'beauticianapp', '0005_alter_servicesmodel_beautician_name', '2022-03-29 06:35:10.892024'),
(25, 'beauticianapp', '0006_alter_servicesmodel_price', '2022-03-29 06:47:48.695683'),
(26, 'beauticianapp', '0007_alter_servicesmodel_price', '2022-03-29 06:49:06.400087'),
(27, 'beauticianapp', '0008_alter_servicesmodel_price', '2022-03-29 06:50:39.537179'),
(28, 'beauticianapp', '0009_beauticianmodel_confirmpassword', '2022-03-30 10:29:22.738182'),
(29, 'customerapp', '0002_customermodel_location', '2022-03-31 05:11:50.539450'),
(30, 'customerapp', '0003_customermodel_birthday', '2022-03-31 05:44:58.031515'),
(31, 'customerapp', '0004_alter_customermodel_birthday', '2022-03-31 06:04:22.868975'),
(32, 'customerapp', '0005_alter_customermodel_birthday', '2022-03-31 06:04:22.956505'),
(33, 'customerapp', '0006_alter_customermodel_birthday', '2022-03-31 06:04:23.061373'),
(34, 'beauticianapp', '0010_alter_servicesmodel_beautician', '2022-03-31 07:23:30.357187'),
(35, 'parlourapp', '0001_initial', '2022-03-31 14:54:10.492665'),
(36, 'parlourapp', '0002_alter_parlourmodel_table', '2022-03-31 14:54:10.521150'),
(37, 'customerapp', '0007_appointmentmodel_parlour_model_and_more', '2022-04-01 09:26:10.451620'),
(38, 'customerapp', '0008_remove_appointmentmodel_parlour_model', '2022-04-01 10:35:08.267827'),
(39, 'customerapp', '0009_appointmentmodel_parlour_model', '2022-04-01 10:35:57.048865'),
(40, 'mainapp', '0001_initial', '2022-04-03 07:26:17.007395'),
(41, 'customerapp', '0010_appointmentmodel_customer_model', '2022-04-04 07:22:25.746750'),
(42, 'mainapp', '0002_alter_contactmodel_reg_date', '2022-04-04 16:12:42.874574');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('t6txlz3zi3gsit9tprlb6qv22oxro2rk', 'eyJDdXN0b21lcl9pZCI6M30:1nbKzG:DVmv7NK4QrRjL3EykaJyzMQ10qpy3_fqrgIPgSQ5-i0', '2022-04-18 11:35:10.263646'),
('yyu3eb44i4yercuypqn2d2p9qoa0mxhm', '.eJyrVnJKTSwtyUzOTMyLz0xRsjLUUXIuLS7Jz00tAvONdZSSMFQUJBbl5JdCFBjWAgApjxdM:1nbdC2:2ew9xuOTca1yrSP4Zj5aaDWguU-wvmWLMmEkczNsw0I', '2022-04-19 07:01:34.424377');

-- --------------------------------------------------------

--
-- Table structure for table `parlour_details`
--

CREATE TABLE IF NOT EXISTS `parlour_details` (
  `parlour_id` int(11) NOT NULL AUTO_INCREMENT,
  `parlour_name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `confirmpassword` varchar(50) DEFAULT NULL,
  `mobile` bigint(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `license` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`parlour_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `parlour_details`
--

INSERT INTO `parlour_details` (`parlour_id`, `parlour_name`, `email`, `password`, `confirmpassword`, `mobile`, `address`, `license`, `logo`, `status`, `reg_date`) VALUES
(1, 'beauty-lab', 'beauty@gmail.com', 'beauty', 'beauty', 123456789, 'Hyderabad', 'images/logo/appoinment-2_0XGV6O0.jpg', 'logo/images/card-2.jpg', 'Accepted', '2022-03-31'),
(2, 'Green Trends', 'green@gmail.com', 'green', 'green', 8686876108, 'Nellore', 'images/logo/appoinment-2_tqAidAT.jpg', 'logo/images/card-1_DlzM04V.jpg', 'Accepted', '2022-03-31'),
(3, 'Honeyz', 'honeyz@gmail.com', 'honeyz', 'honey', 9059501800, 'Chennai', 'images/logo/appoinment-2_6UPlRU2.jpg', 'logo/images/card-3_M8ybMYy.jpg', 'Accepted', '2022-03-31'),
(4, 'Bubbles', 'bubble@gmail.com', 'bubbles', 'bubbles', 9059501800, 'Chennai', 'images/logo/appoinment-2_tYxvSbS.jpg', 'logo/images/logo-4.jpg', 'pending', '2022-04-03');

-- --------------------------------------------------------

--
-- Table structure for table `parlour_services`
--

CREATE TABLE IF NOT EXISTS `parlour_services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `beautician_name` longtext,
  `service_name` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `service_image` varchar(100) DEFAULT NULL,
  `beautician_image` varchar(100) DEFAULT NULL,
  `service_date_added` date DEFAULT NULL,
  `parlour_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `parlour_services_parlour_id_50a6fa9b_fk_beauticia` (`parlour_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `parlour_services`
--

INSERT INTO `parlour_services` (`service_id`, `beautician_name`, `service_name`, `price`, `message`, `service_image`, `beautician_image`, `service_date_added`, `parlour_id`) VALUES
(1, 'chanu', 'Lip-care', '1000', 'Up to 20% off on packages', 'services/card-8_d89Pnbg.jpg', 'beauticians/beauticion-3_MJqdfiT.jpg', '2022-03-31', 1),
(2, 'Stella', 'Hair', '800', 'Up to 30% off on packages', 'services/card-3_s9TQYRB.jpg', 'beauticians/beauticion-1_10l27gl.jpg', '2022-03-31', 1),
(3, 'Riya', 'Massage', '1500', 'Up to 50% off on packages', 'services/card-1_Uta8BzF.jpg', 'beauticians/beauticion-2_3koW82n.jpg', '2022-03-31', 1),
(4, 'Stella', 'Makeup', '500', 'Up 4o 20% off on packages', 'services/card-5.jpg', 'beauticians/about-9_rj4slUh.jpg', '2022-03-31', 1),
(5, 'Anshi', 'Eye_Lash', '800', 'Up to 20% off on packages', 'services/card-9_S630m8x.jpg', 'beauticians/beauticion-3_MJqdfiT.jpg', '2022-03-31', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `customer_appoinment`
--
ALTER TABLE `customer_appoinment`
  ADD CONSTRAINT `customer_appoinment_Customer_id_aa4d0480_fk_customer_` FOREIGN KEY (`Customer_id`) REFERENCES `customer_details` (`Customer_id`),
  ADD CONSTRAINT `customer_appoinment_parlour_id_11d54e2e_fk_parlour_d` FOREIGN KEY (`parlour_id`) REFERENCES `parlour_details` (`parlour_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `parlour_services`
--
ALTER TABLE `parlour_services`
  ADD CONSTRAINT `parlour_services_parlour_id_50a6fa9b_fk_beauticia` FOREIGN KEY (`parlour_id`) REFERENCES `parlour_details` (`parlour_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
