INSERT INTO employees 
(employee_id, first_name, last_name, email, phone, hire_date, manager_id, job_title, team_id) VALUES

-- CEO
(1,'James','Carter','james.carter@company.com','08000000001','2015-01-01',NULL,'Chief Executive Officer',1),

-- VPs
(2,'Sarah','Mitchell','sarah.mitchell@company.com','08000000002','2016-02-01',1,'VP Sales',1),
(3,'David','Nguyen','david.nguyen@company.com','08000000003','2016-03-01',1,'VP Technology',2),
(4,'Linda','Brown','linda.brown@company.com','08000000004','2016-04-01',1,'VP Finance',3),
(5,'Michael','Johnson','michael.johnson@company.com','08000000005','2016-05-01',1,'VP Operations',4),

-- SALES MANAGERS
(6,'Daniel','White','daniel.white@company.com','08000000006','2017-01-01',2,'Sales Manager',1),
(7,'Emma','Scott','emma.scott@company.com','08000000007','2017-02-01',2,'Sales Manager',2),

-- TECH MANAGERS
(8,'Chris','Lee','chris.lee@company.com','08000000008','2017-03-01',3,'Tech Manager',2),
(9,'Sophia','Clark','sophia.clark@company.com','08000000009','2017-04-01',3,'Tech Manager',3),

-- FINANCE MANAGERS
(10,'Olivia','Walker','olivia.walker@company.com','08000000010','2017-05-01',4,'Finance Manager',3),
(11,'Noah','Hall','noah.hall@company.com','08000000011','2017-06-01',4,'Finance Manager',4),

-- OPERATIONS MANAGERS
(12,'Liam','Allen','liam.allen@company.com','08000000012','2017-07-01',5,'Operations Manager',4),
(13,'Ava','Young','ava.young@company.com','08000000013','2017-08-01',5,'Operations Manager',5),

-- SALES REPS (sample pattern continues)
(14,'John','Adams','john.adams@company.com','08000000014','2018-01-01',6,'Sales Representative',1),
(15,'Mary','Baker','mary.baker@company.com','08000000015','2018-01-02',6,'Sales Representative',1),
(16,'Paul','Cooper','paul.cooper@company.com','08000000016','2018-01-03',6,'Sales Representative',2),
(17,'Nina','Davis','nina.davis@company.com','08000000017','2018-01-04',6,'Sales Representative',2),
(18,'Luke','Evans','luke.evans@company.com','08000000018','2018-01-05',7,'Sales Representative',1),
(19,'Zara','Foster','zara.foster@company.com','08000000019','2018-01-06',7,'Sales Representative',2),

-- TECH STAFF
(20,'Ethan','Green','ethan.green@company.com','08000000020','2018-02-01',8,'Software Engineer',2),
(21,'Mia','Hill','mia.hill@company.com','08000000021','2018-02-02',8,'Software Engineer',3),
(22,'Ryan','Irwin','ryan.irwin@company.com','08000000022','2018-02-03',9,'Data Analyst',2),
(23,'Ella','Jones','ella.jones@company.com','08000000023','2018-02-04',9,'Data Analyst',3),

-- FINANCE STAFF
(24,'Leo','King','leo.king@company.com','08000000024','2018-03-01',10,'Finance Analyst',3),
(25,'Chloe','Lewis','chloe.lewis@company.com','08000000025','2018-03-02',10,'Finance Analyst',3),
(26,'Jack','Moore','jack.moore@company.com','08000000026','2018-03-03',11,'Accountant',4),
(27,'Grace','Nelson','grace.nelson@company.com','08000000027','2018-03-04',11,'Accountant',4),

-- OPERATIONS STAFF
(28,'Henry','Owens','henry.owens@company.com','08000000028','2018-04-01',12,'Operations Coordinator',4),
(29,'Lily','Perez','lily.perez@company.com','08000000029','2018-04-02',12,'Operations Coordinator',5),
(30,'Owen','Quinn','owen.quinn@company.com','08000000030','2018-04-03',13,'Logistics Officer',4),
(31,'Sophie','Reed','sophie.reed@company.com','08000000031','2018-04-04',13,'Logistics Officer',5);
-- CONTINUATION

INSERT INTO employees 
(employee_id, first_name, last_name, email, phone, hire_date, manager_id, job_title, team_id) VALUES

-- SALES REPS CONTINUED
(32,'Adam','Stone','adam.stone@company.com','08000000032','2018-05-01',6,'Sales Representative',1),
(33,'Bella','Turner','bella.turner@company.com','08000000033','2018-05-02',6,'Sales Representative',2),
(34,'Caleb','Upton','caleb.upton@company.com','08000000034','2018-05-03',7,'Sales Representative',1),
(35,'Diana','Vance','diana.vance@company.com','08000000035','2018-05-04',7,'Sales Representative',2),

