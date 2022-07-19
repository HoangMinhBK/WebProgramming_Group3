create table authors
(
    author_id   int not null
        primary key,
    name        varchar(30) not null,
    nationality varchar(50) null,
    dob         date null
);

insert into authors (author_id, name, nationality, dob) values
(1,'William Shakespeare','Afghanistan','1962-10-15'),
(2,'Emily Dickinson ','Albania','1970-5-19'),
(3,'H. P. Lovecraft','Algeria','1989-1-10'),
(4,'Arthur Conan Doyle','Andorra','1972-2-17'),
(5,'Leo Tolstoy','Angola','1973-7-6'),
(6,'Edgar Allan Poe','Antigua and Barbuda','1961-2-14'),
(7,'Robert Ervin Howard','Argentina','1991-4-16'),
(8,'Rabindranath Tagore','Armenia','1969-3-10'),
(9,'Rudyard Kipling','Australia','1972-2-2'),
(10,'Seneca','Austria','1965-7-27'),
(11,'John Donne','Azerbaijan','1977-6-5'),
(12,'Sarah Williams','The Bahamas','1962-5-26'),
(13,'Oscar Wilde','Bahrain','1976-4-1'),
(14,'Catullus','Bangladesh','1978-9-2'),
(15,'Alfred Tennyson','Barbados','1994-11-5'),
(16,'William Blake','Belarus','1969-2-17'),
(17,'Charles Dickens','Belgium','1963-6-23'),
(18,'John Keats','Belize','1975-7-26'),
(19,'Theodor Herzl','Benin','1992-9-8'),
(20,'Percy Bysshe Shelley','Bhutan','1991-4-18'),
(21,'Ernest Hemingway','Bolivia','1964-9-9'),
(22,'Barack Obama','Bosnia and Herzegovina','1965-8-19'),
(23,'Anton Chekhov','Botswana','1963-9-26'),
(24,'Henry Wadsworth Longfellow','Brazil','1970-3-21'),
(25,'Arthur Schopenhauer','Brunei','1984-9-2'),
(26,'Jacob De Haas','Bulgaria','1974-2-23'),
(27,'George Gordon Byron','Burkina Faso','1967-2-23'),
(28,'Jack London','Burundi','1988-2-24'),
(29,'Robert Frost','Cambodia','1988-6-4'),
(30,'Abraham Lincoln','Cameroon','1989-2-23');

create table comic (
    comic_id        int not null primary key,
    name            varchar(40) not null,
    author_id       int not null,
    status          varchar(20) not null,
    first_uploaded  date not null,
    last_uploaded   date not null,
    current_chapter varchar(20) not null,
    total_view      int         not null,
    rating          varchar(20) not null,
    thumb           varchar(100),
    descr           varchar(150),
    constraint comic_authors_author_id_fk
        foreign key (author_id) references authors (author_id)
);

insert into comic (comic_id, name, author_id, status, first_uploaded, last_uploaded, current_chapter, total_view, rating, thumb, descr) values
(1, 'Death Note ', 13, 'ongoing', '2013-7-9', '2017-10-3', 49, 641421, 3.1, 'https://i.postimg.cc/JnsV4YDn/deathnote.jpg', 'A high school student named Light Turner discovers a mysterious notebook that has the power to kill anyone whose name is written within its pages, and launches a secret crusade to rid the world of criminals.'),
(2, 'Naruto', 7, 'delayed', '2011-11-11', '2017-6-24' ,136, 5211, 3.4, 'https://i.postimg.cc/3rD5s6Qf/naruto.jpg', 'It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.'),
(3, 'Bleach', 27, 'completed', '2012-2-2', '2015-7-27' ,129, 979802, 1.1, 'https://i.postimg.cc/K8x6g8kC/bleach.jpg', 'It follows the adventures of the hotheaded teenager Ichigo Kurosaki, who inherits his parents destiny after he obtains the powers of a Soul Reaper—a death personification similar to the Grim Reaper—from another Soul Reaper, Rukia Kuchiki.'),
(4, 'Your Name', 18, 'delayed', '2011-1-23', '2019-10-23' ,173, 484421, 0.95,'https://i.postimg.cc/SR9BcXGb/yourName.jpg', 'Two teenagers share a profound, magical connection upon discovering they are swapping bodies. Things manage to become even more complicated when the boy and girl decide to meet in person.'),
(5, 'Conan', 14, 'ongoing', '2010-8-6', '2016-5-22' ,91, 268980, 2.8, 'https://i.postimg.cc/nh26Kfqr/conan.jpg', 'The story follows the adventures of Shinichi Kudo (also known as Jimmy Kudo in Case Closed), a young detective prodigy who was inadvertently shrunk into a child body due to a poison he was force-fed by members of a criminal syndicate.'),
(6, 'Berserk ', 3, 'delayed', '2011-4-18', '2019-9-9' ,127, 660336, 0.25, 'https://i.postimg.cc/nLLN0S1k/berserk.jpg', 'The story centers on the characters of Guts, a lone swordsman, and Griffith, the leader of a mercenary band called the "Band of the Hawk".'),
(7, 'Inuyasha', 16, 'completed', '2014-5-17', '2015-6-3', 14, 233367, 1.7,'https://i.postimg.cc/XJGm0ZmB/inuyasha.jpg', 'InuYasha is the story of a dog half-demon who is constantly after a jewel of immense power, the Shikon jewel, also no as the Shikon no tama. He lives in the forest near the village where the jewel is protected by a priestess named Kikyo.'),
(8, 'One Piece', 14, 'completed', '2013-7-14', '2018-2-12' ,184, 705403, 2.55,'https://i.postimg.cc/MGrN40P8/onepiece.jpg', 'The series focuses on Monkey D. Luffy, a young man made of rubber, who, inspired by his childhood idol, the powerful pirate Red-Haired Shanks, sets off on a journey from the East Blue Sea to find the mythical treasure, the One Piece, and proclaim himself the King of the Pirates.'),
(9, 'Dragon Ball', 14, 'ongoing', '2011-3-12', '2017-7-3' ,26, 698586, 4.7,'https://i.postimg.cc/63kS6Wxj/dragonball.jpg', 'The story of Dragon Ball follows the life of Son Goku, a monkey-tailed boy loosely based on the traditional Chinese folk tale Journey to the West, from his life and adventures as a child all the way up to being a grandfather.'),
(10, 'Akira', 29, 'completed', '2013-2-14', '2017-9-15' ,102, 573317, 4.6,'https://i.postimg.cc/L4tZCQYr/akira.jpg', 'It tells the story of Shōtarō Kaneda, a leader of a biker gang whose childhood friend, Tetsuo Shima, acquires incredible telekinetic abilities after a motorcycle accident, eventually threatening an entire military complex amid chaos and rebellion in the sprawling futuristic metropolis of Neo-Tokyo.'),
(11, 'Azumanga Daioh', 22, 'delayed', '2011-8-25', '2019-9-13', 44, 346619, 2,'', ''),
(12, 'Monster', 9, 'completed', '2011-9-25', '2019-11-17' ,127, 704567, 2.8,'', ''),
(13, 'Tsubasa, RESERVoir CHRoNiCLE', 17, 'completed', '2011-5-22', '2019-11-15' ,128, 332871, 1.6,'', ''),
(14, 'Yotsuba&!', 29, 'completed', '2013-6-11', '2015-11-24', 149, 747796, 1.15,'', ''),
(15, 'Ranma ', 8, 'ongoing', '2011-3-6', '2018-11-7' ,164, 888228, 2.05,'', ''),
(16, 'Rammsw', 20, 'ongoing', '2014-2-20', '2017-10-4', 56, 373743, 4.55,'', ''),
(17, 'Hellsing', 17, 'ongoing', '2012-4-3', '2018-5-11', 75, 975407, 3.7,'', ''),
(18, 'Gax', 1, 'delayed', '2012-5-23', '2018-1-15' ,28, 366143, 0.55,'', ''),
(19, 'GTO', 18, 'completed', '2013-4-20', '2018-5-23', 6, 436840, 0.2,'', ''),
(20, 'Negima! Magister Negi Magi', 28, 'completed', '2012-9-4', '2019-5-25', 143, 259470, 4.15,'', ''),
(21, 'Nausicaä of the Valley of the Wind', 20, 'delayed', '2014-5-24', '2019-5-6' ,154, 469786, 3.45,'', ''),
(22, 'Claymore', 2, 'completed', '2012-1-20', '2018-4-7' ,11, 573622, 1.4,'', ''),
(23, 'Gantz', 29, 'completed', '2010-8-22', '2015-11-6', 5, 321801, 3.05,'', ''),
(24, 'Ouran High School Host Club', 1, 'ongoing', '2011-2-21', '2017-6-16', 65, 586708, 0.8,'', ''),
(25, 'xxxHOLiC', 12, 'delayed', '2012-9-2', '2016-11-16', 52, 911899, 3.95,'', ''),
(26, 'Cardcaptor Sakura', 10, 'delayed', '2011-9-15', '2018-10-5', 94, 158660, 3.15,'', ''),
(27, '20th Century Boys', 19, 'delayed', '2014-4-19', '2018-1-13', 190, 681095, 1.3,'', ''),
(28, 'Osx', 26, 'delayed', '2014-10-24', '2016-6-24', 107, 517445, 2.8,'', ''),
(29, 'Vampire Knight', 19, 'completed', '2013-8-7', '2019-3-16' ,136, 625210, 2.1,'', ''),
(30, 'Absolute Boyfriend', 17, 'completed', '2012-1-25', '2019-7-25', 199, 517721, 0.2,'', '');


