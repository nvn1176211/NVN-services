-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 01, 2024 at 03:06 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21952164_nvn`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `votes` int(10) UNSIGNED NOT NULL,
  `thumbnail` varchar(1000) DEFAULT NULL,
  `content` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `name`, `votes`, `thumbnail`, `content`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'World War II', 1, 'https://live.staticflickr.com/65535/53317112738_0b276efde9_z.jpg', '<p><strong>World War&nbsp;II</strong> or the <strong>Second World War</strong> was a <a href=\"https://en.wikipedia.org/wiki/World_war\">global conflict</a> that lasted from 1939 to 1945. The <a href=\"https://en.wikipedia.org/wiki/World_War_II_by_country\">vast majority of the world\'s countries</a>, including all the <a href=\"https://en.wikipedia.org/wiki/Great_power\">great powers</a>, fought as part of two opposing <a href=\"https://en.wikipedia.org/wiki/Military_alliance\">military alliances</a>: the <a href=\"https://en.wikipedia.org/wiki/Allies_of_World_War_II\">Allies</a> and the <a href=\"https://en.wikipedia.org/wiki/Axis_powers\">Axis</a>. Many participating countries invested all available economic, industrial, and scientific capabilities into this <a href=\"https://en.wikipedia.org/wiki/Total_war\">total war</a>, blurring the distinction between civilian and military resources. <a href=\"https://en.wikipedia.org/wiki/Air_warfare_of_World_War_II\">Aircraft played a major role</a>, enabling the <a href=\"https://en.wikipedia.org/wiki/Strategic_bombing\">strategic bombing</a> of population centres and delivery of the <a href=\"https://en.wikipedia.org/wiki/Atomic_bombings_of_Hiroshima_and_Nagasaki\">only two nuclear weapons</a> ever used in war. It was by far the <a href=\"https://en.wikipedia.org/wiki/List_of_wars_by_death_toll\">deadliest conflict</a> in history, resulting in <a href=\"https://en.wikipedia.org/wiki/World_War_II_casualties\">70–85 million fatalities</a>. Millions died due to <a href=\"https://en.wikipedia.org/wiki/Genocides\">genocides</a>, including <a href=\"https://en.wikipedia.org/wiki/The_Holocaust\">the Holocaust</a>, as well as starvation, massacres, and disease. In the wake of Axis defeat, <a href=\"https://en.wikipedia.org/wiki/Allied-occupied_Germany\">Germany</a>, <a href=\"https://en.wikipedia.org/wiki/Allied-occupied_Austria\">Austria</a>, and <a href=\"https://en.wikipedia.org/wiki/Occupation_of_Japan\">Japan were occupied</a>, and <a href=\"https://en.wikipedia.org/wiki/War_crimes_in_World_War_II\">war crime</a> tribunals were conducted <a href=\"https://en.wikipedia.org/wiki/Nuremberg_trials\">against German</a> and <a href=\"https://en.wikipedia.org/wiki/International_Military_Tribunal_for_the_Far_East\">Japanese leaders</a>.</p><p>The <a href=\"https://en.wikipedia.org/wiki/Causes_of_World_War_II\">causes of the war</a> are debated; contributing factors included the rise of <a href=\"https://en.wikipedia.org/wiki/Fascism_in_Europe\">fascism in Europe</a>, the <a href=\"https://en.wikipedia.org/wiki/Spanish_Civil_War\">Spanish Civil War</a>, the <a href=\"https://en.wikipedia.org/wiki/Second_Sino-Japanese_War\">Second Sino-Japanese War</a>, <a href=\"https://en.wikipedia.org/wiki/Soviet%E2%80%93Japanese_border_conflicts\">Soviet–Japanese border conflicts</a>, and tensions in the <a href=\"https://en.wikipedia.org/wiki/Aftermath_of_World_War_I\">aftermath of World War I</a>. World War&nbsp;II is generally considered to have begun on 1 September 1939, when <a href=\"https://en.wikipedia.org/wiki/Nazi_Germany\">Nazi Germany</a>, under <a href=\"https://en.wikipedia.org/wiki/Adolf_Hitler\">Adolf Hitler</a>, <a href=\"https://en.wikipedia.org/wiki/Invasion_of_Poland\">invaded Poland</a>. The <a href=\"https://en.wikipedia.org/wiki/United_Kingdom_declaration_of_war_on_Germany_(1939)\">United Kingdom</a> and <a href=\"https://en.wikipedia.org/wiki/French_declaration_of_war_on_Germany_(1939)\">France</a> <a href=\"https://en.wikipedia.org/wiki/Declaration_of_war\">declared war</a> on Germany on 3 September. Under the <a href=\"https://en.wikipedia.org/wiki/Molotov%E2%80%93Ribbentrop_Pact\">Molotov–Ribbentrop Pact</a> of August 1939, Germany and the <a href=\"https://en.wikipedia.org/wiki/Soviet_Union\">Soviet Union</a> had partitioned <a href=\"https://en.wikipedia.org/wiki/Second_Polish_Republic\">Poland</a> and marked out their \"<a href=\"https://en.wikipedia.org/wiki/Sphere_of_influence\">spheres of influence</a>\" across <a href=\"https://en.wikipedia.org/wiki/Winter_War\">Finland</a>, <a href=\"https://en.wikipedia.org/wiki/Occupation_of_the_Baltic_states\">Estonia, Latvia, Lithuania</a>, and <a href=\"https://en.wikipedia.org/wiki/Soviet_occupation_of_Bessarabia_and_Northern_Bukovina\">Romania</a>. From late 1939 to early 1941, in a series of <a href=\"https://en.wikipedia.org/wiki/Military_campaign\">campaigns</a> and <a href=\"https://en.wikipedia.org/wiki/Tripartite_Pact\">treaties</a>, Germany conquered or controlled much of <a href=\"https://en.wikipedia.org/wiki/Continental_Europe\">continental Europe</a> in a military alliance called the Axis with <a href=\"https://en.wikipedia.org/wiki/Fascist_Italy_(1922%E2%80%931943)\">Italy</a>, <a href=\"https://en.wikipedia.org/wiki/Empire_of_Japan\">Japan</a>, and other countries. Following the onset of campaigns in <a href=\"https://en.wikipedia.org/wiki/Western_Desert_campaign\">North</a> and <a href=\"https://en.wikipedia.org/wiki/East_African_campaign_(World_War_II)\">East Africa</a>, and the <a href=\"https://en.wikipedia.org/wiki/Battle_of_France\">fall of France</a> in mid-1940, the war continued primarily between the European Axis powers and the <a href=\"https://en.wikipedia.org/wiki/British_Empire\">British Empire</a>, with the war in the <a href=\"https://en.wikipedia.org/wiki/Balkans_campaign_(World_War_II)\">Balkans</a>, the aerial <a href=\"https://en.wikipedia.org/wiki/Battle_of_Britain\">Battle of Britain</a>, <a href=\"https://en.wikipedia.org/wiki/The_Blitz\">the Blitz</a> of the UK, and the <a href=\"https://en.wikipedia.org/wiki/Battle_of_the_Atlantic\">Battle of the Atlantic</a>. In June 1941, Germany led the European Axis powers in <a href=\"https://en.wikipedia.org/wiki/Operation_Barbarossa\">an invasion of the Soviet Union</a>, opening the <a href=\"https://en.wikipedia.org/wiki/Eastern_Front_(World_War_II)\">Eastern Front</a>, the largest land <a href=\"https://en.wikipedia.org/wiki/Theatre_of_war\">theatre of war</a> in history.</p><p>Japan aimed to <a href=\"https://en.wikipedia.org/wiki/Greater_East_Asia_Co-Prosperity_Sphere\">dominate East Asia and the Asia-Pacific</a>, and by 1937 was at war with the <a href=\"https://en.wikipedia.org/wiki/Republic_of_China_(1912%E2%80%931949)\">Republic of China</a>. In December 1941, Japan attacked American and British territories with near-simultaneous <a href=\"https://en.wikipedia.org/wiki/Pacific_War#Japanese_offensives,_1941%E2%80%9342\">offensives against Southeast Asia and the Central Pacific</a>, including an <a href=\"https://en.wikipedia.org/wiki/Attack_on_Pearl_Harbor\">attack on Pearl Harbor</a> which resulted in the United States and the United Kingdom declaring war against Japan. The <a href=\"https://en.wikipedia.org/wiki/German_declaration_of_war_against_the_United_States\">European Axis powers declared war on the US</a> in solidarity. <a href=\"https://en.wikipedia.org/wiki/Pacific_War\">Japan soon conquered much of the western Pacific</a>, but its advances were halted in 1942 after losing the critical <a href=\"https://en.wikipedia.org/wiki/Battle_of_Midway\">Battle of Midway</a>; Germany and Italy were <a href=\"https://en.wikipedia.org/wiki/Tunisian_campaign\">defeated in North Africa</a> and at <a href=\"https://en.wikipedia.org/wiki/Battle_of_Stalingrad\">Stalingrad</a> in the Soviet Union. Key setbacks in 1943—including German defeats on the Eastern Front, the <a href=\"https://en.wikipedia.org/wiki/Allied_invasion_of_Sicily\">Allied invasions of Sicily</a> and the <a href=\"https://en.wikipedia.org/wiki/Allied_invasion_of_Italy\">Italian mainland</a>, and Allied offensives in the Pacific—cost the Axis powers their initiative and forced them into strategic retreat on all fronts. In 1944, the Western Allies <a href=\"https://en.wikipedia.org/wiki/Normandy_landings\">invaded German-occupied France</a>, while the Soviet Union <a href=\"https://en.wikipedia.org/wiki/Stalin%27s_ten_blows\">regained its territorial losses</a> and pushed Germany and its allies back. During 1944–1945, Japan suffered reversals in mainland Asia, while the Allies crippled the <a href=\"https://en.wikipedia.org/wiki/Imperial_Japanese_Navy\">Japanese Navy</a> and captured key western Pacific islands. The war in Europe concluded with the liberation of <a href=\"https://en.wikipedia.org/wiki/German-occupied_Europe\">German-occupied territories</a>; the <a href=\"https://en.wikipedia.org/wiki/Western_Allied_invasion_of_Germany\">invasion of Germany by the Western Allies</a> and the Soviet Union, culminating in the <a href=\"https://en.wikipedia.org/wiki/Battle_of_Berlin\">Fall of Berlin</a> to Soviet troops; <a href=\"https://en.wikipedia.org/wiki/Death_of_Adolf_Hitler\">Hitler\'s suicide</a>; and the German <a href=\"https://en.wikipedia.org/wiki/German_Instrument_of_Surrender\">unconditional surrender</a> on <a href=\"https://en.wikipedia.org/wiki/Victory_in_Europe_Day\">8 May 1945</a>. Following the refusal of Japan to surrender on the terms of the <a href=\"https://en.wikipedia.org/wiki/Potsdam_Declaration\">Potsdam Declaration</a>, the US <a href=\"https://en.wikipedia.org/wiki/Atomic_bombings_of_Hiroshima_and_Nagasaki\">dropped the first atomic bombs</a> on <a href=\"https://en.wikipedia.org/wiki/Hiroshima\">Hiroshima</a> on 6&nbsp;August and <a href=\"https://en.wikipedia.org/wiki/Nagasaki\">Nagasaki</a> on 9&nbsp;August. Faced with imminent <a href=\"https://en.wikipedia.org/wiki/Operation_Downfall\">invasion of the Japanese archipelago</a>, the possibility of more atomic bombings, and the Soviet Union\'s <a href=\"https://en.wikipedia.org/wiki/Soviet%E2%80%93Japanese_War\">declared entry</a> into the war against Japan on the eve of <a href=\"https://en.wikipedia.org/wiki/Soviet_invasion_of_Manchuria\">invading Manchuria</a>, Japan announced on 10 August its intention to surrender, signing <a href=\"https://en.wikipedia.org/wiki/Japanese_Instrument_of_Surrender\">a surrender document</a> on <a href=\"https://en.wikipedia.org/wiki/Victory_over_Japan_Day\">2 September 1945</a>.</p><p>World War&nbsp;II changed the political alignment and social structure of the world, and it set the foundation for the international order for the rest of the 20th century and into the 21st century. The <a href=\"https://en.wikipedia.org/wiki/United_Nations\">United Nations</a> was established to foster international cooperation and prevent conflicts, with the victorious great powers—China, France, the Soviet Union, the UK, and the US—becoming the <a href=\"https://en.wikipedia.org/wiki/Permanent_members_of_the_United_Nations_Security_Council\">permanent members</a> of its <a href=\"https://en.wikipedia.org/wiki/United_Nations_Security_Council\">Security Council</a>. The Soviet Union and the United States emerged as rival <a href=\"https://en.wikipedia.org/wiki/Superpower\">superpowers</a>, setting the stage for the <a href=\"https://en.wikipedia.org/wiki/Cold_War\">Cold War</a>. In the wake of European devastation, the influence of its great powers waned, triggering the <a href=\"https://en.wikipedia.org/wiki/Decolonisation_of_Africa\">decolonisation of Africa</a> and <a href=\"https://en.wikipedia.org/wiki/Decolonisation_of_Asia\">Asia</a>. Most countries whose industries had been damaged moved towards <a href=\"https://en.wikipedia.org/wiki/Post%E2%80%93World_War_II_economic_expansion\">economic recovery and expansion</a>.</p>', 1, 1, '2024-03-06 09:39:16', '2024-03-06 09:39:16'),
(2, 'World War I', 2, 'https://live.staticflickr.com/65535/53317226249_cfd0651d0f_z.jpg', '<p><strong>World War I</strong> or the <strong>First World War</strong> (28 July 1914 – 11 November 1918) was a <a href=\"https://en.wikipedia.org/wiki/World_war\">global conflict</a> fought between two coalitions: the <a href=\"https://en.wikipedia.org/wiki/Allies_of_World_War_I\">Allies</a> and the <a href=\"https://en.wikipedia.org/wiki/Central_Powers\">Central Powers</a>. Battles took place throughout <a href=\"https://en.wikipedia.org/wiki/European_theatre_of_World_War_I\">Europe</a>, the <a href=\"https://en.wikipedia.org/wiki/Middle_Eastern_theatre_of_World_War_I\">Middle East</a>, <a href=\"https://en.wikipedia.org/wiki/African_theatre_of_World_War_I\">Africa</a>, the <a href=\"https://en.wikipedia.org/wiki/Asian_and_Pacific_theatre_of_World_War_I\">Pacific</a>, and parts of <a href=\"https://en.wikipedia.org/wiki/Asian_and_Pacific_theatre_of_World_War_I\">Asia</a>. One of the <a href=\"https://en.wikipedia.org/wiki/List_of_anthropogenic_disasters_by_death_toll\">deadliest wars in history</a>, it resulted in an estimated nine million soldiers dead and 23&nbsp;million wounded, and over eight&nbsp;million civilian deaths from numerous causes including <a href=\"https://en.wikipedia.org/wiki/Genocides_in_history_(World_War_I_through_World_War_II)\">genocide</a>. The war was a major factor in the 1918 <a href=\"https://en.wikipedia.org/wiki/Spanish_flu\">Spanish flu</a> pandemic.</p><p>Increasing diplomatic tensions between the European great powers reached a <a href=\"https://en.wikipedia.org/wiki/July_Crisis\">breaking point</a> on 28 June 1914, when a <a href=\"https://en.wikipedia.org/wiki/Serbs_of_Bosnia_and_Herzegovina\">Bosnian Serb</a> named <a href=\"https://en.wikipedia.org/wiki/Gavrilo_Princip\">Gavrilo Princip</a> <a href=\"https://en.wikipedia.org/wiki/Assassination_of_Archduke_Franz_Ferdinand\">assassinated Archduke Franz Ferdinand</a>, heir to the <a href=\"https://en.wikipedia.org/wiki/Austria-Hungary\">Austro-Hungarian</a> throne. Austria-Hungary held <a href=\"https://en.wikipedia.org/wiki/Kingdom_of_Serbia\">Serbia</a> responsible, and declared war on 28 July. <a href=\"https://en.wikipedia.org/wiki/Russian_Empire\">Russia</a> came to Serbia\'s defence, and by 4 August, <a href=\"https://en.wikipedia.org/wiki/German_Empire\">Germany</a>, <a href=\"https://en.wikipedia.org/wiki/French_Third_Republic\">France</a>, and <a href=\"https://en.wikipedia.org/wiki/United_Kingdom_of_Great_Britain_and_Ireland\">Britain</a> were drawn into the war, with the <a href=\"https://en.wikipedia.org/wiki/Ottoman_Empire\">Ottoman Empire</a> joining in November of the same year. <a href=\"https://en.wikipedia.org/wiki/Schlieffen_Plan\">Germany\'s strategy in 1914</a> was to first defeat France, then transfer forces to the Russian front. However, this <a href=\"https://en.wikipedia.org/wiki/First_Battle_of_the_Marne\">failed</a>, and by the end of 1914, the <a href=\"https://en.wikipedia.org/wiki/Western_Front_(World_War_I)\">Western Front</a> consisted of a continuous line of <a href=\"https://en.wikipedia.org/wiki/Trench_warfare\">trenches</a> stretching from the <a href=\"https://en.wikipedia.org/wiki/English_Channel\">English Channel</a> to <a href=\"https://en.wikipedia.org/wiki/Switzerland_during_the_World_Wars\">Switzerland</a>. The <a href=\"https://en.wikipedia.org/wiki/Eastern_Front_(World_War_I)\">Eastern Front</a> was more dynamic, but neither side could gain a decisive advantage, despite costly offensives. As the war expanded to more fronts, <a href=\"https://en.wikipedia.org/wiki/Bulgaria_during_World_War_I\">Bulgaria</a>, <a href=\"https://en.wikipedia.org/wiki/Military_history_of_Italy_during_World_War_I\">Italy</a>, <a href=\"https://en.wikipedia.org/wiki/Romania_in_World_War_I\">Romania</a>, <a href=\"https://en.wikipedia.org/wiki/Greece_during_World_War_I\">Greece</a> and others joined in from 1915 onward.</p><p>In early 1917, the <a href=\"https://en.wikipedia.org/wiki/American_entry_into_World_War_I\">United States entered the war</a> on the Allies\' side, and later the same year, the <a href=\"https://en.wikipedia.org/wiki/Bolsheviks\">Bolsheviks</a> seized power in the Russian <a href=\"https://en.wikipedia.org/wiki/October_Revolution\">October Revolution</a>, making <a href=\"https://en.wikipedia.org/wiki/Treaty_of_Brest-Litovsk\">peace</a> with the Central Powers in early 1918. Germany launched an <a href=\"https://en.wikipedia.org/wiki/German_spring_offensive\">offensive</a> in the west in March 1918, and despite initial successes, it left the <a href=\"https://en.wikipedia.org/wiki/Imperial_German_Army\">German Army</a> exhausted and demoralised. A successful Allied <a href=\"https://en.wikipedia.org/wiki/Hundred_Days_Offensive\">counter-offensive</a> later that year caused a collapse of the German frontline. By the end of 1918, Bulgaria, the Ottoman Empire and Austria-Hungary agreed to armistices with the Allies, leaving Germany isolated. Facing <a href=\"https://en.wikipedia.org/wiki/German_Revolution_of_1918%E2%80%931919\">revolution</a> at home and with his army on the verge of mutiny, <a href=\"https://en.wikipedia.org/wiki/Wilhelm_II,_German_Emperor\">Kaiser Wilhelm&nbsp;II</a> abdicated on 9 November.</p><p>The fighting ended with the <a href=\"https://en.wikipedia.org/wiki/Armistice_of_11_November_1918\">Armistice of 11 November 1918</a>, while the subsequent <a href=\"https://en.wikipedia.org/wiki/Paris_Peace_Conference_(1919%E2%80%931920)\">Paris Peace Conference</a> imposed various settlements on the defeated powers, notably the <a href=\"https://en.wikipedia.org/wiki/Treaty_of_Versailles\">Treaty of Versailles</a>. The dissolution of the Russian, German, Austro-Hungarian, and Ottoman Empires resulted in the creation of new independent states, including <a href=\"https://en.wikipedia.org/wiki/Second_Polish_Republic\">Poland</a>, <a href=\"https://en.wikipedia.org/wiki/Finland\">Finland</a>, <a href=\"https://en.wikipedia.org/wiki/First_Czechoslovak_Republic\">Czechoslovakia</a>, and <a href=\"https://en.wikipedia.org/wiki/Kingdom_of_Yugoslavia\">Yugoslavia</a>. The inability to manage <a href=\"https://en.wikipedia.org/wiki/Interwar_period\">post-war instability</a> <a href=\"https://en.wikipedia.org/wiki/Causes_of_World_War_II\">contributed</a> to the outbreak of <a href=\"https://en.wikipedia.org/wiki/World_War_II\">World War&nbsp;II</a> in September 1939.</p>', 1, 2, '2024-03-06 10:30:08', '2024-03-11 18:15:58'),
(7, 'A professional sumo bout', 1, 'https://live.staticflickr.com/65535/53627111673_b8639ef600_o.jpg', '<figure class=\"image image_resized image-style-side\" style=\"width:25.38%;\"><img style=\"aspect-ratio:1280/853;\" src=\"https://live.staticflickr.com/65535/53627094598_7ecbb42520_o.jpg\" width=\"1280\" height=\"853\"><figcaption>Sumo wrestlers at the Grand Tournament in <a href=\"https://en.wikipedia.org/wiki/Osaka\">Osaka</a>, March 2006</figcaption></figure><p>At the initial charge, both wrestlers must jump up from the <a href=\"https://en.wikipedia.org/wiki/Squatting_position\">crouch</a> simultaneously after touching the surface of the ring with two fists at the start of the bout. The referee (<i>gyōji</i>) can restart the bout if this simultaneous touch does not occur.</p><p>Upon completion of the bout, the referee must immediately designate his decision by pointing his <a href=\"https://en.wikipedia.org/wiki/Gunbai\"><i>gunbai</i></a> or war-fan towards the winning side. The winning technique (<a href=\"https://en.wikipedia.org/wiki/Kimarite\"><i>kimarite</i></a>) used by the winner would then be announced to the audience. The wrestlers then return to their starting positions and bow to each other before retiring.</p><p>The referee\'s decision is not final and may be disputed by the five <a href=\"https://en.wikipedia.org/wiki/Judge_(sumo)\">judges</a> seated around the ring. If this happens, they meet in the center of the ring to hold a <i>mono-ii</i> (a talk about things). After reaching a consensus, they can uphold or reverse the referee\'s decision or order a rematch, known as a <a href=\"https://en.wikipedia.org/wiki/Torinaoshi\"><i>torinaoshi</i></a>.</p><p>A winning wrestler in the top division may receive additional prize money in envelopes from the referee if the matchup has been sponsored. If a <i>yokozuna </i>is defeated by a lower-ranked wrestler, it is common and expected for audience members to throw their seat cushions into the ring (and onto the wrestlers), though this practice is technically prohibited.</p><p>In contrast to the time in bout preparation, bouts are typically very short, usually less than a minute (most of the time only a few seconds). Extremely rarely, a bout can go on for several minutes.</p><figure class=\"media\"><div data-oembed-url=\"https://www.youtube.com/watch?v=NN2ZRWusYZo\"><div style=\"position: relative; padding-bottom: 100%; height: 0; padding-bottom: 56.2493%;\"><iframe src=\"https://www.youtube.com/embed/NN2ZRWusYZo\" style=\"position: absolute; width: 100%; height: 100%; top: 0; left: 0;\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe></div></div></figure>', 4, 4, '2024-04-02 16:26:49', '2024-04-02 16:26:49'),
(8, 'How to disable push messages on Samsung cell phones?', 1, 'https://live.staticflickr.com/65535/53692083630_71fd1fe1be_o.jpg', '<figure class=\"image image_resized\" style=\"width:21.61%;\"><img style=\"aspect-ratio:449/685;\" src=\"https://live.staticflickr.com/65535/53690747287_908e80e964_o.jpg\" width=\"449\" height=\"685\"></figure><h4>What Are Push Messages?</h4><p>A push(pop-up) message is a type of message displayed on the home screen or lock screen even when you’re not using an app. It contains content such as advertisements, news or information introducing network service packages. Push messages from carriers Viettel, VinaPhone and MobiFone are currently very popular. It makes users feel uncomfortable because it keeps the screen bright and consumes a lot of battery.</p><h4>How To Disable Push Messages?</h4><p>Go to <strong>Settings</strong> &gt; <strong>Apps</strong>, then turn off <strong>Show as pop-up</strong>. Make sure you apply this setting for some apps like Messages and SIM toolkit.</p><figure class=\"image image_resized\" style=\"width:42.03%;\"><img style=\"aspect-ratio:1200/2000;\" src=\"https://live.staticflickr.com/65535/53692074620_b70204979a_o.jpg\" width=\"1200\" height=\"2000\"></figure>', 2, 2, '2024-05-01 21:59:45', '2024-05-01 22:02:40');

-- --------------------------------------------------------

--
-- Table structure for table `article_votes`
--

CREATE TABLE `article_votes` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article_votes`
--

