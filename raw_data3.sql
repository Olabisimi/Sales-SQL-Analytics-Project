INSERT INTO product_categories (category_id, category_name) VALUES (1, 'Furniture');
INSERT INTO product_categories (category_id, category_name) VALUES (2, 'Technology');
INSERT INTO product_categories (category_id, category_name) VALUES (3, 'Office Supplies');

INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (1, 'Bookshelves', 1);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (2, 'Chairs', 1);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (3, 'Cabinets', 1);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (4, 'Desks', 1);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (5, 'Tables', 1);

INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (6, 'Monitors', 2);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (7, 'Tablets', 2);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (8, 'Headphones', 2);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (9, 'Laptops', 2);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (10, 'Smartphones', 2);

INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (11, 'File Folder', 3);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (12, 'Notebook', 3);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (13, 'Pen', 3);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (14, 'Printer Paper', 3);
INSERT INTO product_subcategories (subcategory_id, subcategory_name, category_id) VALUES (15, 'Stapler', 3);


INSERT INTO PRODUCTS VALUES (1,'Wooden Bookshelf','Durable wooden bookshelf for office storage',120,180,1,1);
INSERT INTO PRODUCTS VALUES (2,'Modern Bookshelf','Contemporary bookshelf design',140,210,1,1);
INSERT INTO PRODUCTS VALUES (3,'Compact Bookshelf','Space-saving bookshelf',90,150,1,1);

INSERT INTO PRODUCTS VALUES (4,'Ergonomic Office Chair','Comfortable ergonomic chair',150,230,1,2);
INSERT INTO PRODUCTS VALUES (5,'Executive Leather Chair','Premium leather office chair',280,420,1,2);
INSERT INTO PRODUCTS VALUES (6,'Mesh Office Chair','Breathable mesh chair',130,200,1,2);

INSERT INTO PRODUCTS VALUES (7,'Filing Cabinet','Metal filing cabinet for documents',180,260,1,3);
INSERT INTO PRODUCTS VALUES (8,'Wood Storage Cabinet','Wooden cabinet with shelves',220,320,1,3);
INSERT INTO PRODUCTS VALUES (9,'Lockable Cabinet','Secure cabinet with lock',200,300,1,3);

INSERT INTO PRODUCTS VALUES (10,'Office Work Desk','Standard office desk',200,300,1,4);
INSERT INTO PRODUCTS VALUES (11,'Executive Desk','Large executive desk',350,520,1,4);
INSERT INTO PRODUCTS VALUES (12,'Compact Desk','Small office desk',120,180,1,4);

INSERT INTO PRODUCTS VALUES (13,'Conference Table','Large meeting table',400,600,1,5);
INSERT INTO PRODUCTS VALUES (14,'Round Table','Round office table',220,340,1,5);
INSERT INTO PRODUCTS VALUES (15,'Dining Table','Multi-purpose table',260,380,1,5);

INSERT INTO PRODUCTS VALUES (16,'LED Monitor','24-inch LED display monitor',180,260,2,6);
INSERT INTO PRODUCTS VALUES (17,'4K Monitor','Ultra HD 4K monitor',320,480,2,6);
INSERT INTO PRODUCTS VALUES (18,'Curved Monitor','Curved widescreen monitor',300,450,2,6);

INSERT INTO PRODUCTS VALUES (19,'Android Tablet','Portable Android tablet',200,320,2,7);
INSERT INTO PRODUCTS VALUES (20,'Business Tablet','Tablet for office productivity',350,500,2,7);
INSERT INTO PRODUCTS VALUES (21,'Student Tablet','Affordable student tablet',150,240,2,7);

INSERT INTO PRODUCTS VALUES (22,'Wireless Headphones','Bluetooth wireless headphones',120,200,2,8);
INSERT INTO PRODUCTS VALUES (23,'Noise Cancelling Headphones','ANC headphones',220,350,2,8);
INSERT INTO PRODUCTS VALUES (24,'Studio Headphones','Professional audio headphones',180,280,2,8);

INSERT INTO PRODUCTS VALUES (25,'Gaming Laptop','High performance gaming laptop',900,1400,2,9);
INSERT INTO PRODUCTS VALUES (26,'Office Laptop','Laptop for business tasks',600,900,2,9);
INSERT INTO PRODUCTS VALUES (27,'Student Laptop','Budget laptop for students',350,550,2,9);