create table chapter
(
    chapter_id  int not null
        primary key,
    comic_id    int not null,
	chap_num   int null,
    num_pages   int         null,
	update_date date null,
    views       int         null,
    likes       int         null,
    comments    int         null
);

insert into chapter (chapter_id, comic_id, chap_num, num_pages, update_date, views, likes, comments) values
(1, 14, 1, 36, '2013-3-10' , 8335, 386, 492), 
(2, 10, 1, 31, '2010-8-3' , 59, 763, 926), 
(3, 1, 1, 36, '2016-1-17' , 5368, 567, 429), 
(4, 3, 1, 30, '2012-11-27' , 3135, 929, 802), 
(5, 13, 1, 38, '2018-10-18' , 8456, 11, 42), 
(6, 10, 2, 33, '2019-2-6' , 8537, 198, 324), 
(7, 6, 1, 30, '2006-7-18' , 8980, 956, 873), 
(8, 3, 2, 30, '2005-8-9' , 925, 84, 327), 
(9, 27, 1, 35, '2018-3-27' , 5857, 124, 895), 
(10, 13, 2, 35, '2019-11-11' , 364, 43, 750), 
(11, 8, 1, 38, '2013-10-13' , 3584, 403, 651), 
(12, 15, 1, 39, '2016-9-13' , 3368, 739, 12), 
(13, 17, 1, 36, '2005-10-19' , 570, 434, 378), 
(14, 18, 1, 31, '2017-8-22' , 492, 652, 756), 
(15, 2, 1, 30, '2005-1-7' , 9689, 444, 619), 
(16, 11, 1, 39, '2017-4-4' , 5771, 481, 675), 
(17, 10, 3, 37, '2007-6-12' , 2353, 586, 965), 
(18, 17, 2, 33, '2018-8-12' , 2871, 732, 829), 
(19, 4, 1, 39, '2018-6-11' , 6715, 340, 149), 
(20, 7, 1, 33, '2016-5-19' , 3451, 921, 555), 
(21, 30, 1, 38, '2006-9-17' , 2350, 193, 500), 
(22, 15, 2, 34, '2007-9-5' , 5856, 743, 491), 
(23, 18, 2, 35, '2012-7-4' , 2551, 437, 228), 
(24, 6, 2, 37, '2013-9-27' , 4395, 29, 237), 
(25, 16, 1, 33, '2008-7-11' , 1011, 928, 529), 
(26, 27, 2, 34, '2013-3-12' , 4538, 606, 840), 
(27, 5, 1, 38, '2014-1-1' , 7917, 917, 996), 
(28, 15, 3, 33, '2010-8-7' , 5499, 772, 725), 
(29, 5, 2, 30, '2019-5-26' , 9786, 669, 82), 
(30, 13, 3, 34, '2005-4-6' , 8804, 348, 611), 
(31, 3, 3, 38, '2006-1-28' , 5568, 340, 422), 
(32, 12, 1, 30, '2006-2-22' , 3730, 878, 305), 
(33, 1, 2, 36, '2017-10-17' , 3465, 708, 416), 
(34, 13, 4, 38, '2017-1-1' , 5624, 600, 36), 
(35, 3, 4, 39, '2013-3-20' , 71, 973, 131), 
(36, 22, 1, 30, '2015-2-26' , 163, 199, 981), 
(37, 30, 2, 36, '2018-4-4' , 9668, 190, 95), 
(38, 27, 3, 36, '2015-1-17' , 7684, 376, 542), 
(39, 7, 2, 37, '2009-4-26' , 8418, 887, 412), 
(40, 29, 1, 32, '2016-7-8' , 5210, 342, 587), 
(41, 7, 3, 31, '2006-6-14' , 1255, 819, 599), 
(42, 22, 2, 34, '2010-9-24' , 5667, 705, 228 ), 
(43, 18, 3, 30, '2005-9-5' , 9224, 422, 269 ), 
(44, 27, 4, 31, '2012-2-11' , 1972, 672, 850), 
(45, 26, 1, 35, '2015-8-3' , 6042, 898, 713), 
(46, 9, 1, 30, '2019-11-25' , 8581, 819, 336), 
(47, 13, 5, 35, '2019-2-19' , 4769, 273, 776), 
(48, 1, 3, 35, '2019-1-17' , 5884, 993, 205), 
(49, 12, 2, 37, '2006-4-21' , 2754, 326, 259), 
(50, 5, 3, 32, '2019-8-15' , 2021, 842, 868), 
(51, 19, 1, 39, '2008-8-9' , 498, 36, 808 ), 
(52, 14, 2, 38, '2018-11-12' , 1648, 890, 754), 
(53, 8, 2, 36, '2010-3-17' , 8046, 788, 797 ), 
(54, 30, 3, 30, '2008-10-28' , 2497, 253, 892 ), 
(55, 7, 4, 35, '2015-11-25' , 9188, 157, 729 ), 
(56, 17, 3, 30, '2005-8-11' , 6304, 28, 27 ), 
(57, 21, 1, 38, '2019-10-13' , 7697, 699, 43 ), 
(58, 30, 4, 32, '2010-10-13' , 681, 647, 538 ), 
(59, 20, 1, 31, '2009-4-24' , 1692, 215, 127 ), 
(60, 25, 1, 39, '2010-4-18' , 6429, 343, 335 ), 
(61, 28, 1, 30, '2019-2-3' , 289, 367, 988 ), 
(62, 13, 6, 35, '2014-11-8' , 8390, 682, 340 ), 
(63, 22, 3, 39, '2016-7-11' , 6042, 360, 117), 
(64, 4, 2, 31, '2005-2-2' , 5425, 996, 367 ), 
(65, 4, 3, 34, '2009-5-7' , 6057, 614, 168), 
(66, 16, 2, 38, '2015-4-21' , 4346, 726, 994), 
(67, 17, 4, 32, '2011-10-27' , 2290, 647, 970 ), 
(68, 22, 4, 30, '2012-7-4' , 8627, 312, 886 ), 
(69, 25, 2, 35, '2017-10-5' , 9479, 610, 969 ), 
(70, 10, 4, 34, '2010-2-24' , 5433, 987, 888 );

