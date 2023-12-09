-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2023 at 05:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iran_boxing`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `commentable_id` bigint(20) UNSIGNED NOT NULL,
  `commentable_type` varchar(255) NOT NULL,
  `seen` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => unseen, 1 => seen',
  `approved` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => not approved, 1 => approved',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `body`, `parent_id`, `author_id`, `commentable_id`, `commentable_type`, `seen`, `approved`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'عاالی', NULL, 1, 1, 'App\\Models\\Content\\Post', 1, 1, 1, '2023-12-08 10:28:05', '2023-12-08 10:28:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `tags` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_08_06_133729_create_pages_table', 1),
(7, '2021_08_06_134109_create_comments_table', 1),
(8, '2021_08_07_144900_create_ticket_categories_table', 1),
(9, '2021_08_07_144919_create_ticket_priorities_table', 1),
(10, '2021_08_07_144926_create_ticket_admins_table', 1),
(11, '2021_08_09_083455_create_tickets_table', 1),
(12, '2021_08_09_083503_create_ticket_files_table', 1),
(13, '2021_08_10_113912_create_roles_table', 1),
(14, '2021_08_10_113955_create_permissions_table', 1),
(15, '2021_08_11_115414_create_role_user_table', 1),
(16, '2021_08_11_115427_create_permission_role_table', 1),
(17, '2021_08_29_142632_create_public_sms_table', 1),
(18, '2021_08_29_142639_create_public_mail_table', 1),
(19, '2021_08_29_142649_create_public_mail_files_table', 1),
(20, '2021_12_15_220744_create_settings_table', 1),
(21, '2022_04_02_111354_create_otps_table', 1),
(22, '2023_01_15_020435_create_notifications_table', 1),
(23, '2023_02_13_171443_create_post_categories_table', 1),
(24, '2023_02_13_171516_create_posts_table', 1),
(25, '2023_02_18_202813_create_sessions_table', 1),
(26, '2023_02_28_013007__create_menus_table', 1),
(27, '2023_03_01_000647__create_faqs_table', 1),
(28, '2023_03_24_065359_add_two_columns_to_post_categories_table', 1),
(29, '2023_04_07_083749_add_one_column_to_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `otp_code` varchar(255) NOT NULL,
  `login_id` varchar(255) NOT NULL COMMENT 'email address or mobile number',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => mobile number , 1 => email',
  `used` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => not used , 1 => used',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `token`, `user_id`, `otp_code`, `login_id`, `type`, `used`, `status`, `created_at`, `updated_at`) VALUES
(1, 'aMCnvd2VV7mZ8QTmDXMSneRzvTbPZ4XsVuns3Llg9rkN5TOLyOR9RqwCuakS', 1, '191534', 's313dasht@gmail.com', 1, 0, 0, '2023-12-07 04:17:55', '2023-12-07 04:17:55'),
(2, 'xtLNRVqrxJYO8vWNDnJwkNN50xV8aAJ1CYlyQNsNpBa0minaqIRUWAd59zn2', 1, '468195', 's313dasht@gmail.com', 1, 0, 0, '2023-12-07 08:30:26', '2023-12-07 08:30:26'),
(3, 'hx30epKEMqNIhxHJw5NI56d5PEnqMwd3SwYPdTukZoQWohhvem2gBeVX1JHC', 1, '942800', 's313dasht@gmail.com', 1, 0, 0, '2023-12-07 08:33:02', '2023-12-07 08:33:02'),
(4, '01OUunx5Kpu0iGGFisGX3socC069JpANBnnwRBAVxFJZ5ShXAoddoyTDtfLE', 1, '870587', 's313dasht@gmail.com', 1, 0, 0, '2023-12-07 09:00:50', '2023-12-07 09:00:50'),
(5, 'mta5pYtjmlEBJeqUh42MJDKHi2GbqdXhGF8aqhWrsiyYQdyHgEYwAlU4Tn8C', 1, '308987', 's313dasht@gmail.com', 1, 0, 0, '2023-12-07 09:08:41', '2023-12-07 09:08:41'),
(6, 'W2X3WHIfsW9ceSvA6hXONK5YiIAfEz3nwKYjdj5A5ben9PB1R8gu9qfcVDHb', 1, '142422', 's313dasht@gmail.com', 1, 0, 0, '2023-12-07 19:01:02', '2023-12-07 19:01:02'),
(7, 'ygSG45JwPnuLkPvIhnpf0yYEJkR1DncbD1O9gNOhAAPvxsmztkIR7gTfQlGK', 1, '572122', 's313dasht@gmail.com', 1, 0, 0, '2023-12-08 05:02:37', '2023-12-08 05:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `tags` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `body` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `image` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `commentable` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => uncommentable, 1 => commentable',
  `published_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `views` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `summary`, `body`, `status`, `slug`, `image`, `tags`, `author_id`, `category_id`, `commentable`, `published_at`, `created_at`, `updated_at`, `deleted_at`, `views`) VALUES