-- TECH STAFF CONTINUED
(36,'Eli','Wright','eli.wright@company.com','08000000036','2018-06-01',8,'Software Engineer',2),
(37,'Fiona','Xavier','fiona.xavier@company.com','08000000037','2018-06-02',8,'Software Engineer',3),
(38,'George','Young','george.young@company.com','08000000038','2018-06-03',9,'Data Analyst',2),
(39,'Hannah','Zane','hannah.zane@company.com','08000000039','2018-06-04',9,'Data Analyst',3),

-- FINANCE STAFF CONTINUED
(40,'Ian','Bishop','ian.bishop@company.com','08000000040','2018-07-01',10,'Finance Analyst',3),
(41,'Julia','Cruz','julia.cruz@company.com','08000000041','2018-07-02',10,'Finance Analyst',3),
(42,'Kevin','Diaz','kevin.diaz@company.com','08000000042','2018-07-03',11,'Accountant',4),
(43,'Laura','Eaton','laura.eaton@company.com','08000000043','2018-07-04',11,'Accountant',4),

-- OPERATIONS STAFF CONTINUED
(44,'Mark','Ford','mark.ford@company.com','08000000044','2018-08-01',12,'Operations Coordinator',4),
(45,'Nora','Gibson','nora.gibson@company.com','08000000045','2018-08-02',12,'Operations Coordinator',5),
(46,'Oscar','Harris','oscar.harris@company.com','08000000046','2018-08-03',13,'Logistics Officer',4),
(47,'Paula','Irving','paula.irving@company.com','08000000047','2018-08-04',13,'Logistics Officer',5),

-- MORE SALES
(48,'Quinn','James','quinn.james@company.com','08000000048','2019-01-01',6,'Sales Representative',1),
(49,'Rita','Knight','rita.knight@company.com','08000000049','2019-01-02',7,'Sales Representative',2),
(50,'Sam','Lopez','sam.lopez@company.com','08000000050','2019-01-03',6,'Sales Representative',1),
(51,'Tina','Morris','tina.morris@company.com','08000000051','2019-01-04',7,'Sales Representative',2),

-- MORE TECH
(52,'Umar','Nash','umar.nash@company.com','08000000052','2019-02-01',8,'Software Engineer',2),
(53,'Vera','Owens','vera.owens@company.com','08000000053','2019-02-02',9,'Data Analyst',3),
(54,'Will','Perry','will.perry@company.com','08000000054','2019-02-03',8,'Software Engineer',2),
(55,'Xena','Quincy','xena.quincy@company.com','08000000055','2019-02-04',9,'Data Analyst',3),

-- MORE FINANCE
(56,'Yusuf','Reed','yusuf.reed@company.com','08000000056','2019-03-01',10,'Finance Analyst',3),
(57,'Zoe','Smith','zoe.smith@company.com','08000000057','2019-03-02',11,'Accountant',4),
(58,'Aaron','Taylor','aaron.taylor@company.com','08000000058','2019-03-03',10,'Finance Analyst',3),
(59,'Bianca','Usman','bianca.usman@company.com','08000000059','2019-03-04',11,'Accountant',4),

-- MORE OPERATIONS
(60,'Carlos','Victor','carlos.victor@company.com','08000000060','2019-04-01',12,'Operations Coordinator',4),
(61,'Daisy','White','daisy.white@company.com','08000000061','2019-04-02',13,'Logistics Officer',5),
(62,'Evan','Xu','evan.xu@company.com','08000000062','2019-04-03',12,'Operations Coordinator',4),
(63,'Faith','Young','faith.young@company.com','08000000063','2019-04-04',13,'Logistics Officer',5),

-- FINAL EXPANSION
(64,'Gabe','Zion','gabe.zion@company.com','08000000064','2020-01-01',6,'Sales Representative',1),
(65,'Holly','Adams','holly.adams@company.com','08000000065','2020-01-02',7,'Sales Representative',2),
(66,'Ivan','Brown','ivan.brown@company.com','08000000066','2020-01-03',8,'Software Engineer',2),
(67,'Jade','Clark','jade.clark@company.com','08000000067','2020-01-04',9,'Data Analyst',3),
(68,'Kyle','Dunn','kyle.dunn@company.com','08000000068','2020-01-05',10,'Finance Analyst',3),
(69,'Lara','Evans','lara.evans@company.com','08000000069','2020-01-06',11,'Accountant',4),
(70,'Mason','Flynn','mason.flynn@company.com','08000000070','2020-01-07',12,'Operations Coordinator',4),
(71,'Nina','Grant','nina.grant@company.com','08000000071','2020-01-08',13,'Logistics Officer',5),

