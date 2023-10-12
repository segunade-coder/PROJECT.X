/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: g_expenses
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `g_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `accountant` varchar(255) NOT NULL,
  `amount_before` varchar(255) NOT NULL,
  `amount_after` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: g_notifications
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `g_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: g_payment_record
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `g_payment_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `amount_paid` varchar(255) NOT NULL,
  `PTA` int(11) NOT NULL,
  `lesson` int(11) NOT NULL,
  `tuition` int(11) NOT NULL,
  `expected_payment` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL,
  `term` varchar(255) NOT NULL,
  `session` varchar(255) NOT NULL,
  `DOG` varchar(255) NOT NULL,
  `DOP` varchar(255) NOT NULL,
  `balance_date` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `keyid` varchar(255) NOT NULL,
  `payment_for` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `accountant` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: g_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `g_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classes` varchar(4000) DEFAULT NULL,
  `current_session` varchar(255) NOT NULL,
  `sessions` varchar(255) NOT NULL,
  `current_term` varchar(255) NOT NULL,
  `terms` varchar(255) NOT NULL,
  `fees` varchar(4000) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_for` varchar(255) NOT NULL,
  `themes` varchar(255) NOT NULL,
  `wallets` varchar(255) NOT NULL,
  `default_wallets` varchar(255) NOT NULL,
  `backup_date` varchar(255) NOT NULL,
  `session_history` varchar(255) NOT NULL,
  `term_history` varchar(255) NOT NULL,
  `fee_history` varchar(4000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: g_students
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `g_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `guardian_name` varchar(255) NOT NULL,
  `guardian_id` varchar(255) NOT NULL,
  `adm_no` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `discounts` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: g_users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `g_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `last_login` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_expenses
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `accountant` varchar(255) NOT NULL,
  `amount_before` varchar(255) NOT NULL,
  `amount_after` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_notifications
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_payment_record
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_payment_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `amount_paid` varchar(255) NOT NULL,
  `PTA` int(11) NOT NULL,
  `lesson` int(11) NOT NULL,
  `tuition` int(11) NOT NULL,
  `expected_payment` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL,
  `term` varchar(255) NOT NULL,
  `session` varchar(255) NOT NULL,
  `DOG` varchar(255) NOT NULL,
  `DOP` varchar(255) NOT NULL,
  `balance_date` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `keyid` varchar(255) NOT NULL,
  `payment_for` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `accountant` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classes` varchar(4000) DEFAULT NULL,
  `current_session` varchar(255) NOT NULL,
  `sessions` varchar(255) NOT NULL,
  `current_term` varchar(255) NOT NULL,
  `terms` varchar(255) NOT NULL,
  `fees` varchar(4000) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_for` varchar(255) NOT NULL,
  `themes` varchar(255) NOT NULL,
  `wallets` varchar(255) NOT NULL,
  `default_wallets` varchar(255) NOT NULL,
  `backup_date` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_students
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `guardian_name` varchar(255) NOT NULL,
  `guardian_id` varchar(255) NOT NULL,
  `adm_no` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `discounts` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1258 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `last_login` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: global_kids_academy_wallets
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `global_kids_academy_wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: oakcrest_international_college_expenses
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `oakcrest_international_college_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `accountant` varchar(255) NOT NULL,
  `amount_before` varchar(255) NOT NULL,
  `amount_after` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: oakcrest_international_college_notifications
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `oakcrest_international_college_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: oakcrest_international_college_payment_record
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `oakcrest_international_college_payment_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `amount_paid` varchar(255) NOT NULL,
  `PTA` int(11) NOT NULL,
  `lesson` int(11) NOT NULL,
  `tuition` int(11) NOT NULL,
  `expected_payment` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL,
  `term` varchar(255) NOT NULL,
  `session` varchar(255) NOT NULL,
  `DOG` varchar(255) NOT NULL,
  `DOP` varchar(255) NOT NULL,
  `balance_date` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `keyid` varchar(255) NOT NULL,
  `payment_for` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `accountant` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: oakcrest_international_college_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `oakcrest_international_college_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classes` varchar(4000) DEFAULT NULL,
  `current_session` varchar(255) NOT NULL,
  `sessions` varchar(255) NOT NULL,
  `current_term` varchar(255) NOT NULL,
  `terms` varchar(255) NOT NULL,
  `fees` varchar(4000) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_for` varchar(255) NOT NULL,
  `themes` varchar(255) NOT NULL,
  `wallets` varchar(255) NOT NULL,
  `default_wallets` varchar(255) NOT NULL,
  `backup_date` varchar(255) NOT NULL,
  `fee_history` varchar(4000) NOT NULL,
  `session_history` varchar(50) NOT NULL,
  `term_history` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: oakcrest_international_college_students
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `oakcrest_international_college_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `guardian_name` varchar(255) NOT NULL,
  `guardian_id` varchar(255) NOT NULL,
  `adm_no` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `discounts` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 567 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: oakcrest_international_college_users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `oakcrest_international_college_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `last_login` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: oakcrest_international_college_wallets
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `oakcrest_international_college_wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: school_cred
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `school_cred` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(50) NOT NULL,
  `admin` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_of_pay` varchar(50) NOT NULL,
  `date_of_expiry` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `custom_login` varchar(50) NOT NULL,
  `logo` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: g_expenses
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: g_notifications
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: g_payment_record
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: g_settings
# ------------------------------------------------------------

INSERT INTO
  `g_settings` (
    `id`,
    `classes`,
    `current_session`,
    `sessions`,
    `current_term`,
    `terms`,
    `fees`,
    `payment_method`,
    `payment_for`,
    `themes`,
    `wallets`,
    `default_wallets`,
    `backup_date`,
    `session_history`,
    `term_history`,
    `fee_history`,
    `created_at`
  )
VALUES
  (
    1,
    '[]',
    '2021/2022',
    '2019/2020,2020/2021,2021/2022,2022/2023',
    '3rd term',
    '1st term,2nd term,3rd term',
    '[[\"waec\",\"10000\"],[\"bece\",\"10000\"],[\"school uniform\",\"5000\"]]',
    'zenith bank transfer,uba bank transfer,cash',
    'fees,fees ~ pta and lesson,fees and pta (no lesson),fees ~ part payment,fees ~ part payment (no lesson),fees ~ balance payment,others,busfare,pta,waec,neco',
    '[[\"text\",\"#ffffff\"],[\"foreGround\",\"#jfjfjf\"],[\"background\",\"#jfjfjf\"],[\"font\",\"Arial\"]]',
    '[[\"current\",0]]',
    'current',
    '',
    '',
    '',
    NULL,
    '2023-08-07 20:01:29'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: g_students
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: g_users
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_expenses
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_expenses` (
    `id`,
    `amount`,
    `wallet`,
    `description`,
    `accountant`,
    `amount_before`,
    `amount_after`,
    `created_at`
  )
VALUES
  (
    1,
    '50000',
    'current',
    'bus maintenance',
    'tobi',
    '117000',
    '67000',
    '2023-08-08 14:39:21'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_notifications
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_notifications` (
    `id`,
    `title`,
    `text`,
    `payment_id`,
    `status`,
    `created_at`
  )
VALUES
  (
    1,
    'balance date expired.',
    'the balance date of muktar ibrahim hanif expired 15 years ago',
    '63ahjmoi4f663ahjmoi4f69jp9k7jnn7e9jp9k7jnn7e',
    '1',
    '2023-08-08 14:30:14'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_payment_record
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `wallet`,
    `created_at`
  )
VALUES
  (
    1,
    'muktar ibrahim hanif abubakar',
    '34243',
    '30000',
    1000,
    0,
    29000,
    '66000',
    '36000',
    '3rd term',
    '2022/2023',
    '2009/01/01',
    '2008/12/01',
    '2023-08-09T23:00:00.000Z',
    'part payment made for 3rd term, through zenith bank transfer (2022/2023) ',
    'lower basic 4',
    '63ahjmoi4f663ahjmoi4f69jp9k7jnn7e9jp9k7jnn7e',
    'fees and pta (no lesson)',
    'zenith bank transfer',
    'admin',
    'current',
    '2023-08-08 14:31:32'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `wallet`,
    `created_at`
  )
VALUES
  (
    2,
    'jibril hawwa muhammed',
    '98528',
    '66000',
    1000,
    3000,
    62000,
    '66000',
    '0',
    '3rd term',
    '2021/2022',
    '',
    '2023/08/07',
    '',
    '3rd term payment for fees ~ pta and lesson, through zenith bank transfer (2021/2022) scholarship',
    'middle basic 5',
    '250f5p09ti0250f5p09ti072d7ap365t972d7ap365t9',
    'fees ~ pta and lesson',
    'zenith bank transfer',
    'admin',
    'current',
    '2023-08-08 14:29:51'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `wallet`,
    `created_at`
  )
VALUES
  (
    3,
    'elusoji zion oluwajomiloju',
    '87971',
    '20000',
    1000,
    0,
    19000,
    '32000',
    '12000',
    '3rd term',
    '2022/2023',
    '2023/08/08',
    '2023/08/08',
    '2023/08/09',
    'part payment made for 3rd term, through zenith bank transfer (2022/2023) ',
    'lower basic 3',
    '93cdo46e5dp93cdo46e5dp165nkemi9i00165nkemi9i00',
    'fees and pta (no lesson)',
    'zenith bank transfer',
    'tee',
    'current',
    '2023-08-08 11:45:15'
  );
INSERT INTO
  `global_kids_academy_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `wallet`,
    `created_at`
  )
VALUES
  (
    4,
    'morrison david',
    '40354',
    '1000',
    1000,
    0,
    0,
    '1000',
    '0',
    '3rd term',
    '2022/2023',
    '',
    '2023/08/07',
    '',
    '3rd term payment for pta, through zenith bank transfer (2022/2023) scholarship',
    'lower basic 3',
    '9p9g4o2jgl09p9g4o2jgl08sq1ar4fkdp8sq1ar4fkdp',
    'pta',
    'zenith bank transfer',
    'tee',
    'current',
    '2023-08-08 11:51:05'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_settings
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_settings` (
    `id`,
    `classes`,
    `current_session`,
    `sessions`,
    `current_term`,
    `terms`,
    `fees`,
    `payment_method`,
    `payment_for`,
    `themes`,
    `wallets`,
    `default_wallets`,
    `backup_date`,
    `created_at`
  )
VALUES
  (
    1,
    '[\"lower basic 2\",\"lower basic 3\",\"lower basic 4\",\"middle basic 5\",\"upper basic 1\"]',
    '2022/2023',
    '2019/2020,2020/2021,2021/2022,2022/2023',
    '3rd term',
    '1st term,2nd term,3rd term',
    '[[\"waec\",\"10000\"],[\"bece\",\"10000\"],[\"school uniform\",\"5000\"],[\"lower basic 2\",66000],[\"lower basic 2 lesson\",3000],[\"lower basic 2 pta\",1000],[\"lower basic 3\",66000],[\"lower basic 3 lesson\",0],[\"lower basic 3 pta\",0],[\"lower basic 4\",66000],[\"lower basic 4 lesson\",0],[\"lower basic 4 pta\",0],[\"middle basic 5\",66000],[\"middle basic 5 lesson\",3000],[\"middle basic 5 pta\",1000],[\"upper basic 1\",71000],[\"upper basic 1 lesson\",0],[\"upper basic 1 pta\",0]]',
    'zenith bank transfer,uba bank transfer',
    'fees,fees ~ pta and lesson,fees and pta (no lesson),fees ~ part payment,fees ~ part payment (no lesson),fees ~ balance payment,others,busfare,pta,waec,neco',
    '[[\"text\",\"#ffffff\"],[\"foreGround\",\"#jfjfjf\"],[\"background\",\"#jfjfjf\"],[\"font\",\"Arial\"]]',
    '[[\"current\",67000],[\"busfare\",0]]',
    'current',
    'Tue Aug 08 2023 14:57:42 GMT+0100 (West Africa Standard Time)',
    '2023-08-08 14:57:42'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_students
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    567,
    'abdullahi nuradeen',
    'lower basic 2',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    568,
    'abdulrahman aliyu usman',
    'lower basic 2',
    'abdulrahman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    569,
    'abubakar hauwa’u gumbi',
    'lower basic 2',
    'abubakar gumbi',
    'fhnaciih3rqfhnaciih3rq1q9j368q4tq41q9j368q4tq4',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-08 12:49:51'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    570,
    'abubakar zeenat abubakar',
    'lower basic 2',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    571,
    'adeleye samuel opeyemi',
    'lower basic 2',
    'adeleye',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    572,
    'ahmad abdulrashid abdulkadir',
    'lower basic 2',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    573,
    'auwal muhammad muazu',
    'lower basic 2',
    'auwal',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    574,
    'barau uzi nyampa',
    'lower basic 2',
    'barau',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    575,
    'danlawan husna abubakar',
    'lower basic 2',
    'danlawan',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    576,
    'ejeh precious chibuzor ifeoma',
    'lower basic 2',
    'ejeh',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    577,
    'gbenga alaka king',
    'lower basic 2',
    'gbenga',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    578,
    'harry michael chinedu',
    'lower basic 2',
    'harry',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    579,
    'hayatu hafsah',
    'lower basic 2',
    'hayatu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    580,
    'ibrahim habi burahaman',
    'lower basic 2',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    581,
    'idris abdulmutallab',
    'lower basic 2',
    'idris',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    582,
    'igwe chimobi callistus',
    'lower basic 2',
    'igwe',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    583,
    'ismail rahamat',
    'lower basic 2',
    'ismail',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    584,
    'jibrin aliyu maimuna',
    'lower basic 2',
    'jibrin',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    585,
    'junaidu alkasim abbas',
    'lower basic 2',
    'junaidu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    586,
    'kabir muhammad ahmad',
    'lower basic 2',
    'kabir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    587,
    'kasim ibrahim umar',
    'lower basic 2',
    'kasim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    588,
    'muhammad muhammad',
    'lower basic 2',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    589,
    'obende prince shalom',
    'lower basic 2',
    'obende',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    590,
    'samir salihu usman',
    'lower basic 2',
    'samir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    591,
    'sanusi aisha',
    'lower basic 2',
    'sanusi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    592,
    'suleiman hanifa almustapha',
    'lower basic 2',
    'suleiman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    593,
    'ugwu valentine onyedikachi',
    'lower basic 2',
    'ugwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    594,
    'usman yusra muhammad',
    'lower basic 2',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    595,
    'wambi andrew aaleyah',
    'lower basic 2',
    'wambi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    596,
    'yakubu seiwoh barkeji',
    'lower basic 2',
    'yakubu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    597,
    'yusuf balkisu adamu',
    'lower basic 2',
    'yusuf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    598,
    'zayannu fatima',
    'lower basic 2',
    'zayannu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    599,
    'abdul-salam jamilat yusmeen',
    'lower basic 2',
    'abdul-salam',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    600,
    'abdulazeez muhammad bin',
    'lower basic 2',
    'abdulazeez',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    601,
    'abdullahi khadijat',
    'lower basic 2',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    602,
    'abdulsalam zainab',
    'lower basic 2',
    'abdulsalam',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    603,
    'abubakar abdullahi',
    'lower basic 2',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    604,
    'abubakar alkali aisha',
    'lower basic 2',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    605,
    'adinnu king david kamtochukwu',
    'lower basic 2',
    'adinnu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    606,
    'ahlidza pius victor',
    'lower basic 2',
    'ahlidza',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    607,
    'alfa solomon onuche',
    'lower basic 2',
    'alfa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    608,
    'amadi - felix chimdinma divine',
    'lower basic 2',
    'amadi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    609,
    'aminu ahmad sani',
    'lower basic 2',
    'aminu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    610,
    'aweh michelle oiza',
    'lower basic 2',
    'aweh',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    611,
    'chibogwu ogochukwuka divine',
    'lower basic 2',
    'chibogwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    612,
    'dalhatu hauwa babangida',
    'lower basic 2',
    'dalhatu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    613,
    'damtong favour abraham',
    'lower basic 2',
    'damtong',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    614,
    'ekeh kaosisochukwu jecinta',
    'lower basic 2',
    'ekeh',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    615,
    'faruk aisha kasarawa',
    'lower basic 2',
    'faruk',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    616,
    'hassan salma',
    'lower basic 2',
    'hassan',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    617,
    'hussain zarah',
    'lower basic 2',
    'hussain',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    618,
    'ibrahim fatima',
    'lower basic 2',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    619,
    'jego jennifer salamatu',
    'lower basic 2',
    'jego',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    620,
    'lawali hussani',
    'lower basic 2',
    'lawali',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    621,
    'mahmud nana asma\'u',
    'lower basic 2',
    'mahmud',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    622,
    'mahmud yusra gummi',
    'lower basic 2',
    'mahmud',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    623,
    'mande rukayya bashir',
    'lower basic 2',
    'mande',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    624,
    'manir aisha ladan',
    'lower basic 2',
    'manir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    625,
    'musa zahra',
    'lower basic 2',
    'musa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    626,
    'nafiu saimah',
    'lower basic 2',
    'nafiu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    627,
    'nknocha emmanuel chimdiuoo',
    'lower basic 2',
    'nknocha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    628,
    'odumukure mnasichukwu peculier',
    'lower basic 2',
    'odumukure',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    629,
    'salihu amina',
    'lower basic 2',
    'salihu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    630,
    'shehu maryam adamu',
    'lower basic 2',
    'shehu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    631,
    'shehu umar aisha',
    'lower basic 2',
    'shehu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    632,
    'sunday-okechukwu majesti zimchikachim',
    'lower basic 2',
    'sunday-okechukwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    633,
    'abbas usman',
    'lower basic 2',
    'abbas',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    634,
    'abubakar abdul salam',
    'lower basic 2',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    635,
    'abubakar asmau yusuf',
    'lower basic 2',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    636,
    'abubakar jamilu bachaka',
    'lower basic 2',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    637,
    'abubakar muhammad al-amin',
    'lower basic 2',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    638,
    'aminu abubakar sadiq',
    'lower basic 2',
    'aminu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    639,
    'badmus aisha',
    'lower basic 2',
    'badmus',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    640,
    'bello fatima bulaki',
    'lower basic 2',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    641,
    'bello gada safiya',
    'lower basic 2',
    'bello gada',
    '16ig5nb1shgk16ig5nb1shgkgff2ltgkdocgff2ltgkdoc',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 15:11:46'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    642,
    'bello gada usman',
    'lower basic 2',
    'bello gada',
    '16ig5nb1shgk16ig5nb1shgkgff2ltgkdocgff2ltgkdoc',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 15:11:46'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    643,
    'bello ilyas murtala',
    'lower basic 2',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    644,
    'chinedu ifeagwu unity neriah',
    'lower basic 2',
    'chinedu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    645,
    'hamidu abdulazeez abubakar',
    'lower basic 2',
    'hamidu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    646,
    'hassan mahmud',
    'lower basic 2',
    'hassan',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    647,
    'hayatu ummusulaimi ahmed',
    'lower basic 2',
    'hayatu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    648,
    'ikenna ndedigwe',
    'lower basic 2',
    'ikenna',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    649,
    'jibril mahmud fadeel',
    'lower basic 2',
    'jibril',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    650,
    'john jethro ekaji',
    'lower basic 2',
    'john',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    651,
    'junaidu muhammad abbas',
    'lower basic 2',
    'junaidu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    652,
    'maccido muhammad ladan',
    'lower basic 2',
    'maccido',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    653,
    'muhammad imran ahmad',
    'lower basic 2',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    654,
    'muhammad muhammad al muna jjid',
    'lower basic 2',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    655,
    'mukthar aliyu',
    'lower basic 2',
    'mukthar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    656,
    'nasiru sa\'ad kojiyo',
    'lower basic 2',
    'nasiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    657,
    'okorie godwin ndubisi',
    'lower basic 2',
    'okorie',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    658,
    'oni samuel oluwasemi',
    'lower basic 2',
    'oni',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    659,
    'samuel chimaobim emmanuel',
    'lower basic 2',
    'samuel',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    660,
    'shuaibu umar zakariya',
    'lower basic 2',
    'shuaibu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    661,
    'tiamiyu eemaan ramadan',
    'lower basic 2',
    'tiamiyu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    662,
    'tsalha abdulhakeem',
    'lower basic 2',
    'tsalha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    663,
    'umar hauwa\'u abubakar',
    'lower basic 2',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    664,
    'usman aslam mohammad',
    'lower basic 2',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    665,
    'yabugbe victoria',
    'lower basic 2',
    'yabugbe',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    666,
    'yushau sadiq',
    'lower basic 2',
    'yushau',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    667,
    'yusuf hussani hussani',
    'lower basic 2',
    'yusuf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    668,
    'yusuf mukhtar abdulkarim',
    'lower basic 2',
    'yusuf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    669,
    'abdulaziz zainab abubakar',
    'lower basic 2',
    'abdulaziz',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    670,
    'abubakar jabir jabo',
    'lower basic 2',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    671,
    'afolayan michelle abolade',
    'lower basic 2',
    'afolayan',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    672,
    'akinola hafsat',
    'lower basic 2',
    'akinola',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    673,
    'alfa david idogah',
    'lower basic 2',
    'alfa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    674,
    'bello faruk',
    'lower basic 2',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    675,
    'edwin daniel munachisom',
    'lower basic 2',
    'edwin',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    676,
    'egwuatu kamsiyochukwu olive',
    'lower basic 2',
    'egwuatu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    677,
    'godwin emmanuella oyine',
    'lower basic 2',
    'godwin',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    678,
    'hassan lawal umar',
    'lower basic 2',
    'hassan',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    679,
    'ibrahim amina',
    'lower basic 2',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    680,
    'ishaq muhammad',
    'lower basic 2',
    'ishaq',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    681,
    'jibrin nameerah usman',
    'lower basic 2',
    'jibrin',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    682,
    'kedado ummi ibrahim',
    'lower basic 2',
    'kedado',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    683,
    'khalid abdullahi abdullahi',
    'lower basic 2',
    'khalid',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    684,
    'lawal suleiman muhammad',
    'lower basic 2',
    'lawal',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    685,
    'muhammad abdulqadir',
    'lower basic 2',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    686,
    'muhammad maryam',
    'lower basic 2',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    687,
    'murtala maryam',
    'lower basic 2',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    688,
    'mustapha zarah bashir',
    'lower basic 2',
    'mustapha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    689,
    'nasir s/baki habiba',
    'lower basic 2',
    'nasir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    690,
    'obetta amarachi amanda',
    'lower basic 2',
    'obetta',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    691,
    'olanrewaju oyindamola favour',
    'lower basic 2',
    'olanrewaju',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    692,
    'onyekachi ifeanyichukwu divine',
    'lower basic 2',
    'onyekachi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    693,
    'pemida enoch adoza',
    'lower basic 2',
    'pemida',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    694,
    'umar al-amin arzika',
    'lower basic 2',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    695,
    'usman muhammad ashraf',
    'lower basic 2',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    696,
    'yohanna samuel augustine',
    'lower basic 2',
    'yohanna',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    697,
    'yunusa janna firduasi',
    'lower basic 2',
    'yunusa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    698,
    'yusuf mahmud',
    'lower basic 2',
    'yusuf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    699,
    'abdulaziz abubakar bilal',
    'lower basic 3',
    'abdulaziz',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    700,
    'abdullahi aliyu abdullahi',
    'lower basic 3',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    701,
    'abdullahi muhammad',
    'lower basic 3',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    702,
    'abdullahi muktar sherif',
    'lower basic 3',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    703,
    'abubakar abubakar',
    'lower basic 3',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    704,
    'aliyu fatima usman',
    'lower basic 3',
    'aliyu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    705,
    'alkamawa uthman kabir',
    'lower basic 3',
    'alkamawa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    706,
    'aminu aliyu',
    'lower basic 3',
    'aminu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    707,
    'baba muhammad tukur',
    'lower basic 3',
    'baba',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    708,
    'bawa silaelaska bitrus',
    'lower basic 3',
    'bawa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    709,
    'garba aliyu babangida',
    'lower basic 3',
    'garba',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    710,
    'hamza husna gatawa',
    'lower basic 3',
    'hamza',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    711,
    'haruna iman rabiat',
    'lower basic 3',
    'haruna',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    712,
    'ibrahim nasim',
    'lower basic 3',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    713,
    'idris ahmad gobir',
    'lower basic 3',
    'idris',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    714,
    'innocent chimgozirim pascal',
    'lower basic 3',
    'innocent',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    715,
    'kasim abdulsalam',
    'lower basic 3',
    'kasim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    716,
    'lawal faruk muhammad',
    'lower basic 3',
    'lawal',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    717,
    'mansur rukayya ahmad',
    'lower basic 3',
    'mansur',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    718,
    'matthew bright oladimeji',
    'lower basic 3',
    'matthew',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    719,
    'muazu umar dauda',
    'lower basic 3',
    'muazu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    720,
    'muhammad ahmad zayanu',
    'lower basic 3',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    721,
    'muhammad aisha maccido',
    'lower basic 3',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    722,
    'muhammad bashir muhammad',
    'lower basic 3',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    723,
    'muhammad tahir buhari',
    'lower basic 3',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    724,
    'mukhtar balle amina',
    'lower basic 3',
    'mukhtar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    725,
    'mukhtar fatima',
    'lower basic 3',
    'mukhtar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    726,
    'mukhtar zainab maigona',
    'lower basic 3',
    'mukhtar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    727,
    'ndedigwe chidoze harrison',
    'lower basic 3',
    'ndedigwe',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    728,
    'obioha kelechukwu daniel',
    'lower basic 3',
    'obioha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    729,
    'ojonugwa marvellous alfa',
    'lower basic 3',
    'ojonugwa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    730,
    'okeke jessica',
    'lower basic 3',
    'okeke',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    731,
    'okeke oluomachukwu goodness',
    'lower basic 3',
    'okeke',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    732,
    'osori aisha abdulganiyu',
    'lower basic 3',
    'osori',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    733,
    'sadiq yusuf abdulrahman',
    'lower basic 3',
    'sadiq',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    734,
    'sajjad zayyanu',
    'lower basic 3',
    'sajjad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    735,
    'suleiman zainab',
    'lower basic 3',
    'suleiman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    736,
    'umar abdulrahman',
    'lower basic 3',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    737,
    'usman abubakar musaddiq',
    'lower basic 3',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    738,
    'usman ammar',
    'lower basic 3',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    739,
    'abdullahi firdausu',
    'lower basic 3',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    740,
    'abubakar ahmed ummusalma',
    'lower basic 3',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    741,
    'abubakar zainab panti',
    'lower basic 3',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    742,
    'adejumo joshua ayomide',
    'lower basic 3',
    'adejumo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    743,
    'akinsoji akindayo zidan',
    'lower basic 3',
    'akinsoji',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    744,
    'bashar khadija mansur',
    'lower basic 3',
    'bashar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    745,
    'bashir salim suleiman',
    'lower basic 3',
    'bashir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    746,
    'bello m. rukayya',
    'lower basic 3',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    747,
    'bello nana khadija',
    'lower basic 3',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    748,
    'bello susan oluwatoyin',
    'lower basic 3',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    749,
    'buhari ahmed muhmmed',
    'lower basic 3',
    'buhari',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    750,
    'burodo ismail ahmed',
    'lower basic 3',
    'burodo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    751,
    'chikadibia eliora nzoputachi',
    'lower basic 3',
    'chikadibia',
    '13fgc4molj7m13fgc4molj7me88r4h5j8lee88r4h5j8le',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:54:32'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    752,
    'chukwu paul brianna chizara',
    'lower basic 3',
    'chukwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    753,
    'dahiru asmau maigandi',
    'lower basic 3',
    'dahiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    754,
    'garba hafsat',
    'lower basic 3',
    'garba',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    755,
    'habib habida',
    'lower basic 3',
    'habib',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    756,
    'imam asma\'u yusuf',
    'lower basic 3',
    'imam',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    757,
    'innocent goodness ikpemi noghena',
    'lower basic 3',
    'innocent',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    758,
    'jafar abdurrahman agwari',
    'lower basic 3',
    'jafar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    759,
    'liman ahmed',
    'lower basic 3',
    'liman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    760,
    'maxwell emmanuel treasure',
    'lower basic 3',
    'maxwell',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    761,
    'morrison david',
    'lower basic 3',
    'morrison',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    762,
    'muhammad sakina ibrahim',
    'lower basic 3',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    763,
    'murtala zainab dogondaji',
    'lower basic 3',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    764,
    'mustapha fatima abdulkarim',
    'lower basic 3',
    'mustapha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    765,
    'mustapha hamza matazu',
    'lower basic 3',
    'mustapha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    766,
    'nasiru shamsudeen bafarawa',
    'lower basic 3',
    'nasiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    767,
    'okolie jennifer chidolu',
    'lower basic 3',
    'okolie',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    768,
    'olajide success ayomide',
    'lower basic 3',
    'olajide',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    769,
    'onyemerekwe winner sochimere',
    'lower basic 3',
    'onyemerekwe',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    770,
    'sadiq kasim sadiq',
    'lower basic 3',
    'sadiq',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    771,
    'shehu hauwau',
    'lower basic 3',
    'shehu',
    '24qtm2317j6o24qtm2317j6o8lfde1chlt38lfde1chlt3',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 15:03:24'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    772,
    'sulaiman sakina hanan',
    'lower basic 3',
    'sulaiman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    773,
    'umar hafsat jibril',
    'lower basic 3',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    774,
    'vincent david oluwafemi',
    'lower basic 3',
    'vincent',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    775,
    'zakari abdullahi',
    'lower basic 3',
    'zakari',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    776,
    'zubairu usman zainab',
    'lower basic 3',
    'zubairu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    777,
    'abdulrauf abdulsamad ahmed',
    'lower basic 3',
    'abdulrauf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    778,
    'abubakar aliyu sambo',
    'lower basic 3',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    779,
    'abubakar bello gada',
    'lower basic 3',
    'bello gada',
    '16ig5nb1shgk16ig5nb1shgkgff2ltgkdocgff2ltgkdoc',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 15:11:46'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    780,
    'abubakar umar faruq',
    'lower basic 3',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    781,
    'ahmad halima jabo',
    'lower basic 3',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    782,
    'ahmed hauwau',
    'lower basic 3',
    'ahmed',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    783,
    'aikpitanyi justin efeosa',
    'lower basic 3',
    'aikpitanyi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    784,
    'ali mustapha fatimatu hussannia',
    'lower basic 3',
    'ali',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    785,
    'aliyu a.a aliyu',
    'lower basic 3',
    'aliyu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    786,
    'aminu al-amin abdullahi',
    'lower basic 3',
    'aminu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    787,
    'auwal hafsat muhammad',
    'lower basic 3',
    'auwal',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    788,
    'balarabe usman',
    'lower basic 3',
    'balarabe',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    789,
    'bello fatima abbas',
    'lower basic 3',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    790,
    'chukwu patrick kosisochukwu kevin',
    'lower basic 3',
    'chukwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    791,
    'elusoji zion oluwajomiloju',
    'lower basic 3',
    'elusoji',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    792,
    'fatimah murtala',
    'lower basic 3',
    'fatimah',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    793,
    'godwin nnaye rebecca',
    'lower basic 3',
    'godwin',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    794,
    'habib soliha',
    'lower basic 3',
    'habib',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    795,
    'hamidah aramide amzat',
    'lower basic 3',
    'hamidah',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    796,
    'idris fatima nana',
    'lower basic 3',
    'idris',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    797,
    'ikechukwu chidubem bright',
    'lower basic 3',
    'ikechukwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    798,
    'jego gabriel peter',
    'lower basic 3',
    'jego',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    799,
    'makama ahmad abdullahi',
    'lower basic 3',
    'makama',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    800,
    'mansur khadija maishanu',
    'lower basic 3',
    'mansur',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    801,
    'matthew smart olamide',
    'lower basic 3',
    'matthew',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    802,
    'mikailu fatima',
    'lower basic 3',
    'mikailu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    803,
    'nasiru abubakar kojiyo',
    'lower basic 3',
    'nasiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    804,
    'nurudeen al-amin gummi',
    'lower basic 3',
    'nurudeen',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    805,
    'nwankwo chisimdi mirabel',
    'lower basic 3',
    'nwankwo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    806,
    'ogar goodness cyprain',
    'lower basic 3',
    'ogar',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    807,
    'owoamanam nelson zeta munachim',
    'lower basic 3',
    'owoamanam',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    808,
    'reuben mary erioluwa',
    'lower basic 3',
    'reuben',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    809,
    'shehu muhammad fatima',
    'lower basic 3',
    'shehu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    810,
    'sunday-okechukwu divine chikamara',
    'lower basic 3',
    'sunday-okechukwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    811,
    'umar ibrahim aisha',
    'lower basic 3',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    812,
    'umar muhammad sani',
    'lower basic 3',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    813,
    'umar ummusalma',
    'lower basic 3',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    814,
    'wali hafsat bello',
    'lower basic 3',
    'wali',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    815,
    'yusuf amina ganda',
    'lower basic 3',
    'yusuf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    816,
    'abdulkareem farida',
    'lower basic 3',
    'abdulkareem',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    817,
    'abdullahi amina bande',
    'lower basic 3',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    818,
    'abdulsamad idris',
    'lower basic 3',
    'abdulsamad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    819,
    'abubakar aishatu sani',
    'lower basic 3',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    820,
    'abubakar amina tijjani',
    'lower basic 3',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    821,
    'abubakar b. muhammad',
    'lower basic 3',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    822,
    'abubakar hauwa sabo',
    'lower basic 3',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    823,
    'adamu abdullahi ummuhani',
    'lower basic 3',
    'adamu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    824,
    'adesayo ayobam david',
    'lower basic 3',
    'adesayo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    825,
    'ahmad ibrahim bamidele',
    'lower basic 3',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    826,
    'ahmad sabo khadijah',
    'lower basic 3',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    827,
    'alamin abdallah muhammad',
    'lower basic 3',
    'alamin',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    828,
    'almustapha halimatu hassana',
    'lower basic 3',
    'almustapha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    829,
    'auwal gada munirat',
    'lower basic 3',
    'bello gada',
    '16ig5nb1shgk16ig5nb1shgkgff2ltgkdocgff2ltgkdoc',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 15:11:46'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    830,
    'bello sadiq yabo',
    'lower basic 3',
    'bello',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    831,
    'binanchi sadiq abubakar',
    'lower basic 3',
    'binanchi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    832,
    'divine favour obah ochefi',
    'lower basic 3',
    'divine',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    833,
    'emmanuel elnathan oche',
    'lower basic 3',
    'emmanuel',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    834,
    'faruk mayana hafsat',
    'lower basic 3',
    'faruk',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    835,
    'hamza nana khadijah sani',
    'lower basic 3',
    'hamza',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    836,
    'hisham hayatudeen',
    'lower basic 3',
    'hisham',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    837,
    'ibrahim aishatu yasmin',
    'lower basic 3',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    838,
    'ikechukwu amarachi peace',
    'lower basic 3',
    'ikechukwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    839,
    'mbaemeka nmasichukwu mirable',
    'lower basic 3',
    'mbaemeka',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    840,
    'muhammad abubakar nuradeen',
    'lower basic 3',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    841,
    'muhammad hafsatu abubakar',
    'lower basic 3',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    842,
    'mukhtar fatima',
    'lower basic 3',
    'mukhtar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    843,
    'mukthar abdulrahman mohammed',
    'lower basic 3',
    'mukthar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    844,
    'mustapha fatima bello',
    'lower basic 3',
    'mustapha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    845,
    'raji jesufemitan jesugbamitan',
    'lower basic 3',
    'raji',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    846,
    'sadiq faruk sahabi',
    'lower basic 3',
    'sadiq',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    847,
    'salihu fatimah bala',
    'lower basic 3',
    'salihu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    848,
    'shehu shafiu',
    'lower basic 3',
    'shehu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    849,
    'shehu umar fatima',
    'lower basic 3',
    'shehu',
    '24qtm2317j6o24qtm2317j6o8lfde1chlt38lfde1chlt3',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 15:03:24'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    850,
    'umar tukur yabo',
    'lower basic 3',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    851,
    'umar umar salah',
    'lower basic 3',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    852,
    'wakili murtala abdulsalam',
    'lower basic 3',
    'wakili',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    853,
    'yusuf umar faruk',
    'lower basic 3',
    'yusuf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    854,
    'abdulrahman muhammad muhadiths',
    'lower basic 4',
    'abdulrahman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    855,
    'abdulrazaq farida olabisi',
    'lower basic 4',
    'abdulrazaq',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    856,
    'abdulsalam niimatulla',
    'lower basic 4',
    'abdulsalam',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    857,
    'abubakar fatima bello',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    858,
    'abubakar hassan chika',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    859,
    'abubakar nana aisha',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    860,
    'adamu muazu aisha',
    'lower basic 4',
    'adamu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    861,
    'ahmad aminu ilah',
    'lower basic 4',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    862,
    'akinola aliyu',
    'lower basic 4',
    'akinola',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    863,
    'aminu fatima nagwari',
    'lower basic 4',
    'aminu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    864,
    'amutta ekondu',
    'lower basic 4',
    'amutta',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    865,
    'andekuba naomi ikoti',
    'lower basic 4',
    'andekuba',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    866,
    'bashir masud aliyu',
    'lower basic 4',
    'bashir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    867,
    'danfulani muhammad ummu salma',
    'lower basic 4',
    'danfulani',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    868,
    'david oluwatobiloba olanrewaju',
    'lower basic 4',
    'david',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    869,
    'emmanuel divine praise',
    'lower basic 4',
    'emmanuel',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    870,
    'hameedah ado shehu',
    'lower basic 4',
    'hameedah',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    871,
    'hassan salim',
    'lower basic 4',
    'hassan',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    872,
    'husaini ummukaltume',
    'lower basic 4',
    'husaini',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    873,
    'iseh itoro kufre',
    'lower basic 4',
    'iseh',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    874,
    'jibril hawwa muhammed',
    'middle basic 5',
    'jibril',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-08 14:28:59'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    875,
    'khadeejat abdullahi',
    'lower basic 4',
    'khadeejat',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    876,
    'maccido fatima abdulaziz',
    'lower basic 4',
    'maccido',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    877,
    'moriki rabiu kabir',
    'lower basic 4',
    'moriki',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    878,
    'moses success testimony',
    'lower basic 4',
    'moses',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    879,
    'mukhtar khadija maigona',
    'lower basic 4',
    'mukhtar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    880,
    'mukthar ikram yahaya',
    'lower basic 4',
    'mukthar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    881,
    'myaminawe elisha elisha',
    'lower basic 4',
    'myaminawe',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    882,
    'nafiu adnan',
    'lower basic 4',
    'nafiu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    883,
    'nuruddeen fauwaz aliyu',
    'lower basic 4',
    'nuruddeen',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    884,
    'nwemeh wonder chimaka',
    'lower basic 4',
    'nwemeh',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    885,
    'okechukwu marvellous chidindu',
    'lower basic 4',
    'okechukwu',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    886,
    'okpara excellence chibudo',
    'lower basic 4',
    'okpara',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    887,
    'oyelade favour eyinjuoluwa',
    'lower basic 4',
    'oyelade',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    888,
    'peter favour',
    'lower basic 4',
    'peter',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    889,
    'peterside juanita achima',
    'lower basic 4',
    'peterside',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    890,
    's.kabbi khadija sani',
    'lower basic 4',
    's.kabbi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    891,
    'sani jabo amina leila',
    'lower basic 4',
    'sani',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    892,
    'shamsudden hannatu umar',
    'lower basic 4',
    'shamsudden',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    893,
    'shehu ismail umar',
    'lower basic 4',
    'shehu',
    '24qtm2317j6o24qtm2317j6o8lfde1chlt38lfde1chlt3',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 15:03:24'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    894,
    'sulaiman almustapha hafsat',
    'lower basic 4',
    'sulaiman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    895,
    'tahir jamil salwa',
    'lower basic 4',
    'tahir',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    896,
    'usman aisha',
    'lower basic 4',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    897,
    'zakari auwal muhammad',
    'lower basic 4',
    'zakari',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    898,
    'abubakar fatima yusrah',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    899,
    'abubakar hussaini chika',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    900,
    'adeniyi joshua adejare',
    'lower basic 4',
    'adeniyi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    901,
    'ahmad alamin moyi',
    'lower basic 4',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    902,
    'ajanna hadassah',
    'lower basic 4',
    'ajanna',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    903,
    'aminu aisha gummi',
    'lower basic 4',
    'aminu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    904,
    'asogwa ugochukwu stanley',
    'lower basic 4',
    'asogwa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    905,
    'bashir fatima mohammad',
    'lower basic 4',
    'bashir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    906,
    'bello bawa fatima',
    'lower basic 4',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    907,
    'bulus naomi gwimi',
    'lower basic 4',
    'bulus',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    908,
    'chiabua michael anthony',
    'lower basic 4',
    'chiabua',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    909,
    'chukwu paul captain hendrick',
    'lower basic 4',
    'chukwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    910,
    'elobi amanda scholastica',
    'lower basic 4',
    'elobi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    911,
    'fareedah ado shehu',
    'lower basic 4',
    'fareedah',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    912,
    'galadima abdallah abdullahi',
    'lower basic 4',
    'galadima',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    913,
    'godwin grant ifeanyi',
    'lower basic 4',
    'godwin',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    914,
    'ibrahim ismail',
    'lower basic 4',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    915,
    'ikechukwu nmasichukwu favour',
    'lower basic 4',
    'ikechukwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    916,
    'isaac eliora enyojo',
    'lower basic 4',
    'isaac',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    917,
    'kabiru asmau',
    'lower basic 4',
    'kabiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    918,
    'kenneth mabel okafor',
    'lower basic 4',
    'kenneth',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    919,
    'khalid fatima abdullahi',
    'lower basic 4',
    'khalid',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    920,
    'lucky jonathan abiola',
    'lower basic 4',
    'lucky',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    921,
    'magori usman shehu',
    'lower basic 4',
    'magori',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    922,
    'mahmud khalifa gummi',
    'lower basic 4',
    'mahmud',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    923,
    'mikail sanchi khadija ummi',
    'lower basic 4',
    'mikail',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    924,
    'muhammad abubakar ibrahim',
    'lower basic 4',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    925,
    'muhammad sumayya ibrahim',
    'lower basic 4',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    926,
    'muktar ibrahim hanif',
    'lower basic 4',
    'muktar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    927,
    'mukthar abdulrahman',
    'lower basic 4',
    'mukthar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    928,
    'murtala chika daiba',
    'lower basic 4',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    929,
    'murtala maryam',
    'lower basic 4',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    930,
    'murtala muhammad bello',
    'lower basic 4',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    931,
    'nwemeh great chizaram',
    'lower basic 4',
    'nwemeh',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    932,
    'odunukwe chidera purity',
    'lower basic 4',
    'odunukwe',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    933,
    'ogar godsdelight ojonswa',
    'lower basic 4',
    'ogar',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    934,
    'okechukwu benjamin c.',
    'lower basic 4',
    'okechukwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    935,
    'okparah zionglory mmesoma',
    'lower basic 4',
    'okparah',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    936,
    'otitolaiye modupe mary',
    'lower basic 4',
    'otitolaiye',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    937,
    'shehu ashiru umar',
    'lower basic 4',
    'shehu',
    '24qtm2317j6o24qtm2317j6o8lfde1chlt38lfde1chlt3',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 15:03:24'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    938,
    'ugwu prince pedro chinedu',
    'lower basic 4',
    'ugwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    939,
    'ugwu victor onyebuchi',
    'lower basic 4',
    'ugwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    940,
    'usman ishaq ibrahim',
    'lower basic 4',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    941,
    'uzoma chisom gerard',
    'lower basic 4',
    'uzoma',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    942,
    'abdulmalik mustaqimah',
    'lower basic 4',
    'abdulmalik',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    943,
    'abubakar buhari sani',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    944,
    'abubakar salihu',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    945,
    'abubakar ahmad',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    946,
    'abubakr balkisu gumbi',
    'lower basic 4',
    'abubakar gumbi',
    'fhnaciih3rqfhnaciih3rq1q9j368q4tq41q9j368q4tq4',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-08 12:49:51'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    947,
    'adamu hadiza',
    'lower basic 4',
    'adamu',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    948,
    'ahmad yushau',
    'lower basic 4',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    949,
    'alamin mohammed olawale',
    'lower basic 4',
    'alamin',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    950,
    'aliyu bala khadija',
    'lower basic 4',
    'aliyu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    951,
    'aliyu fodio ahmad',
    'lower basic 4',
    'aliyu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    952,
    'aminu malami usman',
    'lower basic 4',
    'aminu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    953,
    'armaiyau hauwa’u yabo',
    'lower basic 4',
    'armaiyau',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    954,
    'bello alamin',
    'lower basic 4',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    955,
    'chibuzor k. isabella',
    'lower basic 4',
    'chibuzor',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    956,
    'chikadibia michelle',
    'lower basic 4',
    'chikadibia',
    '13fgc4molj7m13fgc4molj7me88r4h5j8lee88r4h5j8le',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:54:32'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    957,
    'emenike gift',
    'lower basic 4',
    'emenike',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    958,
    'faruk uamr abdulhamid',
    'lower basic 4',
    'faruk',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    959,
    'ibrahim isiyaku ibrahim',
    'lower basic 4',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    960,
    'ibrahim maimuna albarka',
    'lower basic 4',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    961,
    'jabo murtala asmau',
    'lower basic 4',
    'jabo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    962,
    'kabir aisha ahmad',
    'lower basic 4',
    'kabir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    963,
    'kabir umar faruk',
    'lower basic 4',
    'kabir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    964,
    'lawal mubarak',
    'lower basic 4',
    'lawal',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    965,
    'maiyaki a. zainab',
    'lower basic 4',
    'maiyaki',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    966,
    'mansur halimatu ahmad',
    'lower basic 4',
    'mansur',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    967,
    'marvis obidike',
    'lower basic 4',
    'marvis',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    968,
    'muhammad k. rukayya',
    'lower basic 4',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    969,
    'muhammad zainab',
    'lower basic 4',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    970,
    'murtala amina muhammad',
    'lower basic 4',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    971,
    'mustapha fatima maigona',
    'lower basic 4',
    'mustapha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    972,
    'ndubuizu chizaram fedora',
    'lower basic 4',
    'ndubuizu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    973,
    'obadele tehila ifeoluwa',
    'lower basic 4',
    'obadele',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    974,
    'onuama chinoso david',
    'lower basic 4',
    'onuama',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    975,
    'onyekachi emmanuel',
    'lower basic 4',
    'onyekachi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    976,
    'pascal adinnu',
    'lower basic 4',
    'pascal',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    977,
    'pemida christiana',
    'lower basic 4',
    'pemida',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    978,
    'sani ahmed abdulmumini',
    'lower basic 4',
    'sani',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    979,
    'usman musa asmau',
    'lower basic 4',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    980,
    'zaheeda ado shehu',
    'lower basic 4',
    'zaheeda',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    981,
    'zainab abubakar usman',
    'lower basic 4',
    'zainab',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    982,
    'fatima mustapha matazu',
    'lower basic 4',
    'fatima',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    983,
    'jeffery uzong',
    'lower basic 4',
    'jeffery',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    984,
    'camillius igwe',
    'lower basic 4',
    'camillius',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    985,
    'abbas lawal',
    'lower basic 4',
    'abbas',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    986,
    'abdulrazak aminu',
    'lower basic 4',
    'abdulrazak',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    987,
    'abubakar asmau ummi',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    988,
    'abubakar hafsat gumbi',
    'lower basic 4',
    'abubakar gumbi',
    'fhnaciih3rqfhnaciih3rq1q9j368q4tq41q9j368q4tq4',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-08 12:49:51'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    989,
    'abubakar hafsat yusuf',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    990,
    'abubakar hussaini',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    991,
    'abubakar huzaifa yusuf',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    992,
    'abubakar ibrahim aisha',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    993,
    'abubakar muhammad sambo',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    994,
    'abubakar yakubu ilyasu',
    'lower basic 4',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    995,
    'afonta chimeremeze samuel',
    'lower basic 4',
    'afonta',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    996,
    'ahmad abdulkadir',
    'lower basic 4',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    997,
    'ahmad bello bulaki',
    'lower basic 4',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    998,
    'ahmadu umar suka',
    'lower basic 4',
    'ahmadu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    999,
    'ahmed abubakar sadiq',
    'lower basic 4',
    'ahmed',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1000,
    'akawu ibrahim ahmad',
    'lower basic 4',
    'akawu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1001,
    'aleyideno divinity wonder',
    'lower basic 4',
    'aleyideno',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1002,
    'aminu sanusi',
    'lower basic 4',
    'aminu',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1003,
    'bello ahmad abbas',
    'lower basic 4',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1004,
    'bello muhhamad aliyu',
    'lower basic 4',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1005,
    'bello nadiya wamakko',
    'lower basic 4',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1006,
    'bilyaminu bello gosta',
    'lower basic 4',
    'bilyaminu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1007,
    'chinedu alpha micheal',
    'lower basic 4',
    'chinedu',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1008,
    'ezenwanyi chiamaka anastasia',
    'lower basic 4',
    'ezenwanyi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1009,
    'garba maryam',
    'lower basic 4',
    'garba',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1010,
    'garba usman rumasau',
    'lower basic 4',
    'garba',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1011,
    'hudu shuaibu abdulnasir',
    'lower basic 4',
    'hudu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1012,
    'ibrahim fatima riskuwa',
    'lower basic 4',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1013,
    'ibrahim sadiq',
    'lower basic 4',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1014,
    'kabiru umar gada',
    'lower basic 4',
    'bello gada',
    '16ig5nb1shgk16ig5nb1shgkgff2ltgkdocgff2ltgkdoc',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 15:11:46'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1015,
    'lamido yusuf bello',
    'lower basic 4',
    'lamido',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1016,
    'lawal auwaar',
    'lower basic 4',
    'lawal',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1017,
    'madueke chibuike emmanuel',
    'lower basic 4',
    'madueke',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1018,
    'maitambari shamsudeen ahmed',
    'lower basic 4',
    'maitambari',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1019,
    'mansur ummusalama gidado',
    'lower basic 4',
    'mansur',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1020,
    'mikailu jafar',
    'lower basic 4',
    'mikailu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1021,
    'muhammad rashid al maktoum',
    'lower basic 4',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1022,
    'muhammad sa\'idu',
    'lower basic 4',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1023,
    'shehu aishat aliyu',
    'lower basic 4',
    'shehu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1024,
    'usman garba khadijah jannah dankane',
    'lower basic 4',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1025,
    'abdullahi hussaini walid',
    'middle basic 5',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1026,
    'abdullahi umukaltum',
    'middle basic 5',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1027,
    'abraham damtong nashak',
    'middle basic 5',
    'abraham',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1028,
    'abubakar aliyu',
    'middle basic 5',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1029,
    'abubakar bello khaleed',
    'middle basic 5',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1030,
    'abubakar umar',
    'middle basic 5',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1031,
    'ahmad sabo hafsat',
    'middle basic 5',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1032,
    'ajawuihe emmanuel ebubechukwu',
    'middle basic 5',
    'ajawuihe',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1033,
    'aneke vera ogechi',
    'middle basic 5',
    'aneke',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1034,
    'anucha chris ugonna',
    'middle basic 5',
    'anucha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1035,
    'bakare aliyu onaolapo',
    'middle basic 5',
    'bakare',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1036,
    'barau safiya hayatu',
    'middle basic 5',
    'barau',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1037,
    'bashir salman suleiman',
    'middle basic 5',
    'bashir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1038,
    'bature jessica gado',
    'middle basic 5',
    'bature',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1039,
    'dahiru abbas zainab',
    'middle basic 5',
    'dahiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1040,
    'ejeh michelle chimazuru',
    'middle basic 5',
    'ejeh',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1041,
    'emenike chukwuebuka joshua',
    'middle basic 5',
    'emenike',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1042,
    'ibrahim khadijat abubakar',
    'middle basic 5',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1043,
    'ibrahim mahmud ajmal',
    'middle basic 5',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1044,
    'ifenwembi kanyirayochi jochebed',
    'middle basic 5',
    'ifenwembi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1045,
    'ishaq fatima batula',
    'middle basic 5',
    'ishaq',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1046,
    'jabila mamza david',
    'middle basic 5',
    'jabila',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1047,
    'james oluwanimilo lois',
    'middle basic 5',
    'james',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1048,
    'jego raphael peter',
    'middle basic 5',
    'jego',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1049,
    'lucky johnson abiola',
    'middle basic 5',
    'lucky',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1050,
    'madugu umar zainab',
    'middle basic 5',
    'madugu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1051,
    'mohammed amina abdulmalik',
    'middle basic 5',
    'mohammed',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1052,
    'moyi ahmed sadiya',
    'middle basic 5',
    'moyi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1053,
    'muhammad jabo samira',
    'middle basic 5',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1054,
    'muhammad yusuf maimunatu',
    'middle basic 5',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1055,
    'murtala maimuna ibrahim',
    'middle basic 5',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1056,
    'mustapha abudukadir bawa',
    'middle basic 5',
    'mustapha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1057,
    'nosike chibueze christian',
    'middle basic 5',
    'nosike',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1058,
    'nura umar bello',
    'middle basic 5',
    'nura',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1059,
    'philip ndubisi okorie',
    'middle basic 5',
    'philip',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1060,
    'remember evidence itsoghena',
    'middle basic 5',
    'remember',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1061,
    'saidu sanusi adnan',
    'middle basic 5',
    'saidu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1062,
    'sanusi umar khadijat',
    'middle basic 5',
    'sanusi',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1063,
    'sayyida murtala muhammad',
    'middle basic 5',
    'sayyida',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1064,
    'ubah chiagozie kelvin',
    'middle basic 5',
    'ubah',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1065,
    'umar ibrahim ibrahim',
    'middle basic 5',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1066,
    'usman muawiyya ramlat',
    'middle basic 5',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1067,
    'usman zubairu alamin',
    'middle basic 5',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1068,
    'abdullahi sadiq muhammad',
    'middle basic 5',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1069,
    'adamu umar umar',
    'middle basic 5',
    'adamu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1070,
    'adejumo samuel olayimika',
    'middle basic 5',
    'adejumo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1071,
    'adinnu chidiebube justine',
    'middle basic 5',
    'adinnu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1072,
    'ahmad haruna haruna',
    'middle basic 5',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1073,
    'ahmadu suleiman isiyaku',
    'middle basic 5',
    'ahmadu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1074,
    'akogwu victor ochenehi',
    'middle basic 5',
    'akogwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1075,
    'aminu ammar bashar',
    'middle basic 5',
    'aminu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1076,
    'amzat farida olamide',
    'middle basic 5',
    'amzat',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1077,
    'auwal mohammad zainab',
    'middle basic 5',
    'auwal',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1078,
    'barau yana nyampa',
    'middle basic 5',
    'barau',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1079,
    'bello abbas bello',
    'middle basic 5',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1080,
    'chibuzor chineameze daniel',
    'middle basic 5',
    'chibuzor',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1081,
    'david obidike chinemere samuel',
    'middle basic 5',
    'david',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1082,
    'diem salome zichat',
    'middle basic 5',
    'diem',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1083,
    'emenike fortune',
    'middle basic 5',
    'emenike',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1084,
    'godwin tabitha onyegocho',
    'middle basic 5',
    'godwin',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1085,
    'hamza nasir muhammad',
    'middle basic 5',
    'hamza',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1086,
    'hussaini mufida yabo',
    'middle basic 5',
    'hussaini',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1087,
    'husseini adama',
    'middle basic 5',
    'husseini',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1088,
    'ishak fatima',
    'middle basic 5',
    'ishak',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1089,
    'jego saidu stephen',
    'middle basic 5',
    'jego',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1090,
    'kalu princess chiagoziem',
    'middle basic 5',
    'kalu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1091,
    'mansur fatima maishanu',
    'middle basic 5',
    'mansur',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1092,
    'mbaemeka chizara emmanuella',
    'middle basic 5',
    'mbaemeka',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1093,
    'mohammed ibrahim saudat',
    'middle basic 5',
    'mohammed',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1094,
    'murtala isah amina',
    'middle basic 5',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1095,
    'nasir abubakar bafarawa',
    'middle basic 5',
    'nasir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1096,
    'oghenapheta testimony remember',
    'middle basic 5',
    'oghenapheta',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1097,
    'okpala williams chibuikem',
    'middle basic 5',
    'okpala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1098,
    'olusegun oluwasemilore elijah',
    'middle basic 5',
    'olusegun',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1099,
    'patrick victor oluwapelumi',
    'middle basic 5',
    'patrick',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1100,
    'peter emmanuel',
    'middle basic 5',
    'peter',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1101,
    'sadiq kasim ummuludah',
    'middle basic 5',
    'sadiq',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1102,
    'saidu asmau maishanu',
    'middle basic 5',
    'saidu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1103,
    'salman fatima gidado',
    'middle basic 5',
    'salman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1104,
    'shittu ahmad',
    'middle basic 5',
    'shittu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1105,
    'tukur ahmad yabo',
    'middle basic 5',
    'tukur',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1106,
    'umar saad faruk',
    'middle basic 5',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1107,
    'usman ahmad auwal',
    'middle basic 5',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1108,
    'yunusa yesmeen',
    'middle basic 5',
    'yunusa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1109,
    'yusuf aisha',
    'middle basic 5',
    'yusuf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1110,
    'abdullahi salman',
    'middle basic 5',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1111,
    'abdulsamad usman goronyo',
    'middle basic 5',
    'abdulsamad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1112,
    'abubakar idris ahmad',
    'middle basic 5',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1113,
    'abubakar sadiq abubakar',
    'middle basic 5',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1114,
    'abubakar sadiq ahmed',
    'middle basic 5',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1115,
    'adeosun stephen olasoji',
    'middle basic 5',
    'adeosun',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1116,
    'ahmad fatima jabo',
    'middle basic 5',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1117,
    'alkamawa rabiat kabir',
    'middle basic 5',
    'alkamawa',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1118,
    'barkindo suleiman ibrahim',
    'middle basic 5',
    'barkindo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1119,
    'bashir s/baki ahmad',
    'middle basic 5',
    'bashir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1120,
    'bello nabil muhammad',
    'middle basic 5',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1121,
    'bello tambuwal safiya',
    'middle basic 5',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1122,
    'dahiru maigandi yusuf',
    'middle basic 5',
    'dahiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1123,
    'daniel best nelson',
    'middle basic 5',
    'daniel',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1124,
    'elobi chidera michael',
    'middle basic 5',
    'elobi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1125,
    'eluwa chidalu marvellous',
    'middle basic 5',
    'eluwa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1126,
    'giwa similoluwa',
    'middle basic 5',
    'giwa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1127,
    'hussiani ahmad',
    'middle basic 5',
    'hussiani',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1128,
    'ibrahim abubakar muhammad',
    'middle basic 5',
    'ibrahim',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1129,
    'ibrahim hafsat kabir',
    'middle basic 5',
    'ibrahim',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1130,
    'ibrahim rabi\'atu auwal',
    'middle basic 5',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1131,
    'ishak aisha',
    'middle basic 5',
    'ishak',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1132,
    'kabiru aisha umar',
    'middle basic 5',
    'kabiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1133,
    'maigona mukthar fatima',
    'middle basic 5',
    'maigona',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1134,
    'malife faith chisom',
    'middle basic 5',
    'malife',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1135,
    'matthew michelle omotola',
    'middle basic 5',
    'matthew',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1136,
    'mukthar yunusa',
    'middle basic 5',
    'mukthar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1137,
    'nwafor michael ikechukwu',
    'middle basic 5',
    'nwafor',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1138,
    'nwankwo david somtochukwu',
    'middle basic 5',
    'nwankwo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1139,
    'okeke ekperebundu victory',
    'middle basic 5',
    'okeke',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1140,
    'sanusi ibrahim bunu',
    'middle basic 5',
    'sanusi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1141,
    'sarkintudu rukayya maiakwai',
    'middle basic 5',
    'sarkintudu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1142,
    'shuaibu al amin muhammad',
    'middle basic 5',
    'shuaibu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1143,
    'sirajo abdullahi muhammad',
    'middle basic 5',
    'sirajo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1144,
    'umar usman madugu',
    'middle basic 5',
    'umar',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1145,
    'wali juwairiyya bello',
    'middle basic 5',
    'wali',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1146,
    'abdulrazak abubakar yusuf',
    'upper basic 1',
    'abdulrazak',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1147,
    'abubakar abdulgafar ibrahim',
    'upper basic 1',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1148,
    'abubakar isah panti',
    'upper basic 1',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1149,
    'adeniyi divine gift toluwanimi',
    'upper basic 1',
    'adeniyi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1150,
    'adinnu chimamanda victoria',
    'upper basic 1',
    'adinnu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1151,
    'ahmad aisha',
    'upper basic 1',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1152,
    'ahmad muhammad kolawole',
    'upper basic 1',
    'ahmad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1153,
    'al amin fatima muhammad',
    'upper basic 1',
    'al',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1154,
    'aliyu usman gandi',
    'upper basic 1',
    'aliyu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1155,
    'bashir muhammad hadiza',
    'upper basic 1',
    'bashir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1156,
    'bello maryam shehu',
    'upper basic 1',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1157,
    'bulus peter gwimi',
    'upper basic 1',
    'bulus',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1158,
    'burodo abdallah ahmad',
    'upper basic 1',
    'burodo',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1159,
    'ekeh gabriel chibuike',
    'upper basic 1',
    'ekeh',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1160,
    'faruk fatima',
    'upper basic 1',
    'faruk',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1161,
    'hafeez hamza gatawa',
    'upper basic 1',
    'hafeez',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1162,
    'husseni jemimah',
    'upper basic 1',
    'husseni',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1163,
    'ibrahim humeirah abubakar',
    'upper basic 1',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1164,
    'ibrahim suka abdullahi',
    'upper basic 1',
    'ibrahim',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1165,
    'inuwa mustapha abdulqadir',
    'upper basic 1',
    'inuwa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1166,
    'ishiaku ibrahim fatima',
    'upper basic 1',
    'ishiaku',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1167,
    'ismail fatima bafarawa',
    'upper basic 1',
    'ismail',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1168,
    'ismail hauwau abdulqadir',
    'upper basic 1',
    'ismail',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1169,
    'lawal abubakar fatima',
    'upper basic 1',
    'lawal',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1170,
    'muhammad maryam zayyanu',
    'upper basic 1',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1171,
    'muhammed abbas mukthar',
    'upper basic 1',
    'muhammed',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1172,
    'murtala aisha faruk',
    'upper basic 1',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1173,
    'musa aliyu yerima',
    'upper basic 1',
    'musa',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1174,
    'nafiu maimunah',
    'upper basic 1',
    'nafiu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1175,
    'nkwoka chimereze gabriel',
    'upper basic 1',
    'nkwoka',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1176,
    'oduwole oluwamuyinwa oluwasemilore',
    'upper basic 1',
    'oduwole',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1177,
    'olukoju oluwaseun favour',
    'upper basic 1',
    'olukoju',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1178,
    'omotosho grace oluwatunmishe',
    'upper basic 1',
    'omotosho',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1179,
    'onuama kamsiyochukwu kelvin',
    'upper basic 1',
    'onuama',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1180,
    'osori saadat',
    'upper basic 1',
    'osori',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1181,
    'owoamanaam kamsiyochukwu erica',
    'upper basic 1',
    'owoamanaam',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1182,
    'suleiman hamida almustapha',
    'upper basic 1',
    'suleiman',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1183,
    'uzoma chidera favour',
    'upper basic 1',
    'uzoma',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1184,
    'zubairu muhammad sanusi',
    'upper basic 1',
    'zubairu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1185,
    'abdulgafar abdullahi',
    'upper basic 1',
    'abdulgafar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1186,
    'abdumalik mufidah taiwo',
    'upper basic 1',
    'abdumalik',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1187,
    'abubakar usman gumbi',
    'upper basic 1',
    'abubakar gumbi',
    'fhnaciih3rqfhnaciih3rq1q9j368q4tq41q9j368q4tq4',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-08 12:49:51'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1188,
    'abubakar zainab ahmad',
    'upper basic 1',
    'abubakar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1189,
    'adinnu marvelous ifeatuchukwu',
    'upper basic 1',
    'adinnu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1190,
    'al amin ismail',
    'upper basic 1',
    'al',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1191,
    'anthony eneojo israel',
    'upper basic 1',
    'anthony',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1192,
    'audu benella ene ojone',
    'upper basic 1',
    'audu',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1193,
    'bashar aisha muhammad',
    'upper basic 1',
    'bashar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1194,
    'bello asmau umar',
    'upper basic 1',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1195,
    'chiabua bernice',
    'upper basic 1',
    'chiabua',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1196,
    'chinedu ifeagwu praise',
    'upper basic 1',
    'chinedu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1197,
    'dankani khalil labaran',
    'upper basic 1',
    'dankani',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1198,
    'faruk hauwa',
    'upper basic 1',
    'faruk',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1199,
    'kabiru khadijat umar',
    'upper basic 1',
    'kabiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1200,
    'kakira abubakar nura',
    'upper basic 1',
    'kakira',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1201,
    'kalu angel ezinne',
    'upper basic 1',
    'kalu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1202,
    'khalid aisha abdullahi',
    'upper basic 1',
    'khalid',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1203,
    'milkail sanchi safiya',
    'upper basic 1',
    'milkail',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1204,
    'muhammad abdulrahman kamba',
    'upper basic 1',
    'muhammad',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1205,
    'murtala abdurahman wakili',
    'upper basic 1',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1206,
    'murtala ikram dogondaji',
    'upper basic 1',
    'murtala',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1207,
    'nurudeen mahir',
    'upper basic 1',
    'nurudeen',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1208,
    'oduwole oluwamayowa oluwaferanmi',
    'upper basic 1',
    'oduwole',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1209,
    'ogbe goodluck chidiebele',
    'upper basic 1',
    'ogbe',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1210,
    'okechukwu michelle',
    'upper basic 1',
    'okechukwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1211,
    'okolie desmond chikamso',
    'upper basic 1',
    'okolie',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1212,
    's/kabbi hauwa sani',
    'upper basic 1',
    's/kabbi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1213,
    'shehu umar suleiman',
    'upper basic 1',
    'shehu',
    '24qtm2317j6o24qtm2317j6o8lfde1chlt38lfde1chlt3',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 15:03:24'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1214,
    'suraj abubakar',
    'upper basic 1',
    'suraj',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1215,
    'umar abba salah',
    'upper basic 1',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1216,
    'uzong awesome runyi patrick',
    'upper basic 1',
    'uzong',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1217,
    'vincent daniel ayomide',
    'upper basic 1',
    'vincent',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1218,
    'yusuf abubakar adamu',
    'upper basic 1',
    'yusuf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1219,
    'yusuf hashimu hashimu',
    'upper basic 1',
    'yusuf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1220,
    'yusuf usman',
    'upper basic 1',
    'yusuf',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1221,
    'abdallah ayman',
    'upper basic 1',
    'abdallah',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1222,
    'abdullahi suleiman',
    'upper basic 1',
    'abdullahi',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1223,
    'abdulrasheed rashida hassan',
    'upper basic 1',
    'abdulrasheed',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1224,
    'abubakar maryam gumbi',
    'upper basic 1',
    'abubakar gumbi',
    'fhnaciih3rqfhnaciih3rq1q9j368q4tq41q9j368q4tq4',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-08 12:49:51'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1225,
    'adesayo blessed',
    'upper basic 1',
    'adesayo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1226,
    'auwal hafsah muhammad',
    'upper basic 1',
    'auwal',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1227,
    'bashir s baki aisha',
    'upper basic 1',
    'bashir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1228,
    'bello abdullahi abbas',
    'upper basic 1',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1229,
    'bello abdulmalik bala',
    'upper basic 1',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1230,
    'bello gada rukayya',
    'upper basic 1',
    'bello gada',
    '16ig5nb1shgk16ig5nb1shgkgff2ltgkdocgff2ltgkdoc',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 15:11:46'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1231,
    'bello samaila riskuwa',
    'upper basic 1',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1232,
    'bello usman bawa',
    'upper basic 1',
    'bello',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1233,
    'chika abubakar fatima',
    'upper basic 1',
    'chika',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1234,
    'dada divine opemipo',
    'upper basic 1',
    'dada',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1235,
    'dahiru amina abbas',
    'upper basic 1',
    'dahiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1236,
    'dahiru nabil moyi',
    'upper basic 1',
    'dahiru',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1237,
    'egbochue nmesoma sylvia',
    'upper basic 1',
    'egbochue',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1238,
    'emenike amarachi success',
    'upper basic 1',
    'emenike',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1239,
    'eni chinedu kelvin',
    'upper basic 1',
    'eni',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1240,
    'farouk alkali aisha',
    'upper basic 1',
    'farouk',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1241,
    'hussaini ibrahim',
    'upper basic 1',
    'hussaini',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1242,
    'idris ismail gobir',
    'upper basic 1',
    'idris',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1243,
    'ishak nabila',
    'upper basic 1',
    'ishak',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1244,
    'jibril adamu muhammad',
    'upper basic 1',
    'jibril',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1245,
    'khadijat m\'jodi kabiru',
    'upper basic 1',
    'khadijat',
    '',
    '',
    '',
    '',
    'scholarship',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1246,
    'maduka godswill kamsi',
    'upper basic 1',
    'maduka',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1247,
    'malami abba muhammad',
    'upper basic 1',
    'malami',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1248,
    'mustapha maigona ibrahim',
    'upper basic 1',
    'mustapha',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1249,
    'nasir hauwau babata',
    'upper basic 1',
    'nasir',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1250,
    'nwangwu ikenna david',
    'upper basic 1',
    'nwangwu',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1251,
    'okparah a. mcvictor praise',
    'upper basic 1',
    'okparah',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1252,
    'sulaiman abubakar sadiq',
    'upper basic 1',
    'sulaiman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1253,
    'suleiman muhammad shehu',
    'upper basic 1',
    'suleiman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1254,
    'surajo maryam siyama',
    'upper basic 1',
    'surajo',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1255,
    'umar usman muhammad',
    'upper basic 1',
    'umar',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1256,
    'usman garba jega abdulrahim',
    'upper basic 1',
    'usman',
    '',
    '',
    '',
    '',
    'none',
    'active',
    '2023-08-07 14:48:19'
  );
INSERT INTO
  `global_kids_academy_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1257,
    'jehoshaphat adediran',
    'upper basic 1',
    'adediran',
    '',
    '',
    '',
    '',
    '',
    'active',
    '2023-08-08 14:33:20'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_users
# ------------------------------------------------------------

INSERT INTO
  `global_kids_academy_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    1,
    'global kids academy',
    'admin',
    'admin',
    '',
    1,
    '2023-08-04 04:53:48'
  );
INSERT INTO
  `global_kids_academy_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    2,
    'global kids academy',
    'tee',
    'tee',
    '',
    1,
    '2023-08-07 15:35:41'
  );
INSERT INTO
  `global_kids_academy_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    3,
    'global kids academy',
    'tobi',
    'tobi',
    '',
    1,
    '2023-08-08 14:37:43'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: global_kids_academy_wallets
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: oakcrest_international_college_expenses
# ------------------------------------------------------------

INSERT INTO
  `oakcrest_international_college_expenses` (
    `id`,
    `amount`,
    `wallet`,
    `description`,
    `accountant`,
    `amount_before`,
    `amount_after`,
    `created_at`
  )
VALUES
  (
    1,
    '50000',
    'current',
    'staff upkeep',
    'admin',
    '215000',
    '165000',
    '2023-08-03 10:21:19'
  );
INSERT INTO
  `oakcrest_international_college_expenses` (
    `id`,
    `amount`,
    `wallet`,
    `description`,
    `accountant`,
    `amount_before`,
    `amount_after`,
    `created_at`
  )
VALUES
  (
    2,
    '100000',
    'current',
    'additional expenses for bus incured',
    'admin',
    '165000',
    '65000',
    '2023-08-03 10:51:24'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: oakcrest_international_college_notifications
# ------------------------------------------------------------

INSERT INTO
  `oakcrest_international_college_notifications` (
    `id`,
    `title`,
    `text`,
    `payment_id`,
    `status`,
    `created_at`
  )
VALUES
  (
    1,
    'Balance date expired.',
    'The balance date of abigail titus expired 9 hours ago',
    'ithdd4mm472ithdd4mm472b2t9p7il0hqb2t9p7il0hq',
    '1',
    '2023-08-07 13:35:54'
  );
INSERT INTO
  `oakcrest_international_college_notifications` (
    `id`,
    `title`,
    `text`,
    `payment_id`,
    `status`,
    `created_at`
  )
VALUES
  (
    2,
    'balance date expired',
    'the balance of whoever expired. figure it out',
    'ffffffdfff',
    '1',
    '2023-08-07 13:35:54'
  );
INSERT INTO
  `oakcrest_international_college_notifications` (
    `id`,
    `title`,
    `text`,
    `payment_id`,
    `status`,
    `created_at`
  )
VALUES
  (
    3,
    'balance date expired.',
    'the balance date of amarachi ezeonye expired yesterday',
    'afn470i5j84afn470i5j847s8ta1l4t6b7s8ta1l4t6b',
    '1',
    '2023-08-07 13:35:54'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: oakcrest_international_college_payment_record
# ------------------------------------------------------------

INSERT INTO
  `oakcrest_international_college_payment_record` (
    `id`,
    `name`,
    `payment_id`,
    `amount_paid`,
    `PTA`,
    `lesson`,
    `tuition`,
    `expected_payment`,
    `balance`,
    `term`,
    `session`,
    `DOG`,
    `DOP`,
    `balance_date`,
    `remark`,
    `class`,
    `keyid`,
    `payment_for`,
    `payment_method`,
    `accountant`,
    `wallet`,
    `created_at`
  )
VALUES
  (
    8,
    'amarachi ezeonye',
    '79695',
    '30000',
    1000,
    0,
    29000,
    '75000',
    '45000',
    '3rd term',
    '2021/2022',
    '2023/08/05',
    '2023/08/05',
    '2023/08/06',
    'part payment made for 3rd term, through zenith bank transfer (2021/2022) ',
    'jss 2',
    'afn470i5j84afn470i5j847s8ta1l4t6b7s8ta1l4t6b',
    'fees part payment (no lesson)',
    'zenith bank transfer',
    'admin',
    'current',
    '2023-08-05 11:36:00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: oakcrest_international_college_settings
# ------------------------------------------------------------

INSERT INTO
  `oakcrest_international_college_settings` (
    `id`,
    `classes`,
    `current_session`,
    `sessions`,
    `current_term`,
    `terms`,
    `fees`,
    `payment_method`,
    `payment_for`,
    `themes`,
    `wallets`,
    `default_wallets`,
    `backup_date`,
    `fee_history`,
    `session_history`,
    `term_history`,
    `created_at`
  )
VALUES
  (
    1,
    '[\"jss 2\",\"jss 3\",\"alder\",\"jss 1\",\"sss 1\",\"gorse\",\"fir\",\"aspen\",\"birch\",\"willow\",\"sss 3 (arts)\",\"vine\",\"hazel\",\"rowan\",\"sss 2 (science)\",\"select class\",\"sss 2 (arts)\",\"class\",\"sss 3 (science)\"]',
    '2021/2022',
    '2019/2020,2020/2021,2021/2022,2022/2023',
    '3rd term',
    '1st term,2nd term,3rd term',
    '[[\"waec\",\"10000\"],[\"bece\",\"10000\"],[\"school uniform\",\"5000\"],[\"jss 2\",75000],[\"jss 2 lesson\",4000],[\"jss 2 pta\",1000],[\"jss 3\",0],[\"jss 3 lesson\",0],[\"jss 3 pta\",0],[\"alder\",0],[\"alder lesson\",0],[\"alder pta\",0],[\"jss 1\",0],[\"jss 1 lesson\",0],[\"jss 1 pta\",0],[\"sss 1\",0],[\"sss 1 lesson\",0],[\"sss 1 pta\",0],[\"gorse\",0],[\"gorse lesson\",0],[\"gorse pta\",0],[\"fir\",0],[\"fir lesson\",0],[\"fir pta\",0],[\"aspen\",0],[\"aspen lesson\",0],[\"aspen pta\",0],[\"birch\",0],[\"birch lesson\",0],[\"birch pta\",0],[\"willow\",0],[\"willow lesson\",0],[\"willow pta\",0],[\"sss 3 (arts)\",0],[\"sss 3 (arts) lesson\",0],[\"sss 3 (arts) pta\",0],[\"vine\",0],[\"vine lesson\",0],[\"vine pta\",0],[\"hazel\",0],[\"hazel lesson\",0],[\"hazel pta\",0],[\"rowan\",0],[\"rowan lesson\",0],[\"rowan pta\",0],[\"sss 2 (science)\",0],[\"sss 2 (science) lesson\",0],[\"sss 2 (science) pta\",0],[\"select class\",0],[\"select class lesson\",0],[\"select class pta\",0],[\"sss 2 (arts)\",0],[\"sss 2 (arts) lesson\",0],[\"sss 2 (arts) pta\",0],[\"class\",0],[\"class lesson\",0],[\"class pta\",0],[\"sss 3 (science)\",0],[\"sss 3 (science) lesson\",0],[\"sss 3 (science) pta\",0]]',
    'zenith bank transfer,uba bank transfer',
    'fees,fees ~ pta and lesson,fees and pta (no lesson),fees part payment,fees part payment (no lesson),fees balance payment,others,busfare,pta,waec,neco',
    '[[\"text\",\"#ffffff\"],[\"foreGround\",\"#jfjfjf\"],[\"background\",\"#jfjfjf\"],[\"font\",\"Arial\"]]',
    '[[\"current\",155000]]',
    'current',
    '',
    '',
    '',
    '',
    '2023-08-05 11:36:00'
  );
INSERT INTO
  `oakcrest_international_college_settings` (
    `id`,
    `classes`,
    `current_session`,
    `sessions`,
    `current_term`,
    `terms`,
    `fees`,
    `payment_method`,
    `payment_for`,
    `themes`,
    `wallets`,
    `default_wallets`,
    `backup_date`,
    `fee_history`,
    `session_history`,
    `term_history`,
    `created_at`
  )
VALUES
  (
    2,
    NULL,
    '',
    '',
    '',
    '',
    NULL,
    '',
    '',
    '',
    '',
    '',
    '',
    '[[\"waec\",\"10000\"],[\"bece\",\"10000\"],[\"school uniform\",\"5000\"],[\"jss 2\",75000],[\"jss 2 lesson\",4000],[\"jss 2 pta\",1000],[\"jss 3\",0],[\"jss 3 lesson\",0],[\"jss 3 pta\",0],[\"alder\",0],[\"alder lesson\",0],[\"alder pta\",0],[\"jss 1\",0],[\"jss 1 lesson\",0],[\"jss 1 pta\",0],[\"sss 1\",0],[\"sss 1 lesson\",0],[\"sss 1 pta\",0],[\"gorse\",0],[\"gorse lesson\",0],[\"gorse pta\",0],[\"fir\",0],[\"fir lesson\",0],[\"fir pta\",0],[\"aspen\",0],[\"aspen lesson\",0],[\"aspen pta\",0],[\"birch\",0],[\"birch lesson\",0],[\"birch pta\",0],[\"willow\",0],[\"willow lesson\",0],[\"willow pta\",0],[\"sss 3 (arts)\",0],[\"sss 3 (arts) lesson\",0],[\"sss 3 (arts) pta\",0],[\"vine\",0],[\"vine lesson\",0],[\"vine pta\",0],[\"hazel\",0],[\"hazel lesson\",0],[\"hazel pta\",0],[\"rowan\",0],[\"rowan lesson\",0],[\"rowan pta\",0],[\"sss 2 (science)\",0],[\"sss 2 (science) lesson\",0],[\"sss 2 (science) pta\",0],[\"select class\",0],[\"select class lesson\",0],[\"select class pta\",0],[\"sss 2 (arts)\",0],[\"sss 2 (arts) lesson\",0],[\"sss 2 (arts) pta\",0],[\"class\",0],[\"class lesson\",0],[\"class pta\",0],[\"sss 3 (science)\",0],[\"sss 3 (science) lesson\",0],[\"sss 3 (science) pta\",0]]',
    '2021/2022',
    '3rd term',
    '2023-08-07 13:10:38'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: oakcrest_international_college_students
# ------------------------------------------------------------

INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    1,
    'abigail titus',
    'jss 2',
    'titus',
    'hs2f9op0lekhs2f9op0lek19e0thqpott19e0thqpott',
    'oak1',
    '09078785538',
    '',
    'none',
    'active',
    '2023-08-05 10:54:38'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    3,
    'adrielle marcus',
    'alder',
    'marcus',
    '',
    'oak3',
    '',
    '',
    'none',
    'left',
    '2023-08-05 10:26:39'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    5,
    'aimahlohi ehimika',
    'jss 2',
    'ehimika',
    '',
    'oak5',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    6,
    'aka lawrence',
    'sss 1',
    'lawrence',
    '',
    'oak6',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    13,
    'amanda chukwuma',
    'gorse',
    'chukwuma',
    'tjc3qa11gh2tjc3qa11gh284hc4f7j7r884hc4f7j7r8',
    'oak13',
    '',
    '',
    'none',
    'active',
    '2023-08-05 10:29:42'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    14,
    'amarachi ezeonye',
    'jss 2',
    'ezeonye',
    '',
    'oak14',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    15,
    'amarachi ugwuja',
    'fir',
    'ugwuja',
    '',
    'oak15',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    16,
    'anayo sonia',
    'sss 1',
    'sonia',
    '',
    'oak16',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    17,
    'anderson gabriel',
    'alder',
    'gabriel',
    '',
    'oak17',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    18,
    'angel nwabugo',
    'aspen',
    'nwabugo',
    '',
    'oak18',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    19,
    'angelita jumbo-koripam',
    'jss 3',
    'jumbo-koripam',
    '',
    'oak19',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    20,
    'anita obinna',
    'birch',
    'obinna',
    '',
    'oak20',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    21,
    'ann wachukwu',
    'jss 3',
    'wachukwu',
    '',
    'oak21',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    22,
    'annabel humphery',
    'gorse',
    'humphery',
    '',
    'oak22',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    23,
    'annabel uzoegbu',
    'willow',
    'uzoegbu',
    '',
    'oak23',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    24,
    'annabel worga',
    'sss 1',
    'worga',
    '',
    'oak24',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    25,
    'annabel worga',
    'sss 3 (arts)',
    'worga',
    '',
    'oak25',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    26,
    'anulue-emenike chinonyerem',
    'jss 1',
    'chinonyerem',
    '',
    'oak26',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    27,
    'apollos . a.  princewill',
    'jss 3',
    'princewill',
    '',
    'oak27',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    28,
    'assumpta amarachukwu',
    'alder',
    'amarachukwu',
    '',
    'oak28',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    29,
    'audu edo-ojo',
    'vine',
    'edo-ojo',
    '',
    'oak29',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    30,
    'augustine praise',
    'jss 1',
    'praise',
    '',
    'oak30',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    31,
    'austin amanda',
    'alder',
    'amanda',
    '',
    'oak31',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    32,
    'austin israel',
    'gorse',
    'israel',
    '',
    'oak32',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    33,
    'austine ezennia',
    'jss 2',
    'ezennia',
    '',
    'oak33',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    34,
    'avah ezeugo',
    'alder',
    'ezeugo',
    '',
    'oak34',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    35,
    'avubuike emmanuel',
    'hazel',
    'emmanuel',
    '',
    'oak35',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    36,
    'avubuike gideon',
    'alder',
    'gideon',
    '',
    'oak36',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    37,
    'awesome zuaka',
    'gorse',
    'zuaka',
    '',
    'oak37',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    38,
    'bayo ajasin',
    'jss 2',
    'ajasin',
    '',
    'oak38',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    39,
    'benjamin john',
    'fir',
    'john',
    '',
    'oak39',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    40,
    'benson bryan',
    'alder',
    'bryan',
    '',
    'oak40',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    41,
    'benson bryan',
    'alder',
    'bryan',
    '',
    'oak41',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    42,
    'bernice camillus',
    'fir',
    'camillus',
    '',
    'oak42',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    43,
    'bethel ledum',
    'alder',
    'ledum',
    '',
    'oak43',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    44,
    'bless chigba',
    'hazel',
    'chigba',
    '',
    'oak44',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    45,
    'blessed ordu',
    'willow',
    'ordu',
    '',
    'oak45',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    46,
    'bliss ordu-okwu',
    'rowan',
    'ordu-okwu',
    '',
    'oak46',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    47,
    'blossom asomba',
    'birch',
    'asomba',
    '',
    'oak47',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    48,
    'brave egba',
    'vine',
    'egba',
    '',
    'oak48',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    49,
    'brenda chidim',
    'vine',
    'chidim',
    '',
    'oak49',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    50,
    'brendan john',
    'gorse',
    'john',
    '',
    'oak50',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    51,
    'bryan whyte',
    'vine',
    'whyte',
    '',
    'oak51',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    52,
    'caleb igwe',
    'alder',
    'igwe',
    '',
    'oak52',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    53,
    'carthage ofa',
    'gorse',
    'ofa',
    '',
    'oak53',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    54,
    'cassidy waliogba',
    'willow',
    'waliogba',
    '',
    'oak54',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    55,
    'cherish sunday',
    'vine',
    'sunday',
    '',
    'oak55',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    56,
    'chiamanda chukwuma',
    'jss 2',
    'chukwuma',
    'tjc3qa11gh2tjc3qa11gh284hc4f7j7r884hc4f7j7r8',
    'oak56',
    '',
    '',
    'none',
    'active',
    '2023-08-05 10:29:42'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    57,
    'chibukem harrison',
    'alder',
    'harrison',
    '',
    'oak57',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    58,
    'chiburuma chukwu',
    'rowan',
    'chukwu',
    '',
    'oak58',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    59,
    'chibuzor daniel',
    'alder',
    'daniel',
    '',
    'oak59',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    60,
    'chibuzor nice',
    'vine',
    'nice',
    '',
    'oak60',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    61,
    'chidera augustine',
    'sss 2 (science)',
    'augustine',
    '',
    'oak61',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    62,
    'chidera eugene',
    'jss 3',
    'eugene',
    '',
    'oak62',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    63,
    'chidera ezeugo',
    'birch',
    'ezeugo',
    '',
    'oak63',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    64,
    'chidera tony-onyebuchi',
    'sss 2 (science)',
    'tony-onyebuchi',
    '',
    'oak64',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    65,
    'chidiebere obinna',
    'aspen',
    'obinna',
    '',
    'oak65',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    66,
    'chidiebube izuchukwu',
    'gorse',
    'izuchukwu',
    '',
    'oak66',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    67,
    'chidinma ejiogu',
    'sss 1',
    'ejiogu',
    '',
    'oak67',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    68,
    'chidiwoko splendid',
    'jss 1',
    'splendid',
    '',
    'oak68',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    69,
    'chidubem tony-onyebuchi',
    'birch',
    'tony-onyebuchi',
    '',
    'oak69',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    70,
    'chidubem tony-onyebuchi',
    'gorse',
    'tony-onyebuchi',
    '',
    'oak70',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    71,
    'chidugam ikenga',
    'gorse',
    'ikenga',
    '',
    'oak71',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    72,
    'chiedozie chloe',
    'jss 1',
    'chloe',
    '',
    'oak72',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    73,
    'chiemerie nwaigbo',
    'rowan',
    'nwaigbo',
    '',
    'oak73',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    74,
    'chikodeli melody',
    'jss 2',
    'melody',
    '',
    'oak74',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    75,
    'chikodi dominion',
    'alder',
    'dominion',
    '',
    'oak75',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    76,
    'chimamamda austine',
    'birch',
    'austine',
    '',
    'oak76',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    77,
    'chimamanda chukwuma',
    'rowan',
    'chukwuma',
    'tjc3qa11gh2tjc3qa11gh284hc4f7j7r884hc4f7j7r8',
    'oak77',
    '',
    '',
    'none',
    'active',
    '2023-08-05 10:29:42'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    78,
    'chimamanda shittu',
    'birch',
    'shittu',
    '',
    'oak78',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    79,
    'chimamma chika',
    'birch',
    'chika',
    '',
    'oak79',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    80,
    'chimaobi chididim',
    'hazel',
    'chididim',
    '',
    'oak80',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    81,
    'chimburoma chuku',
    'willow',
    'chuku',
    '',
    'oak81',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    82,
    'chimdiomimi ugwuja',
    'aspen',
    'ugwuja',
    '',
    'oak82',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    83,
    'chimehoma ikenga',
    'hazel',
    'ikenga',
    '',
    'oak83',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    84,
    'chimeka chidi-woko',
    'birch',
    'chidi-woko',
    '',
    'oak84',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    85,
    'chimeka david',
    'birch',
    'david',
    '',
    'oak85',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    86,
    'chimemeze ikenga',
    'alder',
    'ikenga',
    '',
    'oak86',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    87,
    'chimmerumeze ama-amos',
    'jss 1',
    'ama-amos',
    '',
    'oak87',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    88,
    'chimmerumeze ama-amos',
    'rowan',
    'ama-amos',
    '',
    'oak88',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    89,
    'chimmuanya ihearindieme',
    'gorse',
    'ihearindieme',
    '',
    'oak89',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    90,
    'chimobi samuel',
    'aspen',
    'samuel',
    '',
    'oak90',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    91,
    'chimobi samuel',
    'aspen',
    'samuel',
    '',
    'oak91',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    92,
    'chimudi anulere',
    'willow',
    'anulere',
    '',
    'oak92',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    93,
    'chimzibudu ama-amos',
    'sss 1',
    'ama-amos',
    '',
    'oak93',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    94,
    'chinagorom chizebube',
    'alder',
    'chizebube',
    '',
    'oak94',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    95,
    'chinazor chukwuma',
    'rowan',
    'chukwuma',
    'tjc3qa11gh2tjc3qa11gh284hc4f7j7r884hc4f7j7r8',
    'oak95',
    '',
    '',
    'none',
    'active',
    '2023-08-05 10:29:42'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    96,
    'chinemerm izuchukwu',
    'alder',
    'izuchukwu',
    '',
    'oak96',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    97,
    'chineye eugene',
    'willow',
    'eugene',
    '',
    'oak97',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    98,
    'chineye tony-onyebuchi',
    'rowan',
    'tony-onyebuchi',
    '',
    'oak98',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    99,
    'chinonso nwabugo',
    'hazel',
    'nwabugo',
    '',
    'oak99',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    100,
    'chinonyerem nnamdi-okeke',
    'fir',
    'nnamdi-okeke',
    '',
    'oak100',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    101,
    'chioma obinna',
    'alder',
    'obinna',
    '',
    'oak101',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    102,
    'chisa amadi',
    'jss 1',
    'amadi',
    '',
    'oak102',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    103,
    'chisa sophia',
    'sss 1',
    'sophia',
    '',
    'oak103',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    104,
    'chisimdi anulue',
    'aspen',
    'anulue',
    '',
    'oak104',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    105,
    'chisom chinwuko',
    'jss 1',
    'chinwuko',
    '',
    'oak105',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    106,
    'chisom nwaigbo',
    'jss 3',
    'nwaigbo',
    '',
    'oak106',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    107,
    'chisom obiako',
    'rowan',
    'obiako',
    '',
    'oak107',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    108,
    'chizara rhema',
    'fir',
    'rhema',
    '',
    'oak108',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    109,
    'chizaram mbata',
    'fir',
    'mbata',
    '',
    'oak109',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    110,
    'chizi ofor',
    'jss 1',
    'ofor',
    '',
    'oak110',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    111,
    'chizia amesi',
    'alder',
    'amesi',
    '',
    'oak111',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    112,
    'chloe chiedozie',
    'rowan',
    'chiedozie',
    '',
    'oak112',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    113,
    'christabel chidozie',
    'jss 1',
    'chidozie',
    '',
    'oak113',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    114,
    'christabel chiedozie',
    'vine',
    'chiedozie',
    '',
    'oak114',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    115,
    'christabel waliogba',
    'aspen',
    'waliogba',
    '',
    'oak115',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    116,
    'christain noble',
    'hazel',
    'noble',
    '',
    'oak116',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    117,
    'chuku emmanuel',
    'jss 2',
    'emmanuel',
    '',
    'oak117',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    118,
    'chukulaka ordu-okwu',
    'birch',
    'ordu-okwu',
    '',
    'oak118',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    119,
    'chukwuamanda chukwuma',
    'jss 1',
    'chukwuma',
    'tjc3qa11gh2tjc3qa11gh284hc4f7j7r884hc4f7j7r8',
    'oak119',
    '',
    '',
    'none',
    'active',
    '2023-08-05 10:29:42'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    120,
    'chukwuebuka kenneth-mbarie',
    'vine',
    'kenneth-mbarie',
    '',
    'oak120',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    121,
    'chukwuebuka okafor',
    'alder',
    'okafor',
    '',
    'oak121',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    122,
    'chukwuemeka mirabele',
    'sss 1',
    'mirabele',
    '',
    'oak122',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    123,
    'claire ibe',
    'jss 2',
    'ibe',
    '',
    'oak123',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    124,
    'cole michelle',
    'gorse',
    'michelle',
    '',
    'oak124',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    125,
    'courage gabriel',
    'gorse',
    'gabriel',
    '',
    'oak125',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    126,
    'courage ordu-okwu',
    'aspen',
    'ordu-okwu',
    '',
    'oak126',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    127,
    'crown amadi',
    'aspen',
    'amadi',
    '',
    'oak127',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    128,
    'damilola ibisode',
    'jss 2',
    'ibisode',
    '',
    'oak128',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    129,
    'daniel ajie',
    'vine',
    'ajie',
    '',
    'oak129',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    130,
    'daniel be-okere',
    'jss 2',
    'be-okere',
    '',
    'oak130',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    131,
    'daniel emem',
    'fir',
    'emem',
    '',
    'oak131',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    132,
    'daniel ichenwo',
    'sss 2 (science)',
    'ichenwo',
    '',
    'oak132',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    133,
    'daniel iheanacho',
    'hazel',
    'iheanacho',
    '',
    'oak133',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    134,
    'daniel ofor',
    'birch',
    'ofor',
    '',
    'oak134',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    135,
    'daniel ofor',
    'birch',
    'ofor',
    '',
    'oak135',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    136,
    'daniel uzokwe',
    'alder',
    'uzokwe',
    '',
    'oak136',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    137,
    'daniella anosike',
    'birch',
    'anosike',
    '',
    'oak137',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    138,
    'daniella solomon',
    'birch',
    'solomon',
    '',
    'oak138',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    139,
    'daniella zino',
    'aspen',
    'zino',
    '',
    'oak139',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    140,
    'danielle kenebi',
    'hazel',
    'kenebi',
    '',
    'oak140',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    141,
    'danielsolomon',
    'vine',
    'solomon',
    '',
    'oak141',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    142,
    'daramola emmanuel',
    'jss 1',
    'emmanuel',
    '',
    'oak142',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    143,
    'darasimi shittu',
    'aspen',
    'shittu',
    '',
    'oak143',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    144,
    'darren peters',
    'jss 1',
    'peters',
    '',
    'oak144',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    145,
    'david be-okere',
    'jss 1',
    'be-okere',
    '',
    'oak145',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    146,
    'david chibuzor',
    'jss 1',
    'chibuzor',
    '',
    'oak146',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    147,
    'david chiedozie',
    'birch',
    'chiedozie',
    '',
    'oak147',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    148,
    'david ewelike',
    'alder',
    'ewelike',
    '',
    'oak148',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    149,
    'david idehenre',
    'birch',
    'idehenre',
    '',
    'oak149',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    150,
    'david isaac',
    'alder',
    'isaac',
    '',
    'oak150',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    151,
    'david izuka',
    'birch',
    'izuka',
    '',
    'oak151',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    152,
    'david koko',
    'gorse',
    'koko',
    '',
    'oak152',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    153,
    'david mbagwu',
    'alder',
    'mbagwu',
    '',
    'oak153',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    154,
    'david okereke',
    'hazel',
    'okereke',
    '',
    'oak154',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    155,
    'david titus',
    'sss 2 (science)',
    'titus',
    'hs2f9op0lekhs2f9op0lek19e0thqpott19e0thqpott',
    'oak155',
    '09078785538',
    '',
    'none',
    'active',
    '2023-08-05 10:54:38'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    156,
    'davidson uchechukwu',
    'sss 2 (science)',
    'uchechukwu',
    '',
    'oak156',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    157,
    'deborah be-okere',
    'birch',
    'be-okere',
    '',
    'oak157',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    158,
    'deborah ichenwo',
    'jss 2',
    'ichenwo',
    '',
    'oak158',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    159,
    'deborah wolugbom',
    'jss 2',
    'wolugbom',
    '',
    'oak159',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    160,
    'delight anyawu',
    'sss 1',
    'anyawu',
    '',
    'oak160',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    161,
    'delight oti',
    'alder',
    'oti',
    '',
    'oak161',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    162,
    'denzyl ibe',
    'sss 1',
    'ibe',
    '',
    'oak162',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    163,
    'desire anyanwa',
    'aspen',
    'anyanwa',
    '',
    'oak163',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    164,
    'destiny abraham',
    'hazel',
    'abraham',
    '',
    'oak164',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    165,
    'destiny joseph',
    'vine',
    'joseph',
    '',
    'oak165',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    166,
    'dillion ugwueze',
    'rowan',
    'ugwueze',
    '',
    'oak166',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    167,
    'dimaka michelle',
    'birch',
    'michelle',
    '',
    'oak167',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    168,
    'divine amadi',
    'jss 2',
    'amadi',
    '',
    'oak168',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    169,
    'divine amanze',
    'sss 1',
    'amanze',
    '',
    'oak169',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    170,
    'divine chika',
    'jss 3',
    'chika',
    '',
    'oak170',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    171,
    'divine favour judah',
    'gorse',
    'judah',
    '',
    'oak171',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    172,
    'divine tari',
    'jss 1',
    'tari',
    '',
    'oak172',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    173,
    'divine zizzeh',
    'vine',
    'zizzeh',
    '',
    'oak173',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    174,
    'domale pamogho',
    'birch',
    'pamogho',
    '',
    'oak174',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    175,
    'dominic victor',
    'jss 1',
    'victor',
    '',
    'oak175',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    176,
    'dominion charles',
    'fir',
    'charles',
    '',
    'oak176',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    177,
    'dominion chinnah',
    'alder',
    'chinnah',
    '',
    'oak177',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    178,
    'dominion oti',
    'gorse',
    'oti',
    '',
    'oak178',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    179,
    'donald ajie',
    'gorse',
    'ajie',
    '',
    'oak179',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    180,
    'donald iheanacho',
    'hazel',
    'iheanacho',
    '',
    'oak180',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    181,
    'e ukeje',
    'alder',
    'ukeje',
    '',
    'oak181',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    182,
    'ebenizer emmanuel-lebechi',
    'alder',
    'emmanuel-lebechi',
    '',
    'oak182',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    183,
    'ebubechi izuka',
    'gorse',
    'izuka',
    '',
    'oak183',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    184,
    'ebubechukwu judah',
    'vine',
    'judah',
    '',
    'oak184',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    185,
    'edwin chinnah',
    'birch',
    'chinnah',
    '',
    'oak185',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    186,
    'eliora daramola',
    'aspen',
    'daramola',
    '',
    'oak186',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    187,
    'elizabeth olamide',
    'hazel',
    'olamide',
    '',
    'oak187',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    188,
    'emeh okey',
    'jss 1',
    'okey',
    '',
    'oak188',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    189,
    'emeka nwaigbo',
    'rowan',
    'nwaigbo',
    '',
    'oak189',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    190,
    'emenike anulue',
    'alder',
    'anulue',
    '',
    'oak190',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    191,
    'emenike anulue',
    'select class',
    'anulue',
    '',
    'oak191',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    192,
    'emenike anulue',
    'select class',
    'anulue',
    '',
    'oak192',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    193,
    'emezie nwaigbo',
    'willow',
    'nwaigbo',
    '',
    'oak193',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    194,
    'emmanuel amanze',
    'alder',
    'amanze',
    '',
    'oak194',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    195,
    'emmanuel chika',
    'jss 2',
    'chika',
    '',
    'oak195',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    196,
    'emmanuel chuku',
    'willow',
    'chuku',
    '',
    'oak196',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    197,
    'emmanuel dominic',
    'alder',
    'dominic',
    '',
    'oak197',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    198,
    'emmanuel ezechukwu',
    'jss 2',
    'ezechukwu',
    '',
    'oak198',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    199,
    'emmanuel obinna',
    'willow',
    'obinna',
    '',
    'oak199',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    200,
    'emmanuel uchenna-dike',
    'rowan',
    'uchenna-dike',
    '',
    'oak200',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    201,
    'emmanuel uchenna-dike',
    'jss 2',
    'uchenna-dike',
    '',
    'oak201',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    202,
    'emmanuel uzoma-francis',
    'jss 3',
    'uzoma-francis',
    '',
    'oak202',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    203,
    'emmanuela innocent',
    'jss 1',
    'innocent',
    '',
    'oak203',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    204,
    'emmanuel-gregory john',
    'jss 1',
    'john',
    '',
    'oak204',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    205,
    'emmanuella madu',
    'aspen',
    'madu',
    '',
    'oak205',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    206,
    'emmanuella princewill',
    'vine',
    'princewill',
    '',
    'oak206',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    207,
    'emmanuella ugwueze',
    'aspen',
    'ugwueze',
    '',
    'oak207',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    208,
    'emmanuella uzoma',
    'vine',
    'uzoma',
    '',
    'oak208',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    209,
    'emmanuella yibowei',
    'jss 2',
    'yibowei',
    '',
    'oak209',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    210,
    'emmanuella zino',
    'alder',
    'zino',
    '',
    'oak210',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    211,
    'eric victory',
    'alder',
    'victory',
    '',
    'oak211',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    212,
    'erioluwa okeowo',
    'hazel',
    'okeowo',
    '',
    'oak212',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    213,
    'ernest deborah',
    'jss 1',
    'deborah',
    '',
    'oak213',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    214,
    'ernest kingdavid',
    'alder',
    'kingdavid',
    '',
    'oak214',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    215,
    'eseoghene lawson',
    'willow',
    'lawson',
    '',
    'oak215',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    216,
    'esomchukwu ifedi',
    'alder',
    'ifedi',
    '',
    'oak216',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    217,
    'esther stephen',
    'jss 3',
    'stephen',
    '',
    'oak217',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    218,
    'etame carthage',
    'hazel',
    'carthage',
    '',
    'oak218',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    219,
    'ethan ibe',
    'alder',
    'ibe',
    '',
    'oak219',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    220,
    'eugenia kolade',
    'fir',
    'kolade',
    '',
    'oak220',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    221,
    'eze  precious',
    'sss 1',
    'precious',
    '',
    'oak221',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    222,
    'ezehia austin',
    'jss 1',
    'austin',
    '',
    'oak222',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    223,
    'ezeugo nora',
    'jss 1',
    'nora',
    '',
    'oak223',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    224,
    'faith audu',
    'vine',
    'audu',
    '',
    'oak224',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    225,
    'faith wachukwu',
    'willow',
    'wachukwu',
    '',
    'oak225',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    226,
    'faithfulness mmata-vincent',
    'jss 2',
    'mmata-vincent',
    '',
    'oak226',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    227,
    'faustina simon',
    'hazel',
    'simon',
    '',
    'oak227',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    228,
    'favour bubagha',
    'vine',
    'bubagha',
    '',
    'oak228',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    229,
    'favour camilus',
    'hazel',
    'camilus',
    '',
    'oak229',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    230,
    'favour covenant',
    'hazel',
    'covenant',
    '',
    'oak230',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    231,
    'favour dominic',
    'jss 1',
    'dominic',
    '',
    'oak231',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    232,
    'favour gideon',
    'sss 2 (science)',
    'gideon',
    '',
    'oak232',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    233,
    'favour godwin',
    'sss 2 (arts)',
    'godwin',
    '',
    'oak233',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    234,
    'favour moses',
    'jss 2',
    'moses',
    '',
    'oak234',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    235,
    'favour silas-nwofor',
    'hazel',
    'silas-nwofor',
    '',
    'oak235',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    236,
    'favour wachukwu',
    'willow',
    'wachukwu',
    '',
    'oak236',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    237,
    'favour yibowei',
    'sss 2 (arts)',
    'yibowei',
    '',
    'oak237',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    238,
    'favour zizzeh',
    'birch',
    'zizzeh',
    '',
    'oak238',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    239,
    'flora simon',
    'fir',
    'simon',
    '',
    'oak239',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    240,
    'flourish chris walis',
    'aspen',
    'chris walis',
    '',
    'oak240',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    241,
    'flourish robinson',
    'alder',
    'robinson',
    '',
    'oak241',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    242,
    'fortune wolugbom',
    'jss 2',
    'wolugbom',
    '',
    'oak242',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    243,
    'francis theresa',
    'fir',
    'theresa',
    '',
    'oak243',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    244,
    'francisca amarachukwu',
    'aspen',
    'amarachukwu',
    '',
    'oak244',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    245,
    'frankline asonye',
    'vine',
    'asonye',
    '',
    'oak245',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    246,
    'frederick ezirim',
    'alder',
    'ezirim',
    '',
    'oak246',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    247,
    'freedom silas-nwofor',
    'willow',
    'silas-nwofor',
    '',
    'oak247',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    248,
    'friday emmanuel',
    'alder',
    'emmanuel',
    '',
    'oak248',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    249,
    'gabriel aka-wolugbom',
    'aspen',
    'aka-wolugbom',
    '',
    'oak249',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    250,
    'gabriel splendid',
    'birch',
    'splendid',
    '',
    'oak250',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    251,
    'gabriella aka-wolugbom',
    'aspen',
    'aka-wolugbom',
    '',
    'oak251',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    252,
    'george solomon',
    'hazel',
    'solomon',
    '',
    'oak252',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    253,
    'gesu sunday',
    'hazel',
    'sunday',
    '',
    'oak253',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    254,
    'gideon zizzeh',
    'aspen',
    'zizzeh',
    '',
    'oak254',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    255,
    'gipive stephen',
    'hazel',
    'stephen',
    '',
    'oak255',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    256,
    'glory chibuzor',
    'gorse',
    'chibuzor',
    '',
    'oak256',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    257,
    'godfirst okechukwu',
    'jss 1',
    'okechukwu',
    '',
    'oak257',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    258,
    'godgift okechukwu',
    'fir',
    'okechukwu',
    '',
    'oak258',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    259,
    'godreigns okechukwu',
    'aspen',
    'okechukwu',
    '',
    'oak259',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    260,
    'godswill felix',
    'sss 1',
    'felix',
    '',
    'oak260',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    261,
    'godwin emmanuel',
    'sss 1',
    'emmanuel',
    '',
    'oak261',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    262,
    'gold anurou',
    'birch',
    'anurou',
    '',
    'oak262',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    263,
    'goodnews akachukwu',
    'sss 2 (science)',
    'akachukwu',
    '',
    'oak263',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    264,
    'great evans',
    'birch',
    'evans',
    '',
    'oak264',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    265,
    'great zuaka',
    'hazel',
    'zuaka',
    '',
    'oak265',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    266,
    'great-obase okoi',
    'sss 1',
    'okoi',
    '',
    'oak266',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    267,
    'greg alubari',
    'sss 1',
    'alubari',
    '',
    'oak267',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    268,
    'hadassah chikaonu',
    'alder',
    'chikaonu',
    '',
    'oak268',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    269,
    'hameedah audu',
    'hazel',
    'audu',
    '',
    'oak269',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    270,
    'haniel princewill',
    'jss 2',
    'princewill',
    '',
    'oak270',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    271,
    'happiness moses',
    'gorse',
    'moses',
    '',
    'oak271',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    272,
    'helen ofor',
    'sss 2 (arts)',
    'ofor',
    '',
    'oak272',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    273,
    'homachi maurice',
    'alder',
    'maurice',
    '',
    'oak273',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    274,
    'honour idoko',
    'birch',
    'idoko',
    '',
    'oak274',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    275,
    'humphery hillary',
    'birch',
    'hillary',
    '',
    'oak275',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    276,
    'ian ketebu',
    'jss 1',
    'ketebu',
    '',
    'oak276',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    277,
    'ibibo bob-manuel',
    'fir',
    'bob-manuel',
    '',
    'oak277',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    278,
    'ibibo bob-manuel',
    'aspen',
    'bob-manuel',
    '',
    'oak278',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    279,
    'ibinabo kiani',
    'fir',
    'kiani',
    '',
    'oak279',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    280,
    'ibiyomi kiani',
    'alder',
    'kiani',
    '',
    'oak280',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    281,
    'idehenre omoligho',
    'gorse',
    'omoligho',
    '',
    'oak281',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    282,
    'ideozu precious',
    'jss 1',
    'precious',
    '',
    'oak282',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    283,
    'ifeanyi onwuka',
    'jss 2',
    'onwuka',
    '',
    'oak283',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    284,
    'ifechukwu madu',
    'birch',
    'madu',
    '',
    'oak284',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    285,
    'igwe yvonne',
    'jss 1',
    'yvonne',
    '',
    'oak285',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    286,
    'ihearindueme harmony',
    'birch',
    'harmony',
    '',
    'oak286',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    287,
    'ikechukwu anoka',
    'sss 1',
    'anoka',
    '',
    'oak287',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    288,
    'iknebubechim ikechi-igwe',
    'rowan',
    'ikechi-igwe',
    '',
    'oak288',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    289,
    'increase humphrey',
    'alder',
    'humphrey',
    '',
    'oak289',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    290,
    'indutumi ketebu',
    'sss 1',
    'ketebu',
    '',
    'oak290',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    291,
    'ingonabo omubo',
    'alder',
    'omubo',
    '',
    'oak291',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    292,
    'iremide olaku',
    'sss 2 (arts)',
    'olaku',
    '',
    'oak292',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    293,
    'ireoluwa akin-ewe',
    'alder',
    'akin-ewe',
    '',
    'oak293',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    294,
    'isaac confidence',
    'jss 1',
    'confidence',
    '',
    'oak294',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    295,
    'ivan godknows',
    'hazel',
    'godknows',
    '',
    'oak295',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    296,
    'ivan godknows-chima',
    'hazel',
    'godknows-chima',
    '',
    'oak296',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    297,
    'ivano godknows',
    'alder',
    'godknows',
    '',
    'oak297',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    298,
    'izuka chigozie',
    'birch',
    'chigozie',
    '',
    'oak298',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    299,
    'jachima ikechi-igwe',
    'willow',
    'ikechi-igwe',
    '',
    'oak299',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    300,
    'jaden udeh',
    'jss 1',
    'udeh',
    '',
    'oak300',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    301,
    'jadon uchenna',
    'alder',
    'uchenna',
    '',
    'oak301',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    302,
    'jahamanda bob-manuel',
    'alder',
    'bob-manuel',
    '',
    'oak302',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    303,
    'jasiel peters',
    'willow',
    'peters',
    '',
    'oak303',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    304,
    'jayden okorafor',
    'alder',
    'okorafor',
    '',
    'oak304',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    305,
    'jayden onukaogu',
    'alder',
    'onukaogu',
    '',
    'oak305',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    306,
    'jenelle uduehi',
    'gorse',
    'uduehi',
    '',
    'oak306',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    307,
    'jensen obiako',
    'alder',
    'obiako',
    '',
    'oak307',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    308,
    'jeremiah stephen',
    'alder',
    'stephen',
    '',
    'oak308',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    309,
    'jeremy siedoma',
    'alder',
    'siedoma',
    '',
    'oak309',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    310,
    'jessica moses-wogu',
    'alder',
    'moses-wogu',
    '',
    'oak310',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    311,
    'jessie',
    'vine',
    'jessie',
    '',
    'oak311',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    312,
    'joan akio',
    'sss 1',
    'akio',
    '',
    'oak312',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    313,
    'joel udeh',
    'alder',
    'udeh',
    '',
    'oak313',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    314,
    'john emmanuel',
    'jss 2',
    'emmanuel',
    '',
    'oak314',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    315,
    'jose madu',
    'willow',
    'madu',
    '',
    'oak315',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    316,
    'joseph gospel',
    'aspen',
    'gospel',
    '',
    'oak316',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    317,
    'joseph uche',
    'alder',
    'uche',
    '',
    'oak317',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    318,
    'josh chukwuma',
    'vine',
    'chukwuma',
    'tjc3qa11gh2tjc3qa11gh284hc4f7j7r884hc4f7j7r8',
    'oak318',
    '',
    '',
    'none',
    'active',
    '2023-08-05 10:29:42'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    319,
    'joshua udeh',
    'willow',
    'udeh',
    '',
    'oak319',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    320,
    'joy chiedozie',
    'willow',
    'chiedozie',
    '',
    'oak320',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    321,
    'joy christopher',
    'jss 2',
    'christopher',
    '',
    'oak321',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    322,
    'joy onyekwere',
    'hazel',
    'onyekwere',
    '',
    'oak322',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    323,
    'juanita japhet',
    'alder',
    'japhet',
    '',
    'oak323',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    324,
    'jubilant waliogba',
    'hazel',
    'waliogba',
    '',
    'oak324',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    325,
    'jubilant waliogba',
    'vine',
    'waliogba',
    '',
    'oak325',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    326,
    'judah ebubechukwu',
    'jss 1',
    'ebubechukwu',
    '',
    'oak326',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    327,
    'jumbo lucio',
    'jss 1',
    'lucio',
    '',
    'oak327',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    328,
    'kakabebari noble',
    'rowan',
    'noble',
    '',
    'oak328',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    329,
    'kakabelbari nobel',
    'jss 1',
    'nobel',
    '',
    'oak329',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    330,
    'kamsi fedi',
    'jss 2',
    'ifedi',
    '',
    'oak330',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    331,
    'kamsiyochim onukogu',
    'birch',
    'onukogu',
    '',
    'oak331',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    332,
    'kamsiyojah bob-manuel',
    'gorse',
    'bob-manuel',
    '',
    'oak332',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    333,
    'kaniella smart',
    'alder',
    'smart',
    '',
    'oak333',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    334,
    'karris smart',
    'birch',
    'smart',
    '',
    'oak334',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    335,
    'kekereekun seyi',
    'jss 1',
    'seyi',
    '',
    'oak335',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    336,
    'kelvin chima',
    'gorse',
    'chima',
    '',
    'oak336',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    337,
    'kelvin etim',
    'gorse',
    'etim',
    '',
    'oak337',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    338,
    'kendra ibe',
    'alder',
    'ibe',
    '',
    'oak338',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    339,
    'kendrick onukogu',
    'alder',
    'onukogu',
    '',
    'oak339',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    340,
    'kenebi eze',
    'jss 1',
    'eze',
    '',
    'oak340',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    341,
    'kenebi gabrielle',
    'jss 1',
    'gabrielle',
    '',
    'oak341',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    342,
    'kenneth david',
    'sss 1',
    'david',
    '',
    'oak342',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    343,
    'kiani lolia',
    'alder',
    'lolia',
    '',
    'oak343',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    344,
    'kindness onyekwere',
    'jss 3',
    'onyekwere',
    '',
    'oak344',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    345,
    'kindness onyekwere',
    'sss 2 (science)',
    'onyekwere',
    '',
    'oak345',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    346,
    'kingswin favour',
    'jss 3',
    'favour',
    '',
    'oak346',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    347,
    'kinika juanita',
    'rowan',
    'juanita',
    '',
    'oak347',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    348,
    'kinika judah',
    'hazel',
    'judah',
    '',
    'oak348',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    349,
    'kirsten peters',
    'aspen',
    'peters',
    '',
    'oak349',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    350,
    'kosiso okoronkwo',
    'hazel',
    'okoronkwo',
    '',
    'oak350',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    351,
    'lael ihim',
    'aspen',
    'ihim',
    '',
    'oak351',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    352,
    'lastname firstname',
    'class',
    'firstname',
    '',
    'oak352',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    353,
    'laura ihim',
    'willow',
    'ihim',
    '',
    'oak353',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    354,
    'laura ketebu',
    'sss 3 (science)',
    'ketebu',
    '',
    'oak354',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    355,
    'ledum barinada',
    'birch',
    'barinada',
    '',
    'oak355',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    356,
    'lesira zuaka',
    'vine',
    'zuaka',
    '',
    'oak356',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    357,
    'light nwofor',
    'hazel',
    'nwofor',
    '',
    'oak357',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    358,
    'liron ihim',
    'alder',
    'ihim',
    '',
    'oak358',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    359,
    'lisa lucky',
    'alder',
    'lucky',
    '',
    'oak359',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    360,
    'lisa newton',
    'willow',
    'newton',
    '',
    'oak360',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    361,
    'living stone abasi-israel',
    'vine',
    'abasi-israel',
    '',
    'oak361',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    362,
    'lyte titus',
    'sss 2 (science)',
    'titus',
    'hs2f9op0lekhs2f9op0lek19e0thqpott19e0thqpott',
    'oak362',
    '09078785538',
    '',
    'none',
    'active',
    '2023-08-05 10:54:38'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    363,
    'macdave igwe',
    'fir',
    'igwe',
    '',
    'oak363',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    364,
    'martins ezeugo',
    'jss 1',
    'ezeugo',
    '',
    'oak364',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    365,
    'marvellous elekwachi',
    'fir',
    'elekwachi',
    '',
    'oak365',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    366,
    'maryann anulue',
    'rowan',
    'anulue',
    '',
    'oak366',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    367,
    'maryann umeozulu',
    'sss 1',
    'umeozulu',
    '',
    'oak367',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    368,
    'marygreat idoko',
    'aspen',
    'idoko',
    '',
    'oak368',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    369,
    'massi walter',
    'jss 1',
    'walter',
    '',
    'oak369',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    370,
    'maurice jeremy',
    'birch',
    'jeremy',
    '',
    'oak370',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    371,
    'mavis ewelike',
    'birch',
    'ewelike',
    '',
    'oak371',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    372,
    'mbon faith',
    'jss 3',
    'faith',
    '',
    'oak372',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    373,
    'mbon hope',
    'jss 3',
    'hope',
    '',
    'oak373',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    374,
    'megan ahiakwo',
    'rowan',
    'ahiakwo',
    '',
    'oak374',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    375,
    'melody chikodi',
    'jss 1',
    'chikodi',
    '',
    'oak375',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    376,
    'melvin nick-bel',
    'jss 1',
    'nick-bel',
    '',
    'oak376',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    377,
    'michael ukeje',
    'hazel',
    'ukeje',
    '',
    'oak377',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    378,
    'michelle kenebi',
    'jss 2',
    'kenebi',
    '',
    'oak378',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    379,
    'michelle moses-wogu',
    'birch',
    'moses-wogu',
    '',
    'oak379',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    380,
    'michelle nwoha',
    'gorse',
    'nwoha',
    '',
    'oak380',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    381,
    'miku levi',
    'alder',
    'levi',
    '',
    'oak381',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    382,
    'mirabel uzoegbu',
    'gorse',
    'uzoegbu',
    '',
    'oak382',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    383,
    'miracle akor',
    'hazel',
    'akor',
    '',
    'oak383',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    384,
    'mitchell innocent',
    'hazel',
    'innocent',
    '',
    'oak384',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    385,
    'mmesomachukwu judah',
    'jss 1',
    'judah',
    '',
    'oak385',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    386,
    'mmesomachukwu ozigbo',
    'sss 1',
    'ozigbo',
    '',
    'oak386',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    387,
    'mofeoluwa akin-awe',
    'gorse',
    'akin-awe',
    '',
    'oak387',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    388,
    'moses miracle',
    'willow',
    'miracle',
    '',
    'oak388',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    389,
    'munachimso iheanacho',
    'jss 2',
    'iheanacho',
    '',
    'oak389',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    390,
    'munachukwumso ozigbo',
    'gorse',
    'ozigbo',
    '',
    'oak390',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    391,
    'nancy kolade',
    'sss 2 (arts)',
    'kolade',
    '',
    'oak391',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    392,
    'nancy obiako',
    'hazel',
    'obiako',
    '',
    'oak392',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    393,
    'naomi chukwu',
    'gorse',
    'chukwu',
    '',
    'oak393',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    394,
    'naomi olaku',
    'jss 3',
    'olaku',
    '',
    'oak394',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    395,
    'nelson chibuikem',
    'birch',
    'chibuikem',
    '',
    'oak395',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    396,
    'nengi ibuchim',
    'birch',
    'ibuchim',
    '',
    'oak396',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    397,
    'neto ifedi',
    'fir',
    'ifedi',
    '',
    'oak397',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    398,
    'ngozi chukwudi',
    'jss 2',
    'chukwudi',
    '',
    'oak398',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    399,
    'nicky nick-bebs',
    'gorse',
    'nick-bebs',
    '',
    'oak399',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    400,
    'nora amadi',
    'vine',
    'amadi',
    '',
    'oak400',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    401,
    'nora ezeugo',
    'vine',
    'ezeugo',
    '',
    'oak401',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    402,
    'norajay uzokwe',
    'hazel',
    'uzokwe',
    '',
    'oak402',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    403,
    'ntar letam',
    'alder',
    'letam',
    '',
    'oak403',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    404,
    'nwaigbo chukwuemeka',
    'jss 1',
    'chukwuemeka',
    '',
    'oak404',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    405,
    'nwogu chima',
    'alder',
    'chima',
    '',
    'oak405',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    406,
    'nwogu chima',
    'alder',
    'chima',
    '',
    'oak406',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    407,
    'o uduehi',
    'alder',
    'uduehi',
    '',
    'oak407',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    408,
    'obi kenebi',
    'sss 3 (science)',
    'kenebi',
    '',
    'oak408',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    409,
    'obinna favour',
    'vine',
    'favour',
    '',
    'oak409',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    410,
    'ogbu david',
    'jss 1',
    'david',
    '',
    'oak410',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    411,
    'ogehenemaro zino',
    'fir',
    'zino',
    '',
    'oak411',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    412,
    'oghenemaro ejiro',
    'alder',
    'ejiro',
    '',
    'oak412',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    413,
    'ogheneochuko lawson',
    'alder',
    'lawson',
    '',
    'oak413',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    414,
    'ogheneovie lawson',
    'rowan',
    'lawson',
    '',
    'oak414',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    415,
    'oghentega lawson',
    'fir',
    'lawson',
    '',
    'oak415',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    416,
    'ogochukwu ozigbo',
    'vine',
    'ozigbo',
    '',
    'oak416',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    417,
    'ogochukwu ozigbo',
    'rowan',
    'ozigbo',
    '',
    'oak417',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    418,
    'okee francis',
    'hazel',
    'francis',
    '',
    'oak418',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    419,
    'okeowo femi',
    'fir',
    'femi',
    '',
    'oak419',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    420,
    'okey-emeh nhomachi',
    'jss 3',
    'nhomachi',
    '',
    'oak420',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    421,
    'olajide david',
    'jss 3',
    'david',
    '',
    'oak421',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    422,
    'olajide micheal',
    'jss 1',
    'micheal',
    '',
    'oak422',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    423,
    'olomachi collin-isaac',
    'alder',
    'collin-isaac',
    '',
    'oak423',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    424,
    'oluchukwu obiako',
    'birch',
    'obiako',
    '',
    'oak424',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    425,
    'oluchukwu ozigbo',
    'jss 1',
    'ozigbo',
    '',
    'oak425',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    426,
    'olumachi madu',
    'alder',
    'madu',
    '',
    'oak426',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    427,
    'olumide daramola',
    'sss 1',
    'daramola',
    '',
    'oak427',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    428,
    'oluomachi marcus',
    'alder',
    'marcus',
    '',
    'oak428',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    429,
    'oluwafolakemi akinyemi',
    'alder',
    'akinyemi',
    '',
    'oak429',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    430,
    'oluwatoni okeowo',
    'vine',
    'okeowo',
    '',
    'oak430',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    431,
    'omamesiri lawson',
    'sss 1',
    'lawson',
    '',
    'oak431',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    432,
    'omasirichi amesi',
    'hazel',
    'amesi',
    '',
    'oak432',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    433,
    'omasirichi rheina',
    'alder',
    'rheina',
    '',
    'oak433',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    434,
    'omotola shittu',
    'alder',
    'shittu',
    '',
    'oak434',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    435,
    'omotola zamar',
    'birch',
    'zamar',
    '',
    'oak435',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    436,
    'omubo ayebatonbara',
    'birch',
    'ayebatonbara',
    '',
    'oak436',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    437,
    'onyeazor success',
    'birch',
    'success',
    '',
    'oak437',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    438,
    'onyedikachi ihearindueme',
    'alder',
    'ihearindueme',
    '',
    'oak438',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    439,
    'onyekachi ugwuja',
    'alder',
    'ugwuja',
    '',
    'oak439',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    440,
    'onyinyechi elechukwu',
    'jss 3',
    'elechukwu',
    '',
    'oak440',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    441,
    'onyinyechi elechukwu',
    'sss 2 (arts)',
    'elechukwu',
    '',
    'oak441',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    442,
    'onyinyechi eugene',
    'jss 1',
    'eugene',
    '',
    'oak442',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    443,
    'onyinyechi onyebuchi-tony',
    'jss 3',
    'onyebuchi-tony',
    '',
    'oak443',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    444,
    'oroma chuku',
    'rowan',
    'chuku',
    '',
    'oak444',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    445,
    'osagie idehenre',
    'willow',
    'idehenre',
    '',
    'oak445',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    446,
    'osagie idehere',
    'rowan',
    'idehere',
    '',
    'oak446',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    447,
    'osarobo michelle',
    'alder',
    'michelle',
    '',
    'oak447',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    448,
    'ovie lawson',
    'jss 1',
    'lawson',
    '',
    'oak448',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    449,
    'ovie ngalo',
    'sss 3 (science)',
    'ngalo',
    '',
    'oak449',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    450,
    'ozioma nwankwo',
    'jss 2',
    'nwankwo',
    '',
    'oak450',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    451,
    'pascal esther',
    'jss 2',
    'esther',
    '',
    'oak451',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    452,
    'pascal ezenwata',
    'jss 2',
    'ezenwata',
    '',
    'oak452',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    453,
    'paul david',
    'jss 2',
    'david',
    '',
    'oak453',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    454,
    'perfect stephen',
    'alder',
    'stephen',
    '',
    'oak454',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    455,
    'phila nick-bebs',
    'willow',
    'nick-bebs',
    '',
    'oak455',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    456,
    'praise augustine',
    'rowan',
    'augustine',
    '',
    'oak456',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    457,
    'praise dominic',
    'sss 2 (science)',
    'dominic',
    '',
    'oak457',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    458,
    'praise ideozu',
    'jss 3',
    'ideozu',
    '',
    'oak458',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    459,
    'praise idoko',
    'fir',
    'idoko',
    '',
    'oak459',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    460,
    'praise nobel',
    'hazel',
    'nobel',
    '',
    'oak460',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    461,
    'praise noble',
    'gorse',
    'noble',
    '',
    'oak461',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    462,
    'praise olajide',
    'rowan',
    'olajide',
    '',
    'oak462',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    463,
    'praisejah moar',
    'alder',
    'moar',
    '',
    'oak463',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    464,
    'precious  augustine',
    'jss 1',
    'augustine',
    '',
    'oak464',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    465,
    'precious aminwuma',
    'jss 2',
    'aminwuma',
    '',
    'oak465',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    466,
    'precious joseph',
    'sss 2 (science)',
    'joseph',
    '',
    'oak466',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    467,
    'precious ogechi',
    'aspen',
    'ogechi',
    '',
    'oak467',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    468,
    'precious princewill',
    'birch',
    'princewill',
    '',
    'oak468',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    469,
    'precious sogbara',
    'willow',
    'sogbara',
    '',
    'oak469',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    470,
    'prince innocent',
    'jss 1',
    'innocent',
    '',
    'oak470',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    471,
    'prince jude',
    'alder',
    'jude',
    '',
    'oak471',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    472,
    'prince obianika',
    'jss 3',
    'obianika',
    '',
    'oak472',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    473,
    'princess ubani',
    'sss 3 (science)',
    'ubani',
    '',
    'oak473',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    474,
    'princess ubani',
    'select class',
    'ubani',
    '',
    'oak474',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    475,
    'princewill asibere',
    'sss 1',
    'asibere',
    '',
    'oak475',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    476,
    'princewill emmanuel',
    'jss 1',
    'emmanuel',
    '',
    'oak476',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    477,
    'princewill favour',
    'jss 3',
    'favour',
    '',
    'oak477',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    478,
    'princewill ubani',
    'sss 3 (arts)',
    'ubani',
    '',
    'oak478',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    479,
    'promise augustine',
    'jss 2',
    'augustine',
    '',
    'oak479',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    480,
    'purity nwoha',
    'hazel',
    'nwoha',
    '',
    'oak480',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    481,
    'purity nwoha',
    'willow',
    'nwoha',
    '',
    'oak481',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    482,
    'rashford henry',
    'birch',
    'henry',
    '',
    'oak482',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    483,
    'rayna emem',
    'alder',
    'emem',
    '',
    'oak483',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    484,
    'rejoice nwofor',
    'birch',
    'nwofor',
    '',
    'oak484',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    485,
    'rejoice princewill',
    'hazel',
    'princewill',
    '',
    'oak485',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    486,
    'richmond chijioke',
    'jss 1',
    'chijioke',
    '',
    'oak486',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    487,
    'robi walter',
    'gorse',
    'walter',
    '',
    'oak487',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    488,
    'rosefaith chukwu',
    'willow',
    'chukwu',
    '',
    'oak488',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    489,
    'rosefaith chukwu',
    'willow',
    'chukwu',
    '',
    'oak489',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    490,
    'sabastine praise',
    'fir',
    'praise',
    '',
    'oak490',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    491,
    'samuel avubuike',
    'aspen',
    'avubuike',
    '',
    'oak491',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    492,
    'samuel moses',
    'birch',
    'moses',
    '',
    'oak492',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    493,
    'samuel nelson',
    'rowan',
    'nelson',
    '',
    'oak493',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    494,
    'samuel ofor',
    'hazel',
    'ofor',
    '',
    'oak494',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    495,
    'samuel oriafoh',
    'gorse',
    'oriafoh',
    '',
    'oak495',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    496,
    'sandra solomon',
    'gorse',
    'solomon',
    '',
    'oak496',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    497,
    'seyi kekereekun',
    'rowan',
    'kekereekun',
    '',
    'oak497',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    498,
    'shalom chiedozie-ajaraonye',
    'jss 3',
    'chiedozie-ajaraonye',
    '',
    'oak498',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    499,
    'shalom judah',
    'alder',
    'judah',
    '',
    'oak499',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    500,
    'shammah kekerekun',
    'willow',
    'kekerekun',
    '',
    'oak500',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    501,
    'shammah mbagwu',
    'birch',
    'mbagwu',
    '',
    'oak501',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    502,
    'sharon kekereekun',
    'jss 3',
    'kekereekun',
    '',
    'oak502',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    503,
    'sharon titus',
    'jss 1',
    'titus',
    'hs2f9op0lekhs2f9op0lek19e0thqpott19e0thqpott',
    'oak503',
    '09078785538',
    '',
    'none',
    'active',
    '2023-08-05 10:54:38'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    504,
    'simon kekerekun',
    'jss 1',
    'kekerekun',
    '',
    'oak504',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    505,
    'sochidiebube ifedi',
    'hazel',
    'ifedi',
    '',
    'oak505',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    506,
    'sochima kenneth',
    'gorse',
    'kenneth',
    '',
    'oak506',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    507,
    'sochukwubusonma asomba',
    'alder',
    'asomba',
    '',
    'oak507',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    508,
    'somtojah bob-manuel',
    'willow',
    'bob-manuel',
    '',
    'oak508',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    509,
    'soneye damilola',
    'fir',
    'damilola',
    '',
    'oak509',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    510,
    'sophia dare',
    'willow',
    'dare',
    '',
    'oak510',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    511,
    'sophia egbegi',
    'alder',
    'egbegi',
    '',
    'oak511',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    512,
    'splendid kenneth',
    'rowan',
    'kenneth',
    '',
    'oak512',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    513,
    'splendour jude',
    'birch',
    'jude',
    '',
    'oak513',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    514,
    'stephine ejiogu',
    'jss 1',
    'ejiogu',
    '',
    'oak514',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    515,
    'sterling jude',
    'alder',
    'jude',
    '',
    'oak515',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    516,
    'success elekwachi',
    'alder',
    'elekwachi',
    '',
    'oak516',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    517,
    'success olajide',
    'willow',
    'olajide',
    '',
    'oak517',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    518,
    'success stephen',
    'aspen',
    'stephen',
    '',
    'oak518',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    519,
    'sydlik ibe',
    'birch',
    'ibe',
    '',
    'oak519',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    520,
    'tarinabo omubo',
    'alder',
    'omubo',
    '',
    'oak520',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    521,
    'tessy igwe',
    'willow',
    'igwe',
    '',
    'oak521',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    522,
    'tiwatope olamide',
    'birch',
    'olamide',
    '',
    'oak522',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    523,
    'tobechukwu chukwuma',
    'hazel',
    'chukwuma',
    'tjc3qa11gh2tjc3qa11gh284hc4f7j7r884hc4f7j7r8',
    'oak523',
    '',
    '',
    'none',
    'active',
    '2023-08-05 10:29:42'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    524,
    'tobechwu chukwu',
    'vine',
    'chukwu',
    '',
    'oak524',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    525,
    'tomiwa daramola',
    'sss 1',
    'daramola',
    '',
    'oak525',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    526,
    'travis jessie',
    'willow',
    'jessie',
    '',
    'oak526',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    527,
    'treasure tari',
    'willow',
    'tari',
    '',
    'oak527',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    528,
    'uche whyte',
    'hazel',
    'whyte',
    '',
    'oak528',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    529,
    'uche whyte',
    'hazel',
    'whyte',
    '',
    'oak529',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    530,
    'ugochi anayo',
    'sss 1',
    'anayo',
    '',
    'oak530',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    531,
    'ugochukwu amaechi',
    'hazel',
    'amaechi',
    '',
    'oak531',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    532,
    'ugwueze dillion',
    'jss 1',
    'dillion',
    '',
    'oak532',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    533,
    'uloma amaechi',
    'jss 1',
    'amaechi',
    '',
    'oak533',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    534,
    'uriel chukwuma',
    'birch',
    'chukwuma',
    'tjc3qa11gh2tjc3qa11gh284hc4f7j7r884hc4f7j7r8',
    'oak534',
    '',
    '',
    'none',
    'active',
    '2023-08-05 10:29:42'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    535,
    'uriel nwoha',
    'alder',
    'nwoha',
    '',
    'oak535',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    536,
    'utibe etuk',
    'willow',
    'etuk',
    '',
    'oak536',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    537,
    'uzoma ella',
    'rowan',
    'ella',
    '',
    'oak537',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    538,
    'uzoma noah',
    'alder',
    'noah',
    '',
    'oak538',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    539,
    'valerian umeozulu',
    'jss 1',
    'umeozulu',
    '',
    'oak539',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    540,
    'victor chukwuma',
    'jss 1',
    'chukwuma',
    'tjc3qa11gh2tjc3qa11gh284hc4f7j7r884hc4f7j7r8',
    'oak540',
    '',
    '',
    'none',
    'active',
    '2023-08-05 10:29:42'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    541,
    'victor dominic',
    'sss 1',
    'dominic',
    '',
    'oak541',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    542,
    'victor dominic',
    'rowan',
    'dominic',
    '',
    'oak542',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    543,
    'victor samuel',
    'gorse',
    'samuel',
    '',
    'oak543',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    544,
    'victory amadi',
    'rowan',
    'amadi',
    '',
    'oak544',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    545,
    'victory camilus',
    'vine',
    'camilus',
    '',
    'oak545',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    546,
    'victory ibuchim',
    'alder',
    'ibuchim',
    '',
    'oak546',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    547,
    'victory isreal',
    'jss 3',
    'isreal',
    '',
    'oak547',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    548,
    'victory uchenna-dike',
    'fir',
    'uchenna-dike',
    '',
    'oak548',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    549,
    'vincent mmata',
    'sss 3 (arts)',
    'mmata',
    '',
    'oak549',
    '',
    '',
    'none',
    'left',
    '2023-08-05 10:59:15'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    550,
    'vivian kemakolon',
    'aspen',
    'kemakolon',
    '',
    'oak550',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    551,
    'walis chris',
    'hazel',
    'chris',
    '',
    'oak551',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    552,
    'walter ase',
    'sss 2 (science)',
    'ase',
    '',
    'oak552',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    553,
    'wesley azubuike',
    'rowan',
    'azubuike',
    '',
    'oak553',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    554,
    'williams chidi-woko',
    'aspen',
    'chidi-woko',
    '',
    'oak554',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    555,
    'winifred osarobo-royalty',
    'jss 3',
    'osarobo-royalty',
    '',
    'oak555',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    556,
    'winner samuel',
    'willow',
    'samuel',
    '',
    'oak556',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    557,
    'wisdom ebubuchi',
    'jss 2',
    'ebubuchi',
    '',
    'oak557',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    558,
    'woko chidi',
    'fir',
    'chidi',
    '',
    'oak558',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    559,
    'wolugbom aka',
    'sss 3 (science)',
    'aka',
    '',
    'oak559',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    560,
    'wolugbom aka',
    'willow',
    'aka',
    '',
    'oak560',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    561,
    'yvonne igwe',
    'rowan',
    'igwe',
    '',
    'oak561',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    562,
    'zion nnanyereugo',
    'alder',
    'nnanyereugo',
    '',
    'oak562',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    563,
    'zizzeh hosannah',
    'jss 1',
    'hosannah',
    '',
    'oak563',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    564,
    'zoe ukeje',
    'gorse',
    'ukeje',
    '',
    'oak564',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    565,
    'zoe wogu-moses',
    'aspen',
    'wogu-moses',
    '',
    'oak565',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );
INSERT INTO
  `oakcrest_international_college_students` (
    `id`,
    `name`,
    `class`,
    `guardian_name`,
    `guardian_id`,
    `adm_no`,
    `phone_number`,
    `address`,
    `discounts`,
    `status`,
    `created_at`
  )
VALUES
  (
    566,
    'zoweh koko',
    'alder',
    'koko',
    '',
    'oak566',
    '',
    '',
    'none',
    'active',
    '2023-07-31 12:45:23'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: oakcrest_international_college_users
# ------------------------------------------------------------

INSERT INTO
  `oakcrest_international_college_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    1,
    'oakcrest international college',
    'admin',
    'admin',
    '',
    1,
    '2023-08-01 13:58:05'
  );
INSERT INTO
  `oakcrest_international_college_users` (
    `id`,
    `school`,
    `user`,
    `password`,
    `last_login`,
    `status`,
    `created_at`
  )
VALUES
  (
    2,
    'oakcrest international college',
    'halima',
    'halimzy',
    '',
    0,
    '2023-08-04 04:43:32'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: oakcrest_international_college_wallets
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: school_cred
# ------------------------------------------------------------

INSERT INTO
  `school_cred` (
    `id`,
    `school`,
    `admin`,
    `status`,
    `date_of_pay`,
    `date_of_expiry`,
    `password`,
    `phone`,
    `email`,
    `custom_login`,
    `logo`
  )
VALUES
  (
    1,
    'oakcrest international college',
    'admin',
    '',
    '',
    '',
    'admin',
    '+2349030850218',
    'oakcrestinternationalschool@gmail.com',
    '/oakcrest-international-college',
    NOFORMAT_WRAP(
      "##X'ffd8ffe000104a46494600010100000100010000fffe003b43524541544f523a2067642d6a7065672076312e3020287573696e6720494a47204a50454720763632292c207175616c697479203d2032300affdb004300281c1e231e19282321232d2b28303c64413c37373c7b585d4964918099968f808c8aa0b4e6c3a0aadaad8a8cc8ffcbdaeef5ffffff9bc1fffffffaffe6fdfff8ffdb0043012b2d2d3c353c76414176f8a58ca5f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8ffc000110809320ae603012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00d9a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a298f3c51fdf9117ea6a07d4ad57f8cb7d01a00b545673eaf18fb9131fa9c542dabca7ee4683eb93401af456136a574dd1c2fd14542d753b7599ff00efaa00e8c900649c0a8dae605fbd320ff810ae70927a927eb49408df6d42d57fe5a8fc01351b6ab6c3a6f3f4158945006bb6af1ff0c4c7ea71519d60ff000c207d5ab328a00d03abcdda38c7d734c3aa5c9e9b07d0552a2802d9d4ae8ffcb4c7fc04530df5c9ff0096cdf8557a28026377707fe5b3ff00df5486e673d6693fefa351514c0799a53d647ffbe8d2798ffdf6fce9b45002ef6fef1fce8dcdea7f3a4a2801771f5346e6fef1fce928a0076f7fef37e7479b20fe36fce9b45004827987495ffefa34a2eae07fcb793fefa3515140138bcb91ff002d9ff3a70d42e87fcb53f88155a8a00b8353ba1fc60fd5453c6ad703aac67f03fe35428a40690d5e4fe2894fd0e29e3581de123e8d59545006caead01ea920fc0548ba9dab7572bf5535854500742b796cdd264fc4e2a55911feebab7d0e6b99a2803a8a2b9a59644fbb232fd0e2a55beb94e9331faf340ce828ac54d56e17a846fa8a99358fefc3f886a00d4a2a8a6ab6edf783afd454e97b6cfd265fc78fe74013d148acac32a411ec696800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a824bcb78fef4ab9f41cff2a009e8ace93578c7fab8d9bebc5569355b86fbbb53e833fce8036aa392e218fefca83db3cd73f25c4d27df959bdb3c547408db7d52dd7eeee7fa0ff1aaefac37fcb3880ff78e6b328a00b6fa95cbf470a3fd9155de6964fbf23b7d4d328a601451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450028254e4120fb54c97b729d266fc4e7f9d4145005f4d5a75fbca8df862ac26af19fbf132fd0e6b228a406fc77f6cfd2500ffb5c558565719560c3d41ae62955994e54907d41a00e9e8ac08efee63e92923fdae6acc7abb8ff0059103eea7140cd6a2a9c7a9db3f56287fda1569248e4194756fa1cd003a8a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a825bdb787ef4809f45e4d529757ed145f8b1fe9401a951c93c517fac9157d89e6b0e5bdb897ef4840f45e2abd023665d5a15ff56ace7f215524d5677fb81507b0c9aa345003e49a597fd648cdf534ca28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500140241c8383451401663bfb98fa4a48f46e6adc5ab9e92c43eaa6b2e8a406fc5a85b49ff2d369f46e2ac8218641047a8ae5e9f1cb244731bb29f63401d2d158b16ab3a70e1641efc1ab916ab03f0e1a33efc8a065ea29a92248328eac3d8e69d4005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051514d730c1feb2400fa77aa136afda18ff16ff0a00d4aaf35f5bc3f7a404fa2f358b35d4f3ffac9091e838150d0234e5d5d8f10c607bb735465b99a6ff592311e9d05454500145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a5009e809a004a29e2195ba46e7e8a69e2d2e0ff00cb193fef9a00868ab234fba3d223f89029e34cba3fc007d5852029d157c693707ab463f13fe14e1a449de541f4068033a8ad41a3facff92fff005eb308c123d280128a28a601451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145002ab329ca920fa8356e2d4ae23e19838ff006bfc6a9d1401b30eab0bf120319fcc55d8e44906637561ec6b99a5566439562a7d41a4074f456243a9cf1f0f8907bf5fceafc3a9c1270c4c67fdae9f9d032e5142b061952083dc514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051454535d4307fac700fa0e4d004b48cca8bb9d828f52715953eaced910a6d1fde6e4d509259256cc8e58fb9a00d79b5585388c190fe42b3e6d42e26e37ec5f45e2aad14083ad14514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2a6b7b59ae0feed78fef1e94010d15b10e931af32b963e83815692d2dd3eec29f88cd2039da5c1f4ae982aafdd007d052d0072f4574ec8adf7941fa8a85ecad9fac2bf80c7f2a00e7a8ad8934989bfd5bb21f7e4565dc426099a32c18af714011d6bd9595bcb6a923c796239e4fad6456ee96736283d091fad003c58db0e90afe34f16d00e90c7ff007c8a968a0634451af4451f414ea28a0028a28a0028a28a0028a28a002b9a986d9e41e8c47eb5d2d73b78317737fbe68110d14514c028a28a0028a28a0028a28a0028a28a0028a2b42cb4e328124d909d87734014e28249db11a16abd1690e799240bec066b55116350a8a1547614b486501a4c0072d21fc4529d26dffbd20fc47f855ea280331f475fe0988fa8aaf2699709ca8571fec9adba2803997468db6ba953e84629b5d33c6922ed750c3d08aa171a52364c0db4ff0074f4a046451524d0c9036d914a9fe751d300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2801f14d242731b953ec6afc3ab38c099030f55e0d66d1480e8a1bb827fb8e33fdd3c1a9ab97ab505fdc43801f72fa373401bd45518354864e240636f7e455d560c0152083dc503168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a090a0962001dcd51b8d5228f2221e637af414017aaa4fa8c10e403bdbd17fc6b267bc9ae3efbe17fba381505022e4fa94f2e429f2d7d17afe754faf5a28a60145145001451450014514500145145001451450014514500145145001451450014539119ce114b1f403356e2d32e24e58041fed1a00a5454b7309b79da32738efeb515001451450014515734eb5fb44bb9c7eed3afb9f4a0096c34ff340966184ecbeb5aeaa1400a0003a014514861451450014514500145145002330442cdd00c9ae6a473248ce7ab1cd6d6a92f97685475738ac3a0415b5a41cda1f673fd2b16b5f463fb8907a367f4a00d1a29a658d7aba8fa9a61b980759a3ff00be850325a2ab9beb61d665fc2a7560ca194e41190680168a28a0028a2ab5f5d35ac6acaa1b271cd0059a2b1ceaf3f648c7e07fc698754b93d0a8fa2d006dd606a2317d28f707f4a53a8dd1ff0096b8fa28aaf248d2b97762cc7a934086d14514c028a28a0028a28a0028a28a0028a29d1a1924545eac702802ee9b66267f3641f229e07a9ad9a6c51ac312c6bd14629d486145145001451450014514500145145003658d2442b2282bdf35ce4de5f9ade5676678cd69eab75b57c843c9fbc7dbd2b26810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a48a7961398dcaff2a8e8a00d48356e8274ff00812ff8568c534732e6370c3dab9aa5566460cac548ee0d203a7a2b1edf559130265de3d4706b4e0ba86e07eedc13fdd3d68192d1451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005148cc154b31000ea4d67dc6aa8995806f3fde3d28034199514b31000ee4d50b8d55132b08de7d4f4acb9a79676cc8e5bdbb0a8e8112cd732ce732393edd85454514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a9e2b3b89bee4671ea7815722d20f596403d97fc690199524504b31fddc6cdee0715b91585bc5d230c7d5b9ab1d0714018f16932b73232a0f41c9ab916996f1f2c0b9ff68d5ca28188a8a8308a147a018a5a28a00cad662c34728ee369accadfd422f36cdc775f987e158140828a28a6015d15a4220b644ef8cb7d6b0ecd3ccbb897b6ecd74548028a28a06145159fa9de34204519c330c93e82802d4d7704070f20cfa0e4d57fed5b7f47fcab168a046f47a8db3f1e66d3fed0c55a560c32a4107b8ae5ea48679606cc6e57f91a00b7ab4bbee4463a20fd4ff915429d23b49233b7563934da60145145001451450015d1599cda427fd815ced6fe9c736317d0ff003a4059a28a2818551d6066d14fa38fe46af553d5466c98fa1068030e8a28a620a28a2800a28a2800a28a2800a28a2800a28a2800abda4c7beef71e88b9fc6a8d6ae8abf2cadee052034e8a28a061451450054bdbe5b5c2a8dd21edd8565bea172e73e695f65e292f8b1bd97775ddfa557a045a4d42e50ffaccfb30cd5db7d5958859d761fef0e9591450074eac194329041e8454577702da02e796e8a3d4d635a5e3dab71f321eab497b726ea6ddc841c28a0081d8bb1663924e49a4a28a60145145001451450014a012700649ed566d2c64b9f9beec7fde3dfe95b16f6b15b8fddaf3dd8f5a406541a64f2e0be235f7ebf955d8b4a813efee73ee702af5140c892da04fbb0a0fc2a40a0740052d14008515baa83f51513da5bbfde853f018a9a8a00a12e9313731b321f7e45509ec2783276ef5f55e6b7a8a00e5e8adeb9b086e3240d8ff00de1fd6b1ee2d65b66c4838ecc3a1a044345145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a0120e41c1a28a00bd6fa9cd16049fbc5f7ebf9d69dbde4371f71be6fee9e0d73d474e9480ea28ac4b7d4e68b024fde2fbf5fceb52deee1b81f237cdfdd3c1a064f45145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451552e751860caafef1fd0741f8d005b240192700550b9d5238f2b08f31bd7b566dc5dcd707e76f97fba3a541408967b896e1b32393e83b0a8a8a29805145140051451400514514005145140051451400514514005145140051451400f842199049f70900d74115b430ff00ab8d41f5ea6b9cae8ed65f3ada37ee473f5a404b45145030a28a2800a28a2800a2a396e2287fd648abed9e6a9cbab44bc468ce7d4f02803408c8c1e95cdcf1f953bc7fdd38ab12ea5712701820ff0064554662cc598924f524d02128a28a605bd33fe3f93e87f956ed6069cdb6fa23ea48fd2b7e90c28a28a002b1756465bade7a301835b54c9a149e32922e47f2a00e6a8ad29748607314808f46e2abbe9d74bff2cf3f420d022ad152341327de89c7d54d474c028a28a0028a28a0028a28a002b774b39b151e848fd6b0ab6b4839b46f673fc85202f5145140c2ab6a233632fd07f3ab350de0dd6730ff00609a00e768a28a620a28a2800a28a2800a28a2800a28a2800a28a2800ad7d18feea41fed0ac8ad1d1e4db33c67f88647e1480d7a28a2818514514014750b133fef23ff00580723fbd58ccac8c55d4a91d8d74f51cd0453ae2440dfcc5007374569cfa4b0c981f3fecb7f8d67c913c4db6442a7de810ca28a29805145140051451400568e9f61e6e25987c9d97d6a2d3ad3ed126f71fbb5ebee7d2b73a74a400000300600a28a281851451400514514005145140051451400536454742b20054f5069d55f5093cab390f72368fc680301b05ced185cf02928a298828a2a7b283ed172a847ca396fa50041456dcfa643264c7fbb6f6e9f9566cf633c192cbb97fbcbc8a4056a28a2980514514005145140051451400514514005145140050090723ad145005eb6d4e58b0b2fef17d7bd6ac17315c2e636c9ee0f515ce52ab1560ca4823a11480e9e8ac8b6d55970b38dc3fbc3ad6a452c732ee8d830f6a063e8a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a29b2489126e9182afa9a007541717715b0f9db2dd9475acfbad519f2b00dabfde3d6b3c92c4924927b9a045ab9d426b8ca83b13d077fad54a28a60145145001451450014514500145145001451450014514e44691b6a2963e80500368abd16973bf2fb507b9c9ab0ba3a0fbd2b1fa0c5203268ad83a4438e24907d71504ba448a331c81fd8f14019d453e489e26db22953ef4ca601451450015afa3cb989e23fc2723f1ac8ab5a6cbe5de27a37ca6901bd45145030a28a28033eef52686568922f997bb1acf96fae25fbd2103d178ab3ac45b66490746183f5159d40828a28a6014514500145145003a3731c8ae3aa906ba65219430e411915cbd6d695702483ca27e64fd45202f5145140c28a28a0028a28a0029af14727df456fa8cd3a8a00a52e976f27dc0633edd2b3ae6c26b7cb637a7f7856f51401cbd15a9a8d80506684600e5947f3159740828a28a6015afa31fdcc83d1b35915a9a29ff005c3e9fd6901a945145030a64e330483d54ff002a7d046411eb401cbd14514c4145145001451450014514500145145001451450014f8a468a55917aa9cd328a00e9609967896443c1fd29f5cf5add496af95e54f553deb6edeea2b95ca37cddd4f514864d45145001451450014d92349576c8a187a1a7514019377a595cbdbe48fee1ebf85669183835d4551d42c44ca65886241d40fe2ffebd023168a28a6014e8d1a49151464b1c0a6d68e8f0ee95a62385e07d6901a9042b042b1af403afad3e8a28185145140050480324e00a64d3241199243803f5ac2babc92e5b93b53b28a00d49b538233852643fecf4fceaab6b0f9f962503dce6b368a0468aeaf267e68908f6245588b5585ce245643ebd456351401d3a3a48bb91830f50696b9b8679207dd1b107f435b5677a974b83f2c83aaff85032d565eb327fab887fbc7fa7f5ad4ac0bf93cdbc90f60768fc2802b514514c415b3a4c1e5c06523e67e9f4aca82233ce918fe23fa5746aa1542a8c00300520168a28a06569ec209f24aed6fef2f159b3e99345929fbc5f6ebf956dd417b3fd9ed99c1f98f0bf5a00e7ba514514c414514500145145001451450014514500145145001451450014f8e5789f746c54fb5328a00d6b6d555b0b70369fef0e95a4ac1802a4107a115cbd4d6f752db36636e3ba9e86901d151552d7508ae30a7e47f43dfe956e81851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051515c5cc56eb991b9ec075358f757f2dc6547c91ff007477fad005fbad4e38b2b161dfd7b0ac99a69277dd23163fcaa3a2810514514c028a28a0028a28a0028a28a0028a28a0028a2ac41653cf82a985fef3702802bd490dbcb39c4685bdfb56b41a5c31e0c87cc6f7e055e0028014000761480cd834951833be7fd95e9f9d68471244bb6340a3da9d45030a28a2800a28a280192c49326c91430f7ac5bdb16b63b972d19efe9f5adda4650ea558641e083401cc51562f6d8db4e57aa1e54d57a620a504a904751cd251401d344e25891c74600d3aa8e932efb5287aa1fd0ff9357a90c28a28a00a9a9c5e659b11d53e615855d3b28652a7a11835562d36da3e4a973fed1a00c448de43845663ec3356e2d2ee1f97db18f73cd6d2aaa8c28007a014b401462d2a04e642d21fc855a16f12c6c8a8aa1860e05494500730ea51d90f5538349573548bcbbb2c3a38cd53a620a7c32bc320910e08a651401d05ade4772bc1c3f753562b980482082411dc55c8753b88c6188907fb5d7f3a406dd159c9abc67efc4c3e873532ea76add5cafd54d032dd1512dd5bbfdd993f138a94104641c8a0028a28a0028a28a003ad73f7d07d9ee5947dd3cafd2ba0acdd663cc71c9e876d0064d14514c415a3a31fdf483d57fad6755fd20e2ed87aa1fe62901b345145030a28a2803999062461e84d36a5ba18ba947fb67f9d454c414514500145145001451450014514500145145001451450014a0907209047714945005e83549a3c093f78befd6b4a0bd827c057c37f75b835cfd1480ea28ac2b6d42683009de9e87fc6b62dee23b94dd19fa83d450325a28a2800a28a28031354804571bd46164e7f1ef54ab6b575cda86eead58b4082b7f4f8bcab38c7761b8fe35828bb9d54752715d38014003a0e2800a28a2818514557d425f26d1c8eadf28fc68032750b93713900feed785f7f7aab4514c4145145001451450014e4768dc3a1c30e41a6d1401bf1ddac964d3f00a8391ef5804e4e4d3d656489e307e57c647d29948028a29c88647545192c702981a7a3c180d391d7e55feb5a74c86310c4b1af4518a7d218514514005636ad3f9938881f953afd6b56e251040f21fe11fad738cc598b31c92724d002514514c41451450014514e44323aa28c96381400da2ac4f653c192c995fef2f22abd0014514500145145001451450014514500145145001576d752921c2c99913dfa8aa545007490cf1ce9ba3607d47715257331c8f1386462ac3b8ad5b5d515f093e15bfbdd8d219a34500e46474a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a86e2e62b65cc879eca3a9a0098900649c0159b77aa05ca5bf27fbe7a7e154aeaf65b938276a7651fd6ab5021ceed2316762cc7a934da28a6014514500145145001451450014514500145145001572df4d9a6019b0887b9ebf9553adbd2a7f32dfcb27e68f8fc3b5201f05841060eddedeadcd5aa28a061451450014515566d42de1e376f6f45e6802d51594dac1cfcb08c7bb54b0eab1b9c4aa63f7ce4500685140208041c83dc51400514514015b5083cfb56c0f993e615815d45739751f957322760dc7d28111514514c0bda4cbb2eb61e8e31f8d6d57331b98e4571d54835d2ab0650c3a11914862d14514005145140051451400514535e448c65dd547b9c50052d5e2dd6eb20ea879fa1ac6ad7bbd42dde1789773ee18c81c5645020a28a298051451400514514005392478ce51d94fb1c5368a00d3b4d4d8304b8e41fe3f4fad6ad72f5d159316b3889ebb690c9a8a28a002aa6a8b9b173e841fd6add55d4bfe3c24fc3f98a00c1a28a29882ae696717cbee0ff002aa75674f3b6fa23ee47e9480dfa28a281851451401cfdf0c5eca3fdacd57ab7a98c5f49ef8fe5552810514514c028a28a0028a28a0028a28a0028a28a002ad58da1ba90eec88d7a9150451b4d22c6832cc6ba1b7856de158d7a0ea7d4d20306ead9eda5dadc83f75bd6a1ae96685278ca48320fe9589776325b1271ba3fef0edf5a00ab45145300a9ad26305c2383c67047a8a86a6b484cf70880719c9f61401d1514514861451450053d54e2c9bdc8ac3ad8d65f10227f79b3f97ffaeb1e8113598cddc23fdb15d1573d64717917fbc2ba1a06145145001599acb7cb127a926b4eb2b5a1f3c47d8d0066514514c41451450014514500145145001451450015a3a441be56988e1381f5ace1c9c0ae8ad21fb3dba47df193f5a404d45145030a28a47711a33b701464d0065eb13e4ac00f4f99bfa56653e690cd2b48dd58e69940828a28a601451450015a3a441ba56988e1381f5ace032702ba2b487ecf6e91f7c64fd690135569ec209f276ec6f55e2acd140cc49f4c9e2c94fde2fb75fcaa91041c11835d454175041246cf320f9467777a0473d450719e3a514c028a28a0028a28a0028a28a0028a28a0028a28a00b36b7d2db1c03b93fba7fa56cdbdd4572b943cf753d4573b4aacc8c1949047422901d3d159b69aa06c25c707fbfdbf1ad2041191c8a061451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001453269a3810bc8c00fe758d79a84971955ca47e9dcfd6802e5e6a6b1e520c33776ec3fc6b25dda462cec598f5269b45020a28a298051451400514514005145140051451400514a012700127daa75b2b9652c226000cf3c50057a28a2800ab3613f9174ac4fcadf2b556a2803a8a2ab69f3f9f6aa49f997e5356690c28a28a00a9a9c6cf68c5091b79201ea2b0aba8201041e41ae72ea1305c3c7d81e3e94088a8a28a6069e9372771818e41e57dab56b9eb2245e458fef0ae8690c28a28a002b0f5518bd63ea01adcac2d4db75ebfb003f4a00a94514531056ee992f9966a0f54f94d61568e8f2ed99e33fc4323ea2901af45145030a28a2802396e6187fd648a0fa679fcaa94babc638890b1f53c0aa5a945e5de3fa37cc2aad022dcba8dcc9d1f60f45e2aab316396249f534945300a28a2800a28a2801c886491517ab1c0ad2b9d2b8dd6edff00016ff1a87498b7dcef238419fc6b6a901ccc91bc6db5d4a9f4229b5d33c6922ed750c3d08aa926976efcaee4fa1a00c4a2b5bfb1d7fe7b1ffbe6a48f4a814e5d99fdba0a00cbb6b67b9902a8e3bb7a57428a111517a28c0a44448d42a28551d853a81851451400551d5df6da85eecd57ab13559fcdb9d80fcb1f1f8f7a00a54514531054d6671770ff00be2a1a7c276cf19f4607f5a00e968a28a430a28a2803135618bccfaa8354ab43591fe9087fd8feb59f40828a28a60145145001451450014514500145156b4f589ae97cd2001c807b9a00d1d36d3c88fcc71fbc71f90abb45148614514500549f4d8252480636ff0067a7e5551b48901f925523dc62b5a8a00c94d21f3fbc9540ff006466b46deda2b65c463af527a9a968a0028a28a0028a2a3b8996085a46edd07a9a00c9d5a5df75b074418fc6a8d2bb1772cc7249c9a4a621f0bec991ff00bac0d74b5cbd745672f9b6b1bf7c60fd452026a28a2818550d5e2df6c1c7f01fd0ff009157e91d0488c8c321860d00731454b71035bccd1b76e87d45454c4145145001451450014514500145145005cd320f36e4311f2c7c9faf6adcaaba741e4daae47ccff31ab548614514500159fabcfb625841e5f93f4ad0a8e68229c62440dfce8039ba2b4e7d248c981f3fecb7f8d67cb1490b6d910a9f7a04328a28a60145145005cd320f36e4311f2c7cfe3dab72aae9d07936ab91f33fcc6ad521851451400567eaf3ed89610797e4fd2b409c0c9ae76ee6fb45c3c9db381f4a00868a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ab5697d25b1c7de8ff00ba7fa555a2803a382e23b84dd1b67d477152d7331c8f13878d8ab0ee2b62cf5149b092e124f5ec690cbd45145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145141200c9e05001556eefa3b61b47cd27f77d3eb556f353eb1db9fabff85659249c9392681124d3c93bef91b27f95474514c028a28a0028a28a0028a28a0028a28a0028a3ad6a59e999c49703e89fe3480a305acb707f76bc7763d056941a546b8333173e83815a0aa154050001d00a2818d8e28e2188d1547b0a751450062ea76be4cbe620f91ff43546ba59a259e268dfa11f9573b344d0cad1bf5534086514514c0bba5cfe55cec27e5938fc7b56dd72e090411c115d1dacc27b7493b91cfd69012d145140c2b3b5783746b301caf07e95a34d910491b23746183401ccd152341209da20a59c1c600abd6da53121ae0e07f7475a043749b72f379c47ca9d3dcd6c5222aa28550028e8052d030a28a2801b23ac71b3b1c051935cdc8e64919cf5639abfa9de090f9319ca03f311dcd675020a28a298054b6d2f93711c9d81e7e95151401d4515058cbe6da46ddc0c1fc2a7a430a28a28033b588b31a4a3f84e0d64574775179d6d2277238fad624565712fdd8c81eadc5022bd15a91691de597f051fd6ae45656f17dd8c13eadcd0062456f34dfeae366f7c715722d2646e657541e83935af450339cb987c8b878faed3c7d2a2ad2d622c48928fe21835422432caa83ab1c5023674b8bcbb40c7ab9cfe1daae522a8550a3a01814b40c28a28a0028a28a0028a28a0028a2aa5ddfc76e0aa61e4f4ec3eb400b7f762da2c03fbc6fba3d3deb049c9c9eb4e924795cbb9cb1ef4da04145145300a507041f4a4a2803a8a2b9e37b7247fae6fc29a6e673d6693fefa3486747412075207d6b993239eaec7ea69b408d2d61959e22ac0f041c1acda28a6014514500145145001451450014514500145145006859ea4d1e127cb2766ee2b591d6450c8c194f715ccd490cf240dba372bea3b1a407494566c1ab21c09d769fef2f22afc734728cc6eadf4340c7d1451400514514005145559efe08411bb7b7a2f34016599514b310147526b0afeecdcc985e235e83d7de9b75792dc9f98e10745155e810514514c02b4f479f0cd013d7e65feb5994e8dda2915d4e194e45203a6a2a382659e15917a1ede9525030a28a2802bde5a2dd4783c38fbad587343240e5245c1fe75d253258a39936c8a187bd00735456acda4739864c7b37f8d547d3ae97fe59e7e845022ad156058dc93fea5bf1a9a3d2a763f39541f5c9a00a34743cd6dada43650bcb8dcea3219bd6b13a9a002ac58c1e7dcaa91f28e5be955eb6b4983cbb73211f33ff2a00bd45145030a28a2800a28a2800a47459176ba861e8452d14019f3e951b64c2db0fa1e4566cf6b35b9fde2103fbc3915d15046460d0072f562c60f3ee9548f9472df4ad49f4d825c951e5b7aaf4fca9d6167f6557dc43331ea3d28116a8a28a061451450053d4e7f2ad8a83f349c7e1deb0ead6a33f9d74d83f2a7ca2aad020a28a298051451400514514005145140051451400514514005145140051451400514514017ecf5268b0936593b1ee2b611d6440c8c194f422b98a9edaea4b67ca1ca9eaa7a1a4074345436d751dca650e187553d454d40c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2a0babb8ed532dcb1e8a3bd00492ca90a17918002b16f2fdee4955cac7e9ebf5a86e2e24b87dd21fa0ec2a2a04145145300a28a2800a28a2800a28a2800a28a2800a3ad15a7a55a67fd2241fee0feb4809b4fb010812ca3321e83fbbff00d7abf45140c28a28a0028a28a002a8ea76be6c5e6a0f9d073ee2aeb32afde603ea690488c70aea7e8680399a2ae6a36bf679b728fddbf23d8fa553a620ad1d227db23424f0dc8fad6753a3731c8aebd54e45203a6a29b1482589645e8c334ea06145145000000490064f53eb451450014514500154f5117262c4032a7ef63ef55ca2803972307068ae86e2ce1b81975c37f7875ac9b9d3e6832c06f4f51fe1408a945145300a28a2803534697fd6447fde1fd7fa56a573f612f95771b762707f1ae8290c28a28a0028a28a0028a28a0028a28a00aba945e6d9be3aafcc2b091d9183212ac3a115d39018107907835cd4d198a5743fc248a045e835675e2640e3d4706afc57d6f2f49029f46e2b9fa2803a80411907228ae655dd0e51997e871528bcb95e933fe273401d0d1581f6fbaff9ec7f214c6bbb86eb33fe07140ce859d50659828f52715566d4ade3fbac5cfa2ff8d61962c724927de9281172e3529a6caafeed7d075fcea9d145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a0120e45145004e979731fdd99bf1e7f9d4cbaa5c8ea51bea2a951480bffdad71fdc8ff0023fe34c6d4ee5ba32afd16a9d14012497134bfeb24661e84f151d145300a28a2800a28a2800a28a2802e69f77f66936b9fddb75f6f7adc041190720d72f5a1a7dff9588a53f2763fddff00eb5203628a0104641c8345030a28a2800a28a2800a28a280286af26db6083ab9fd07f9158d57b56937dd6c1d1063f1aa340892de233ce918fe23cfd2ba4550aa140c0030056668f0615a723afcabfd6b4e818514514005417b3fd9ed9981f98f0bf5a9eb1b569fccb81183f2a7f3a00483549a3c093f78befd6b4a0bd827c057c37f75b835cfd1408ea28ac182fe7830376f5f46e6b4a0d4e09701ff0076defd3f3a065ca280411907228a0028a28a0028a28a002a0be9fc8b56607e63c2fd6a7ac6d567f32e0460fcb1ff003a00a14514531051451400514559b7b19e7c10bb57fbcdc50056a2b662d2615e646673e9d055a4b5823fbb0a7e233480e728c575000030001450072f45748f6f0bfde890ff00c06ab4ba5dbbfdcdc87d8e450062515767d3278b940245ff0067afe5548820e0f0698051451400514514005145140051451400e4768dc3a31561d08ad8b2d4167c24b8593f4358b45203a8a2b26cb522b88ee0e57b3fa7d6b58104020e41ee281851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514565df6a5d62b73f571fd28027bdd4160ca478693f45ac677691cb392cc7a934da2810514514c028a28a0028a28a0028a28a0028a28a0028a28a0096d603713ac63a1ea7d05744aa1542a8c00300567e910ed89a62396381f4ad1a430a28a2800a28aced46f8c64c309f9bf89876f6a009aeb508adf2a3e793d076fad65cd7f7131fbe547a2f155a8a040492724e4d14514c07798e5361762be84f14da28a0028a28a00d6d1e7ca3424f23e65fa56957396f31827490763cfd2ba30432820e41e41a430a28a2800a42ca18292013d07ad2d57be87cfb660bf7d7e65fad0058a2b22d35464c24f965fef7715aa8eb2206460ca7b8a007514514005145140152e74f867cb01b1fd47f85655c59cd6e72eb95fef0e95d05046460f4a00e5e8adab9d323972d17eedbd3b1aca9ede5b76c48a47a1ec6811157496f279d6e927f7873f5ae6eb634797742f19eaa723e86803428a28a061452332a0cb3051ea4e2aacba95bc7c062e7fd914016e8ac7975695b88d1507a9e4d5396e259bfd648cded9e2803725beb78bac809f45e6a9cbabf68a3fc58ff004acba28113cb7b712fde9081e838a828a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514016ecefe4b6f94fcf1fa7a7d2b660b88ae17746c0fa8ee2b9ba5566460c8c548ee0d203a7a2b1e0d5654e2550e3d7a1abd16a36d27f1ec3e8c3140cb54522ba38ca32b7d0e696800a0900127a0a2ab6a3279566e7bb7ca3f1a00c395ccb2bb9fe224d222191d517ab1c0a6d68e9106e95a62384e07d6811ab1462289635e8a314ea28a0614514500477128820790ff08e3eb5ce331662cc7249c935a5ac4f965801e9f337f4acca04145145300a28a2802682ea680feedc81e87a569daea6b2bac7221572700af20d63568e9106e95a62384e07d6901af45145030a28a28023b8944103c87f8471f5ae7189662c4e493926b4b589f2cb003d3e66fe959940828a28a60152430c93bec8d727f95496968f7526070a3ef37a56e430c70461235c0fd4d202bdae9d141867c3bfa9e82ae5145030a28a2800a28a2800a28a2800a82e2d21b81f3ae1bfbc3ad4f4500605d58cb6c727e64fef0feb55aba8201182320d655f69bb7325b8e3ba7f85023328a28a60145145001451450014514500156ecef9ed8ed6cb47e9e9f4aa9450074d14a932078d8329a7573b6d7325b3ee43c1eaa7a1adcb6b98ee63dc879eea7a8a4326a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a4660aa5988007526924912242eed851deb0ef2f5ee5b03e58c745f5fad004b7da819b31c5911f73ddaa8514531051451400514514005145140051451400514514005145140051454d689beea25edb85006fc11f950247fdd18a7d1452185145140105e4ff0067b767fe2e8bf5ae7c924924e49ea6b47599332471f6037566d020a28a298051451400514514005145140056d6953f996fe593f347c7e158b562c67f22e9589f94f0df4a4074145145030a28a2803075083c8ba6c0f95be615141712dbbee8db1ea3b1ad7d520f36db781f347cfe1deb0e811bb697f15c614fc927f74f7fa55bae5eb42d35378f09365d3d7b8ff1a00d8a29b1c892a078d8329ee29d40c28a28a00291955d4ab0041ea0d2492244bba460a3dcd67cfab28c881771fef374a004bad2d305e16098eaac78fceaae9f30b7bbf9d80520827b54335c4b39cc8e4fb76a8a811b32eab0a711ab39fc85539754b87e17083d87354a8a0073c8f21cbb163ea4e69b4514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029e2590749187d0d328a007f9d29ff0096afff007d1a69666ea49fa9a4a2800ae8ace2586d515483c6491dcd73b5243712c0731b95f6ed480e928acd835653813a63fda5e9f9568472a4abba370c3da818ea47711a33b7451934b59dabcfb625841e5f93f4a00cb96432cad2375639a651453105145140051451400019381d6ba3b587c8b748fb8193f5ac9d2e0f36e4391f2c7cfe3dab6e9005145140c291dc468cedd1464d2d676af3ed89610796e4fd28032e590cb2b48dd58e6994514c4152db40d71308d7f13e82a2aded3edbecf00c8f9db96ff0a404f0c490c62341803f5a7d145030a28a2800a28a64b34708cc8e17eb400fa2a8beab6ea7e50edf418a67f6bc7ff3c9bf3a00d1a2a9c7a9db39c12c9fef0ab6aeaebb91830f5073400b451450014514500666a56390678473d59477f7acaaea2b1752b4f224f3107eedcfe46811468a28a6014514500145145001451450014f8a578640f1b6185328a00dfb3bd4ba5c7dd90755ff000ab35cc2b3230652411d08adab1bf13811c98127e8d4865da28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a8e79d2de32f21c0f4f5a4b9b94b68f7b9e7b0ee6b06e2e24b9937b9fa0ec2801d7574f74f96e14745f4a828a298828a28a0028a28a0028a28a0028a28a002af58e9ed3e24972b1f6f56a9ac74de925c0fa21feb5a9480e7ef9552f24550028c600fa557ab3a87fc7f4bf51fcaab500145145300ab5a60cdf47f8ff23556ad69a717d1fe3fca901bd45145030a28a28030f55ff8fd6fa0aa75a1ac262e11fb32e3f1159f40828a28a601451450014514500145156f4d8c4978b919500922802a51562f6d8db4e57f80f2a7daabd006fe9f3f9f6ab93f32fca6acd626973f9573b09f964e3f1ed5b7486145145000402307906b9dba87c8b878fb03c7d2ba2aced5e0dd12cc072bc1fa50064514514c4490cf240fba36c1ee3b1ad8b4d4639f0aff00249e87a1fa561d1480e8e6b98601fbc700fa77ace9f5676c881768fef1e4d669249c9a2801cf23c8db9d8b1f5269b4514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2a44b79a4fb9139f7c50047455b4d32e5baa05fa9a9d34773f7e551f419a4066d15b0ba4423ef3bb7d302a65d3ad57fe59e7ea4d0060d2804f419ae896da05fbb0a0ff00808a94000600007b500736b6f337dd89cffc04d48b6174dd216fc702ba0a28198634cba3d5547d5853c69339eaf18fc4ff00856cd14019234893bcaa3e829c347f59ff00f1dffebd6a514019a3475ef31ffbe6946911f795ff002ad1a28033ff00b221ff009e927e94bfd9107f7e4fcc7f855fa280287f6441fdf93f31fe147f6441fdf93f31fe157e8a00cffec88bb48ffa534e8e9da56fcab4a8a00cc3a38ed39ffbe7ff00af4d3a3b76981faad6ad14018e7489bb489fad35b4ab91d361fa1adaa280304e9d743fe59e7e8c2a336770bd617fc066ba2a28039968dd7ef230fa8a6d7514d68a37fbc8adf519a0473345742d656cfd615fc38fe550b6976cdd03afd0ff008d0062515aada3aff04c47d56a17d2671f7591bf1c50050a2ac3d8dca75858fd39fe55032b29c32907dc530128a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029c8ef1b6e462a7d41a6d1401a306aceb8132ef1ea383552ea637170d2763d3e950d148028a28a60145145001451562c60f3ee9548f9472df4a00d7d3e0f22d5723e66f98d59a28a430a28a2800240193d2b9dba9bcfb8793b13c7d2b5b549fcab6d80fcd271f877ac3a04145145302de9b079d74091f2a7cc7fa56ed52d2a2d96bbfbb9cfe157690c28a28a0028a2b2f54bc209b78cff00be47f2a005bcd4f04c76ff008bff008565b333b1662493d49a4a2810514514c02a48669206dd1b153fcea3a280372cb504b8f91f0b27a763f4ab95cb8241c83822b734ebbfb447b5cfef17afb8f5a432e514514005327896785a36e8c3f2a7d1401ccba18dd91860a9c1a6d686af0ec9d641d1c73f5159f4c41451450014514500145145001451450014038391d68a28035ec350df88a73f3740deb5a35cbd6a586a18c4539e3a2b9feb480d4a28a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400541757496b1ee6e58fdd5f5a2eeed2d63c9e5cfdd5ac196579a42f21c93400b3ccf3c85e4393fcaa3a28a620a28a2800a28a2800a28a2800a28a28015119d82a0258f402b6acb4f58312498693f45a96d2ce3b55e3e673d5aac52185145140181a87fc7f4bf51fcaab559d43fe3fa5fa8fe555a810514514c02a5b67f2ee6373d030cd4545007514543692f9d6d1bf72307eb53521851451401575183cfb53b47cc9f30ac1aea2b1752b430c9e620fddb1fc8d0228d14514c028a28a0028a28a002b634983644d2b0e5fa7d2a8595a35ccbcf11afde3fd2b7c00a00030070052020bcb6173015fe21ca9f7ae7d81562ac304704574f597ab5ae3fd2107b3ff8d0332c1c1c8eb5d1dacc27b7493b91cfd6b9cad1d227db2b424f0dc8fad0235e8a29b248912ee91828f526818ea6caaad132be3691839acf9f56519102ee3fde6e959d35c4b39cc8e4fb76a008dd76bb2820e0e323bd251453105145140051451400514514005145140051451400514514005145140051451400514aa8ce708a58fa019ab5169b732755083fda3401528ad68f4841feb2427d9462adc7656d1fdd8949f56e690182914921c22337d066acc7a65cbf55083fda35b80003038145033323d1c7fcb497f05156134db64ea858ff00b46add1400c48628fee46abf414fa28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028201182011ef45140103d95b49f7a15fc38fe555df4985bee33a9fcc55fa28031e4d2655fb8eadf5e0d5692cee23fbd1363d473fcaba1a280397e9d68ae9648a397fd622b7d4556934bb77fba190fb1a0461d15a3269120e63915bd8f06aa4b6b3c5f7e2603d7a8a00868a28a60145145001451450014514500145145001451450014514500145145001451450015b5a541e5dbf9847cd273f8562d6adb6aa81424a9b71c02bd3f2a4069d14d8e44957746c187b1a75030a28aaf7d3f916acc0fcc785fad0064ea13f9f74d83f2afca2aad14531051453a31ba441ea40a00e8e14f2e144feea814fa28a430a28a28023b8944303c87f847eb5ce331662cc7249c935b1ac3e2d957fbcd58d40828a28a601451450014514500152db4c609d241d8f3ee2a2a2803a8041191d0d155ec1fccb2889f4c7e5c558a430a28a28029eab1efb32ddd083fd2b0eba2bb5dd6928ff609ae76810514514c028a28a0028a28a0028a28a0028a28a0028a28a00d1b0d43cbc4531f93a2b1ed5afd6b97ad0b0bf311114a731f63fddffeb5203628a0104647228a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500155ef2ed2d63c9e5cfdd5a2eeed2d63c9e5cfdd5ac296579a42ee72c680096579a42ee72c6994514c4145145001451450014514500145145001451450074e8728a7d452d321398233fec8fe54fa430a28a28030350ff008fe97ea3f9556ab3a87fc7f4bf51fcaab5020a28a298051451401a5a44f876818fdee57eb5ad5cca3b46eaea70ca722ba1b69d6e215917bf51e8690c968a28a00291d55d4ab0054f506968a00c6bbd35e225e105d3d3b8aa15d45432dac137324609f51c1a0473b456d36936e7a3483f1142e936e3ab487f114018b57ad74d92521a5ca27ea6b562b5861e638c03ebd4d4b400d8e348902228551da9d45140c291943a9561904608a5a28039ebbb736d3943f77aa9f515146e637575eaa722b5358923d89191993391ec2b26811a33eacec310a6cf73c9aa1248f236e762c7d49a6d1400514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a7c714929c468cc7d855d874995b995c20f41c9a4067d491412cc711c6cdf415b50e9f6f173b379f56e6ad0000c01814018f16932b7323aa0f41c9abb169b6f1f552e7fda356e8a0622a2a0c22851e8062968a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802296d609befc4a4faf4354a5d210f314857d9b9ad2a2803065d3ee62fe0dc3d579aaa41070460d7514c9608a61892356fa8a04735456bcda4c6dcc4e50fa1e45519ac2e21e4a6e1eabcd0056a28a2980514514005145140051451400514514005145140051451400e491e36dc8c54fa835a106aceb813aee1fde1c1acda2901d1c3730ce3f76e09f4ef595aacfe65c7960fcb1f1f8d5104839070694924924e49ea4d002514514c029f09c4d19ff687f3a65283820fa50074f450086008e879a290c28a28a00cdd67fd5c5f535935b7ab26eb4dc3f8181fe958940828a28a601451450014514500145145006e695ff1e4bf53572a0b04f2ece207ae33f9f353d21851451400c9ff00d449fee9fe55cd57477476daca7fd83fcab9ca04145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802fe9f7e6122294e63ec7fbbffd6ad9041190720d72f57f4fbff2488a53fbb3d0ff0077ff00ad480d9a28072323a5140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a0bbba4b58f7372c7eeafad3ae6e12da2defd7b0f535813ccf3ca6473927f4a00496579a42ee72c6994514c41451450014514500145145001452aa9760aa0927a015af6ba622a1338dccc3a7f77ff00af480c7a2a7bbb66b694a372a7ee9f51505300a28a2803a4b6e6d623fec0fe5525436673670ffba2a6a430a28a28030350ff008fe97ea3f9556ab3a87fc7f4bf51fcaab5020a28a29805145140055ab1bb36d2f3cc6df787f5aab4500750a432865390790451589617c6dcf97264c47ff1dada560ea194820f42290c5a28a2800a28a2800a28a2800a28a2800a28a2800a82eee96d62dc7963f757d692eef23b54e7973d16b0a699e790bc8724fe9400923b4ae5dce589c934da28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a92282499b11a16fa500474a01270064d69c1a4f433bffc057fc6b421b78a0188d02fbf7a4063c3a6cf2f2c3cb5ff006bafe557e1d3208f97cc87dfa7e55768a0622a851850001d852d14500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004535b433ffac8c13ebd0d509b48ef0c9ff016ff001ad4a28039c9ade580e2442befdaa2aea0804608c8aa73e9b04b92a3cb6f55e9f950230e8ab73e9d3c3c81e62faaff008554e94c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00e86c64f32ce33dc0c1fc38a9eb2f479befc24ff00b43fad6a521851451400d910491b2374618ae7258da291a36eaa715d2d51d46cbcf5f3231fbc51d3fbc2803168a0820e0f068a620a28a2800a28a2800a9ad2037170a9dbab7d2a2552cc154124f000adeb1b416d173cc8df78ff004a4059e83028a28a061451450054d4df65930eec40ac2ad2d625cc8910fe119359b40828a28a60145145001451450014514500145145001451450014514500145145006869f7de51114a7e4ec7fbbffd6ad8ae5eb4b4ebed988663f2f4563dbda901ad45145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a8e79d2de22ee781d07ad3a591228cbb9c28ac0bbb97ba977370a3eeafa50036e277b894bb9fa0f4151514531051451400514514005145140053e185e790246b927f4a92d6d64b97c20c28eac7a0adcb7b78eda3db18fa9ee69011d9d925aae7ef487ab7f8559a28a0645736e9731146fc0fa1ae7e689e190c6e304574b55afad05d47c7122fdd3fd2803028a5652ac558608e083494c4741a79cd945f4ab155b4de6c22fc7f99ab348614514500606a1ff1fd2fd47f2aad56750ff8fe97ea3f9556a04145145300a28a2800a28a2800ab16b7925b1f94ee4eea6abd1401d05bde437030ad86fee9eb562b97ab50ea1710f1bb7afa373480dea2b363d5d0ff00ac8987fba73561751b56ff009698fa8340cb545402f6d8ff00cb64fce90df5b0eb32fe1cd0058a2a93ea96cbf74b3fd07f8d55975791b88a30bee793401accca8a59d8281dc9acdbad540cadb8c9fef9fe959b2cd24cd991cb1f7a650215999d8b31249ea4d25145300a28a2800a28a2800a28a2800a28a2800a28ab36f633cf82176aff0079a802b54f059cd71f7130bfde3c0ad6b7d3a087058798deadd3f2ab7480a1069714783293237a741579555400a0003b014b45030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a867b58671fbc419fef0e0d4d450063cfa5489930b6f1e878354191918aba9523b115d3d3258639976c88187bd007354569dc692465a06cff00b2dfe359d246f136d752a7d0d021b45145300a28a2800a28a2800a28a2800a28a2800a28a2802482568665917aa9ae8a37592357539561915ccd6869777e5b79321f918fca7d0d203628a28a061451450054bcb04b8f997e493d7b1fad63cf6d2db9c48840f5ec6ba3a0804608c8a00e5e8ae81ec6da43931007db8a8ffb32db3f75bfefaa0461d4d05a4d707e4438fef1e056dc7676f1f2b12e7df9fe753d0055b4b18ed867ef49ddbfc2ad5145030a28a2800a47758d19d8e028c9a5acbd5aeb3fe8e87ddffc28033a694cd33c8dd58e6994514c4145152c36f2ce7f7684fbf6a008a8ad48b48ef349f82ff8d5b4d3ed93fe59ee3eac73480c0a2ba41042bd2241ff000114a6188f58d3fef91401cd515d13d9dbbf5853f018aad2e950b7fab6643f98a00c6a2adcfa6cf1720798beabfe155298051451400514514005145140051451401aba6df67104c79e8ac7f9569d72f5b1a75f79a04329f9c7427f8a901a145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a46608a598e00e4934b58ba8def9ede5c67f763bff78d00477d766ea4c0e235fba3fad55a28a620a28a2800a28a2800a28a2800a28a2802d58dd9b5979e636fbc3fad6eab0750ca720f208ae62afe9b7be4b79521fdd9e87fba6901b345145030a28a280286a565e72f9b18fde0ea3fbc2b1aba8acad4ecb6933c438fe203b7bd022d6967362bec4ff3ab754b493fe87f463576818514514018f7d673bdcc922465949e307daa8bc5247f7d197ea315d351401cbd15d1bdb4127de890fbe2a07d2ed9ba064fa1ff001a0461d15a8fa3ff00726fc18540fa5dcaf40aff0043fe34014a8a95eda78fef44e3df1515300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a9eded26b83f22fcbfde3d28020ab36f6335c6085da9fde6ad3b6d3a1870cffbc7f53d07e157290156df4f860c1237bfab7f855aa28a06145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514d2ea3bd003a8a8ccc3b02690cc7b014012d1501918f7a69627a9340ae59240ea4534ba8ee2abd1405c9fcd5f7a4f387606a1a28025f3bfd9a4f39bd0547450049e6b7b52798feb4ca2801de637ad2876c8e4d3294751401668a28a06145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014d9628e65db22861ef4ea28032ae349232d6ed9ff65bfc6b39d1e362aea548ec6ba6a64b0c732ed91030fe5401cd515a373a53a65a03b87f74f5acf652ac430208ea0d02128a28a60145145001451450014514500145145006b69d7fb808663f374563dfdab4ab97ad2b2d4b6e23b8391d9fd3eb480d6a280430041041e845140c28a28a0028a28a0028a28a0028a28a0028a2aade5ea5b2e061a43d17fc6800bebb16d1e073237dd1e9ef584496249392792696491a572ee72c7a9a6d020a7c71bcae12352cc7b0a7db5b3dcc9b53a773e95bb6f6f1db47b507d4f7340152d74b44c34ff3b7f77b0ff1ad00028000000ec28a2818514514005145140051451400557b9b286e46586d7fef0eb5628a00e7ae6d25b66f9c654f461d0d415d3ba2ba95700a9ea0d62df581b72648f263ff00d068114a8a28a60145145001451450014a0904107047434945006e585e8b84d8e712af5f7f7ab95cca3b46e1d0e18720d6f59dd2dd459e8e3ef0a432c514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514551d46f7c84f2e33fbc61d7fba28021d4ef7ac111ff7c8fe559745140828a28a6014514500145145001451450014514500145145006ae997b902094f3fc04ff2ad3ae5c1c1c8adcd3ef3ed09b1cfef17f51eb480b945145030a080460f228a28022b7816dd5953ee96dc07a54b45140051451400514514005145140051451400535e28e4fbe8adf519a75140155f4eb57ff967b4ff00b271503e9119fb92b2fd466b468a00c67d2661f7191bf4aad35a4f00dd24781eb9cd6edcdcc76d1ee73cf603a9ac2b9ba92e5f739c01d14741408868a28a601451450014514500145145001451450014514a012400324f6140094f8a19267db1a963fcaaf5ae96cf869ced1fdd1d6b5638d224db1a851e8290146db4b44c34e77b7f74741fe35a000000030076145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a290b28ea680168a8ccc3b0a61918f7c7d28027240ea69a6451df3f4a8339eb4940ae4a66f41f9d34c8c7bd328a005249eb49451400514514005145140051451400514514005145140051451400528ea29294751401668a28a06145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001515c5ac570b89179ecc3a8a968a00c4b9d3a5872c9fbc4f51d47e154aba8aa975a7c571960363fa8eff5a046151535c5acb6cd89178ecc3a1a869805145140051451400514514005145140162daf25b63f29caf753d2b5edafa1b8c0076bff0075ab028a407514560417f710e007dcbe8dcd5d8f5743feb63607d579a066951559750b56ff0096b8fa8229e2eedcff00cb68ff00efaa009a8a81af6d97accbf87350c9aadbafdddcff00418fe7401769af2246bb9d828f526b265d5a56e234541ea79354a495e56dd23963ee680346eb55ce52dc7fc0cff4acc24b1258924f526928a04152410b4f288d0727f4a8eb734db5f221dec3f78fc9f61e940162de04b788220fa9f53525145030a28a2800a28a46655196200f52680168aacfa85aa71e664ffb2334c1aa5b7ab0ff0080d005ca2a08ef6de43859573efc7f3a9e800a28a2800a0804104641ed45140189a8597d9dbcc8c7ee8ffe3b54aba7745910a30ca91822b9fbbb736d3143ca9e54fa8a044145145300a28a2800a28a2800a92099e094488791dbd6a3a2803a4b79d2e2212277ea3d0d495cfd9dd35acbb87287ef0f5adf4759103a1ca9190690c5a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a64d2a411191ce00fd68022bcba5b58b3d5cfdd1580eecee598e589c93525c4ef712991fbf41e82a2a04145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a723b46e1d0e18720d368a00e86cee96ea2dc3871f787a54f5cddbcef6f28910f4ea3d4574104c93c42443c1fd290c928a28a0028a28a00acf7d0c5298e5dc847a8e0d4b1cf0c9f72456f6079a8ef6d16ea2c7471f74d603ab23156186070450074f457371dc4d1fdc95c7b66aca6a970bf7b6bfd47f85006dd159b1eaea7fd64447ba9cd588f51b67ff00969b4fa30c5005aa2911d1c6519587b1cd2d00145145001556f2f52d9703e690f45f4fad457da888b31c2417ee7b0ac7662cc598924f526801d2caf3485e46cb1a6514531051451400514514005145140051451400514a88cec1514b31e8056ada696170f71c9fee0e9f8d2028db594b7272a36a7763d2b66dace2b61f28cb7763d6a70000001803b5140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28240ea714005151b4a07419a6348c7bfe540131655ea69866f41f9d4345021c5d8f534da28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2801194329560083d41acdbad2fabdbff00df07fa569d1401cc32b231560411d41a4ae8ae2d62b95c48bcf661d45635d58cb6c727e64fef0feb408ad45145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802d69f079f74a08f957e635bd543488b65b190f573fa0ff0026afd21851451400514567ea778631e4c670e47cc7d05002de6a4b09290e19fb9ec2b2659a499b748e58fbd328a04145145300a9edef26b73f23657fba7a541450074169791dd2fcbf2b8eaa6ac57328ed1b8742430e86b7acee85d43bba38e185219628a28a002ab5fdbfda2dc803e75e57fc2acd1401cbd156b5187c9bb6c0f95be6155698828a28a0028a28a0028a28a002af69d79e43f9721fddb1ff00be4d51a2803a8a2b334bbcc81048791f709fe55a748614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450004800927007535857f766e65c2ff00ab5e83d7deac6a979926de33c7f19fe959940828a28a6014514500145145001451450014514500145145001451450014514500145145001562cae9ad65cf543f78557a2803a7475740ca72a790696b174ebdf21fcb90feed8ffdf26b6a90c28a28a002a8ea365e7af9918fde28e9fde157a8a00e5e8ad4d4ecbacf10ff007c0fe759740828a28a600090720e0d4e97b731fdd99bf1e7f9d4145006847ab4cbf7d11bf4345cea8f2c7b23531e7a9cf359f45200a28a2980514514005145140051451400514528058800124f4028012acdad94b727206d4eec6add9e99d1ee3f04ff001ad40000000001d852021b7b58ad9711af3dd8f53535145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a6348a3a726801f48ceabd4d42d2337b0a6502b9234a4f4e298493d6928a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a080460f228a280336ef4b0d97b7e0ff73b1fa56532b231560411d41ae9ea1b9b48ae570e30c3a30ea28039da2a7bab492d9be61953d1874350531051451400514514005145140051451400514514005145140051452a8dce07a9c5007476c9e5db469e8a2a4a28a430a28a280193482185e43d1466b9c77691d9d8e4b1c9ad8d5df6da851fc4d58b40828a28a6014514500145145001562ca736f72ad9f94f0df4aaf4500751454366fe65a44c7aedc1a9a90c28a28a00cfd623cc29277538fc0d63d741a82eeb2947a0cfe55cfd020a28a29805145140051451400514514000241041c115bd61762e62c31fde2f5f7f7ac1a7c32b412ac88791fad203a5a2a3b7996e22122743d47a1a9281851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400554d42efecd16d53fbc6e9edef53cf32c11348fd076f5ae7a695a795a473c9fd28018793934514531051451400514514005145140056b5969c862df70b92dd17d0545a659f98c26907c83ee83dcd6bd203365d214f30c847b3735466b1b887ac6587aaf35d05140ce5e8ae8e5b6866ff591a93ebdff003aa52e90a7986423d9b9a0464d15665b1b88bac6587aaf355a98051451400514514005145140056a6997bd2094ff00b84ff2acba2901d4515474ebdf3d7cb90fef1475fef0abd40c28a28a002b1751b2f21fcc8c7eed8ffdf26b6a91d55d0ab0ca9182280398a2acdedab5acb8ea87ee9aad4c414514500145145001451450014514500145145001451572cec1ee0866cac7ebdcfd2802082de4b87db1ae7d4f615b569651db0c8f9a4eec7fa54d14490a048d42a8a7d21851451400514514005145140051451400514514005145140051451400514531a503a726801f4c6940e9c9a899cb7534da04399d9ba9a6d1450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014a3a8a4a51d450059a28a28185145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514008caaea558020f506b26f34d2997832cbdd7b8ad7a280397a2b6ef34f49f2f1e164fd0d63491bc4e51d4ab0ec6810da28a29805145140051451400514514005145140053e2ff5c9fef0a65283820fa50074f450082011d0d148614514500666b5f722fa9acaad9d61375b2b0fe16ac6a04145145300a28a2800a28a2800a28a28037b4cff008f18ff001fe756aa0b14d965103e99fcf9a9e90c28a28a008aebfe3d66ff0070ff002ae72ba2bc6db6731ff648ae76810514514c028a28a0028a28a0028a28a0028a28a00b563746da6e7fd5b70c3fad6f0208041c83d0d72f5a9a5dde0fd9e43fee1fe9480d4a28a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140050781934566eab77b57c843f31fbc7d07a50054d42efed32e14feed7a7bfbd54a28a620a28a2800a28a2800a28a2800ab563686e65e788d7ef1f5f6a8ade07b894469f89f415d0431241108d0600fd6900f50154003007005145140c28a28a0028a28a002a396da19bfd646a4faf7fcea4a2803365d210f314857d9b9aa52d85c45d632c3d579adfa280397a2ba496de19bfd646ac7d7bfe75465d210f314857d9b9a0464d15665b0b88bac6587aaf355a98051451400a8cc8c194e18720d6fd95dadd459e8e3ef0ae7ea482678251221e47eb480e928a8ede74b888489f88f43525030a28e9d6b2efb52ce63b73c777ff0a007ea777179660003b77ff67ffaf59145140828a28a60145145001451450014514500140193814e8e3695c2229663d00adab2b04b701df0d27af61f4a4057b2d37a49703e89fe35a8060605145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a4660a393400b4d6902fb9a8da427a702a3a043d9cb7d3d2994514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500150dcdac7729b5c723a30ea2a6a28039db9b592d9f0e320f461d0d435d3491a4a851d4329ec6b16f6c1edc974cb47ebdc7d68114e8a28a60145145001451450014514500145145007436327996719ee060fe153d65e8f372f093d7e61fd6b5290c28a28a0064f109a178cff10c5736ea51cab0c10704574f59da9d999079f18f987de1ebef4019145145310514514005145140054b6d099e748c773cfb0a880c9c0eb5b9a75a7d9e3dee3f78dd7d87a5202e00000074145145030a28a2802a6a8fb6c987f7881fd7fa561569eb32e5e388761b8d665020a28a29805145140051451400514514005145140050090720e08a28a00deb0ba1730fcc7f78bc37bfbd5aae72de76b799645edd47a8ae86291658d644395614863a8a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a282428249c01c934010dddc0b680b9e58f0a3d4d73ccc5d8b31c92724d4f7b726e672dfc03851ed55e810514514c028a28a0028a28a0028a28a009ad6736f3ac83a7423d45742ac1d4329c82320d7315ada4dce54c0c791caff852034a8a28a061451450014556b8bc16d285950ec6e8c39a9629e29866370dedde8024a28a2800a28a2800a28a2800a8e5b7866ff591ab7bf7fcea4a28033a5d210f314854fa3722a8cb61711758f70f55e6b7e8a00e5fa515d24b6f0cdfeb2356f7eff9d52974843cc4e54fa37228119f6774d6b2ee1ca9fbc3d6b784d1987cdde366339ac396c2e22ea9b87aaf350177d9b0b1da0e76fbd005bbdbf6b8ca47958ff56aa54514c028a28a0028a28a0028a28a0028a28a002a5b7824b8936463ea7b0a7da5a3dd3e17841d5bd2b72081208c246303f5348065ada476a985e58f563dea7a28a06145145001451450014514500145145001451450014514500145359c2fd7d2a1672dd7a7a50048f2f65fcea22493934945020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a51d452528ea2802cd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028201182320d1450064df69db732c032bdd7d3e959b5d4567df69c24ccb00c3f75f5a0463d141041208c1145300a28a2800a28a2800a28a2801f0cad0cab22f5539ae8e391658d5d4e5586457335a1a5ddf94fe4b9f918f07d0d203628a28a061451450067dee9a242648301bbaf63592e8d1b15752a47635d353648a3957122061ee280399a2b6df4ab76395de9f43fe351ff006445ff003d1ff4a046453e28a499b6c6a58fb56ca6996c872433ff00bc6ada22c6bb51428f4028029d969eb6f87930d27e82aed145030a28a2800a1982a9627000c9345676ad73b53c843cb72dec280332e2533cef21fe23c7d2a3a28a620a28a2800a28a7471bcae12352cc7b0a006d15ad1e92a216f31b3211c63a2d65ba346e51c6181c114806d14514c028a28a0028a28a002af69975e4c9e539f91cf1ec6a8d1401d45154b4dbaf3e2d8e7f789fa8f5abb4861451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001599aadd607d9d0fbbff00855dbbb816d0173f7ba28f535cf331762cc7249c934009451453105145140051451400514514005145140053a3768a457538653914da2803a582559e15917a11f953eb1b4ab9f2e5f258fcafd3d8d6cd218514514010dd402e6068cf5ea0fa1ae7d8346e41cab29c7d2ba6accd5ad78fb420f67ff1a00ab0ea5711705b78f46ff1abf0ea90c9c480c67df9158b45023a757575dc8c187a839a5ae66391e36dd1b953ec6b634d9ee275265c141c06c609340cbd45145001451450014514500145150dd5c2db425db93fc23d4d0045a85e0b68f6a1fde374f6f7ac2249392724d3a591a5919dce58d36810514514c028a28a0028a28a0028a28a002add95935cb6e6cac63a9f5fa53ac6c4dc10f264443ff1eada5508a154000740290091c6b1204450aa3a014ea28a061451450014514500145145001451450014514500145148cc1473400bd2a2797b2fe74c672df4f4a6d0216928a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a51d452528ea2802cd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00a77d60b700ba6165ff00d0ab1195918ab02187506ba7aab7b64b72b918590743ebf5a00c1a29d246d139470430ea29b4c41451450014514500145145006c69d7de6810ca7e71f749ef5a15cb8241c8e08ad8b1d404988a6387ecdeb480d0a28a28185145140051451400514514005145140051454175751db265b963d17b9a002eee96d62dc7963f747ad603bb48e5d8e589c934e9e679e42f21c93fa54740828a28a601452aa9660aa0927a015ab67a605c3dc727b276fc69014ed2c64b939fbb1ff78f7fa56d416f1dba6d8d71ea7b9a90000607028a06159faa5a7989e720f9947cc3d456851401cbd157351b4fb3cbb907eedfa7b1f4aa74c41451450014514500145145004904ad04ab22751fad7430cab344b221e18573557f4bbaf2a5f29cfc8e78f63480d9a28a28185145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140050781934567eab73e5c7e4a1f99fafb0a00a17f73f699c907e45e17fc6ab51453105145140051451400514514005145140051451400514514000383915d058dc7da6dc31fbe386fad73f566c2e7ecf70093f2370dfe3480dfa28a281852328652ac3208c114b450073d776e6da7287eef553ea2a0adfbfb6fb4c0703e75e57fc2b0e289e6944683e63fa50224b3b66ba9768e1472c7d2ba04458d0220c281802a3b6812de211a7e27d4d4b40c28a28a00090a092700724d4115edbca70b2007d1b8acfd4ef3cc2608cfca3ef11dcd675023a8a2b9d8aea687fd5c8c07a7515761d5c8e268f3eebfe140cd392458a32ee70a3ad73f7572d733176e07451e82a5bfbd372c1532231d01ee6aa5020a28a298051451400514514005145140055fb0b0339124a311f61fdea34fb033112ca311f61fdeffeb56c8000c018029000000000c01d00a28a2818514514005145140051451400514514005145140051413819350bc99e074a007bc8070393509249c9a4a28105145140051451400514514005145140050c76a93d71451400d4759172a7229d59a4b41336d38c1ab905c2cbc1e1bd3d6a233be8cdaa51715ccb626a28a2acc428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802bde5a25d27a38fbad5852c6f0c851c618574b55eeed12ea3c1e1c7dd6a00e7e8a7cb13c3214718614ca620a28a2800a28a2800a28a2802fda6a4d16126cba763dc56bc52a4c9ba360c3dab99a7c72bc4dba362a7da901d2d15930eacc30264ddeebc1abb1ea16d27fcb40a7d1b8a0659a29ab223fdd756fa1cd3a800a2919957ef301f5350bdedb47f7a65fc39fe54013d07819359d2eae8388a32c7d5b8159f3ddcd71f7dfe5fee8e0500695d6a691e561c3bfaf61fe3591248f2b97762cc7b9a6d140828a28eb4c02a7b6b496e5b0830a3ab1e82add9e985f0f71955ec9dcfd6b55555142a801474029010dada456cbf28cb7763d6a7a28a0614514500145148eeb1a96760aa3a93400d9e259e268dfa1fd2b9d96330cad1b632a71c55ebcd4d9f2906557fbddcd675020a28a2980514514005145140051451401bba75d7da20c31fde2707dfdeadd7396b3b5bceb20e9dc7a8ae89195d0329ca9190690c5a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2801934ab0c4d2374515cecb234d2b48e796357755b9f325f254fca9d7dcd67d020a28a298051451400514514005145140051451400514514005145140051451401b5a5dcf9b0f96c7e74fd455eae72de66b799645edd47a8ae891d6440ea72ac32290c5a28a2800a8e38238e4791570ce793525140051451400550d4af3ca5f2633f39ea7d054d7b762d62e3991bee8feb582cc5d8b31c93c93400945145310514514005145140051451400514514005145140055fd3ec4cc44b28fdd8e83fbd4dd3ec4dc379920c443ff1eadb0000001803a0a4000003038028a28a061451450014514500145145001451450014514500148cc1464d23b851ef50162c7268015dcb1f6f4a6d145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a280285e2e26cfa8cd4156ef87287eb552b096e7a545de08b96f759c2487e8d56ab26ad5b5cedc239e3b1f4aa8cfa330ad43ed44b9451456a7205145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450057bcb44ba8f07871f75ab0648da290a38c30ae9aab5eda2dd47e920fbadfd2803028a73a346e51c6187514da620a28a2800a28a2800a28a2800a28a2800a5c9f534945001451450014514500145157ad34e79f0f26523fd4d005582092e1f6c6b93dcf615b569611db618fcf27f78f6fa5588a24850246a15453a90c28a28a0028a28a0028a0900124e00ef59979a9e3296fcfabff0085005bbabc8ad87cc773f65158b73752dcb65cf1d947415133166258924f52692810514514c028a28a0028a28a0028a28a0028a28a002b5349b9e4dbb9f75ff0acba55628c194e083906901d3d1515ace2e2059075e847a1a968185145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400557beb8fb35b961f7cf0bf5ab15817f73f68b8241f91785ff1a00ac4e4e4d14514c4145145001451450014514500145145001451450014514500145145001451450015a9a4dcf5b763eebfd4565d391d91c3a9c30391480e9a8a8ede65b881645efd47a1a92818514514005473cc96f1191fa0e83d4d4958dab193ed203fdcc7cb40152799e794c8e793fa5474514c41451450014514500145145001451450014514500156ec6ccdcbee6c88d7a9f5f6a659dab5d4b8e883ef1ade8d163408830a3a0a402aa8550aa000380052d145030a28a2800a28a2800a28a2800a28a2800a28a2800a63c9b781d6924931c2fe750d02149c9e6928a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802adf7dc4fad53ab97c7841f5aa7584fe23d0a1fc3414514549b96ed67e91b9fa1ab75935a16d3798983f787eb5ac25d19c55e95bde44d451456872851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a061451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450054beb31729b970241d0fafb561b29562ac0823820d74f54751b2f3d7cc8c7ef0751fdea00c5a28e945310514514005145140051451400514514005145140053a38de57091a9663d8558b4b192e4e7eec7fde3fd2b660b78edd36c6b8f53dcd202b59e9a90e1e5c3bfa76157a8a2818514514005145140054571731dba6e91be80753556f35248b290e1dfd7b0ac8924795cbbb1663dcd004f777b25c9c1f953b28feb55a8a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00b9a6dcf913ed63f23f07d8d6e572f5bba75cf9f6e031f9d383efef480b745145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a4660aa598e0019268029ea973e4c1e5a9f9df8fa0ac4a9aea73713b487a1e00f4150d020a28a2980514514005145140051451400515660b0b89f0426d5f56e2af47a420ff005b2337b2f1480c8a2b7d34fb54ff009640fd493528b68074863ffbe4500737457486da03d618ff00ef91513e9f6aff00f2c80fa1c50060515ab2e90a798a423d9aa8cf673c1cba1dbfde1c8a00828a28a60145145005ed2ee7ca9bcb63f23fe86b6ab97adfb0b9fb45b824fcebc37f8d202cd145140c2ab5fdb7da2dc803e75e57fc2acd1401cbd157753b6f267f3147c8fcfd0d52a620a28a2800a28a2800a28a2800a28a2800a96de07b894227e27d053238da590220cb1e95d05a5b2db45b472c7ef1f534807c10a41108d0600fd69f45140c28a28a0028a28a0028a28a0028a28a0028a28a002a2924ecbf9d12499e17a54540828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a29370dc17b919a005a28a0900127a0a00a37ad9940f4155e9d236f919bd4d36b9dbbb3d4847962905145148b0a746e6370c3b5368a04d5d599aaac19430e8696aad94995319edc8ab55d09dd5cf3271e493414514532028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28033752b2dc0cf10e7f880efef5935d4563ea565e5319a31f21ea07f09a0467d14514c028a28a0028a28a0028a28a005552cc154124f402b56cf4c0b87b8e4f64ff1acfb4b836d387c647423daba1560ea194e411906900a000300605145140c28a28a0028a2aa5ddfc76f955f9e4f4f4fad00589654850bc8c14563ddea2f3e523ca47fa9aad34f24efbe46c9fe551d020a28a2980514514005145140051451400514514005145140051451400514514005145140054f67706dee15ff0087a30f6a828a00ea0104020e41a2a869571e6446163f3274fa55fa430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800aced5ae36462053cb72df4ad07758d19d8e15464d7393cad3ccd237563f95004745145310514514005145140051455ab2b36ba7c9e231d4ff00414011dbdb4972fb631c0ea4f415b16d610dbe0e37bff78ff4ab11c691204450aa3b53a90c28a28a0028a28a0028a28a0028a28a00a573a6c5365a3fddbfb743f8564cf6f25bbed9171e87b1ae8e992c4932149141068039aa2acde59bdabe7ef467a37f8d56a620ab16571f66b80c7ee1e1be955e8a00ea01c8c8e94550d2ae7cc8bc963f3274f7157e90c28a2abdedd0b58b3d5dbee8a00adab5c208fc800331e4ff00b35914acc5d8b31c92724d25020a28a29805145140051451400500127039268ad5d2ecf004f20e7f801fe7480b1a7d98b78f738fde375f6f6ab745140c28a28a0028a28a0028a28a0028a28a0028a28a002a1924cf03a52c926781d2a2a04145145001451450014514500145145001451450014514500145145001451450004e064d5349b7de03fc3d052ddcdff2cd4fd6aaa36d756f439aca52d6c75d2a5eeb6fa9ab55af25da9b0756ebf4a9a595634dc79cf41eb59aec5d8b31e4d54e56d08a14eef99ec251451589de14514500145145003e17d92ab76cf35a75935a70b6f895bd45694df438f131da43e8a28ad4e40a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a51d452528ea2802cd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029194329561907820d2d1401837d686da5e398dbee9fe9556ba59a249e231b8c83fa573f7103dbca637edd0fa8a044545145300a28a2800a28a2800ad2d2aef6b790e7e53f74fa1f4acda3a74a00ea28aaba7dd7da61c31fde2f07dfdead52185145140199a9de4d13f948360233bbb9fa56557417b6c2e612bfc63953580ca558ab0c11c114084a28a298051451400514514005145140051454b0db4d39fdda123d7b500454569c7a41eb2ca07b28a9c6936e3a990fe3480c5a2b65b49808e19c1fa8aaf2e9322f31387f63c1a00cea29f244f136d910a9f7a65300a28a2800a28a2800a28a28024b798c132c8bd8f23d457468c1d0329c82322b98ad6d22e3721818f2bcafd2901a545145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a6c8eb1c6cec701464d0067eaf71855814f2796fe95934f9a569a5691bab1cd32810514514c028a28a0028a2800920019268026b4b76b99820e07563e82ba08e358a308830a3a543656c2da00bfc67963ef56290c28a28a0028a28a0028a64934717fac755fa9a80ea36a3fe5ae7e8a6802d515596fed58e04a07d411561595c655830f5073400b45145001451450036445950a38ca9ea2b02eed9ada62a7953ca9f515d0d41796e2e6029fc43953ef401cf514a41048230475a4a622482568265917a83f9d7451bacb1aba9cab0c8ae66b4b4bbb11ee8a46c2fde04f6f5a40694f32411191cf03b7ad73f3ccf712991cf27b7a54b7b746ea5c8e117ee8feb55a800a28a2980514514005145140051454b6d035ccc235fc4fa0a00b1a759fda24dee3f76a7f33e95b74d8a358a354418514ea430a28a2800a28a2800a28a2800a28a2800a28a2800a8a493f847e34b23e3e51f8d4340828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a1b99bca5c0fbc7f4a7cb20890b1fc07ad66bb1762cc724d44e56d0e8a14b99ddec251451589de2924e3249c74a4a28a04145145030a28a2800a28a2800abf667300f624550abd63fea9bfdeaba7b9cf885ee1628a28ad8e00a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a51d452528ea2802cd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002abdeda8ba8b1d1d79535628a00e6194ab1561820e08a4ad7d52cf7a99e31f30fbc3d47ad645020a28a2980514514005145140125bccd6f32c8bdba8f515d14522cd1ac8872ac2b99abda6ddf932796e7f76e7f23480daa28a28185666ab6991f6841c8fbe3fad69d0402082320d0072f4559beb536d371f71b953fd2ab5310514514005145140052aa9760aa0927a01495b9a7d988231238fde30fc87a52022b4d315007b8f99bfbbd85688000000000ec28a28185145140051451400d9624990ac8a187bd635ed835bfce9968ff0051f5adba080c082320f50680397a2addfda7d9a5caff00ab6e9eded55298828a28a0028a28a0029f0cad0cab22f5539a651401d346eb246aea72186453ab3348b8c86818f4e57fad69d21851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400566eaf71855814f2796fe95a2ec110b31c051935ce4f299a6691bab1a008e8a28a620a28a2800a28a2800ad0d26dfcc98cac3e54e9f5acfae8ad21f22d913be327eb4809a8a28a0614514d91d634677385519340092ca90c65e46c0159173a9cb292b17eed3dba9a82eee5ee65dcdc28fbabe95050214924e49c9f7a4a28a6014f8e5789b746e54fb1a651401ad69aa06212e300ff007c74fc6b4872322b97ad1d32f4a308243f29fba4f63e9480d7a28a2818514514018dab41e5ce2451f2c9d7eb542b7f518bcdb37f55f987e158140828a28a60145145001451450014514500145145002aa9660aa3249c015bf656a2da1c7573cb1aaba55a6d1f6871c9fb83fad695218514514005145140051451400514514005145140053247dbc0eb4aefb47bd404e4d02128a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002824004938028aa779364f96bf8d293b2b974e0e72b10cf2995f3d874151d14573b773d24925641572d6dc6048e3e82a1b68bcc979fba3935a15a423d59cd88ab6f75194df78fd6929d28c4ac3d09a6d66752d505145140c28a28a0028a28a002af58ffaa3fef551a9d2e3ca876a0f989ebe9550767731ad1728d916e599621cf27b0a65bdc79a583601ea3e954492c724e49a54728e187514f9ddccfeae946dd4d4a291583a861d0d2d6c7105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a06145145001451450014514500145145001451450014514500145145001451450014514500145145001504f7905b9db23fcde8064d2ddcff0067b7693bf45fad73ccc598b31c93c926803a38678a75dd1386f5f5152573704cf04a2443c8edeb5d0c32acd12c8bd1866801f4514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014d9244890bc8c1547734e2400493802b02f6e9ae66272760e145006b477f6f2bec57c13d32319ab35cbd6e6997267836b9cba71f51401728a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b1351b4f224de83f76dfa1f4adba6cb12cd1b46e32a45007334549710b5bccd1b76e87d45474c41451450014514500145145006d69977e747e539f9d071ee2af5733148d148ae870ca722ba2b79d6e215917bf51e8690c928a28a008ae605b884c6df81f435cf491b4523238c329c1ad6bcd4d63ca41866fef761fe3592eed2316762cc7a934086d14514c028a28a00b5a74426bb504642fcc6b7ab27461fbe90ffb35ad48614514500145148eeb1aee760a3d49a005a2abadf5b336d132e7df22ac5001451450045730adc40d1b77e87d0d73aca518ab0c10704574f58fabc3b265940e1fafd68033e8a28a620a28a2800a28a2801f0cad0cab22f5539ae923759115d4e430c8ae62b5b489f72340c795e57e9480d2a28a281851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145048009270050067eaf3ed89610797e4fd2b1ea5ba98cf70f276278fa54540828a28a60145145001451450058b18bcdbb8d4f40727f0ae82b27464ccb23fa2e3f3fff00556b5218514514005656af71965814f0396fe95ab5cddc49e6dc48feac68023a28a298828a28a0028a28a0028a28a00e82c67fb45b2b13f30e1beb562b27469312c91f6233f97ffaeb5a90c28a28a000804107a1ae65d7648c87aa922ba6ae7af462f251fed668110514514c028a28a0028a28a0028a28a002ad585afda66f987eed796ff0aaf1a34922a20cb31c0ae86da05b785635fc4fa9a404a0003038145145030a28a2800a28a2800a28a2800a28a2800a4660a326949c0c9aaeedb8fb50021258e4d25145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28019349e5465bbf41598492727ad4f7726f9768e8bc7e35056137767a1421cb1bf70a28a5032401dea4d8bf689b6107bb735350060003a0a2ba12b2b1e5ca5cd26ca1789b66cf6619a82b46e22f363c0fbc39159c460e0d63356677509f346dd828a28a9370a28a2800a28a2800a28a2800a28a2802e594990633db9156ab3217f2e556f7e6b4eb683ba3cfc446d2bf70a28a2acc028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a8ee261040d21ec381ea68032f569f7cc2253c275fad67d2b31662cc7249c93494c415aba3cdf7e13fef0feb5955674f7d97b19f538fce901bf45145030a28a2800a28a2800a28a2800a28a2800a29b24a912ee91828f7ace9757c3e228f2a3a96ef401a745518b5581f870d19f7e455c8e44906637561ec6801d45145001451450014514500145145001451450053d526f2ed4a83cb9c7e1deb0eb43587cdc227655cfe759f4082acd84ff0067b95627e56f95aab514c0ea28aaba75c79f6c013f32707fa55aa430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802aea16bf69872a3f78bc8f7f6ac1e95d45646ab6bb1fcf41f2b7def63408cea28a2980514514005145140055ab0bafb34df37fab6e1bdbdeaad1401d24b3c70c7bdd805edeff4acef366d49de38dbca8c0ce3d7eb59acccd8dcc4e06064f4ad2d147cd31f61fd69009fd8efff003d57f2a5fec76ff9ec3fef9ad5a281997fd8e7fe7bff00e39ffd7aaf79622d630de6ee24e31b715b9597ad37312fd4d0065d14514c46868ed8b875f55feb5b1581a7becbd8cf6271f9d6fd218514514005616a53b4b74cb9f950ed03f9d6ed73974317528ff6cff3a008aaf69f7ad0b88e43988f1cff000d51a2988ea28aada7cbe75a213d57e53f8559a430aada8c5e6d9bfaafcc3f0ab34100820f43401cbd14e914a48c87aa9229b4c414514500145145001525bca609d241d8f3ee2a3a2803a7560ca194e41190696a86933ef80c44fcc9d3e957e90c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a96a93f956db01f9a4e3f0ef576b03509fcfba620fcabf28a00ad45145310514514005145140051451401ada30fdd4a7dc56956768c7f7528ff0068568d218514514008e708c47a57315d475ae65d4a3b29eaa48a04368a28a601451450014514500145145005cd2bfe3f57e86b72b1f474cdc3bf655c7e75b14861451450015cfdf9cdecbf5ae82b9bb86df73230e858d004745145310514514005145140051455ab0b6fb4ce323e45e5bfc2802f6956bb13cf71f337ddf615a140e0605148614514500145145001451450014514500145151caf81b475a006c8fb8e074a8e8a2810514514005145140051451400514514005145140051451400514514005145140053647d91b37a0a7557bd6c4417d4d26ec8aa71e6924512727268a28ae73d50a92dc66741ef9a8ea6b4ff008f85fc7f9535b913768b3428a28ae83cb0a827b6127ccbc37f3a9e8a4d5f72a3271774653a321c3020d256ab22b8c30047bd5692cc1e6338f63593a6fa1d90c445fc5a14e8a73c6f19c32914da83a134f54145145030a28a2800a28a2800ad381b7c287dab32af591cc247a1aba6f539b12af1b9628a28ad8e10a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a51d452528ea2802cd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b2357b8df20854f09c9fad69dc4c2081a43d8703d4d738cc5d8b31c92724d002514514c415240717119f461fcea3a96d9775cc43d5c7f3a00e8e8a28a430a28a2800a28a2800a28e8326a8dcea7145958bf78debd85005d665452cc4003a9359d73aaaae5601b8ff0078f4ace9ee65b86cc8c4fa0ec2a2a043e595e66dd23163ef4ca28a6014aac54e54907d41a4a2802dc5a95c47c160e3d1aaec5ab44dc4a8c87d4722b1e8a4074b14f14c3f7722b7d0f34fae5c1c1c8ab315fdc45d24dc3d1b9a00dfa2b362d5d0f12c657dd79abb15cc337fab9149f4e868192d14514005145140185a99cdf3fb01fcaaa55cd5062f98fa807f4aa740828a28a605ad3ee3c8b9049f91b86adeae5eb7b4eb8f3ed8027e74e0d202d5145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00291d164464719561822968a00e72e606b799a36fc0fa8a8ab7750b5fb441951fbc4e47bfb5615020a28a29805145140051451400569e8a7e7947a806b32af690fb6ecaff7948a406d5145140c2b2359ff005f1ffbbfd6b5eb33594f9627f4241a00caa28a298854628eac3a839ae9948650c3a11915cc574362dbeca23fece3f2e29013d145140c2b0b544d97ac7b3006b76b2f594e6293eaa68032e8a28a6235b466fddcabe841ad2acdd147c929f520569521851485947561f9d219631d645fce80306fd76deca3df3f9f355eadea655af18a904103906aa5020a28a298051451400514514013d9cff67b957fe1e8df4ae86b97aded367f3ad4027e64f94ff4a405aa28a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514015efa6f22d5981f98f0bf5ae7eb43579b7ce2207841cfd6b3e810514514c028a28a0028a28a0028a28a00d2d19f124a9ea01fcbffd75ad581612f9579193d09da7f1adfa430a28a2800ac4d521f2ee8b81f2c9cfe3deb6ea1bbb71730143c1eaa7d0d0073b4539d1a3728e30c38229b4c41451450014514500145156f4fb43712ee61fbb5ebefed401a5a641e4da8247ccff0031fe956e8a290c28a28a008ee24f2a091ffbabc7d6b9bad7d626db12c40f2c727e82b22810514514c028a28a0028a28a005552cc1546493802ba1b4b716d004fe2eac7d4d50d26db24cee381c2ff008d6ad21851451400514514005145140051451400514504e064d0023b6d5cd5727272695db73669b40828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a9df1f9907b55caa57df7d7e9513d8db0ff00c4456a28a2b13d10a9ad7fe3e17f1fe550d3e03b6643ef4d6e44d5e2d1a745145741e5851451400514514001018608c8aa5716db0174fbbdc7a55da2938a65c2a383ba3269402c700127daa67b726e0c6bd3afd055c8a258970a3ea7d6b1506ced9d78c5685216b291f740fa9a63c4f1fde5207ad69d04023046455fb3460b132bea8c9a2ac5cdbf97f3a7dd3fa557ac9ab6876464a4ae82ae58fdd7fad53abb623f76c7deaa1b99623e0659a28a2b73cf0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a51d452528ea2802cd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2a3b9984103487b0e07a9a00ccd5ae37ca2153c2727eb59d4acc598b31c92724d253105145140055cd2e2f32f0376419aa75b5a4c3e5db6f3d6439fc29017a8a28a06145145001556e6fe1b7c8cef7fee8feb45ec33cca0432ed5eebd33f8d529f4bf261793ceced19c6dff00ebd0056b9bd9ae3866c2ff007474aaf456acba6db42bba499d4671938a0465515a1f66b0ff009fa6ff003f851f66b0ff009fa6ff003f850067d15a1f66b0ff009fa6ff003f851f66b0ff009fa6ff003f850067d15a1f66b0ff009fa6ff003f851f66b0ff009fa6ff003f850067d15a1f66b0ff009fa6ff003f851f66b0ff009fa6ff003f850067d15a91585a4d9f2a766c75c550962db72d1265b0d81ea68022eb5ad61a76dc4b38e7a843dbeb5258e9e20c492e0c9d8765abd4005145140c28a28a00cbd662e639474fba7fcfe75975d15e43e7daba639c647d6b9da04145145300ab5a7dc7d9ee4127e46e1aaad1401d4515534eb8f3ed8027e74e0ff4ab74861451450014514500145145001451450014514500145145001451450014514500145145001451450014514500158daa5b7952f9aa3e47ebec6b66993c4b3c2d1b7423f2a00e6a8a74b1b4523238c329c1a6d310514514005145140054b6b2795731bf60dcfd2a2a2803a8a2abd8cde7daa36791f29fa8ab14861505e43e7db3a0fbdd57eb53d1401cbf4a2b5750b06663342324fde51fcc5651041c1e0d020aded3011631e7dff99ac6b7b792e240b18fa9ec2ba18a31144b1af4518a0075145140c2a96acbbacc9feeb03fd3fad5daada8ff00c78cbf87f314018145145310b923a1a4a28a0028a28a0028a28a0028a28a0028a28a0028a28a002ae6993f9574149f964e3f1ed54e8048391d450075145456d309edd24ee473f5a9690c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029b2c82289a46e8a334eaced5e6db12c40f2c727e940194ee5dd9dbab1c9a6d1453105145140051451400514514005145140057456937da2d91fbe30df5ae76aee9973e4cde5b1f91ff43480dba28a2818514514015af2c92e973f7641d1bfc6b12682481f6c8a47a1ec6ba4a464575daea181ec4500731456dcba5dbbf2bb90fb1e2a13a3fa4fff008e7ff5e81195456b2e8e80fcf2b1fa0c55b86cade13958c16f56e4d00655a69f24e4338291fa9ea7e95b51c6b120441851d053a8a0614514500141200c9e00a2a86ab73e5c5e4a9f99fafb0a00ccbb9fed170cfdba2fd2a1a28a620a28a2800a28a2800a92de169e658d7bf53e82a3adad2adbca87cd61f33f4f61480bb1a2c68a8a30aa302968a2818514514005145140051451400514514005452bff0008fc69f236d5f7aaf40828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002aadf2e515bd0e2ad53264f32265efda9495d174e5cb34ccca28a2b9cf50281c1cd4863cc0241d8e0d474129a66aa36e40c3b8cd2d57b27dd1943d57f9558ae84eeae79938f2c9a0a28a299214514500145145001819cf7a28a2800a090aa49e828a82f1f6c38eec7149bb2b9508f349206b98594824907daa81c64e391da8a2b0726cf4614d4360ad1b65db02fbf354224324817d6b5070302ae9aea6189968a21451456a71851451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a061451450014514500145145001451450014514500145145001451450014514500158fab5c6f9442a7e54ebf5ad3ba9c5bc0d21ea3a0f535ceb12cc589c92724d02128a28a60145145003e28ccb2ac6bd58e2ba445088157a0181593a3c3ba56988e1781f5ad7a430a28a2800a28a2800a4745910a30ca9e08a5a28032ee349fe281bfe02dfe3536afff001e83fdf1fd6af551d5ff00e3d07fbe3fad0062d14514c414514f58657fbb1b9fa29a006515218265fbd138faa9a8e800a28a28034f45fbd37d07f5abf15ac714af2e32ee49c9ed54345fbd37d07f5ad5a430a28a2800a28a2800a28a2800ac0bf87c9bb7007ca7e61f8d6fd67eaf0ef816503943cfd0d0063d14514c41451450059b0b8fb3dca927e46e1ab7eb97addd36e3ceb70ac7e74e0fd3b5202dd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00ced5adb7209d472bc37d2b22ba82032904641e08ae76ee036f70c9dbaa9f51408868a28a6014514500145145005ed2ae3ca9fcb63f2c9c7e35b55cbd6f585d0b9870c7f78bc37bfbd202d5145140c298f0c4e72f1a31f52a0d3e8a0045555185000f402968a2800a28a2800aa9aa36db261fde207f5fe956eb23589b748b083f7793f5a00cea28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00d3d1e6c33c24f5f987f5ad5ae6e094c33a483f84d7480865041c83c8a430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ae7efa6f3ee9d81f94703e95b37b37916aec0f24607d4d73d40828a28a6014514500145145001451450014514500145145006d69b79e7208a43fbc51c1fef0abd5cc2b1460ca482390456e58df2dcaec7c09476f5a432dd145140051451400514514005145140051451400514532699208cbc87007eb400db99d6de13237e03d4d73f2c8d2c8d239cb31a92eee5eea5dcdc28fbabe9505020a28a2980514514005145140162c6dfed17014fdd1cb7d2ba0e838aaba75bf916e323e77e4ff855aa430a28a2800a28a2800a28a2800a28a2800a0f03345452b7f08fc68018edb9b34da28a04145145001451450014514500145145001451450014514500145145001451450014514500145145001451450050bb8b649b87dd6fe75056a4882442add0d66c91b46e55bffd758ce36773be854e6567b966cb0d1ba1e45433c2626f553d0d3ad1f6cc0766e2af32860430c834d2e6899ce6e954bf4666c3218a40ddbbd698218020e41aa72d99eb19fc0d2c0f2427648adb7d71d288de3a30aaa351734772dd14039191456a720514514005145140051451400551bc7dd2edeca2af310aa49e839aca662cc58f527359d47a58e9c346f2e6128a2ac5ac1bcef61f28fd6b24aeec75ca4a2aec9ad22d89bdbab7f2ab14515d095958f36727277614514532428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a86ee716f6ed277e8bf5a00ccd56e3cc9844a7e54ebf5aa14a492492724d253105145140051455bd360f3ae8123e54f98ff4a00d7b387c8b644ef8cb7d6a6a28a430a28a2800a28a2800a28a2800aa3abffc7a0ff7c7f5abd54b5604daa80324b8feb40188012400324d695b694ce034e768fee8eb56ac2c56dd43b80653ff008ed5a9654850bc8c157de810c8ada187fd5c6a0faf5352d654fab312440800fef375aa6d7b72e726661f438a067434c9218a5189115bea2b016f2e14e44cff0089cd5a8755954e2550e3d47068025b8d28105addb07fbadfe3598e8d1b95752ac3a835d0dbdcc570b98db3ea0f514dbbb54ba8f0dc38fbade9408a3a2fde9be83fad6ad66e951b4534e8e30c31fd6b4a818514514005145140051451400523a091191ba30c1a5a280399963314ac8dd54e29b5a5ac41875980e1b86fad66d020a28a2980558b2b8fb3dcab1fba786fa557a2803a8a2a9e9971e75bec63f347c7e1daae52185145140051451400514514005145140051451400514514005145140051451400514514005145140051451400553d4adfceb7dca3e74e47b8ef5728a00e5e8ab5a85bfd9ee0e07c8dcaff008555a620a28a2800a28a2800a92099e094488791fad4745007476d709731ef43cf71dc54b5cdc333c12078ce0ff3ad9b5bf8ae00527649fdd3dfe94865ba28a2800a28a2800a291982825880077359f75aa2202b00dcdfde3d050059bcbb5b58fd5cfdd5ac0662ec598e4939269647691cbbb1663d49a6d020a28a29805145140051451400514514005145140051451400514514005145140056e69737996a149f990e3f0ed5875774b9bcbba0a4f0e31f8f6a406dd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28240049e00a00c9d626cc89103c28c9fad66d493ca669de43fc46a3a04145145300a28a2800a28a2800a28a2800a28a2800a28a2800a504a9041208e845251401ab69aa0384b8e0f67ff001ad30430054820f422b97a9a0ba9adcfeedc81e87a5203a2a2b3a1d591b8990a9f51c8abb1dc432fdc954fb679a0649451450014514d7911065dd547b9c5003a8aa72ea76f1fdd62e7d145509f539a5c84fddafb75fce8034aeaf62b6182773ff74562dc5c4972fba43f403a0a8ba9c9a2810514514c028a28a0028a28a002ade9d6fe7dc8247c89c9fe9552ba0b0b7fb3db2823e76e5a901628a28a06145145001451450014514500145145002336d5cd57272734e91b7363b0a65020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a8e689655c1e0f63525143571a6d3ba32d95a27c1e08ad28a41246187e3492c4b2ae187d0fa5568f75ac987fb8ddeb34b95f91d1292ad1f345ca28a2b439828a28a0028a28a0028a28a0028a28a0082f1f6c5b7bb550a9ee18cd3e14671c0c54d0da05f9a4e4fa76ac5a727a1dd071a50d7722b7b62f867e17f9d5e000181c0a28ad63148e4a951cddd8514514c80a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a51d452528ea2802cd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b1755b8f327f2d4fcb1ff003ad4bb9c5bdbb49dfa0fad73a492493c9340828a28a601451450015bba6c1e4da8247ccff31fe95936507da2e550fdd1cb7d2ba1a40145145030a28a2800a28a2800a2abdf5c1b6b72ea3e62702b212fee524dde616f507a1a00dfa465562370ced391f5a48dc491ab8e8c01a750047713a5bc4647e83a0f53581717125cc9bdcfd0761536a573e7dc1507e44e07f53552810514514c028a28a0074723c4e1d18ab0ef5bd6576b751e7a38fbc2b9fa96da76b79d641dba8f51480e8b6aef2d8f988c66969158328653904641a5a06145145001451450014514500145145004573089e078cf71c7d6b9d20a9208c11c115d3d62eab079771e601f2c9fce811468a28a60145145004f653fd9ee55ff0084f0df4ae87ad72f5b9a5cfe6db6c27e68f8fc3b5202e5145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00ad7f6ff0068b6200f9d795ac0aea2b0b52b7f26e4b01f23f23fad022a514514c028a28a0028a28a0028a28a00b50dfdc42301f72fa373569758e3e7879f66acba2901ac7584ed0b7e750c9ab4adfead153ebc9acfa280249679663991cb7d7a5474514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029549560c0e0839149450074b0c82585241fc4334facfd1e6dd0b444f2a723e86b4290c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002aaea52f9566d8eaff0028ab558fabcbba758c7441cfd4d0067d14514c41451450014514500145145001451450014514500145145001451450014514500145145003d66913eec8ebf46229ff006bb8ff009ef27fdf46a1a280246b899bef4d21fab1a8c924e4d1450014514500145145001451450014514500145145005bd36dfceb9048f95393fd2b76ab69f07916cb91f337cc6acd2185145140051451400514514005145140053646dabee69d55ddb7366801b45145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a080c304641a28a0062298f81ca7a7714fa28a06ddc28a28a041451450014514500148ea59700e33d4d2d1402761b1c6918c28c7bd3a8a2806dbd5851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a0614514500145145001451450014514500145145001451450014514c9e510c2f21e8a3340195ab4fbe61129f953afd6b3e9598bb1663924e4d253105145140051453a2432caa83ab1028035f4983cb80ca47ccfd3e957e915422855e001814b4861451450014514310aa589c00324d0057bcbb5b58fa6e73f756b2e3d467f3d59dfe4cf2a0718a82e673713b487bf41e82a2a047457502dd40509c7707d0d66a693297c3ba85ee41abda6cde75a2e4fcc9f29ab540c45508a157800605477727936b238ea071f5a96a96ae71678f5602803128a28a620a28a2800a28a2800a28a2803734a97ccb40a7aa1c7e1572b2f456e655fa1fe75a9486145151cf28860790ff08a00ccbebe956e996172aa9c7d4d5ab0bffb47eee4c093b63bd629258924e49e4d08c51c329c10720d023a7a2a3b7944f02483b8e47a1a92818514514005417b079f6cca07cc395fad4f450072f4559bf8bc9bb750383f30fc6ab531051451400558b19fc8b95627e53c37d2abd1401d45155b4f9fcfb5524fccbf29ab34861451450014514500145145001451450014514500145145001451450014514500145145001451450014514500155efe0fb45b3003e65e56ac51401cbd156f5183c8b9240f95fe61fd6aa531051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401674e97cabc427a37ca7f1adfae5fa57496d2f9d6e927f7873f5a404945145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800240049e00ae6a690cb33c87f88e6b6f5297cab37c756f94560d020a28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400559d3e0f3ee9411f2afccd55ab734b83cab6de47cd273f876a405ca28a281851451400514514005145140051451d280192b6063b9a829ccdb989a6d020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28032efd88b93824703bd56dedfde3f9d59d401fb49fa0aab4c05dedfde3f9d1bdbfbc7f3a4a280177b7f78fe746f6fef1fce928a005dedfde3f9d1bdbfbc7f3a4a280177b7f78fe746f6fef1fce928a005dedfde3f9d1bdbfbc7f3a4a280177b7f78fe746f6fef1fce928a005dedfde3f9d1bdbfbc7f3a4a280177b7f78fe746f6fef1fce928a005dedfde3f9d1bdbfbc7f3a4a280177b7f78fe746f6fef1fce928a00bda692647c9278ad0acfd307ef1fe95a148028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800acdd626c22423bfcc6b4ab9fbf97cdbc90f60768fc2802bd14514c414514500156f4b5dd7a9ec09aa956f4c7db7a99ef91480dda28a281851451400553d525f2ed0a83cb9c7e1572b1f589374e89d9573f89a00cfa28a2988bda54de5dcec2789063f1adaae6158ab0653820e457490c82685241d1866900faa3ab8cd983e8e0ff003abd50dec7e6da4883ae323f0e6819ced14514c414514500145145001451450069e8a3e695bd80ad5aa3a4c7b2d4b9eae73f855ea430accd626c2a420f5f98ff004ad3270327a573975379f70f276278fa5004545145311aba34bc4911ff00787f5fe95a7581a7c9e5dec67b13b7f3adfa430a28a2800a28a28032b595c3c4ddc823fcfe75995a5acbe65893d013f9ff00faab36810514514c028a28a00bfa4cdb2e4c64f0e3f5ad9ae663731c8ae3aa9cd74aac19430e84645218b4514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450055d4a0f3ad4903e64f987f5ac1aea2b9fbd83ecf72ca07ca795fa5022bd14514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b5f479731bc47f84e456455ad3a5f2af13d1be53f8d2037a8a28a06145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500646b12e654887f08c9fc6b3aa5ba97ceb991fb13c7d2a2a04145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28025b584cf7091f6279fa5746000303802b37478708d311cb7ca3e95a548614514500145145001451450014514500151cad818f5a92abb36e626801b45145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802392e2289b6bbe0fa60d33ed96ff00f3d07e46a8ea1ff1f47e82ab5006b7daedbfbe3f2347daad7fbcbff7c9ac9a28035bed36bfde5ffbe68fb4daff00797fef9ac9a280357ed369fde5ff00be68fb45a7aaff00df359545006afda2d3d57fef9a3ed169eabff7cd6551401abf68b4f54ffbe68fb45a7aa7fdf359545006afda2d3d53fef9a3ed169ea9ff007cd6551401abf68b4f54ff00be68fb45a7aaff00df359545006b7da2d7fbcbff007cd1f69b5fef2ffdf359345006b7da6d7fbcbff7cd1f6ab6fefafe559345006bfdaadbfbe3f2a3ed76ff00f3d07e46b228a00db8e78e52423648a7d67699feb5fe95a340051451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a061451450014514500145145001451450014514500145145003646d913bff74135cc9393935d0df1c594a7fd9c573d40828a28a601451450014e4628eaebd54e45368a00e9a2904b12baf4619a75666917190d031e9caff5ad3a430a28a2800ac0d41b7deca7d0e3f2adfae76f01179367fbe68021a28a29882b57479b2af093d3e65feb59552db4c60b8493d0f3f4a40747450082010720d140cc0bfb7fb3dc1007c8dcad56ae8aeadd6e6128dc1ea0fa1ac09a178242920c11fad021945145300a28a2800a92089a799635ea4fe54c552ec154124f402b72c2cc5b4796e646ebeded480b488234545e028c0a5a28a0654d4e6f2ad4a83f33fca3e9deb0aae6a7379b74541f953e51f5ef54e810514514c07236c7561d8e6ba6ae5fad74ea08400f502900b45145030a28aa7a9dc7936c541f9df81f4ef4019379379f72ee3a6703e950d145310514514005145140056fe9cfbeca33dc0c7e55815b5a39cda30f473fc85202f5145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a86ad06f804a0729d7e957e91943a956190460d00731453e68cc333c6dd54e2994c414514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014024104751451401d2c3209614907f10cd3ea86912eeb6287aa1fd0ff009357e90c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a1bc93cab491fbe303ea6a6acdd664c471c63b9c9a00c9a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029514bb8551924e05255ed261f32e4c847083f5a00d78631144b1af4518a7d14521851451400514514005145140051451400c95b0b8f5a829cedb989a6d020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28020bab659d73d1c743595246d1b9571822b72a39e049d36b0e7b1f4a00c5a2a49e0781f6b0e3b1f5a8e980514514005145140051451400514514005145140051451400514514005145140053e289e570a8327f953a0b779db0bc01d4fa56b430a429b507d4fad201b6f02c11ed1c93d4fad4b45140051451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a06145145001451450014514500145145001451450014514500417e33652ff00bb5cf574d2a79913a7f7948ae67a5020a28a29805145140051451400f8a468a55917aa9cd745148b344b22f4619ae6ab4749b9d8e6063c372bf5a406bd145140c2b1b578f6dc87ecebfa8ff22b66a8eaf1eeb50e3aa37e87fc8a00c5a28a298828a28a00dcd2e6f36d4293f347c7e1daae56169b379374a09f95fe53fd2b7690c2a39ede3b84db22e7d0f7152514018d3e973212622245fc8d53786543f346e3ea2ba5a28039a58a463854627d8559874db890fcc3cb5f56ff000adca2802bdad9c56c3e5197eec7ad58a28a002a2ba9bc8b7793b81c7d6a5ac9d626cbac20f0bc9fad0066939393451453105145140162c63f36f235ec0e4fe15d056568d1e5e490f61b456ad218514514001200c9e00ae7af2e0dc5c33ff08e17e95a5aadcf9710854fccfd7d85635020a28a2980514514005145140056d68e3168deee7f90ac5adfd39365947ea79a4059a28a281851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140195ac43874980ebf29fad665747770f9f6cf1f7238fad73940828a28a601451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145005dd264d977b4f4718fc6b6eb9a89cc72a38fe120d74a082011d0d21851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005616a7279978c3b20da2b71982a963d00c9ae69d8bbb39eac726810da28a298051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140056f69b0f9568b91f33fcc6b1ada2f3ae123ec4f3f4ae8c703029005145140c28a28a0028a28a0028a28a0029b236d4fad3aa195b2d8f4a008e8a28a0414514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145003648d6542ae320d655cdab40d9ea87a1ad7a19430218641ec6803068ab7756463cbc7ca771dc554a601451450014514500145145001451450014514500145145001562d6d5a73b8f09ebeb525a591930f28c2f61eb5a400000030052011116350a830052d14500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014a3a8a4a51d450059a28a2818514514005145140051451400514514005145140051451400573f7f17957720ec4ee1f8d74159dabc3ba25980e5783f4a00c8a28a298828a28a0028a28a0029412ac083823906928a00e8ad2e05cc0affc5d187a1a9ab0b4eb9f22e30c7e47e0fb7bd6ed21853278fcd81e3fef29029f450072f454f7b1f957722f6ce47e35053105145140074ae8ed66f3ed924ee473f5ae72b5346979784ffbc3fad203528a28a061451450014514500145145002330452cdc00326b9b9a432cad2375639ad8d565f2ed760eae71f85625020a28a298051452a2977551d58e05006e6991f9766a7bb7cd56e9114222a8e8a3029690c29b248b146cec70aa3269d595ab5ce5840a781cb7d7d280284f2b4f3348dd58fe551d145310514514005145140051451400e8d0c922a2f5638ae95542a851d00c0ac8d221df334a4708303eb5b1486145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001583a8c3e4ddb607cadf30adeaa1abc3be05900e50f3f434018d4514531051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140056fe9f27996719eea369fc2b02b57469389223fef0febfd2901a745145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802aea5279764feadf28ac1ad4d664ff00571fd58ff9fceb2e810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00d3d1e2cb3cc474f947f5ad5a82c62f26d235ee464fd4d4f48614514500145145001451450014514500231daa4d57eb52cc7802a1a04145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001546eecb3978473dd7fc2af5140183d28ad4bab41302c9c3ff003acc652ac558608ea298094514500145145001451450014514aaa5d82a8c93d8500275e95a16965b70f30e7b2fa7d6a5b5b4108dcfcbff002ab348028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a4911644646190c306968a00e6a689a195a36eaa714cad6d5edf7209d472bc37d2b26810514514c028a28a0028a28a002b774db9f3edf6b1f9d383ee3b1ac2a9ad2736d3abf6e8c3d45203a2a29b1ca92a078d8329f4a7503327598f124727f7860fe1ffebacdad3d66405a38c1e4649acca04145145300a9ece4f2aee36ed9c1fa1a828a00ea28a6c2fe6428ff00de5069d48614514500145145001451450062ead26fbad9d9063f1aa3525cbf9971237ab1a8e98828a28a002ade991f997a99e8bf3554ab9a5c823bc1b8e038db480dca28a1982a9662001d49a06457538b781a43d7a01ea6b9d662ec598e493926adea3742e25010feed7a7b9f5aa740828a28a60145145001451450014004900724d157f4ab7f326f3587ca9d3dcd0069da41f67b758fbf56fad4d4514861451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014d9504b1b2374618a751401cc329472add41c1a4abbaac5e5dd961d1c67f1aa54c4145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500156b4d93cbbd4f46f94d55a54628e18750722803a7a291583a061d08c8a5a430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a0900127a0a00c2d4e4f32f5fd170a2aa53a472f2339eac49a6d31051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140054d69179d751a762727e950d69e8d165a494f61b45203568a28a0614514500145145001451450014514d90ed434010b9dcc4d368a28105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400543716c938e7861d1aa6a280329ec6753c2861ea0d37ec93ff00cf33f98aba6fe1048c371ed47f6843e8ff00950052fb24ff00f3ccfe628fb24fff003ccfe62aeff6843e8ff951fda10fa3fe54014bec93ff00cf33f98a3ec93ffcf33f98abbfda10fa3fe547f6843e8ff950052165393f731f522b46dad9605f573d4d312fa2770a03649c0e2acd00145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014a3a8a4a51d450059a28a2818514514005145140051451400514514005145140051451400514514008ca1d4ab0c82304573b7501b79da33d0743ea2ba3aa7a95b79f06f51f3a723dc50061d14514c41451450014514500145145003e29a485b746e54fb5593a9dc95c6e5faedaa745002b31762cc4927a93494514005145140051451401d0d89cd945feed4f50d9aedb4887fb20d4d4861451450014514500141e9451401cbd14ac36b153d8e29298828a28a0028a28a00b69a95ca2edde1b1dd864d4335ccd3ff00ac7247a76a8a8a0028a28a0028a28a0028a28a0028a28a00722348ea8a32cc702ba2b7856085635edd4fa9aa1a4db75b861ecbfe35a748614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450051d5a2df6a1c75439fc2b16ba6910491b21e8c315cd329562a7a83834084a28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401bfa749e65947eabf29fc2acd6668cff002491fa10c2b4e90c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a0be7f2ece53ea31f9f153d67eb0f88113fbcd9fca8031e8a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800adfd3e2f2acd0776f98fe35870c7e6cc918fe220574a000303a0a40145145030a28a2800a28a2800a28a2800a8a63c8152d5763b989a006d145140828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00c27fbedf5a4a57fbedf5a4a601451450014514500496fff001f11ff00bc3f9d6d562dbffc7c47fef0fe75b548028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28030f51b6f227dca3e47e47b1f4aa75d1dd402e2068cf5ea0fa1ae75d4a39561820e08a042514514c028a28a0028a28a0028a28a0028a28a0028a28a0029d1a1924541d58e29b57b4a87ccb9de47118cfe3401b4a02a803a018a28a290c28a28a0028a28a0028a28a00e7efe3f2ef241d89dc3f1aaf5abac4390930edf29fe959540828a28a6014514500145145001451450014514500145145001535ac06e2758c74ea4fa0a86b774eb6fb3c1961f3bf27dbda9016954228551800600a5a28a061451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001585a9c5e5de311d1fe6addaced623cc4920fe1383f8d0064514514c41451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145005cd29f65e01fdf047f5fe95b95cdc0fe5cf1bff007581ae9290c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b1f587cdc227f757f9d6c573f7efbef653e871f9714015e8a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802f6931efba2fd907eb5b5543488f6db33f776fd07f9357e90c28a28a0028a28a0028a28a0028a28a006c87086abd4b31e82a2a041451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450061c80876c8239a6d6bde8cdabfe7fad64500145145300a28a28026b5466b842aa480c09f6ad8aaf62316abef93fad58a40145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014a3a8a4a51d450059a28a281851451400514514005145140051451400514514005145140051451400514514005666ad6dc7da107b37f8d69d2328752ac3208c11401cc51535ddb9b69d90f4eaa7d45434c4145145001451450014514500145145001451450015bfa7c1e45aae47ccdf31acad3adfcfb8191f22727fc2b7a9005145140c28a28a0028a28a0028a28a0064f109a178cff10ae6dd4a39561820e08ae9eb2756b7dae2751c370df5a00cda28a298828a28a0028a28a0028a28a0028a28a0028a29d1a34b22a20cb31c0a00b7a65b79d3798c3e44fd4d6dd476f0ac10ac6bdba9f5352521851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400545771f9b6b2277238fad4b450072f454b751f957322760dc7d2a2a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ae92d9fccb68dfd5466b9badcd29f75901fdd247f5feb480b945145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28006215493d00cd730cc598b1ea4e6ba0bd7d96729ff00671f9f15cf5020a28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051454b6b1f9b731a762c33f4a00dfb68fcab68d3b8519fad494514861451450014514500145145001451431c2934015e439734da28a04145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145003271ba0907aa9ac4ade3c8c561118247a5002514514c028a28a00dab61b6da31fec8a929106d451e8314b48028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802aea16df68832a3e74e57dfdab06ba8ac5d52dbca9bcd51f23fe86811468a28a60145145001451450014514500140049c0eb45686956dbe4f3987ca9f77dcd0068595b8b6b70a7ef1e5beb5628a290c28a28a0028240ea7159b7ba96c263b7209eefe9f4aca67676dcec58fa93401d3d15cec17735b9f91ce3fba7a56d5a5e4774bc7cae3aa9a00b1451450014c9a259a268dba30a7d1401cd4b1b432b46fd54e2995b1aadb6f8fcf41f32fdef7158f40828a28a6014514500145145001451450015afa4db6d4f3dc72dc2fd2a8595b9b99c2ff08e58fb574000000030074148028a28a06145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450063eaf1edb857ecebfa8ff0022b3eb67578f75b07ee8dfa1ff0022b1a810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b53467ff5a9f422b2eaee92fb6f00fef291fd7fa52036e8a28a06145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450051d5df6da05fef30158b5a9ad373127d4d65d020a28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140055fd21375d17feeafeb542b63474c40eff00de6c7e5ffeba40685145140c28a28a0028a28a0028a28a0029929c263d69f50cc7e603d28023a28a281051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400562dc0db7120ff0068d6d564df0c5d3fbe0fe94015e8a28a6014e8c6e9157d4814da96d466e631fed66803668a28a40145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014a3a8a4a51d450059a28a28185145140051451400514514005145140051451400514514005145140051451400514514005473c2b3c2d1b7423afa5494500733246d148c8e30ca7069b5afab5b6e4f3d072bc37d2b22810514514c028a28a0028a28a0092089a795635ea7f4ae8a28d628d6341c28c554d32d7c98bcc71f3bfe82aed218514514005666a57d8cc111e7f8987f2a9b51bcf213cb8cfef1bff001d158940828a28a6014aacc8c19490c3a114945006e58df0b95d8f8128fd6ae5730ac558329208e4115b9637a2e576be04a3afbfbd2196e8a28a00080460f22b02fad8db4e40fb8dca9adfa82f2dc5cc053f8872a7de8039ea29594ab1561820e08a4a620a28a2800a28a2800a3ad15a1a55b7992f9cc3e54e9ee6802fd8db7d9a0008f9db96ff000ab345148614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450045749e65ac89eaa71f5ae72ba8ae6e74f2e7913fbac450223a28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140054d66fb2ee26ff680a86941c10476a00e9e8a4560ca18742334b486145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450062eacdbaf31fdd503fad51ab17cdbef653fed63f2e2abd020a28a298051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005741609e5d9443d467f3e6b0141660a3a938ae99542a851d00c520168a28a06145145001451450014514500155dce5cd5827009aab409851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005666a4313a9f55ad3aa1a98ff0056df51401428a28a601566c066e94fa026ab55cd347ef98fa2d00695145148028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28002030208c83c115cf5e5b9b6b829fc27953ed5d0d57bcb55ba882e76b0e41a00e7e8a9e7b39a03f3a12bfde1c8a8298828a28a002aee9b6be7cdbdc7eed3f53e94cb7b09e7c1dbb17fbcd5b5042b042b1a741dfd690125145140c2abde5d2dac59eae7ee8a927992088c8e781fad73f713bdc4a6473d7a0f41400d77691cbb9cb139269b4514c4145145001451450014a8cc8c19490c39045251401bd6378b729838120ea3d7dead57331bb46e1d0e187435bd6776b751fa38fbcb48658a28a28032f56b5ff97841ecff00e35975d3b28652ac3208c1158d73a64b112d10f313dba8a0451a294820e08c1f7a4a60145152436f2ce711a16f7ed4009146d34ab1a0e58e2ba2862586258d7a28fceab58d8fd9b2ee43484638ed57290c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b0f554d97a4ff007803fd3fa56e565eb29fea9fea0d0065d14514c414514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450074564dbece23fec81f97153553d29b75901fdd623faff5ab94861451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514c99b641237a293fa500739236f919bd4934da28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802c58a6fbc887fb59fcb9ae82b1b484dd745bfbab5b3486145145001451450014514500145145003653843ef55ea698f0054340828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002aa6a433029f46ab7505f0cdabfb60feb4019145145300abfa60e243f41542b4f4d18818fab5202dd14514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001513dac127de8909f5c62a5a2802b7f67daff00cf21f99a963b7862fb91aa9f5039a928a0028a28a00291dd6342ee70a392696b2f5894fc9083c7de3fd28029de5d35d4b9e883ee8aaf4514c4145145001452aab3b0550493d00ad8b3d35235dd380ee474ec29018d455ebeb06809923cb47faad51a601451450014f8a578640e870c299450074369749751e470c3ef2fa54f581a74863bc8f1d18ed3f8d6fd21851451400d9228e4ff00588adf519a80e9f6a7fe588fccd59a280204b3b64395857f119fe7538000c01814514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400553d55375913fdd607fa7f5ab9515d26fb5957d54d0073945145310514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401ada33663957d083fe7f2ad2ac8d19b13c8beab9fd7ff00af5af48614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500155efdb6d94a7db1f9d58aa7ab362c88f56028030e8a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280357465f9257f520569d53d2976d903fde627fa7f4ab9486145145001451450014514500145145004331f9fe951d39ce5cd36810514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140054770375bc83fd935250464107bd0060d1474a298056b588c5aafbe4feb5935b56c36db463fd91480928a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ac5d5c11760f628315b555350b43731029feb17a7bfb50061514acac8c55810475069298829f0c4f3481235c93562db4f9a72091b13d5bfc2b62dede3b64db18fa93d4d2023b3b24b55cfde90f56ff000ab345140c3a8c1ac9bfd3b6e65807cbd4afa7d2b5a8a00e5e8ad9bbd316525e1211cf51d8d66c9677119f9a26fa8191408828a7886563811b93eca6acc1a6cf2905c796bea7afe54c04d36132dda9c7ca9f3135bb51dbc096f1ec8c7d4f73525218514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051d4514500732ebb1d94f624536ac5f2ecbd947fb59fcf9aaf4c41451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145005cd29b17aa3fbc08adcae7ac5b6dec47fdac574348614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500159dacb6208d7d5b3fa7ff005eb46b2b5a6f9a15fa9fe54019945145310514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401d1592ecb3887fb39fcf9a9a9117622afa0029690c28a28a0028a28a0028a28a0028a291ce10fd2802bd25145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a18855249c01d68aa1a8cc78854fbb50051639624773494514c02b6e0747894a1c803158953da4c619873f2b706901af4514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014a3a8a4a51d450059a28a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400d78e393efa2b7d4669121890e523453ea140a7d140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140189ab2edbccff007941fe954ab4f595f9e26f5045665020a28a29805145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400f85b6cd1b7a303fad74b5cbd74ea77283ea334805a28a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400563eb07fd2507a27f535b1587aa9cde91e8a050053a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029f02ef9e35f5603f5a6558b05dd7b10f7cfe5401d05145148614514500145145001451450014d94fc869d51cdf747d68021a28a281051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005645ee7ed7267dbf956bd50d4613c4ca3d9a8028514514c028a2ac5942659c123e55e4d006b0e945145200a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a51d452528ea2802cd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00cfd6573046de8d8fd3ff00ad58f5b9aaae6c98ff00748358740828a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015d25b1cdb447d507f2ae6eba0b039b288fb62901628a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451505c5dc70704ee6fee8a4dd86a2e4ec89eabcd7b0c5c03bdbd16b3a7bb966e09dabfdd150a21770aa3249c0acdd4ec75430fd646b5a4f25c333901631c003b9ab34c8631144a8bd00a7d68b6d4e69b4de9b0514514c90a28a2800a28a2800a28a2800ac1d48e6fa5fc07e95bd5cf5e9cde4bfef1a00828a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ab9a58cdea9f404d53ad0d1c7fa4b9f44fea2901b145145030a28a2800a28a2800a28a2800a8a6ed52d4337de1f4a008e8a28a041451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500141018104641a28a00cabbb530b6e5e633fa556ade2030208c83dab3a5b06f3808fee1ee7f86802b430b4ce1507d4fa56bc312c31845fc4fad10c290a6d41f53eb4fa0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294751494a3a8a00b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802bdf8dd6528f6cd73f5d25c8cdb4a3d50ff002ae6e810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b7b4c39b18fdb23f5ac1adbd24e6cfe8c6901768a28a06145145001451450014514500145145005292f24b798a4aa197a823838ab10dcc537dc6e7d0f5a8efe0f361dc07cc9c8ac8e9d2b37271675429c6a46eb467414565417f2478127cebfad694534732ee46cfb77154a4998ce94a1b8fa28a2a8cc28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029198229662001dcd3279d204cb9e7b0ee6b26e2e5ee1b2c70bd947415329246b4e939fa162e7502d958781fdeee6a8f539345158b6dee77460a2ac82b474d8383330f65aa504466955077ea7d056daa8450aa3000c0aa82bea63889d972a168a28ad8e20a28a2800a28a2800a28a2800a28a2800ae72e4e6ea53fed9fe75d1d73329ccae7d58d021b45145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ad3d147cf29f40056656ae8a3e598fb8feb480d3a28a28185145140051451400514514005412fdfa9ea093ef9a018ca28a28105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500238dc8c3d462b98aea2b98618723d0d02128a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015b3a39ff004671e8ff00d056356b68c7f7528ff6852034a8a28a0614514500145145001451450014514500158f7b07933640f91b915b1515d422784aff001751f5a992ba35a53e491894e4768d83231047714d208383c1145607a1b9a96d7eb26165c2b7af63572b9fab76b7ad0e15f2c9fa8ad233ee72d4a1d626ad1488eb228642083de96b539028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002abdd5dac0368f99fd3d3eb4cbcbc116523e5fb9f4aca24b1249c93deb394eda23a6951e6d65b0e924691cb39c934da28ac8ecd828a2ac5941e7cc323e45e4d095c526a2aecbba7c1e545bd87ccffa0ab74515d095958f36527277614514532428a28a0028a28a0028a28a0028a28a002b986e589f7ae9c9c0cd72f40828a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015b1a30fdc487fdafe958f5b5a3ffc7a37fbe7f90a405ea28a28185145140051451400514514005577fbe7eb562abb7de3f5a04c6d14514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400528ea29294751401668a28a061451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015cdce317120f463fceba4ae76ef8bb9bfdf3fce8110d14514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b5745e930fa7f5acaad4d14f330fa7f5a406a5145140c28a28a0028a28a0028a28a0028a28a0028a28a00ccd460d8fe6a8e1bafd6a956f4b1acb1b237422b0e4468e4646ea0d6338d9dceea13e6567d06d1451507412dbdc3dbb657907aafad6bc3324e9b90fd47715874f8a5785c3a1c1fe7551958c2ad253d56e6ed150db5c25c26470c3aafa54d5ba77385a69d985145140828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a9dede79798e33f3f73e945eddf943cb8cfce7a9f4acbeb59ce7d11d3468dfde90753934514564768514514000049c0eb5b56b0791085fe23cb7d6a969d06f93cd61f2af4fad69d6b05d4e3c44eef950514515a1ca145145001451450014514500145145001451450023f11b7d0d7315d34bfea9ffdd35ccd020a28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140056de93ff1e7ff000235895b9a57fc790ff78d202e5145140c28a28a0028a28a0028a28a002ab1fbc6acd1401568ab54502b1568ab5450162ad156a8a02c55a2ad514058ab455aa280b1568ab5450162ad156a8a02c55a2ad514058ab455aa280b1568ab5450162ad156a8a02c55a2ad514058ab455aa280b1568ab5450162ad156a8a02c55a2ad514058ab455aa280b1568ab5450162ad156a8a02c55a2ad514058ab455aa280b1568ab5450162ad156a8a02c55a2ad514058ab455aa280b1568ab5450162ad156a8a02c55a2ad514058ab455aa280b1568ab5450162ad156a8a02c55a2ad514058ab455aa280b1568ab5450162ad156a8a02c55a2ad514058ab455aa280b1568ab5450162ad156a8a02c55a51d4559a280b05145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b9ebde2f25ff0078d7435cfdff00fc7ecbfef50057a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b4b46ff00592fd0566d6968dfeba4ff0076901ad45145030a28a2800a28a2800a28a2800a28a2800a28a2800aa3a941b904aa395e0fd2af50402082320d26aeac5424e32ba39fa2a5b984c1314edd41f6a8ab9de87a69a6ae828a28a063a391a270e870456c5b5cadc26470c3a8ac5a7472344e1d0e08aa8cac6556929af337a8a86dae16e23c8e18751e95356e9dcf3da69d985145140828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002ab5e5d08136affac3d3dbdea4b99d6de2dc7927a0f5ac577691cb31c93d6a272b688e8a34b99ddec21249249c9345145627685145140c29510c8e114724e0525686990f59987b2d38abbb11527c91b97628c4512a2f4029f4515d0798ddf50a28a2800a28a2800a28a2800a28a2800a28a2800a28a2801937fa97ff0074d7355d2cdfea64ff0074ff002ae6a810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b734aff008f25fa9ac3addd2ffe3c97ea7f9d202dd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b9fd43fe3f65faff4ae82b0350ff8fe97ebfd2802b514514c4145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015a3a37fae93fddfeb59d5a3a37faf93fddfeb480d7a28a28185145140051451400514514005145140051451400514514015afe0f361dc07cc9c8ac8ae82b1ef61f267381f2b722b2a8ba9d7879fd9657a28a2b33ac28a28a007c32b4320743c8fd6b66099678c3afe23d2b0ea6b6b86b79370e54f51eb551958c2ad2e7575b9b545223aba0653907a52d6e70051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400523bac68598e00eb4b599a85c6f7f294fcabd7dcd4c9d91a53873cac57b89da794b9e9d87a0a8a8a2b03d1492564145145030a28a2801d1a1924545ea4e2b723411a2a2f40315434c8b2cd29edc0ad1ad60b4b9c3889de5cbd828a28ad0e70a28a2800a28a2800a28a2800a28a2800a28a2800a28a2801b37fa97ff0074d7335d34bfea9ffdd35ccd020a28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140056e695ff1e4bf535875b9a4ff00c790ff0078d202e5145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a4660a39a6f9abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef479abef400fa299e6afbd1e6afbd003e8a679abef4e560dd280168a28a0028a28a0028a28a0028a28a002b9fbff00f8fd97eb5d0573d7dff1fb2ffbd4010514514c4145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015a3a37fae93fddfeb59d5a5a37fad97fdd1480d6a28a2818514514005145140051451400514514005145140051451400557bd87ce80e07ccbc8ab14526ae38b7177473f454f79179370c07dd3c8a82b9dab1e9c5dd5d051451414145145005bb0b9f29fcb73f237e86b56b9fad5d3ee3cd8fcb63f3afea2b484ba1c95e9fda45ba28a2b539028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00af793f910f07e76e0563d4d77379f396fe11c2fd2a1ac24eecf42943923e614514549b05145140051454d671f997283b0393f850b525bb2b9ad6f1f9502277039fad494515d2798ddddc28a28a0414514500145145001451450014514500145145001451450023f28c3dab98aea2b97a04145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800adad23fe3ccffbe7fa562d6ce8e7fd1587fb67f90a405fa28a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514011cdf747d6a1a9a6fba3eb50d020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a9a1fba7eb50d4f0fdd3f5a007d145140c28a28a0028a28a0028a28a002b9dbcff8fc9bfde35d1573974737537fbe7f9d0045451453105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400569e8bf7e53ec2b32b5345ff0096c7fddfeb480d4a28a2818514514005145140051451400514514005145140051451400514514014f528b742241d50fe95975bd220923643d1862b04820907a8ac6a2d6e76e1e578d828a28a83a428a28a0029d148d148aebd45368a04d5cde8dd658d5d7a114eacdd367dac6163c1e47d6b4aba22ee8f36a4392560a28a2990145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001557509bcb83683f33f1f855aac6bc97ceb8620fca3815137646d461cd2f420a28a2b13d00a28a2800a28a2800abfa5a65e47f418aa15a9a60c5bb1f56aa86e635dda0cb9451456e79e1451450014514500145145001451450014514500145145001451450015cc30c391ef5d3d73530c4d20f463fce810ca28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140056be8c7f7320ff006ab22b57453c4c3e9fd6901a745145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a04145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500153c5f72a0ab117fab1400ea28a2818514514005145140051451400573531ccce7d58d74b5cc13924fad02128a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015aba28f9663ee3fad6556be8c3f7321ff006a901a345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ac6bc4d97520f539fceb66b2f5318b807d56a2a6c7461dfbf629d1451589dc14514500145145002ab1560c0e083915b90c826895c77158557f4c970cd113d791570767639ebc2f1bf63468a28ad8e10a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28021bb97cab7661d4f02b16af6a7266458c76193546b09bbb3be846d0bf70a28a2a4dc28a28a0028a28a002b5b4eff8f51fef1ac9ad5d30e6d88f463570dce7c47c05ba28a2b638428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b9cba18bb9bfdf3fceba3ae7af862f65ff007a8020a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b4b463fbd907aa8359b57f4838bb61ea87f98a406cd145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008e6fba3eb50d4d37dd1f5a868105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005594fb82ab55a5e147d2804145145030a28a2800a28a2800a28a2801b29db139f4526b99ae8eecedb494ff00b07f9573940828a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015b3a38ff4463eae7f90ac6adcd2462c87bb1a405ca28a281851451400514514005145140051451400514514005145140051451400566ea9feb53fddad2accd50fefd47a2ff5a89ec6d43e32951451589e80514514005145140053a27314aae3f84e69b45026ae740a432861d08c8a2aae9f26fb60a7aa1c55aae84eeae79928f2b6828a28a648514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051454574fe5db48ddf181431a5776322793cd9ddfd4f1f4a8e8a2b98f512b2b05145140c28a28a0028a28a002b434b6ff589f4359f566c1f65d2fa3714e2ecccaaabc19af45145741e7051451400514514005145140051451400514514005145140051451400560ea6317d27be3f956f5626ac31799f55068029514514c41451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500156f4c38be4f7c8fd2aa54f6476de447fda02803a1a28a290c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008e6fba3eb50d4d37dd1f5a86810514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400a3ad59aae9cb8fad58a0105145140c28a28a0028a28a0028a28a00ada89c58cbf80fd6b02b6f566c59e3d580ac4a04145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800adfd3462c63fc7f99ac0ae8ac86db3887fb20d2026a28a281851451400514514005145140051451400514514005145140051451400563dfb6ebb7f6c0ad86215493d00c9ac0762eecc7a939acea3d2c74e196ad894514564768514514005145140051451401734d936ce53b30fd6b52b0a17f2e647f439addad69bd0e1c446d2b8514515a1ce1451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500154f537c40abfde6ab9599aa366545f45cd4cf635a2af3452a28a2b03d10a28a2800a28a2800a28a2800a55255830ea0e45251408de8dc491ab8e8c334eaa3a64b94688f51c8fa55eae88bbab9e6ce3cb26828a28a6405145140051451400514514005145140051451400514514005646b23f7f19f55c7eb5af599ad0e213f51fca8032a8a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a746db6456f420d368a00ea28a642dbe18dbd541fd29f486145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004737dd1f5a86a69bee8fad4340828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a007c43e7153d4308f989f6a9a818514514005145140051451400514514019bacb7eee25f524ff009fceb26b47596ccd1afa2e7fcfe559d40828a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015d2c036c118f4503f4ae6c0c903d6ba70303148028a28a061451450014514500145145001451450014514500145145001451450056d424f2ed881d5f8ac8ab5a84be65c151f7538fc7bd55ac26eecf428c796014514549b051451400514514005145140056e5b3efb78dbfd9ac3ad6d35b75ae3fbac455d3dce6c42f76e5aa28a2b638828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b23506cddb7b003f4ad7ac4bb39ba93fdeacea6c746197bcc8a8a28ac8ee0a28a2800a28a2800a28a2800a28a2801f04a61955c763cfd2b715832865390464560568e9b3e41858f2395ab83e873622175cc8bf451456c710514514005145140051451400514514005145140051451400550d61736c8de8ffd2afd54d517758b9f420feb4018545145310514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401d069edbaca23e831f9558aa3a4366d4aff758d5ea430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a041451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004d08e09a929b10c20a75030a28a2800a28a2800a28a2800a28a28030f546dd7ac3fba00aa7535db6fbb95bfda350d31051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140125b2eeb9897d5c7f3ae92b034f5dd7d10f7cfe95bf486145145001451450014514500145145001451450014514500145145001515d4de440cdfc5d07d6a5ac8be9fce9b0a7e45e07bd4c9d91ad2873c8add68a28ac0f4428a28a0028a28a0028a28a0028a28a002b474a6f9645f706b3aaf6967f7ae3fd9aa86e63595e0cd2a28a2b73cf0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ac3b8e6e24ff0078ff003adcac29ff00d7c9fef1fe759d4d8eac36ec651451591d81451450014514500145145001451450014a8c518329c10722928a046e5bcc278838ebdc7a1a92b16d6e0dbcbbbaa9fbc2b65195d4329c83d0d6f195d1e7d5a7c8fc85a28a2a8c828a28a0028a28a0028a28a0028a28a0028a28a002a1bd5dd6728ff649fcaa6a49177c6cbea08a00e628a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28034f467f9a54fa1ad5ac4d29f6de81fde523faff4adba430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a8a7b88edd54c8480c71c5004b4500860083907a1145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014557bdb936b1ab850c0b608a9d183a0653904645002d14514005145140051451400514514005145140051451400514514011cdf747d6a1a9a6fba3eb50d020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a5519602802c28c281ed4b45140c28a28a0028a28a0028a28a00291982a963d00cd2d417cfb2ce53fece3f3e28039f272493de928a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00bba4aeebccff007549adbac9d197324ade800ff3f956b5218514514005145140051451400514514005145140051451400514545713ac11963c9ec3d68d86936ec886fee7ca4f2d4fcedd7d8565539dda472ec724f5a6d73c9dd9e8d387246c1451452340a28a2800a28a2800a28a2800a28a2800ab9a67fc7cb7fb87f98aa75734cff8f93fee9fe94e3b99d5f819a945145741e685145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400561dc8c5ccbfef1adcac6be18bb93f3fd2b3a9b1d386f899051451591da14514500145145001451450014514500145145001566cee8c0db5b98cfe955a8a13b1328a92b33a00430041c83d0d15936776603b5f98cfe95aaac194329041e8456f195cf3ea537062d1451546614514500145145001451450014514500145145007373aecb8917d188fd6a3ab3a8aedbe93df07f4aad4c41451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004b6afe5dd44dd830cd7475cbd74d13f99123ff7941a403a8a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450004e066990cd1ce9be36dc29f586d23d8df49b3a67eef62280372ab6a10f9d68c00f997e6152dbce97118743c771e9525006469979e5b08243f29fba7d0d6bd73f7b079172ca0614f2bf4abfa7dff9804331f9fa2b1eff00fd7a0468d04e064f4a2919432953d08c1a0628208c839145635b5d3d94cd0cb9318383edee2b611d5d4321054f42280168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00a3abff00c7a0ff007c7f5a5d264df69b4f546c7e150eb2ff002c49ea49a3453c4c3e9fd6802f1b851742023e62bb81a96b2ae5f1acc7ec547e7ffebad5a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008e6fba3eb50d4d37dd1f5a86810514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140053e2197fa532a5847534012d145140c28a28a0028a28a0028a28a002a8eaefb6d557fbcd57ab27597ccb1a7a0cfe7ffeaa00cda28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00d8d1971048dead8fd3ff00af5a15534c5db629fed127f5ab74861451450014514500145145001451450014514500145151cd32409b9cfd07ad0349b7642cd2ac319773c7a7ad634f334f2176fc07a52cf3bcefb9ba761e951561295ceea54b915dee14514549b8514514005145140051451400514514005145140055dd2c7efd8ffb3fd6a955fd2873237d05543732adf033468a28adcf3828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b2f535c5c03eab5a9547544ca46fe871513d8da83b4d19b45145627a01451450014514500145145001451450014514500145145001562d6e9addb07943d4557a284ec4ca2a4accde8dd6440c8720d3ab16dae1eddf23953d57d6b622956540e8720d6f195ce0ab49c1f90ea28a2a8c828a28a0028a28a0028a28a0028a28a00c6d617172adfde5aa15adacae5227f4247f9fcab26810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b7b4c7df649eab915835aba33fcb2c7ee1852034e8a28a061451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001597ac41cace071f75bfa56a5364459636471956183401cf5bdc3db49bd0fd47635bd6d709731ef43f51dc5615d5b35b4a51b907ee9f514c86678240f1b60ff3a046ededa8ba8b1d1d7ee9ac17468dcab82187515b7697f1dc00a7e493d0f7fa52ded9add26460483a1fe868029d9ea65311cf92bd9bb8fad6aab2ba8652083d08ae6a4468dca38218751525bdd4b6cd98db8eea7a1a00bdabdbf2b3a8f66fe954ed6f24b56f97943d54d6a437905e2189fe566182a7bfd2b26ead9ada528dc83f74fa8a00dcb7ba8ae57319e7ba9ea2a6ae6159918329208e84569daeabd16e07fc0c7f5a066a5148acaea1948607a114b40051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140189ab3eebcdbfdc503fad58d17a4df87f5aceb893cdb891fb1638abda6ca20b5b890f6c63dcd022bdc3eed4cb7a4807e5c56f57351e5a7427a961fceb72e6768a7b745380ed83401668a28a0614514500145145001451450014514500145145004737dd1f5a86a69bee8fad4340828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2986688315322823b13400fa28041190411ed4500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500156221841ef50559030314020a28a2818514514005145140051451400560ea2fbef64f41c56f1215493d0735ccbb177673d58934086d14514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a29c8bbe4551dc81401d0daaecb6897d1454b474a290c28a28a0028a28a0028a28a0028a28a0028a2a0bab95b74f573d0526ec349c9d90eb8b84b74cb72c7a2fad63cd33cce59cf3d87a5249234ae5dce49a6d63295cefa7494179851451526c14514500145145001451450014514500145145001451450015a9a62e2066f56acbadab34d96b18f519fceae9ee73e21da1626a28a2b638428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a0bd4f32d5c770323f0a9e823230693d471767739fa29f327952b27a1a65739ea277d428a28a061451450014514500145145001451450014514500145145001535b5c35bc991ca9ea3d6a1a284ec26935666fa3ac88194e41e94b597a7dc7972794c7e56e9ec6b52b78bba3cea90e495828a28aa330a28a2800a28a2800a28a28029ea89bac98ff7483fd3fad61d747749e65b4abeaa6b9ca04145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ab9a5c9b2f1476704553a7c4fe5ca8e3f8483401d2d14039191d28a430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28032eee496caf4ca9cc727254f4357adaea2b95ca1e7ba9ea29d7102dc42636efd0fa1ac092396d66c1cabaf422811bd71025c4451ff03e86b06e207b794a38fa1f5abf6daaf45b81ff00031fd455d96286f60c6430ecc3b50073d57ad753922c2cbfbc4f5ee2abdcdb496d26d71c7661d0d43401b92c76fa8c59461bc743dc7d6b1e7824b793648b83d8f634d4768d83231561dc55f4d412688c5789b8766028033aa76ba91e0f2a4f9c0e549ea2a0a2980514514012c1732dbb6636c0ee0f435ad6da94536164fddbfbf43f8d6251480ea28ac0b6be9adf001dc9fdd35ad6d7d0dc6006daff00dd6a0659a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800aaf7b3882d99b3f31185fad4d2c891465dce145605e5cb5d4bb8f0a3851e9401052ee3b76e4edce7149453112db0cdd443fdb1fceafea726dbdb71fddc37ebff00d6aa56207db22c90003924fb52dd4de7de338e99c0fa5203a0a28a281851451400514514005145140051451400514514011cdf747d6a1a9a6fba3eb50d020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a8e6b88e15259867fba3ad004950adcc6676873823bfad67fdb67dcc43e013d31d2a0c9ce73cf5cd006e9200c93802aac97f1270b973edd2b3e49e59400ee481daa3a009e5bb9a427e62a3d1696dae8c01c63208e3eb55e8a605f82f82c0de612ce0f1ef545d8bb963d49cd2514016f4f9f649e5b1f95ba7d6b4eb06a75bc9d40024e07a806901a37170902f3cb1e82a48dd6440ea720d62bbb48c59ce49ef4ab348a8515c853ce05006dd1546cef33fbb95b9ecc6af500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145003e3197153d4508ea6a5a061451450014514500145145001451450057bf93cbb390f7231f9d73f5afacc988a38fd4e4fe1ff00ebac8a04145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ab1609bef621e873f97355eafe8e99b966feead203668a28a0614514500145145001451450014514330552c4e00e4d00457370b6f1ee3cb1e83d6b19dda472ee724d3ee2633ca5cf4e807a0a8ab094aecf42953e45e614514549b051451400514514005145140051451400514514005145140051451400e8d4bc8a83ab1c56f000000741595a747bee371e8833f8d6ad6b4d69738b132bc920a28a2b439828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00cdd4e2c3aca3a1e0fd6a8d6e5cc5e740c9dfb7d6b0c8c1c1eb58cd599df42578dbb051451506e1451450014514500145145001451450014514500145145001451450015b76b2f9d02bf7e87eb5895a1a5bf2f1ffc0855c1d99cf888de37ec68514515b1c214514500145145001451450015cd4a9e5cae9fdd622ba5ac1d49365ebfa360d0055a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00e82c64f32ce33dc0c1fc2ac566e8d265248cf63b85695218514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400545716d1dca6d907d08ea29b7ab29b72d0b1575e78ef59f0ead22f132871ea38340105cd84d6e49c6f4fef0feb50453490b6e8dca9f6adf82ee1b8fb8e377f74f06993d8413e495dadfde5e28114575149a3f2eee2dc0ff0012d529951242227de9d41ab171a6cd164a7ef17dbafe554e800a28a29805145140051451400514514005145140172df519a1c063e627a375fceb56def21b81f2361bfba7ad73d45203a8a2b12df529a2c07fde2fbf5fceb52def21b81f2361bfba7ad0327a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a6c9224485e460aa3bd002bbaa29662028ea4d6536a99b9df83e5a83b54773ea6abdedeb5d3607cb18e83d7eb55681135cdd4972f973c0e8a3a0a868a2980514514005496ebbee235f5602a3abba547beec376419a00dba28a290c28a28a0028a28a0028a28a0028a28a0028a28a008e6fba3eb50d4d37dd1f5a8681051451400514514005145140051451400514514005145140051451400514514005145140051451400532690451339ec2896648572e71e9ef59775726e1b8e1074140138d449521d3923aa9aa34514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002ad5a5d081183066cf4c555a280352daecdc4acbb42803239ab5589148d138743835a505ec72e15be573c63d6901668a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a29546580a009e318414ea28a0614514500145145001451450014514120024f4140187aac9bef08ec800aa74e95cc92bb9eac49a6d31051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140056be8c988a47f5603f2ff00f5d6456f69a9b2c93d5b269016a8a28a06145145001451450014514500154b52976c6231d5b93f4abb58d7cfbee9fd17e515137646d423cd3f420a28a2b13d00a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a92088cd32a0ee79fa5026ecaecd2d3e2f2edc31eafcfe156a8000000e828ae84acac799297336c28a28a648514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400565ea306c97cc51f2bf5fad6a53258d658d91ba1fd2a64ae8d29cf925730a8a74b1b4521461c8a6d607a29dc28a28a061451450014514500145145001451450014514500145145001566c1b6ddafbe4556a7c2fb2646f420d0b464cd5e2d1bb45145749e58514514005145140051451400564eb2989237f5047f9fceb5aa96ac9bad377f7581fe940189451453105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514016f4c93cbbc51d9be535bb5cc2b1560c3a83915d346e248d5c74600d20168a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001587a8db79139651fbb7e47b1f4adca6c91a4a851d4329ec680399ab115f5c45d24247a373566e74b7425a03bd7fba7a8acf656462ac0823b11408d38b57ed2c5f8a9fe94b72f6577133070b2819048c1fa7bd6551400514514c028a28a0028a28a0028a28a0028a28a0028a28a00280483907068a280346d35364c25c6597fbddc56b232ba86520a9e845731562d2ee4b57e3943d56901d0514c86649e30f19c83fa53e8185145140051451400514514005145140051451400514514005145140051451400514514005148cc154b31000ea4d665dea99ca5bffdf67fa5005cbabc8ad87cc773f65158b717325cbee90f1d94741511258924924f52692810514514c028a28a0028a28a002b6f4b83cab6de47cd273f876acdb1b537330c8f917963fd2b7c631818c0e38a40145145030a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a0414514500145145001451450014514500145145001451450014514500145145001451450014519c75a28033b52901758c755e4d52ab9a915f3971f7b1cd53a0028a28a601451450014514500145145001451450014514500145145001451450014a090411d45251401ba8dbd1587719a5a642310a0f4514fa40145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001524232d9f4a8eac44309f5a0075145140c28a28a0028a28a0028a28a002ab6a127976721eedf28fc6acd65eb32731c43fde3fe7f3a00cba28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00072715d3449e5c489fdd00573f669e65dc4bfed64fe1cd74548028a28a0614514500145145001451450004e064f6ac063b98b1ee735b574fb2da43ed8ac4acaa1d9865a36145145667505145140051451400514514005145140051451400514514005145140056a69d06c8fcc61f33f4fa553b3b7f3e5e7ee2f27fc2b63a56908f53971153eca0a28a2b538c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00ad7b6de7a6e5fbebd3dfdab208c1c1eb5d0552beb4f3332c63e6ee3d6b39c6faa3a68d5b7baccca28a2b23b428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00dbb67f32dd1bbe306a5aa1a5c9c3c47b7cc2afd7445dd1e6548f2c9a0a28a299014514500145145001515d27996d227aa9c7d6a5a280397a2a4b84f2ae244f46205474c414514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015b9a54bbed029ea87158757f489765c98cf471fa8ff0026901b345145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28020b8ba8ed994481806e840e28cdb5e27f0483f51fe14f9e04b888c6e38ec7d2b12e6d26b47cf3b7b3ad005e9b4943cc2e54fa3722b3e6b39e0e5d095fef0e452adedca7499bf1e7f9d4abaa5c8ea55beab408a5453e593cd90bed55cf651814ca60145145001451450014514500145145001451450014514500145145004f6974f6b2ee1ca9fbcbeb5bf1c8b2c61d0e54f4ae66aee9d77e449b1cfeed8fe47d6901b745145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a09001248007526800aaf757915b0c31dcfd9475aa779a9f54b7fc5ffc2b30924924924f7340135cddcb72df39c2f651d2a0a28a620a28a2800a28a2800a28a2800a075e7a5152430493c81235c9fe5401663b891d56dad17603d4f73ee6b62088430ac639c0ebeb515a5a25aa6072e7ab558a430a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a0414514500145145001451450014514500145145001451450014514500145150dcce208f76324f005004d514f70906dde09dde95593521ff2d233f55355ef2e167752a0e00ef400fbcbb132844042f524f7a863b99a2fbae71e879a8a8a602b31762cc724f26928a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a55566fbaa4fd0500251528b798f489ff2a962b195986f1b57bf3401568adafb3c254298d703da95208a3394400fad202a28bbb83927ca4f6e2ae448634da5d9fdd8d3a8a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00503240ab350c232d9f4a9a800a28a2818514514005145140051451400573d7d2f9b772376ce07e15b9752f936d249dc0e3eb5ce5020a28a29805145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514017f484dd72cff00dd5fd4d6cd67e8e9b6dddffbcd8fcab4290c28a28a0028a28a0028a28a0028a28a00a5a9be2154eec73f9566559bf93ccb920745f96ab56127767a3463cb0414514549a851451400514514005145140051451400514514005145140053e28da590220e4fe94d44691c2a8c93dab62d6d96dd31d5cf535518dccaad4505e6490c4b0c6117b753eb4fa28adcf3dbbbbb0a28a28105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514014af2cbcccc910f9bb8f5acc230707ad74155aeacd671b970b27afad67285f5474d2ad6d2464514e7468d8ab8208a6d647605145140c28a28a0028a28a0028a28a0028a28a0028a28a0092de5f26657ec0f3f4adc041191d0d73f5a9a74fbe2f2d8fcc9d3e95a537d0e5c442eb991728a28ad4e30a28a2800a28a2800a28a280317568f6ddeefefa83fd2a8d6beb11e61493fba71f9fff00aab22810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029f1486295241d54e6994500750a432861c823228aa9a64be65a004f29f2ff00855ba430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a0804104020f634514014a7d2e190e5098cfb723f2aa5269570bf70ab8f638adaaa57d7735ac8a563568c8ea7d680322582584e24465fa8a8eae5d6a325c47e5ec5553d7be6a9d3105145140051451400514514005145140051451400514514005145140051451401b5a5dd79b1794e7e741c7b8abd5cdc12b4132c8bd41fceba34759115d4e430c8a43168a28a0028a28a0028a28a0028a28a0028a28a0028a29934c90465e43803f5a0059244890bbb00a3bd625e5f3dcb6d1958c741ebf5a8eeee9eea4cb70a3a2fa54140828a28a601451450014514500145145001451450028c646738f6ad7d3670ede5c306c8d465989c9354ecac1ee4ee6cac7ebebf4ad98a24850246a1545201f45145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a041451450014514500145145001451450014514500145145001451412075a002aadfbc46128cdf3f50054b74596d9d90e081d4563139393d6800a28a2980514514005145140051451400514514005145140051451400514514005145140135b342b266652476f4ad58a489c7eed948f41589474e9480dea3a5628b8980c095ff003a6b48eff79d9bea68036964463857527d01a56755fbcc07d4d6151401b7e7c5ff003d53fefa1479b1ff00cf44ff00be856251401b2d730a75917f0e6a37bf814654963e80565514016ede4f3aec3cd2631c81fd2b4eb06b534f590439763b4fdd06802d5145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051453906e60280268c6107bd3a8a2818514514005145140051451400514514019bac4b88d221dcee3593566fe5f3aedc83c2fca3f0aad40828a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514f853cd9913fbcc05006fd947e5da44bfece4fe3cd4d451486145145001451450014514500151dc4a21859fb8e9f5a92b2f519fcc97cb53f2a75fad4c9d91a52873cac532727268a28ac0f4828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029d1c6d2b84419269f05bbced851c7727a0ad682048130a39ee7b9aa8c6e6352aa869d46dadaadbafab9ea6a7a28ad92b1c0db93bb0a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008e781275c38fa1ee2b2ae2d6480e4f29d9856cd0402304641a9945335a755c3d0e7e8ad1b9d3c1cb43c1fee9acf656462ac0823b1ac5c5a3b6152335a09451452340a28a2800a28a2800a28a2800a28a2800a7c323432abaf51fad328a04d5f437a391658c3a9e0d3ab26c6e7c97d8e7e46fd0d6b56f195d1e7548723b05145154661451450014514500437b1f9b692af7c647e1cd73b5d457373c7e54ee9fdd6228111d14514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00bfa4cbb2e4c67a38fd456cd7331b98e4575eaa722ba58dc491abaf461914862d145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140052328652ac0107a834b4500519ed2c139936c67fdec7e959d74b6800fb333939e73d2b5af2cd6e947cdb597a1c567b69338fbac8df8d022851570e99743f814ff00c085579a09206db2a1534c08e8a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b5b489f72342c795e57e959352dacde45c249d81e7e9480e8e8a28a0614514500145145001451450014514500364758d0bb9c281926b02eee9aea5dc7851f757d2aceab73be4f254fcabf7bdcd67d020a28a298051451400514514005145140051453e38a494e2342c7d8500329d1b2ab82cbb80ed9eb57e1d2646e666083d0726b420b2820e5132dfde6e4d2012ce59a54cc9108d31f28ab145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008e6fba3eb50d4d37dd1f5a86810514514005145140051451400514514005145140052336d52d827033814b4500533a8c5d91ff4aa5713b4f26e3c0ec3d2a4bd83ca9b207cadc8aad400b938c64e2928a298051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005152c76f2c8328848f5e953a69d21fbecaa3f3a00a7455e7d3980f92407d88c55692da68f2590e0771cd00454514500156e0bf78c0571b947e62aa51401b51dc4528cab8fa1e0d495890a7993227a9adba4014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015342bc135101938ab2060014005145140c28a28a0028a28a0028a28a002a2ba97c8b6793b81c7d6a5acbd626fb908ff78ff4a00cba28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002aee931efbbddd9013fd2a956c68f1ed81e4fef1c7e5480d0a28a281851451400514514005145364758d0bb1c01406e457971e445c7df6e16b1bad493ccd3ca5dbf01e82a3ac252bb3d1a54f923e614514549a85145140051451400514514005145140051453e286499b6a2e7d4f61409b4b5632ae5b5834986972abe9dcd5bb6b24870cdf3bfaf61566b48c3b9c95311d222222a28540001d852d1456a72851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005473411ccb875cfa1ee2a4a281a6d6a8c9b8b1922cb27cebedd4555ae82a09ece29b9c6d6fef0ac9d3ec74c311d24635153cf692c1c9195fef0a82b36ac75269aba0a28a282828a28a0028a28a0028a28a002b46c2eb204321e7f84ff004acea3a534ecc89c14d599d051552caebce5d8e7f783f5ab75ba773ce945c5d98514514c90a28a2800ac6d5e3db741fb38fd47f915b3547578f7db071d50fe87fc8a00c5a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b67499b7db98c9e50f1f4358d56b4f9bc9bb524fcadf29a406f5145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0086e1ae157302237fbc6b1ef27b99084b85db839036e2b7a91955d76ba861e846680398a2b4f51b5b6863dea4a39e8a0f5acca04145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803a0d3e5f36cd09eaa369fc2ac565e8d2732447fde1fd7fa56a52185145140051451400514514005457538b7b7693b8e07d6a5ac6d56e3cc9844a7e54ebf5a00a2492492724f26928a298828a28a0028a28a0028a2addae9f2dc618fc89ea7bfd2802a55b834e9e6e4aec5f56ff0ad6b7b386df945cb7f78f26a7a4052874b823e5f321f7e07e55715550615428f402968a061451450014514500145145001451450014514500145145001451450014514500145145004737dd1f5a86a69bee8fad4340828a28a0028a28a0028a28a0028a28a0028a28a0028a28a00cdd41a5f336bfdceab8ef54eb6e7896588ab7e07d2b12800a28a298051451400514514005145140051451400514514005145140051451400514514005145140051451400568595a2ec12c8324f201ed59f4f8e5923fb8e45006dd159f0ea0c0e25191ea2afab0650ca720f434805a28a280322ee030ca703e43c8a82b75955d4ab0041ec6a9cba7293989b6fb1e68033a8ab2f633af401be86ab1041c1182298053937b3055272781834da7c52b44db9319f523a5006c431f951052493dc9a7d56b19249519e46cf3815669005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401242b96cfa54d488bb540a5a06145145001451450014514500145145001d2b9cba97cfb8793b13c7d2b67529bc9b46c1f99fe5158340828a28a6014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015d1da47e55ac69dc0e7eb5836b1f9b731a76279fa574748028a28a0614514500145145000480327815917b75e7bed5ff0056bd3dfdea5bebbde4c519f94753eb546b29cafa23b28d2b7bcc28a28accea0a28a2800a28a2800a28a2800a28a2800a5552c4050493d855a82c2493064f917f5ad18608e11845c7bf7354a0d984ebc63a2d4a56fa7138698e07f74568222a28545000ec2968ad945238e75253dc28a28a64051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005559ec2297253e46f6e956a8a4d27b951938bba3126b69603f3af1fde1d2a2ae808c8c1e95527d3e393263f91bf4acdd3ec7543109e9232a8a926b79213f3ae07af6a8eb33a534f54145145030a28a2800a28a2801558ab0653823a1ad7b4b91709cf0e3a8feb58f4e8e4689c3a1c11551958caa53535e66f51515bceb3c7b8707b8f4a96b7dcf3da69d98514514082993c7e6c2f19fe20453e8a00e5c8c1c1a2acea1179578e3b31dc3f1aad4c41451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450074567379f6c8f9e7183f5a9ab23489b6cad093c3f23eb5af486145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500433dac371feb1067fbc38354ce8e99e256fcab4a91943a9539c1f438a00e76e6136f3b464838ee2a2ad0b8d2e5572613bd4f6279aa3246f136d914a9f434086d14514c028a28a0028a28a0028a28a0028a28a0028a28a00b1632f93771b1e84e0fe35d0572f5d0d9cde7db23e79c61beb4809e8a28a0614514500145145004379702dedd9ff8ba2fd6b9d2492493926adea373f689f0a7e44e07bfbd54a04145145300a28a2800a7c513cae12352cc7d2a6b4b392e9b23e541d5ab6e0823b74db1ae3d4f73480ab69a6a4387970efe9d855ea28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145004737dd1f5a86a69bee8fad4340828a28a0028a28a0028a28a0028a28a0028a28a0028a28a000f2306b2eead1a225d394fe5576e9f6a71308dbf3cd65b4d23fde918fe3400ca28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140055bb4bc10a6c752467208aa945006c47750c9d1c03e878a9ab068048390706901bacc1412c4003b9aa926a28ad8452c3b9e9544bcb310a4b39ec3ad598f4e62332385f60334017619e39972879ee0f51515d5a24b970763773d8d4674e039495835539d258df6ca49f439ce6801af1b26091c1e847434e4b699feec6df8f156f4d918868cf20720fa55ea008ada33140a87a8eb52d145001451450014514500145145001451450014514500145145001451450014514500145145001451450014f8972dec29956235dabee6801d45145030a28a2800a28a2800a28a2800a28a8e7944303c87f847eb40193aacde65cec07e58c63f1ef5469589662c4e49393494c41451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450068e8f1ee99e43fc2303ea6b5eaa699179766a4f573baadd2185145140051451400550bfbbc6618cf3fc47d3daa4bebaf257621f9cfe959559ce5d11d54695fde614514564760514514005145140051451400515620b3966e71b57d4d68c167143c81b9bfbc6a941b319d68c4cf82c65970586c5f535a305ac507dd5cb7f78f5a9a8ad5452392756530a28a2a8c828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002903ab3150c095ea01e959da85f94630c270dfc4de9ec2b2d2478df7a310dea2a5c8d6349b573a62011820107b1aa53e9e8f9311d87d3b5476baa2b616e3e53fde1d2b44104020820f7146921273a6cc29619216c48a47bfad32b7d955d76b0041ec6a8cfa7039684e3fd9359b83e874c3109e9233a8a73a346db5d4a9f7a6d41d0145145030a28a28025b79da0943af4ee3d456d23ac881d4e41ac0ab96171e5c9e5b1f91ba7b1ab84ada1cf5e9f32e65b9a9451456c7085145140199acc5958e51dbe535955d15e45e75ac89df191f5ae76810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00746e63915d7aa9c8ae922904b1abaf4619ae66b5b489f28d093caf2bf4a40695145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a000825480704f7f4ae76ea29219d9652493cee3deba2aa5ab797f65f9c65b385f6a00c4a28a298828a28a0028a28a0028a28a0028a28a0028a28a002afe9571e5cc6263f2bf4fad50a3a1c8a00ea28aad61742e61e4fef17861fd6acd21851451400551d4eebca8bca43f3b8e7d8559b99d6de13237e03d4d73f2c8d2c8cee72cc68019451453105145140055cb1b2372db9f2221d4fad45696e6e6708381d58fa0ae811163408830a0600a4008aa8a15400a3a014b45140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008e6fba3eb50d4d37dd1f5a868105145140051451400514514005145140152fae1e128b19c13c938aa66f2e0ffcb4fc80abf7125bb031cac3fa8aca600310a723b1c5003ccf31eb2bff00df54d2ee7ab31fc6acd9da79df3bfdcf4f5ad0586351858d47e140189456d3db42e3e68d7ea062a8dc58b265a2cb2fa7714014e8a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145005eb2b88624daff002b7f7b1d6b4010c010720d50b396dc2fccaaae3b9ef524f7e89c46379f5ed480b754f52dbe4ae7ef6ee2a03a84c7a041f8557924795b73b1268024b5b936e4fcb956ebeb562e6f731af90d827af1c8aa145302c477b34608ceecff007b9c559b7bf0ec1650149ee3a56753a30ad200edb57b9a406e514d8c2ac6a10e540e39cd3a800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2801f1aee6f6153d3635dabee69d40c28a28a0028a28a0028a28a0028a28a002b2f589feec00ffb4dfd2b4dd822166380064d73734a6699e46eac73400ca28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029d1a1924541d58e29b57b498b7dd6f3d1067f1a00d95508a14740302968a290c28a28a002a1bab816f167ab1fba2a56608a598e0019358b71319e52e7a761e82a252b236a34f9debb11b31762cc724f5349451589de145145030a28a2800a2a48609273845e3b9ec2b460b08e3c17f9dbdfa53516cca75630dca305acb3f2a30bfde35a3059450e091bdbd4d58a6cb2a429ba460a3deb55048e49d694f443a903a962a18161d4679159175aa3c9958328bfdeee7fc2a8a48f1c81d18861de9b902a2dad4e9a8aab63782e90838122f51ebef56aa8c9a69d985145140828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002aadfdd8b68b0a7f78dd3dbdea4baba4b68f7372c7eeafad604b2b4d217739635327635a70beac6139393d68a28accea0ab16d792db1f90e57ba9e955e8a62693dcdfb6bd8ae4601daff00dd3566b97070722b42d75478f0b365d7fbddc7f8d5297730952eb135a489255daea08aceb8d3dd32d17cebe9dc568452a4c9ba360c3da9f4dc5322152507a1cff4eb456cdc5a473f246d6fef0acb9eda480fcc323b30e9594a2d1d94eac67ea454514549b051451401b1653f9d0e09f9d783562b1ace6f26e1493f29e0d6cd6f077479f5a1cb20a28a2a8c42b9ebc8bc9ba913b6723e95d0d65eb317fab987fba7fa7f5a00cba28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a4b798c13a483b1e7dc547450074eac194329c82320d2d50d267df09898fcc9d3e957e90c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a0bbb55ba40acc548e41153d1401cf5ddb9b6976170dc678a82ad5ec731b896478d82963824718ed55698828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0092099e094488791fad6e5b5e45723e5387eea7ad73f40241c83822901d4523bac685dce14724d64daea8e9859c175fef0eb50df5eb5cb6d5cac63a0f5fad03197974d752eee883851e955e8a298828a28a0028a29d1a1924541d5881401b1a4c3e5db79847321fd2af52228440abd00c0a5a430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a041451450014514500145145001451450055bf895a03263e65ef5975b73aee81d7d54d6250059b4baf232ac0943e9daae8be80f5623ea0d64d1401ac6fa003ef93f406b3a798c9231567da7a0635151400514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00bba7ce119a376014f2327a55d8e78e562a8d923ad62d4f672f9570a4f43c1a406bd14514005145140051451400514514005145140051451400514514005145140053e35dcdec299565176ae3bd002d145140c28a28a0028a28a0028a28a0028a282428249c01c9a00cfd5e7d910841e5f93f4ac7a96ea637170f276278fa54540828a28a6014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015b7a4c5b2d779eae73f856322177545eac702ba58d0471aa2f451814805a28a2818514536571146ce7a28cd0095ca3a94fc8854fbb567d2bb1772cdd49c9a4ae76eeee7a7087246c14514522c28a2ad5b593cd866f913d7b9a126f6265251576564469182a2924f615a16fa7018698e4ff7455c8a18e15da8b8f53dcd3eb58c12dce3a95dbd220aa1400a0003b0a2a1b8bb8ad97e76f9bb28ea6b1eeafa5b8c8cec4fee8feb56da46718391a175a9c716562c3bfaf6159334d24efba462c7f95474566ddce88c14760a28a29164904cd04ab22751fad74104c97110910f07b7a1ae6eac59dd35acb9ea87ef0aa4ec65521ccae8e828a6c7224a81d0e54f7a7568728514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005141214658803d4d5792fa04fe2dc7fd919a4da4528b96c8b14567bea7fdc8ff1635035fdc37460bf4152e68d5509b35e8ac46b999bacaff9d465d8f5627f1a5ed0b5867d59bf4573f452f69e43fab799d0515801d874623f1a7adc4cbd257fce9fb413c33ee6e51590b7f70bfc61bea2a64d4dbf8e307e8714f9d10f0f3468d155535081ba92a7dc5584912419460c3d8d526999384a3ba1d451453242abdddda5aa73cb9e8b560f4ac1beb79e294bca4b863c3fad26ec694e2a4f52096579a42f21cb1a65145667505145148614514500145145003e29a485f746c54d6b5aea692e166c237af63fe158d4534ec44a0a5b9d450ca1810c0107b1ac1b5bf96df0bf7d3fba7b7d2b62deea2b95cc6dcf753d45689dce6941c4a973a791978791fddff0aa0783835d0556bab359c6e5c2c9ebebf5a8943b1bd3af6d2464514e7468dcab8c114dac8eb0adab493cdb6463d4706b16b434b7fbf1ff00c0855c1ea63888de17ec68514515b1c0150de45e75aba639c647d6a6a280397a2ac5f43e4ddba81c1391f4355e98828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a009ad6736f70b2761c1fa5744082010720f4ae5eb674ab8f3213131f993a7d29017e8a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450057be98416aeddcfca3eb5cfd74cf1a3e37a2b63a6466b06fbcafb5308461475c74cfb5022bd14514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029559918329208e8452514013a5e5c21c899cfd4e7f9d5fb6d555b0b3aed3fde1d2b268a4074eac194329041e8452d73f6b7725b37ca7287aa9adc8274b88c3c6723b8f4a0649451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004737dd1f5a86a69bee8fad4340828a28a0028a28a0028a28a0028a28a002b0dd76bb2fa122af4da876847fc08d50662cc598e49e4d002514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a6b680cf2e3f8475350d4d05cc9070b820f5045006c741455682f92560a41563f88ab348028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2940c9c0a007c4b9393d054d48a3680052d030a28a2800a28a2800a28a2800a28a2800aa3aadc79700894fccfd7e957890a092700724d73b7539b8b8693b741f4a00868a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802f695179975bc8e1067f1adaaa7a5c3e5da06239739fc3b55ca430a28a2800aa3a9c98458c77e4d5eac7be7df74fe8bf28a89bb236a11bccaf45145627a014e4469182a0249a7dbdbbdc3e17803a9f4ad782048136a0e7b9ee6aa31b98d4aaa1a7520b6b158b0d2619fd3b0ab74554bad422b7ca8f9e4f41dbeb5b5924713729b2d3bac6a59d82a8ee6b2eeb5427296e303fbe7fa5519ee65b86cc8d9f41d854552e46d1a496ac5662cc4b1249ea4d2514541b051451400514514005145140162d2eded5f23943d56b76195268c3c6720d7355a9a5dbceade693b233d8ff155c598d58ab5cd4a28a2ace60a28a6493c51fdf751ed9e681a4dec3e8aa6fa944bf7159bf4a81f5290fdd455faf352e68d1519be869d158cd7b70dff002d31f418a8ccd2b7591cff00c08d4fb4468b0d2eacdda2b00b13d493494bda7915f56f33a0a2b9fce29c2471d1d87d0d1ed3c85f56f337a8ac55ba9d7a4adf89cd4aba8cebd76b7d453f68897879743568aa29a9a9fbf191f439ab11ddc127dd9003e878aa524cca54e71dd13514515440514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051504f77141c13b9bfba2b3e7bd965e01d8be82a5c9235851948d19aea187866cb7a0e4d52975191b88d420f5ea6a9515939b675468463bea39e4790e5d8b1f734da28a936d828a28a0614514500145145001451450014514500140254e4120fb5145022cc57d3c7d5b78ff6aae45a844fc38287f3159545529b4672a3097437d5830ca9047a8a1955d4ab0041ea0d61c72bc4728c57e957a1d4bb4cbff0215a29a7b9cd3a128eab520bbd30ae5edf2cbfdcee3e959a783835d323ac8bb91830f6a82eac62b919c6d7fef0feb438f6146ab5a48c0a2a7b8b596d8fcebf2f661d0d41526e9df60a28a290c28a28a0028a28a00295199183212ac3a114945006bda6a61b0971807b3f63f5ad1ebd2b97ab9677ef6e423e5a3f4ee3e956a5dcc274bac4d6b9b65b84e7861d0d63c88d1b9471822b723916540e8c194f422a1bcb613a6470e3a1f5f6a251bea828d5e57caf631eacd836dbb5f7c8aac4152411823a8a9203b678cfa30ac568ceb9abc5a3728a28ae93cc0a28a280337588731a4c3aa9c1fa564d74b3c42685e33fc4315cd9054904608e0d02128a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500152dacc6de7590741d47a8a8a8a00ea158328653904641a2b3b49b8df19818f2bcafd2b4690c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008ee12478596260ac78c9ac49ec67817732865f55e6b7ea0bd9fecf6ccc3ef1e17eb401cf514514c41451450014514500145145001451450014514500145145001451450014514500145145001451450014514500153da5cb5b4c1872a7861ea2a0a2803a7560ca194e41190696aa696e5ac941fe12455ba430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a041451450014514500145145001451450060d14e75daeca7b1c5369805145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514012daffc7cc7fef56cd64592eeba4f6e6b5e90051451400514514005145140051451400514514005145140054d12e06e351a2ee6f6ef562800a28a2818514514005145140051451400514523b0442cc7000c934014756b8f2e110a9f99fafd2b1aa5b898cf3b487b9e07a0a8a810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029f0c66599231d58e2995a3a3c3ba56948e14607d4d20359542a8503000c0a5a28a061451450004e0127b560312cc58f52735b77276dbc87fd9358759543af0cb46c2a6b6b76b89303851d4fa532189a69022fe27d2b6a189618c220e07eb5318dcd2b55e4565b8b1c6b120441802892448d0bbb0551dcd4773731db47b9ce49e8a3a9ac3b9b992e5f739e07451d056add8e48c1cf5659bbd49e5ca43944f5ee6a8514543773a545474414514522828a28a0028a28a0028a28a0029d1c6f2b84452cc7b0ab56ba7cb3e19be44f53d4fd2b620b78edd36c6b8f53dcd528dcca7514762a59e9ab161e6c33fa76157ea39a78e1197600fa77aa136a2edc44360f5ef54da899284ea3b9a324a910cbb051ef54e5d494711267dcd673316396249f534959ba8fa1d11c3c56fa93497734bf79c81e838a868a2a2f73a124b60a28a281851451400514514005145140051451400514514012473cb17dc7207a76ab916a5da54fc56b3e8a6a4d19ca9c65ba37629a394663607dbbd3eb0012a72a4823b8ab906a2e98128de3d7bd68aa7739a7876be134e8a64534732e5181f6ee29f5a1ced35a30a28a2810514514005145140051451400514514005145140051451400514514005145140051451400514557babb5b718fbce7a0a4dd8718b93b226965489773b605665c5fbc9958fe45fd4d57965795f739c9fe54caca536f63b69d051d5ee14514541d0145145001451450014514500145145001451450014514500145145001451450014514500145145003a391e26dc8c54fb5685bea2ad85986d3fde1d2b368a6a4d19ce9c67b9be42baf38653f88359d73a52b65a03b4ff74f4aaf05cc901f94e57ba9e95a96f751ce3e5386eea6b5525239254e74f55b181244f13ed914a9f7a6574b2c51cc9b6450c3deb2eeb4b74cb404baff0077b8ff001a4e25c6aa7b99d45041070460d1526a14514500145145001451450059b2bb6b593b98cfde5feb5bc8caea194e548c835cc56a6917072d031f75feb5717d0c6ac2eae89b50b5dc0cc83e61f787ad6729c303ef5bf5957d6de4c9bd07c8c7f235338f54550a97f759ab451456a72051451400561ea90f9574580f95f9fc7bd6e553d521f36d4b01f327cdf877a00c3a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a007c32b4332c8bd54fe75d1c722cb1aba9cab0c8ae66b4f49b9c31818f0795ff0a406ad145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002992c31cc00914301d334fa28039dbb082e6458976a29c0150d692e9523bbb48e1012718e4d67118246738a042514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028ab70e9b7128dc4041fed54a748980e2443f9d2033e8a9e5b2b887968ce3d4722a0a60145145006d692e86d76afde53f355eac0b098c37498e8c7691f5adfa430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a041451450014514500145145001451450065dfc7b2e37767e6aad6cdcc2268883c11c8358d400514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2addb5919a32ecc5476e3ad0054a2af369adfc3203f518aad3c0f0101f1cf4c1a008a8a28a0028a50acdd149fa0a78b798f489ff2a008e8a56055883d475a4a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a29d12192454071938a00bda6c785690f7e055ea6c68b1a045e829d48028a28a0028a28a0028a28a0028a28a0028a28a0029692a5893f88fe1400f45dab8ef4ea28a06145145001451450014514500145145001599abdce1440a793cb7f85684f2ac10b48dd147e75ce49234b233b1cb31c9a006d14514c41451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015d0d8c3e45aa291f31e4fd4d6358c3e7dd2291f28e4fd2ba0a40145145030a28a28020bd38b493e9fd6b1d54b30551927802b62fbfe3ce4fc3f9d43a7db6c5f35c7cc7ee8f4159c95e475529a8536c9ed6dc5bc78eae7ef1a5bab85b684bb727a01ea6a5ac1d42e0cf72707e44e16a9e88c629d495d904d33cf21790e49fd299451507505145148614514500145145001453a38de570b1a9663d856a5ae96ab86b83b8ff7474a695c894d47733eded65b8388d78eec7a0ad6b6d3a2830cdfbc7f53d07e157154280140007402aa5cdf245958f0effa0abb28ee63cd2a8ed12cc92244bb9d828acf9f5166cac2368fef1eb552495e56dcec49a656729b7b1d10a0a3acb5024b1c92493dcd1451506e145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2801559918329208ee2afdbea1d167ffbe87f5acfa29a6d6c44e119ad4e8010c0104107b8a2b16dee9eddb8e57ba9ad78664993721fa8f4ada324ce1a949c3d07d145154641451450014514500145145001451450014514500145145001451450014514c9641144cedd050095f422bcba102617973d3dbdeb2198b31663927a9a592469642ec724d36b9e52bb3d1a74d417985145148d428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002804a9041208ee28a2811a36b7f9c24dc1ecdfe357fad73f56ad6f1a0215b2d1fa7a56919f467354a17d625dbab28ae4648dafd987f5ac5b8b792ddf6c83e847435d123ac88190e41ef4d9624990a48b95356d5cc2351c746735455abcb27b56c8f9a33d1bfc6aad41d29a6ae828a28a430a28a2800a9ad1fcbba89bfda19a869d1ff00ac5fa8a627b1d3523a2c88558641a5a2b538428a28a0028a28a0028201041e41a28a00e72e22304ef19ec78fa5455abac43c24c07fb2dfd2b2a810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029558a30653820e41a4a2803a3b59c5c40b20ebd08f4352d6169d73f679f6b1f91f83edef5bb486145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500327dc6093672db4e3eb8ae7648658b1e646cb9e9915d2d676b23f7119ff006bfa50064514514c41451450014514500145145001451450014514500145145001451450015a3a4db877699c642f0b9f5aceae86c62f2ad235ee464fe34809e8a28a0614c782290e5e3463ea453e8a00aafa75b38ff57b4faa9a6c160b1a49149878d8e57d455ca28031acad0fdbdb3ca44dd7d4f6ad9a0003a003bd140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514011cdf747d6a1a9a6fba3eb50d020a28a2800a28a2800a28a2800a28a2801186e52b9c6462b1e781a07dadc83d0fad6cd54d457740a40c90d40199453c452302423103da994c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a5446760aa0927b0abd0e9fde63ff0001140142b5ed2759610060328c114cbab45687f74a032f403bd66a3b46c190904520372b22f25f367247dd1c0a592f66913692003d703ad57a002aee9cea2464603279154a9412a4107047434c0ddaa97976230638cfce7a9f4aa8d7b3b2eddd8f7039aaf4802ada593490c6ea705bae7b0aa8064803a9add45088aa3a018a00c6b88c45332039031fcaa3ab5a8002e723b804d55a601451450014514500145145001451450014514500145140049000c93400559b281e49438e154e49a89a0957ac6c3f0ad6b7509020031f28a404945145001451450014514500145145001451450014514a064e05002a2ee6c76ab038a445dab8a5a0614514500145145001451450014514500145155efae7ecd0120fcedc2d0067eab73e64be4a9f953afb9acfa0f27268a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a74686591517ab1c5006b6910ec85a52397381f415a14d8d0471aa2f451814ea430a28a2800a28a28011d15d76b0c83da968a28023b87f2ede471d429c57375d05fff00c794bf4ae7ea2474d1d9851451506c1451450014514500156ad2c64b93b8fcb1ff007bd7e9562c74edf8967185ecbeb5ac00000030076ab51ee633ab6d111c10476e9b635c7a9ee69eeeb1a9672001dea39ee1204cb1e7b0f5ac99ee1e76cb9e3b0ec28949448a749d4777b135d5f34b958f2a9fa9aa945158b6dee77462a2ac828a28a0a0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a92199e0903a1fa8f5a8e8a04d26accdd86559a30ebf88f4a7d6359dc1825e4fc8dc356cd6f195d1e7d5a7c8fc828a28aa320a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800acdd4e5cbac43a0e4fd6b489c0c9e82b0657324ace7f88e6b3a8f4b1d1878de57ec368a28ac8ee0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28026b7b87b77caf2a7aafad6bc3324c9b90fd47a5615490ccf03ee43f51eb551958c2ad253d56e6dbaaba95600a9ea0d61df5935b36e5c988f43e9ed5b304e93a6e5fc47a53dd15d0ab8054f041ad9ab9c919383b3398a2acdeda35ac9c731b7dd3fd2ab56675269aba0a28a290c2a5b65df7312fab0fe75155bd2d37dea9eca09a68993b26cdda28a2b538828a28a0028a28a0028a28a0064f109a178cff0010ae6d94ab1561820e08ae9eb1b5683cbb81201f2bff003a0450a28a29805145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140056de9975e743e5b1f9d3f515895241334132c8bd476f5a407494536291658d644395619a75030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a86ead96ea308c48c1ce454d4500501a6c30c4e5b2ed83827b563574eebb9197d4115462d2615e646673e9d050231a8ab7a92451dcec846300640f5a4b6b19a723e5289fde2280196b6b25d3e17851d58f6abb7a91595af9710f9e4e0b1eb8ef5a114696f0855e154724ff3ac2bc9cdc5c33ff0f451ed4010514514c028a28a0028a28a0028a28a0028a28a00746bbe455f520574d5cd4276cd193d981fd6ba5a40145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a041451450014514500145145001451450014514500158d738fb449850a3711815b354ef2d0c84c91fdeee3d6803368ab90583491ee7629ed8a86e60f224d99ce46734c0868a5552ec154649e94329462ac30475140094514500145145001450393814ef2df7ecd8dbbd31400daba34e72ff007c6cf5ef47f67bf944961bff00bb5a0b9da33d714806410240b84ea7a93d4d494514005665fc3e5cbbd47caffceb4ea0bd4df6cdeabc8a00c8a28a298051451400514514013d9a6fb941d81cd6bd67e989f33bfa0c5685202add5a79ee1c3e0818c11551eca48d1ddc8c28eddeb56a3b9567b77551927814018b455c934f7550508638e474aa9b18b15da723a8c530128a28a0028a28a0028a29f1c4f2b6d4193400ca28ab36b6bf680c4b15c631c50056ab9a680676c8c90b907d2992d94a8e1546e0dd08abb6b6a2dc124e5cf53480b14514500145145001451450014514500145145001451450015344981b8f5a6c69b8e4f4153500145145030a28a2800a28a2800a28a2800a28a28002428249c01c935cfde5c1b99cb7f08e147b55ed5aeb0bf6743c9e5be9e959340828a28a601451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015a3a441ba46988e1781f5ace032702ba3b487c8b748fb8193f5a404b45145030a28a2800a28a2800a28a28022ba5dd6b28ff64d7395d4100820f435ccba949190f55245448e8a2f74368a28a8370a28a2800ad4d3ec3a4d30f7553fccd374db1df89a51f2ff000a9efef5ad5715d4c2a54e882abdd5d2dbae072e7a0a4bbbb100dabcc87f4ac9662cc598e49ea4d294eda20a5479b596c2c92348e59ce49a6d1456476ec145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ad6d3e5f32df693f3271f876ac9ab5a749b2e76f6718aa83b331ad1e681ad451456e79e145145001451450014514500145145001451450014514500417b27976afeadf28ac6abdaa499748c76e4d51ac26eecefa11b42fdc28a28a9370a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2801f0ccf0c81d0fd47ad6cc13acf1ee5fc47a561d4904cd0481d7f11eb551958c6ad253575b9b32c493466371953581736ed6d2946e9d8fa8adf86559a30e878fe54cbbb65b984a1e1872a7d0d6ad5ce4849c1d99ced14e911a3728e30c0e08a6d6675056a68d1ffad93e8a3fcfe55975bda6c7e5d927ab7cc6aa3b995576896a8a28ad0e50a28a2800a28a2800a28a2800a82fa0f3ed9940f9872bf5a9e8a00e5e8ab7a8c1e4dd1c0f95fe6155298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00d0d2eebca93c973f239e3d8d6c572f5bba75d7da21dac7f789d7dfde9016e8a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450037ca8f7efd8bbbd71cd3a8a86eee16da12e793d147a9a00a9aadd6d4f210f2df7bd87a564539dda472ec72c4e49a6d020a28a29805145140051451400514514005145140057476d2f9d6f1c9dc8e7eb5ce569e8f3e0b40c7afccbfd6901ab45145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a04145145001451450014514500145145001451450014514500150cd6d1cec0be7238e0d4d4500430dac50b6e5073ee692e2d5272093b58771dea7a280289d3571c487f114834d3de51ff7cd5fa2802a2e9d10fbcccdfa54c96b0a748d7f1e6a5a280209ad22979c6d6f55a99410a013920726968a0028a28a0028a28a0029b28cc4e3d54d3a993b6d8243fec9a00c4a28a29805145140051450064e077a00d6b04db6c0ff0078e6ac5222ec4551d8629690051451400520450c5828c9ea71d6968a008a3b68635202039ea4f351496113f2b943edd2ad5140140e9a7b4a3fef9a43a6b76907e55a14500515d357f8a427e82adc30a429b507d4f734fa2802bbd8c2ee58ee049cf06a48214810aa6704e79a928a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029caa58e290024e055845da31400a0003028a28a0614514500145145001451450014514500150dd5c2db405cf5e8a3d4d4c4800927005605f5d1b99b23ee2f0a3fad0057766772cc72c4e49a4a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802e699079b72188f963e7f1ed5b955b4f83c8b55c8f99be6356690c28a28a0028a28a0028a28a0028a28a002b07528fcbbd7f46f9ab7ab2f598f98e4faa9ff003f9d4cb635a4ed232e8a28accea0abba7d9fda1fcc71fbb53f99a86d2d9ae660a3851cb1f415d0222c681106140c015515731a93b6885030302ab5e5d88176af321fd296eee85ba6072e7a0f4f7ac8662cc598e49ea689cada2151a5cdef3d8092c492724f5349451591da145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a54628eac3a839a4a2811beac19430e846452d56d3e4df6c01ea9c559ae84eeae79928f2b6828a28a6485145140051451400514514005145140052330552c4e001934b547529f6a8854f2796fa526ecae5c23cd2b142690cb2b39ee6994515ce7a495b40a28a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140135b5c35bc991ca9ea3d6b651d6440ca720f4ac0ab56575e43ed63fbb6ebedef57095b4673d6a5ccaeb72d6a167f684de83f78bfa8ac32082411822ba81c8c8aab77611dce587c927f7877fad68e3739e9d4b68cc2552ee14752702ba645088aa3a28c0ac7b4b3923bf45957017e6cf635b344505595ed60a28a2a8c428a28a0028a28a0028a28a0028a28a00a9a941e75b1207cc9f30feb5855d4573f7d07d9ee5940f94f2bf4a0457a28a29805145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140054904cd04cb22751dbd4547450074b0cab344b221c8229f589a6ddf9126c73fbb7fd0fad6dd2185145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514536595218cbc8d8514004b2243197738515cfdd5cb5cca5db803851e829f7976d74fe883eead56a04145145300a28a2800a28a2800a2ad4b61347009786523240ea2aad00145145001451450014e8a468a4575eaa734da2803a68a459625917a30cd3ab33479f86818ff00b4bfd6b4e90c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008e6fba3eb50d4d37dd1f5a8681051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400553d465db108c756ebf4ab5248b121773802b1a695a694bb77e83d2801945145300a28a2800a9acd37dca0ec0e7f2a86ae69a544cd938623028034a8a28a4014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451534498f98fe1400b1a6d193d69f45140c28a28a0028a28a0028a28a0028a28a0028a2abdedc8b684b7573c28a00a9aadde07d9d0f27ef9fe95954acc598b31c92724d25020a28a298051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400559b083cfb95047cabf33556adcd320f26db711f349c9fa76a405ca28a281851451400514514005145140051451400555d4a3f32c9fd57e6156a91943a153d08c1a18d3b3b9cc53e189e790220c93fa558834f9a69082362a9c163fd2b62deda3b64db18fa93d4d66a373a67514760b6b75b68422f5ee7d4d17370b6f1ee3cb1e83d69f2c8b1465dcf02b16799a790bb7e03d29ca5ca88a54dd4777b0d77691cbb1c934da28ac4ee0a28a281851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514016b4f97cb9f693f2bf1f8f6ad6ae7fa56d5a4fe7c21bf8870d5ad37d0e3c443ed226a28a2b439428a28a0028a28a0028a28a0028a28a0064d2ac3133b741fad6248ed239763c939ab37f71e6c9b14fc8bfa9aa958ce57677d0a7caaef7614514541b851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401a1a7dcf485cffba7fa568573e090723835b16771e7c5cfdf5ebfe35ac25d0e2af4edef22c514515a1cc1451450014514500145145001451450014514500154f5483cdb6de07cd1f3f877ab9475a00e5e8a9ef60fb3dcb20fba795fa5414c4145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015b1a5ddf98be4487e651f29f5158f4aacc8c194e083906901d3d15059dcadcc21ba30e1854f40c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a64b2a4319791b0a2b22eb53925cac598d3d7b9a00d1b9bd8ad8104ee7fee8ac6b9b992e5f739e07451d054345020a28a2980514514005145140051451401d058ca26b443dc0da7f0acad46d85bcff0028f91f91eded4db2ba36b2e4f28df7856adcdb25ea4643e141ce4771480c1a2a4b88fcab8923ecac71f4a8e980514514005152450c936ef2d4b6d1938a61041c11823b1a007c1298665917aa9fceba28a4596357439561915ccd68697762263148c0237209ec6901b145529f53862e13f78dedd3f3acf9751b993a3ec1e8bc5033772320679345605ac4f7329c4c1651c8dc4e4d6cdbb4e06c9d46474753c1a009a8a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008e6fba3eb50d4d37dd1f5a8681051451400514514005145140051451400514514005145140051450480324e07bd00145577bd8138dc58ffb22a23a92f68cfe7401768aa43525ef19fcea45bf81ba965fa8a00b345312689feec8a7f1a7d00145145001450480324e054325dc31f5704fa2f3401354734e90ae5cf3d87735465d41db88d768f53c9aa8cc5892c4927b9a0092e2e1e76cb70a3a0f4a8a8a2980514514005145140050090723834514017edeff0080b37fdf5fe35795830ca9041ee2b0a9f1caf11ca311480dba2a847a89e92a67dd6aca5d42fd2400fa1e28026a280411907345001451450014546f71127de917f3a85b508474dcdf414016a8aa47525ed19fce81a92778d87d2802ed150c7770c9c07c1f46e2a6a0028a28a0028a28a0028a28a0028a28a0028a2a48d37727a5002c699f98f4a968a28185145140051451400514514005145140051451400d91d628d9dce15464d73f7570d733176e07403d0558d4af3cf7f2d0feed4f5f53546810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a009eca0fb45caa1fba396fa574354b4bb7f2adf7b0f9a4e7f0ed57690c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028270327a5154351b9c7ee50ff00bc7fa526ecae5c20e6ec8ad797267930bf717a7bfbd57a28ae76ee7a318a8ab20a28a282828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a7b49fc89813f74f0d50514276264949599d075e94552d3ae37a794c7e65e9ee2aed74277573cd9c5c5d98514514c90a28a2800a28a2800aad7d71e4c5b54fcedc0f6ab0cc114b31c00326b12794cf2973dfa0f415139591b51a7cd2bbd911d1451589e80514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140054904cd04a1d7f11ea2a3a2813575666fa38910329c8232296b374eb8dade4b1e1beefd6b4aba22ee8f36a4392560a28a2990145145001451450014514500145145001451450053d4edfceb7dea3e68f9fc3bd61d7515cfdf5bfd9ee5940f94f2bf4a0457a28a298051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514012db5c35b4c1d7a771ea2ba18a4596357439535ccd5cd3ef3ecf26d73fbb6ebedef480dca28041190720d140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028e83268aada8394b2908ea463f3a00c9beb93733120fc8bc28feb55a8a298828a28a0028a28a0028a28a0028a28a0028a28a002b57489c9dd031e9f32ff005acaad2d2ed64f312e32020cf1dcf6a402df5ab4da8205ff00968324fa62a8dc40f6f21471f43d8d747819ce39a86eedd6e61287ef7f09f4340ce768a923824926f2957e707047a546410483c114c46a68b8fdf7af1fd6aedd5a4772841003f66ac8d3ee05bdc82c708df29f6ad8bb9c5bdbb49dfa2fd690ce7dd0c6ec8dd54e0d368249393c93576d74e927c33feed3dfa9a622952a6dde37e76e79c57411595bc430b1827d5b934db8b18674202846ecca290149b4e9202b340fe66d20e31cd6b522a8550a3a018a5a061451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004737dd1f5a86a69bee8fad4340828a28a0028a28a0028a28a0028a28a0028a0b05196200f5355a4be8538525cfb50059a467541966007b9acc92fe57e13083db93559999ce59893ea4d00684da82af110dc7d4f4aa32cd24a72ec4fb76a651400514514c028a28a0029cb2489f75d87d0d368a0097ed337fcf56fce90dc4c7fe5abfe751d1400a58b7de24fd4d251450014514500145145001451450014514500145145001451450014514e28c1436d3b4f7c7140081997ee923e86a417130ff0096aff9d4545004a6e673ff002d5bf3a633bbfde663f534da2800a28a2800a28a2800a962b9961fbadc7a1e95151401a90dfc6fc3fc87f4ab4086190411ea2b069f1caf19ca315fa52036e8acf8b5161c4ab9f7156e3ba864fbae01f43c5004b451450014514f442c7da80044dc7daa703038a00c0c0a281851451400514514005145140051451400514514005676a779b14c119f98fde3e83d2ac5f5d8b68b8e646fba3fad60b31662cc724f249a004a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002ac595bfda2e154fdd1cb7d2abd6e69b6fe4db8661f3bf27e9da90173a5145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28240049e00a0086ea710445bf88f0a2b1492c492724f5a9aea733cc5bf8470a2a1ac252bb3d0a34f923e614514549b05145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400e8dda370ea7041adb86559a2575eff00a56155bd3e7f2a5d8c7e57fd0d5c2566615e9f32badd1ab451456c70051451400514536590451b3b7402804ae51d4a7e90a9f76acfa577323976ea4e4d2573c9dddcf4e9c392360a28a29161451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145000090723a8adab59fcf8437f10e1beb58b562ca7f267193f2b706aa0eccc6b439a3e66c514515b9e785145140051451400514514005145140051451400555d46dfcfb73b47ce9c8ff0ab5450072f455bd4adfc8b82547c8fc8f6f5155298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00d3d32f769104a78fe027b7b56ad72f5b3a75ef9ca2290fef0743fde1480bf45145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a6c91acb19471953d453a8a00c9bdd34469be00cdcf2bd6b34820e0f06ba8a82eed52e6320e038fbad408e7a8abcba4dc1ea517ea6aa4b1b4323238c30a60328a28a0028a28a0028a9228259b3e5a3363ae050b04ad208c236e27182314011d285623201207a0ad98f4b804415c167eec0e2ae451a4518441851480c2b5b196e48206d4fef1fe95bb1c6b146a8bd146053a8a06145148cc114b31000ea4d00224488cecaa0339c93eb587a9045bd7d9df93f5ab93eacaa4885377fb4dd2b2998bb1663924e49a042548d33c8888ee4aa74f6a8e8a6069d9358210493e67ac82b5410c0104107b8ae5ea6b7b996ddb31b71dd4f43480e8a8a86d6e16e610ebc1e847a1a9a818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514011cdf747d6a1a9a6fba3eb50d020a28a2800a28a2800a28a2800a4605860315f714b4500557b1590e5a5918fb9a6ff006747fdf6ab9450052fecd4ff009e8d47f66a7fcf46fcaaed14014bfb357fe7a1fca93fb357fe7a9fcaaf5140147fb347fcf53ff7cd1fd9bff4d7ff001dff00ebd5ea280287f66ffd35ff00c77ffaf47f669ff9ebff008ed5fa28033ffb34ff00cf51f951fd9adff3d07e5579e448c7cec17ea6abc9a844bf74173f90a0083fb35ffe7a2fe548da7b28cb4a807a9a56bbb897889081ec3351fd96e6539607eac68020755538570dee0536aeae9ce7ef3a8fa7352ae9d1ff0013b1fa714019b456aad8c03aa93f53522dac0bd225fc79a00c6a50a4f404d6d88d17a228fa0a75006208653d2373ff000134efb34dff003c9bf2ad9a28031becd3ff00cf26fca8fb34dff3c9bf2ad9a280310c328eb1b8ff00809a69523a822b768a00c1a2b70c51b75453f5151b5a40dd631f8714018f52c1712407e53c1ea0f4357db4f84f42c3e86a36d37fbb2fe62801166b49bfd64611bfcf71527d86ddc6559b1ec6abb69f28e854fe34d16d7511caab0ff74d0059fece8bfbeffa51fd9d1ff7dff4a896eee62ff5b1961ee315623bf85bef650fbd0033fb3a3fefbfe947f6747fdf7fd2adabab8cab061ec6968029ff006747fdf6a3fb3a3fefb55ca28029ff006747fdf6a3fb353fbed5728a00a7fd9a9fdf6a3fb3a3fefb55ca28029ff6747fdf6a3fb3a3fefbfe95728a00af1daf97f766940f4c8c54e0103ef13ee6969e8858fb50008858fb54e000302800018145030a28a2800a28a2800a28a2800a28a2800a28a2800a8ee274b788c8ff0080f534e91d6242ee70a3a9ac0bbba6ba9771e147dd1e9400c9a679e53239e4fe951d1453105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514016b4fb7fb45c0047c8bcb7f856f556b0b7fb3db8047cedcb559a430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800aa3a94fb53ca53cb727e95724711c6cedd00cd61c921964676ea4d44dd958e8a10e6777d06d1451589dc145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145006cd94fe7c2327e65e0d4f58d6737933824fca7835b35bc1dd1e7d6872c828a28aa310acfd4e5fbb10fa9ad0240049e82b0a690cb3339ee6a26ecac7461e3795fb0ca28a2b13b828a29f1c32c9f7118fbe2813696e328ab89a74cdf78aafe39a9d34c8c7df763f4e2a94199bad05d4cca2b616c6dd7f833f535208215e9127fdf34fd9b337898f4461d15be15474503f0a5a7ecfcc9facf91cfe28ae8290a83d40347b3f30facf9181456e98626eb1a1ff808a8daceddbac63f0e297b3652c4c7aa31a8ad46d3613f74b2fe350be98e3ee480fd46297232d5783ea51a2a77b39d3ac648ff00679a80820e0820fbd4b4d1a2927b30a28a282828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00d8b19bcd80027e65e0d58ac6b29bc9b8049f95b835b35bc1dd1e7d6872c828a28aa310a28a2800a28a2800a28a2800a28a2800a28a28020bcb71736ec9fc4395fad73c410482304575158faadb797289947cafd7d8d0233e8a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014aac558329c11c822928a00deb1bc1731e1b8917a8f5f7ab55ccc72345207438615bf6974b7516e1c30fbcbe94864f451450014514500145145001451450014514500145145001451450014514500145145001451450014514500141504e4804d1450045716f1dc465641f43dc567ae8edbfe6946df61cd6ad14015174cb60b82acc7d4b73510d2621283bd8a7f77ffaf5a145002222c6a15142a8ec2968a2800a28a2800a28a2800ac9d5e5732a4233b719c7a9ad6a824b6592ea398ff00e9ebe94018cb6172c78888faf15a569a6a44374c048fe9d855ea2802bc9616d2758c29f55e2a8dce95b10bc2c5b1fc27ad6b5140181656eb732b46c4a9db90455bb3b164ba916401a30b827b366ae5bdaac33cb28eae78f61ff00ebab140105adaada8708490c73cf6a9e8a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a041451450014514500145145001451450014514500145145001451450014514500151bc45fac8f8f4071525140100b380725327d493522c31afdd8d47e14fa2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a46446fbcaa7ea2968a008becd0e721003fecf1fca9e10af476fc4e69d45001f5a28a2800a28a2800a28a2800a28a9238f3cb74a00238f7727a54c0607145140c28a28a0028a28a0028a28a0028a28a0028a28a00282428249c01d4d158fa8df79a4c511fdd8ea7fbd4011dfde1b97dabc44bd3dfdea9d14531051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140055dd32dbce9fcc61f2273f5354d54bb0551924e00ae8ada016f02c63a8ea7d4d2025a28a281851451400514514005145140051451400514514005145364711c6cedd00cd01b943539b2442a7a72d54295dcc8ecedd49cd2573c9dddcf4e11e48d828a28a45851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514539519ce114b1f614086d15652c277eaa147fb46a74d33fbf27e0053516ccdd582ea67d15acba7c03aee6fa9a916d205e912fe3cd57b3643c447a18b456f08a31d1147d0538003a0a7ecc8facf91cfe0fa515d05147b3f30facf91cfd15be510f5553f5151b5b40dd624fc0628f6635895d5189456bb585bb7452bf4350be983f82423ea2a79196b11066751569ec275e8030f6355dd1d0e1d4a9f7152d346aa5196cc6d145141415b1632f9b6e33f7978358f56f4e9765c6c3d1c63f1aa83b331ad1e687a1ab451456e79e57be93cbb56f56f94563d5fd51f98d3f1aa2aa5982a8c93d0561377677d05685c4ab7069f249cc9f22feb56ed2cd61019f0d27f2ab555187733a988e91208ace18ba26e3eadcd4f51cd3c502e6470beddcd67cdabf6863fc5bfc2b4d11cf694f535298f2c71fdf9157ea715832de5c4bf7a56c7a0e054153cc68a8f766f36a36abff2d33f406a26d5a01d1643f80ac6a297332fd8c4d63ac27689bf3a4fed85ff009e27fefaacaa28e663f65135bfb617bc27fefaa70d5e2ef1b8fa62b1e8a39987b289b6355b73d778fa8a91750b56ff0096a07d411581451ccc9f6313a549a293ee488df434fae5ea48ee268fee4ae3db34f989747b33a4a4744718750c3dc56347aacebf7c2b8f71835722d5617e240d19fcc53ba643a72449269f0bfddca1f6aa92e9f2a729871edc1ad38e54946637561ec69d43826546b4e26032b21c32907d08a4adf7459061d430f7154e5d391b9898a9f43c8acdd37d0de3888bdf43328a966b6961fbebc7a8e4545516b1d09a7aa0a28a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140056cd9cbe75ba93f78706b1aade9d2ec9f61e8ffceaa0eccc6bc79a3e86ad14515b9e7851451400514514005145140051451400514514005326896689a36e8c3f2a7d1401cd4b1b452346e3054e2995afab5b6f4f3d072bc37d2b22810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a482678251221e476f5a8e8a00e8edae12e620e9f88f4352d7396d70f6d2874fc47a8adf8274b8883a1e3b8f4a4324a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239bee8fad43534df747d6a1a0414514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014528049c0a99230bc9e4d002247ddbf2a928a281851451400514514005145140051451400514514005145666a37fb730c279e8cc3b7b5003752bedd98213c74661dfdab328a2810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2a5b785ae2658d7bf53e82802f6936d926e1874e17fc6b56911163454518551814b4861451450014514500145145001451450014514500145145001543539701621df9357c900127a0ac29e432ccce7b9e3e95137646f878de57ec328a28ac4ef0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a2acc36334bc91b17d5aaec5610c7cb0de7dfa7e554a0d98cab462664714929c2216fa55b8f4d73cc8e17d8735a4000300605156a9aea73cb1127b68578eca08ff8371f56e6ac0000c0000f6a8a5b9861ff00592283e9dea9cbaba0e228cb7bb7157a233b4e668d158526a572fd1820ff0064557796493efbb37d4e697314a8bea740f73027de9507fc0aa26d46d57fe5a67e8a6b068a5cccb5451b4756b71d1643f80ff1a61d5e3ed139fc6b228a5ccc7eca26b7f6c2ff00cf13ff007d527f6c2ffcf13ff7d5655147331fb28f635c6af1f789c7d08a91755b73d438fa8ac4a28e662f6513a04bfb67e9281f5e2a7575719460c3d8e6b98a504a9ca920fa8a7cc4ba2ba33a7a080c30c011e86b062d42e62fe3de3d1b9abd06ad1b712a943ea3914f9919ba5244d2d843272a361f6e9f95509ed258392372ff007856c23ac8a1918303dc1a5eb49c132a15a51dce7e9558a3061d41c8abd796580648471dd7fc2a8564d34ced84d4d5d1beac1d030e84668a82c1f7daafaaf1456e9dd1e74959b450d41b75db0f40055bd3edbcb4f35c7ccdd3d85431c3f68bf91987c8adcfbfb56954455ddcdea4ed150404e064f4accbbd5304a5bfe2ff00e1516a37a65630c67e41d48fe2acfa6e5d850a7d58acccec5998b13dcd2514541b851451400514514005145140051451400514514005145140051451400aacc8db958a91dc1abb06a9347c480483df835468a77b12e29ee6fc17f04fc06dadfdd6e2acd72f566defa7830036e5feeb7354a5dcc6547b1bf55a6b18a5e546c6f51fe151dbea70cb80ff00bb6f7e9f9d5d041190722ab4667ef41f631a7b4961e48dcbfde150574155a7b18a5c95f91bd474acdd3ec744311d24645152cd6d2407e75e3fbc3a54559ec75269aba0a28a281851451400514514005145140051451400514514005145140051451400514514005145140052ab1560c3a839149450237a371246ae3a30cd3aa969926e89a33d54e47d2aed74277573cd9c7964d0514514c80a28a2800a28a2800a28a2800a28a2800a28a28002010411907ad73f7b6e6da72bfc27953ed5d0557beb6fb4c040fbebcad0073f450460e0f5a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a6b5b97b69772f20f55f5a868a00e96099278c3c6720fe94fae76d6e5eda4dcbc83f797d6b7a099278c3c6720fe948649451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004737dd1f5a86a69bee8fad4340828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029caa58f14a9196e4f02a70001814008a81471d7d6968a281851451400514514005145140051451400514514005145676a17fb330c27e6e8cc3b5001a85feccc309f9ba330eded59145140828a28a6014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015b7a65b7930f98c3e77fd0550d3adbed13ee61fbb4e4fbfb56e5200a28a28185145140051451400514514005145140051451400514514015b5097cbb620757e2b22adea526fb8d83a20c7e3552b09bbb3d0a31e58051451526c14514500145145001451450014514500145145001451450014514500145145001451450014514500140e4e055982ca49b04fc8bea6b4a1b68a01f2ae5bfbc7ad52836633ad18e9b99f05849260bfc8befd6b421b68a1fbabcfa9eb52d35dd235dcec147a935aa8a4724eaca63a82428249000ee6b3ae35645c881771fef1e0566cd712ce732393edda872411a4dee6b4fa9c31e447991bdba7e759d36a171371bb62fa2f15568a96db368d38a0a28a2a4d028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a009219e481b746c54fe86b62cf504b8c23e124f4ec7e958740e0e4552762250523a8acbbfb6f29fcc41f23751e86a6d3af7cf5f2a43fbc0383fde157244592328dd08aa6b9918424e94b529696df2c8be841a292c51a1bb9236ea17f3a2886c15be3ba2f47188d481dc924fbd57d467305a9da70cff0028ab5595acb1df12f6009a6f444c1734b53328a28ac8ec0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a9a0ba9a03fbb7207a1e45434531357dcd7835646c099369f55e455f8e58e55cc6e187b1ae66955990e558a9f506a948ca5493d8e9c804608c83d8d51b8d3d5b2d09da7fba7a5269925c4aa5a56cc638191c9357e9d94919294a9bd1982e8d1b6d7520fa1a6d6ecb0a4cbb5d73fd2b32e6c9e1cb27ce9fa8ace5068eba7594b47b9568a28a8370a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802c5849e5dd2fa37ca6b62b9f048208ea2b7a370f1ab8fe219ad69be871e263aa63a8a28ad0e50a28a2800a28a2800a28a2800a28a2800a28a2800a28a28032355b5d8fe7a0f95bef7b1aceae9a48d658d91c655860d73d710b5bccd1b76e87d450222a28a298051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140054d6d72f6d26e4e9dd7d6a1a2803a4b79d2e230f19fa8ee2a4ae72dee1ede40e87ea3b1addb6b94b98f721e7baf714864d4514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004737dd1f5a86a69bee8fad4340828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a29caa58f14009d6a548b1cb7e54e540bf5f5a7500145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28acabfd43398a03c74671fd2801fa86a1b730c079e8cc3b7d2b268a2810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029c88d2384519663814dad7d2ad76af9ee396fbbec3d690172da05b785635edd4fa9a968a281851451400514514005145140051451400514514005145140052330552c7a01934b55b509365a91dd8e29376454573348c9762eecc7a939a4a28ae73d30a28a281851451400514514005145140051451400514514005145140051451400514514005140049c01927b0abf6da793869f8ff00647f5a6937b1139a82bb2a430493b61178ee4f415a76f651c3827e77f53daac2a8550aa0003b0a5ad63048e2a95a52d16882a29aea183fd64801f4ea6b33519aea398a348421e576f19159f4dc8234afab6694fab31c88136ffb4dd7f2aa124af2b6e91cb1f7a65150ddcde3151d828a28a45051451400514514005145140051451400514514005145140051451400514514005145140051451400e8dda3915d4e194e457491482589645e8c335ccd6ee96c4d9283d89157131acb4b961a20d209070c063f0a29f45558e7bb0accd66325639076241ad3a8ee2113c2d1b771d7d0d0d5d0e0f95dce6e8a7491b4523238c303cd36b23b028a28a06145145001451450014514500145145001451450014514500145145001451450014514a012700127d050025156e1d36e25e4aec1eadfe157e1d2a14e642643f90aa4999ba91463c71bcadb6352c7d00ad0b6d29890d39c0fee8eb5aa88b1aed450a3d00c52d528994aab7b088aa8a15400a3a014b45154621451450054b9b14972d1e15fd3b1acc92368d8aba90456f54734293aed719f43dc544a17d8e8a75dc747b187454f736af6e73f793b30a82b16ac7629292ba0a28a282828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b5b4e7dd6c077538ac9abda5be2474f519aa83d4c6babc0d2a28a2b73cf0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800aa9a8dafda21dca3f789c8f7f6ab7450072f45686a96be549e720f918f3ec6b3e98828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029f0ccf0481e33823f5a651401d05a5da5d271c38eab562b994768dc3a12187422b6acaf96e06c7c2cbe9ebf4a432e514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514011cdf747d6a1a9a6fba3eb50d020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a29ca85ba54ca817ebeb400c48b3cb7e55281818145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a00282400493803a9348eeb1a17760aa3a935897b7cd727626562f4f5fad00497fa81973142709ddbfbd59f4514c41451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514a88cee1546589c0140162c6d8dccf83f717963fd2b7c000000600a86d6dd6da008393d58fa9a9a90c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b37547cc889e8335a558b76fbeea43ef8fcaa2a3d0df0eaf3b90d1451589de1451450014514500145145001451450014514500145145001451450014514500152c16f24ed841c7727a0ab16b6064c3cb955ec3b9ad2555450aa0003b0ab8c2fb9cd52ba8e91dc8aded63807032ddd8d4d4515b25638db6ddd8514514088ee2de3b88f6483e8475159171a64d164c7fbc5f6ebf956dd149ab9719b8ec730410704104763495d24b04530c4881bdfbd519b4853cc2e57d9b9150e2cd9554f73268ab13595c43cb4648f55e4557a46a9a7b05145148614514500145145001451450014514500145145001451450014514500145145001451450015bfa7c663b28c1ea467f3ac9b2b637338047c8bcb1adfe8302ae2ba9cf5a5d028a28ab300a28a2802aded9add2e47cb20e87fa1ac4962785ca48a54d74b4c9a18e74db22861fcaa5c6e6b0a8e3a339aa2b4a7d25d72606dc3fbadc1aa12452447122329f7150d58e85252d865145148a0a28a2800a28a2800a28a2800a28a2800a280093803353c7677127dd89bea78fe74c4da5b90515a31e9129ff0058eabf4e4d5a8f4bb74fbdb9cfb9e29f2b21d58a31402c700127d055a8b4eb993f8360f56e2b6e38923188d1547b0a753e533759f433e1d2635e6572e7d0702aec50c508c468abf414fa2aac9193937b8514514c90a28a2800a28a2800a28a2800a28a28002030208c83d8d665dd894cbc432bdd7d2b4e8a4e29970a8e0ee8e7e8ad1bdb2ce648873dd477aceac1a68f42135357414514522c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a7b37d97519f538fcea0a553b5811d41cd0b464c95d346fd14039008e868ae93cb0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2801b246b2c6c8e32ac306b9eb981ade631b76e87d4574755afed45cc3c7fac5e57fc2803028a0820e08c1145310514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005009041070477a28a00d7b1d443e239ce1bb37afd6b46b97ad0b2d44c588e624a766ee2901b14522b0650ca4107a114b40c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008e6fba3eb50d4d37dd1f5a86810514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514548b113d781400c00938152ac5ddbf2a7aa851c0a5a003a5145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a39e78ede3df21c0ec3b9a8aeef23b55c1f9a43d16b1269a49e42f2364ff2a0092eeee4ba7cb7083a28ed55e8a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b5f4ab4d8be7b8f99bee8f41eb54f4fb5fb4cd961fbb5ebefed5bbd29005145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00476d88cde809ac0272726b66f9b6da3fbf158d59547a9d9865a361451456675051451400514514005145140051451400514514005145140051452a233b0551927a0a040aa598050493d00ad3b4b21161e5c17ec3b0a92d6d56dd727973d4fa558ad630b6ace3ab5afa4760a28a2b439828a28a0028a28a0028a28a0028a28a002a19ad209befc633ea383535140d36b632e5d23bc327e0dfe354a5b2b887ef4648f51c8ae868a9e5468aac96e72f457492dbc337fac8d58fae39aa72693137fab7643efc8a9e5668ab27b98f455e934ab85fb855c7b1c1aad25bcd1fdf89c0f5c714accd1493d9915145148a0a28a2800a28a2800a28a2800a28a2800a28a9a1b59a7ff00571923d7a0a626ec4353dada4972d85185eec7a0ad0b7d29570d3b6e3fdd1d2b41542a8550001d00aa51ee632aaba0c8204b78c220e3b9f5a928a2ace76ee145145001451450014514500141018618023d0d1450056934fb693fe59853eabc5577d2233f72561f519ad1a295914a725d4c86d224fe1954fd4629a749b81fc519fc4ff856cd14b9515ed64627f655cffb1f9d28d2ae0f78c7e35b5451ca87ed64638d226ef220fa66a45d1ffbd37e4b5a9451ca85ed64505d2601f79ddbf1c54c9616a9d2207ea735668a7644b9c9f51a91a27dc455fa0c53a8a29921451450014514500145145001451450014514500145145001451450014514500145145001542fad3acd18ff00787f5abf4526ae8b84dc1dd1cfd1572fed7ca6f3107c8dd47a1aa75ced59d8f463252574145145050514514005145140051451400514514005145140051451401b76adbada33fece2a5aaba7366d40fee922ad5744763cc9ab49a0a28a299014514500145145001451450014514500145145001451450014514500656ab6983f688c71fc63fad6657504060411907822b02fad4db4d81f71b953fd28115a8a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450059b4bd92d5b03e643d54d6dc13c7709be36c8ee3b8ae6ea486692070f1b60ff003a407494555b3be8ee46d3f2c9fddf5fa55aa06145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004737dd1f5a86a69bee8fad4340828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a29ca8cdf4a006d3d632dec2a558d57dcd3a801aa817eb4ea28a06145145001451450014514500145145001451450014514500145148eeb1a16760aa3a93400b59f7ba92c798e0219fbb76155af35169b290e563ee7b9aa14085662cc598924f526928a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140053e189a6956341c9a656e69d69f678b738fde375f61e9480b1042b044b1a741dfd4d4945140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00a5aa362245f56cd6655ed51b32a2fa0cff9fcaa8d613dcf4282b41051451526c1451450014514500145145001451450014514500145145002a82cc028c93d056bda5a8b74c9e5cf53e9ed51d85af96be6b8f9cf41e82ae56b08db567156ab7f750514515a1cc14514500145145001451450014514500145145001451450014514500145145001451450031e18a4fbf1a37d4540fa6dab7fcb32bf426ad514ac3526b6667b69111fbb238fae0d44da3b7f0cc0fd5715ab451ca8af692ee639d227ecf19fc4ff008534e9571ea9f9d6d514b9515ed64627f655cffb1f9d3869339eaf18fc4ff856cd1472a0f6b23297476fe2980fa0cd4c9a4c23efbbb7e957e8a7ca897524fa9047676f17dd8973ea79fe753d145325b6f70a28a28105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514008ea1d0ab0c83d6b16e21304a50f4ec7d456dd41796fe7c3c7df5e4544e3746d46a723b3d8c6a28a2b13d00a28a2800a28a2800a28a2800a28a2800a28a2800a28a28034b4b6f9245f420d5eacdd2cfef5d7d5735a55bc363cfaead361451455188514514005145140051451400514514005145140051451400514514005477102dc42636efd0fa1a928a00e6a589a191a3718614cadcd42d3ed11ee41fbc5e9ee3d2b0fa5020a28a298051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514000241c83835a967a9e309707e8ff00e359745203a80430041041e84515816b7b25b1c0f993ba9adab7b98ae5331b73dd4f5140c968a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008e6fba3eb50d4d37dd1f5a868105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514b4f5898f5e28023a7ac6cdec2a558d57b64d3a80b0d58d57dcd3a8a2818514514005145140051451400514514005145140051451400514514005141e064d675dea617296f866eefd87d2802d5d5dc76cbf39cb1e8a3a9ac4b9ba92e5f2e781d14741513333b1662493d49a4a04145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28ab3636a6e65c1e117ef1fe9401674bb4dc44f20e07dd1ea7d6b5a8501542a8c01c014521851451400514514005145140051451400514514005145140051451400514514005145140191a8366ed87a002ab54b76775d487fdac5455cef73d382b4505145148b0a28a2800a28a2800a28a2800a28a2800a28a2800ab7616de6bf98c3e45fd4d578a36964545ea6b6e38d628c22f415708dddce7af5395596e3a8a28ad8e10a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28032f5183cb93cc51f2b75f6354eb7668c4b1323743586e863728c390706b19ab3b9dd427cd1b3e82514515074051451400514514005145140051451400514514016b4e38ba03d4115ad58d6471771fd7fa56cd6d4f638710bdf0a28a2ace70a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800acbd52cf19b88c7fbe07f3ad4a0804608c83401cbd156f50b336d26e51fbb6e9eded55298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029c8ed1b86462ac3b8a6d1401b169a9abe127c2b7f7bb1ff000ad0eb5cbd5ab5be96db0bf7e3fee9edf4a406f51515bdcc572b98db9eea7a8a96818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514011cdf747d6a1a9a6fba3eb50d020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a5009e9400945482263d78a7ac6a3de80210a5ba0a9161fef1fcaa5a28188142f414b4514005145140051451400514514005145140051451400514514005145140051450480327814005453dc456e9ba46c7a01d4d53bbd5153290619bfbdd85653bb48e59d8b31ee6802c5ddf497395fb91ff7477fad55a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a500b1000c93c002801f0c2f3ca2341c9fd2ba0b7856de211a741d4fa9a86c6d05b45cf3237de3fd2ad52185145140051451400514514005145140051451400514514005145140051451400514514005145231c293e828030a43ba463ea49a6d145731ea85145140c28a28a0028a28a0028a28a0028a28a0028a2a7b483cf9803f7472d425725b495d9774f83cb8fcc61f33f4f615728a2ba12b2b1e6ca4e4eec28a28a648514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400550d4a0e04ca3d9aafd23a8752ac3208c1a4d5d58b84f92573028a74a8629590ff0009c536b9cf493b85145140c28a28a0028a28a0028a28a0028a28a0092d8e2e623fed0adcac188e2543e8c2b7ab5a671e277414514568728514514005145140051451400514514005145140051451400514514005145140051451400d96359a328e32a6b9fbab76b698a3723b1f515d1543756cb731146e0ff09f43401ced14f96368a428e30c2994c4145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145002a33230642548e8456a5aeab9c2dc0c7fb63fad6551480e9d58328652083d08a5ae76deea5b66cc6dc7753d0d6bdaea114f856f91fd0f7fa5032dd145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514011cdf747d6a1a9a6fba3eb50d020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a70463d0500368a94427b9a788d476cd0040013d053c44c7af153018e945016182251d79a780074145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a6cb2a429ba460a3deb2aeb5467cac036aff78f5a00d0b9bc8ad87cc72dd9475ac7babd96e4e09da9fdd155c924924e49ee692810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b5f4cb3f2c09e41f39fba3d0541a6d979ac26907c83ee83dcd6c5200a28a28185145140051451400514514005145140051451400514514005145140051451400514514005327388243fec9fe54fa8aece2d64ff007693d8a8ee8c4a28a2b9cf5028a28a0028a28a0028a28a0028a28a0028a28a002b66ce0f260008f99b9359f610f9b70091f2a735af5a535d4e3c44feca0a28a2b539428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00cdd4e2c3aca3a3707eb546b6aee2f36dd97bf51f5ac5ac26accefa12bc6dd828a28a9370a28a2800a28a2800a28a2800a28a2801578607deb7eb9fae82b4a7d4e4c4f40a28a2b539028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00a97f662e63caf122f43ebed5864152411823820d74f59fa95979a0cd10f9c751fdea00c7a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00b96da8cb0615bf789e87a8fc6b5adeee1b81f237cdfdd3d6b9da50482082411dc5203a7a2b1edb54923c2cc37afaf7ad486e229d731b83ea3b8a064945145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004737dd1f5a86a69bee8fad4340828a28a0028a28a0028a28a0028a5c13d0528463d8d00368a9044dec29443ea68022a2a7112fb9a70451d850057c67a53846c7b54f4501622109ee69c2251d7269f450310281d00a5a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a3a0c9aa573a9c516563fde37b7414017588504b1000ea4d675ceaa8995806e3fde3d2b3a7ba96e0e646e3b28e82a1a043e596499f748c58fbd328a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140055bb0b3373265b88d7a9f5f6a8ed2d9ae65dabc28fbcde95bf146b1461106145201ca02a800600e00a28a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005417c716927d07f3a9eabdff00fc79bfe1fce94b62e1f1231e8a28ae73d30a28a2800a28a2800a28a2800a28a2800a28a7c319965541dcd026eda9a7a7c5e5dbee3d5f9fc2ad50005000e828ae84acac799297336c28a28a6485145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400562de45e55c30ec7915b554b538b746b20eaa707e95135746f425695bb99945145627785145140051451400514514005145140057403a0ae7eba01d05694fa9c989e81451456a720514514005145140051451400514514005145140051451400514514005145140051451400514514005145140197a958e333c438eaca3f9d65d75158fa8d8f944cb10fdd9ea3fbbff00d6a0467d14514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00295599183292a477149450068dbeaaeb859d770fef0eb5a70cf14eb98dc37b7715cdd2ab3230652411dc1a4074f4563dbeab2261661bc7a8e0d69c1730dc0fddb827d0f5a064b45145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450035d7780338a6793fed7e952d14011f93fed51e48f535251400cf297de97cb5f4a7514009b17fba2970074028a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a282428249000ee6a8dc6a91479110f31bf4a00bdd2a9dc6a50c5909fbc6f6e9f9d655c5dcd71f7dfe5fee8e05414089ee2f26b8fbed85fee8e05414514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a48217b894468393d4fa53638da590220cb1adfb4b55b58b68e58fde6f5a403ede04b788227e27d4d4945140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002abea1ff1e8ff0087f3ab155f50ff008f47fc3f9d296c5d3f8d18f45145739e985145140051451400514514005145140055fd322cbb4a7b702a856ddac5e55ba2f7c64fd6ae0aecc2bcad1b7725a28a2b638028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029b220923643d18629d4501b180ca558a9ea0e0d255bd462d93ef1d1c67f1aa95ccd59d8f5212e68a61451450505145140051451400514514005741580832ea3deb7eb4a7d4e4c4f40a28a2b539028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00282010411907a8a28a00c4bfb236edbd06623ff8ed52ae9d955d4ab0041e0835877d66d6cf95c98cf43e9ed408a945145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a0120e41c1a28a00bb06a734580ffbc5f7ebf9d69417f04d801b6b7a37158145203a8a2b9f82f6783011f2bfdd6e456841aac6d812a943ea39140cd0a29a92248bb91830f5069d4005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005155e7bd820e19f2dfdd5e4d67cfaacafc44a107af53401ad24a912ee91c28f7359f3eaca32204dc7fbcdd2b2ddda46dcec58fa934da044b35c4b39cc8e4fb76a8a8a29805145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140052a233b85504b1e00142a9660aa092780056e58590b64dcf8329ebeded48075959adac7ce0c87ef1fe95668a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400557bff00f8f393f0fe7562a1bc19b493e949ec543e2462d14515ce7a8145145001451450014514500145145004f67179b72a0f41c9ad9aa5a645b62321eac78fa55dada0ac8f3ebcb9a76ec1451455988514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514015efe2f32d891d579158f5d01191835873c7e54ce9e878fa56551753b30d2d1c48e8a28accea0a28a2800a28a2800a28a2801f00ccf18ff687f3addac5b319bb8c7be6b6ab5a7b1c5897ef20a28a2b439828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00291d164428e0153d41a5a280306f6cdad5f8c98cf43fd2aad74d246b2a1471953d45615e5a35abfac67eeb5022b514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00723bc6db918a9f506aec3aacc9c4aa241ebd0d50a28037a1d42de5e37ec3e8dc55a072322b97a962b89613fbb9197dbb5203a3a2b261d5dc712c61bdd7835762bfb797a4814fa37140cb3451d7a51400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514c9258e21991d57ea6a9cbab42bc46ace7d7a0a00bf4c9668a11991d57ea6b166d4ae25e036c1e8bfe355492c724927d4d0235a6d59178850b1f56e05509af679f867217fbabc0aaf4500145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a500b1000c93d00a0024800649e82b66c2c44004920cc87ff001da402d8588b75f3241994ff00e3b5768a28185145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140054772336d20ff64d4948e3746c3d411431a76660514515cc7aa14514500145145001451450014aaa5d828ea4e05255cd362df3973d107eb4257762272e58b669468238d5074518a75145749e605145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400567ea917dc947fba6b42a3b88fcd81d3b91c7d6a64ae8ba72e592661d1451581e985145140051451400514514016b4e5cdd03e809ad6aced2d7e791bd0015a35b43638310ef30a28a2acc028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029b246b2a1471953d453a8a00c0bcb36b57f58cf46aad5d3488b2214700a9ea2b0ef6cdad5f232d19e87fa1a0455a28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514012453cb0ffab9197d81e2ae45ab4abc488ae3d4706b3e8a406e45a9dbbfde250ffb42ada3a48328cac3d41cd7314aacca72a483ea0d0074f4560c7a8dcc7ff2d370f4619ab51eafff003d62fc54ff004a066a515563d46da4ff00969b4fa30c559575719460c3d41cd002d14514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051454525cc117df9547b679a00968aa126ad02fdc5673f90aab26ad337dc5541f99a00d9a865bbb78befcab9f41c9ac292e2697fd648c47a678a8a811ad2eae8388a32deedc5539751b993f8f60f45e2aad1400a492724927d4d25145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a500b1000c93d00a154b30550493d00adab0b116e049260ca7ff001da402585888009241990f6feed5ea28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450060c8bb6465f424536a6bc5db7720f7cd435ccf73d48bba4c28a28a0a0a28a2800a28a2800ad8b18bcbb65cf56f98d65dbc7e6ce89d89e7e95b95a535d4e5c4cb4510a28a2b538c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00c7be8bcbb96c746f98557ad5d4a2df0071d50fe95955849599e8d197341051451526a14514500145145006a698b8b72dfde6ab9515aa6cb68d7db352d7445591e6547793614514532028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00291d16442ae0153d41a5a28030afac5ad9b72e5a23d0fa7d6aa574eca194ab0041ea0d635f581809923c98bff0041a0451a28a298051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140052862a72a483ea2928a00b097d731f4949ff7b9ab29abca3efc6adf4e2b3a8a406ca6ad09fbe8ea7f3ab097d6cfd2651f5e3f9d73d450074eacae32ac187b1a5ae60120e41c1a952eee13eeccff0089cd007454561aea772bd595beabfe1532eb0e3efc4a7e87140cd6a2b397578cfde89c7d08352aea96c7ab32fd56802e5155d6fad9ba4cbf8f15209e16e92a1fa30a00928a0107a1cd140051451400514514005145140051451400514514005145140051451400514d69117ef3a8fa9a635d5baf5993f06cd004b45556d46d57fe5ae7e80d46dab5b8e8ae7f0a00bd456636b03f861fcdaa16d5a73f75517f0cd006cd1580fa85d3f5948fa002a179647fbf2337d4e6803a17b8863fbf2a0fa9a81f53b64e8c5bfdd15854502355f581ff002ce23f56355df54b96fba553e83fc6a9514012493cb27df919bd89a8e8a29805145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140052a2b3b05504b1e8052c71bcae1114963dab72cac92d57270d21eadfe14804b1b15b65def8329efe956e8a28185145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140197a9ae2e037f796a9d69ea899891fd0e3f3accac26b53d0a2ef0414514549b0514514005145039381401a1a5c5f7e53fee8ad0a8e08fca8513d073f5a92ba22ac8f32a4b9a4d8514514c80a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28011943a153d08c1ac2910c72321ea0e2b7ab33538b6ca241d1873f5acea2d2e74e1e56958a545145647685145140053a24f32554f538a6d5bd363dd705fb20fd69a57644e5cb16cd5e945145741e6051451400514514014f529192340ac5493d8e2b3bcf97fe7abff00df46ad6a6d99d57fbab54ab09bd4f428c57221fe7cbff3d5ff00efa3479f2ffcf57ffbe8d328a9b9a72a1fe7cbff003d5ffefa3479f2ff00cf57ff00be8d328a2e1ca87f9f2ffcf57ffbe8d1e7cbff003d5ffefa34ca28b872a1fe7cbff3d5ff00efa3479f2ffcf57ffbe8d328a2e1ca87f9f2ff00cf57ff00be8d1e7cbff3d5ff00efa34ca28b872a1fe7cbff003d5ffefa3479f2ff00cf57ff00be8d328a2e1ca87f9f2ffcf57ffbe8d1e7cbff003d5ffefa34ca28b872a34ecaf3cc02390fcfd8fad5dae7c1c1c8ad5b2bcf3408e43f38e87d6b584ba3392b51b7bd12dd14515a1cc14514500145145001451450014514500141008c119068a280322ff4f31e6580653bafa567575159b7da76eccb00e7a941dfe9408c9a28e945300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ce3a53c4b22f49187d0d328a00985d5c0ff0096f27fdf469c2f6e47fcb66aaf45005a1a8dd0ff0096bff8e8a5fed2baff009e83fef915528a405cfed3bafef8ff00be451fda773fde5ffbe6a9d140173fb52e7fbcbff7cd1fda773fde5ffbe6a9d14016ff00b4eebfbe3fef9149fda575ff003d7ff1d15568a00b26fee8ff00cb63f90a69bcb83ff2d9ff003a828a60486e266eb3487fe04698598f5627ea6928a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a482179e40918c9fe54eb5b592e64da83007563d056edbdbc76f1ec8c7d4f734806da5a25aa617963d5bd6a7a28a06145145001451450014514500145145001451450014d9245890bb9c01448eb1a1773802b22eae5ae1f3d14741532958d6953737e413ddcb2c858332af600d47e7cbff003d5ffefa34ca2b0bb3bd45256b0ff3e5ff009eafff007d1a3cf97fe7abff00df469945170e543fcf97fe7abffdf468f3e5ff009eafff007d1a65145c3950ff003e5ff9eaff00f7d1a3cf97fe7abffdf469945170e543fcf97fe7abff00df468f3e5ff9eaff00f7d1a65145c3950ff3e5ff009eafff007d1a3cf97fe7abff00df469945170e543fcf97fe7abffdf468f3e5ff009eafff007d1a65145c3950ff003e5ff9eaff00f7d1ab1653bfda9433b10723935529d136c951bd0834d3d4528a69a37a8a28ae83cc0a28a2800a28a28022bb4f32da45ef8c8ac4ae82b0a78fca99d3d0f159545d4ebc34b74328a28acceb0a28a2800ab36117997209e8bf31aad5aba745b20de7ab9fd2aa0aeccab4b9605ba28a2b73ce0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a82f22f36d980ea39153d149ab8e2ecee73f454b75179570ebdb391f4a8ab9de87a89dd5d05145140c2b5b4f8f65b063d5ce6b3218ccb2aa0ee6b7400a001c01c0ad29aea72e265a728514515a9c614514500145148ec11198f40334018d78fbeea43ef8fcaa1a09c924f5345733d4f512b2b051451414145145001451450014514500145145001451450014514500140241c838228a280356cef04c02487120fd6add73e090720e08ad5b3bc1280921c49ebeb5ac277d19c55a8dbde896e8a28ad0e60a28a2800a28a2800a28a2800a28a2800a28a28028df69eb3e648b0b27e8d58ccac8c55810c3a835d3d56bbb34ba5feec83a35006051524d0bc121491707f9d474c414514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500156acec9ee5b27e58c756f5fa54d63a7197124c084ec3bb56baa8550aa0003a0148048a24863091ae1453a8a28185145140051451400514514005145140051451400523bac6859ce00a1dd6342ce700563dd5cb5c3fa20e82a652b1ad3a6e6fc82eae5ae1fd1074150514560ddcef494559051451414145145001451450014514500145145001451450014514500145145006e5bbefb78dbd545495534d7dd6db7fba6add74277479935693414514532028a28a002b37538f0eb20e8460d6954575179d6eca3af51f5a992ba34a52e59266251451581e9051451400e8d0c922a0eac715baaa15428e8060566e9916e95a43d14607d6b4eb5a6b4b9c38895e56ec14514568738514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140147538b28b28edc1acdadd9a312c4c87b8ac2208241ea2b19ad6e7761e578dbb051453e188cd2aa2f7fd2a0ddbb2bb2f6990e01988ebc2d5fa4450881546001814b5d095958f3672e695c28a28a64051451400557bf7d96adeadc558acfd51f98e3fc4d4c9d91a52579a33e8a28ac0f4828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028048391c1a28a00d4b3bc12e2390e1fb1f5ab95cff004ad3b3bddf88e53f3763eb5ac67d19c75a8dbde89768a28ad0e50a28a2800a28a2800a28a2800a28a2800a28a280239ede3b88f64833e87b8ac3bab492d5fe6e50f4615d0523a2c8a55c0653d41a00e628abd7ba73439922cb47dc775aa34c41451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514f8a2799c246b926801a012400324f402b5acb4d098927196ecbe9f5a9ecec52d86e3f349ddbd3e956a90c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029b248b121773802925952142ee7007eb5917370f70f93c28e83d2a652b1ad2a4e6fc85b9b96b87e7841d0541451583773bd2495905145141414514500145145001451450014514500145145001451450014514500145145005dd2df12ba7f7867f2ad3ac4b57f2ee636ed9c1adbada9bd0e1c42b4ae14514559ce1451450014514500645f43e54e481f2bf22ab56d5dc1e7c2547de1cad62918383d6b09ab33d0a33e68fa051454d6b179b70abdba9fa54ad4d5bb2bb352ce2f2add41ea79353514574a563cb6eeeec28a28a0414514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001593a845e5dc161d1f9fc6b5aaaea117996e58754e7f0a99aba35a32e599935ad636fe4c7b987cedfa0aaf616bb889a41c0fba3d7deb4aa611eacd6bd4bfba828a28ad0e50a28a2800a28a2800ac6bd7df74fe838ad791c246ce7f8466b04924927a9acea3e87561a3ab61451456476051451400514514005145140051451400514514005145140051451400514514005145140051451401a3677b9c4731e7b31feb57eb9fabd677bb311ca7e5ecde95a467d19c9568fda89a5451d7a515a9c81451450014514500145145001451450014514500159d7ba687cc90001bbaf635a34500730ca558ab0208ea0d2574177671dcae4fcafd985624f6f25bbed9171e87b1a044545145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a92088cd32c6bd58d475a3a3c5ba5794f45181f53480cf208241ea292adea5179578d8e8ff30aa94c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2a4b78fce9d23fef1e7e94004d0b43b377f1a86151d6c6af0e604900fb871f81ac7a40145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280245859a0794744201fc6a3adbb4b61fd9be59eb2024fe3d3fa562904120f514804a28a29805145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514568d9e9a5f124e0aaf65ee6802b5a59c974dc7ca83ab1adc82de3b74db18c7a9ee69eaa1542a8000e8052d21851451400514514005145140051451400514514005145140054734c9026e73f41eb49717096e996e58f45f5ac79a6799cb39e7b0f4a894ac6d4a939eaf61d3cef3bee6e9d87a545451589de924ac828a28a0614514500145145001451450014514500145145001451450014514500145145001451450015bb0bf990a3fa8cd6156ae9afbadcaf753574dea73622378dcb7451456c7105145140051451400566ea36fb5bce41c1fbdec6b4a8650ca558641ea29495d174e6e12b9cfd696991611a53fc5c0fa555b9b568650aa09563f29fe95ad1208a2541fc23159c23aea74d7a89c15ba8ea28a2b538c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028201041e41a28a000703028a28a0028a28a0028a28a0028a28a00aba8c9b2db6f7638ac9ab9a9c9ba7083a28fd4d53ac26eecf42846d00a28a2a4d828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00b7697861c249931ff002ad4560ca194820f422b02ac5add35bb63aa1ea2ae33b68ce6ab479b58ee6c514d8e45950321c834ead8e26ac145145001451450014514500145145001451450014d9624990a48a194d3a8a00c4bcd3de0cba65e3fd47d6a9575159f79a62c997830addd7b1a0463d14e7468d8aba9561d41a6d300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800aded3a2f2acd33d5be635890466599231fc4715d280000070052033f588b742928eaa707e86b1eba4b88fce81e3fef0e3eb5cd918383400514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b47478b74cf29e8a303ea6b3ab7b4d8bcab35cf57f98d20279e31340f19fe218ae688c1c1ea2ba8ac1d462f2af1fd1be61f8d0055a28a2980514514005145140051451400514514005145140051451400549046669d231fc47151d6868f16e9da43d10607d4d2036000060741583a945e55e3fa37cc2b7ab3b588b744928eaa707e8681991451453105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140053e289e67091a966353da58c97273f763fef1fe95b505bc76e9b635c7a9ee69015acf4f4830f261e4fd055da28a06145145001451450014514500145145001451450014514500155eeae96dd703973d0532eef445948f05ff9565b31662cc4927a9359ca76d11d14a8f36b2d85924691cb39c934da28ac8edd828a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500156f4d936dc15ecc3f5aa94e89fcb955c7f09cd34ecc89c79a2d1bd4500e46474345741e60514514005145140051451400100f500e39a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a09c0c9a2a0bd93cbb573ddbe5149bb0e2aeec64ccfe64aefea734ca28ae73d44ada05145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a009609de07dca78ee3d6b5e09d274dc879ee3b8ac3a7472344e190e08aa8cac6352929ebd4dea2abdaddace307e57ee3d7e9562b64ee704a2e2ecc28a28a620a28a2800a28a2800a28a2800a28a2800a28a28021b9b58ae570e39ecc3a8ac6bab296d8e48dc9d9856fd04060410083d41a00e5e8ad5bbd2f397b7e3fd83fd2b2d94ab1560411d41a042514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a508cc321491ec297cb7fee37e5400da29de5bff71bf2a3cb7fee37e5400da29de5bff71bf2a363ff0071bf2a00bda445ba7690f441c7d4d6c554d322f2ad14918673b8d5ba430ac0d422f2af1c766f987e35bf59dabc25912451920e0e2803228a76c7fee37e54796ffdc6fca9886d14ef2dff00b8df951e5bff0071bf2a006d14ef2dff00b8df9521565fbc08fa8a004a28a2800a294024e0024fb52f96ff00dc6fca801b453bcb7fee37e54796ff00dc6fca801b453bcb7fee37e54796ff00dc6fca801618ccb32463f88e2ba5002800700702b1f49809b86919480838cfa9ad8a430aced622cc4928eaa707e86b46a3b98bceb778fd471f5a00e6e8a7796ffdc6fca8f2dffb8df95310da29de5bff0071bf2a3cb7fee37e5400da29de5bff0071bf2a0a38192ac07d2801b451450014514ef2dffb8df9500368a7796ffdc6fca8f2dffb8df9500368a7796ffdc6fca8f2dffb8df950036b774c8bcbb3527abfcc6b1a285e49553691b8e338ae914055007000c0a40151dc45e75bbc7fde1c7d6a4a2819cbf4a2ad5fc0d1ddbed53b58ee181eb55fcb7fee37e54c4368a7796ffdc6fca8f2dffb8df9500368a7796ffdc6fca8f2dffb8df9500368a08c1c1eb450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451562d6ce5b93f28c27763d28020556760aa0927a015ab69a585c3dc727b276fc6addb5a456cbf20cb7763d4d4f48600003038028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a29198229662001d49a005acfbbbeeb1c27eadfe1515dde99b291e427ea6aa56529f447652a16d641451456675051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401b36327996abeabf29a9eb3b4b930ef19ee322b46b78bba3cdab1e59b414514551985145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400566ea9265d231d864d69561dc49e6ceefd89e3e95137a1d1878de57ec47451456277051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514000241041c11deb4ad2f83e126386ecdeb59b4535268ce70535667414565da5f18b0926593b1ee2b4d595d4329041ee2b6524ce19d3707a8b4514551985145140051451400514514005145140051451400541736915cafce30dd9875153d14018175652db1c91b93b30aad5d41008c11906b3aeb4b57cbdbe14ff0074f43408c8a29d246f1b95752ac3b1a6d300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28025b7b892ddf746d8f51d8d6d5a5ec772303e57eea7fa5605282548209047422901d3d159967a9f44b8fc1ff00c6b4c104020e41a061451450014514500145145001451450014523bac6859d82a8ea4d645e6a4d2e521caa773dcd005bbcd4520ca478793f4158f248f2b97918b31ee69945020a28a2980aac558329208e8456ad9ea61b0971c1ecfd8fd6b268a40751d46451585697f25b10a7e78fd3d3e95b50cd1ce9be36c8fe540c7d1451400514514005145140051451400514551bcd4921ca43877f5ec2802cdc5cc76c9ba43cf651d4d625d5e4972df31da9d94543248f2397762cc7b9a6d020a28a298055cb3d41edf08f978fd3b8fa553a2803a58a549903c6c1853eb9b82792ddf7c6d83dc7635b5697d1dc80a7e593fba7bfd290cb54514500145145001451450014514500145150dcdd476cb973963d147534012b32a29662001d49ac9bcd4d9f2906557bb773556eaee4b96f98e147451d054140828a28a601451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014aaacec154124f402acdad84b7186c6c4fef1eff004ad8b7b58ad9711af3dd8f53480a569a58187b8e4ff707f5ad30028000000e805145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28aaf7376900c7de7ec3fc693761c62e4ec896699214dce71e83d6b22e6e5ee1b9e14745a64b2bcae59ce4d32b194ee7753a2a1abdc28a28a9370a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28024b793ca9d1fb03cfd2b72b9fadab493cdb643dc0c1ad29be8726263b489a8a28ad4e40a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28021bc93cab673dcf02b16afea9265d231db93542b09bbb3be846d0bf70a28a2a4dc28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a6b7b97b76f97953d54d434509d84d26accdc82749d3721fa8ee2a4ac14768d8321208ad4b5bd59b0af857fd0d6d19df738aa5171d56c5aa28a2ace70a28a2800a28a2800a28a2800a28a2800a28a2800a28a280239e08ee136c8a0fa1ee2b22eb4d921cb47fbc4f6ea2b6e8a00e5e8adebad3e2b8cb0f91ffbc3bfd6b22e2d25b63f3afcbd98743408828a28a60145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500156ad2fa4b638fbd1ff0074ff004aab450074904f1dc26e8db3ea3b8a92b9cb6691674f298ab93815d1d218514514005145140054175771db2fcc72c7a28eb524dbfc97f2ce1f071f5ae6d999d8b31249ea4d004b737525cbe5cf03a28e82a1a28a620a28a2800a28a2800a28a2800a7c334903ef8d883fce9945006ed9dfc771856c249e9d8fd2add72f5bfa7b48d688d2b1627a67d290cb345145001451450014d9244890bbb0551dcd3ab0f53693ed6caec4a8fba3b62801d79a8bcd948b291faf735468a298828a28a0028a28a0028a28a0028048391c1a28a00d3b3d4c8c25c723b3ff008d6a821802a4107a115cbd6968ed2191d771f2c0c91ef480d6a28a281851451400514550d5da45817631084e1b1de8012f35258f290619fbb761592eed2316762cc7a934da2810514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a500b1000249e80568dae96cd869ced1fdd1d68028c30c93bed8d4b1fe55ad6ba647161a5c3bfa76157238d2240b1a855f414ea430a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a29b248b121672001597757ad365572a9e9dcd4ca491a53a6e6f427babf0b9484e4f76ff000ace249392724d14562db677c20a0ac828a28a45851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140055fd2e4f99e33dfe61542a4b793ca9d1fb03cfd29c5d999d48f345a3728a28ae83cd0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a82f64f2ed9bd5be5149bb0e2aeec654f279b33bfa9e3e951d145739ea256560a28a2818514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140176d6fca6126c95ecddc5692b0650ca4107b8ac0a9adee6481be5395eea7a1ab8cedb9cd528296b136a8a8a0b98e75f94e1bba9eb52d6c9dce369a766145145020a28a2800a28a2800a28a2800a28a2800a28a2800a080c0860083d41a28a00ceb9d2d5f2d01da7fba7a565cb1490bed914a9f7ae969b24492aed91430f7a00e668ad3b9d288cb5b9c8fee9eb59ac8c8c55d4a91d8d02128a28a6014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145005ed262df75bcf4419fc6b6aa969517976bbcf5739fc2aed218514555bbbf8edbe51f3c9fdd1dbeb4016a8a82daee3b95ca1c30eaa7a8a9e800ae7af62f26ee45ed9c8fa1ae86b2f598b88e51fee9fe9fd68032e8a28a620a28a2800a28a2800a28a2800a28a2801d1a1924545eac702ba545088aa3a28c0ac6d262df75bcf4419fc6b6a90c28a2a39a78e04df236076f5340125154adf538a6728e3cb39f972783576800accd662e23947fba7fa7f5ad3a86f22f3ad644ef8c8fad0073b451453105145140051451400514514005145140056de95179769b8f5739fc2b1910c8ea8bd58e0574a8a111517a28c0a402d145048009270077a06145507d5625982852c9dd855e4759103230653d08a005a86ee2f3ad644ef8c8fad4d450072f454f7b17937722f6ce47d0d414c414514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451562dece6b8e5570bfde3d2802bd5cb6d3a59f0cdfbb4f53d4fe15a56da7c306188deff00de3fd2ad52021b7b48ad87c8bf37763d6a6a28a06145145001451450014514500145145001451450014514500145141200c93802800a82e6ed2018fbcfd94556b9d43aa41f8b7f85679249c93926b394fb1d34e837ac892699e77dce73e83b0a8e8a2b23b124b44145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28036ace4f36d90f71c1a9ab374b930ed19efc8ad2ade2ee8f36ac7966d05145154661451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001599a9c9ba558c745193f5ad3240049e82b0657324ace7f88e6b3a8f4b1d1878de57ec368a28ac8ee0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a00c9c0e4d00145145001451450014514500145145001451450014514500145145002ab1560ca4823b8ad1b6d4036126e0ff007bb566d14d49a339d38cd6a740391914563dbddc901c7de4fee9ad48678e75ca1fa8ee2b68c9338aa52943d0928a28aa320a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a8e6b78a75c4880fa1ee2a4a28031ee74b9132d09debe87ad5020a92181047506ba7a8a7b68ae0624404faf71408e728abf71a5c91e5a13e62fa77aa24152430208ec698094514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014e442eea8bd58e0536aee95179975b8f4419fc68036910222a0e8a3029490a0962001d49a8ae2e23b74dd21fa01d4d62dddec972707e54eca290cb579a99394b7381ddffc2b309c9c9a28a62151d9183212187422b5ecf52593093e15bb376358f45203a8a86f22f3ad644ef8c8fa8acab3d41e0c249978ff00515b314a932078d8329a06733454d791793752276ce47d2a1a620a28a2800a28a2800a28a2800a28a722977545eac702803674a8b65aef3d5ce7f0abb4d50b0c406405418c9acbbcd4cb652dc90bddfb9fa52196ef2fd2df2ab8793d3b0fad62cd33cee5e4624ff2a6514082af59ea2f0e125cbc7fa8aa345303a68e449503a30653dc53ab9cb7b992d9f7467ea0f435b76b791dc8c0f95fba9a4331af22f26ea44ed9c8fa1a82b53598bfd5ca3fdd3fd3fad65d020a28a2980514514005145140051451401774a8bccbade7a20cfe35b754b498b65aef3d5ce7f0a5bcd412df2898793d3b0fad2196279e3b74dd2363d077358b777d25c9c7dd8fb28feb504b2bcce5e462c4d3281054d6d7325b3e50f07aa9e86a1a2981d0dade4772bf29c38eaa7ad4f5cc2b1460ca4823a115ad67a987c25c603766ec7eb48633598bfd5ca3fdd3fd3fad65d74379179d69228e4e323eb5cf5020a28a2980514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051454d05acd707f76871fde3d28021a9a0b59ae0feed78fef1e95a76fa5c51e1a53e637a76abe000300000761480a56da645161a4fde37bf41577a74a28a06145145001451450014514500145145001451450014514500145145001451d2a95cea0ab95870cdfdeec293696e5460e4ec8b33cf1c0b973cf603a9acab8ba927383f2a765150b333b1662493dcd256329b67753a2a1af50a28a2a4d828a28a0028a28a0028a28a0028a28a0028a28a0028a29d1c6d2b8441926813761b455abbb330286524af43ec6aad0d58519292ba0a28a282828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a007c12795323fa1add1c8c8ae7eb62c64f32d973d57e535a537d0e5c4c74522c514515a9c614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450056d424f2ed881d5f8ac8ab7a949be7083a20fd6aa56137767a1423cb00a28a2a4d828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028048391c1a28a00bd1442f6224f12aff17afd6aa4b13c2fb5d707f9d68e9b11484bb71bfa7d2accb124c9b5c647f2ad392eae727b6e49b5d0c2a2acdcd9bc1f30f993d7d3eb55ab36ac74c64a4ae828a28a0a0a28a2800a28a2800a28a2800a28a2800a28a2800a5476460ca4823b8a4a2811a56da806c2cdf29fef76abc0e464573f53dbddc901c03b93fba6b48cfb9cd530f7d626cd15141731ce3e5386eea7ad4b5adee7234d3b30a28a28105145140051451400514514005145140051451400514514005453db45703122027d7b8a968a00c8b8d2a44c985b78f43c1acf656462aca548ec4574f4c9608e65c4881a8039aa2b4ee349232606cffb2dfe359f245244db6442a7de810ca28a298051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140055db6bb5b4b62106e95cfe00552a2801d248f2b97918b31ee69b451400514514005145140054b05c496efba36c7a8ec6a2a2802ddece97412551b5c0dacb5528a2800a28a2800a28a2800a28a2800a9ecde38a712c9d10640f53505140162eaf24b96f98e13b28aaf451400514514005145140052a92ac0a9208e8452514017cdf0b8b57867fbd8cabfa9f7aa14514005145140051451400514514005006481d28a2802fdc6a07cb10db655146377735428a2800a28a2800a28a2800a28a2802e59dfbdbe15b2f1fa771f4aaf3ecf39fcb3942723e951d14005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051455a834f9e6c1dbb17d5a802ad4f059cd71f713e5fef1e056b41a6c10e0b0f31bd5ba7e556e90146df4b8a3c193f78defd2af0000c01803b0a28a0614514500145145001451450014514500145145001451450014514500145141200249c01dcd00151cd3c702e5cf3d80ea6aa5c6a006561e4ff0078d67b333b1662493dcd6729db63a29d06f5913dc5dc93f1f753fba2abd14564ddcec8c545590514514141451450014514500145145001451450014514500145152dbdbbdc3614600eade945ae26d25763238da570a8324d6bdadb2dba7ab9ea69d0c31db4671c7ab1aa93ea3c95847fc08d6a928eace494a555da3b17d94329561907a8ac7bab736f263aa1fba68fb65c673e69a956f04c9e55c8c83d1c0e45272522a14e74ddf7453a29d2c66272adf811dc520009009c0f5acce9bf5128a7491b44e55bf3f5a6d009dc28a28a0614514500145145001451450014514500145145001451450014514500145145001451450015774c936cc633d1871f5aa54e8dcc722b8eaa734d3b3b9138f345a37a8a148650c3a119145741e605145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400523b0442c7a01934b553529365bec1d5cfe949bb2b9508f349232dd8bbb31ea4e6928a2b9cf4c28a28a06145145001451450014514500145145001451450014514500145145001451450014514500145140058e0024fb5020a28a2818559b2b6f3e4cb0f917afbfb543146d348117a9fd2b6a28d618c22f41fad5c23730ad5395596e3e8a28ad8e00eb542eac01cbc3c1eebfe157ea1fb547f68f273f37af6cfa54c927b9a5394a2ef131882a4820823b1a4ad9b9b54b85e787ecd5932c4f0b947183fceb2945a3b69d553f5194514549a8514514005145140051451400514514005145140051451400025482090477157edf50230b3723fbc2a8514d36b622708cd6a6fab2ba8652083dc52d61c33c90b651b1ea3b1ad2b7be8e5c2bfc8defd0d6b19a671d4a128eab545aa28a2acc028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00291d1645daea187a114b450067cfa546f930b143e879159d3da4d07df438fef0e45743450072f456f4fa7dbcd93b7637aaf159f3e97347931e245f6e0fe5408a3452b2952430208ec6929805145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005153436b34ff00ead091ea7815a10692a3999f77fb2bd3f3a40652ab3b6d552c4f602af41a54af8329118f4ea6b5a286385711a051ed4fa064105941072a996fef3726a7a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a6c92a44bb9d80159b71a83be562f917d7b9a97248d214e53d8bb71771c1c13b9ffba2b327b99273f31c2f651d2a1a2b2949b3b214a30f50a28a2a4d828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2b42d2c3a3cc3e8bfe34d26c89cd415d90dad9b4d867cac7fceb55116350a80003b52f4a2b68c52382a54737a8c9e2134451b8cf43589246d14851c608adeaaf796c278f2bf7d7a7bfb529c6e5d1abcaecf631e8a0820904608a2b13bc52ccc0024903a7b525145022fc50fdaac47f7d0900ff004aa04152411823a8ad9b18cc56ca0f04f26a1bfb5de0ca83e61d47ad68e3a5ce68554a6e3d0cca28a2b33a828a9208fcd9366704838f7351918383d6815f5b05145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00d6d3e4df6e14f5438ab5595a749b2e369e8e31f8d6ad6f077479d5a3cb30a28a2a8c828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002b2750937dc903a2715ad54ef6cfcc0648c7cfdc7ad44d36b436a325196a65d1474a2b13d00a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ab4cbf658003feb641ff7c8a2c21124a5dbee273f8d433ca66999cf73c7d29ecae66df34b97b11d1455ed3edb71f39c703ee8feb4257761ce6a0aecb3656de447961f3b75f6f6ab34515ba563ce949c9dd8514536591628cbb1e053252b90de5cf911e17efb74f6f7ac7c9ce73cfad3e695a690bb753fa53002c401c93c0ac252bb3d1a54d4226ec0e64811cf5239a6dc40b711ed6e0f63e94f893cb8953fba314eadada6a705ed2ba30648da2728c304536b5351837c5e628f993afb8acbac24accf429cf9e370a28a291a05145140051451400514514005145140051451400514514005145140162def648700fcc9e86b4e0b98e71f21e7fba7ad6250090720e0d529b4633a3196bd4e828acc835074c2ca370f5ef5a114a92aee460456aa499c73a7286e3e8a28aa330a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280192c31cc312206fa8aa1369287985ca9f46e456951401cf4d673c1cbc671ea391505751504d656f37de8c03eabc1a0473d45694da430e6170c3d1b835465b79613fbc8d97dfb5004745145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a294024e0024fa0ab50e9b712f25760f56ff0a00a94e44691b6a2963e8066b5e1d2a14e642643f90aba91a46bb51428f402901910e9533f321118fccd5f874fb7879dbbdbd5b9ab545030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28aab3df4716427cededd293696e5462e4ec8b44850492001dcd51b8d442e561193fde3d2a94d7124e72edc7a0e951564e7d8eb861d2d6439e4691b73b163ef4da28a83a360a28a2818514514005145140051451400514514005145140051451d7a5001455a86c269396f907bf5fcaae47a7c29f78173ef54a0d98cab42267c52a42a1957749eadd07d2a68f519437ce032fd3069da85b08f1246b85e840ed54686dc5d8128545737a3759103a9c834eac8b2b9f21f6b1fddb75f6f7ad7072322b58cae8e3a94dc1d828a28aa3328dfdaee0668c723ef0f5f7acdae82b32f2cd9640d0ae558f41d8d6538f5475d0abf66452ad0b3b1e44930f70bfe3535ad92c3877c33fe8292eef562ca47867fd050a296ac73aae6f9604f2cf1c23f78c07b77a846a30138f987be2b29999d8b31249ee69293a8c6b0f1b6a5abb850fefa021a33d71d8d55a7c52344d91c83c107a114ca87a9b4535a31d1b14915c7f09cd5ad460dae255fbafd7eb54eb6cc625b608ddd455c55d3467565c92523128a57431b9461820e0d2541b05145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0055628c18750722b79183a2b8e8466b1adaddae1f03851d4d6c468b1a045e83a56b4ee71e25ad1751d451456872851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514014af6cfcccc918f9fb8f5acce95d0553bdb3f3332463e7ee3d6b39c3aa3aa8d6b7bb232e8a3a51591d8145145001451450014514500145145001451450014514500145145001451450014514e8d7748abea40a046895fb3e987fbcc39fc6b32b5753e2d87fbc2b2d119dc2a8c93d2aa7bd8c68bbc5c992dadb9b8971fc239635b4a02a800600e82a3b785608820ebdcfa9a92b58c6c8e5ab539df9051451546415917b73e749b54fc8bd3dfdeacea173b57c943f31fbc7d0551304a003b1882320819aca72e88eba104bde911d5ed3adf2de730e07ddfad36dac1dc8694155f4ee6b5000a0003007414423d58eb5556e588514515a9c60402083d0d60c8bb2464fee922b7ab0ee086b8908e858d6750eac36ec4489dd49419c7503ad329558a30653823a1ad46b68eea15908d8ec01c8acd46fb1bce7c8f5d8caa2a69eda480fcc32bfde1d2a1a4d58d134d5d05145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a002951d91b723107d45251408d08351e8b30ff00810abe8eb22ee460c3d456053a395e26dc8c54d5a9b5b9cf3c3a7ac7437a8aa306a2a7026183fde1d2aeab2baee52083dc56a9a7b1cb284a3b8b4514532028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00282323068a2802b4ba7dbcbc94da7d578aa32e90e3989c30f43c1ad7a28039c96de687fd646ca3d7b7e751575155e5b2b797ef4601f55e2811cfd15a92e91de297f061fd6a9cb63731758c91eabcd0057a282307068a601451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001453e38a494e23466fa0ab716953bf2e5507bf268028d28058e14127d056cc5a5409cb9690fbf02ae4714710c468aa3d85203122d3ae24e4aec1eadc55d8b49897995cb9f41c0ad0a2818c8e18e1188d157e829f4514005145140051451400514514005145140051451400514514005145140051451400514514005145433dd45070cd96fee8eb43761a4dbb226a827bc8a1e09dcdfdd159f3df4b2f0bf22fa0aad593a9d8e9861fac89e7bb966e09dabfdd150514566ddcea5151564145145050514514005145140051451400514514005145140051451400514019381d6b46d6c00c3cc327b2ff008d349b22735057656b7b4927e7eea7f78d69416d1403e55cb7f78f5a27b98edd79e5bb28acd9af6694f0db17d16b4f762737ef2af9235d9d57ef301f5342bab7dd607e86b03af5a297b41fd5bccdf750e85586411835893c46194a1edd0fa8a7c5793447ef6e1e8dcd5899e3bd8729c4a9ced3dc50da921c232a4f5d8a157f4fbac62190f1fc27fa550a2a13b3379c14d599d051552c6ebce5d8e7e71fa8ab75ba77d4f3a5171766145145324a5a85c491e1106d0c3ef56656ecd12cd1946efd0fa562cb134321471c8fd6b19a77b9db87946d6ea328a28a83a428a28a00746864915075638ade1c0c567e9d6e47ef9c7fbbfe357a4912242ce70056b05657386bcb9a56452d4a0c81328e9c3567558babb79ce07ca9e9ebf5aaf59c9a6f43a69294636905145148d428a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a6b6b76b87c0e14753e945b5bb5c3e070a3a9f4ad88e35890220c015718dcc2ad5e4d16e11c6b1204418029d4515b1c0ddc28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00a7796625cc918c3f71eb596410707835d0554bcb31302f1f127f3ace50bea8e9a35adeec8caa282082411823b51591d8145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a7c2713467d187f3a651409ea6bea2bbad49f420d32c2dbcb4f31c7cedd3d85598d84d0ab100861c8a7d6f64ddcf3b9da8f20514515466150dd4e2de22dfc4785152bb0452cc700726b16e6733ca58f4e807a0a894ac8da8d3e77aec46cc598b31c93c93562cae8c2e158feecf5f6f7aad45629d9dcee94549599d05150d9b97b58c9eb8c7e553574ad4f31ab3b0515135cc284867008ec6abcda8a28c440b1f53c0a4e49151a7296c89af2e04111c1f9db803fad6353a491a572ce724d36b094aeceea54f9112dbc2679820e9d49f415b600500018038155ac20f2a1dcc3e67e4fb0ab35ac1591c95a7cd2b2d901008c119154ae34f57cb45f29f4ed5768aa693dcce337177460c913c4db5d4834dad6bbb8817f7722ef3dc0ed59d22c441789c8ff0065bad6328db63be9d4725aa22a28a2a4d428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029f14b244d98d88a651409abee6941a8a9e261b4ff007874abaacaebb94823d456053e395e26ca315356a6fa9cf3c3a7f09bb455087520789971fed0aba92248bb91830f6ad5493d8e594251dc7514514c80a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280192431ca3f791ab7d4554934a81f942c87d8e455ea28031e4d2665ff56cae3f235524b69e2fbf1301eb8e2ba3a280397a2ba492da197efc4a4fae39aab2695037dc2c87eb91408c5a2b464d2251feae456faf155a4b2b98fac4c7fdde7f950057a294820e0820fbd25300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a29e90cb27dc8d9be82acc7a65cbf55541fed1a00a7456ac7a38ff00969293eca2ad47a7db47ff002cf71f5639a4060aab39c2a963e8066acc7a75cc9fc1b47ab1c56eaaaa0c2a851e806296803323d20759653f45156e2b1b68ba4609f56e6ac5140c0000600c0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a826bc861e376e6f45a4dd86a2e4ec89ea19aea287866cb7f7475ace9afa59780762fa0ff1aad59ba9d8e9861ff98b53dfcb2e42fc8bedd7f3aab45159b6dee75462a2ac828a28a0a0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a0024800649a2b4b4fb5daa2671f31fba3d0538abb339cd415d8fb3b31080ee3321fd29f79722dd303973d07a7bd58240049e82b0a794cd2b39efd3d856927caac8e5a717565790d662ec598924f526928a2b23b428a28a061474e9451400514514013b2ed0b710f033c81fc27fc2b4edae16e23dc3861f785665a48124d8fcc727cac294efb2ba38e40fd455c5db539aa439bddebd0d8a29b148b2c61d0e41a756c713560a82eed85c47c70e3a1a9e8a4d5c716e2ee8c06055882304751495a77f6be60f3507cc3a8f5159aaacec154124f402b071b33d1854538dc4abf69639c3cc38ecbfe3535a592c587930cff00a0a5babd5872898693f4156a296acc6755cdf2c092e2e12dd39ebd94564cf3bcefb9cfd07614c776762cc4927b9a4a994ae694e9287a851451526c1451450014514500145145001451450014514500145145001535b5b35c3f1c28ea696d6d5ae1bd107535af1a2c68150600ab8c6fab39ead6e5d16e11c6b1204418029d4515b1c2ddc28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00ab7768271b978907eb594ca558ab0c11d41adfaaf756ab70b91c38e86b3942faa3a2956e5d25b18f4539d1a372ae304536b23b428a28a06145145001451450014514500145145001451450014514500686993f06163eeb5a1580ac518329c11c8ad9b6b85b88f70e187de1e95ac25d0e2af4ecf9913514555beb9f253629f9dbf4156dd95cc2317276456d42e7cc6f290fcabd7dcd52a28ae76eeee7a308a8ab20a28a9ed2033cc011f20e5a84ae3935157669d9a14b58c1eb8cfe753514574ad0f31bbbb905ddb2dc47e8e3a1ac62082411823ad741595a947b2e030e8e33f8d6751753a70f3d795952acd8c1e74d923e45e4d560092001926b6eda1104213bf527dea20aecdab4f963a6e4b451456e79e151dc4a21859cf6e83d4d495937f3f9b36c53f2a71f53532764694a1cf2b15998b31663924e4d25145607a2145145030a28a2800a28a9edad5ee0e47ca9dd8d095c97251576415325a4efc88cfe3c56ac36d1423e45e7fbc7ad2cd711c032edcf603ad68a1dce67886dda08cc36171fdc07f1150c90c917df461ef8ab8fa9b67f7718c7fb469835297a32211e98352d44d232abd514e8a96678a40192328ddc678a8aa4d93ba0a28a28185145140051451400514514005391da36dc8c54fb5368a045f875261c4cb9f71d6af4534730ca303eddeb0a8048390483ea2ad4da309d08bdb43a0a2b2a1d4254e1fe71efd6af43790cbc06dade8dc568a499cd3a52893d145154641451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145002322b8c3a861ee3355df4fb67eb1007fd938ab34500673e9119fb9232fd466a07d2661f71d1bf4ad8a28039f7b0b94eb113f4e6a16474387565fa8c574d475a0472f45746f6d03fde890ffc06a16d36d5ba215fa1340185456bb69119fb92b8fa8cd44da4483ee4aa7ea314019b455c6d2ee57a056fa3546d6572bd616fc39a00af453da1953ef46e3eaa6994c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a294296e809fa0a004a2a55b69dba4327fdf26a55d3ae9bfe5963ea450055a2afae9339fbcc8bf8d4aba3ff7a6fc9690197456d2e956e3a976fa9a992c6d93a42a7ebcff003a00e7ea54b69dfeec4e47ae2ba158d13ee22afd0629d401869a65cb75555fa9ff000a9d3473fc7301eca2b568a06524d2edd7ef6e7fa9ff000ab096d047f72241ef8e6a5a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a29af224632ec147bd539b5251c44bb8fa9e949b4b72e3094b645e240193d2aacd7f147c2fcededd3f3acd9679663f3b923d3b54759ba9d8e9861d7da279af269b82db57d16a0a28acdbb9d0a2a2ac828a28a0a0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a961b79273f22f1ea7a5026d2d5915153cab14398c7ef1fa16ec3e95050d5849df52c5941e7cdc8f957935b155ac22f2ed81eefc9ab35bc1591c35a7cd220bd6db69211e98ac6ad8bf19b47fc3f9d63d6753737c37c2c28a28a83a428a28a0028a28a0028a28a002af4e3ed162937f1a706a8d6869b8786588f4ff1aa8eba18d5d129762bd9dc9824c1fb8dd47a7bd6c0208041c83580415241ea38abb6175b488643f29fba7d2aa12b68ccebd2bfbc8d2a28a2b538c2a348638999d5402dc934f7758d4b39000ef5957578d365532b1ff3a99348d69c253d16c4d777fd5213f56ff0acfa28ac5b6cee841415905145148b0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800ab36968d3b64f118ea7d696d2cccc77bf11ff003ad6550aa154600e8055c617d59cd56b72e91dc4455450aa3007414b4515b1c4145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450043736c970983c30e8d5912c4f0b947183fceb76a39e049d36b8fa1f4a8946e6f4ab3868f630e8a96781e07dae38ec7d6a2ac4ee4d3574145145030a28a2800a28a2800a28a2800a28a2800a28a2800a7c32b4320743cff003a651409abe8cdbb79d274dcbd7b8f4aad7762d2399236c93d41acf8e4689c321c115ab6d7893e15be57f4f5fa56a9a968ce4942549f3436329e278ce1d0afd4536ba0a40a074007e14bd98d627ba3220b29652091b17d4d6ac3124318441c7f3a7d15718a46352aca7b8514515464159faaf48bd79fe95a1599784dc5e2c49ce38ff1a89ec6d417bf7ec2e9b06e732b0e1781f5ad2a6c71ac51aa2f4029d4e2ac88a93e795c28a28240193d0551057bd9fc984e0fcedc0ac7a9aea633cc5bf8470bf4a86b093bb3d1a50e48851451526a1451450014514e8d0c922a2f526816c4d676c6e1f2dc20ea7d7dab5d542a8551803a0149146b146117a0fd69b3c8d1c44a2966ec00cd6f15ca8f3ea4dd4968437976201b13990fe9594cc5d8b31249ee6964126e2640c09eb914dac6526ceca74d41681451452350a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802686ea687856c8f43c8abb16a31b7122943ea3915994535268ca54a32dd1be8eae328c187a834b5808ec8728c54fb1ab916a322f1200e3d7a1ad1545d4e7961e4be134e8a822bc865e8fb4fa37153d5a7739dc5adc28a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a46456fbca0fd452d1401135b40dd618ff00ef914c3616a7ac23f024558a280299d32d8f4561f46a69d26dcf46907e23fc2af514019c7488fb4ac3ea29a7471da7ff00c77ffaf5a74500649d1dfb4cbff7cd21d225ed227eb5af450063ff00644ffdf8ff0033fe149fd9371fde8ff33fe15b3450062ff655c7aa7e749fd9573fec7e75b74500627f65dcff00b1f9d1fd9573fec7e75b7450062ff64dc7ac7f9d2ff64cff00df8ff33fe15b3450063ff644dff3d23fd694691277957f2ad7a28032c68e7bce3fef9ffebd3868ebde63ff007cd69514019e34887bc8e7e98a78d2adc7f7cfd4d5da2802a8d3ad47fcb3cfd58d3d6ced97a429f88cd4f45003161897eec683e8a29f45140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514535e448c65d828f73406e3a8aa52ea48bc46a58fa9e055296ee697ef3e07a0e05439a46f1a1296fa1a92ddc30f0cf93e839354a5d4646e230107af5354a8acdcdb3a234231df5159d9ce598b1f526928a2a4d828a28a061451450014514500145145001451450014514500145145001451450014514e8e3791b6a2963ed40b61b4f8a19266c46a4ff004abd069c061a639ff6455e555450aa0003b0ab507d4e79e212d2253834f44c194ef3e9daae8000c01803b0a28ad524b63925394b7301c10ec1bae79a11773aafa9c55cd4a0db2095470dc1fad56b6ff8f98bfde158356763d08cef0e646e00000074145145741e68d953cc8993fbc31582410483d45741593a843e5cfbc0f95f9fc6b3a8ba9d387959b89568a28ac8ed0a28a2800a28a2800a28a2800abfa57df93e82a8569e969889dffbc71f95543731aeed0650b918b9907fb46a3a7ccdba791bd58d32a5ee691d91af6131960c372ca719f5a9679d204dce79ec3b9aa314a2ca0208ccafcedf4fad53924695cb39c935a73d91caa8f349be83ee2e1ee1b2c7007451daa2a28acef73ad2495905145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a002aed9d9193124a309d87ad3ecec7a4930fa29feb5a15a461d59c956b7d9880000c0e0514515a9c8145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145003648d25428e320d645cdabdbb7aa1e8d5b348ca1d4ab0041ea0d4ca3735a755c1f9181455bbbb330e5d3263fe5552b06ac77c64a4ae828a28a0a0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802e5bea0f1e165f9d7d7b8ad18a68e6194607dbbd6150095390483ea2ad4da309d08cb55a1d0515911dfce9c121c7fb55617535fe2888fa1ab534733a1345fa2a91d4e3ed1b5412ea32b8c20083f33439a05426fa16ef2e840a554e643d3daa2d361f95a66eadc0acd249392724d6ec29b2145f402945f33b9a548aa70e55d47d14515a1ca154b519f62794a796ebf4ab72388e3676e8066b0e590cb233b7526a26ecac6f421cceefa0da28a2b13bc28a28a0028a28a002b4b4d836a999872dc2fd2a95b426798276ea4fb56d8014000600e95a4175397113b2e541514b7114270ee01f4eb4f91b646cff00dd04d61331762cc724f24d54a5631a54b9f73652e209be50ea73d8d4735845272a3637b74fcab26ac437b345c6772fa354f3a7b9b3a328eb0624d672c3c95dcbeab5056ec12f9d107da573d8d47359c3372576b7aad0e1d851c459da68c6a2ad4d612c7cafcebedd7f2aaa460e0f5acda6b73a63252d828a28a0a0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a962b8962fb8e71e87915151409a4f73462d4874953f15ab71cf14bf71c13e9deb0e8ab5368c25878bdb43a0a2b1a2bc9e2e8f91e8dcd5b8f5253c48847b8e6ad4d3309509adb52f514c8e78a5fb8e0fb77a7d598b4d6e145145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a090a324803d4d001455692fa08fa36f3fecd54935191b88d420f5ea6a5cd2358d19cba1a8485196200f535565bf8538525cfb565bc8f21cbb163ee69b50ea76378e197da65b975099f85c20f6eb55598b1cb124fa9a4a2b36dbdce88c231d90514514141451450014514500145145001451450014514500145145001451450014514500145145001451450015279f2050aadb14765e3351d1409a4f72d5bdec91b80ec590f5cf38ad6072323a573f5a9a74fbe2f2c9f993a7d2b484ba3396bd356e645ca28a2b539064d189a2643dc5632662b85ddc14619fceb72b3b5283044ca3af0d59cd753a284ecf95f53468a8ad64f36dd1bbe307eb52d688c1ab3b054771089e2287af63e86a4a2804da77460329462ac30470692b56fad7ce5f3107ce3b7ad6574ae7946ccf469d453570a28a291a05145140051451400aaa5982a8c92702b5db1696581d5571f8d43616a53f7d20e4fdd1e9516a33ef71129f957afd6b45eeab9cb37ed26a2b6452a0120820e08a28accea0249392724d145140051451400514514005145140051451400514514005145140051453a34691c2a0c9340b61a0162001927b56a5a5908b0f272fd87a5496b68b00c9f99fd7d3e9562b58c2dab38ead6be910a28a2b439828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a003ad675dd8e3324238eebfe15a34526932e137077473f456addd90972f1e03f71d8d65b29562ac0823a83584a2d1df0a8a6b4128a28a468145145001451450014514500145145001451450014514500145145001451450015d003900d73f5b56927996c87b8183f85694ce5c4ad1326a28a2b538ccfd4e5fbb10fa9acfa9af1b75d487d0e2a1ae793bb3d2a51e58241451452340a28a2800a28ab363079d36e61f22727de84aeec4ca4a2aecbd6307930e48f9db93ed561dc22176380064d2d676a53e48854f4e5ab77eea38229d598e82f9642e93e006ce0f6c7a554b8b6784e7ef27661d2a1a32718ac5caeb53b634f95de215241119a6541dfafd2a3ad3d361d919948e5ba7d288abb0a93e48dcbaa02a8503007028a28ae83cd0a8e5822987ce809f5ef52550d42e4a9f250e3fbc47f2a52692d4ba7172959114d6712b111ce99feeb1aaae8d1b6d6c67d8e69b53c31c73e101292638cf21bfc2b0df63bd5e2b57720a2a49ade484fcea40f5ed51d22d34f54145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a9a3bb9e3e8e48f43cd434517b12d27b9a31ea63a491fe2b5663ba864fbb20cfa1e2b168ab536632c3c1eda1d0515871cf2c7f71d87b678ab31ea522fdf556fa706a9544632c3c96c69d15563d4216fbd943ee2ac248920ca306fa1ab4d33194251dd0ea28a2992145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145150c975047f7a419f41cd17b0d26f626a2a849a9a8ff57193eec7155a4be9dff8b68f45e2a1cd1ac684d9aeee8832ec147b9aad26a10a7ddcb9f6aca24b1c9249f7a4a8751f4378e1a2b765c935195bee0083f33555e4790e5d8b1f734da2a5b6f7368c231d905145148b0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a9adad9ae1f03851d4d095c96d257644aa58e14127d05594b09dfa80bf535a0a20b55c6557ea7934d37d6e3fe5a7e86b4504b76733ad37f022b0d31bbca3f2a0e98dda51f955a17b6e7fe5a0fc41152a488ff71d5be86ab96266ead55b998da74ebd36b7d0d57921963fbe8c3df15bb45274d0d6224b739fa2b6a4b4864ea801f51c554934c3d627cfb354b8346f1af07be850a2a592de68befa1c7a8e4545506c9a7b05145140c2a482530ccae3b75f7151d1409abab33a05219430390464515474d9f721898f2bc8fa55eae84eeae79938f2cac14d910491b23742314ea2993b19d64e60b86b7938c9e3eb5a354352878132f51c1a9acee44e9b58fef075f7f7a88bb3e537a8b9973af99668a28ab300aa9776426cba615ff4356e8a4d5f72a327177460ba346db5d4a9f7a6d6f491a4ab8750c3deaa3e9b19fb8ecbf5e6b274df43ae3888bf88cca2afff006637fcf51f95489a6c63efbb37d38a5c8cb75e0ba99aaacec154124f615a36963b0879b05bb2fa55b48a3857e450a3b9aa7757e06520ebddbfc2ab95475664ea4aa7bb024bdbb11298e33f39ea7d2b2a8249393c9a2a252b9bd3a6a0ac828a28a4681451450014514500145145001451450014514500145145001451562d6d1ee0e7eea0ea684ae4ca4a2aec8e081e77da83ea7b0ad7b7b74b74c2f24f53eb4f8e348902a0c014eada31b1c356ab9e8b60a28a2acc428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002a0b9b54b85e7871d1aa7a293571a6e2ee8c2962785f6b8c1fe74cadd96249936b8c8fe5593736af6e73f793b35632858eea5594f47b9051451526e1451450014514500145145001451450014514500145145001451450015734e9fcb90c6c7e57e9f5aa74509d9dc994549599d051552caec4aa2390fce3a1f5ab75d09dcf365171766625d0db75203fde26a2abda9c2438940e0f07eb546b092b33d0a72e68a61451452340a28a280000b1000c93c0adbb68441084efd49f7aa7a6dbe5bce61c0e16b46b5847a9c5889ddf2a23b894410b39fc07a9ac4662cc598e49393566fe7f366d8a7e54e3ea6aad44ddd9b50872c6ef7614514549b925bc466995077ebf4adc0028000c01c0aa7a743b223211cbf4fa55cada0ac8e0af3e695bb051451566032690451339ec2b0d98bb1663924e4d5dd4a6dce220785e4fd6a8d63377763ba8439637ee14e8b3e6a6debb8629b5734d877ca642384e9f5a94aecd672518b6cd4201182322a9cda7c6fcc7f237a76ab9456ed27b9e7466e3b18935bcb09f9d78f51d2a2ae808c8c1e95527b08a4c94f91bdba566e9f63aa1884f49195454b35b4b0fde5caff0078722a2aced63a534f54145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a0120e41c5145004e9773c7d24247a1e6ac26a6c3fd6460fb838aa14535268cdd284b746ba5fc0fd58a9f7153a488ff0071d5be86b068e9d2a954664f0d1e8ce828ac44ba9d3eec8df8f3561352947df556fd2ad54464f0f25b1a745534d4a23f79597f5a992ee07e922fe3c55292664e9cd6e89a8a0104641047b514c80a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a298f2c69f79d47d4d42f7f02f462df4149b48a5093d91668acf7d4ff00b91fe24d40f7f3b7460bf4152e68d5509b35fa544f75027de917f0e6b19e477fbeecdf534da9753b1a2c32eacd37d4a31f7119bebc5577d4266fbbb53e82aa5152e6d9b2a305d07bcb249f7dd9bea699451526895828a28a0614514500145145001451450014514500145145001451450014514500145145001451450014514500156e4baf2e310db9c28eaddc9aa94e8e3795b6a2963ed426fa1128a7ab1a492724e4d15a96d60b1e1e5c337a761557508bcbb8dc3eebf3f8f7aa71695c98d58ca5ca8ab4514549a934775347f76438f43cd5fb3bc33b14700363231deb2a9d1b98e4575ea0e6a949a329d28c96da9bd4536371246aebd08cd3ab73ced82a292d6197ef20cfa8e2a5a28b5c69b5b19f2699de27fc1aaac96b345f790e3d4735b5454382368e224b7d4e7e8adc92de297efa027d7a1aa926983ac4f8f66a87066f1c445efa146290c52abaf506b711c3a065e846456349693c7d5091ea39ab5a6cdd616faad383b3b326bc54e3cd1e868514515a9c62328752ac3208c1ac5757b69c8048653c1adbaa5a941be312a8e57afd2a26aeae6f4276959ecc7dadea4a02be15ff004356ab9fab10decd171bb72fa354aa9dcd2787eb13628aa29a9a1fbe8c3e9cd4a350b7fef1fcaaf99183a535d0b345543a8c03a6e3f4150bea67fe59c607bb1a3990d519be868d579ef628b8077b7a0acc96e669787738f41c0a8aa1d4ec6d0c37f3134f7524e7e6385fee8e950d14566ddcea492564145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a29554b300a0927a015a5696223c3cb82dd87614d45b339d4505a90da5897c3ca30bd87735a60050001803b0a28add452382751cddd8514514c80a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a080c0820107b1a28a00cdbab0299784657baf71546ba0aa97562b2e5e3c2bfe86b2943aa3aa957e9232a8a5746462ac0823b1a4acceb0a28a28185145140051451400514514005145140051451400514514000241c83822b4ad6fc36126383d9bd7eb59b4534da2270535666fb2ac885586548ac9b9b3780965cb27afa7d69b6f77241c03b97fba6b461bc866e33b5bd1ab4ba91cca33a2f4d518f456c4b6504873b769f55e2a1fecc4cffac6c7d2a7919a2c441ee66d59b5b369c866cac7ebeb57a3b182339da58ffb55669aa7dc89e234b444550aa154600e82ab5f5cf931ed53f3b74f61eb4b73789082ab867f4f4fad64bbb48e598e49ef4e52b6889a549c9f34b6128a28ac8ed0a92de2334ca9dbbfd2a3ad5d3a1d9179847ccffca9c55d99559f246e5b000000e00a28a2ba0f3829934821899cf614facdd4a6dce220785e4fd6a64ec8d29c39e5629331662cc7249c9a4a28ac0f440024803926b72de210c2a9dfbfd6b3f4e877cde611f2a7f3ad4ad69aea72622777ca1451456872874159b32dcdd39daac23ec0f15767b88e00379393d00aa8da99fe08bf335126b66cde9467bc50c5b0b950407550782371e698da7ce3a056fa1a906a6fde35fcea68750591d50c641271c1cd4da0cd5cab2d6c673c12c7f7e3603d714cae82a096d2197aa60faaf143a7d851c4ff003231a8abb2e9d22f31b061e8783551d1e338752a7dc5434d6e74467196cc6d145148b0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28014315395241f6a956ee74e9293f5e6a1a28bd89714f745c5d4a51f7955bf4a997534fe28c8fa1cd66d155cec87460fa1aeb7f6edd58afd454ab3c2df76443f8d61d14fda3337868f46741d7a515801997ee923e86a45ba9d7a4adf89cd57b421e19f466dd1592ba85c0ea55bea2a45d4dff008a353f438a7ce8878799a545515d4d3f8a323e8734f1a8c07aee1f514f9910e94d742dd1500bdb73ff002d07e20d3c5c427a4a9f9d3ba25c24ba1251481d4f4607e86969921451450014514500145145001451450014514500145145001451450014514500145145001451450014514120753400514d32c63ac883ea45466ea01d655fc39a5743516f644d455637f6e3a313f4069875288744734b9916a94df42e5159eda9ff00762fcdaa36d4a63d1507e14b9d14a84d9a94563b5edc37fcb4c7d00a89a695bef48c7ea697b445ac34bab3719d57ef301f535135ddbaf5941fa7358b452f68cb5865d59aada8c23ee866fc2a16d4dbf82303ea735428a9e7668a841742cb5fdc37460bf4150bcd2bfde918fe34ca2a6ed96a115b20a28a282c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a2a786d269b90bb57d5a84ae4b925ab20a92282498fc884fbf6ad2874f8a3e5fe73efd2ad0000c01815a2a7dce79e212f84a30e9aa3995b71f41d2ad8f2a04c7ca8bf9539c128c14e188e0fa561485cb9f3092dd0e69b6a1b233829567ab3645cc04e3cd5fce997b109ad895e4afcc2b1ea7b6b9781bae53bad2e7be8cd3d872eb1641454b7281253b7ee37ccbf4a8ab33a53bab85145140cbfa6cf826163d795ad1ac05628c194e083915b90c826895c7715ac1e9638b110b3e643e8a28ad0e62bde798b1799131057a8f5155a3d498712203eeb5a246460f4ac4ba87c89caf6ea3e959ceeb5474d1519ae5923523bc824e8e01f46e2a7ae7e9f1cd2c5f71c8f6ed4954ee54b0dfcacdda69891983151b8743deb3e3d49c712206f71c55a8ef6093f8f69f46e2ad4933174a712c51403919145519050402082320f5a28a00c3b884c133276edf4a8eb5afe032c419465d7d3b8ac9208382306b9e4accf4694f9e21451452350a28a2800a28a5446760a80927b0a0425145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0029f0c2f33ed419f53d854d6d66f39dc7e54f5f5fa56ac5124481506055c61730a9594745b915b5aa5b8e3973d5aa7a28ad52b1c2db93bb0a28a298828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a008a7b749d70c39ec4751593716ef03618647661d0d6dd232aba9560083d8d4ca299b53aae1a743028abb7560d1e5e2cb2fa77154ab069adced8cd495d051451416145145001451450014514500145145001451450014514500145145004b1dccd17dc9081e879153aea528fbca86a9d14d49a21d38bdd178ea72768d6a096f279060be07a2f1505143936254e0b641451452340a28a28025b684cf32a76ea7e95b6000303a0aa9a743e5c3bc8f99ff00955bada0ac8f3ebcf9a56ec1451455988c9e510c2ce7b74fad61b31662c4e49393573529b748220785ebf5aa558cddd9dd421cb1bf70a00c9c0a2ade9f0f9936f23e54e7f1a84aeec6d2972abb342da1f26054efd4fd6a5a28ae9d8f31bbbbb0a28aaba84de5c1b41f99f8fc29376571c63ccec8cfba9bce9d9bb741f4a868a2b9dea7a6924ac82aee9916e95a43d14607d6a956d59c5e55b283d4f26aa0aecc6bcb9616ee4d451456e700535823e5582b7a83cd38900127a0ac3965679da404824f18a994ac6b4a9b99a32e9d13f284a1fcc5529aca68b9dbb97d569d15fcc9c31de3dfad68c1711ceb943c8ea0f515168c8d9caad3df5462515b33da4537246d6fef0accb8b69203f30caf661d2a65168d615633f521a28a2a4d828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00294330e8c47d0d251408789e51d2571ff000234f17538ff0096ad50d145d8b95762c0bdb81ff2d3f414a2fee3fbc0fe155a8a7ccc5ece1d8b63519ffd83f852ff00694dfdd4fc8ff8d53a28e662f650ec5dfed393fb89fad2ff0069bffcf35fcea8d1473317b18762f7f69bff00cf31f9d2ff0069b7fcf21f9d50a29f3b0f630ec5ff00ed36ff009e43f3a3fb4dbfe790fcea851473b0f630ec5efed37ff9e6bf9d1fda727fcf35aa3451cec3d8c3b177fb4a5ec89fad27f694de89f9553a297331fb28762d1d427f551f8521bfb83fc607fc04556a28e661ece1d89cde5c1ff96a69a6e673ff002d5ff3a8a8a57657247b0e32c87abb1fc69a4e7ad14503b05145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a295559ce14127d00a0425156e2d3e67e5b083dfad5b8b4f85396cb9f7e954a0d994ab42265a2339c22963ec2878cc6db5f83df0735a17f2f928b14402eee4e38e2b369356d0a849c95cb31dc430b6520ddfed31e6b46dee52e14ede08ea0d62d4b6d2f933abf6e87e94e32b11528a92badcdba28a2b73802b2b518764dbc747fe75ab50ddc5e75bb28fbc391f5a992ba35a53e595cc5a28a2b03d11c5cb22a9e8b9c5368a281135ca01b245185917381d8f7a86b525b72da7aa63e7419fc6b2e9c958ce94f997a055dd367d921898f0dd3eb54a80482083823a509d9dca9c79a363a0a2a3b7984f0abf7eff005a92ba0f35ab3b30aab7f079b0ee03e64e7f0ab54526aeac38c9c5dd1cfd153de43e4ce401f2b722a0ae76ac7a516a4ae828a28a0a1f1cb2447e472bf4356a3d4a45e2450c3d4706a9514d368894232dd1b11df412756da7d1aac0208c8391ed5cfd392478ce518afd0d5aa9dcc25865f659bd4d9228e418740df5159b1ea32af0ea1c7e46ad477f03fde250fb8ab524cc1d29c4649a6c6dcc6c57d8f22abbe9d3afdddadf435a6b2c6ff71d5be869d4b9131aad38ee629b59c7589bf019a05ace7a44df88c56d54724f147f7e451ed9e697b3468b1127b233e2d3a46ff58420fccd3ee1e3b48cc30fdf6fbcddc5171a8960561181fde3d6a8139393d6a5b4b6348c672d67f7051451507405145140051451400514514005145140051453e285e67da8327f95026edab18012703935a16b61d1e71f45ff001ab16d68900cfde7f5ff000ab15ac61dce3a95efa4400c0c0e9451456873051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400555b9b15972c9857fd0d5aa29349ee5464e2ee8c192368d8aba904536b76685265dae33e87b8acab9b4780e7ef27a8feb58ca0d1db4eb29e8f72bd1451526e1451450014514500145145001451450014514500145145001451450014514500145145001535ac267982ff0f56fa53e37b691bf7d1ec3eabd3f2ad3812248ff007206d3dc77ab8c6e73d5aae2ad6240303028a28ad8e10a8e794430b39edd3eb52565ea536f94460f09d7eb532764694a1cf2b15092c492724f26928a2b03d10adab587c98157f88f27eb59fa7c3e6cfb88f9539fc7b56b56b4d75393113fb2828a28ad0e50ac5bb9bce9d987dd1c0fa568dfcde540403f33f02b22b2a8fa1d78787da61451456675935ac5e6dc2af6ce4fd2b6aa8e991611a53df81f4abd5b41591c15e5795bb051451566056d425f2edca8eafc56455ad425f32e368e89c7e3556b09bbb3d0a31e58053a391a270e87045368a9356ae6ec3209a2575ee29cca194ab0041ea0d51d2df2ae9e8722afd7445dd1e6d48f2c9a326f2d0c077a7319fd2aad6fb28652ac320f51593259482e0c68323a827d2b2946db1d546b5d5a456a2b4934c5c7cf2127fd9e294e9b176771f5c52e4657b781994e40ace03b6d5ee719c55c7d31c7dc753f5e2abbda4e9d6327e9cd2e568b55232d993c6963d1a4663ef91564595ac8b94191ea1b359241070460d3a391e26dc8c54fb53525d5112a727aa932f4ba6f789ff06aa5244f136d7520d69dadeacd847c2bfe86ac491a4a9b5d41157ca9aba32556707699834558bab46b7391ca1e87d2abd64d58ea8c9495d05145141414514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001524716f1932222e7b9fe951d14099a56f676cc33e679a47be2aea22a0c22851ec2b0a391a370e870456e46e248d5c74619ad60d338abc64b7771d451456873943548f84907d0d6756e5cc7e6dbba77c71f5ac3ac66b53bb0f2bc6dd828a28a83a0d7b09bcdb700fde4e0ff4ab358f6337957033f75b835b15bc1dd1e7d6872c828a28aa3131ef62f2ae0e3eeb722abd6c5ec067886d19753c5410e9a3accd9ff656b17077d0ee8568f27bc67aab3b615493e82b42d2c4ab0926ea3a2d5b022b74fe145aad2ea48a711a96f73c535151dc87527534822ed635e45e4dc301f74f22ac2ea6d9f9a318f634eba64bab6f3633f32751dc0a726a4b41538ca9cb5d999d45145647616f4f9fcb9b613f2bff003ad5ac5b8408b0ba8c06407f1ad4b49bcf8031fbc386fad6b07d0e2af1bfbe89a8a28ad0e62bdec1e740703e65e4563d7415937d6e6294b28f91b9fa1acaa2ea7561e7f659568a28208383c1accec0a28a2800a28a2800a28a2800a70771d1987e34da2810e2ee7ab31fa9a6d14500145145030a28a2800a28a2800a28a2800a28a2800a295559d82a8249ec2b4adac1530f3619bfbbd853516cce752305a95adac9e6c337ca9ebdcd6a471a449b517029d456d18a470d4a8e7b8514515466145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500141e460d1450051b9d3c365a1e0ff77b567329562ac0823b1adfa8a7b78e75c30e7b30ea2b3942fb1d34ebb5a48c4a2a6b8b59203c8caf66150d64d58eb4d35741451450505145140051451400514514005145140051451400514514005145140053e296489b31b114ca281357dcd2835156e261b4fa8e95755830054820f715814f8a6921398d88f6ec6ad4fb9cf3c3a7ac4da99fcb85dffba09ac22492493926b4a3be8e5431ce36ee18c8e9546585a23cf2a7a30e8689bbec1423c974f723a28ab3610f9b38247ca9c9a84aeec6f2928abb346d21f26000fde3c9a9a8a2ba52b1e636dbbb0a28aaf7d379501c1f99b8149bb0462e4ec8cebc9bce9c907e55e05414515ceddcf4e2945590528059801d4f0292ad69d16fb8dc7a273f8d095dd8252e54d9a91208a2541fc2314ea28ae93cb6ee14d9641144ce7b0a7551d4e5c22c43bf26949d95cba71e6924669258927a9e68a28ae73d20a28a2819774bff005cff00eed69d67694bf348dec0568d6d0d8f3ebfc6c28a2823208f5ab31332e2fe42e44476a8ef8e4d44b7b70a7fd667ea0540c0ab107a8383495cfcccf49538256b17d35361f7e307e87157a1944d10700807d6b0872715bd1279712a7f7462b4836f739abc2314ac2b22b8c32861ee33503d95bbff00060fb1c558a2ada4cc149ad9945b4c5ea9230fa8cd5b883aa05958337623bd13ca21899cf6ac569a4697cc2c7703907d2a1b51d8da319d55ab371943a9561907a8ac7bbb636f271ca1e86b52da713c41875e847bd3a689668ca377efe94e4b99134e6e9caccc2a29d223472146ea0d36b13bf70a28a28185145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514e8e3790e114935663d3e57e599547d734d26c894e31dd9528ad44d3625fbeccdfa5584b7863fbb1a8f7c552a6cc9e222b631d20964fb91b1f7c54e9a74a465d9507d735ab55b5062b6a71dc806ab912573355e52765a19b288541546676fef7415151456475a560a28a28185145140056a69b26e80a1ea87f4acbab36127977201e8dc5541d999568f3419af451456e79c158b771f9572ebd89c8adaaa1aa479549076e0d44d5d1bd095a76ee6751451589de15b56b2f9d02b77e87eb58b5734d9b64c633d1fa7d6aa0eccc2bc39a37ec6a514515b9c01546f2f648a431a285c7f11e6af552d4e1dd1894755e0fd2a657b686b4b979ad2339dda46cbb163ef4da28ac0f4029f0c862903751d08f514ca2806aeac2b6371db9c678cd2514e8d0c922a0eac71406c5db98ffe25f0b77503f5a86c67f2a7c13f2bf06b4e68c3dbb4607f0e0561d5cb4699cf49a9c5a67414543692192d919bae306a4791235dcec147bd6b7d2e71b4d3b0ea64d2451a7ef48c1ec7bd519f51272b08c7fb46a8b333b6e62493dcd439ae874430edeb2d0b12dd206fdc44b1ff00b58e7ffad558924924e49ee68a2b26ee75c62a3b0514514141451450014514500145145001451450014514500145145001451450014514aaa5880a0927b0a04254f6f6b24e72384fef1ab56da7e30d3f3fecff008d5f000180300569187739aa574b4891c16f1c0b841cf727a9a928a2b5391b6ddd85145140828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a000804608c83542e74f072d0707fba7fa55fa29349ee5c26e0ee8c0652ac558104763495b73dbc73ae1c73d88ea2b2ee2d2480e7ef27f78563283476d3ad19e9d4828a28a9360a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a72b608cfccb9ced27834da281172086d676c6e746fee93fc8d694512449b5060560d5eb4be2b8498e57b37a569192ea7356a726b46695140208c8391456a718563decde74e707e55e0568decde4db923ef3702b1ab2a8fa1d78787da0a28a2b33ac2b5f4f8bcbb604f57e6b2e18ccb32a0ee6b74000003a0ad29aea72e265a288514515a9c61589752f9d70eddb381f4ad4bc97cab6623a9e056356551f43af0d1de41451456675851453910c8ea83a938a046a69c9b2d813d58e6ad52228440a3a01814b5d095958f3252e6936145148c42a963d00cd324ccb896de5662d1bab838cae39aa7413924fad15ccddcf5231e55626b34f32e90760727f0adaaced2d3e6793d060568d6d05a1c58895e760a28a2acc0a3aa3e1123f539359b566fdf7dd30ecbc556ae793bb3d1a51b41166c2464b950390dc115af595a6a6eb9cff0074135ab5ad3d8e6c45b9ca5a8dbef4f3547ccbd7dc566574158d7907913103ee372b5338f534c3d4bfbac828a28accea0a28a012a4107047228105156a1b90ce16e155d4ff00111c8ab8fa7c0dd032fd0d528df6329555076923268abefa61fe0901fa8a81ec6e17f8370f6349c5a295583ea57a29cc8e9f7d597ea29b48b0a28a28185145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051572dec1e401a43b17d3b9a9e516b66b8f2c33f6079354a2f7662eaabd96accca2a792f259015f9554f1802a0a9668afd428a28a0a0a28a2800a28a2800a28a2800a28a2800a295519ce154b1f6153a58ceff00c1b47fb46849b25c92dd95e8ad04d30ff1c9f828ab11d9411f3b771f56e6a941994abc16c65c36f24c7e4538f5ed4c60558a9ea0e2b7c0c0c0ac6be4d974fe879a728d90a956e7958828a28a83a029f14af0b8646c1fe74ca281357dcde8a412c4ae3f88669d5534d7dd6e57fba6add74277479938f2c9a0a8ae93ccb6917db22a5a29b12767739fa29f2a7972ba7a1c532b98f513b85145140c28a28a0028048208ea28a2811bd138922571fc4334eaa5a649ba268cf55391f4abb5d09dd5cf3671e5934151cf1f9b03a7a8e3eb52514c94ecee73f454f7b1f9772c3b1f985415ccd58f4e2eeae14aa4ab061c10722928a066ec320962571dc53eb3f4c979688fd456857445dd1e6d48f2c9a0a4750e855ba11834b45320c1910c7232375538a6d5fd4e2c32ca3bf06a8573c959d8f4e9cb9a2985145491412cc7e45247af6a453696ac8eb4b4fb6283cd71827ee8f414eb7b058c8690876f4ec2ad492244b9760a3deb58c6dab392ad6e6f7623ab1e4b66fb448a30141e58f000ab336a43a42b9ff69aa84923cac59db24d29c932a8d39c7565d6bd5862115b8ced18dc6a94923cadb9d8b1f7a6d150db66f18463b05145148b0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a295559d82a8249ec2b46db4f0b869b93fdded4d45b339d48c16a54b7b59273c0c2ff0078d6a416d1c03e5193dd8f5a94000600c0a2b68c5238aa5594fd028a28aa320a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a3ad1450052b8d3d5f2d1615bd3b1ace78da36daea54fbd6f532589265daea08fe5512827b1d14ebb8e92d4c2a2addc583c7968f2ebfa8aa958b4d6e76464a4ae828a28a0a0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802e595d98888e43f21e87d2b52b9fad1d3ee73885cf3fc27fa569097467257a5f6909aa2b6236fe119159f5bee8aea558641ea2b26eed1a03b87319e87d289c7a8e85456e5656a29d1a190e01507dce3353a58cecd82a147a9359a4d9d0e515bb26d2e2c9694f6e0568d32189618822f41fad3eba22ac8f3aa4b9a4d8514523b0442c7a01934c8337539774a231d1473f5aa54e91cc8ece7a939a6d73b77773d3847962905145148b0abda643973291c0e07d6aa43134d2045ea7f4adb8e358a3545e8055c15ddce7af3b2e55d47514515b1c2155efe4f2ed5bd5be51562b2b519bcc9b603c271f8d4cdd91ad18f34d1528a29554b3051d49c5607a06bd826cb55f56e6ac522a8550a3a018a5ae84ac8f324f99b6148cc154b1e806696abdfbecb56f56f9686ec822b99a464331672c7a939a4a28ae73d33474b4f9247f538abf55ec5365a27a9e6ac56f156479d55de6d854573009e12bdfa83ef52d154f521369dd1cf9054904608e0d157f52b7c1f39475e1bfc6a8573b56763d284d4e370a28a29160064803a9ae800c002b16d137dd463df3f956d56b4ce3c4bd520a28a2b43946cb22451977fba2b2a5b98ddbfe3dd31fafe9563547e234fa9359d594e5ad8eca14d72f3315882c4a8da3d339a4a2a786d259b955c2ff78d676b9d0da8ad4828ad48f4e897efb173f90ab0b6f0a7dd8d7f2ab54d98bc4456c61d15d00007400514fd9f991f59f239fa2b79a28dbef229fa8a89acaddbfe5981f438a3d9b1ac4aea8c6a2b49f4c43f72423ea3355a4b09d3a00e3fd9352e2d1ac6b41f52b514aca54e18107d0d2549a05145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a003a9c0ad4b3b3118124832fd87a547a7db7fcb671fee8feb57d9822966380064d6908f5671d6aadbe5890dd5c0b78f3d58fdd158ecc5d8b31c93d4d3ee2633ca5cf4ec3d054753295d9b52a7c8bcc28a2a686d659b955e3d4f02a6d7356d2d590d15a51e9aa3991c9f61c5594b5813a46bf8f356a0cc25888ad8c50a5ba027e94f16f31e913ff00df35b2d2c51f0ceabed9a8fedb6fff003d07e469f22eac9f6f27b44ccfb2cfff003c9a90db4e3fe593fe55ae9710b9c2c8a4fa66a4a7c88978892dd180c8cbf7948fa8a7c71071932220f73cd6e5646a0812e78000201e2a650b6a694eb73bb6c4f0d844e3779dbc7fb35692ce04e9183f5e6b2ade630ccac0f19e47a8adbaa859f431adcf17b80000c0000f6a28a2b439ca97b7525b9508170c3a9aa7f6fb8cfdf1f90ab7a9a66056fee9acbac66da676d18c5c2f63420d44e4099463fbc29ba9a8263907208c66a8d58573259bc6793190c3e9d29735d5994e9a8c94a257a28a2a4dc28a28a00bba63e2664fef0fe55a75896cfe5dc46defcd6dd6d4de870e215a570a28a2ace732b514db73bbfbc33552b4f544cc48ff00dd38fceb32b09ab33d1a2ef0414514549a8514514005145140162c64f2ee573d1be535b15cf8383915bb0c9e6c28fea2b5a6fa1c7898eaa43e8a28ad0e528ea71e635907f09c1acdadd9a3f36164f51584460e0f5ac6a2d6e7761e578dbb05145150740e8a43148ae3a839add560ea197a11915815a7a6cdba2319eabc8fa55d37ad8e6c442eb98bb451456c710c9a312c2c87b8aca8aca690fddda3d5ab62abcd7b0c5c67737a2d44927ab36a539ad2286c361147cbfcedefd3f2a965b88a0186603fd91d6b3a6bf964e14ec5f6ebf9d55eb53ce96c6ca8ca5acd9766d45db8886d1ea79354d999db2c493ea6928a86dbdcde308c7641451460e33838f5a4505145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a29f142f336d45cff4a04ddb5632acdbd9493618fca9ea7bd5cb7b048b0d27cedfa0ab75a461dce5a988e91238608e05c22fd4f735251456a72b6deac28a28a04145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500155ee2ce39f271b5fd4558a293571c64e2ee8c49eda480fce38ecc3a5455d01008c11907b1aa371a7ab65a13b4ff74f4ace50ec75c3109e923368a7491bc6db5d4a9f7a6d6674ee145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a0120820e08a28a00d9b4b813c5cfdf1d454ec030218641ea0d61c12b432875edd47a8ada8e459630ea720d6d095d1c15a9f23bad8ccbbb330e5e3e63fe550c5712c3f71ce3d0f22b6fad675dd8e3324238eebe9f4a9946daa34a7554bdd98e8b520789531eeb57239a394651c356150090720e0d2537d4b961e2f6d0e82ab5ff00986dcac6a5b279c7a5528afe68f863bc7bd5c8afe19386ca1f7e957cc9ab187b29c1ded7327a75a2b71e1867196556f71fe3559b4d8c9f95d87eb50e9be86f1c445efa1994f8a2799f6a2e4ff2ad14d362072cccdedd2ad24691aed450a3da854df514b1097c2476d6cb6e981cb1ea6a6a28ad92b1c6db6eec28a2a1b8b94b75e796ecb4376049b76425e5c0822e3efb741fd6b18f27269f2cad2c85dce49a6561295d9e852a7c882acd826fba5f45e6ab568e969f2bc9ea7029455d85595a0cbf45145741e705676a8ff3247e9c9ad1ac5bc7f32e9cf60703f0a89bd0df0f1bcee434019381454d689beea31ef9fcab14773765736517622a8ec314b4515d27941451552f2e0c12458e992587a8a4dd8a8c5c9d9169943a956190460d625c426094a1fc0fa8adb560ea194e4119155ef6dfce8b2a3e75e47bfb54ce3746b467c92b33228a28ac4ef2ee9899999bfbab5a754f4c4c40cdfde6ab95bc16879d59de6c28a28aa32327517dd7447f7401554024e00c934f99f7ccedea49ad0d3edb6a899c7cc7ee8f41585b999e8392a70570b5b00803cc32dd97b0abb4515b2496c70ca6e4eec28a2b3f50ba3930c67fde3fd286ec870839bb21f71a8042561018ff007bb5509279643f3c8c7db3c5474560e4d9df0a718ec15225c4b1fdd9187e351d148b693dcbf0ea447132e47a8abf1c8922ee4604560d4904ef03ee43f51eb5719b5b9cf52827ac4da78d2418750c3dc550bbb148e369236c01fc26af432acd1875e87f4a83526db6d8fef102b4924d5cc29b929a899345145607a014514500156235b576c169133dce3155e8a1325ab9a7fd991ffcf46a4fecc4ff009e8df954d60e5ed573db8ab15b28c5a386552716d5ca3fd98bff003d4fe549fd983fe7a9ff00be6afd239da8cc3b0cd3e488bdb54ee50fecbffa6dff008eff00f5e94698bde527e82a31a94bdd13f5a9e1d46372048361f5ea2a1721acbdba41fd9f0a292773103b9acbade90fee98ff00b26b0694d25b17879395ee0012401d4d4e2ce76e91fea2a0a012a720907d4542b1bbbf42c8b0b83fc207e229c34e9cff00707e34fb5bf208498e41e8de95a55a28c59cb3ab520ecccc1a6cbddd3f5a51a63f7917f2ad2a2ab9119fb7999e34bf59bff1dffebd43341040db5a5766f451d2b5ab16ed192e5f777391f4a99249686b46729bb3643451456675854b6d099e60bdba93ed5156c5941e4c3923e76e4d5455d99559f244b000000030074acfd4a7e90a9f76ff000ab93ca21899cf6e83d4d62331762cc7249c9ab9bb6873d085df33129f144f2bed41934b0c2d3c8117f13e95b10429026d41f53eb5118dcdead550d3a905bd8471619fe76fd055ba29934a21899dba0fd6b6492385ca537a8db8b84b75cb724f451deb2e6bc9663f7b6afa0a8a591a590bb9c934dac6536ceda745456bb851451526e153c1772c240cee5fee9a828a13b12e2a4accdd86649d3721fa8f4acfd507ef90faad57b69da09430e9dc7a8ab5a990cb0ba9c820f3f9568e5cd139a34fd9d45d8a15b96cfe65bc6dea2b0eb534c7dd6e57fba69537a9788578dcb9451456c70915ca7996d22fb56257415832a7972ba7a122b2a8ba9d7867ba1b4a18ae70719183494566750548d18fb32483aee2a6a3ad0680ae99823e6cefff003f8534ae44e5cb633e8a28a46815bb0bf990a3fa8ac2ad5d35f75b95fee9aba6f539b10af1b96e8a28ad8e222ba4f32da45f6c8ac4ae82b0654f2e574f42456551753af0cf74368a28acceb0a28a2800a28a2800ad2d324cc6d19fe139159b53d949e5dca9ec7834e2ecccaac79a0d1b345145741e70563df47e5dcb7a37cc2b62a96a71ee85641d54f3f435135746d42569fa99945145627a0156b4ecfdac63a60e6aa819201381eb56a3b84b652211b9cf576fe829c77b99d4bb8d91ac4851924003b9aa936a11a7118de7f4acd966925399189f6ed4cab753b18c30e97c44d35d4b370cd85f41c0a868a2b36ee74a4968828a295519ce154b1f614009455a8ec277ea020f7356e2d3e24e5c973efc0aa506cca55a11ea5082da49dbe5185eec7a559bd4582d63893bb649f5ad1000180300761593a84be65c6d1d138fc6a9a5146509ba93f2455a28a2b33ac28a28a0028a28a0028a28a0028a28a0028a28a0028a28a002800b1000249ec2acdbd9493609f913d4d69416f1c03e45e7d4f5aa506cc275a31d3a94adf4e270d31c0fee8eb5a288b1aed45007a0a5a2b65148e39d494f70a28a2990145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145003648d255daea18567cfa732e5a13b87f74f5ad2a2a5c5334854943639f2083820823b1a2b6e6b78e71f3af3ea3ad674f63245929f3afb75ac9c1a3ae15a32d1e855a28a2a4dc28a28a0028a28a0028a28a0028a28a0028a28a0028a28a002acd95cf90f86fb8dd7dbdeab5142762651525667400e46474a2b36c2ef6e2290f1fc27d3dab4aba13ba3ce9c1c1d994eeec84b978b01fb8ec6b3194ab1560411d41adfa86e2d52e179e1bb30a8942faa35a55f97496c62d1524f0490361c71d8f6351d6476a69aba1f1cb244728e57e956e3d49c712206f71c551a29a935b1328465ba35935081ba92bf51528b980f4953f138ac4a2abda3317868f4370dc423fe5aa7fdf5513dfc0bd18b1f61591451ed182c347ab2ecda8bb711aec1ebd4d5324b1249249ee6928a96dbdcda308c760a28a291615b5669e5daa0ee464fe358f127992aa7f78e2b7ba0ad29aea726265a241451456a720d95fcb899ffba335824e4e4d6b6a2fb6db6f7638ac9ac6a3d6c76e1a368b615774c4ccecdfdd5aa55a7a6262166fef35282d4baced065da28a2b73cf0ac9d45f75d11fdd0056b5614cfbe676f526b3a8f43a70cbde6cbba6dc60f92c7dd7fc2b42b0012ac083823906b6ada613c21bbf423de884ba06229d9f3233f50b7f2a4f3147cadfa1aa95bb2c6b2c6c8dd0fe958a62659fca6fbdbb15338d99ad1a9cd1b3e86c5a26cb58c7b67f3a9680303028ad91c4ddddc2a3b87d903b7a29a92aaea4fb6db6ff00788149bb21c15e4919f690f9d3aa9fba393f4adaaa3a5a623793d4e2af54c1591ad795e56ec145145598115d4de4c0cfdfa0fad62139393d6af6a7266458c745193546b19bbb3be846d1bf70a28a2a0dc28a28a0028a28a00b9a74db26f2c9f95ff9d3f546f9a34f404d514628eac3a839a9efdc4972483900002aafeed8c1c3f78a457a28a2a4dc28a28a0028a28a00d7d3bfe3d07d4d59aada7ffc7a2fd4ff003ab35d11d8f32a7c6c29b37fa97ff74d3a993ffa893fdd3fca9b256e61514515cc7aa5fb29cb5bcb131ced5247d2a854b6cc11db2700a30fd2a2a6ddd2338c6d261451452340ad3d3ee77af92e7e61f74fa8acca5562ac194e08e41a7176667520a6ac6fd150dace2e220dfc43861535742773ce69a7661505ddb89e2e3ef8e86a7a2935708b7177473e410482304515a3a8db7fcb641fef0feb59eaa5d82a8c92702b06acec7a509a946e59b083cd977b0f953f535ad51c110862541dba9f53515f4fe4c3853f3b703dab54b951c5393ab3b2295fcfe6cbb54fc89c7d4d55a2acd845e65c827a2f3597c4cecd29c7d0d0b480410807ef9e5aa7a28add2b1e749b93bb0aced524cb2443a0e4d68d635eb6ebb90fa1c54cde86d87579dc828a28ac4ef0a28a2800a28a2800a91a52d02c447dd3906a3a2813570abba63e2664fef0fe554aa7b7cc3710b93c37ff00aa9c746454578b46cd14515d079a1593a8a6dba27fbc01ad6a6490c72b02e8188e99a992ba34a53e495cc2009380326a64b49dfa4647d78ad72628475441f80a85efe05e84b7d0547225bb3a3db4e5f0c48edb4f11b07948623a01d2ae3aef4653dc62a8ff0069ae7fd51c7d6acc17514fc29c37a1aa8b8ec8c66aa7c523148c120f51454d789b2ea41ea73f9d4358bd0ee4eeae15774c7c4cc9fde1fcaa954b6cfe5dc46defcd38bb31545cd168dba28a2ba0f302b27514db73bbfbc335ad54b544cc48fe8715135a1b5076999945145627a014514500145145001451475a00dcb793cd811fd473f5a92a2b48cc56c8add7a9a94903a902ba16c7972b733b0536441246c8dd08c51e627f7d7f3a7020f420d316a8c692ce746202161d88a416b39ff964d5b54567ecd1d1f59976318595c1ff009667f314e161707f800fc456bd147b342facc8ca1a74e7a941f8d3c698fde451f415a5453e44275e6505d317f8a527e83152ae9d00ebb9bea6ad514f9510eacdf5225b5813a44bf88cd4a000300628a2aac436dee1451556e2f6384154c3bfa0e8293696e38c5c9d90fbcb81047c1f9cf41fd6b1ba9c9a749234ae5dce49a6d61295d9df4a9f220a28a291a851451400514514005145140051451400514f8e2795b6a2926b420d3d570d29dc7d074a6a2d99cea461b9461b79273f22f1ea7a56941631c582df3b7a9e82ac8000c01803b0a2b55048e39d694b45a05145156621451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500413da4537246d6fef0ace9ece587271b97d456c5152e099ac2b4a273f456bcf6314b9206c6f5159d3dacb072cb95fef0e95938b47642ac66434514549a85145140051451400514514005145140051451400568d8de67114a79fe163fcab3a8a69d889c14d599d05159d697d8c4731e3b37f8d68839191d2b74d33cf9c1c1d988e8b229570083d8d66dc69ec99687e65feef715a7452714c215250d8e7c8c1c1eb456dcd6d14ff007970dfde1d6b3e5d3e54e530e3f235938347642bc65be854a2959190e194a9f7149526c145145030a28a2800a28a9d24b7c8f3203ff01634225bb7425d3622d3f998f95475f7ad4aaf0dd5b6d0a8c107a1e2ac0208c83915bc5248e0aadca576ac145145519199a9be6654fee8fe754aa5ba62d75213fdec5455cf27767a54d5a29056d5a26cb58c7b67f3ac645deeaa3a938adf030001d055d3463897a241451456a718c9df640ede8a6b0ab5b527db6d8fef102b26b1a8f53b70cad1b8558b39fc89b9fb8dc1aaf45427637925256674150c96eaf3c72f753cfbd43a75c6f4f298fccbd3dc55cae856923ce69d395828a28a6405676a8f978d3d066b46b1ef9f7ddbfa0e2a26f437c3abcee68d8aedb44f7c9fd6a7a86d3fe3d63fa54d54b6329fc4c28a28a6498974dbee643ef8a8a958e589f53495cccf552b2b05145140c28a28c11d450014514500145145001451450014514500145145006c69ff00f1e69f8ff3ab155ec3fe3ce3fc7f99ab15d11d91e654f8d854771ff1ef2ffb87f954951dcffc7b4bfee9fe543d898ee8c3a28a2b9cf5428a2a482169e40aa38ee7d2813692bb092308919e72cb93f9d47573515092c6a3a04c0aa74dab3260f9a370a28a29164b6d398250c3a7423d456d230750ca720f22b02aee9f73e5b794e7e56e9ec6ae12b687357a7ccb996e69d14515b1c4046460f4aab059ac33b49d47f08f4ab54526ae529349a40c42a962700726b12e2633cc5cf4e807a0ab9a94f80215efcb56756539743af0f0b2e6615a5a5afeeddbd4e3fcfe759b5aba67fc7b1ff78d286e5577ee16e8a28adce00ac3b9ff008f997fde3fceb72b16f06dba907be6b3a9b1d386f8990d1451591da1451450014514500145145001561c66ca27feeb11fd6abd5bc7fc4af3fede69a339bb5bd4d38df7c6affde00d3aab69efbad40fee922acd6e9dd1e7cd5a4d05437809b57da4820678a9a860194a9e84628628bb3b9cfd14ac0ab153d41c525739ea0528254820e08e86928a00b174fe6ac53772369fa8aaf464e319e3d28a1bb8a2acac4f669be7c119014ff2a82b434b8fefc87fdd159e460914dad113195e6d1bb0bf990a3fa8a7d54d35f75bedfee9ab75ba77479f35cb2682a2bb4f32da45f6c8fc2a5a29bd449d9dce7e8a74a9e5cac9fdd24536b98f516a145145030a28a2800a96298c43e445ddfde2326a2a281349ee48f7133fde918fe38a8e8a280492d828e945140c7acf2afdd91c7e352adf5c2ff1e7ea2a148de46da8a58fb568dad908bf7931058738ec2aa29bd8c6a38456a8886a52a9c3c6a71f8548ba9aff0014447d0e6b3e47f32467fef1269b473b0f6307d0d51a8c07a871f514f17d6e7f8c8fc0d63d14fda327eaf0367edb6fff003d07e4690df5b8ff00969fa1ac7a28f68c5f568f7359b518074dc7e82a17d4ff00b91fe2c6b3e8a5ceca542089a5bb9a5e19f03d07150d1454b7736492d105145140c28a28a0028a28a0028a28a0028a555676daa0927b0abd069c4f331c0fee8eb4d26f622538c772922348db514b1f4157a0d3ba34c7fe022af471244bb51428a7568a096e724f10de91d0444545da8a00f414b4515a1ce145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500559ec629795f91bdba7e559f35acb0f2cb95fef0e95b545438266d0ad28f99cfd15af358c52f2a3637a8e9f9567cd692c3c95dcbea2b37168eb8568c8828a28a9350a28a2800a28a2800a28a2800a28a2800ab16f77241c7de4fee9aaf4509d8994549599b50dd4537dd6c37f74f5a9ab9fa9a3bb9e3e04848f43cd68aa7739a586fe566d51596352987f0a1fc0d35b509dba155fa0aae7467f5799aaec88a4b9007bd66dcdeab0290a800f05b1d6aa3c8f21cbb163ee69b5129df63785051d58514515074051451400514514005391dd0e518afd0d368a045a8f509d3a90e3dc5598f5243f7d0afd39acca2a94da3395183e85db98e3b87f32091493d549c1aa6ca558ab0c11d45254a9320003c08d8ef920d27a8d27156dc92c22325c2b63e54e49ad7aa30dfc0aa17cb283d8715652ea07e922fe3c56b0b247256e793bb44b4500823228ab3033b547f9e34f419aa156f52522e413d0af1552b9e5b9e8d256820a28a291a8e8e468a4575ea0d6e4522cb1abaf4358356f4fb8f2e4f2d8fcadfa1ab84acec73d7a7ccaeb746ad14515b1c204e0127a0ac076deecc7b9cd6cddbecb590fb63f3ac5acaa33b30cb46cd7d3db75a28fee922acd66e992e2468cff001723eb5a5571774615a369b0a0f43451546473f453e55d92bafa3114cae63d55a85145140c2a58ee658f003920763c8a8a8a2e2693dcd98d219e2573127cc3d291ac6ddbf831f426a4b65db6d18ff645495d164d6a79ae4d3766526d3633f75d87d79a8db4c6fe1901fa8c568d4376e63b676070718152e312e356a376b998f68e871be327d378feb50514562cee49f50a28a282828a28a00d9b1ff8f38ff1fe753d4165ff001e91fd2a7ae85b1e5cfe26148ea1d0ab74230696a3b96296f2329c103834d896ac87fb3e0f46fce93fb3a0ff006bf3aa1f6bb8ff009ea697ed971ff3d4fe42b2e68f63afd9d5fe62f8d3e0079dc7ea6ac24691aed450a3dab296fae14fdf07d88157ad6f1673b586d7f4ec6aa328f433a94ea2576ee54d53fe3e17fdcfea6a9d5cd4ff00e3e47fba3f99aa7594b73aa97c0828a28a46814514019381d68035ac2e3ce8f637df5efea2ad541690791160fdf3cb54f5d11bdb53cca96e67ca145145320ad7d6de747b947cebd3dfdab22ba0acdd42db6b79c83e53f787a1ace71ea7550a9f65946b4f4b6cc2ebe8d9accab9a649b67643fc43f515107a9b5657833528a28adcf3c2b2b524db701bfbc2b56aa6a51ef8038ea87f4a99aba35a32b4d19545145607a2145145001451450014514500157a41b34a407ab1cd538d0c922a0eac7157b522152288741cd54766cc66ef28c44d2dfe6913db22b46b1ec5f65d27a1e2b62b483d0e6c42b4ee14514559818d7c9b2e9fd0f35055fd513e68dfd462a8573c9599e952778261451452340a7468d238451926a486da598fcaa40f53d2b4edad52dd78e58f56aa8c5b31a9554179924310862541dbf5ac49462571e8c6b7ab1a58c35ccb9754018fdeab9ad118e1e5ab6cb1a567749e9815a35421b9b6b68f6a1663dc81d69dfda717647fd29c5a4ac4d484a726d22ed154c6a5177571f80a916faddbf8f1f514f9919ba735d08af2c9a57f322c64f507bd53365703fe59fea2b5d2447fb8eadf434ea4e09ea5c6b4e2ac629b49c7fcb26a4fb34fff003c9ff2adba297b3457d665d8c3fb3cdff3ca4ffbe4d1e44dff003ca4ff00be4d6e5147b341f597d8c3fb3cdff3c9ff00ef934a2d673ff2c9bf2adba28f6683eb32ec630b2b83ff002ccfe24548ba74e7aed1f535ab453f6684f11333974c3fc728fc054e9a7c09d4163ee6ad514d452337566fa88aaa830aa00f402ab6a1379706c07e67e3f0a9e6992142ee7e83d6b16695a690bb77e83d294e56562e8d3729733d8651451589de1451450014514500145145001451450014514500145145001452a233b6d452c7d055e874e27999b1fec8a6937b1129c63b945559db6a824fa0abb069cc7998ed1fdd1d6afc71244b8450b4fad141753967886fe1191451c4b88d40a7d1456873b77dc28a28a04145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500579aca1979c6d6f55aa1358cb17206f5f51fe15af454b8266b0ad289cfd15b735ac537de5e7d4706a84da7c89cc6778f4e86b27068ea8578cb7d0a7452b295386041f4349526c145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280155d90e558afd0e2a74beb84fe3dc3dc557a284da25c53dd16def44c9b668811eaa718aaf279791e596c77dc2994536efb8a3051d828a28a45851451401b16571e745863f3af07dfdeac561dbcc609438e9dc7a8adb560ca194e411915b4257479f5a9f2caeb62a6a6f88557fbcd5975af7d079d0e57efaf23deb22a27b9d1876b92c2a31470ca7041c8adc82559a20ebdfa8f4358553dadcb5bc99eaa7a8a5095875a9f3ad373668a6c6eb2206439069d5b9c1b195a8c5b27de3a38fd6aa56ddcc02784a77ea0fbd62b29462ac304751584d599df427cd1b76128a28a9370a00c90077a2a5b54df7318ff006b34213765736c0c00076a28a2ba4f282aa6a6d8b703d5aadd67eaadfead7ea6a67b1ad1579a33e8a28ac0f4428a28a0028a28a00dab3ff8f48fe95354569ff1eb1ffbb52d742d8f2e7f130a86f3fe3d64fa54d50deffc7a49f4a1ec10f8918b45145739ea052ab1560ca7041c8a4a281166f9fcc951fd501aad4ace5f19ec3029286eec515caac2804e7009c73c52559893659cb29eadf2aff5aad43409ddb0abda75bee6f398703eefd6aadbc2679420fc4fa0adb450881546001815708df530af52cb950a4850493803ad662df9fb51739f2cf18f6f5a9351b8c0f254fbb7f8567539cb5d09a34938de5d4e80104020e41a2b3f4eb9c7ee5cff00ba7fa5685689dd1cf38383b30a4650ca558641e08a5a299062dd406de5dbfc2795351c6e63915d7a839ad9b8816788a1ebd8fa1ac5756472ac30475ac251b33be954e78d9ee6ec6e248d5d7a119a7565d8dd794de5b9f90f43e86b52b58bba392a41c1d829194329523208c1a5a2a8ccc39e230ca50f6e87d45475b3756c2e23c7471d0d643a346e55c10456128d8f42954535e6368a28a9360a28a2800a28abd69625c8798617b2fad349b2253515763f4eb7da3ce718cfddff001aa9752f9d3b30e9d07d2ae5fdc85530c6793f7b1d87a566d3969a233a49c9f3b1558ab061d41cd6f8219411d0f35cfd6e5b822de30dd768aaa667895a264945148cea832cc147b9ad4e420bd85a6836a0cb039155134d90fdf755fa7356defa04fe3dc7fd9155df53fee47f8b1ace5cb7bb3a61ed52b4512a69d0afde2cdf8e2a758218c656351ef8acc7bf9dfa3051fec8a819ddce5d8b7d4d2e68ad917ecaa4be266c3dd409d645fc39a81f528c7dc466faf159945275194b0f05b96df5199bee855fc3355598bb1663927a9a4a2a1b6f7358c231d905145141614514500152a5d4f1fdd91be879a8a8a2e2693dcba9a9483efa2b7d38ab09a8c2df7832fe19acaa2a94d993a107d0db4b985feecabf89c54a083d2b9fa50c57ee923e86abda19bc32e8cdfa2b105ccebd257fc4d385edc0ff009687f214fda223ead2ee6cd158ff006db8ff009e9fa0a635d4edd656fc0e28f6883ead2ee6d33aa0cb3051ee6aa4da8469c46379f5ed598496392493ef4952ea3e8691c3c56fa8f965799f73b64ff2a6514541d095b44145145030a28a2800a28a2800a28a2800a28a2800a2a58ade59bee29c7a9e957a1d3917994ef3e83814d45b339d58c7733e389e56c22963ed57a1d37bccdff015abcaaa830a001e8296b5504b739678893db41b1c691ae11428f6a7514559cfb85145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400c9228e51891435529b4def0b7e0d5a1452714cb8d494766614914911c3a95a65740406186008f435525d3e27e53287f4acdd3ec74c7109fc465515625b39a2e76ee1eabcd57acdab1d0a4a5aa0a28a282828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002afe9b7183e4b1f75ff0aa140241041c114d3b3b913829c6cce82b2afedfca937a8f91bf4357ad2e45c47cfdf1d47f5a9658d658ca30e0d6cd7323861274a7a98345493c2d04851bf03eb51d607a09a6ae8960b8781b2878ee0f435a705e45360676b7f74d63d1551934673a519fa9d0541736a970327e571d1ab362bc9a2e036e1e8dcd5b8f5353feb2323dc735a73c5ee737b1a907789525b39a23ca161eabcd40463ad6cadedbb7fcb4c7d4629e2685bfe5a21fc454f227b33455a6be2898b1c4f21c2216fa0ad4b3b4f206e7e5cfe9563cd8ff00bebf9d34dc42bd654fcea9452d4ce756535648928a3a8a2ace70acbd4ce6e00f45ad4acad4862e47ba8a89ec6f87f8ca945145627785145140051451401b76bff1eb1ffba2a5a8edc15b78c1ea145495d0b63cb96ec2a0bdff008f493e9fd6a7a82fb26d24c7b7f3a1ec10f8918d452ed6f43f95260fa5739e9851452aab31c2a927d8500254b6f034f2055e9dcfa54b0d84b21cbfc8befd6b4e189214da8303f9d5c60dee6152b28ab47729ea388ede3897819fe559d577536cceabe8b469f6fbdfcd61f2af4f734357958212e4a7765bb2b7f222e47cedc9ff000a7dc4c2088b9ebd00f5352d63de5c79f2f1f71781fe35727cab439e1175677640cc598b31c93c9349451589de00e0e475ad8b3b8f3e3e7efaf5ff001ac7a7c32b432875edd47ad54656667569f3af33768a01c807d68adcf382a9dfdb7989e620f9d7afb8ab94526aeac5464e2ee8e7eaddade98b0926593b7a8a7de59156324432a792076aa3586b1677fbb5626f248922ee460c3da9d582923c6db918a9f6ab71ea522f12286f71c1ad1545d4e7961e4be134e993431ccb875cfa1ee2aba6a3037dedcbf51528bbb73d251f8d55d332e49c5ec53974d60731b823d0f1501b2b81ff002ccfe0456a7da60ff9ea9f9d21bcb71ff2d47e152e31358d5aaba1982cee0ffcb33f8915347a6c87efb2a8f6e4d596d4201d0b37d054126a67fe59c607bb1a56822f9ab4b6562cc56b0db8dd8c91fc4ddaa0babf1829075eedfe154a59e498fcee4fb76a8e939f445468eb79bb81393934514541d04f17d9e3219cb487aed0302a77d4dcfdc8d47d79aa3453e66b63374e2dddea4cf773bf5908fa71509249c93934514af729452d828a28a0a0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a7246f21c22963ed40b61b455e8b4d63ccadb47a0eb57a2b78a1fb8833ea7ad5a836632af15b6a66436334bc91b17d5aaf43630c7c91bdbd4ff008559a2b45048e59d694828a28aa320a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a8a5b68a6fbc833ea38352d145ae34dad519b2e9ac3989b70f43c1aa6f1bc670ea54fbd6f523286186008f4359ba6ba1bc71125bea60515ab2e9f13f29943edd2a9cb63347c81bc7fb350e0d1d11ad0915a8a0820e08c1a2a4d828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a007452344e1d0e08ad8b6b94b84c8e18755ac5a5566460ca4823b8aa8cac6552929af336ee2049d36b75ec7d2b22781e06c38e3b1ec6ae41a8838130c1fef0ab61e29d70195c1ed56d296c73c653a5a35a187456a49a746c728c53dba8aab2597960ee9a31f5eb50e0d1d11ad091568a28a9350a28a2800a28a280366ca5f36d97d57e5353d6458cfe4cd863f23707dab5eb783ba3cead0e590567ea89feadff00035a151dcc5e740c9dfb7d6892ba269cb9649987450410483c1145607a6145145002a80cc0160a3d4d5a823b5460d24c1b1d000715528a13b1128dfa9b5f6cb7ff009ea28fb5c1ff003d56b168abf68cc7ead1ee6dfdaa0ff9eabf9d1f6983fe7aa7e7589451ed187d5a3dcdcfb443ff003d53fefa1479f0ff00cf54ff00be8561d14fda317d5977377ce88ffcb44ffbe851e6c7ff003d13f31585451ed03eacbb9bde627f7d7f3a5de9fde5fceb028a3da0beacbb96a653737ecabeb8cfa015ab1a2c68114600155ec6dfc98b730f9dbafb7b54b3ccb0445dbf01ea6aa2adab32a92e66a11e856d46e362794a7e66ebec2b329d23b48e5d8e49a6d652776765387246c1451452340a9e14b7055a597dca85350514225ab9ac750807763f8534ea50ff0075cfe02b2e8abe7665f5781a67538fb46d4d3a98ed11ff00beab3a8a5cec7ec21d8be7533da21ff7d54325dac872d0464fad56a29733652a505b215d83364285f614945148b0a28a281851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514f8e19253f2213efdaae45a693ccaf8f65a6a2d99caa463bb285588ace6979dbb47ab715a915bc50fdc419f53c9a92ad53ee73cb13fca8a7169d1273212e7f2156d5550614003d052d15a2496c73ca7296ec28a28a6485145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400c9228e518740d5525d354f31395f63cd5ea2938a65c6a4a3b331a5b49a2ea848f55e6a0ae82a392de297efa027d7bd66e9f6378e27f991874568c9a60eb13e3d9aaa496b345f79091ea39a87168e88d584b6643451452340a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28017737a9fce928a28105145140c28a28a0028a28a002b4ac6ef701148791f74fafb566d14d3b32270535667414566db5f950126c91d9bbd68a3abaee46047a8add4933cf9d3941ea50d42d4e4cd18ff00787f5acfae82a8dce9e1c96870a7fbbdab3943aa37a55925cb23368a7c90c911c3a114cacceb4d3d828a28a0614514500145145001451450014515662b192400965507df3424dec4ca4a3b95ab42c6cce44b28ff00741fe752456f6d6ff33bab30eec7fa5136a31a8c44379f5e82b4514b5673cea4a7eec11665952142ce703f9d63dc5c35c49b8f00741e94d965799b73b64ff2a654ca572e95250d5ee14514549b85145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514e446738452c7d85598f4e95f972107e66849bd8894e31dd9529c91bc8708a58fb0ad48ec214e58173ef5655428c28007a0ad1537d4c25894be146645a748dcc8420fccd5c8aca08f9dbb8fab558a2ad452309569cba801818145145519051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514011c96f14bf7d013ebdeaac9a6a9e63723d9b9abd452714cb8d4947666349653c7fc1b87aaf3501183835d0535e28e41f3a06fa8a874fb1bc712fed23068ad4934e89bee1287f3155a4d3e65fbb871ec7150e0d1b46b41f52a514e78de338742bf514da935dc28a28a061451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014e491e339462a7da9b4502dcb89a94abf7d55bf4a986a6bde323e86b368aae7666e8c1f4348ea71e3fd5b1a81ef55beedbc7f5619aa9450e6d82a30439dcbb16200f603029b4515268145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a2a68ed2793a4640f53c55a8f4c3ff2d24fc169a8b6672ab08eeccfa7c714921f910b7d056b4767047d1013eadcd4e0606055aa7dcc65895f651971e9b237df6083f3356e3b0813a82e7deacd156a09184ab4e5d44550a30a001e82968a2a8c828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a000804608c8a824b3824ea801f55e2a7a293571a935b19f2699ff003ce4fc185577b29d3f8370ff00679ad8a2a5c11b46bcd6e60152a70c083ef495becaae30ca08f71503d8c0ff00c3b4ff00b26a5d37d0d562575463d15a0fa67fcf393f06155deca74fe0dc3fd939a87168d95583ea57a2959590e19483ee292916145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a2a44b79a4fbb1b1f7c5584d3a56fbc557f5a6a2d90e718eeca7456a269b10fbeccdfa5584b7863fbb1a8f7c66a953664f1115b18e904b27dc8d8fbe2ac47a74adf7caafea6b528aa54d18cb1127b1523d3a15fbc59cfe42ac2451c7f71157e829f455a4918ca7296ec28a28a6485145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514001008c1008f7a85ece07eb181f4e2a6a295ae3526b6293e9887ee3b2fd79a81f4e997ee956fc715a9454b823555e6ba988f6d327de89bf019a8ba75ae8291915fef286fa8cd274cd1625f5460515b2f656edff002cf1f438a85b4c8cfdc9187d79a9e4668b1107b999455d6d3651f75d4fe950b59dc2f58c9fa7353cacd15483d990514e6474fbcacbf514da4585145140c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28033d2800a2a45b799feec4df954cba7cedd42afd4d3b321ce2b7655a2b4174c3fc72fe42a64d3e05ebb9bea69f233375e08c9a72c6eff7119be82b692de14fbb1afe552552a666f13d918e96370dfc1b47b9a9d34c3fc7201f415a3455282337889b2aa69f02f50cdf5353a431c7f71147d053e8aa492327393dd8514514c90a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a634113fde8d4fe14fa281a6d6c576b1b76fe0c7d0d44da6467eebb0faf35768a9e545aab35d4cd6d31ff0086453f518a8db4fb81d02b7d0d6b514b9116b11346235acebd626fc066a36465fbca47d456fd14bd996b12faa39fa2b79a28dbef229fa8a8cda40dd625fc38a5ecd94b12baa3168ad73616e7a291f434c3a6c5d9dc7e54b9196b11032e8ad03a67a4bf9ad30e99276914fd697232956877295156ce9d38e9b4fd0d30d8dc0ff9679fc452e563f690ee57a2a636938ff964d4d304c3ac4fff007c9a56657347b91d14e31b8ea8c3f0a6e3140c28a28a061451450014514500145145001451450014514500145145001451450014514a149e809fc28109453c4521e91b9ff809a70b69cffcb27fca8b31732ee45454e2cee0ff00cb33f98a70b0b83fc207d4d3e562f691ee56a2ae0d3663d5907e269e34c6ef281f41472b25d682ea50a2b486989de463f414f1a7403a973f534f9192ebc0caa2b64595b8ff009679fa934f16f0af4893f2a7ecd92f131e88c3033d29eb0cadf76373f856e80074007d28a7ecc8789ec8c65b2b86ff009678fa9152ae9b31eac83f1ad4a2abd9a25e22667ae99fde97f2152ae9d00ebb9bea6add14f9519bad37d4856d205e912fe3cd4aaaabf7540fa0a5a29d910e4deec28a28a620a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28010a29eaa3f2a431467ac6bf951454b3688d30438ff549ff007c8a85e1887fcb34ff00be451454336890b471ff00717f2a8d913fbabf9514549a218557fba3f2a42abfdd1f951452284dabe83f2a50abfdd1f95145031c117fba3f2a91634fee2fe54514c964ab147ff3cd7f2a9d2088ff00cb24ff00be451453466c7f9310e9127fdf22944683a22fe5451568c6438003a0145145598b0a28a281051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401fffd9'##"
    )
  );
INSERT INTO
  `school_cred` (
    `id`,
    `school`,
    `admin`,
    `status`,
    `date_of_pay`,
    `date_of_expiry`,
    `password`,
    `phone`,
    `email`,
    `custom_login`,
    `logo`
  )
VALUES
  (
    2,
    'global kids academy',
    'admin',
    '',
    '',
    '',
    'admin',
    '09078785538',
    'segunade041@gmail.com',
    '/global-kids-academy',
    NOFORMAT_WRAP(
    )
  );
INSERT INTO
  `school_cred` (
    `id`,
    `school`,
    `admin`,
    `status`,
    `date_of_pay`,
    `date_of_expiry`,
    `password`,
    `phone`,
    `email`,
    `custom_login`,
    `logo`
  )
VALUES
  (
    3,
    'global kids academy',
    'tee',
    '',
    '',
    '',
    'tee',
    '',
    '',
    '',
    X''
  );
INSERT INTO
  `school_cred` (
    `id`,
    `school`,
    `admin`,
    `status`,
    `date_of_pay`,
    `date_of_expiry`,
    `password`,
    `phone`,
    `email`,
    `custom_login`,
    `logo`
  )
VALUES
  (
    4,
    'global kids academy',
    'tobi',
    '',
    '',
    '',
    'tobi',
    '',
    '',
    '',
    X''
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '-fq4-LNBoJAnE2iQgaHlUcSfesPchZ6j',
    1693145506,
    '{\"cookie\":{\"originalMaxAge\":1728000000,\"expires\":\"2023-08-27T13:33:54.984Z\",\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"user\":{\"school\":\"global kids academy\",\"user\":\"admin\",\"admin\":true,\"customLogin\":\"/global-kids-academy\"},\"databaseName\":\"global_kids_academy\"}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'C7jwIkgAOJ9v6p54pqV0HYjjf5ZwJ5PE',
    1693147215,
    '{\"cookie\":{\"originalMaxAge\":1728000000,\"expires\":\"2023-08-27T14:38:31.935Z\",\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"user\":{\"school\":\"global kids academy\",\"user\":\"tee\",\"admin\":false,\"customLogin\":\"/global-kids-academy\"},\"databaseName\":\"global_kids_academy\"}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'IMrq1c3Qd-b80fJhPbFO4jJyIvfdMRjT',
    1693230575,
    '{\"cookie\":{\"originalMaxAge\":1728000000,\"expires\":\"2023-08-28T09:24:06.544Z\",\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"user\":{\"school\":\"global kids academy\",\"user\":\"admin\",\"admin\":true,\"customLogin\":\"/global-kids-academy\"},\"databaseName\":\"global_kids_academy\"}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'SeMpxMyD5gsGsYBmjwbduQU0S0n5kQEz',
    1692533892,
    '{\"cookie\":{\"originalMaxAge\":1728000000,\"expires\":\"2023-08-20T11:44:36.511Z\",\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"user\":{\"school\":\"oakcrest international college\",\"user\":\"admin\",\"admin\":true,\"customLogin\":\"/oakcrest-international-college\"},\"databaseName\":\"oakcrest_international_college\"}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Z6OE_hLewgV2zqi3raE2gK9b0Ob87dY_',
    1693231063,
    '{\"cookie\":{\"originalMaxAge\":1728000000,\"expires\":\"2023-08-28T13:38:38.651Z\",\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"user\":{\"school\":\"global kids academy\",\"user\":\"tobi\",\"admin\":true,\"customLogin\":\"\"},\"databaseName\":\"global_kids_academy\"}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'boW7em1PdSq2LJSfx17H2ljH6fSouvu7',
    1693146237,
    '{\"cookie\":{\"originalMaxAge\":1728000000,\"expires\":\"2023-08-27T14:23:57.180Z\",\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"user\":{\"school\":\"global kids academy\",\"user\":\"admin\",\"admin\":false},\"databaseName\":\"global_kids_academy\"}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'dMMYVJ-llzyRmMT7wKFsjpyv2w6ySGj6',
    1693146215,
    '{\"cookie\":{\"originalMaxAge\":1728000000,\"expires\":\"2023-08-27T14:23:35.221Z\",\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"user\":{\"school\":\"global kids academy\",\"user\":\"admin\",\"admin\":false},\"databaseName\":\"global_kids_academy\"}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'iq8hGi3t42eAmpCd5wYeSsXs1re9ks1_',
    1693229710,
    '{\"cookie\":{\"originalMaxAge\":1728000000,\"expires\":\"2023-08-27T14:25:14.481Z\",\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"user\":{\"school\":\"global kids academy\",\"user\":\"admin\",\"admin\":true,\"customLogin\":\"/global-kids-academy\"},\"databaseName\":\"global_kids_academy\"}'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;