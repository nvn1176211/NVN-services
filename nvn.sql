-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2024 at 04:33 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nvn`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `thumbnail` mediumtext NOT NULL,
  `year` int(11) NOT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `tag_id`, `thumbnail`, `year`, `month`, `day`, `content`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(2, 2, 'https://live.staticflickr.com/65535/53317112738_0b276efde9_z.jpg', 1939, 9, 1, 'World War II or the Second World War, often abbreviated as WWII or WW2, was a world war that lasted from 1939 to 1945. It involved the vast majority of the world\'s countries—including all of the great powers—forming two opposing military alliances: the Allies and the Axis powers. World War II was a total war that directly involved more than 100 million personnel from more than 30 countries.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(4, 4, 'https://live.staticflickr.com/65535/53316005192_ff1413bebf_z.jpg', 1990, 8, 2, 'The Gulf War was a 1990–1991 armed campaign waged by a 35-country military coalition in response to the Iraqi invasion of Kuwait. Spearheaded by the United States, the coalition\'s efforts against Iraq were carried out in two key phases: Operation Desert Shield, which marked the military buildup from August 1990 to January 1991; and Operation Desert Storm, which began with the aerial bombing campaign against Iraq on 17 January 1991 and came to a close with the American-led Liberation of Kuwait on 28 February 1991.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(6, 6, 'https://live.staticflickr.com/65535/53317112838_cdd9354513_z.jpg', 2014, 2, 27, 'In February and March 2014, Russia invaded and subsequently annexed the Crimean Peninsula from Ukraine. This event took place in the aftermath of the Revolution of Dignity and is part of the wider Russo-Ukrainian War.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(7, 7, 'https://live.staticflickr.com/65535/53317343595_b0fdf94046_z.jpg', 2015, 11, 13, 'From November 2015 to 2019, the United States and allies carried out a large series of both airstrikes and drone strikes to invade Libya in its revived conflict in support of the Tripoli-based Government of National Accord against the ISIL presence in the region. By 2019, the ISIL branch had been largely driven from holding Libyan territory, and US strikes ceased.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(8, 8, 'https://live.staticflickr.com/65535/53316871716_157314a87c_c.jpg', 2014, 9, 22, 'The American-led intervention in the Syrian Civil War refers to the American-led support of Syrian rebels and the Syrian Democratic Forces (SDF) during the course of the Syrian civil war, including Operation Inherent Resolve, the active military operation led by the United States, and involving the militaries of the United Kingdom, France, Jordan, Turkey, Canada, Australia, and others against the Islamic State (IS) and al-Nusra Front since 2014. Beginning in 2017–18, the U.S. and its partners have also targeted the Syrian government and its allies via airstrikes and aircraft shoot-downs, mainly in defense of either the SDF or the Revolutionary Commando Army opposition group based in al-Tanf.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(9, 9, 'https://live.staticflickr.com/65535/53316871706_1c21814db0_c.jpg', 2014, 6, 15, 'On 15 June 2014, U.S. President Barack Obama ordered United States forces to be dispatched in response to the Northern Iraq offensive (June 2014) of the Islamic State of Iraq and the Levant (ISIL) as part of Operation Inherent Resolve. At the invitation of the Iraqi government, American troops went to assess Iraqi forces and the threat posed by ISIL.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(10, 10, 'https://live.staticflickr.com/65535/53317343695_3360d374e6_z.jpg', 2011, NULL, NULL, 'Operation Observant Compass was a United States Department of Defense operation initially focused on apprehending Joseph Kony and the Lord\'s Resistance Army in Central Africa. It was overseen by United States Africa Command. NBC News wrote in March 2017 that \"The area of operations is the size of California, with about 80 military personnel and several dozen support personnel tasked with finding around 150 fighters with Kony\'s Lord\'s Resistance Army, operating across portions of four countries in some of the world\'s most inaccessible terrain.\"\r\n\r\nIn 2017, with around $780 million spent on the operation, and Kony still in the field, the United States wound down Observant Compass and shifted its forces elsewhere. But the operation didn\'t completely disband, according to the Defense Department: “U.S. military forces supporting Operation Observant Compass transitioned to broader scope security and stability activities that continue the success of our African partners.\"', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(12, 11, 'https://live.staticflickr.com/65535/53317112868_0410f073a7_z.jpg', 2009, 8, 17, 'Operation Ocean Shield was NATO\'s contribution to Operation Enduring Freedom – Horn of Africa (OEF-HOA), an anti-piracy initiative in the Indian Ocean, Guardafui Channel, Gulf of Aden and Arabian Sea. It follows the earlier Operation Allied Protector. Naval operations began on 17 August 2009 after being approved by the North Atlantic Council, the program was terminated on 15 December 2016 by NATO. \r\nOperation Ocean Shield focused on protecting the ships of Operation Allied Provider, which transported relief supplies as part of the World Food Programme\'s mission in the region. The initiative also helped strengthen the navies and coast guards of regional states to assist in countering pirate attacks. Additionally, China, Japan and South Korea sent warships to participate in these activities.\r\n\r\nThe US Navy was the largest contributor of ships, followed by the Indian Navy. The taskforce was composed of ships from the contributing navies, led by a designated leadship. The role of leadship was rotated among the various countries involved. In October 2015 this was the Turkish frigate TCG Gediz.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(13, 12, 'https://live.staticflickr.com/65535/53317112658_6b3bdf1ef8_c.jpg', 2007, 1, 7, 'Beginning in the late 2000s, the United States Military has supported the Federal Government of Somalia in counterterrorism as part of the ongoing Global War on Terror that began in wake of the September 11th attacks. Support, mostly in the form of drone and airstrikes, advising, training, and intelligence, increased during the Obama administration and Trump administration, with hundreds of drone strikes targeting the terrorist group al-Shabaab. Two U.S. special operations personnel and a CIA paramilitary officer have died during operations in Somalia.\r\n\r\nIn late 2020, US President Donald Trump announced that he would pull most US troops out of Somalia by 15 January 2021. On January 17th, 2021, the US Military announced that its troop drawdown had completed. Training of allied forces, limited airstrikes, and special operations activity continues.\r\n\r\nIn May 2022, according to a government spokesman, President Joe Biden has accepted a request from the Pentagon to redeploy US soldiers to Somalia in order to combat the terrorist group Al-Shabaab.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(14, 13, 'https://live.staticflickr.com/65535/53316871781_d10ebd35b6_c.jpg', 2004, 6, 18, 'Between 2004 and 2018, the United States government attacked thousands of targets in northwest Pakistan using unmanned aerial vehicles (drones) operated by the United States Air Force under the operational control of the Central Intelligence Agency\'s Special Activities Division. Most of these attacks were on targets in the Federally Administered Tribal Areas (now part of the Khyber Pakhtunkhwa province) along the Afghan border in northwest Pakistan. These strikes began during the administration of United States President George W. Bush, and increased substantially under his successor Barack Obama. Some in the media referred to the attacks as a \"drone war\". The George W. Bush administration officially denied the extent of its policy; in May 2013, the Obama administration acknowledged for the first time that four US citizens had been killed in the strikes. In December 2013, the National Assembly of Pakistan unanimously approved a resolution against US drone strikes in Pakistan, calling them a violation of \"the charter of the United Nations, international laws and humanitarian norms.\"', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(15, 14, 'https://live.staticflickr.com/65535/53316005472_296b7a63ce_z.jpg', 2003, 3, 20, 'The Iraq War was a protracted armed conflict in Iraq from 2003 to 2011 that began with the invasion of Iraq by the United States-led coalition that overthrew the Iraqi government of Saddam Hussein. The conflict continued for much of the next decade as an insurgency emerged to oppose the coalition forces and the post-invasion Iraqi government. US troops were officially withdrawn in 2011. The United States became re-involved in 2014 at the head of a new coalition, and the insurgency and many dimensions of the armed conflict continue today. The invasion occurred as part of the George W. Bush administration\'s War on terror following the September 11 attacks, despite no connection between Iraq and the attacks.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(16, 15, 'https://live.staticflickr.com/65535/53316005227_3fa4eb0ac2_c.jpg', 2002, 11, 5, 'United States drone strikes in Yemen started after the September 11, 2001 attacks in the United States, when the US military attacked Islamist militant presence in Yemen, in particular Al-Qaeda in the Arabian Peninsula using drone warfare.\r\n\r\nWith the Saudi Arabian-led intervention in Yemen, the Saudi led coalition also attacked Houthi rebels using drone warfare. The Houthi movement have as well used drone warfare to attack the Saudi led coalition and pro Yemen government troops.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(17, 16, 'https://live.staticflickr.com/65535/53316871876_d5d7ae1436_z.jpg', 2001, 10, 7, 'The War in Afghanistan was an armed conflict that began when an international military coalition led by the United States launched an invasion of Afghanistan, toppling the Taliban-ruled Islamic Emirate and establishing the internationally recognized Islamic Republic three years later. The conflict ultimately ended with the 2021 Taliban offensive, which overthrew the Islamic Republic, and re-established the Islamic Emirate. It was the longest war in the military history of the United States, surpassing the length of the Vietnam War (1955–1975) by approximately six months.\r\n', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(18, 17, 'https://live.staticflickr.com/65535/53316005457_5c1c0155cc_z.jpg', 1998, 2, 28, 'The Kosovo War was an armed conflict in Kosovo that started 28 February 1998 and lasted until 11 June 1999. It was fought by the forces of the Federal Republic of Yugoslavia (i.e. Serbia and Montenegro), which controlled Kosovo before the war, and the Kosovo Albanian rebel group known as the Kosovo Liberation Army (KLA). The conflict ended when the North Atlantic Treaty Organization (NATO) intervened by beginning air strikes in March 1999 which resulted in Yugoslav forces withdrawing from Kosovo.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(19, 18, 'https://live.staticflickr.com/65535/53317112898_4dfd70f44d_z.jpg', 1994, 9, 19, 'Operation Uphold Democracy was a military intervention designed to remove the military regime installed by the 1991 Haitian coup d\'état that overthrew the elected President Jean-Bertrand Aristide. The operation was effectively authorized by the 31 July 1994 United Nations Security Council Resolution 940.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(20, 19, 'https://live.staticflickr.com/65535/53317226089_69925b4491_c.jpg', 1992, 4, 6, 'The Bosnian War (Serbo-Croatian: Rat u Bosni i Hercegovini / Рат у Босни и Херцеговини) was an international armed conflict that took place in Bosnia and Herzegovina between 1992 and 1995. The war is commonly seen as having started on 6 April 1992, following a number of earlier violent incidents. The war ended on 14 December 1995 when the Dayton accords were signed. The main belligerents were the forces of the Republic of Bosnia and Herzegovina and those of Herzeg-Bosnia and Republika Srpska, proto-states led and supplied by Croatia and Serbia, respectively.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(21, 20, 'https://live.staticflickr.com/65535/53317343490_b5aeebf30f_c.jpg', 1991, 3, 31, 'The Croatian War of Independence was fought from 1991 to 1995 between Croat forces loyal to the Government of Croatia—which had declared independence from the Socialist Federal Republic of Yugoslavia (SFRY)—and the Serb-controlled Yugoslav People\'s Army (JNA) and local Serb forces, with the JNA ending its combat operations in Croatia by 1992. In Croatia, the war is primarily referred to as the \"Homeland War\" (Croatian: Domovinski rat) and also as the \"Greater-Serbian Aggression\" (Croatian: Velikosrpska agresija). In Serbian sources, \"War in Croatia\" (Serbian Cyrillic: Рат у Хрватској, romanized: Rat u Hrvatskoj) and (rarely) \"War in Krajina\" (Serbian Cyrillic: Рат у Крајини, romanized: Rat u Krajini) are used.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(87, 5, 'https://live.staticflickr.com/65535/53317112793_81b4d1c139_z.jpg', 2022, 2, 24, 'On 24 February 2022, Russia invaded Ukraine in a major escalation of the Russo-Ukrainian War, which began in 2014. The invasion has resulted in tens of thousands of deaths on both sides. It has caused Europe\'s largest refugee crisis since World War II. About 8 million Ukrainians were displaced within their country by late May, and 7.8 million fled the country by 8 November 2022; within five weeks of the invasion, Russia experienced its greatest emigration since the October Revolution, in 1917.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(88, 1, 'https://live.staticflickr.com/65535/53316871846_651b64b45b_z.jpg', 1914, 7, 28, '(Edited) World War I (28 July 1914 – 11 November 1918), often abbreviated as WWI, was one of the deadliest global conflicts in history. The main belligerents included much of Europe and their colonial empires, the Russian Empire, the United States, the Ottoman Empire and the Japanese Empire, with fighting occurring throughout Europe, the Middle East, Africa, the Pacific, and parts of Asia. An estimated 9 million soldiers were killed in combat, plus another 23 million wounded, while 5 million civilians died as a result of military action, hunger, and disease. Millions more died in genocides within the Ottoman Empire and in the 1918 influenza pandemic, which was exacerbated by the movement of combatants during the war.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_other_versions`