-- LAST BLOCK
(72,'Omar','Hale','omar.hale@company.com','08000000072','2021-01-01',6,'Sales Representative',1),
(73,'Pia','Ike','pia.ike@company.com','08000000073','2021-01-02',7,'Sales Representative',2),
(74,'Quincy','Jones','quincy.jones@company.com','08000000074','2021-01-03',8,'Software Engineer',2),
(75,'Ralph','King','ralph.king@company.com','08000000075','2021-01-04',9,'Data Analyst',3),
(76,'Sade','Lewis','sade.lewis@company.com','08000000076','2021-01-05',10,'Finance Analyst',3),
(77,'Tariq','Moore','tariq.moore@company.com','08000000077','2021-01-06',11,'Accountant',4),
(78,'Uche','Nolan','uche.nolan@company.com','08000000078','2021-01-07',12,'Operations Coordinator',4),
(79,'Vicky','Olsen','vicky.olsen@company.com','08000000079','2021-01-08',13,'Logistics Officer',5),

-- FINAL ROWS
(80,'Wale','Prince','wale.prince@company.com','08000000080','2022-01-01',6,'Sales Representative',1),
(81,'Xiomara','Queen','xiomara.queen@company.com','08000000081','2022-01-02',7,'Sales Representative',2),
(82,'Yemi','Ross','yemi.ross@company.com','08000000082','2022-01-03',8,'Software Engineer',2),
(83,'Zain','Stone','zain.stone@company.com','08000000083','2022-01-04',9,'Data Analyst',3),
(84,'Amir','Tate','amir.tate@company.com','08000000084','2022-01-05',10,'Finance Analyst',3),
(85,'Bisi','Umar','bisi.umar@company.com','08000000085','2022-01-06',11,'Accountant',4),
(86,'Chidi','Vera','chidi.vera@company.com','08000000086','2022-01-07',12,'Operations Coordinator',4),
(87,'Dara','Wills','dara.wills@company.com','08000000087','2022-01-08',13,'Logistics Officer',5),

-- FINAL COMPLETION TO 107
(88,'Emeka','Xen','emeka.xen@company.com','08000000088','2023-01-01',6,'Sales Representative',1),
(89,'Fatima','Yaro','fatima.yaro@company.com','08000000089','2023-01-02',7,'Sales Representative',2),
(90,'Gani','Zubair','gani.zubair@company.com','08000000090','2023-01-03',8,'Software Engineer',2),
(91,'Hauwa','Abel','hauwa.abel@company.com','08000000091','2023-01-04',9,'Data Analyst',3),
(92,'Ibrahim','Bello','ibrahim.bello@company.com','08000000092','2023-01-05',10,'Finance Analyst',3),
(93,'Jumoke','Chika','jumoke.chika@company.com','08000000093','2023-01-06',11,'Accountant',4),
(94,'Kabir','Dan','kabir.dan@company.com','08000000094','2023-01-07',12,'Operations Coordinator',4),
(95,'Lola','Efe','lola.efe@company.com','08000000095','2023-01-08',13,'Logistics Officer',5),

(96,'Musa','Femi','musa.femi@company.com','08000000096','2024-01-01',6,'Sales Representative',1),
(97,'Ngozi','Grace','ngozi.grace@company.com','08000000097','2024-01-02',7,'Sales Representative',2),
(98,'Ola','Henry','ola.henry@company.com','08000000098','2024-01-03',8,'Software Engineer',2),
(99,'Peace','Isaac','peace.isaac@company.com','08000000099','2024-01-04',9,'Data Analyst',3),
(100,'Qadir','John','qadir.john@company.com','08000000100','2024-01-05',10,'Finance Analyst',3),
(101,'Rasheed','Kunle','rasheed.kunle@company.com','08000000101','2024-01-06',11,'Accountant',4),
(102,'Sola','Lekan','sola.lekan@company.com','08000000102','2024-01-07',12,'Operations Coordinator',4),
(103,'Tunde','Mide','tunde.mide@company.com','08000000103','2024-01-08',13,'Logistics Officer',5),

(104,'Umar','Niyi','umar.niyi@company.com','08000000104','2024-02-01',6,'Sales Representative',1),
(105,'Vera','Olu','vera.olu@company.com','08000000105','2024-02-02',7,'Sales Representative',2),
(106,'Wasiu','Peter','wasiu.peter@company.com','08000000106','2024-02-03',8,'Software Engineer',2),
(107,'Zainab','Queen','zainab.queen@company.com','08000000107','2024-02-04',9,'Data Analyst',3);