create table chapter_link
(
    linkid      int not null,
    link        varchar(100),
    constraint chapter_link_chapter_id_fk
        foreign key (linkid) references chapter (chapter_id)
);
insert into chapter_link (linkid, link) values
(11, 'https://i.postimg.cc/XJj3WRSQ/001.jpg'),
(11, 'https://i.postimg.cc/NjRwHsQd/002.jpg'),
(11, 'https://i.postimg.cc/mDm4gmTR/003.jpg'),
(11, 'https://i.postimg.cc/L6cp5YFq/004.jpg'),
(11, 'https://i.postimg.cc/zv3rbTfh/005.jpg'),
(11, 'https://i.postimg.cc/cCjNQ6Kb/006.jpg'),
(11, 'https://i.postimg.cc/J7dmwYT5/007.jpg'),
(11, 'https://i.postimg.cc/zXbNqw6Z/008.jpg'),
(11, 'https://i.postimg.cc/DzgkxxJs/009.jpg'),
(11, 'https://i.postimg.cc/V6Zy85Fk/010.jpg'),
(11, 'https://i.postimg.cc/rmw635xH/011.jpg'),
(11, 'https://i.postimg.cc/gc59tXJM/012.jpg'),
(11, 'https://i.postimg.cc/br4KZMWX/013.jpg'),
(11, 'https://i.postimg.cc/WbJBBNqs/014.jpg'),
(11, 'https://i.postimg.cc/rwXBcB5x/015.jpg'),
(11, 'https://i.postimg.cc/0yYLNVC3/016.jpg'),
(11, 'https://i.postimg.cc/KYQwP4wD/017.jpg'),
(11, 'https://i.postimg.cc/pdP35KGd/018.jpg'),
(11, 'https://i.postimg.cc/qRRYj4dV/019.jpg'),

(19, 'https://i.postimg.cc/qqWHL236/003.jpg'),
(19, 'https://i.postimg.cc/RZK4gpGS/004-fix.jpg'),
(19, 'https://i.postimg.cc/3wh7Vjbg/005-fix.jpg'),
(19, 'https://i.postimg.cc/bNGztwt2/006-fix.jpg'),
(19, 'https://i.postimg.cc/ZnWhpwCh/007-fix.jpg'),
(19, 'https://i.postimg.cc/d1HYhbQB/008-fix.jpg'),
(19, 'https://i.postimg.cc/G3fRdn53/009-fix.jpg'),
(19, 'https://i.postimg.cc/Jn484r80/010-fix.jpg'),
(19, 'https://i.postimg.cc/4x6R67Nn/011-fix.jpg'),
(19, 'https://i.postimg.cc/LsvdWcPp/012-fix.jpg'),
(19, 'https://i.postimg.cc/vmGF3Ych/013-fix.jpg'),
(19, 'https://i.postimg.cc/ncQJLSy4/059-fix.jpg'),