INSERT INTO PRODUCTS VALUES (28,'Smartphone Basic','Entry-level smartphone',100,160,2,10);
INSERT INTO PRODUCTS VALUES (29,'Smartphone Pro','Advanced smartphone',500,800,2,10);
INSERT INTO PRODUCTS VALUES (30,'Smartphone Ultra','Premium flagship smartphone',900,1300,2,10);

INSERT INTO PRODUCTS VALUES (31,'File Folder','Standard document folder',5,10,3,11);
INSERT INTO PRODUCTS VALUES (32,'Expandable Folder','Expandable storage folder',8,14,3,11);
INSERT INTO PRODUCTS VALUES (33,'Legal Folder','Folder for legal documents',10,16,3,11);

INSERT INTO PRODUCTS VALUES (34,'Spiral Notebook','Notebook with spiral binding',4,9,3,12);
INSERT INTO PRODUCTS VALUES (35,'Hardcover Notebook','Durable hardcover notebook',8,14,3,12);
INSERT INTO PRODUCTS VALUES (36,'Executive Notebook','Professional notebook',10,18,3,12);

INSERT INTO PRODUCTS VALUES (37,'Ballpoint Pen','Standard ink pen',1,3,3,13);
INSERT INTO PRODUCTS VALUES (38,'Gel Pen','Smooth gel ink pen',2,5,3,13);
INSERT INTO PRODUCTS VALUES (39,'Premium Pen','Luxury writing pen',12,30,3,13);

INSERT INTO PRODUCTS VALUES (40,'Printer Paper','Standard A4 paper pack',6,12,3,14);
INSERT INTO PRODUCTS VALUES (41,'High Brightness Paper','Premium white printing paper',9,16,3,14);
INSERT INTO PRODUCTS VALUES (42,'Cardstock Paper','Thick paper for printing',12,20,3,14);
INSERT INTO PRODUCTS VALUES (43,'Recycled Paper','Eco-friendly printing paper',7,13,3,14);

INSERT INTO PRODUCTS VALUES (44,'Office Stapler','Standard stapler for office use',8,15,3,15);
INSERT INTO PRODUCTS VALUES (45,'Heavy Duty Stapler','Stapler for large documents',18,30,3,15);
INSERT INTO PRODUCTS VALUES (46,'Mini Stapler','Portable stapler',5,10,3,15);

INSERT INTO PRODUCTS VALUES (47,'Adjustable Bookshelf','Height adjustable shelf',160,240,1,1);
INSERT INTO PRODUCTS VALUES (48,'Metal Bookshelf','Strong metal shelving unit',180,260,1,1);
INSERT INTO PRODUCTS VALUES (49,'Corner Bookshelf','Space-saving corner shelf',140,210,1,1);

INSERT INTO PRODUCTS VALUES (50,'Swivel Chair','Rotating office chair',140,220,1,2);
INSERT INTO PRODUCTS VALUES (51,'Visitor Chair','Simple guest chair',90,150,1,2);
INSERT INTO PRODUCTS VALUES (52,'Gaming Chair','High-back gaming chair',220,350,1,2);

INSERT INTO PRODUCTS VALUES (53,'Steel Cabinet','Heavy duty steel cabinet',240,360,1,3);
INSERT INTO PRODUCTS VALUES (54,'Office Locker','Multi-compartment locker',260,380,1,3);
INSERT INTO PRODUCTS VALUES (55,'Drawer Cabinet','Cabinet with drawers',210,310,1,3);

INSERT INTO PRODUCTS VALUES (56,'Standing Desk','Adjustable standing desk',300,480,1,4);
INSERT INTO PRODUCTS VALUES (57,'Corner Desk','L-shaped desk',260,400,1,4);
INSERT INTO PRODUCTS VALUES (58,'Minimal Desk','Simple modern desk',150,230,1,4);

INSERT INTO PRODUCTS VALUES (59,'Glass Table','Glass-top office table',280,420,1,5);
INSERT INTO PRODUCTS VALUES (60,'Folding Table','Portable folding table',120,200,1,5);
INSERT INTO PRODUCTS VALUES (61,'Work Table','Heavy duty work table',300,450,1,5);