--

CREATE TABLE `event_other_versions` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `thumbnail` mediumtext NOT NULL,
  `year` int(11) NOT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_other_versions`
--

INSERT INTO `event_other_versions` (`id`, `tag_id`, `thumbnail`, `year`, `month`, `day`, `content`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(16, 1, 'https://live.staticflickr.com/65535/53317226249_cfd0651d0f_z.jpg', 1914, 7, 28, 'World War I (28 July 1914 – 11 November 1918), often abbreviated as WWI, was one of the deadliest global conflicts in history. The main belligerents included much of Europe and their colonial empires, the Russian Empire, the United States, the Ottoman Empire and the Japanese Empire, with fighting occurring throughout Europe, the Middle East, Africa, the Pacific, and parts of Asia. An estimated 9 million soldiers were killed in combat, plus another 23 million wounded, while 5 million civilians died as a result of military action, hunger, and disease. Millions more died in genocides within the Ottoman Empire and in the 1918 influenza pandemic, which was exacerbated by the movement of combatants during the war.', '2023-10-18 17:10:25', 1, '2023-10-18 17:10:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_tags`
--

CREATE TABLE `event_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_tags`
--

INSERT INTO `event_tags` (`id`, `name`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'world war 1', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(2, 'world war 2', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(4, 'gulf war', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(5, '2022 russia-ukraine ', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(6, 'annexation of crimea', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(7, 'american interventio', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(8, 'american-led interve', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(9, 'operation prosperity', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(10, 'operation observant ', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(11, 'operation ocean shie', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(12, 'american military in', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(13, 'us intervention in t', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(14, 'iraq war', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(15, 'us intervention in l', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(16, 'war in afghanistan', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(17, 'kosovo war', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(18, 'intervention in hait', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(19, 'bosnian war', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(20, 'croatian war of inde', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'admin', '2023-10-21 23:31:47', '2023-10-21 23:31:47', 1, 1),
(2, 'author', '2023-10-21 23:31:47', '2023-10-21 23:31:47', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE `roles_users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles_users`
--

INSERT INTO `roles_users` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(3, 1, 1, '2023-10-21 23:33:09', '2023-10-21 23:33:09', 1, 1),
(4, 2, 1, '2023-10-21 23:33:41', '2023-10-21 23:33:41', 1, 1),
(5, 2, 3, '2023-10-21 23:34:07', '2023-10-21 23:34:07', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` mediumtext NOT NULL,
  `api_token` char(60) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `api_token`, `created_at`, `updated_at`) VALUES
(1, 'nvn1', '$2y$10$DkhqScMI/c4QMrTMer2x9efUsxtG.n5KP8NlHd3r43cRUj/eHLVVq', 'n71BFxBBIsnTUETqDCo5cQ68IF0OuuvSPF5X5Jk3QuIEdwLJcfmoaOhWOhzY', '2022-12-23 01:02:06', '2024-02-05 15:25:20'),
(3, 'nvn2', '$2y$10$uvUri7L4ZWV6tCIabDTNfOQGL6.CWwGUiCeX0s2A.lJd85CKI1iTS', '2', '2022-12-24 04:32:10', '2023-10-22 09:15:09'),
(16, '1', '$2y$10$rZVX255t4NPvzB1nDiy2Fuwt3Eh2D7aknNALwxQm4rxFo83Vw6hzS', 'B4hxXRmJSibADpAUUocnbxmhiZ3Tswbbx04bmaxEBUnKi7UpeoyjfyYgYe1y', '2024-01-17 09:33:34', '2024-01-17 09:33:34'),
(17, '10', '$2y$10$ToUoGA1Nz2AooK9V64d6A.jkvFvpOW4eBj5R.BKMchE.JMhKvBeY.', 'ijuff2n9iqs2jqfqUgV0lD5Fj13Ahgq2MlsuJahmTPcI4Q0tsV1NawMy5ezE', '2024-01-17 10:14:48', '2024-01-17 10:14:48'),
(18, '11', '$2y$10$TX2nt7X6XEGg7MMQ2uuyWOfju35hb/rVWhW.0krK8VmZhfKfHyWb.', 'e8CPAhAjf2E1xQrDNkyjtaHi6doRewNXtXLpKgX7wl7BRLcpUydZoCMWjAhl', '2024-01-17 10:15:37', '2024-01-17 10:15:37'),
(19, '12', '$2y$10$XcKKJ9I9eGkZm1wUlz816OFUleRVZO7mFcse5KovvMB9I7KBzol0y', 'YwyWydBvfNTAgFZxN64w1q7bwO26d72UM7p2YhCZPJDvOpGEQGApdVamvd32', '2024-01-17 10:16:23', '2024-01-18 09:57:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `event_other_versions`
--
ALTER TABLE `event_other_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `event_other_versions_ibfk_1` (`tag_id`);

--
-- Indexes for table `event_tags`
--
ALTER TABLE `event_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `roles_users`
--
ALTER TABLE `roles_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `api_token` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `event_other_versions`
--
ALTER TABLE `event_other_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `event_tags`
--
ALTER TABLE `event_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles_users`
--
ALTER TABLE `roles_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`tag_id`) REFERENCES `event_tags` (`id`);

--
-- Constraints for table `event_other_versions`
--
ALTER TABLE `event_other_versions`
  ADD CONSTRAINT `event_other_versions_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `event_tags` (`id`),
  ADD CONSTRAINT `event_other_versions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `event_other_versions_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `event_tags`
--
ALTER TABLE `event_tags`
  ADD CONSTRAINT `event_tags_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `event_tags_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `roles_users_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `roles_users_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