(1, 'انواع گارد در بوکس', '<p>هدف گارد در بوکس چیست ؟&nbsp;در ساده ترین اصطلاح, گارد برای بوکسر دفاع تدارک دیده و در عین حال به او&nbsp;اجازه می دهد از ابزار حمله و دفاعی که در اختیار دارند استفاده کنند.</p>', '<p>گارد بدون قربانی کردن العمل های مهارتی، میدان&nbsp;دید کافی برای شما مهیا می کند.</p>\r\n\r\n<p>گارد مهم تر از آن چیزی است که فکرش را می کنید؛&nbsp;در هنگام انتخاب گارد &nbsp;به این توجه داشته<br />\r\nباشید که باید گارد و فاصله خود را به صورت متوالی تغییر دهید تا همواره رقیب خود را<br />\r\nدرگیر حدس زدن&nbsp;کنید.</p>\r\n\r\n<p><strong>۱- گارد پایه &ndash;&nbsp;جلو و عقب</strong></p>\r\n\r\n<p>بوکسوری که از این تکنیک استفاده می کند&nbsp;باید بتواند حمله رو به جلو را سریع انجام داده و برگردد<br />\r\nنباید به خاطر کلمات &rdquo; گارد پایه &rdquo; و &rdquo; مبارز پایه &rdquo; &nbsp;فکر کنید که احمقانه<br />\r\nاست زیرا&nbsp;بیشتر بوکسر ها از این حالت ایستادن استفاده می کنند چرا که سطح بالایی<br />\r\nبرای ضربه زدن و دفاع&nbsp;در این نوع گارد تدارک دیده شده است.</p>\r\n\r\n<p><strong>نکات</strong></p>\r\n\r\n<p>۱)در مرکز و استوار بایستید&nbsp;از پایتان برای جلو و عقب شدن و دفاع&nbsp;در برابر ضربه های<br />\r\nحریفتان&nbsp;استفاده کنید و به صورت قائم بایستید &ndash; کج&nbsp;نشوید .<br />\r\n۲)&nbsp;دست عقبیتان را نزدیک چانه تان نگه دارید و دست جلویی را بیرون و جلو&nbsp;بگیرید .<br />\r\n۳)&nbsp;مقدار کمی انحنا در زانو نگه دارید &ndash; برای حرکت بهتر .<br />\r\n۴)&nbsp;چانه تان را به سمت پایین نگه دارید و چشمانتان را روی رقیبتان نگه دارید .<br />\r\n۵)&nbsp;پای عقبیتان را به سمت بیرون نگه دارید نه دقیقا پشت پای جلوییتان, این باعث<br />\r\nتعادل شما می شود و از زمین خوردنتان جلو گیری می کند.</p>\r\n\r\n<p><strong>۲- گارد بالای بوکس &ndash; حمله کننده</strong></p>\r\n\r\n<p>گروهی از بوکسورها دستهای خود را بالا نگه می دارند؛آن ها دست هایشان را بالا نگه می دارند تا از&nbsp;سرشان دفاع کنند . این گروه از بوکسورها&nbsp;&nbsp;رو به جلو حرکت می کند و فقط می خواهد شما را با طوفانی از&nbsp;ضربه های مشت نابود کند.</p>\r\n\r\n<p><strong>نکات</strong><br />\r\n۱)هر دو دست را بالا نگه دارید.<br />\r\n۲)&nbsp;برای مقابله با ضربهای رو به جلو و مستقیم &nbsp;دستکش هایتان را از دو طرف صورت به هم نزدیک کنید و کنار هم نگه دارید تا ضربات حریف به دستکش بخورد و&nbsp;بی&nbsp;اثر باشد سپس&nbsp;فورا دست هایتان را به حالت گارد برگردانید تا&nbsp;بتوانید عملکرد حریف رو ببینید.<br />\r\n۳)&nbsp;آماده استفاده از آرنج ها برای مقابله با ضربات رو به پایین باشید.<br />\r\n۴)مقداری خم در زانو نگه دارید &ndash; برای حرکت بهتر .<br />\r\n۵)&nbsp;چانه تان را به سمت پایین و چشمانتان را روی رقیبتان نگه دارید .<br />\r\n۶)&nbsp;از این گارد زمانی استفاده کنید که در فاصله ضربه هستید و به سمت رقیبتان<br />\r\nمیروید .</p>', 1, 'انواع-گارد-در-بوکس', '\"images\\\\post\\\\2023\\\\12\\\\06\\\\1701897817.jpg\"', 'گارد بوکس,دفاع', 1, 1, 1, '2023-12-08 02:28:05', '2023-12-07 05:23:37', '2023-12-08 10:28:05', NULL, 3),
(2, 'کیسه زدن اصولی', '<p>قطعا کیسه بوکس یکی از تمرینات اصلی و همیشگی برای بوکسورها بوده و هست ولی باید بپذیریم که در صورت رعایت نکردن چند نکته ، بیشترین آسیب های بدنی رو از همین وسیله خواهیم دید.</p>', '<p>۱- از کیسه بوکس مناسب استفاده کنید</p>\r\n\r\n<p>کیسه بوکس های متنوعی در بازار وجود دارد. قطعا بعضی از آنها غیر استاندارد هستند و اصلی ترین دلیل آسیب دیدن بوکسورها غیر استاندارد بودن کیسه بوکس هایی است که از آنها استفاده میکنند. به طور مثال بعضی از کیسه بوکس ها مثل سنگ سفت و محکم هستند و مشتی که به کیسه میزنید با مشتی که به دیوار میزنید هیچ فرقی ندارد و همین امر باعث ایجاد ناراحتی هایی در مچ دست و شانه های شما می شود. این مورد به علت های متفاوتی ممکن است به وجود آمده باشد.</p>\r\n\r\n<p>ممکن است کیسه زیادی پر شده باشد و یا موادی که در کیسه ریخته اند بسیار سفت باشد. یا ممکن است وزن کیسه بیش از حد نیاز باشد . از طرفی ممکن است کیسه سبکتر از حد نیاز باشد و با مشت هایی که میزنید به طرف عقب پرت شود. این کیسه نیز مناسب نیست. همچنین ارتفاع کیسه نیز اهمیت دارد, اکثر کیسه ها قسمت بالایی آنها سبکتر از قسمت پایینی می باشد و</p>\r\n\r\n<p>اگر ارتفاع کیسه برای شما مناسب نباشد، چون شما باید کمی بالاتر از صورت خود را مشت بزنید ممکن است به قسمت بالایی کیسه ضربه بزنید و آسیب ببینید.</p>\r\n\r\n<p><img alt=\"روش صحیح تمرین با کیسه بوکس\" src=\"https://4warriors.ir/wp-content/uploads/2020/12/Boxing-bag-punching-6-www.4warriors.ir_-1024x576.jpg\" style=\"height:450px; width:800px\" /></p>\r\n\r\n<p>روش صحیح تمرین با کیسه بوکس</p>\r\n\r\n<p>2- استفاده از باند بوکس</p>\r\n\r\n<p>بستن باند بوکس نه تنها برای فایتر های حرفه ای در مسابقات یک امر ضروری است ، بلکه حتی برای فایترهای مبتدی و برای تمرین نیز ضروری می باشد. توصیه میکنیم هیچ گاه بدون داشتن باند بوکس ، ضربه نزنید . چه این ضربه در مبارزه ای تمرینی به حریفتان باشد ، چه حتی ضربه ای به کیسه بوکس. باند بوکس به خاطر بسته شدن دور مچ و انگشتان شما محافظت کاملی از دست شما خواهد داشت و اگر ضربه ای اشتباه بزنید ، از برگشتن مچ شما یا انگشتان و آسیب های جدی کاملا جلوگیری میکند.</p>\r\n\r\n<p><img alt=\"| نوشته\" src=\"https://4warriors.ir/wp-content/uploads/2020/12/Boxing-bag-punching-1-www.4warriors.jpg\" style=\"height:370px; width:353px\" /></p>\r\n\r\n<p>روش صحیح تمرین با کیسه بوکس</p>\r\n\r\n<p>۳- ضربه زدن با تکنیک درست</p>\r\n\r\n<p>ضربه زدن به کیسه بوکس دارای قواعد و قوانینی است که رعایت آنها هم باعث قدرت و سرعت بیشتر ضربات میشود و هم از آسیب های احتمالی جلوگیری میکند. قطعا اگر یک ضربه اصولی و با تکنیک درست زده شود آسیب احتمالی که به خود شما وارد میشود بسیار کمتر خواهد بود نسبت به زمانی که مشتی غیر اصولی میزنید.&nbsp;</p>\r\n\r\n<p>تکنیک های بوکس سالها توسط ورزشکاران مختلف تست شده و این قوانین و اصول با تفکر درست شده پس پیشنهاد میشود قبل از کار سنگین با کیسه ابتدا جلوی آیینه تکینک ها و ضربات مختلف را تمرین کنید و بعد از آمادگی کامل کیسه بوکس بزنید.</p>\r\n\r\n<p><img alt=\"| نوشته\" src=\"https://4warriors.ir/wp-content/uploads/2020/12/Boxing-bag-punching-5-www.4warriors.ir_-1024x683.jpg\" style=\"height:534px; width:800px\" /></p>\r\n\r\n<p>روش صحیح تمرین با کیسه بوکس</p>\r\n\r\n<p>۴- از دستکش مناسب استفاده کنید</p>\r\n\r\n<p>دستکش ها نیز یکی از عواملی هستند که باعث میشوند آسیب نبینید. در بازار دستکش های متفاوتی وجود دارد. حتما قبل از خرید دستکش به چند نکته در مورد آنها توجه کنید. اولین نکته این است که سایز دستکش با سایز دست شما برابر باشد. تقریبا دستکش ها از سایز ۸ تا ۱۶ وجود دارند. به طور مثال اگر شما نوجوان هستید باید از دستکش کوچکتر استفاده کنید و اگر دستهای بزرگی دارید نباید از دستکش کوچک استفاده کنید تا دست شما آسیب نبیند.</p>\r\n\r\n<p>&nbsp;علاوه بر سایز دستکش ، جنس دستکش نیز مهم است. الیافی که در قسمت جلویی دستکش استفاده میشود و ضربه را می گیرد نباید خیلی سفید و یا خیلی نرم باشد . همچنین دست شما در دستکش باید علاوه بر اینکه احساس راحتی داشته باشد ، نباید آنقدر شل باشد که دستکش از دست شما خارج شود.</p>\r\n\r\n<p><img alt=\"روش صحیح تمرین با کیسه بوکس\" src=\"https://4warriors.ir/wp-content/uploads/2020/12/Boxing-bag-punching-7-www.4warriors.ir_.jpg\" style=\"height:421px; width:632px\" /></p>\r\n\r\n<p>روش صحیح تمرین با کیسه بوکس</p>\r\n\r\n<p>۵- قدرت مشت خود را کنترل کنید</p>\r\n\r\n<p>بعضی از افراد زمانی که میخواهند کیسه بزنند ، از تمام قدرت خودشان استفاده میکنند و به قول معروف فقط مشت های خودشان را به سمت کیسه پرت میکنند و معروف میخواهند با یک ضربه کیسه بوکس را از پا در بیاورند!. بعضی دیگر نیز فقط سرعت را چاشنی کار قرار می دهند و فقط به لمس کردن دستکش با کیسه اکتفا میکنند.</p>\r\n\r\n<p>&nbsp;باید تعادل را میان قدرت و سرعت در هنگام کیسه زدن برقرار کرد. به هیچ وجه مشت خود را به سمت کیسه پرت نکنید چون ممکن است نتوانید قدرت مشت را کنترل کنید و مشت شما با حالت مناسب به کیسه برخورد نکند و آسیب های جدی از ناحیه مچ ، آرنج یا شانه ببینید.</p>', 1, 'کیسه-زدن-اصولی', '\"images\\\\post\\\\2023\\\\12\\\\06\\\\1701898242.jpg\"', 'بوکس', 1, 1, 1, '2023-12-07 01:27:20', '2023-12-07 05:30:42', '2023-12-07 09:27:20', NULL, 5),
(3, 'بهترین رژیم غذایی یک بوکسور', '<p>بهترین رژیم غذایی بوکسورها چگونه است؟ هر ورزشکاری برای اینکه مطمئن شود در بالاترین و بهترین درجه از آمادگی بدنی و عملکرد جسمانی قرار دارد باید به تغذیه اصولی و صحیح اهمیت زیادی بدهد. مناسب ترین رژیم غذایی بوکسورها کمک می کند تا ضمن تامین انرژی مورد نیازشان برای مشت زنی و دست و پنجه نرم کردن با حریف، مواد مغذی و لازم برای افزایش و تقویت حجم عضلات و کاهش چربی های بدنشان را به دست بیاورند.</p>', '<p><img alt=\"رژیم غذایی بوکسورها\" src=\"https://azshanbe.com/mag/wp-content/uploads/2020/02/2222222-e1581793877584.jpg\" style=\"height:338px; width:600px\" /></p>\r\n\r\n<p><a href=\"https://azshanbe.com/mag/%d8%b1%da%98%db%8c%d9%85-%d9%88%d8%b1%d8%b2%d8%b4%db%8c/\">رژیم ورزشی</a></p>\r\n\r\n<h1>بهترین رژیم غذایی بوکسورها</h1>\r\n\r\n<p>۳۰ بهمن ۱۳۹۸<a href=\"https://azshanbe.com/mag/%d8%b1%da%98%db%8c%d9%85-%d8%ba%d8%b0%d8%a7%db%8c%db%8c-%d8%a8%d9%88%da%a9%d8%b3%d9%88%d8%b1%d9%87%d8%a7/#respond\">۰ نظر</a><a href=\"https://azshanbe.com/mag/%D8%B1%DA%98%DB%8C%D9%85-%D8%BA%D8%B0%D8%A7%DB%8C%DB%8C-%D8%A8%D9%88%DA%A9%D8%B3%D9%88%D8%B1%D9%87%D8%A7/#\">۰</a></p>\r\n\r\n<p>بهترین رژیم غذایی بوکسورها چگونه است؟ هر ورزشکاری برای اینکه مطمئن شود در بالاترین و بهترین درجه از آمادگی بدنی و عملکرد جسمانی قرار دارد باید به تغذیه اصولی و صحیح اهمیت زیادی بدهد. مناسب ترین رژیم غذایی بوکسورها کمک می کند تا ضمن تامین انرژی مورد نیازشان برای مشت زنی و دست و پنجه نرم کردن با حریف، مواد مغذی و لازم برای افزایش و تقویت حجم عضلات و کاهش چربی های بدنشان را به دست بیاورند.</p>\r\n\r\n<p>بسته به اینکه در چه سطحی و در چه وزنی بوکسور هستید، میزان کالری مصرفی روزانه شما متفاوت خواهد بود. با این حال به طور کلی اکثر بوکسورها چیزی بین ۳۰۰۰ تا ۵۰۰۰ کالری و یا بیشتر در طول روز مصرف می کنند. پیروی از یک برنامه غذایی دقیق کمی مشکل است مخصوصا اگر تازه کار و مبتدی باشید. ما در این مطلب بهترین و جامع ترین نکات مهم رژیم غذایی بوکسورها را جمع آوری کرده ایم که به شما کمک میکنند عملکردتان را در میدان مسابقه افزایش بدهید.</p>\r\n\r\n<h2><strong>با رژیم غذایی بوکسورها بدانید که چه زمانی باید غذا بخورید</strong></h2>\r\n\r\n<p>اینکه به موقع و در ساعات منظمی غذا بخورید به همان اندازه درست و سالم خوردن اهمیت دارد. این کار به شما کمک می کند تا در مسیر درستی پیش بروید و در تمام روز انرژی پایداری داشته باشید. بهترین کار این است که از خوردن سه وعده غذایی بزرگ خودداری و کنید و آنها را به پنج یا شش وعده کوچکتر و سبک تر تقسیم کنید. این کار باعث حفظ انرژی در تمام طول روز می شود.</p>\r\n\r\n<p>وعده های غذایی بزرگ باعث پرخوری و اضافه وزن شما می شوند اما اگر همین وعده ها کوچکتر کنید نه تنها احساس گرسنگی نمی کنید بلکه بدنتان هم آنها را به چربی تبدیل نمی کند. بهترین زمان برای خوردن یک وعده غذایی بزرگ و اصلی صبح است. شما باید ۱ تا ۲ ساعت قبل از شروع تمرین هایتان یک صبحانه کامل و پر انرژی مصرف کنید. برای بقیه شش وعده غذایی هم در طول روز از مواد مغذی مختلف استفاده کنید.</p>\r\n\r\n<p><strong>بیشتر بدانید:&nbsp;<a href=\"https://azshanbe.me/mag/%d8%a8%d9%87%d8%aa%d8%b1%db%8c%d9%86-%d8%b1%da%98%db%8c%d9%85-%d8%ba%d8%b0%d8%a7%db%8c%db%8c-%d8%a8%d8%b3%da%a9%d8%aa%d8%a8%d8%a7%d9%84%db%8c%d8%b3%d8%aa-%d9%87%d8%a7/\">بهترین رژیم غذایی بسکتبالیست ها</a></strong></p>\r\n\r\n<p>چهار نوع ماده مغذی اصلی وجود دارد که هر بوکسوری باید از آنها استفاده کند. این منابع حاوی مواد مغذی اساسی برای تقویت عملکرد شما هستند که عبارتند از:</p>\r\n\r\n<h3>میزان مصرف پروتئین در رژیم غذایی بوکسورها</h3>\r\n\r\n<p>پروتئین ماده غذایی ضروری و مورد نیاز برای عضله سازی و حفظ بافت های عضلانی بدن شماست. مواد غذایی زیر منابع خوب پروتئین محسوب می شوند:</p>\r\n\r\n<ul>\r\n	<li>تخم مرغ</li>\r\n	<li>گوشت بدون چربی مثل گوشت گاو، مرغ و یا ماهی</li>\r\n	<li>لوبیا</li>\r\n	<li>کره بادام زمینی</li>\r\n	<li>عدس</li>\r\n	<li>سویا</li>\r\n</ul>\r\n\r\n<p><img alt=\"رژیم غذایی بوکسورها\" src=\"https://azshanbe.me/mag/wp-content/uploads/2020/02/4444-e1581793993881.jpg\" style=\"height:380px; width:600px\" /></p>\r\n\r\n<h3>کربوهیدرات لازم برای رژیم غذایی بوکسورها</h3>\r\n\r\n<p>کربوهیدرات ها منابع تامین انرژی مورد نیاز بدن شما هستند. علاوه بر این مصرف کربوهیدرات باعث افزایش استقامت شما در تمرینات و مسابقات می شوند. دو نوع کربوهیدرات وجود دارد: ساده و پیچیده. کربوهیدرات های ساده شاخص گلیسمی بالایی دارند به این معنی که قند خون شما را خیلی زود بالا می برند و شما نباید آنها را مصرف کنید. موادی مثل خوراکی های تهیه شده از آرد سفید مثل نان یا شیرینی های سفید حاوی کربوهیدرات های ساده و مضر هستند.</p>\r\n\r\n<p>در مقابل کربوهیدرات های پیچیده آهسته تر تجزیه می شوند و می توانند انرژی پایدارتر و طولانی تری را به شما هدیه بدهند. علاوه بر این یکی از ویژگی های کربوهیدرات های پیچیده جلوگیری از مشکلات قلبی و دیابت و همچنین کمک به کاهش وزن است.</p>\r\n\r\n<p><strong>برخی از منابع کربوهیدرات پیچیده عبارتند از:</strong></p>\r\n\r\n<ul>\r\n	<li>سیب زمینی</li>\r\n	<li>نخود فرنگی</li>\r\n	<li>لوبیا</li>\r\n	<li>برنج</li>\r\n	<li>جو دوسر</li>\r\n	<li>میوه ها</li>\r\n	<li>نان سبوس دار</li>\r\n</ul>\r\n\r\n<h3>حد مجاز مصرف چربی در رژیم غذایی بوکسورها</h3>\r\n\r\n<p>چربی های سالم نه تنها مضر نیستند بلکه برای بدن شما ضروری هم هستند. این چربی ها عملکرد مغز شما را افزایش می دهند و در بسیاری از فرایندهای حیاتی بدن ایفای نقش می کنند. منابع خوب و سالم دریافت چربی عبارتند از:</p>\r\n\r\n<ul>\r\n	<li>زیتون</li>\r\n	<li>غذاهای دریایی</li>\r\n	<li>آجیل و خشکبار</li>\r\n	<li>آووکادو</li>\r\n	<li>دانه های روغنی</li>\r\n	<li>روغن هایی مثل روغن زیتون، روغن ماکادمیا و روغن نارگیل</li>\r\n</ul>\r\n\r\n<p>تا حد امکان باید از چربی های ترانس و اشباع شده دوری کنید چون مصرف این نوع چربی ها باعث بیحالی و کاهش عملکرد مطلوبتان می شود.</p>', 1, 'بهترین-رژیم-غذایی-یک-بوکسور', '\"images\\\\post\\\\2023\\\\12\\\\06\\\\1701898371.jpg\"', 'تغذیه', 1, 2, 1, '2023-12-07 05:37:01', '2023-12-07 05:32:51', '2023-12-07 05:37:23', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `show_in_menu` tinyint(4) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`, `description`, `slug`, `image`, `tags`, `status`, `created_at`, `updated_at`, `deleted_at`, `show_in_menu`, `parent_id`) VALUES
(1, 'آموزش بوکس', '<p>اموزش بوکس</p>', 'آموزش-بوکس', '\"images\\\\post-category\\\\2023\\\\12\\\\06\\\\1701895419.jpg\"', 'بوکس', 1, '2023-12-07 04:43:39', '2023-12-07 04:43:49', NULL, 1, NULL),
(2, 'اصول تغذیه در ورزش بوکس', '<p>تغذیه</p>', 'اصول-تغذیه-در-ورزش-بوکس', '\"images\\\\post-category\\\\2023\\\\12\\\\06\\\\1701895650.jpg\"', 'تغذیه', 1, '2023-12-07 04:47:30', '2023-12-07 04:51:36', NULL, 1, NULL),
(3, 'اخبار و رویدادها', '<p>اخبار حوزه ورزش بوکس</p>', 'اخبار-و-رویدادها', '\"images\\\\post-category\\\\2023\\\\12\\\\06\\\\1701895892.jpg\"', 'اخبار بوکس', 1, '2023-12-07 04:51:32', '2023-12-07 04:51:32', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `public_mail`
--

CREATE TABLE `public_mail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `published_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `public_mail`
--

INSERT INTO `public_mail` (`id`, `subject`, `body`, `status`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'جمعه سیاه', '<p>سلام با تخفیف های جمعه های سیاه در خدمت شما هستیم</p>', 1, '2023-12-08 07:00:35', '2023-12-08 07:01:43', '2023-12-08 07:01:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `public_mail_files`
--

CREATE TABLE `public_mail_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `public_mail_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` text NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `public_sms`
--

CREATE TABLE `public_sms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `published_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1VtJa5pQK9klW3Kw2xMSWcs4h3mLmTfwsig4n95n', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM2J6cEdwYXhQM3BOTFZ1cEtJczVBeEFlQWJKajBlWjNiVnc5czBMZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9jb250ZW50L2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1701994854),
('en8GlTZR5aExpLKjWh5u9hAldxYRnchxFDUO4iA1', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ3p1TFVSdTV5M1gzQTNnVENWUHFnNzhGenkwM1Q0bmUzRTVNZ1hQRCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2NvbnRlbnQvY29tbWVudCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1702002535);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `seen` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => unseen, 1 => seen',
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `priority_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_admins`
--

CREATE TABLE `ticket_admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_categories`
--

CREATE TABLE `ticket_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_files`
--

CREATE TABLE `ticket_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_path` text NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_priorities`
--

CREATE TABLE `ticket_priorities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `national_code` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL COMMENT 'avatar',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `activation` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => inactive, 1 => active',
  `activation_date` timestamp NULL DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => user, 1 => admin',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `mobile`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `national_code`, `first_name`, `last_name`, `slug`, `profile_photo_path`, `email_verified_at`, `activation`, `activation_date`, `user_type`, `status`, `current_team_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 's313dasht@gmail.com', '09130186708', '12345678', NULL, NULL, '1250475708', 'سجاد', 'دشتبان وزیر', 'سجاد', NULL, NULL, 1, NULL, 1, 1, NULL, NULL, '2023-12-07 04:17:55', '2023-12-07 04:17:55', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`),
  ADD KEY `comments_author_id_foreign` (`author_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faqs_slug_unique` (`slug`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otps_user_id_foreign` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_author_id_foreign` (`author_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_views_index` (`views`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`),
  ADD KEY `post_categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `public_mail`
--
ALTER TABLE `public_mail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `public_mail_files`
--
ALTER TABLE `public_mail_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `public_mail_files_public_mail_id_foreign` (`public_mail_id`);

--
-- Indexes for table `public_sms`
--
ALTER TABLE `public_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_reference_id_foreign` (`reference_id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_category_id_foreign` (`category_id`),
  ADD KEY `tickets_priority_id_foreign` (`priority_id`),
  ADD KEY `tickets_ticket_id_foreign` (`ticket_id`);

--
-- Indexes for table `ticket_admins`
--
ALTER TABLE `ticket_admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_admins_user_id_foreign` (`user_id`);

--
-- Indexes for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_files`
--
ALTER TABLE `ticket_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_files_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_files_user_id_foreign` (`user_id`);

--
-- Indexes for table `ticket_priorities`
--
ALTER TABLE `ticket_priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `users_national_code_unique` (`national_code`),
  ADD UNIQUE KEY `users_slug_unique` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `public_mail`
--
ALTER TABLE `public_mail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `public_mail_files`
--
ALTER TABLE `public_mail_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `public_sms`
--
ALTER TABLE `public_sms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_admins`
--
ALTER TABLE `ticket_admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_files`
--
ALTER TABLE `ticket_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_priorities`
--
ALTER TABLE `ticket_priorities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`);

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`);

--
-- Constraints for table `otps`
--
ALTER TABLE `otps`
  ADD CONSTRAINT `otps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD CONSTRAINT `post_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `public_mail_files`
--
ALTER TABLE `public_mail_files`
  ADD CONSTRAINT `public_mail_files_public_mail_id_foreign` FOREIGN KEY (`public_mail_id`) REFERENCES `public_mail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `ticket_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `ticket_priorities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_reference_id_foreign` FOREIGN KEY (`reference_id`) REFERENCES `ticket_admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_admins`
--
ALTER TABLE `ticket_admins`
  ADD CONSTRAINT `ticket_admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_files`
--
ALTER TABLE `ticket_files`
  ADD CONSTRAINT `ticket_files_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