INSERT INTO PRODUCTS VALUES (62,'Gaming Monitor','High refresh gaming monitor',350,520,2,6);
INSERT INTO PRODUCTS VALUES (63,'UltraWide Monitor','Wide display monitor',380,560,2,6);
INSERT INTO PRODUCTS VALUES (64,'Budget Monitor','Affordable monitor',120,180,2,6);

INSERT INTO PRODUCTS VALUES (65,'Tablet Mini','Compact tablet device',180,260,2,7);
INSERT INTO PRODUCTS VALUES (66,'Tablet Pro Max','High-end tablet',500,750,2,7);
INSERT INTO PRODUCTS VALUES (67,'Tablet Lite','Entry-level tablet',130,200,2,7);

INSERT INTO PRODUCTS VALUES (68,'Over-Ear Headphones','Comfortable over-ear headphones',140,220,2,8);
INSERT INTO PRODUCTS VALUES (69,'In-Ear Earbuds','Compact earbuds',60,120,2,8);
INSERT INTO PRODUCTS VALUES (70,'Gaming Headset','Headset with mic for gaming',150,240,2,8);

INSERT INTO PRODUCTS VALUES (71,'Ultrabook Laptop','Slim lightweight laptop',700,1100,2,9);
INSERT INTO PRODUCTS VALUES (72,'Workstation Laptop','High-performance laptop',1200,1800,2,9);
INSERT INTO PRODUCTS VALUES (73,'Convertible Laptop','2-in-1 laptop tablet',650,1000,2,9);

INSERT INTO PRODUCTS VALUES (74,'Smartphone Lite','Affordable smartphone',120,200,2,10);
INSERT INTO PRODUCTS VALUES (75,'Smartphone Max','Large screen smartphone',600,900,2,10);
INSERT INTO PRODUCTS VALUES (76,'Smartphone Fold','Foldable smartphone',1200,1800,2,10);

INSERT INTO PRODUCTS VALUES (77,'Colored File Folder','Multi-color document folder',6,11,3,11);
INSERT INTO PRODUCTS VALUES (78,'Ring Binder Folder','Folder with rings',9,16,3,11);
INSERT INTO PRODUCTS VALUES (79,'Plastic Folder','Durable plastic folder',7,13,3,11);

INSERT INTO PRODUCTS VALUES (80,'Pocket Notebook','Small portable notebook',3,8,3,12);
INSERT INTO PRODUCTS VALUES (81,'Grid Notebook','Notebook with grid lines',5,11,3,12);
INSERT INTO PRODUCTS VALUES (82,'Journal Notebook','Personal writing journal',9,15,3,12);

INSERT INTO PRODUCTS VALUES (83,'Blue Ink Pen','Standard blue pen',1,3,3,13);
INSERT INTO PRODUCTS VALUES (84,'Black Ink Pen','Standard black pen',1,3,3,13);
INSERT INTO PRODUCTS VALUES (85,'Marker Pen','Permanent marker pen',3,7,3,13);

INSERT INTO PRODUCTS VALUES (86,'A3 Printer Paper','Large size printing paper',10,18,3,14);
INSERT INTO PRODUCTS VALUES (87,'Photo Paper','Glossy photo paper',12,22,3,14);
INSERT INTO PRODUCTS VALUES (88,'Office Paper Pack','Bulk paper pack',15,25,3,14);

INSERT INTO PRODUCTS VALUES (89,'Electric Stapler','Automatic stapler',25,45,3,15);
INSERT INTO PRODUCTS VALUES (90,'Stapler Set','Stapler with pins set',10,18,3,15);
INSERT INTO PRODUCTS VALUES (91,'Industrial Stapler','Heavy industrial stapler',30,55,3,15);

INSERT INTO PRODUCTS VALUES (92,'Wood Shelf Unit','Multi-layer wooden shelf',180,260,1,1);
INSERT INTO PRODUCTS VALUES (93,'Display Bookshelf','Shelf for display items',200,300,1,1);
INSERT INTO PRODUCTS VALUES (94,'Library Bookshelf','Large storage bookshelf',250,380,1,1);

