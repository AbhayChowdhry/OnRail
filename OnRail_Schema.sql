DROP DATABASE IF EXISTS `Online_Retail_Store`;
CREATE DATABASE `Online_Retail_Store`; 
USE `Online_Retail_Store`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

DROP TABLE IF EXISTS `Customer`;
DROP TABLE IF EXISTS `Admin`;
DROP TABLE IF EXISTS `Order_Payment`;
DROP TABLE IF EXISTS `Order_Items`;
DROP TABLE IF EXISTS `Cart`;
DROP TABLE IF EXISTS `Category`;
DROP TABLE IF EXISTS `Inventory`;
DROP TABLE IF EXISTS `Delivery_Partner`;
DROP TABLE IF EXISTS `Seller`;
DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `address` varchar(60) NOT NULL,
  `customer_password` varchar(20) NOT NULL,
  `email_id` varchar(40) NOT NULL,
  
  PRIMARY KEY (customer_id)
);

insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (1, 'Julita Huffey', '857-446-1564', 'Apt 1986', 'vihV069fMMi', 'jhuffey0@salon.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (2, 'Domenic Pavek', '513-467-7512', 'Apt 1725', 'NFTv0hLc', 'dpavek1@icq.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (3, 'Bryana Yvon', '701-121-1840', 'Suite 48', '9pfaYaXwNCLI', 'byvon2@bandcamp.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (4, 'Elijah Labone', '718-571-4706', 'PO Box 86689', 'bPXQ0gVigXF', 'elabone3@vinaora.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (5, 'Agnola Dunstone', '359-418-2623', 'Room 966', 'uNk3pH7d', 'adunstone4@epa.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (6, 'Danna Faudrie', '330-248-4693', 'Apt 694', 'x4SrUjpJOH', 'dfaudrie5@nasa.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (7, 'Stearn Clarson', '317-290-4395', 'Apt 545', 'BuqiZVaA', 'sclarson6@mapy.cz');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (8, 'Nell Martinelli', '262-140-7569', 'PO Box 98253', 'IPfipgem', 'nmartinelli7@huffingtonpost.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (9, 'Loydie Thomasson', '816-462-3171', 'Apt 526', 'SV8jK6wpGM', 'lthomasson8@home.pl');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (10, 'Joscelin Diperaus', '121-265-7278', 'PO Box 3142', 'fAoSe1QO', 'jdiperaus9@abc.net.au');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (11, 'Donnell Trewartha', '934-287-7900', 'Room 1959', 'pLpIHT', 'dtrewarthaa@comsenz.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (12, 'Nissie Birdwhistell', '960-879-4798', 'Room 449', 'hn0wjvbon5B', 'nbirdwhistellb@ebay.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (13, 'Barby Rosberg', '719-699-2813', 'Apt 1956', 'eJMisQh', 'brosbergc@storify.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (14, 'Giordano Verillo', '562-330-3021', 'Suite 20', 'wHRmfC', 'gverillod@yahoo.co.jp');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (15, 'Arden Loos', '828-579-6219', 'Apt 1421', 'JzWLVP6XAZri', 'aloose@hatena.ne.jp');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (16, 'Thorin Fardo', '963-116-5256', 'Apt 298', 'yHq4uJEFOSBB', 'tfardof@google.nl');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (17, 'Padraic McDonand', '181-700-1785', '2nd Floor', 'e0qYgJE7Ps', 'pmcdonandg@home.pl');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (18, 'Aguistin Mapp', '233-955-8118', 'Apt 265', 'uClH9pLTuddo', 'amapph@wp.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (19, 'Roman Gosnall', '147-764-4132', 'PO Box 96322', 'GYaNA2FT', 'rgosnalli@macromedia.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (20, 'Karoline Cooney', '455-171-5445', 'Room 1060', 'wRaTpyzW2FV', 'kcooneyj@bloglines.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (21, 'Inglis Forster', '840-682-8455', 'PO Box 57430', 'JB5xuHfy57Zx', 'iforsterk@symantec.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (22, 'Nora Dupree', '374-257-6253', 'PO Box 44259', '2gGjyU', 'ndupreel@posterous.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (23, 'Hartwell Olivera', '743-147-9247', '14th Floor', 'jVdcIaB', 'holiveram@dropbox.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (24, 'Igor Branigan', '983-581-6781', 'Apt 194', 'AXMzgs7', 'ibranigann@mac.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (25, 'Murvyn Newart', '818-714-3250', 'Room 6', 'KZTC6H9Yr', 'mnewarto@nytimes.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (26, 'Giraud Pidwell', '159-711-7140', 'Suite 35', 'qoMOcUieS', 'gpidwellp@infoseek.co.jp');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (27, 'Nikkie Feeham', '137-648-0411', '1st Floor', 'fumU4t', 'nfeehamq@friendfeed.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (28, 'Thaine Redmell', '835-421-6054', 'Room 169', 'Jg6vGV78', 'tredmellr@hexun.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (29, 'Lilllie Ranyelld', '164-386-6579', 'Apt 772', 'qKlYGpFVy5X', 'lranyellds@youtu.be');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (30, 'Wald Bonnick', '911-974-8854', 'Suite 12', 'A7EveYtmK6', 'wbonnickt@w3.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (31, 'Mariel Stutard', '973-294-4029', 'Suite 94', 'WcXMUUAH', 'mstutardu@php.net');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (32, 'Ranice Langthorn', '992-396-4219', 'PO Box 52260', '2s0jlHw', 'rlangthornv@prnewswire.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (33, 'Opaline Rubartelli', '460-374-8593', 'Room 1959', 'QYFParpS', 'orubartelliw@tamu.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (34, 'Ned Duckerin', '655-368-0318', 'Apt 299', 'dDWusuPe3', 'nduckerinx@wordpress.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (35, 'Denny Cosbee', '824-219-9926', 'PO Box 18760', 'hL2AEAQJ', 'dcosbeey@washington.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (36, 'Elston Leopold', '386-500-5523', 'PO Box 50134', 'Q8f1wBwvZD', 'eleopoldz@jiathis.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (37, 'Bertina Vitler', '521-770-3216', 'PO Box 25203', 'Q0sX9m9hfB', 'bvitler10@state.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (38, 'Hodge Battlestone', '586-572-3851', 'Room 1338', '3W3p6Y7', 'hbattlestone11@flickr.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (39, 'Keenan Sackes', '589-269-1930', '19th Floor', 'KRDmZSE', 'ksackes12@illinois.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (40, 'Clevie McAllaster', '778-844-2325', 'Suite 74', '7U82wwi', 'cmcallaster13@redcross.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (41, 'Cyrille Myring', '856-792-8791', 'Suite 19', '60uJ4P3jA0o', 'cmyring14@theglobeandmail.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (42, 'Cristina Dodson', '739-462-1368', 'Apt 1870', '6M7DvTpSKala', 'cdodson15@ehow.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (43, 'Della Tidball', '785-749-4419', 'PO Box 17391', 'dsXSiQh', 'dtidball16@cnet.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (44, 'Jobyna Kruschev', '449-552-6872', 'PO Box 55917', '4pvbSLdWUWh', 'jkruschev17@huffingtonpost.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (45, 'Artus Passion', '979-210-7044', '2nd Floor', '3Y383LyVkm', 'apassion18@techcrunch.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (46, 'Delly Beddis', '156-823-3092', 'Suite 65', 'R8yHzNlOEZv', 'dbeddis19@example.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (47, 'Templeton Muat', '299-689-1472', 'Suite 22', 'fO1RYIRCBJB', 'tmuat1a@google.com.au');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (48, 'Rutledge Tesseyman', '245-438-0063', 'Apt 1355', 'ASP183', 'rtesseyman1b@pagesperso-orange.fr');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (49, 'Miltie Hlavecek', '118-661-9079', 'PO Box 78953', 'bl0poHngb', 'mhlavecek1c@chronoengine.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (50, 'Dalston Rosbotham', '553-342-5959', 'Suite 62', 'Ft4z9Hn', 'drosbotham1d@newsvine.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (51, 'Silvie Scarth', '702-423-1245', '1st Floor', 'm7hJSFUq6Qck', 'sscarth1e@cnbc.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (52, 'George McKea', '890-503-8291', 'Apt 1987', 'hqMvjWThspS', 'gmckea1f@skype.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (53, 'Ruddy Gong', '694-347-0624', 'Room 983', 'ODiYJ3', 'rgong1g@dedecms.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (54, 'Bond Husthwaite', '374-809-8493', 'PO Box 51522', 's1b5d3GzV', 'bhusthwaite1h@mediafire.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (55, 'Zak Kevlin', '906-283-9663', 'PO Box 31428', 'fct12F', 'zkevlin1i@a8.net');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (56, 'Herschel Glader', '552-927-7701', 'Suite 36', 'twdXSc1', 'hglader1j@soup.io');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (57, 'Danyelle Bond', '508-146-9441', 'Suite 82', 'su3wvFQbYm5t', 'dbond1k@reference.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (58, 'Berri Klainer', '478-318-6429', 'PO Box 81596', 'rjnHNowR', 'bklainer1l@squidoo.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (59, 'Felicdad Churn', '737-330-9150', 'Apt 445', 'yHXrkvW', 'fchurn1m@jigsy.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (60, 'Jeramie Roggeman', '321-941-6905', 'Apt 1754', 'eV8TRfSzRQ', 'jroggeman1n@hatena.ne.jp');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (61, 'Dottie Grouer', '587-675-7539', '2nd Floor', 'nUjXsfj7IQjm', 'dgrouer1o@ovh.net');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (62, 'Janeva Butfield', '188-214-9562', 'Apt 422', 'kyBsS1iQAvm', 'jbutfield1p@desdev.cn');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (63, 'Hasty Savile', '698-177-6254', '10th Floor', 'GSOdeOeCROGG', 'hsavile1q@webeden.co.uk');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (64, 'Dory Densie', '100-714-4465', 'Room 1274', 'krB1ce', 'ddensie1r@mapquest.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (65, 'Dinnie Dillway', '729-846-5783', 'Room 941', 'zKcLqpnv7U', 'ddillway1s@vimeo.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (66, 'Errick Bruhnke', '455-267-5568', '16th Floor', '5kW1fQYDl', 'ebruhnke1t@ehow.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (67, 'Flem Berkely', '257-897-2101', 'PO Box 50057', '8Nokyqu', 'fberkely1u@patch.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (68, 'Naomi Couche', '196-850-3088', 'Room 1161', 'brWynN', 'ncouche1v@tinypic.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (69, 'Marlow Gurry', '672-161-6573', '10th Floor', 'qT0VCNXJo', 'mgurry1w@creativecommons.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (70, 'Anallese Hammerson', '458-593-4953', 'PO Box 48845', 'UY4ma9HOIog', 'ahammerson1x@loc.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (71, 'Goddard Annesley', '992-615-9675', 'PO Box 26568', 'bXhm4wYg', 'gannesley1y@dedecms.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (72, 'Tucky Sainer', '973-140-5982', 'Suite 24', 'yp6PhIATGtz5', 'tsainer1z@printfriendly.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (73, 'Fenelia Rooke', '363-730-9768', 'Room 300', 'LqX8E9xmjkB', 'frooke20@netscape.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (74, 'Adiana Merriment', '361-679-1890', 'PO Box 74888', 'rbXPkYbq', 'amerriment21@latimes.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (75, 'Daniele Zupo', '107-452-2387', 'Room 16', 'QOJcNxPuu7g4', 'dzupo22@ftc.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (76, 'Max Geraldo', '721-556-5995', 'Suite 96', '6qFey8CrzGw', 'mgeraldo23@shareasale.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (77, 'Katleen Montford', '114-450-9916', '18th Floor', 'n4t2kESc', 'kmontford24@webeden.co.uk');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (78, 'Oberon Hinchcliffe', '372-595-4419', '4th Floor', '0udkvYA13zA4', 'ohinchcliffe25@twitpic.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (79, 'Tilly Petrushanko', '927-652-6257', '17th Floor', '4IYlqV', 'tpetrushanko26@topsy.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (80, 'Falito Oag', '932-503-6419', 'Room 559', '0HzqzHRJbs', 'foag27@liveinternet.ru');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (81, 'Bird Gosalvez', '793-115-5843', 'Suite 94', '1BRiRF3SqXR1', 'bgosalvez28@msu.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (82, 'Brien MacMeanma', '451-790-2564', 'Apt 1579', 'wjNZ3DfCWwv', 'bmacmeanma29@va.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (83, 'Hephzibah Udall', '392-258-1045', '14th Floor', 'ifmydsAr7K', 'hudall2a@nba.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (84, 'Mickey Shire', '513-508-8898', 'Suite 80', 'e4PpKhMSs', 'mshire2b@ezinearticles.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (85, 'Aguste Gilson', '888-945-5376', 'Room 1372', 'oKywTg', 'agilson2c@surveymonkey.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (86, 'Thebault Kersey', '545-170-8822', 'Suite 62', '5TmJc1IhkIy', 'tkersey2d@yellowpages.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (87, 'Karine Kunzler', '559-590-3436', 'PO Box 41216', 'DyAm51OKJ3hg', 'kkunzler2e@mysql.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (88, 'Anastasie Mc Andrew', '893-992-2637', 'Room 86', 'wwbsWS', 'amc2f@eventbrite.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (89, 'Dasya Bovis', '202-354-2289', '6th Floor', 'htdD2Jj', 'dbovis2g@nps.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (90, 'Kurt Simonite', '294-946-5156', '20th Floor', 'WS8wMKh7ahb', 'ksimonite2h@virginia.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (91, 'Curran Van der Kruys', '400-748-2829', 'Suite 59', 'OqoxDkHF', 'cvan2i@independent.co.uk');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (92, 'Henderson Lindores', '557-518-0159', 'PO Box 14104', '09Xv9dUsG', 'hlindores2j@sogou.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (93, 'Guthrey Woollaston', '836-298-7326', 'Suite 23', 'rbPwnG', 'gwoollaston2k@squarespace.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (94, 'Clio Dabney', '821-656-6669', '7th Floor', 'Ln0TwhBEuulS', 'cdabney2l@reuters.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (95, 'Nealy Jouanet', '574-789-5606', 'Apt 392', '4zBvyWq8n', 'njouanet2m@yellowbook.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (96, 'Timofei Bulfoot', '660-422-8275', 'Apt 533', 'LF1sIf', 'tbulfoot2n@mit.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (97, 'Garrott Addinall', '964-147-2341', 'Room 656', 'Mn2S3Mu', 'gaddinall2o@msu.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (98, 'Blayne Antecki', '775-933-8616', '14th Floor', 'S0HqkVS', 'bantecki2p@comcast.net');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (99, 'Shalna Somers', '488-838-1144', '20th Floor', 'SnmRaiXOTsDu', 'ssomers2q@tumblr.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (100, 'Lebbie Huggan', '739-412-5757', 'Room 1523', '8ZNFZ9ns', 'lhuggan2r@soup.io');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (101, 'Andre Samuel', '575-712-4293', 'Suite 4', 'GYURQmwK', 'asamuel2s@state.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (102, 'Denis Gornar', '940-340-2936', 'Apt 487', 'MmUWykZ5', 'dgornar2t@so-net.ne.jp');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (103, 'Denney Mc Caughan', '759-248-0304', 'Suite 44', 'gv3dXaM1', 'dmc2u@creativecommons.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (104, 'Elvina Crosfeld', '246-815-1572', 'Suite 100', 'yJSiqgV77X', 'ecrosfeld2v@whitehouse.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (105, 'Janka Mattheis', '735-715-2425', 'Apt 18', 'fETkTzVtSNeZ', 'jmattheis2w@google.it');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (106, 'Zarah Figures', '985-356-6355', 'Room 233', 'jCETyxh', 'zfigures2x@goodreads.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (107, 'Deonne Gibbens', '503-548-0454', 'Room 1580', 'mJP91XD', 'dgibbens2y@prlog.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (108, 'Guntar Threadgould', '935-552-2222', '7th Floor', 'PDvc7S', 'gthreadgould2z@home.pl');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (109, 'Susann Hinchshaw', '392-292-6749', 'PO Box 99268', 'KjMckedbt3Cu', 'shinchshaw30@prweb.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (110, 'Sig Birdwhistle', '868-681-4187', 'Apt 698', 'ISndiUA0L5T1', 'sbirdwhistle31@yellowbook.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (111, 'Kath Accomb', '324-267-7091', 'Apt 788', 'lDeYhaadl', 'kaccomb32@4shared.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (112, 'Brenden Froom', '475-292-2164', '12th Floor', 'e6yekVK', 'bfroom33@apache.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (113, 'Etta Tureville', '726-930-4541', '8th Floor', 'UXqLcG7zK9', 'etureville34@usnews.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (114, 'Anita Kingzet', '606-713-2235', 'Room 104', 'DDcIH8ICvMb', 'akingzet35@delicious.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (115, 'Teriann Bygott', '510-422-1670', 'PO Box 16683', 'BdvNo8TPI', 'tbygott36@forbes.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (116, 'Chaim Checchi', '365-434-3243', 'Apt 1873', 'MCGWcu', 'cchecchi37@blinklist.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (117, 'Silvano Eneas', '700-219-7312', 'Suite 11', '8alRlo2ffXK1', 'seneas38@youku.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (118, 'Dunstan Zima', '607-396-0930', 'Apt 28', '7d4WSG', 'dzima39@sohu.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (119, 'Wolf Dinis', '322-493-8847', '16th Floor', 'Djig2lLEVU', 'wdinis3a@nih.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (120, 'Annabelle Mowne', '219-323-0408', '1st Floor', 'r3Igb5FB', 'amowne3b@phoca.cz');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (121, 'Anderson Glenwright', '111-370-6310', '1st Floor', 'fasFisOg', 'aglenwright3c@desdev.cn');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (122, 'Micah Scotney', '607-501-4327', 'Apt 38', 'FVA2Zt4zpaF', 'mscotney3d@chron.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (123, 'Maridel Cope', '622-822-0269', 'Suite 21', 'N74RnlyL', 'mcope3e@canalblog.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (124, 'Lester Maddick', '764-417-4351', 'Apt 1720', 'sJhw5dhYAFEu', 'lmaddick3f@omniture.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (125, 'Fan Messham', '176-694-8366', 'Apt 132', 'aFVo2Tho84e', 'fmessham3g@yale.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (126, 'Cary Henryson', '929-406-6241', 'Apt 56', 'DPZtlt0OdL1R', 'chenryson3h@ameblo.jp');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (127, 'Cyrill Alexis', '478-469-5067', 'Apt 704', 'j7L67KgBE', 'calexis3i@trellian.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (128, 'Krishnah Manton', '360-527-0479', 'Room 468', 'PnKEUkICbFM', 'kmanton3j@wp.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (129, 'Obed Eccleshare', '880-413-9060', 'Apt 1467', 'igxjBLkBIE4m', 'oeccleshare3k@shareasale.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (130, 'Alyse Cruwys', '703-560-9910', 'Room 428', 'ULwkNXU4MM3', 'acruwys3l@ed.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (131, 'Haskel Gillet', '598-788-7187', 'Suite 99', 'BPRkPHJ', 'hgillet3m@auda.org.au');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (132, 'Finlay Stoneman', '558-842-7933', 'PO Box 7416', 'p14sZoW', 'fstoneman3n@moonfruit.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (133, 'Cary Leroy', '848-827-5019', 'Room 1327', 'd9M1B7jN7', 'cleroy3o@printfriendly.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (134, 'Yalonda Cordaroy', '830-907-8399', 'Suite 48', 'iK36M5HHPa', 'ycordaroy3p@fda.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (135, 'Zaccaria Bofield', '784-243-1654', 'PO Box 50467', 'RCY4Ctd18B', 'zbofield3q@digg.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (136, 'Hildegarde Lidgertwood', '565-262-6450', 'Suite 97', 'RhTFgpE5jdUo', 'hlidgertwood3r@imdb.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (137, 'Kitty Kealey', '925-831-6742', 'PO Box 64599', '92oN88VG', 'kkealey3s@fema.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (138, 'Teresina Hirtzmann', '843-713-9064', 'PO Box 21319', 'zQFGqXVj', 'thirtzmann3t@usa.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (139, 'Vin Dorning', '197-308-5145', '12th Floor', 'Utk3Jn', 'vdorning3u@wikipedia.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (140, 'Dona Pallaske', '920-505-5831', 'PO Box 78029', 'viUSJMgt', 'dpallaske3v@timesonline.co.uk');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (141, 'Annamarie Walthew', '532-281-9883', 'Apt 987', '71QetD', 'awalthew3w@toplist.cz');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (142, 'Rochester Eisig', '171-271-8926', 'PO Box 92624', 'b1GwWd9', 'reisig3x@wikipedia.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (143, 'Meggy Riggeard', '683-256-3574', 'Apt 1887', 'Yfq6EEGWz', 'mriggeard3y@globo.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (144, 'Dorey Sneden', '757-987-8420', 'Apt 1396', 'oHu2ALzMq', 'dsneden3z@typepad.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (145, 'Arny Hacaud', '246-444-5600', 'Apt 842', '57TPeLH7xw', 'ahacaud40@wired.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (146, 'Elizabet Firsby', '143-198-0273', '7th Floor', 'pjyaIUHm', 'efirsby41@twitpic.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (147, 'Giraldo Trotton', '232-927-8074', 'Suite 14', 'VmlQFhrVv', 'gtrotton42@woothemes.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (148, 'Hatty Rignall', '127-585-7270', 'Suite 66', 'jV9WnGPBJuX', 'hrignall43@e-recht24.de');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (149, 'Chico Gooley', '984-608-7802', 'PO Box 6618', 'iNOjDJi', 'cgooley44@wsj.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (150, 'Winnah Stagg', '461-226-3386', '1st Floor', 'EFMIix', 'wstagg45@360.cn');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (151, 'Denny Dunbar', '390-722-3608', 'PO Box 77462', 'LhTEMDVaefr', 'ddunbar46@toplist.cz');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (152, 'Kary Lambard', '131-582-7814', 'Apt 298', '5mGIcN4Z4Je', 'klambard47@amazonaws.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (153, 'Cody Everiss', '301-854-9826', 'PO Box 80686', 'mufzyv7xJe0q', 'ceveriss48@archive.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (154, 'Benton Caskey', '214-688-2963', 'Room 763', 'xLd5exhT', 'bcaskey49@addtoany.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (155, 'Meier Saville', '485-799-5627', 'Apt 689', 'kCtkP9S', 'msaville4a@stumbleupon.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (156, 'Brok McColley', '562-913-1238', 'PO Box 37058', 'GwkXGuBC', 'bmccolley4b@ucsd.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (157, 'Elene Tadd', '498-848-3793', 'Room 1498', '1JOPdLj', 'etadd4c@ftc.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (158, 'Codie Darcey', '667-282-7088', 'Room 1349', 'ldJqNk', 'cdarcey4d@php.net');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (159, 'Maximo Wildes', '993-810-7336', 'PO Box 67197', 'apD6D49Ls3', 'mwildes4e@ihg.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (160, 'Mohandas Ockwell', '315-412-2291', 'PO Box 97047', 'Cf0udnu', 'mockwell4f@oracle.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (161, 'Mill Steabler', '318-930-8745', '15th Floor', 'QFwFK9T', 'msteabler4g@over-blog.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (162, 'Carlee Masey', '597-468-0130', '17th Floor', 'Zp1fcwg92zjp', 'cmasey4h@discovery.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (163, 'Fleurette Edgcombe', '672-625-7122', 'Suite 76', 'pTFzimzE', 'fedgcombe4i@washingtonpost.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (164, 'Lilly Crocumbe', '140-258-3864', 'PO Box 95498', 'j6eKnIp', 'lcrocumbe4j@fc2.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (165, 'Orelee Laydel', '478-187-9196', 'PO Box 39761', 'EX56qjn55g', 'olaydel4k@mac.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (166, 'Cristian McGilvra', '588-380-8326', 'PO Box 20135', 'VZrCN8n', 'cmcgilvra4l@moonfruit.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (167, 'Kore Surgenor', '850-882-1404', 'PO Box 13889', 'C3Dk0UNu', 'ksurgenor4m@engadget.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (168, 'Perkin Avramchik', '997-373-1252', 'PO Box 21261', '9owrRdXXsu', 'pavramchik4n@tamu.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (169, 'Helen-elizabeth Gaitskill', '730-723-2491', 'PO Box 56825', 'yl6F7feV9V', 'hgaitskill4o@washington.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (170, 'Linda Matiashvili', '993-972-4412', '7th Floor', 'tjw1MdkV', 'lmatiashvili4p@symantec.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (171, 'Falkner Sainte Paul', '645-805-1585', 'Room 1378', 'f1OCccwd86', 'fsainte4q@yahoo.co.jp');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (172, 'Webster Sebire', '612-985-8948', 'Room 1082', 'nXjwDL', 'wsebire4r@vk.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (173, 'Candis Pankethman', '678-446-5733', 'Apt 1848', '2yUNT5wN', 'cpankethman4s@mit.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (174, 'Wells D''Aulby', '763-607-0046', 'PO Box 21176', 'UBfAEEMXVJr0', 'wdaulby4t@google.pl');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (175, 'Wendall Ramsier', '800-215-5196', 'PO Box 51237', 'OpcjiX6XczW', 'wramsier4u@live.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (176, 'Roxine Barnaclough', '608-246-6687', '13th Floor', '5c2sSZYDlS5', 'rbarnaclough4v@huffingtonpost.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (177, 'Laurent Broomhall', '747-145-4180', 'PO Box 64006', 'ptRiTsAx6', 'lbroomhall4w@360.cn');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (178, 'Manfred Colley', '627-871-8303', 'Apt 332', 'GvhNhgVq7', 'mcolley4x@thetimes.co.uk');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (179, 'Ulises Densell', '793-180-7229', 'Apt 1952', 'bjJ3OE', 'udensell4y@stanford.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (180, 'Allyn Cinnamond', '556-939-4275', 'PO Box 63339', '9wzie0V27jY', 'acinnamond4z@blogspot.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (181, 'Euell Barthrup', '419-648-4277', 'Room 1383', 'HunyWj4pV', 'ebarthrup50@salon.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (182, 'Cherida Rought', '953-997-3016', 'Apt 1159', 'PHnKqv', 'crought51@irs.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (183, 'Raddie Abethell', '430-795-0562', 'Suite 43', 'o0fQn3', 'rabethell52@aboutads.info');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (184, 'Ringo Romanelli', '701-188-5586', 'Suite 2', 'DicYzUC', 'rromanelli53@unc.edu');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (185, 'Roderick Bunson', '749-134-0764', 'Suite 20', 'RX1LMvO', 'rbunson54@fotki.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (186, 'Gilly Berthot', '759-561-7589', 'Suite 13', 'vhb57BHqrPV', 'gberthot55@twitter.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (187, 'Donetta Kealy', '408-197-3108', '5th Floor', 'q6x0htVDwo', 'dkealy56@studiopress.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (188, 'Emery Vickress', '611-209-4596', 'Room 646', 'q60o52N', 'evickress57@trellian.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (189, 'Ermina Kubiczek', '160-853-2831', 'Apt 1322', 'ywaxJ1', 'ekubiczek58@phoca.cz');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (190, 'Karlen Ronaldson', '424-529-7835', 'Room 1976', 'a0qgRKusTsK', 'kronaldson59@forbes.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (191, 'Adriena Littrell', '408-458-5720', 'Room 676', 'm3kTho', 'alittrell5a@jugem.jp');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (192, 'Davidde Bussetti', '452-175-1555', '1st Floor', '4UScHyWm', 'dbussetti5b@dot.gov');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (193, 'Dredi Phlipon', '674-983-0739', 'Suite 34', 'S1VjG9N6g', 'dphlipon5c@china.com.cn');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (194, 'Yves Duchenne', '505-119-1372', 'Room 596', 'sX47ASBdQg', 'yduchenne5d@yandex.ru');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (195, 'Yorker Cumberledge', '728-987-6369', 'Suite 66', 'dtFtMHV', 'ycumberledge5e@bigcartel.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (196, 'Herve Kobisch', '856-748-5120', 'PO Box 93417', 'C5eliFqSP85w', 'hkobisch5f@pbs.org');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (197, 'Aleda Balazot', '873-986-7187', 'Suite 20', 'ECxIuNNqcUM', 'abalazot5g@fc2.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (198, 'Erin Lyes', '701-688-7331', 'Apt 288', 'EEOgkuGyDK', 'elyes5h@fotki.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (199, 'Mamie Knight', '548-999-4477', 'Apt 1242', 'bqQ7POvRhmml', 'mknight5i@github.com');
insert into Customers (customer_id, customer_name, phone_no, address, customer_password, email_id) values (200, 'Culley Bonnin', '301-911-0990', 'Room 1305', 'EA5st98lXd', 'cbonnin5j@shop-pro.jp');

CREATE TABLE `Admin` (
  `admin_id` INT NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  
  PRIMARY KEY (admin_id)
);

insert into Admin (admin_id, admin_name, admin_password) values (1, 'Moyna Pigford', 'IwWDWc2fBEiA');
insert into Admin (admin_id, admin_name, admin_password) values (2, 'Lanie Enston', 'pX6mrG');
insert into Admin (admin_id, admin_name, admin_password) values (3, 'Ofelia Cherm', '4i16Cg2');
insert into Admin (admin_id, admin_name, admin_password) values (4, 'Fredia Conkay', '6r4k3bJS');
insert into Admin (admin_id, admin_name, admin_password) values (5, 'Jens Mulholland', '72cSYgUHDck');
insert into Admin (admin_id, admin_name, admin_password) values (6, 'Dan Covill', '60r37o');
insert into Admin (admin_id, admin_name, admin_password) values (7, 'Arv Asch', '53PB3zg8Q');
insert into Admin (admin_id, admin_name, admin_password) values (8, 'Eada Stanway', '9jpq9Hi05zN1');
insert into Admin (admin_id, admin_name, admin_password) values (9, 'Cyrille Mothersole', 'LYS04KWz');
insert into Admin (admin_id, admin_name, admin_password) values (10, 'Farand Petrozzi', 'uTiKUt');

CREATE TABLE `Category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `category_discount` decimal(9,2) NOT NULL DEFAULT '0.00',
  
  CONSTRAINT discount_val CHECK (category_discount >= 0),
  PRIMARY KEY (category_id)
);

insert into Category (category_id, category_name, category_discount) values (1,  'Electronics and Gadgets', 15);
insert into Category (category_id, category_name, category_discount) values (2,  'Home and Kitchen', 20);
insert into Category (category_id, category_name, category_discount) values (3,  'Beauty and Personal Care', 10);
insert into Category (category_id, category_name, category_discount) values (4,  'Toys and Games', 30);
insert into Category (category_id, category_name, category_discount) values (5,  'Books and Office Supplies', 20);
insert into Category (category_id, category_name, category_discount) values (6,  'Sports and Fitness', 5);
insert into Category (category_id, category_name, category_discount) values (7, 'Clothing and Accessories', 10);


CREATE TABLE `Seller` (
  `seller_id` INT NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(50) NOT NULL,
  `seller_contact_no` varchar(12) NOT NULL,
  `seller_commission` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (seller_id)
);

insert into Seller (seller_id, seller_name, seller_contact_no, seller_commission) values (1, 'Mora Southern', '475-671-2263', 1.33);
insert into Seller (seller_id, seller_name, seller_contact_no, seller_commission) values (2, 'Gale Tatum', '813-305-1731', 17.45);
insert into Seller (seller_id, seller_name, seller_contact_no, seller_commission) values (3, 'Kaitlyn Boult', '582-139-3505', 2.62);
insert into Seller (seller_id, seller_name, seller_contact_no, seller_commission) values (4, 'Silvia Douse', '711-137-1985', 2.98);
insert into Seller (seller_id, seller_name, seller_contact_no, seller_commission) values (5, 'Aluin Kidney', '558-813-7784', 6.42);
insert into Seller (seller_id, seller_name, seller_contact_no, seller_commission) values (6, 'Agneta Pinckney', '676-399-4731', 15.36);
insert into Seller (seller_id, seller_name, seller_contact_no, seller_commission) values (7, 'Scotty Bramble', '876-984-8269', 5.75);
insert into Seller (seller_id, seller_name, seller_contact_no, seller_commission) values (8, 'Adi Stenet', '953-576-8756', 15.4);
insert into Seller (seller_id, seller_name, seller_contact_no, seller_commission) values (9, 'Jere Segar', '429-137-0500', 17.8);
insert into Seller (seller_id, seller_name, seller_contact_no, seller_commission) values (10, 'Leonore Burker', '636-384-9827', 19.89);


CREATE TABLE `Product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_price` decimal(9,2) NOT NULL,
  `seller_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `product_rating` decimal(9,2) DEFAULT '0',
  
  FOREIGN KEY (category_id) REFERENCES category(category_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (seller_id) REFERENCES seller(seller_id) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (product_id)
);

insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (1, 'T-shirt', 10, 1, 7, 2.77);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (2, 'Jeans', 30, 9, 7, 4.14);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (3, 'Hoodie', 25, 4, 7, 8.43);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (4, 'Sunglasses', 15, 1, 7, 1.23);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (5, 'Hat', 20, 3, 7, 6.7);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (6, 'Dress', 50, 4, 7, 7.07);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (7, 'Shoes', 70, 4, 7, 2.89);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (8, 'Jacket', 80, 10, 7, 3.53);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (9, 'Scarf', 15, 5, 7, 2.08);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (10, 'Handbag', 40, 3, 7, 3.54);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (11, 'Wallet', 20, 8, 7, 3.86);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (12, 'Smartphone', 700, 2, 1, 3.62);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (13, 'Tablet', 400, 6, 1, 5.32);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (14, 'Laptop', 1000, 7, 1, 7.64);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (15, 'Smartwatch', 300, 7, 1, 3.49);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (16, 'Wireless Earbuds', 150, 6, 1, 8.13);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (17, 'Smart Home Devices', 200, 4, 1, 4.35);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (18, 'Virtual Reality Headset', 500, 3, 1, 7.45);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (19, 'Action Camera', 300, 10, 1, 7.7);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (20, 'Wireless Charger', 50, 10, 1, 1.25);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (21, 'Portable Speaker', 100, 6, 1, 6.24);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (22, 'Power Bank', 30, 1, 1, 1.31);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (23, 'Bluetooth Headphones', 150, 10, 1, 8.93);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (24, 'Fitness Tracker', 100, 5, 1, 3.99);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (25, 'Wireless Keyboard', 40, 7, 1, 4.53);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (26, 'Wireless Mouse', 30, 5, 1, 1.57);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (27, 'Memory Card', 20, 5, 1, 1.06);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (28, 'Hard Drive', 80, 3, 1, 9.93);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (29, 'Phone Case', 20, 10, 1, 3.61);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (30, 'Screen Protector', 10, 9, 1, 9.18);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (31, 'Microwave', 100, 5, 2, 8.39);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (32, 'Blender', 50, 3, 2, 4.12);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (33, 'Toaster', 30, 8, 2, 2.18);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (34, 'Coffee Maker', 50, 1, 2, 9.33);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (35, 'Dish Towels', 5, 9, 2, 8.9);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (36, 'Dish Soap', 5, 1, 2, 9.6);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (37, 'Cutlery Set', 20, 7, 2, 8.62);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (38, 'Cookware Set', 100, 10, 2, 3.73);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (39, 'Baking Dish', 20, 3, 2, 7.6);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (40, 'Pots and Pans', 40, 5, 2, 9.99);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (41, 'Kitchen Utensils', 10, 8, 2, 5.14);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (42, 'Mixing Bowls', 20, 7, 2, 3.19);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (43, 'Measuring Cups', 10, 2, 2, 8.79);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (44, 'Can Opener', 10, 7, 2, 5.03);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (45, 'Food Storage Containers', 20, 10, 2, 9.83);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (46, 'Chopping Board', 15, 8, 2, 1.96);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (47, 'Tea Kettle', 20, 3, 2, 6.05);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (48, 'Moisturizer', 30, 4, 3, 6.3);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (49, 'Shampoo', 15, 2, 3, 6.1);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (50, 'Conditioner', 15, 2, 3, 5.68);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (51, 'Lip Balm', 5, 1, 3, 4.11);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (52, 'Body Wash', 20, 6, 3, 9.32);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (53, 'Soap', 5, 7, 3, 5.54);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (54, 'Toothbrush', 5, 8, 3, 8.64);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (55, 'Toothpaste', 5, 3, 3, 7.46);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (56, 'Razors', 10, 6, 3, 1.77);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (57, 'Shaving Cream', 10, 8, 3, 9.04);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (58, 'Makeup', 40, 10, 3, 7.63);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (59, 'Nail Polish', 10, 9, 3, 9.5);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (60, 'Hair Brush', 10, 1, 3, 7.31);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (61, 'Hair Dryer', 30, 5, 3, 4.9);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (62, 'Hair Straightener', 50, 10, 3, 5.41);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (63, 'Perfume', 40, 3, 3, 7.14);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (64, 'Deodorant', 10, 2, 3, 3.91);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (65, 'Hand Sanitizer', 5, 4, 3, 2.71);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (66, 'Sunscreen', 15, 9, 3, 7.1);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (67, 'Action Figures', 20, 4, 4, 3.65);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (68, 'Building Sets', 30, 3, 4, 5.27);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (69, 'Dolls', 15, 7, 4, 9.98);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (70, 'Puzzles', 10, 7, 4, 6.73);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (71, 'Board Games', 25, 10, 4, 5.75);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (72, 'Video Games', 60, 5, 4, 8.07);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (73, 'Outdoor Games', 40, 8, 4, 5.69);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (74, 'Sports Equipment', 50, 4, 4, 9.71);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (75, 'Arts and Crafts', 20, 3, 4, 8.18);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (76, 'STEM Toys', 30, 10, 4, 2.59);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (77, 'Books', 10, 10, 5, 4.51);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (78, 'Office Supplies', 5, 1, 5, 9.2);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (79, 'Notebooks', 2, 2, 5, 9.91);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (80, 'Pens', 1, 9, 5, 5.72);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (81, 'Paper', 3, 5, 5, 8.52);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (82, 'Folders', 2, 7, 5, 3.65);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (83, 'Envelopes', 1, 10, 5, 2.72);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (84, 'Stapler', 5, 3, 5, 8.24);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (85, 'Tape', 2, 7, 5, 9.97);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (86, 'Calculator', 10, 5, 5, 2.43);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (87, 'Basketball', 20, 8, 6, 3.55);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (88, 'Soccer Ball', 20, 6, 6, 8.09);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (89, 'Tennis Racket', 50, 9, 6, 9.69);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (90, 'Running Shoes', 100, 5, 6, 5.58);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (91, 'Weightlifting Gloves', 20, 6, 6, 9.71);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (92, 'Jump Rope', 5, 4, 6, 2.55);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (93, 'Yoga Mat', 30, 10, 6, 5.81);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (94, 'Dumbbells', 30, 6, 6, 2.2);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (95, 'Gym Bag', 20, 1, 6, 9.43);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (96, 'Cycling Shoes', 50, 6, 6, 5.74);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (97, 'Helmet', 40, 7, 6, 8.52);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (98, 'Swim Goggles', 15, 9, 6, 4.58);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (99, 'Ski Poles', 30, 1, 6, 2.81);
insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (100, 'Snowboard', 200, 3, 6, 9.91);

CREATE TABLE `Delivery_Partner` (
  `partner_id` INT NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(50) NOT NULL,
  `partner_contact_no` varchar(12) NOT NULL,
  `orders_completed` INT NOT NULL,
  `partner_rating` double DEFAULT 0,
  `partner_salary` INT DEFAULT 9999,
  
  CONSTRAINT salary CHECK (partner_salary > 9998),
  CONSTRAINT rating CHECK (partner_rating > -1),
  PRIMARY KEY (partner_id)
);

insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (1, 'Minnaminnie', '800-492-5955', 70, 8.281, 22862);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (2, 'Nisse', '272-456-8359', 4, 9.123, 21012);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (3, 'Mireielle', '253-155-5642', 37, 2.079, 20737);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (4, 'Dasha', '182-996-4614', 73, 8.079, 16624);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (5, 'Thor', '202-661-7409', 93, 8.613, 15455);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (6, 'Amery', '515-726-3812', 9, 2.595, 21456);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (7, 'Leanora', '386-958-7620', 90, 1.372, 15969);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (8, 'Natala', '586-264-1534', 61, 4.525, 11216);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (9, 'Buddy', '295-215-2159', 89, 3.11, 12269);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (10, 'Hurleigh', '353-241-9404', 89, 7.42, 27687);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (11, 'Fred', '233-216-1371', 72, 6.172, 25655);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (12, 'Rosina', '103-893-1964', 95, 7.229, 18321);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (13, 'Glenda', '240-998-6153', 33, 7.976, 20306);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (14, 'Zulema', '228-109-1062', 17, 8.011, 14004);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (15, 'Ronny', '600-568-3057', 75, 7.979, 22486);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (16, 'Umeko', '533-771-3233', 96, 3.84, 18136);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (17, 'Roobbie', '422-424-7824', 74, 3.046, 25633);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (18, 'Mordy', '730-202-4955', 73, 5.825, 12764);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (19, 'Tania', '327-542-0784', 93, 4.856, 18782);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (20, 'Teresa', '747-277-5096', 25, 8.917, 27862);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (21, 'Rosabel', '470-673-7600', 36, 7.762, 25376);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (22, 'Stanley', '409-808-1987', 62, 3.382, 24428);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (23, 'Seana', '501-610-6882', 19, 1.697, 15482);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (24, 'Burr', '464-429-2936', 43, 8.161, 16589);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (25, 'Magdalena', '570-163-5990', 20, 2.889, 28606);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (26, 'Amby', '919-932-7670', 31, 3.071, 11703);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (27, 'Asia', '431-461-8982', 18, 4.08, 20586);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (28, 'Allie', '803-701-7843', 18, 9.887, 19070);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (29, 'Ingelbert', '309-277-0876', 23, 1.198, 10480);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (30, 'Hanni', '848-107-7507', 6, 8.402, 17614);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (31, 'Lombard', '919-679-9982', 66, 8.628, 10389);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (32, 'Emlynn', '169-990-2505', 44, 5.95, 15092);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (33, 'Halimeda', '443-961-8056', 2, 6.708, 13087);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (34, 'Romona', '851-813-3472', 83, 6.873, 13392);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (35, 'Paola', '760-712-0156', 39, 6.54, 12611);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (36, 'Carrissa', '900-827-9977', 73, 7.733, 19678);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (37, 'Gian', '658-532-6228', 49, 3.169, 25984);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (38, 'Gaylord', '475-177-4591', 86, 2.962, 14403);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (39, 'Godfree', '218-262-0402', 87, 1.032, 13299);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (40, 'Vivie', '592-275-7851', 88, 1.723, 26357);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (41, 'Stavro', '334-951-8817', 42, 2.493, 22997);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (42, 'Aluino', '114-214-0910', 6, 7.681, 23366);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (43, 'Tally', '193-319-4269', 13, 1.529, 21568);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (44, 'Alina', '537-323-3578', 41, 2.835, 10444);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (45, 'Janna', '692-565-0199', 12, 8.22, 27574);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (46, 'Carolyn', '120-451-7042', 72, 6.902, 25934);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (47, 'Phyllis', '523-457-6425', 85, 7.529, 17812);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (48, 'Fan', '405-984-8328', 10, 2.831, 17437);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (49, 'Maia', '410-722-6939', 82, 9.281, 25075);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (50, 'Tammy', '818-617-6556', 64, 1.041, 11941);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (51, 'Angelia', '851-819-4673', 22, 4.717, 14737);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (52, 'Carmel', '759-192-1084', 67, 8.041, 26973);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (53, 'Halsy', '395-793-8421', 47, 1.839, 26388);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (54, 'Caleb', '885-813-6840', 7, 5.083, 21505);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (55, 'Clea', '797-854-7864', 76, 1.577, 20327);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (56, 'Orrin', '939-867-9541', 33, 2.19, 26806);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (57, 'Gerianne', '873-599-6641', 87, 6.679, 12681);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (58, 'Leonora', '850-101-6714', 29, 5.948, 16123);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (59, 'Eli', '446-696-8962', 60, 2.057, 27479);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (60, 'Isabelle', '664-434-0853', 59, 4.578, 10883);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (61, 'Peria', '327-198-3859', 36, 6.868, 27268);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (62, 'Margareta', '164-898-3767', 50, 2.297, 16682);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (63, 'Loria', '477-579-2987', 43, 6.267, 25743);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (64, 'Knox', '380-768-0639', 100, 4.486, 20748);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (65, 'Olivia', '145-574-9321', 4, 8.63, 14010);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (66, 'Gwyneth', '302-110-8233', 47, 1.332, 21298);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (67, 'Stormy', '187-393-0058', 97, 9.427, 11808);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (68, 'Earlie', '405-802-8881', 29, 2.706, 16697);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (69, 'Amelia', '424-435-8939', 5, 3.96, 18572);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (70, 'Carlee', '300-900-4292', 60, 8.791, 10163);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (71, 'Griffie', '736-457-0267', 39, 7.723, 23346);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (72, 'Syd', '868-963-7717', 98, 6.591, 29443);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (73, 'Melva', '471-122-1030', 36, 8.23, 22787);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (74, 'Trina', '509-610-3726', 22, 7.787, 26506);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (75, 'Sal', '345-909-7142', 27, 6.169, 15884);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (76, 'Monika', '530-294-4311', 88, 4.881, 22440);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (77, 'Karol', '683-561-3838', 95, 1.154, 14612);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (78, 'Morlee', '808-885-3563', 21, 2.658, 26323);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (79, 'Cahra', '784-901-2930', 40, 8.727, 27824);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (80, 'Mireille', '733-858-1193', 83, 5.502, 29393);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (81, 'Letitia', '308-244-8089', 46, 3.206, 26942);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (82, 'Fonsie', '936-659-1679', 47, 1.948, 24699);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (83, 'Temple', '820-232-2469', 55, 4.842, 25812);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (84, 'Aeriel', '759-387-4783', 42, 7.109, 24193);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (85, 'Egbert', '356-936-8070', 91, 2.644, 11572);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (86, 'Clyde', '417-563-7115', 58, 6.427, 29952);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (87, 'Tamara', '347-298-6054', 65, 1.327, 21571);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (88, 'Broddy', '607-697-7934', 40, 7.187, 22259);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (89, 'Rianon', '132-972-6023', 56, 6.78, 24771);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (90, 'Angeli', '524-600-9601', 84, 6.525, 23109);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (91, 'Brice', '576-790-7750', 19, 4.036, 18281);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (92, 'Robb', '755-287-7601', 75, 4.234, 26269);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (93, 'Zsa zsa', '912-319-6870', 92, 5.761, 18032);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (94, 'Cortie', '673-862-8721', 18, 7.423, 27900);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (95, 'Hagen', '956-491-4748', 64, 9.37, 19569);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (96, 'Reiko', '793-770-3291', 48, 3.128, 20316);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (97, 'Susann', '989-357-1466', 98, 8.154, 13069);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (98, 'Elvin', '127-419-9167', 98, 5.834, 10936);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (99, 'Mitchell', '655-631-7907', 7, 8.789, 26496);
insert into Delivery_partner (partner_id, partner_name, partner_contact_no, orders_completed, partner_rating, partner_salary) values (100, 'Paolo', '508-649-4486', 1, 7.679, 20950);

CREATE TABLE `Order_Items` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity_added` INT NOT NULL,
  `partner_id` INT NOT NULL,

   FOREIGN KEY (partner_id) REFERENCES delivery_partner(partner_id) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (product_id) REFERENCES product(product_id) ON UPDATE CASCADE ON DELETE CASCADE,
   PRIMARY KEY (order_id, customer_id, product_id),
   CONSTRAINT quant_check_order CHECK (quantity_added > 0)
);

insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (1, 4, 3, 12, 1);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (1, 4, 5, 2, 1);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (1, 4, 45, 42, 1);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (1, 4, 6, 1, 1);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (1, 4, 89, 3, 1);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (1, 4, 31, 4, 1);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (1, 4, 32, 5, 1);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (1, 4, 35, 6, 1);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (1, 4, 55, 2, 1);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (1, 4, 13, 6, 1);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (2, 2, 23, 1, 2);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (2, 2, 35, 2, 2);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (2, 2, 45, 4, 2);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (2, 2, 56, 1, 2);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (2, 2, 79, 3, 2);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (2, 2, 31, 4, 2);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (2, 2, 12, 5, 2);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (2, 2, 25, 6, 2);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (2, 2, 5, 6, 2);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (2, 2, 65, 7, 2);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (3, 1, 23, 1, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (3, 1, 35, 2, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (3, 1, 45, 4, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (3, 1, 56, 1, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (3, 1, 79, 3, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (3, 1, 31, 4, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (3, 1, 12, 5, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (3, 1, 25, 6, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (3, 1, 43, 6, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (3, 1, 65, 7, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (4, 4, 23, 1, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (4, 4, 35, 2, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (4, 4, 45, 4, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (4, 4, 56, 1, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (4, 4, 79, 3, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (4, 4, 31, 4, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (4, 4, 12, 5, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (4, 4, 25, 6, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (4, 4, 15, 6, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (4, 4, 65, 7, 4);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (5, 7, 13, 1, 6);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (5, 7, 45, 2, 6);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (5, 7, 32, 4, 6);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (5, 7, 66, 1, 6);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (5, 7, 89, 3, 6);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (5, 7, 21, 4, 6);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (5, 7, 12, 5, 6);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (5, 7, 4, 6, 6);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (5, 7, 57, 6, 6);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (5, 7, 65, 7, 6);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (6, 6, 23, 1, 5);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (6, 6, 35, 2, 5);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (6, 6, 45, 4, 5);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (6, 6, 50, 1, 5);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (6, 6, 43, 3, 5);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (6, 6, 76, 4, 5);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (6, 6, 32, 5, 5);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (6, 6, 85, 6, 5);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (6, 6, 15, 6, 5);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (6, 6, 25, 7, 5);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (7, 7, 13, 1, 7);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (7, 7, 45, 2, 7);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (7, 7, 2, 4, 7);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (7, 7, 66, 1, 7);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (7, 7, 89, 3, 7);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (7, 7, 21, 4, 7);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (7, 7, 12, 5, 7);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (7, 7, 5, 6, 7);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (7, 7, 57, 6, 7);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (7, 7, 65, 7, 7);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (8, 8, 23, 1, 8);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (8, 8, 65, 2, 8);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (8, 8, 75, 4, 8);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (8, 8, 3, 1, 8);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (8, 8, 84, 3, 8);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (8, 8, 32, 4, 8);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (8, 8, 12, 5, 8);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (8, 8, 41, 6, 8);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (8, 8, 51, 6, 8);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (8, 8, 87, 7, 8);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (9, 9, 13, 1, 9);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (9, 9, 45, 2, 9);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (9, 9, 4, 4, 9);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (9, 9, 66, 1, 9);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (9, 9, 89, 3, 9);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (9, 9, 21, 4, 9);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (9, 9, 12, 5, 9);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (9, 9, 5, 6, 9);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (9, 9, 57, 6, 9);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (9, 9, 65, 7, 9);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (10, 1, 23, 1, 3);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (10, 1, 65, 2, 3);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (10, 1, 75, 4, 3);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (10, 1, 2, 1, 3);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (10, 1, 84, 3, 3);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (10, 1, 32, 4, 3);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (10, 1, 12, 5, 3);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (10, 1, 41, 6, 3);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (10, 1, 51, 6, 3);
insert into Order_Items(order_id, customer_id, product_id, quantity_added, partner_id) values (10, 1, 87, 7, 3);


CREATE TABLE `Order_Payment` (
  `order_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `payment_mode` enum('Cash', 'Credit Card', 'UPI/Wallet', 'Netbanking') NOT NULL,
  `shipping_address` varchar(60) NOT NULL,
  `order_value` decimal(9,2) NOT NULL DEFAULT '0.00',
  `order_date` date NOT NULL,
  `status` INT NOT NULL,
  
  CONSTRAINT order_value CHECK (order_value > 0),
  FOREIGN KEY (order_id) REFERENCES order_items(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (order_id, customer_id)
);

insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (1, 4, 3, '2567 Steensland Pass', 6228, '2022-02-12 06:18:37', 2);
insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (2, 2, 4, '8 Nelson Hill', 8322, '2022-04-24 00:52:50', 0);
insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (3, 1, 2, '4108 Nova Terrace', 2841, '2022-08-10 16:21:35', 1);
insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (4, 4, 2, '9087 Nelson Hill', 3216, '2022-08-01 05:31:13', 2);
insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (5, 7, 3, '53755 Dryden Hill', 5957, '2022-03-20 16:52:30', 1);
insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (6, 6, 2, '20124 Derek Terrace', 6971, '2023-01-15 18:57:24', 0);
insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (7, 7, 2, '0 Mccormick Court', 8147, '2022-08-23 20:27:37', 0);
insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (8, 8, 3, '80181 Chive Alley', 1435, '2022-10-09 07:35:13', 0);
insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (9, 9, 2, '0072 Sherman Hill', 1832, '2022-03-16 15:24:19', 1);
insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (10, 1, 4, '238 Boyd Hill', 3851, '2022-07-01 16:53:47', 0);

CREATE TABLE `Cart` (
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `product_quantity` INT NOT NULL,

  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES product(product_id) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (product_id, customer_id),
  CONSTRAINT quant_check_cart CHECK (product_quantity > 0)
);
insert into Cart (customer_id, product_id, product_quantity) values (1, 69, 12);
insert into Cart (customer_id, product_id, product_quantity) values (2, 18, 3);
insert into Cart (customer_id, product_id, product_quantity) values (1, 18, 16);
insert into Cart (customer_id, product_id, product_quantity) values (1, 64, 12);
insert into Cart (customer_id, product_id, product_quantity) values (3, 2, 14);
insert into Cart (customer_id, product_id, product_quantity) values (4, 65, 16);
insert into Cart (customer_id, product_id, product_quantity) values (4, 10, 17);
insert into Cart (customer_id, product_id, product_quantity) values (4, 76, 19);
insert into Cart (customer_id, product_id, product_quantity) values (5, 93, 3);
insert into Cart (customer_id, product_id, product_quantity) values (192, 54, 15);
insert into Cart (customer_id, product_id, product_quantity) values (15, 29, 9);
insert into Cart (customer_id, product_id, product_quantity) values (19, 2, 3);
insert into Cart (customer_id, product_id, product_quantity) values (11, 18, 15);
insert into Cart (customer_id, product_id, product_quantity) values (11, 52, 8);
insert into Cart (customer_id, product_id, product_quantity) values (17, 93, 9);
insert into Cart (customer_id, product_id, product_quantity) values (42, 70, 7);
insert into Cart (customer_id, product_id, product_quantity) values (11, 85, 4);
insert into Cart (customer_id, product_id, product_quantity) values (86, 44, 12);
insert into Cart (customer_id, product_id, product_quantity) values (19, 35, 7);
insert into Cart (customer_id, product_id, product_quantity) values (48, 1, 2);
insert into Cart (customer_id, product_id, product_quantity) values (16, 70, 2);
insert into Cart (customer_id, product_id, product_quantity) values (4, 46, 16);
insert into Cart (customer_id, product_id, product_quantity) values (18, 68, 18);
insert into Cart (customer_id, product_id, product_quantity) values (58, 29, 19);
insert into Cart (customer_id, product_id, product_quantity) values (57, 5, 7);
insert into Cart (customer_id, product_id, product_quantity) values (83, 36, 15);
insert into Cart (customer_id, product_id, product_quantity) values (24, 53, 6);
insert into Cart (customer_id, product_id, product_quantity) values (77, 70, 3);
insert into Cart (customer_id, product_id, product_quantity) values (18, 70, 18);
insert into Cart (customer_id, product_id, product_quantity) values (16, 98, 14);
insert into Cart (customer_id, product_id, product_quantity) values (19, 77, 15);
insert into Cart (customer_id, product_id, product_quantity) values (96, 10, 1);
insert into Cart (customer_id, product_id, product_quantity) values (14, 74, 13);
insert into Cart (customer_id, product_id, product_quantity) values (96, 95, 14);
insert into Cart (customer_id, product_id, product_quantity) values (97, 31, 9);
insert into Cart (customer_id, product_id, product_quantity) values (11, 65, 2);
insert into Cart (customer_id, product_id, product_quantity) values (29, 72, 4);
insert into Cart (customer_id, product_id, product_quantity) values (10, 95, 2);
insert into Cart (customer_id, product_id, product_quantity) values (18, 41, 2);
insert into Cart (customer_id, product_id, product_quantity) values (30, 71, 14);
insert into Cart (customer_id, product_id, product_quantity) values (16, 87, 18);
insert into Cart (customer_id, product_id, product_quantity) values (12, 13, 14);
insert into Cart (customer_id, product_id, product_quantity) values (88, 1, 7);
insert into Cart (customer_id, product_id, product_quantity) values (39, 98, 10);
insert into Cart (customer_id, product_id, product_quantity) values (63, 51, 18);
insert into Cart (customer_id, product_id, product_quantity) values (58, 22, 2);
insert into Cart (customer_id, product_id, product_quantity) values (15, 42, 7);
insert into Cart (customer_id, product_id, product_quantity) values (12, 84, 7);
insert into Cart (customer_id, product_id, product_quantity) values (8, 73, 11);
insert into Cart (customer_id, product_id, product_quantity) values (77, 13, 5);
insert into Cart (customer_id, product_id, product_quantity) values (12, 90, 4);
insert into Cart (customer_id, product_id, product_quantity) values (14, 88, 12);
insert into Cart (customer_id, product_id, product_quantity) values (20, 3, 8);
insert into Cart (customer_id, product_id, product_quantity) values (4, 78, 12);
insert into Cart (customer_id, product_id, product_quantity) values (10, 88, 2);
insert into Cart (customer_id, product_id, product_quantity) values (10, 18, 10);
insert into Cart (customer_id, product_id, product_quantity) values (14, 99, 19);
insert into Cart (customer_id, product_id, product_quantity) values (9, 3, 19);
insert into Cart (customer_id, product_id, product_quantity) values (6, 48, 7);
insert into Cart (customer_id, product_id, product_quantity) values (97, 78, 19);
insert into Cart (customer_id, product_id, product_quantity) values (165, 67, 15);
insert into Cart (customer_id, product_id, product_quantity) values (121, 6, 13);
insert into Cart (customer_id, product_id, product_quantity) values (86, 21, 2);
insert into Cart (customer_id, product_id, product_quantity) values (9, 38, 16);
insert into Cart (customer_id, product_id, product_quantity) values (46, 37, 18);
insert into Cart (customer_id, product_id, product_quantity) values (24, 12, 10);
insert into Cart (customer_id, product_id, product_quantity) values (75, 84, 15);
insert into Cart (customer_id, product_id, product_quantity) values (133, 8, 3);
insert into Cart (customer_id, product_id, product_quantity) values (31, 33, 16);
insert into Cart (customer_id, product_id, product_quantity) values (87, 15, 9);
insert into Cart (customer_id, product_id, product_quantity) values (71, 45, 8);
insert into Cart (customer_id, product_id, product_quantity) values (1, 34, 16);
insert into Cart (customer_id, product_id, product_quantity) values (66, 71, 12);
insert into Cart (customer_id, product_id, product_quantity) values (173, 45, 9);
insert into Cart (customer_id, product_id, product_quantity) values (155, 80, 7);
insert into Cart (customer_id, product_id, product_quantity) values (4, 72, 9);
insert into Cart (customer_id, product_id, product_quantity) values (69, 79, 11);
insert into Cart (customer_id, product_id, product_quantity) values (188, 99, 4);
insert into Cart (customer_id, product_id, product_quantity) values (125, 52, 7);
insert into Cart (customer_id, product_id, product_quantity) values (66, 69, 6);
insert into Cart (customer_id, product_id, product_quantity) values (15, 56, 9);
insert into Cart (customer_id, product_id, product_quantity) values (6, 75, 15);
insert into Cart (customer_id, product_id, product_quantity) values (71, 41, 16);
insert into Cart (customer_id, product_id, product_quantity) values (19, 88, 1);
insert into Cart (customer_id, product_id, product_quantity) values (185, 73, 9);
insert into Cart (customer_id, product_id, product_quantity) values (198, 11, 1);
insert into Cart (customer_id, product_id, product_quantity) values (183, 31, 13);
insert into Cart (customer_id, product_id, product_quantity) values (124, 11, 10);
insert into Cart (customer_id, product_id, product_quantity) values (89, 24, 8);
insert into Cart (customer_id, product_id, product_quantity) values (50, 44, 3);
insert into Cart (customer_id, product_id, product_quantity) values (182, 46, 17);
insert into Cart (customer_id, product_id, product_quantity) values (98, 89, 11);
insert into Cart (customer_id, product_id, product_quantity) values (109, 50, 8);
insert into Cart (customer_id, product_id, product_quantity) values (32, 1, 2);
insert into Cart (customer_id, product_id, product_quantity) values (76, 69, 12);
insert into Cart (customer_id, product_id, product_quantity) values (192, 50, 1);
insert into Cart (customer_id, product_id, product_quantity) values (71, 67, 6);
insert into Cart (customer_id, product_id, product_quantity) values (90, 49, 3);
insert into Cart (customer_id, product_id, product_quantity) values (153, 33, 1);
insert into Cart (customer_id, product_id, product_quantity) values (52, 34, 6);


CREATE TABLE `Inventory` (
  `product_id` INT NOT NULL,
  `quantity_in_stock` INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (product_id),
  CONSTRAINT quant_check_inventory CHECK (quantity_in_stock > 0)
);

insert into Inventory (product_id, quantity_in_stock) values (1, 53);
insert into Inventory (product_id, quantity_in_stock) values (2, 67);
insert into Inventory (product_id, quantity_in_stock) values (3, 59);
insert into Inventory (product_id, quantity_in_stock) values (4, 69);
insert into Inventory (product_id, quantity_in_stock) values (5, 58);
insert into Inventory (product_id, quantity_in_stock) values (6, 86);
insert into Inventory (product_id, quantity_in_stock) values (7, 92);
insert into Inventory (product_id, quantity_in_stock) values (8, 42);
insert into Inventory (product_id, quantity_in_stock) values (9, 98);
insert into Inventory (product_id, quantity_in_stock) values (10, 71);
insert into Inventory (product_id, quantity_in_stock) values (11, 50);
insert into Inventory (product_id, quantity_in_stock) values (12, 82);
insert into Inventory (product_id, quantity_in_stock) values (13, 66);
insert into Inventory (product_id, quantity_in_stock) values (14, 55);
insert into Inventory (product_id, quantity_in_stock) values (15, 53);
insert into Inventory (product_id, quantity_in_stock) values (16, 68);
insert into Inventory (product_id, quantity_in_stock) values (17, 69);
insert into Inventory (product_id, quantity_in_stock) values (18, 63);
insert into Inventory (product_id, quantity_in_stock) values (19, 95);
insert into Inventory (product_id, quantity_in_stock) values (20, 43);
insert into Inventory (product_id, quantity_in_stock) values (21, 69);
insert into Inventory (product_id, quantity_in_stock) values (22, 98);
insert into Inventory (product_id, quantity_in_stock) values (23, 80);
insert into Inventory (product_id, quantity_in_stock) values (24, 74);
insert into Inventory (product_id, quantity_in_stock) values (25, 64);
insert into Inventory (product_id, quantity_in_stock) values (26, 68);
insert into Inventory (product_id, quantity_in_stock) values (27, 87);
insert into Inventory (product_id, quantity_in_stock) values (28, 79);
insert into Inventory (product_id, quantity_in_stock) values (29, 69);
insert into Inventory (product_id, quantity_in_stock) values (30, 42);
insert into Inventory (product_id, quantity_in_stock) values (31, 76);
insert into Inventory (product_id, quantity_in_stock) values (32, 41);
insert into Inventory (product_id, quantity_in_stock) values (33, 63);
insert into Inventory (product_id, quantity_in_stock) values (34, 57);
insert into Inventory (product_id, quantity_in_stock) values (35, 46);
insert into Inventory (product_id, quantity_in_stock) values (36, 78);
insert into Inventory (product_id, quantity_in_stock) values (37, 73);
insert into Inventory (product_id, quantity_in_stock) values (38, 57);
insert into Inventory (product_id, quantity_in_stock) values (39, 97);
insert into Inventory (product_id, quantity_in_stock) values (40, 70);
insert into Inventory (product_id, quantity_in_stock) values (41, 76);
insert into Inventory (product_id, quantity_in_stock) values (42, 88);
insert into Inventory (product_id, quantity_in_stock) values (43, 69);
insert into Inventory (product_id, quantity_in_stock) values (44, 44);
insert into Inventory (product_id, quantity_in_stock) values (45, 49);
insert into Inventory (product_id, quantity_in_stock) values (46, 76);
insert into Inventory (product_id, quantity_in_stock) values (47, 75);
insert into Inventory (product_id, quantity_in_stock) values (48, 80);
insert into Inventory (product_id, quantity_in_stock) values (49, 95);
insert into Inventory (product_id, quantity_in_stock) values (50, 81);
insert into Inventory (product_id, quantity_in_stock) values (51, 58);
insert into Inventory (product_id, quantity_in_stock) values (52, 50);
insert into Inventory (product_id, quantity_in_stock) values (53, 58);
insert into Inventory (product_id, quantity_in_stock) values (54, 75);
insert into Inventory (product_id, quantity_in_stock) values (55, 85);
insert into Inventory (product_id, quantity_in_stock) values (56, 56);
insert into Inventory (product_id, quantity_in_stock) values (57, 93);
insert into Inventory (product_id, quantity_in_stock) values (58, 95);
insert into Inventory (product_id, quantity_in_stock) values (59, 50);
insert into Inventory (product_id, quantity_in_stock) values (60, 50);
insert into Inventory (product_id, quantity_in_stock) values (61, 59);
insert into Inventory (product_id, quantity_in_stock) values (62, 91);
insert into Inventory (product_id, quantity_in_stock) values (63, 67);
insert into Inventory (product_id, quantity_in_stock) values (64, 100);
insert into Inventory (product_id, quantity_in_stock) values (65, 62);
insert into Inventory (product_id, quantity_in_stock) values (66, 41);
insert into Inventory (product_id, quantity_in_stock) values (67, 53);
insert into Inventory (product_id, quantity_in_stock) values (68, 41);
insert into Inventory (product_id, quantity_in_stock) values (69, 85);
insert into Inventory (product_id, quantity_in_stock) values (70, 70);
insert into Inventory (product_id, quantity_in_stock) values (71, 49);
insert into Inventory (product_id, quantity_in_stock) values (72, 65);
insert into Inventory (product_id, quantity_in_stock) values (73, 68);
insert into Inventory (product_id, quantity_in_stock) values (74, 77);
insert into Inventory (product_id, quantity_in_stock) values (75, 52);
insert into Inventory (product_id, quantity_in_stock) values (76, 59);
insert into Inventory (product_id, quantity_in_stock) values (77, 87);
insert into Inventory (product_id, quantity_in_stock) values (78, 51);
insert into Inventory (product_id, quantity_in_stock) values (79, 84);
insert into Inventory (product_id, quantity_in_stock) values (80, 87);
insert into Inventory (product_id, quantity_in_stock) values (81, 75);
insert into Inventory (product_id, quantity_in_stock) values (82, 64);
insert into Inventory (product_id, quantity_in_stock) values (83, 99);
insert into Inventory (product_id, quantity_in_stock) values (84, 73);
insert into Inventory (product_id, quantity_in_stock) values (85, 64);
insert into Inventory (product_id, quantity_in_stock) values (86, 74);
insert into Inventory (product_id, quantity_in_stock) values (87, 68);
insert into Inventory (product_id, quantity_in_stock) values (88, 42);
insert into Inventory (product_id, quantity_in_stock) values (89, 93);
insert into Inventory (product_id, quantity_in_stock) values (90, 76);
insert into Inventory (product_id, quantity_in_stock) values (91, 57);
insert into Inventory (product_id, quantity_in_stock) values (92, 53);
insert into Inventory (product_id, quantity_in_stock) values (93, 42);
insert into Inventory (product_id, quantity_in_stock) values (94, 75);
insert into Inventory (product_id, quantity_in_stock) values (95, 58);
insert into Inventory (product_id, quantity_in_stock) values (96, 83);
insert into Inventory (product_id, quantity_in_stock) values (97, 61);
insert into Inventory (product_id, quantity_in_stock) values (98, 69);
insert into Inventory (product_id, quantity_in_stock) values (99, 46);
insert into Inventory (product_id, quantity_in_stock) values (100, 81);