(64, 'https://i.postimg.cc/7YQ4VGzN/002-fix.jpg'),
(64, 'https://i.postimg.cc/Qd2r2209/003-fix.jpg'),
(64, 'https://i.postimg.cc/pTxMTDNP/004-fix.jpg'),
(64, 'https://i.postimg.cc/tJSK2wsg/005-fix.jpg'),
(64, 'https://i.postimg.cc/cCLq704j/006-fix.jpg'),
(64, 'https://i.postimg.cc/mDwfFtRC/007-fix.jpg'),
(64, 'https://i.postimg.cc/9fyjCLnx/008-fix.jpg'),
(64, 'https://i.postimg.cc/CxBg6hHp/009-fix.jpg'),
(64, 'https://i.postimg.cc/5NGcvcc7/010-fix.jpg'),
(64, 'https://i.postimg.cc/W1JBw9T2/011-fix.jpg'),
(64, 'https://i.postimg.cc/25RPc4Sn/012-fix.jpg'),
(64, 'https://i.postimg.cc/HLwFfVrR/013-fix.jpg'),
(64, 'https://i.postimg.cc/G2b6rdY2/014-fix.jpg'),
(64, 'https://i.postimg.cc/NFMV9Ddv/058-fix.jpg'),
(64, 'https://i.postimg.cc/VL5Qdfh0/059-fix.jpg'),
(64, 'https://i.postimg.cc/J02FbXFD/061-fix.jpg'),

(65, 'https://i.postimg.cc/PqfVCK3f/003-fix.jpg'),
(65, 'https://i.postimg.cc/Vs2hKq64/004-fix.jpg'),
(65, 'https://i.postimg.cc/TYm4FK5x/005-fix.jpg'),
(65, 'https://i.postimg.cc/c6qff4dM/006-fix.jpg'),
(65, 'https://i.postimg.cc/bYZM0Czs/007-fix.jpg'),
(65, 'https://i.postimg.cc/W1wfpx7f/008-fix.jpg'),
(65, 'https://i.postimg.cc/90wG4qHQ/009-fix.jpg'),
(65, 'https://i.postimg.cc/P5jRjd1w/010-fix.jpg'),
(65, 'https://i.postimg.cc/bvFgsPSL/011-fix.jpg'),
(65, 'https://i.postimg.cc/HLL3YnnV/012-fix.jpg'),
(65, 'https://i.postimg.cc/fRCBQmwG/013-fix.jpg'),
(65, 'https://i.postimg.cc/g2mN7NPy/056-fix.jpg'),
(65, 'https://i.postimg.cc/QxL6Qj4y/057-fix.jpg'),

(53, 'https://i.postimg.cc/Hs1NNjFH/001.jpg'),
(53, 'https://i.postimg.cc/Hs1NNjFH/001.jpg'),
(53, 'https://i.postimg.cc/YC3TYkn7/002.jpg'),
(53, 'https://i.postimg.cc/QtBz27XN/003.jpg'),
(53, 'https://i.postimg.cc/cCwbHNgV/004.jpg'),
(53, 'https://i.postimg.cc/fbRpvFp9/005.jpg'),
(53, 'https://i.postimg.cc/GpgNgKnS/006.jpg'),
(53, 'https://i.postimg.cc/BZKyN2YM/007.jpg'),
(53, 'https://i.postimg.cc/gJf7m0JV/008.jpg'),
(53, 'https://i.postimg.cc/gky7bmPh/009.jpg'),
(53, 'https://i.postimg.cc/k4tj1dcB/010.jpg'),
(53, 'https://i.postimg.cc/cLsbs2sb/011.jpg'),
(53, 'https://i.postimg.cc/8CYKmCL2/012.jpg'),
(53, 'https://i.postimg.cc/g2NBrsjk/013.jpg'),
(53, 'https://i.postimg.cc/pdrcjj5Q/014.jpg');



create table tags
(
    tag_id      int not null
        primary key,
    name        varchar(30) not null,
    description varchar(100) not null
);
insert into tags (tag_id, name, description) values
(1, 'Action',   ''  ),
(2, 'Adventure',  ''   ),
(3, 'Comedy',   ''  ),
(4, 'Crime and mystery',   ''  ),
(5, 'Fantasy',   ''  ),
(6, 'Historical',    '' ),
(7, 'Historical fiction',    '' ),
(8, 'Horror',  ''   ),
(9, 'Romance',   ''  ),
(10, 'Satire',    '' ),
(11, 'Science fiction',    '' ),
(12, 'Cyberpunk and derivatives',   ''  ),
(13, 'Speculative',   ''  ),
(14, 'Thriller',   ''  );

create table tagging
(
    tagging_id  int not null
        primary key,
    tag_id     int not null,
    comic_id   int not null
);
insert into tagging(tagging_id, tag_id, comic_id) values
(1, 1, 10),
(2, 12, 26),
(3, 2, 4),
(4, 13, 25),
(5, 2, 29),
(6, 3, 19),
(7, 1, 3),
(8, 13, 24),
(9, 10, 26),
(10, 11, 16),
(11, 8, 6),
(12, 4, 21),
(13, 4, 18),
(14, 3, 2),
(15, 11, 3),
(16, 10, 17),
(17, 2, 23),
(18, 6, 22),
(19, 11, 6),
(20, 10, 15),
(21, 2, 26),
(22, 4, 10),
(23, 5, 17),
(24, 6, 21),
(25, 5, 12),
(26, 2, 12),
(27, 1, 14),
(28, 3, 20),
(29, 12, 1),
(30, 7, 2),
(31, 11, 19),
(32, 11, 15),
(33, 2, 15),
(34, 5, 1),
(35, 12, 7),
(36, 13, 1),
(37, 1, 3),
(38, 4, 15),
(39, 10, 27),
(40, 8, 16),
(41, 3, 18),
(42, 13, 11),
(43, 2, 22),
(44, 8, 25),
(45, 10, 13),
(46, 11, 25),
(47, 5, 7),
(48, 8, 27),
(49, 4, 1);