INSERT INTO PRODUCTS VALUES (95,'Office Recliner Chair','Reclining office chair',260,390,1,2);
INSERT INTO PRODUCTS VALUES (96,'Task Chair','Basic office task chair',110,170,1,2);
INSERT INTO PRODUCTS VALUES (97,'Conference Chair','Chair for meeting rooms',140,210,1,2);

INSERT INTO PRODUCTS VALUES (98,'Mobile Cabinet','Cabinet with wheels',220,330,1,3);
INSERT INTO PRODUCTS VALUES (99,'Compact Cabinet','Small storage cabinet',180,260,1,3);
INSERT INTO PRODUCTS VALUES (100,'Archive Cabinet','Long-term storage cabinet',240,350,1,3);

INSERT INTO PRODUCTS VALUES (101,'Study Desk','Desk for study use',140,220,1,4);
INSERT INTO PRODUCTS VALUES (102,'Adjustable Desk','Height adjustable desk',300,480,1,4);
INSERT INTO PRODUCTS VALUES (103,'Corner Work Desk','Corner office desk',250,380,1,4);

INSERT INTO PRODUCTS VALUES (104,'Coffee Table','Small office table',120,200,1,5);
INSERT INTO PRODUCTS VALUES (105,'Meeting Table','Office meeting table',320,480,1,5);
INSERT INTO PRODUCTS VALUES (106,'Portable Table','Lightweight table',110,180,1,5);

INSERT INTO PRODUCTS VALUES (107,'Office Monitor','Standard office monitor',150,230,2,6);
INSERT INTO PRODUCTS VALUES (108,'Professional Monitor','High precision display',400,600,2,6);
INSERT INTO PRODUCTS VALUES (109,'Touchscreen Monitor','Interactive display monitor',350,520,2,6);

INSERT INTO PRODUCTS VALUES (110,'Tablet Business','Enterprise tablet device',400,620,2,7);
INSERT INTO PRODUCTS VALUES (111,'Tablet Education','Tablet for schools',180,260,2,7);
INSERT INTO PRODUCTS VALUES (112,'Tablet Premium','High-end tablet',550,800,2,7);

INSERT INTO PRODUCTS VALUES (113,'Studio Headset','Professional headset',200,320,2,8);
INSERT INTO PRODUCTS VALUES (114,'Wireless Earphones','Bluetooth earphones',80,140,2,8);
INSERT INTO PRODUCTS VALUES (115,'Bass Headphones','Headphones with deep bass',130,210,2,8);

INSERT INTO PRODUCTS VALUES (116,'Notebook Laptop','Everyday laptop',500,800,2,9);
INSERT INTO PRODUCTS VALUES (117,'Pro Laptop','High-end laptop',1000,1500,2,9);
INSERT INTO PRODUCTS VALUES (118,'Lightweight Laptop','Portable laptop',600,950,2,9);

INSERT INTO PRODUCTS VALUES (119,'Android Smartphone','Android OS smartphone',200,320,2,10);
INSERT INTO PRODUCTS VALUES (120,'iOS Smartphone','iOS-based smartphone',700,1100,2,10);

INSERT INTO PRODUCTS VALUES (121,'Expandable File Folder','Large capacity document folder',9,15,3,11);
INSERT INTO PRODUCTS VALUES (122,'Document Organizer Folder','Multi-section folder',10,18,3,11);
INSERT INTO PRODUCTS VALUES (123,'Transparent File Folder','Clear plastic folder',6,12,3,11);

INSERT INTO PRODUCTS VALUES (124,'College Notebook','Notebook for students',5,10,3,12);
INSERT INTO PRODUCTS VALUES (125,'Office Notebook','Notebook for office notes',6,12,3,12);
INSERT INTO PRODUCTS VALUES (126,'Premium Journal','High-quality writing journal',12,20,3,12);

INSERT INTO PRODUCTS VALUES (127,'Ink Pen Pack','Pack of ballpoint pens',3,8,3,13);
INSERT INTO PRODUCTS VALUES (128,'Signature Pen','Professional signature pen',10,25,3,13);
INSERT INTO PRODUCTS VALUES (129,'Stylus Pen','Digital stylus pen',15,35,3,13);