INSERT INTO `article_votes` (`id`, `article_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024-03-07 10:25:25', '2024-03-07 10:25:25'),
(2, 2, 1, 1, '2024-03-07 10:25:25', '2024-03-07 10:25:25'),
(12, 7, 4, 4, '2024-04-02 16:26:49', '2024-04-02 16:26:49'),
(13, 8, 2, 2, '2024-05-01 21:59:45', '2024-05-01 21:59:45');

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `content` mediumtext NOT NULL,
  `votes` int(11) UNSIGNED NOT NULL,
  `thumbnail` varchar(1000) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`id`, `name`, `content`, `votes`, `thumbnail`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(5, 'What\'s so \"dangerous\" about C/C++?', '<p>C++ beginner (not a developer, just someone who codes for fun)</p><p>Since the announcement from the US government that developer should use memory safe languages (I think they referenced Rust and C# as examples), I\'m seeing articles constantly about the topics. My question is: why are C/C++ \"dangerous\"? From what I know, if I use new/alloc and delete/free on everything I create I create on the heap there should be no problems right?</p><p>If it\'s beyond that, could someone explain it? What are the other potential pitfalls with C/C++ programming?</p>', 1, '', 3, 3, '2024-03-31 21:52:04', '2024-03-31 21:52:04'),
(6, 'Messi at Publix', '<p>A sight id never thought I’d see</p><figure class=\"image image_resized\" style=\"width:62.46%;\"><img style=\"aspect-ratio:1980/1320;\" src=\"https://live.staticflickr.com/65535/53624242467_744d840d6b_o.jpg\" width=\"1980\" height=\"1320\"></figure>', 1, 'https://live.staticflickr.com/65535/53625466584_622806e2b0_o.jpg', 1, 1, '2024-04-01 21:38:29', '2024-04-01 21:38:29'),
(13, 'Web standards for the future', '<figure class=\"media\"><div data-oembed-url=\"https://www.youtube.com/watch?v=2_Si-iD8ZRQ\"><div style=\"position: relative; padding-bottom: 100%; height: 0; padding-bottom: 56.2493%;\"><iframe src=\"https://www.youtube.com/embed/2_Si-iD8ZRQ\" style=\"position: absolute; width: 100%; height: 100%; top: 0; left: 0;\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe></div></div></figure>', 1, '', 4, 4, '2024-04-02 16:03:28', '2024-04-02 16:03:28');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_votes`
--

CREATE TABLE `discussion_votes` (
  `id` int(11) NOT NULL,
  `discussion_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discussion_votes`
--

INSERT INTO `discussion_votes` (`id`, `discussion_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(9, 5, 3, 3, '2024-03-31 21:52:04', '2024-03-31 21:52:04'),
(10, 6, 1, 1, '2024-04-01 21:38:29', '2024-04-01 21:38:29'),
(17, 13, 4, 4, '2024-04-02 16:03:28', '2024-04-02 16:03:28');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `votes` int(10) UNSIGNED NOT NULL,
  `thumbnail` mediumtext NOT NULL,
  `year` int(11) NOT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `tag_id`, `votes`, `thumbnail`, `year`, `month`, `day`, `content`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(4, 4, 1, 'https://live.staticflickr.com/65535/53316005192_ff1413bebf_z.jpg', 1990, 8, 2, 'The Gulf War was a 1990–1991 armed campaign waged by a 35-country military coalition in response to the Iraqi invasion of Kuwait. Spearheaded by the United States, the coalition\'s efforts against Iraq were carried out in two key phases: Operation Desert Shield, which marked the military buildup from August 1990 to January 1991; and Operation Desert Storm, which began with the aerial bombing campaign against Iraq on 17 January 1991 and came to a close with the American-led Liberation of Kuwait on 28 February 1991.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(6, 6, 1, 'https://live.staticflickr.com/65535/53317112838_cdd9354513_z.jpg', 2014, 2, 27, 'In February and March 2014, Russia invaded and subsequently annexed the Crimean Peninsula from Ukraine. This event took place in the aftermath of the Revolution of Dignity and is part of the wider Russo-Ukrainian War.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(15, 14, 1, 'https://live.staticflickr.com/65535/53316005472_296b7a63ce_z.jpg', 2003, 3, 20, 'The Iraq War was a protracted armed conflict in Iraq from 2003 to 2011 that began with the invasion of Iraq by the United States-led coalition that overthrew the Iraqi government of Saddam Hussein. The conflict continued for much of the next decade as an insurgency emerged to oppose the coalition forces and the post-invasion Iraqi government. US troops were officially withdrawn in 2011. The United States became re-involved in 2014 at the head of a new coalition, and the insurgency and many dimensions of the armed conflict continue today. The invasion occurred as part of the George W. Bush administration\'s War on terror following the September 11 attacks, despite no connection between Iraq and the attacks.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(18, 17, 1, 'https://live.staticflickr.com/65535/53316005457_5c1c0155cc_z.jpg', 1998, 2, 28, 'The Kosovo War was an armed conflict in Kosovo that started 28 February 1998 and lasted until 11 June 1999. It was fought by the forces of the Federal Republic of Yugoslavia (i.e. Serbia and Montenegro), which controlled Kosovo before the war, and the Kosovo Albanian rebel group known as the Kosovo Liberation Army (KLA). The conflict ended when the North Atlantic Treaty Organization (NATO) intervened by beginning air strikes in March 1999 which resulted in Yugoslav forces withdrawing from Kosovo.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(20, 19, 1, 'https://live.staticflickr.com/65535/53317226089_69925b4491_c.jpg', 1992, 4, 6, 'The Bosnian War (Serbo-Croatian: Rat u Bosni i Hercegovini / Рат у Босни и Херцеговини) was an international armed conflict that took place in Bosnia and Herzegovina between 1992 and 1995. The war is commonly seen as having started on 6 April 1992, following a number of earlier violent incidents. The war ended on 14 December 1995 when the Dayton accords were signed. The main belligerents were the forces of the Republic of Bosnia and Herzegovina and those of Herzeg-Bosnia and Republika Srpska, proto-states led and supplied by Croatia and Serbia, respectively.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(21, 20, 1, 'https://live.staticflickr.com/65535/53317343490_b5aeebf30f_c.jpg', 1991, 3, 31, 'The Croatian War of Independence was fought from 1991 to 1995 between Croat forces loyal to the Government of Croatia—which had declared independence from the Socialist Federal Republic of Yugoslavia (SFRY)—and the Serb-controlled Yugoslav People\'s Army (JNA) and local Serb forces, with the JNA ending its combat operations in Croatia by 1992. In Croatia, the war is primarily referred to as the \"Homeland War\" (Croatian: Domovinski rat) and also as the \"Greater-Serbian Aggression\" (Croatian: Velikosrpska agresija). In Serbian sources, \"War in Croatia\" (Serbian Cyrillic: Рат у Хрватској, romanized: Rat u Hrvatskoj) and (rarely) \"War in Krajina\" (Serbian Cyrillic: Рат у Крајини, romanized: Rat u Krajini) are used.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(87, 5, 1, 'https://live.staticflickr.com/65535/53317112793_81b4d1c139_z.jpg', 2022, 2, 24, 'On 24 February 2022, Russia invaded Ukraine in a major escalation of the Russo-Ukrainian War, which began in 2014. The invasion has resulted in tens of thousands of deaths on both sides. It has caused Europe\'s largest refugee crisis since World War II. About 8 million Ukrainians were displaced within their country by late May, and 7.8 million fled the country by 8 November 2022; within five weeks of the invasion, Russia experienced its greatest emigration since the October Revolution, in 1917.', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(90, 2, 3, 'https://live.staticflickr.com/65535/53317112738_0b276efde9_z.jpg', 2024, 2, 5, 'World War II or the Second World War was a global conflict that lasted from 1939 to 1945. The vast majority of the world\'s countries, including all the great powers, fought as part of two opposing military alliances: the Allies and the Axis. Many participating countries invested all available economic, industrial, and scientific capabilities into this total war, blurring the distinction between civilian and military resources. Aircraft played a major role, enabling the strategic bombing of population centres and delivery of the only two nuclear weapons ever used in war. It was by far the deadliest conflict in history, resulting in 70–85 million fatalities. Millions died due to genocides, including the Holocaust, as well as starvation, massacres, and disease. In the wake of Axis defeat, Germany, Austria, and Japan were occupied, and war crime tribunals were conducted against German and Japanese leaders.\n\nThe causes of the war are debated; contributing factors included the rise of fascism in Europe, the Spanish Civil War, the Second Sino-Japanese War, Soviet–Japanese border conflicts, and tensions in the aftermath of World War I. World War II is generally considered to have begun on 1 September 1939, when Nazi Germany, under Adolf Hitler, invaded Poland. The United Kingdom and France declared war on Germany on 3 September. Under the Molotov–Ribbentrop Pact of August 1939, Germany and the Soviet Union had partitioned Poland and marked out their \"spheres of influence\" across Finland, Estonia, Latvia, Lithuania, and Romania. From late 1939 to early 1941, in a series of campaigns and treaties, Germany conquered or controlled much of continental Europe in a military alliance called the Axis with Italy, Japan, and other countries. Following the onset of campaigns in North and East Africa, and the fall of France in mid-1940, the war continued primarily between the European Axis powers and the British Empire, with the war in the Balkans, the aerial Battle of Britain, the Blitz of the UK, and the Battle of the Atlantic. In June 1941, Germany led the European Axis powers in an invasion of the Soviet Union, opening the Eastern Front, the largest land theatre of war in history.\n\nJapan aimed to dominate East Asia and the Asia-Pacific, and by 1937 was at war with the Republic of China. In December 1941, Japan attacked American and British territories with near-simultaneous offensives against Southeast Asia and the Central Pacific, including an attack on Pearl Harbor which resulted in the United States and the United Kingdom declaring war against Japan. The European Axis powers declared war on the US in solidarity. Japan soon conquered much of the western Pacific, but its advances were halted in 1942 after losing the critical Battle of Midway; Germany and Italy were defeated in North Africa and at Stalingrad in the Soviet Union. Key setbacks in 1943—including German defeats on the Eastern Front, the Allied invasions of Sicily and the Italian mainland, and Allied offensives in the Pacific—cost the Axis powers their initiative and forced them into strategic retreat on all fronts. In 1944, the Western Allies invaded German-occupied France, while the Soviet Union regained its territorial losses and pushed Germany and its allies back. During 1944–1945, Japan suffered reversals in mainland Asia, while the Allies crippled the Japanese Navy and captured key western Pacific islands. The war in Europe concluded with the liberation of German-occupied territories; the invasion of Germany by the Western Allies and the Soviet Union, culminating in the Fall of Berlin to Soviet troops; Hitler\'s suicide; and the German unconditional surrender on 8 May 1945. Following the refusal of Japan to surrender on the terms of the Potsdam Declaration, the US dropped the first atomic bombs on Hiroshima on 6 August and Nagasaki on 9 August. Faced with imminent invasion of the Japanese archipelago, the possibility of more atomic bombings, and the Soviet Union\'s declared entry into the war against Japan on the eve of invading Manchuria, Japan announced on 10 August its intention to surrender, signing a surrender document on 2 September 1945.', '2024-02-05 15:44:22', 1, '2024-02-28 13:14:24', 1),
(93, 16, 1, 'https://live.staticflickr.com/65535/53316871876_d5d7ae1436_z.jpg', 2001, 10, 7, 'The War in Afghanistan was an armed conflict that began when an international military coalition led by the United States launched an invasion of Afghanistan, toppling the Taliban-ruled Islamic Emirate and establishing the internationally recognized Islamic Republic three years later. The conflict ultimately ended with the 2021 Taliban offensive, which overthrew the Islamic Republic, and re-established the Islamic Emirate. It was the longest war in the military history of the United States, surpassing the length of the Vietnam War (1955–1975) by approximately six months.\r\n', '2023-11-06 17:56:40', 1, '2023-11-06 17:56:40', 1),
(94, 1, 1, 'https://live.staticflickr.com/65535/53317226249_cfd0651d0f_z.jpg', 1914, 7, 28, 'World War I (28 July 1914 – 11 November 1918), often abbreviated as WWI, was one of the deadliest global conflicts in history. The main belligerents included much of Europe and their colonial empires, the Russian Empire, the United States, the Ottoman Empire and the Japanese Empire, with fighting occurring throughout Europe, the Middle East, Africa, the Pacific, and parts of Asia. An estimated 9 million soldiers were killed in combat, plus another 23 million wounded, while 5 million civilians died as a result of military action, hunger, and disease. Millions more died in genocides within the Ottoman Empire and in the 1918 influenza pandemic, which was exacerbated by the movement of combatants during the war.', '2023-10-18 17:10:25', 1, '2023-10-18 17:10:25', 1),
(98, 2, 1, 'https://live.staticflickr.com/65535/53511004804_616fd8c6dc_o.jpg', 2111, 1, 1, 'test1', '2024-02-16 08:19:45', 1, '2024-02-23 12:23:37', 1),
(99, 2, 2, 'https://live.staticflickr.com/65535/53511004804_616fd8c6dc_o.jpg', 2111, 1, 1, 'test2', '2024-02-16 08:20:45', 1, '2024-02-28 13:14:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_tags`
--

CREATE TABLE `event_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pages` int(10) UNSIGNED NOT NULL,
  `thumbnail` mediumtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_tags`
--

INSERT INTO `event_tags` (`id`, `name`, `pages`, `thumbnail`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'world war 1', 1, 'https://live.staticflickr.com/65535/53317226249_cfd0651d0f_z.jpg', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(2, 'world war 2', 3, 'https://live.staticflickr.com/65535/53317112738_0b276efde9_z.jpg', '2023-10-13 00:00:00', '2024-02-28 13:14:24', 1, 1),
(4, 'gulf war', 1, 'https://live.staticflickr.com/65535/53316005192_ff1413bebf_z.jpg', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(5, '2022 russia-ukraine ', 1, 'https://live.staticflickr.com/65535/53317112793_81b4d1c139_z.jpg', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(6, 'annexation of crimea', 1, 'https://live.staticflickr.com/65535/53317112838_cdd9354513_z.jpg', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(14, 'iraq war', 1, 'https://live.staticflickr.com/65535/53316005472_296b7a63ce_z.jpg', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(16, 'war in afghanistan', 1, 'https://live.staticflickr.com/65535/53316871876_d5d7ae1436_z.jpg', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(17, 'kosovo war', 1, 'https://live.staticflickr.com/65535/53316005457_5c1c0155cc_z.jpg', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(19, 'bosnian war', 1, 'https://live.staticflickr.com/65535/53317226089_69925b4491_c.jpg', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(20, 'croatian war of independence', 1, 'https://live.staticflickr.com/65535/53317343490_b5aeebf30f_c.jpg', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 1, 1),
(24, 'isarel-hamas war', 0, 'http://127.0.0.1:8000/api/cors_img?img_name=1709624745.jpg', '2024-03-05 14:42:51', '2024-03-05 14:46:24', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `file_uploads`
--

CREATE TABLE `file_uploads` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_uploads`
--

INSERT INTO `file_uploads` (`id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(46, 3, '2024-03-31 17:23:07', 3, '2024-03-31 17:23:07'),
(47, 3, '2024-03-31 17:52:43', 3, '2024-03-31 17:52:43'),
(48, 3, '2024-03-31 17:58:38', 3, '2024-03-31 17:58:38'),
(49, 3, '2024-03-31 18:00:07', 3, '2024-03-31 18:00:07'),
(50, 3, '2024-03-31 18:02:05', 3, '2024-03-31 18:02:05'),
(51, 3, '2024-03-31 18:16:48', 3, '2024-03-31 18:16:48'),
(52, 3, '2024-03-31 18:30:07', 3, '2024-03-31 18:30:07'),
(53, 1, '2024-04-01 21:26:31', 1, '2024-04-01 21:26:31'),
(54, 1, '2024-04-01 21:28:20', 1, '2024-04-01 21:28:20'),
(55, 1, '2024-04-01 21:28:37', 1, '2024-04-01 21:28:37'),
(56, 1, '2024-04-01 21:30:24', 1, '2024-04-01 21:30:24'),
(57, 1, '2024-04-01 21:31:21', 1, '2024-04-01 21:31:21'),
(58, 1, '2024-04-01 21:31:54', 1, '2024-04-01 21:31:54'),
(59, 1, '2024-04-01 21:32:11', 1, '2024-04-01 21:32:11'),
(60, 1, '2024-04-01 21:33:28', 1, '2024-04-01 21:33:28'),
(61, 1, '2024-04-01 21:34:51', 1, '2024-04-01 21:34:51'),
(62, 1, '2024-04-01 21:37:42', 1, '2024-04-01 21:37:42'),
(63, 1, '2024-04-01 21:40:01', 1, '2024-04-01 21:40:01'),
(64, 1, '2024-04-01 21:46:17', 1, '2024-04-01 21:46:17'),
(65, 1, '2024-04-01 21:55:26', 1, '2024-04-01 21:55:26'),
(66, 1, '2024-04-01 21:55:41', 1, '2024-04-01 21:55:41'),
(67, 1, '2024-04-01 21:56:26', 1, '2024-04-01 21:56:26'),
(68, 1, '2024-04-01 21:57:05', 1, '2024-04-01 21:57:05'),
(69, 4, '2024-04-02 16:13:03', 4, '2024-04-02 16:13:03'),
(70, 2, '2024-05-01 21:50:09', 2, '2024-05-01 21:50:09'),
(71, 2, '2024-05-01 21:50:53', 2, '2024-05-01 21:50:53'),
(72, 2, '2024-05-01 21:51:32', 2, '2024-05-01 21:51:32'),
(73, 2, '2024-05-01 21:52:47', 2, '2024-05-01 21:52:47'),
(74, 2, '2024-05-01 21:54:55', 2, '2024-05-01 21:54:55'),
(75, 2, '2024-05-01 21:55:48', 2, '2024-05-01 21:55:48');

-- --------------------------------------------------------

--
-- Table structure for table `opinions`
--

CREATE TABLE `opinions` (
  `id` int(11) NOT NULL,
  `discussion_id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `votes` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opinions`
--

INSERT INTO `opinions` (`id`, `discussion_id`, `content`, `votes`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(52, 5, '<p>Sometimes people make mistakes. Sometimes they don\'t allocate enough memory, and someone manages to enter a string that goes beyond the memory buffer and starts corrupting other data...</p>', 1, 2, 2, '2024-03-31 21:52:46', '2024-04-25 21:11:19'),
(54, 5, '<blockquote><p>From what I know, if I use new/alloc and delete/free on everything I create I create on the heap there should be no problems right?</p></blockquote><p>Just like we have no car accidents if people don\'t drive into things.</p><p>So why does not all driver just decide to not drive into things?</p><p>Programmers attempt to make good software but it is natural to make mistakes. Even if you have plenty of tests you can make mistakes which are not noticed. This is the point of using safe programming languages, when you have built in safety meassures, the risk of some mistakes are much lower.</p>', 2, 1, 2, '2024-03-31 21:58:40', '2024-04-17 20:16:56'),
(55, 6, '<p>It’s official, Messi’s a Floridian</p>', 2, 4, 2, '2024-04-02 15:29:15', '2024-05-01 21:14:00'),
(56, 5, '<p>Is learining Python gonna be enough for near future then?</p><p>I ask this because whenever I use python, I have to use different libraries to do almost anything, and those libraries are mostly written in C/C++ instead of Python itself.</p>', 1, 2, 2, '2024-04-17 20:19:10', '2024-05-01 21:11:09'),
(57, 6, '<p>Grabbing a pub sub. Man of culture</p>', 1, 2, 2, '2024-05-01 21:13:48', '2024-05-01 21:13:48');

-- --------------------------------------------------------

--
-- Table structure for table `opinion_votes`
--

CREATE TABLE `opinion_votes` (
  `id` int(11) NOT NULL,
  `opinion_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opinion_votes`
--

INSERT INTO `opinion_votes` (`id`, `opinion_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(59, 54, 1, 1, '2024-03-31 21:58:41', '2024-03-31 21:58:41'),
(60, 54, 2, 2, '2024-03-31 22:02:45', '2024-03-31 22:02:45'),
(61, 55, 4, 4, '2024-04-02 15:29:15', '2024-04-02 15:29:15'),
(62, 56, 2, 2, '2024-04-17 20:19:10', '2024-04-17 20:19:10'),
(63, 52, 2, 2, '2024-04-25 21:11:19', '2024-04-25 21:11:19'),
(64, 57, 2, 2, '2024-05-01 21:13:48', '2024-05-01 21:13:48'),
(65, 55, 2, 2, '2024-05-01 21:14:00', '2024-05-01 21:14:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles_users`
--

INSERT INTO `roles_users` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(3, 1, 1, '2023-10-21 23:33:09', '2023-10-21 23:33:09', 1, 1),
(4, 2, 1, '2023-10-21 23:33:41', '2023-10-21 23:33:41', 1, 1),
(5, 2, 3, '2023-10-21 23:34:07', '2023-10-21 23:34:07', 1, 1),
(7, 2, 2, '2024-04-09 14:58:48', '2024-04-09 14:58:48', 1, 1),
(8, 2, 4, '2024-04-09 14:58:48', '2024-04-09 14:58:48', 1, 1),
(9, 2, 16, '2024-04-09 14:58:48', '2024-04-09 14:58:48', 1, 1),
(10, 2, 18, '2024-04-09 14:58:48', '2024-04-09 14:58:48', 1, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `api_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$N.ohMl/ujoSQTjwAbfIvJ.RFb03tkFeFbA8l.LOcHj4bViQ.xAsLq', '54CvS3ICQKNw0cqBHwsoLl0AykhylC8NwfsYs6ZQAcgAJ6DYsKjcYBf7qQJn', '2022-12-23 01:02:06', '2024-04-17 20:06:00'),
(2, 'user1', '$2y$10$N.ohMl/ujoSQTjwAbfIvJ.RFb03tkFeFbA8l.LOcHj4bViQ.xAsLq', 'vmiRO2A75uEbUCvNnEr1g3CDnEuOBFghRglx92Scp8hrSrXcWN6kUPmO73Iw', '2024-01-17 10:16:23', '2024-04-25 21:12:11'),
(3, 'user2', '$2y$10$N.ohMl/ujoSQTjwAbfIvJ.RFb03tkFeFbA8l.LOcHj4bViQ.xAsLq', '2', '2022-12-24 04:32:10', '2023-10-22 09:15:09'),
(4, 'user3', '$2y$10$N.ohMl/ujoSQTjwAbfIvJ.RFb03tkFeFbA8l.LOcHj4bViQ.xAsLq', '3', '2024-01-17 10:14:48', '2024-01-17 10:14:48'),
(16, 'user4', '$2y$10$N.ohMl/ujoSQTjwAbfIvJ.RFb03tkFeFbA8l.LOcHj4bViQ.xAsLq', 'TKKVel0lh1yvxLBAzYxjBRHw0lVm43c5lpLgf7DizG0PCXgCfGScsxSlAuzw', '2024-01-17 09:33:34', '2024-03-08 17:26:03'),
(18, 'user5', '$2y$10$N.ohMl/ujoSQTjwAbfIvJ.RFb03tkFeFbA8l.LOcHj4bViQ.xAsLq', 'e8CPAhAjf2E1xQrDNkyjtaHi6doRewNXtXLpKgX7wl7BRLcpUydZoCMWjAhl', '2024-01-17 10:15:37', '2024-01-17 10:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `event_id`, `user_id`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(4, 99, 3, '2024-02-16 03:22:56', '2024-02-16 03:22:56', 1, 1),
(5, 90, 3, '2024-02-16 03:22:56', '2024-02-16 03:22:56', 3, 3),
(6, 98, 3, '2024-02-16 03:22:56', '2024-02-16 03:22:56', 3, 3),
(7, 90, 16, '2024-02-16 03:22:56', '2024-02-16 03:22:56', 16, 16),
(37, 99, 16, '2024-02-23 12:23:25', '2024-02-23 12:23:25', 1, 1),
(49, 4, 1, '2024-02-26 07:23:54', '2024-02-26 07:23:54', 16, 16),
(50, 6, 1, '2024-02-26 07:23:54', '2024-02-26 07:23:54', 1, 1),
(51, 15, 1, '2024-02-26 07:23:54', '2024-02-26 07:23:54', 1, 1),
(52, 18, 1, '2024-02-26 07:23:54', '2024-02-26 07:23:54', 1, 1),
(53, 20, 1, '2024-02-26 07:23:54', '2024-02-26 07:23:54', 1, 1),
(54, 21, 1, '2024-02-26 07:23:54', '2024-02-26 07:23:54', 1, 1),
(55, 87, 1, '2024-02-26 07:23:54', '2024-02-26 07:23:54', 1, 1),
(56, 93, 1, '2024-02-26 07:23:54', '2024-02-26 07:23:54', 1, 1),
(57, 94, 1, '2024-02-26 07:23:54', '2024-02-26 07:23:54', 1, 1),
(66, 90, 1, '2024-02-28 13:14:24', '2024-02-28 13:14:24', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_votes`
--
ALTER TABLE `article_votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `discussion_votes`
--
ALTER TABLE `discussion_votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_id` (`discussion_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `event_tags`
--
ALTER TABLE `event_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_uploads_ibfk_1` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `opinions`
--
ALTER TABLE `opinions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_id` (`discussion_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `opinion_votes`
--
ALTER TABLE `opinion_votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opinion_id` (`opinion_id`),
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
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `article_votes`
--
ALTER TABLE `article_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `discussion_votes`
--
ALTER TABLE `discussion_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `event_tags`
--
ALTER TABLE `event_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `file_uploads`
--
ALTER TABLE `file_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `opinions`
--
ALTER TABLE `opinions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `opinion_votes`
--
ALTER TABLE `opinion_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles_users`
--
ALTER TABLE `roles_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article_votes`
--
ALTER TABLE `article_votes`
  ADD CONSTRAINT `article_votes_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `article_votes_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `article_votes_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `discussions_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `discussion_votes`
--
ALTER TABLE `discussion_votes`
  ADD CONSTRAINT `discussion_votes_ibfk_1` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`),
  ADD CONSTRAINT `discussion_votes_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `discussion_votes_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`tag_id`) REFERENCES `event_tags` (`id`);

--
-- Constraints for table `event_tags`
--
ALTER TABLE `event_tags`
  ADD CONSTRAINT `event_tags_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `event_tags_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD CONSTRAINT `file_uploads_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `file_uploads_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `opinions`
--
ALTER TABLE `opinions`
  ADD CONSTRAINT `opinions_ibfk_1` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`),
  ADD CONSTRAINT `opinions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `opinions_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `opinion_votes`
--
ALTER TABLE `opinion_votes`
  ADD CONSTRAINT `opinion_votes_ibfk_1` FOREIGN KEY (`opinion_id`) REFERENCES `opinions` (`id`),
  ADD CONSTRAINT `opinion_votes_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `opinion_votes_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

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

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `votes_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `votes_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