create table accounts (
	account_id INT,
	display_name VARCHAR(50),
	username VARCHAR(50),
	password VARCHAR(50),
	email VARCHAR(50),
	created_time DATE,
    account_type VARCHAR(50)
);
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (1, 'Rozele Wackley', 'rwackley0', 'lP1bSYs5hfZ', 'rwackley0@reverbnation.com', '2019-09-28', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (2, 'Silvester McLleese', 'smclleese1', 'MwIQmq', 'smclleese1@google.ca', '2010-09-09', 'moderator');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (3, 'Justen Foch', 'jfoch2', 'FUcGzSMC', 'jfoch2@jimdo.com', '2013-02-13', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (4, 'Jillana Ealam', 'jealam3', 'oP74CmLqVJUr', 'jealam3@issuu.com', '2017-04-10', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (5, 'Parke Aulton', 'paulton4', 'KiWH1avMZ', 'paulton4@ebay.com', '2017-02-28', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (6, 'Agustin McPharlain', 'amcpharlain5', 'CpeHjmmkK', 'amcpharlain5@geocities.com', '2017-04-20', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (7, 'Jemie Martynka', 'jmartynka6', 'Hpxyf1RBje0', 'jmartynka6@indiatimes.com', '2013-07-18', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (8, 'Aristotle Prosser', 'aprosser7', 'NCrp6Mg6V', 'aprosser7@cornell.edu', '2013-08-12', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (9, 'Franklin Boath', 'fboath8', 'QJjYq1', 'fboath8@lulu.com', '2015-03-14', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (10, 'Izabel Dickens', 'idickens9', 'RSvLilNbC1', 'idickens9@wordpress.com', '2018-09-19', 'moderator');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (11, 'Peterus Von Hindenburg', 'abc', '123', 'pvona@pen.io', '2017-06-09', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (12, 'Staford Kamall', 'skamallb', 'BcFqwG', 'skamallb@ca.gov', '2020-06-06', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (13, 'Teresita Pettie', 'tpettiec', 'bMIdu2wv8Nx', 'tpettiec@tmall.com', '2020-09-19', 'moderator');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (14, 'Rakel Wynes', 'rwynesd', 'wENJfGlBW', 'rwynesd@sciencedaily.com', '2014-11-13', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (15, 'Katharyn Dechelle', 'kdechellee', 'FhPi4uV', 'kdechellee@bloglines.com', '2014-10-04', 'moderator');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (16, 'Claudina Owen', 'cowenf', 'MJfE844MQmJd', 'cowenf@apple.com', '2017-10-30', 'moderator');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (17, 'Richardo McKeag', 'rmckeagg', '0zMBRG9Yk', 'rmckeagg@icio.us', '2017-01-06', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (18, 'Morganica Butterfint', 'mbutterfinth', 'UkDpFEWErxp', 'mbutterfinth@youtu.be', '2011-06-11', 'normal');
insert into accounts (account_id, display_name, username, password, email, created_time, account_type) values (19, 'Wynnie Justis', 'wjustisi', 'uyotsnTQ', 'wjustisi@github.com', '2012-06-17', 'normal');




create table subscribe (
	subscribe_id INT,
	account_id INT,
	comic_id INT
);
insert into subscribe (subscribe_id, account_id, comic_id) values (1, 112, 25);
insert into subscribe (subscribe_id, account_id, comic_id) values (2, 158, 8);
insert into subscribe (subscribe_id, account_id, comic_id) values (3, 87, 9);
insert into subscribe (subscribe_id, account_id, comic_id) values (4, 197, 21);
insert into subscribe (subscribe_id, account_id, comic_id) values (5, 93, 9);
insert into subscribe (subscribe_id, account_id, comic_id) values (6, 65, 11);
insert into subscribe (subscribe_id, account_id, comic_id) values (7, 34, 26);
insert into subscribe (subscribe_id, account_id, comic_id) values (8, 111, 25);
insert into subscribe (subscribe_id, account_id, comic_id) values (9, 40, 26);
insert into subscribe (subscribe_id, account_id, comic_id) values (10, 113, 10);
insert into subscribe (subscribe_id, account_id, comic_id) values (11, 13, 20);
insert into subscribe (subscribe_id, account_id, comic_id) values (12, 77, 13);
insert into subscribe (subscribe_id, account_id, comic_id) values (13, 65, 29);
insert into subscribe (subscribe_id, account_id, comic_id) values (14, 81, 2);
insert into subscribe (subscribe_id, account_id, comic_id) values (15, 17, 20);
insert into subscribe (subscribe_id, account_id, comic_id) values (16, 9, 20);
insert into subscribe (subscribe_id, account_id, comic_id) values (17, 87, 9);
insert into subscribe (subscribe_id, account_id, comic_id) values (18, 136, 25);
insert into subscribe (subscribe_id, account_id, comic_id) values (19, 137, 11);
insert into subscribe (subscribe_id, account_id, comic_id) values (20, 112, 4);
insert into subscribe (subscribe_id, account_id, comic_id) values (21, 19, 14);
insert into subscribe (subscribe_id, account_id, comic_id) values (22, 12, 12);
insert into subscribe (subscribe_id, account_id, comic_id) values (23, 46, 25);
insert into subscribe (subscribe_id, account_id, comic_id) values (24, 48, 23);
insert into subscribe (subscribe_id, account_id, comic_id) values (25, 194, 14);
insert into subscribe (subscribe_id, account_id, comic_id) values (26, 99, 13);
insert into subscribe (subscribe_id, account_id, comic_id) values (27, 130, 27);
insert into subscribe (subscribe_id, account_id, comic_id) values (28, 128, 5);
insert into subscribe (subscribe_id, account_id, comic_id) values (29, 127, 19);
insert into subscribe (subscribe_id, account_id, comic_id) values (30, 94, 26);
insert into subscribe (subscribe_id, account_id, comic_id) values (31, 90, 20);
insert into subscribe (subscribe_id, account_id, comic_id) values (32, 29, 10);
insert into subscribe (subscribe_id, account_id, comic_id) values (33, 152, 7);
insert into subscribe (subscribe_id, account_id, comic_id) values (34, 57, 7);
insert into subscribe (subscribe_id, account_id, comic_id) values (35, 193, 14);
insert into subscribe (subscribe_id, account_id, comic_id) values (36, 118, 9);
insert into subscribe (subscribe_id, account_id, comic_id) values (37, 169, 18);
insert into subscribe (subscribe_id, account_id, comic_id) values (38, 131, 3);
insert into subscribe (subscribe_id, account_id, comic_id) values (39, 168, 9);
insert into subscribe (subscribe_id, account_id, comic_id) values (40, 59, 16);
insert into subscribe (subscribe_id, account_id, comic_id) values (41, 11, 15);
insert into subscribe (subscribe_id, account_id, comic_id) values (42, 3, 6);
insert into subscribe (subscribe_id, account_id, comic_id) values (43, 74, 22);
insert into subscribe (subscribe_id, account_id, comic_id) values (44, 81, 24);
insert into subscribe (subscribe_id, account_id, comic_id) values (45, 59, 25);
insert into subscribe (subscribe_id, account_id, comic_id) values (46, 145, 1);
insert into subscribe (subscribe_id, account_id, comic_id) values (47, 64, 28);
insert into subscribe (subscribe_id, account_id, comic_id) values (48, 40, 8);
insert into subscribe (subscribe_id, account_id, comic_id) values (49, 128, 28);
insert into subscribe (subscribe_id, account_id, comic_id) values (50, 128, 7);







create table readt (
	read_id INT,
	chapter_id INT,
	account_id INT,
	date DATE
);
insert into readt (read_id, chapter_id, account_id, date) values (1, 23, 176, '2020-09-23');
insert into readt (read_id, chapter_id, account_id, date) values (2, 9, 170, '2021-01-06');
insert into readt (read_id, chapter_id, account_id, date) values (3, 30, 132, '2020-09-16');
insert into readt (read_id, chapter_id, account_id, date) values (4, 49, 55, '2021-04-27');
insert into readt (read_id, chapter_id, account_id, date) values (5, 62, 64, '2020-08-15');
insert into readt (read_id, chapter_id, account_id, date) values (6, 62, 126, '2021-02-09');
insert into readt (read_id, chapter_id, account_id, date) values (7, 28, 57, '2020-08-25');
insert into readt (read_id, chapter_id, account_id, date) values (8, 13, 43, '2021-01-27');
insert into readt (read_id, chapter_id, account_id, date) values (9, 58, 31, '2020-10-10');
insert into readt (read_id, chapter_id, account_id, date) values (10, 16, 151, '2021-02-12');
insert into readt (read_id, chapter_id, account_id, date) values (11, 62, 65, '2021-01-11');
insert into readt (read_id, chapter_id, account_id, date) values (12, 49, 96, '2021-02-20');
insert into readt (read_id, chapter_id, account_id, date) values (13, 35, 17, '2021-02-01');
insert into readt (read_id, chapter_id, account_id, date) values (14, 21, 166, '2021-03-26');
insert into readt (read_id, chapter_id, account_id, date) values (15, 3, 153, '2020-07-27');
insert into readt (read_id, chapter_id, account_id, date) values (16, 42, 28, '2021-04-19');
insert into readt (read_id, chapter_id, account_id, date) values (17, 64, 176, '2020-07-26');
insert into readt (read_id, chapter_id, account_id, date) values (18, 42, 142, '2020-07-23');
insert into readt (read_id, chapter_id, account_id, date) values (19, 3, 200, '2020-09-08');
insert into readt (read_id, chapter_id, account_id, date) values (20, 63, 146, '2021-01-11');
insert into readt (read_id, chapter_id, account_id, date) values (21, 22, 59, '2020-11-06');
insert into readt (read_id, chapter_id, account_id, date) values (22, 56, 101, '2021-03-09');
insert into readt (read_id, chapter_id, account_id, date) values (23, 70, 91, '2020-12-02');
insert into readt (read_id, chapter_id, account_id, date) values (24, 66, 6, '2020-09-27');
insert into readt (read_id, chapter_id, account_id, date) values (25, 49, 126, '2020-09-25');
insert into readt (read_id, chapter_id, account_id, date) values (26, 68, 6, '2021-01-28');
insert into readt (read_id, chapter_id, account_id, date) values (27, 19, 10, '2020-12-01');
insert into readt (read_id, chapter_id, account_id, date) values (28, 54, 67, '2020-11-07');
insert into readt (read_id, chapter_id, account_id, date) values (29, 10, 167, '2021-05-28');
insert into readt (read_id, chapter_id, account_id, date) values (30, 1, 179, '2020-11-12');
insert into readt (read_id, chapter_id, account_id, date) values (31, 29, 50, '2020-11-08');
insert into readt (read_id, chapter_id, account_id, date) values (32, 57, 104, '2020-07-07');
insert into readt (read_id, chapter_id, account_id, date) values (33, 17, 50, '2021-02-03');
insert into readt (read_id, chapter_id, account_id, date) values (34, 60, 148, '2021-04-05');
insert into readt (read_id, chapter_id, account_id, date) values (35, 69, 156, '2020-07-09');
insert into readt (read_id, chapter_id, account_id, date) values (36, 65, 190, '2021-03-16');
insert into readt (read_id, chapter_id, account_id, date) values (37, 61, 92, '2020-06-29');
insert into readt (read_id, chapter_id, account_id, date) values (38, 54, 179, '2020-09-16');
insert into readt (read_id, chapter_id, account_id, date) values (39, 20, 62, '2021-02-21');
insert into readt (read_id, chapter_id, account_id, date) values (40, 32, 68, '2021-03-09');
insert into readt (read_id, chapter_id, account_id, date) values (41, 63, 85, '2020-06-20');
insert into readt (read_id, chapter_id, account_id, date) values (42, 9, 105, '2021-01-17');
insert into readt (read_id, chapter_id, account_id, date) values (43, 58, 54, '2020-12-17');
insert into readt (read_id, chapter_id, account_id, date) values (44, 25, 135, '2021-03-01');
insert into readt (read_id, chapter_id, account_id, date) values (45, 11, 150, '2021-06-07');
insert into readt (read_id, chapter_id, account_id, date) values (46, 35, 194, '2021-02-27');
insert into readt (read_id, chapter_id, account_id, date) values (47, 5, 75, '2020-12-01');
insert into readt (read_id, chapter_id, account_id, date) values (48, 59, 166, '2021-05-13');
insert into readt (read_id, chapter_id, account_id, date) values (49, 49, 66, '2020-10-20');
insert into readt (read_id, chapter_id, account_id, date) values (50, 10, 54, '2021-01-01');
insert into readt (read_id, chapter_id, account_id, date) values (51, 5, 43, '2020-09-27');
insert into readt (read_id, chapter_id, account_id, date) values (52, 2, 151, '2021-04-27');
insert into readt (read_id, chapter_id, account_id, date) values (53, 30, 132, '2020-06-22');
insert into readt (read_id, chapter_id, account_id, date) values (54, 66, 71, '2021-06-04');
insert into readt (read_id, chapter_id, account_id, date) values (55, 42, 97, '2021-05-04');
insert into readt (read_id, chapter_id, account_id, date) values (56, 55, 159, '2020-12-26');
insert into readt (read_id, chapter_id, account_id, date) values (57, 15, 191, '2020-11-02');
insert into readt (read_id, chapter_id, account_id, date) values (58, 19, 48, '2020-09-15');
insert into readt (read_id, chapter_id, account_id, date) values (59, 66, 103, '2021-03-23');
insert into readt (read_id, chapter_id, account_id, date) values (60, 37, 74, '2021-01-27');




create table likes (
	like_id INT,
	chapter_id INT,
	account_id INT,
	date DATE
);
insert into likes (like_id, chapter_id, account_id, date) values (1, 23, 129, '2020-11-18');
insert into likes (like_id, chapter_id, account_id, date) values (2, 1, 108, '2020-09-25');
insert into likes (like_id, chapter_id, account_id, date) values (3, 34, 6, '2020-08-27');
insert into likes (like_id, chapter_id, account_id, date) values (4, 37, 177, '2020-09-13');
insert into likes (like_id, chapter_id, account_id, date) values (5, 69, 167, '2020-12-07');
insert into likes (like_id, chapter_id, account_id, date) values (6, 17, 83, '2021-05-11');
insert into likes (like_id, chapter_id, account_id, date) values (7, 56, 67, '2020-07-13');
insert into likes (like_id, chapter_id, account_id, date) values (8, 39, 9, '2021-05-09');
insert into likes (like_id, chapter_id, account_id, date) values (9, 65, 155, '2020-07-11');
insert into likes (like_id, chapter_id, account_id, date) values (10, 14, 56, '2020-08-10');
insert into likes (like_id, chapter_id, account_id, date) values (11, 9, 84, '2021-04-26');
insert into likes (like_id, chapter_id, account_id, date) values (12, 61, 86, '2020-07-18');
insert into likes (like_id, chapter_id, account_id, date) values (13, 25, 145, '2020-10-24');
insert into likes (like_id, chapter_id, account_id, date) values (14, 45, 98, '2021-05-28');
insert into likes (like_id, chapter_id, account_id, date) values (15, 25, 123, '2021-04-19');
insert into likes (like_id, chapter_id, account_id, date) values (16, 40, 169, '2020-08-13');
insert into likes (like_id, chapter_id, account_id, date) values (17, 25, 140, '2021-02-12');
insert into likes (like_id, chapter_id, account_id, date) values (18, 52, 183, '2021-02-04');
insert into likes (like_id, chapter_id, account_id, date) values (19, 63, 114, '2021-05-15');
insert into likes (like_id, chapter_id, account_id, date) values (20, 53, 96, '2020-09-19');
insert into likes (like_id, chapter_id, account_id, date) values (21, 15, 143, '2020-07-30');
insert into likes (like_id, chapter_id, account_id, date) values (22, 52, 155, '2021-02-26');
insert into likes (like_id, chapter_id, account_id, date) values (23, 33, 30, '2021-03-24');
insert into likes (like_id, chapter_id, account_id, date) values (24, 68, 172, '2021-04-29');
insert into likes (like_id, chapter_id, account_id, date) values (25, 12, 67, '2021-05-30');
insert into likes (like_id, chapter_id, account_id, date) values (26, 41, 41, '2020-09-01');
insert into likes (like_id, chapter_id, account_id, date) values (27, 35, 25, '2021-03-12');
insert into likes (like_id, chapter_id, account_id, date) values (28, 28, 119, '2021-05-23');
insert into likes (like_id, chapter_id, account_id, date) values (29, 29, 94, '2021-05-28');
insert into likes (like_id, chapter_id, account_id, date) values (30, 61, 189, '2020-06-23');
insert into likes (like_id, chapter_id, account_id, date) values (31, 10, 34, '2020-09-02');
insert into likes (like_id, chapter_id, account_id, date) values (32, 26, 183, '2020-12-28');
insert into likes (like_id, chapter_id, account_id, date) values (33, 30, 80, '2020-06-24');
insert into likes (like_id, chapter_id, account_id, date) values (34, 13, 195, '2020-09-22');
insert into likes (like_id, chapter_id, account_id, date) values (35, 39, 84, '2020-10-07');
insert into likes (like_id, chapter_id, account_id, date) values (36, 37, 116, '2020-10-04');
insert into likes (like_id, chapter_id, account_id, date) values (37, 13, 144, '2020-07-14');
insert into likes (like_id, chapter_id, account_id, date) values (38, 11, 149, '2021-05-22');
insert into likes (like_id, chapter_id, account_id, date) values (39, 28, 96, '2020-10-22');
insert into likes (like_id, chapter_id, account_id, date) values (40, 15, 20, '2020-08-15');
insert into likes (like_id, chapter_id, account_id, date) values (41, 25, 104, '2021-02-10');
insert into likes (like_id, chapter_id, account_id, date) values (42, 26, 55, '2020-06-18');
insert into likes (like_id, chapter_id, account_id, date) values (43, 69, 163, '2020-11-20');
insert into likes (like_id, chapter_id, account_id, date) values (44, 40, 107, '2021-03-27');
insert into likes (like_id, chapter_id, account_id, date) values (45, 63, 94, '2020-11-25');
insert into likes (like_id, chapter_id, account_id, date) values (46, 17, 99, '2020-11-14');
insert into likes (like_id, chapter_id, account_id, date) values (47, 23, 93, '2020-11-26');
insert into likes (like_id, chapter_id, account_id, date) values (48, 67, 174, '2020-06-18');
insert into likes (like_id, chapter_id, account_id, date) values (49, 29, 12, '2021-03-17');
insert into likes (like_id, chapter_id, account_id, date) values (50, 13, 72, '2021-04-16');


create table comments (
	comment_id INT,
	chapter_id INT,
	account_id INT,
	date DATE,
	content VARCHAR(50)
);
insert into comments (comment_id, chapter_id, account_id, date, content) values (1, 36, 91, '2021-04-01', 'Organized');
insert into comments (comment_id, chapter_id, account_id, date, content) values (2, 64, 3, '2020-09-27', 'pricing structure');
insert into comments (comment_id, chapter_id, account_id, date, content) values (3, 10, 185, '2021-01-06', 'encompassing');
insert into comments (comment_id, chapter_id, account_id, date, content) values (4, 60, 148, '2020-11-24', 'migration');
insert into comments (comment_id, chapter_id, account_id, date, content) values (5, 69, 34, '2021-01-11', 'real-time');
insert into comments (comment_id, chapter_id, account_id, date, content) values (6, 2, 8, '2020-12-17', 'cohesive');
insert into comments (comment_id, chapter_id, account_id, date, content) values (7, 3, 99, '2020-12-30', 'demand-driven');
insert into comments (comment_id, chapter_id, account_id, date, content) values (8, 20, 53, '2020-10-15', '24/7');
insert into comments (comment_id, chapter_id, account_id, date, content) values (9, 2, 13, '2020-10-23', 'Sharable');
insert into comments (comment_id, chapter_id, account_id, date, content) values (10, 43, 158, '2020-11-30', 'dedicated');
insert into comments (comment_id, chapter_id, account_id, date, content) values (11, 68, 45, '2021-02-14', '24 hour');
insert into comments (comment_id, chapter_id, account_id, date, content) values (12, 20, 62, '2020-07-14', 'national');
insert into comments (comment_id, chapter_id, account_id, date, content) values (13, 29, 6, '2020-12-06', 'paradigm');
insert into comments (comment_id, chapter_id, account_id, date, content) values (14, 29, 162, '2020-07-22', 'optimal');
insert into comments (comment_id, chapter_id, account_id, date, content) values (15, 40, 172, '2020-11-30', '24/7');
insert into comments (comment_id, chapter_id, account_id, date, content) values (16, 58, 134, '2020-11-28', 'Phased');
insert into comments (comment_id, chapter_id, account_id, date, content) values (17, 65, 153, '2021-03-07', 'encoding');
insert into comments (comment_id, chapter_id, account_id, date, content) values (18, 33, 69, '2021-02-15', 'intranet');
insert into comments (comment_id, chapter_id, account_id, date, content) values (19, 57, 184, '2021-03-09', 'multi-state');
insert into comments (comment_id, chapter_id, account_id, date, content) values (20, 62, 41, '2020-08-30', 'upward-trending');
insert into comments (comment_id, chapter_id, account_id, date, content) values (21, 52, 196, '2020-10-04', 'Face to face');
insert into comments (comment_id, chapter_id, account_id, date, content) values (22, 20, 15, '2021-04-02', 'background');
insert into comments (comment_id, chapter_id, account_id, date, content) values (23, 61, 11, '2020-12-16', 'Integrated');
insert into comments (comment_id, chapter_id, account_id, date, content) values (24, 21, 187, '2020-07-09', 'value-added');
insert into comments (comment_id, chapter_id, account_id, date, content) values (25, 37, 127, '2020-09-12', 'data-warehouse');
insert into comments (comment_id, chapter_id, account_id, date, content) values (26, 34, 28, '2021-02-27', 'analyzing');
insert into comments (comment_id, chapter_id, account_id, date, content) values (27, 32, 19, '2021-05-17', 'interactive');
insert into comments (comment_id, chapter_id, account_id, date, content) values (28, 13, 69, '2021-02-01', 'time-frame');
insert into comments (comment_id, chapter_id, account_id, date, content) values (29, 9, 41, '2020-07-30', 'Switchable');
insert into comments (comment_id, chapter_id, account_id, date, content) values (30, 34, 135, '2020-10-31', 'help-desk');




create table follows (
	follow_id INT,
	author_id INT,
	account_id INT,
	last_read_day DATE
);
insert into follows (follow_id, author_id, account_id, last_read_day) values (1, 21, 52, '2021-05-19');
insert into follows (follow_id, author_id, account_id, last_read_day) values (2, 4, 92, '2020-07-27');
insert into follows (follow_id, author_id, account_id, last_read_day) values (3, 27, 149, '2020-07-30');
insert into follows (follow_id, author_id, account_id, last_read_day) values (4, 10, 156, '2020-09-29');
insert into follows (follow_id, author_id, account_id, last_read_day) values (5, 26, 99, '2021-06-12');
insert into follows (follow_id, author_id, account_id, last_read_day) values (6, 30, 164, '2021-02-24');
insert into follows (follow_id, author_id, account_id, last_read_day) values (7, 11, 1, '2020-06-30');
insert into follows (follow_id, author_id, account_id, last_read_day) values (8, 7, 110, '2020-09-10');
insert into follows (follow_id, author_id, account_id, last_read_day) values (9, 8, 57, '2020-09-22');
insert into follows (follow_id, author_id, account_id, last_read_day) values (10, 8, 124, '2021-02-18');
insert into follows (follow_id, author_id, account_id, last_read_day) values (11, 17, 179, '2020-07-20');
insert into follows (follow_id, author_id, account_id, last_read_day) values (12, 7, 25, '2021-03-16');
insert into follows (follow_id, author_id, account_id, last_read_day) values (13, 14, 35, '2021-04-28');
insert into follows (follow_id, author_id, account_id, last_read_day) values (14, 30, 143, '2021-05-10');
insert into follows (follow_id, author_id, account_id, last_read_day) values (15, 28, 187, '2020-07-09');
insert into follows (follow_id, author_id, account_id, last_read_day) values (16, 3, 26, '2020-07-18');
insert into follows (follow_id, author_id, account_id, last_read_day) values (17, 16, 10, '2021-05-25');
insert into follows (follow_id, author_id, account_id, last_read_day) values (18, 28, 55, '2021-03-04');
insert into follows (follow_id, author_id, account_id, last_read_day) values (19, 24, 50, '2020-10-30');
insert into follows (follow_id, author_id, account_id, last_read_day) values (20, 26, 101, '2021-01-12');
insert into follows (follow_id, author_id, account_id, last_read_day) values (21, 22, 48, '2020-11-27');
insert into follows (follow_id, author_id, account_id, last_read_day) values (22, 24, 51, '2021-05-01');
insert into follows (follow_id, author_id, account_id, last_read_day) values (23, 13, 126, '2020-12-25');
insert into follows (follow_id, author_id, account_id, last_read_day) values (24, 5, 80, '2021-05-06');
insert into follows (follow_id, author_id, account_id, last_read_day) values (25, 9, 172, '2021-05-30');
insert into follows (follow_id, author_id, account_id, last_read_day) values (26, 12, 140, '2020-08-08');
insert into follows (follow_id, author_id, account_id, last_read_day) values (27, 26, 196, '2021-03-12');
insert into follows (follow_id, author_id, account_id, last_read_day) values (28, 20, 181, '2020-10-12');
insert into follows (follow_id, author_id, account_id, last_read_day) values (29, 17, 182, '2021-05-21');
insert into follows (follow_id, author_id, account_id, last_read_day) values (30, 12, 106, '2020-07-05');