INSERT INTO PRODUCTS VALUES (130,'Laser Printer Paper','Paper for laser printers',10,18,3,14);
INSERT INTO PRODUCTS VALUES (131,'Matte Paper','Smooth matte finish paper',9,16,3,14);
INSERT INTO PRODUCTS VALUES (132,'Glossy Paper','Shiny photo-quality paper',12,22,3,14);

INSERT INTO PRODUCTS VALUES (133,'Stapler Machine','Durable stapler machine',12,22,3,15);
INSERT INTO PRODUCTS VALUES (134,'Compact Stapler','Mini stapler device',6,11,3,15);
INSERT INTO PRODUCTS VALUES (135,'Stapler Gun','Industrial stapler tool',25,45,3,15);

INSERT INTO PRODUCTS VALUES (136,'Office Bookshelf Rack','Large rack bookshelf',200,320,1,1);
INSERT INTO PRODUCTS VALUES (137,'Wood Storage Shelf','Wooden shelf storage',180,280,1,1);
INSERT INTO PRODUCTS VALUES (138,'Display Shelf Unit','Modern display shelf',220,340,1,1);

INSERT INTO PRODUCTS VALUES (139,'Executive Swivel Chair','Rotating executive chair',260,400,1,2);
INSERT INTO PRODUCTS VALUES (140,'Office Visitor Chair','Guest office chair',100,170,1,2);
INSERT INTO PRODUCTS VALUES (141,'Adjustable Chair','Height adjustable chair',180,280,1,2);

INSERT INTO PRODUCTS VALUES (142,'Office Drawer Cabinet','Cabinet with drawers',210,320,1,3);
INSERT INTO PRODUCTS VALUES (143,'Vertical Cabinet','Tall cabinet storage',240,360,1,3);
INSERT INTO PRODUCTS VALUES (144,'File Storage Cabinet','Document storage cabinet',230,350,1,3);

INSERT INTO PRODUCTS VALUES (145,'Computer Desk Unit','Desk for computing setup',200,300,1,4);
INSERT INTO PRODUCTS VALUES (146,'Executive Work Desk','Premium work desk',380,600,1,4);
INSERT INTO PRODUCTS VALUES (147,'Writing Desk','Simple writing desk',150,240,1,4);

INSERT INTO PRODUCTS VALUES (148,'Office Table Set','Set of office tables',300,480,1,5);
INSERT INTO PRODUCTS VALUES (149,'Boardroom Table','Large boardroom table',420,650,1,5);
INSERT INTO PRODUCTS VALUES (150,'Compact Table','Small table for office',130,200,1,5);

INSERT INTO PRODUCTS VALUES (151,'HD Monitor','High-definition display monitor',200,300,2,6);
INSERT INTO PRODUCTS VALUES (152,'Professional Monitor','Accurate color display monitor',420,650,2,6);
INSERT INTO PRODUCTS VALUES (153,'Gaming Display Monitor','Fast refresh monitor',380,580,2,6);

INSERT INTO PRODUCTS VALUES (154,'Tablet Standard','General purpose tablet',220,340,2,7);
INSERT INTO PRODUCTS VALUES (155,'Tablet High Performance','Fast processing tablet',450,700,2,7);
INSERT INTO PRODUCTS VALUES (156,'Tablet Compact','Small size tablet',150,240,2,7);

INSERT INTO PRODUCTS VALUES (157,'Wireless Headset','Bluetooth headset',140,220,2,8);
INSERT INTO PRODUCTS VALUES (158,'Noise Isolation Headphones','Sound isolation headphones',180,300,2,8);
INSERT INTO PRODUCTS VALUES (159,'Audio Headphones','Clear sound headphones',120,200,2,8);

INSERT INTO PRODUCTS VALUES (160,'Office Laptop Pro','Professional office laptop',850,1300,2,9);
INSERT INTO PRODUCTS VALUES (161,'Student Laptop Basic','Basic student laptop',400,650,2,9);
INSERT INTO PRODUCTS VALUES (162,'Gaming Laptop Pro','Advanced gaming laptop',1200,1800,2,9);

INSERT INTO PRODUCTS VALUES (163,'Budget Smartphone','Affordable smartphone',120,200,2,10);
INSERT INTO PRODUCTS VALUES (164,'Smartphone Advanced','High performance phone',500,800,2,10);
INSERT INTO PRODUCTS VALUES (165,'Premium Smartphone','Top-tier smartphone',900,1400,2,10);

INSERT INTO PRODUCTS VALUES (166,'Color File Folder','Color-coded folder',6,12,3,11);
INSERT INTO PRODUCTS VALUES (167,'Clip File Folder','Folder with clips',7,13,3,11);
INSERT INTO PRODUCTS VALUES (168,'Expandable Organizer Folder','Expandable file system',12,20,3,11);

INSERT INTO PRODUCTS VALUES (169,'Daily Notebook','Notebook for daily use',5,10,3,12);
INSERT INTO PRODUCTS VALUES (170,'Office Journal','Professional journal notebook',8,15,3,12);
INSERT INTO PRODUCTS VALUES (171,'Sketch Notebook','Notebook for sketches',7,14,3,12);

INSERT INTO PRODUCTS VALUES (172,'Office Pen Pack','Bulk pen pack',5,12,3,13);
INSERT INTO PRODUCTS VALUES (173,'Signature Ball Pen','Premium signing pen',12,28,3,13);
INSERT INTO PRODUCTS VALUES (174,'Marker Set','Set of marker pens',10,20,3,13);

INSERT INTO PRODUCTS VALUES (175,'A4 Paper Pack','Standard A4 printing paper',7,14,3,14);
INSERT INTO PRODUCTS VALUES (176,'Premium Paper Pack','High quality printing paper',12,22,3,14);
INSERT INTO PRODUCTS VALUES (177,'Bulk Paper Box','Bulk paper supply',25,40,3,14);

INSERT INTO PRODUCTS VALUES (178,'Stapler Kit','Stapler with accessories',15,25,3,15);
INSERT INTO PRODUCTS VALUES (179,'Office Stapler Heavy','Heavy stapler',20,35,3,15);
INSERT INTO PRODUCTS VALUES (180,'Mini Stapler Portable','Small portable stapler',6,12,3,15);
INSERT INTO PRODUCTS VALUES (201,'Premium Bookshelf Unit','High-end bookshelf unit',260,400,1,1);
INSERT INTO PRODUCTS VALUES (202,'Metal Frame Bookshelf','Durable metal bookshelf',220,340,1,1);
INSERT INTO PRODUCTS VALUES (203,'Office Storage Shelf','Multi-use shelf',200,300,1,1);

INSERT INTO PRODUCTS VALUES (204,'Ergonomic Task Chair','Task-based ergonomic chair',180,280,1,2);
INSERT INTO PRODUCTS VALUES (205,'Office Relax Chair','Comfortable office chair',200,320,1,2);
INSERT INTO PRODUCTS VALUES (206,'Meeting Room Chair','Chair for meetings',150,240,1,2);

INSERT INTO PRODUCTS VALUES (207,'Office Storage Cabinet','Large cabinet unit',260,400,1,3);
INSERT INTO PRODUCTS VALUES (208,'Drawer Storage Cabinet','Drawer cabinet unit',240,360,1,3);
INSERT INTO PRODUCTS VALUES (209,'Compact Office Cabinet','Small office cabinet',180,280,1,3);

INSERT INTO PRODUCTS VALUES (210,'Adjustable Office Desk','Height adjustable desk',320,500,1,4);
INSERT INTO PRODUCTS VALUES (211,'Workstation Desk','Large workstation desk',400,650,1,4);
INSERT INTO PRODUCTS VALUES (212,'Minimalist Desk','Simple clean desk',150,250,1,4);

INSERT INTO PRODUCTS VALUES (213,'Office Meeting Table','Meeting table',350,550,1,5);
INSERT INTO PRODUCTS VALUES (214,'Round Office Table','Round design table',260,420,1,5);
INSERT INTO PRODUCTS VALUES (215,'Folding Office Table','Foldable table',130,220,1,5);

INSERT INTO PRODUCTS VALUES (216,'Office LED Monitor','LED office display',180,260,2,6);
INSERT INTO PRODUCTS VALUES (217,'Ultra HD Monitor','4K display monitor',420,650,2,6);
INSERT INTO PRODUCTS VALUES (218,'Wide Screen Monitor','Wide screen display',350,550,2,6);

INSERT INTO PRODUCTS VALUES (219,'Tablet Lite Version','Lightweight tablet',180,260,2,7);
INSERT INTO PRODUCTS VALUES (220,'Tablet Advanced Version','Advanced tablet',450,700,2,7);
INSERT INTO PRODUCTS VALUES (221,'Tablet Enterprise','Business tablet device',500,780,2,7);

INSERT INTO PRODUCTS VALUES (222,'Wireless Earbuds Pro','High quality earbuds',120,200,2,8);
INSERT INTO PRODUCTS VALUES (223,'Gaming Headphones Pro','Gaming headset',200,320,2,8);
INSERT INTO PRODUCTS VALUES (224,'Studio Audio Headphones','Studio sound headphones',220,350,2,8);

INSERT INTO PRODUCTS VALUES (225,'Laptop Standard','Standard laptop',500,800,2,9);
INSERT INTO PRODUCTS VALUES (226,'Laptop Professional','Professional laptop',900,1400,2,9);
INSERT INTO PRODUCTS VALUES (227,'Laptop Ultra','High-end laptop',1300,2000,2,9);

INSERT INTO PRODUCTS VALUES (228,'Smartphone Entry','Basic smartphone',120,200,2,10);
INSERT INTO PRODUCTS VALUES (229,'Smartphone Midrange','Mid-tier smartphone',400,700,2,10);
INSERT INTO PRODUCTS VALUES (230,'Smartphone Flagship','Flagship device',900,1500,2,10);

INSERT INTO PRODUCTS VALUES (231,'Basic File Folder','Simple folder',5,10,3,11);
INSERT INTO PRODUCTS VALUES (232,'Advanced File Organizer','Multi-section folder',12,20,3,11);
INSERT INTO PRODUCTS VALUES (233,'Plastic Folder Durable','Durable folder',8,14,3,11);

INSERT INTO PRODUCTS VALUES (234,'Office Notebook Basic','Basic notebook',4,9,3,12);
INSERT INTO PRODUCTS VALUES (235,'Professional Notebook','Office notebook',8,15,3,12);
INSERT INTO PRODUCTS VALUES (236,'Premium Writing Journal','Luxury journal',12,22,3,12);

INSERT INTO PRODUCTS VALUES (237,'Basic Pen','Standard pen',1,3,3,13);
INSERT INTO PRODUCTS VALUES (238,'Office Pen Pack','Bulk pens',5,12,3,13);
INSERT INTO PRODUCTS VALUES (239,'Luxury Pen Set','Premium pen set',20,50,3,13);

INSERT INTO PRODUCTS VALUES (240,'Standard Paper Pack','Basic paper',6,12,3,14);
INSERT INTO PRODUCTS VALUES (241,'Premium Print Paper','High quality paper',12,22,3,14);
INSERT INTO PRODUCTS VALUES (242,'Bulk Office Paper','Large pack paper',25,40,3,14);

INSERT INTO PRODUCTS VALUES (243,'Basic Stapler','Standard stapler',8,15,3,15);
INSERT INTO PRODUCTS VALUES (244,'Heavy Stapler Pro','Heavy stapler',20,35,3,15);
INSERT INTO PRODUCTS VALUES (245,'Portable Stapler Mini','Mini stapler',5,10,3,15);

-- Final stretch

INSERT INTO PRODUCTS VALUES (246,'Bookshelf Deluxe','Premium bookshelf',300,480,1,1);
INSERT INTO PRODUCTS VALUES (247,'Office Chair Deluxe','Premium office chair',320,500,1,2);
INSERT INTO PRODUCTS VALUES (248,'Cabinet Deluxe','Premium cabinet',350,520,1,3);
INSERT INTO PRODUCTS VALUES (249,'Desk Deluxe','Premium desk',400,600,1,4);
INSERT INTO PRODUCTS VALUES (250,'Table Deluxe','Premium table',380,580,1,5);

INSERT INTO PRODUCTS VALUES (251,'Monitor Deluxe','Premium monitor',500,750,2,6);
INSERT INTO PRODUCTS VALUES (252,'Tablet Deluxe','Premium tablet',600,900,2,7);
INSERT INTO PRODUCTS VALUES (253,'Headphones Deluxe','Premium headphones',250,400,2,8);
INSERT INTO PRODUCTS VALUES (254,'Laptop Deluxe','Premium laptop',1500,2200,2,9);
INSERT INTO PRODUCTS VALUES (255,'Smartphone Deluxe','Premium smartphone',1000,1600,2,10);

INSERT INTO PRODUCTS VALUES (256,'Folder Deluxe','Premium folder',10,18,3,11);
INSERT INTO PRODUCTS VALUES (257,'Notebook Deluxe','Premium notebook',12,20,3,12);
INSERT INTO PRODUCTS VALUES (258,'Pen Deluxe','Premium pen',15,35,3,13);
INSERT INTO PRODUCTS VALUES (259,'Paper Deluxe','Premium paper',14,24,3,14);
INSERT INTO PRODUCTS VALUES (260,'Stapler Deluxe','Premium stapler',18,30,3,15);

INSERT INTO PRODUCTS VALUES (261,'Bookshelf Compact','Compact shelf',150,230,1,1);
INSERT INTO PRODUCTS VALUES (262,'Chair Compact','Compact chair',120,180,1,2);
INSERT INTO PRODUCTS VALUES (263,'Cabinet Compact','Compact cabinet',180,260,1,3);
INSERT INTO PRODUCTS VALUES (264,'Desk Compact','Compact desk',140,220,1,4);
INSERT INTO PRODUCTS VALUES (265,'Table Compact','Compact table',130,210,1,5);

INSERT INTO PRODUCTS VALUES (266,'Monitor Compact','Compact monitor',160,240,2,6);
INSERT INTO PRODUCTS VALUES (267,'Tablet Compact','Compact tablet',180,260,2,7);
INSERT INTO PRODUCTS VALUES (268,'Headphones Compact','Compact headphones',100,180,2,8);
INSERT INTO PRODUCTS VALUES (269,'Laptop Compact','Compact laptop',600,950,2,9);
INSERT INTO PRODUCTS VALUES (270,'Smartphone Compact','Compact smartphone',200,350,2,10);

INSERT INTO PRODUCTS VALUES (271,'Folder Basic','Basic folder',5,10,3,11);
INSERT INTO PRODUCTS VALUES (272,'Notebook Basic','Basic notebook',4,8,3,12);
INSERT INTO PRODUCTS VALUES (273,'Pen Basic','Basic pen',1,2,3,13);
INSERT INTO PRODUCTS VALUES (274,'Paper Basic','Basic paper',5,10,3,14);
INSERT INTO PRODUCTS VALUES (275,'Stapler Basic','Basic stapler',6,12,3,15);

INSERT INTO PRODUCTS VALUES (276,'Bookshelf Premium Plus','High-end bookshelf',350,550,1,1);
INSERT INTO PRODUCTS VALUES (277,'Chair Premium Plus','High-end chair',400,600,1,2);
INSERT INTO PRODUCTS VALUES (278,'Cabinet Premium Plus','High-end cabinet',420,650,1,3);
INSERT INTO PRODUCTS VALUES (279,'Desk Premium Plus','High-end desk',450,700,1,4);
INSERT INTO PRODUCTS VALUES (280,'Table Premium Plus','High-end table',430,680,1,5);

INSERT INTO PRODUCTS VALUES (281,'Monitor Premium Plus','High-end monitor',600,900,2,6);
INSERT INTO PRODUCTS VALUES (282,'Tablet Premium Plus','High-end tablet',700,1000,2,7);
INSERT INTO PRODUCTS VALUES (283,'Headphones Premium Plus','High-end headphones',300,500,2,8);
INSERT INTO PRODUCTS VALUES (284,'Laptop Premium Plus','High-end laptop',1800,2600,2,9);
INSERT INTO PRODUCTS VALUES (285,'Smartphone Premium Plus','High-end smartphone',1200,1800,2,10);

INSERT INTO PRODUCTS VALUES (286,'Folder Ultimate','Ultimate folder',15,25,3,11);
INSERT INTO PRODUCTS VALUES (287,'Notebook Ultimate','Ultimate notebook',18,30,3,12);
