create database dbms_project;
use dbms_project;
drop database dbms_project;
create table passenger
( p_name varchar(30) not null,
  aadhar varchar(30),
  age int not null,
  gender char not null,
  primary key(aadhar)
);


create table passenger_contact
(
   aadhar varchar(30),
   contact varchar(50) ,
   primary key(aadhar,contact),
   foreign key(aadhar) references passenger(aadhar)
   );


create  table station
  (
    st_name varchar(50) not null,
    location varchar(50) not null,
    t_count int not null ,
    st_id int ,
    primary key(st_id)
    );   
   
create table manager
(
  m_id int ,
  m_name varchar(30) not null,
  email varchar(40) not null,
  exp int not null,
  primary key(m_id)
);
   
   
/*create table supervisor2
(
  st_id int,
  s_id int not null,
  primary key(st_id),
  foreign key(s_id) references supervisor1(s_id)
  );*/
  
  
 create table manager_contact
(
  m_id int,
  contact varchar(50) ,
  primary key(m_id,contact),
  foreign key(m_id)  references manager (m_id)
  );
   
   
 create table train1
(
   t_num int,
   t_name varchar(30) not null,
   arr_time double not null,
   seats_avail int not null,
   dept_time double not null,
   source_name varchar(40) not null,
   destination varchar(40) not null,
   primary key(t_num)
   );  
   
create table train2
(
   m_id int,
   t_num int,
   primary key(m_id,t_num),
   foreign key(t_num) references train1(t_num),
   foreign key(m_id) references manager(m_id)
   );
   
   
     create table train_station
  (
    st_id int,
     t_num int,
     primary key(st_id,t_num),
     foreign key(st_id) references station(st_id),
     foreign key(t_num) references train1(t_num)
     );
     
     
     create table train_passenger
  (
     aadhar varchar(30),
     t_num int,
     primary key(aadhar,t_num),
     foreign key(aadhar) references passenger(aadhar),
     foreign key(t_num) references train1(t_num)
     );
     
     
create table payment_p1
 (
   ticket_id int,
   fare double not null,
   p_mode varchar(30) not null,
   security_pin varchar(40) not null,
   primary key(ticket_id)
   );
   
   
   create table payment_p2
 (
   ticket_id int not null,
   p_id int auto_increment,
   primary key(p_id),
   foreign key(ticket_id) references ticket3(ticket_id)
   );
   
   drop table payment_p2;
   create table ticket1
  (
    pnr_number int,
    t_num int not null,
    seat_num int not null,
    dest varchar(30) not null,
    source_name varchar(30) not null,
    class varchar(30) not null,
    primary key(pnr_number),
    foreign key(t_num) references train1(t_num)
    );
    
    create table ticket3
    (
     ticket_id int,
     pnr_number int not null,
     primary key(ticket_id),
     foreign key(pnr_number) references ticket1(pnr_number)
     );
    create table ticket2
   (
     aadhar varchar(30),
     date_time varchar(30),
     ticket_id int not null, 
     primary key(aadhar,date_time),
     foreign key(ticket_id) references ticket3(ticket_id)
     
     );
 
 create table cancellation1(
 c_id int,
 date_time varchar(30) not null,
 amount double not null,
 primary key(c_id)

 );
 create table cancellation2
 (
   ticket_id int ,
   c_id int not null,
   primary key(ticket_id),
   foreign key (c_id) references cancellation1(c_id)
   );
 insert into passenger
    values
    ('devi','9812445',20,'f'),
    ('chinmayi','678543',19,'f'),
    ('sai','4321678',22,'m'),
    ('latha','456782347',42,'f'),
    ('srinu','3456789876',49,'m'),
    ('sanvi','45672387',18,'f'),
    ('ram','2765890',37,'m'),
    ('sita','523456787',29,'f');
    
    
    insert into passenger_contact
    values
    ('9812445','9849803404'),
    ('9812445','8919217663'),
    ('678543','8296115490'),
    ('3456789876','7093425416'),
    ('3456789876','7556943419'),
    ('2765890','9247661834'),
    ('523456787','8790452311'),
    ('45672387','7909654325');
    
    
    insert into station
    values
    ('Vijayawada Junction','Vijayawada',54,12345),
    ('Tirupati Junction','Tirupathi',28,43256),
    ('Rajamundry railway station','rajamandry',43,67543),
    ('Palasa','kakinada',32,78965),
    ('tenali railway','tenali',89,675908),
    ('eluru junction','eluru',61,876590),
    ('chennai railway','chennai',49,4356218);
    
    
    insert into manager
    values
    (123,'santhan','santhan@gmail.com',4),
    (345,'rani','rani@gmail.com',8),
    (567,'raj','raj@gmail.com',6),
    (890,'lakshmi','lakshmi@gmail.com',4),
    (760,'venkat','venkat@gmail.com',8),
    (654,'sreeja','sreeja@gmail.com',7),
    (991,'nandan','nandan@gmail.com',5);
    
    
    /*insert into supervisor2
    values
    (12345,123),
    (43256,991),
    (67543,654),
    (78965,567),
    (675908,760),
    (876590,890),
    (4356218,345);*/
    
    
insert into manager_contact
values
(123,'9876546789'),
(123,'7891234789'),
(991,'9716728906'),
(654,'7891265076'),
(567,'8675490172'),
(567,'7659016555'),
(760,'9210628909'),
(890,'7568764390');


insert into train1
values
(65565,'rajamandry experess',3.40,12,4.15,'vij','chennai'),
(89890,'tirupati express',8.30,21,8.45,'hyd','delhi'),
(97654,'chennai express',9.0,9,9.45,'vij','eluru'),
(41234,'kakinada express',7.15,17,7.20,'mumbai','tirupati'),
(59087,'delhi_passenger',4.20,15,4.30,'kolkata','warangal'),
(87690,'kanyakumari',8.45,8,9.10,'chennai','hyderabad'),
(76907,'mumbai_super_fast',1.15,26,1.25,'guntur','banglore');


insert into train2
values
(123,65565),
(991,76907),
(991,87690),
(654,59087),
(890,41234),
(890,97654),
(760,89890);

insert into train_station
values
(12345,65565),
    (43256,89890),
    (67543,41234),
    (67543,59087),
    (675908,87690),
    (876590,76907),
    (4356218,97654);
        
    
insert into train_passenger
values
('9812445',97654),
    ('678543',97654),
    ('4321678',76907),
    ('456782347',87690),
    ('3456789876',87690),
    ('45672387',41234),
    ('2765890',59087),
    ('523456787',89890);    
    
    
    insert into payment_p1
    values
    (452389,890,'cash',11111),
    (22223,780.5,'google pay',32132),
    (67676,1020,'cash',54545),
    (98989,750,'phone pay',25252),
    (78787,690,'cash',554589),
    (25231,1290,'phone pay',765678),
    (47474,875,'google pay',88888);
    
    insert into payment_p2
    values
    (452389,38989),
    (22223,90909),
    (67676,10293),
    (78787,934122),
    (25231,379087),
    (47474,599990);
    
    insert into ticket1
    values
    (9999999,65565,24,'hyderabad','vijayawada','first class'),
    (8888888,89890,45,'delhi','chennai','second class'),
    (7777777,97654,76,'vizag','hyderabad','first class'),
    (6666666,97654,43,'tirupati','vijayawada','sleeper'),
    (5555555,41234,35,'chennai','mumbai','third class'),
    (4444444,41234,89,'palasa','hyderabad','first class'),
    (3333333,59087,55,'eluru','guntur','second class');
    
    insert into ticket2
    values
    ('9812445','23 sep 3.15 pm',452389),
    ('678543','14 nov 5.am',22223),
    ('4321678','29 march 4.30 pm',67676),
    ('3456789876','8 feb 7.am',78787),
    ('45672387','14 nov 5 am',25231),
    ('2765890','6 april 8 pm',47474);
    
    
 insert into ticket3
 values
 (452389,9999999),
 (67676,8888888),
 (22223,7777777),
 (25231,5555555),
 (47474,6666666),
 (78787,4444444);
 
 insert into cancellation1
 values
 (5321,'12 dec 12.pm',230),
 (7890,'23 nov 3.pm',540);
 drop table cancellation1;
 insert into cancellation2
 values
 (22223,5321),
 (47474,7890);
 select contact from passenger_contact inner join passenger where passenger.aadhar=678543 and passenger.aadhar=passenger_contact.aadhar;
 
 select contact from manager_contact inner join manager where manager.m_id=123 and manager.m_id=manager_contact.m_id;
 
 select m_id from train2 inner join train1 where train1.t_num=65565 and train1.t_num=train2.t_num;
 
 select ticket_id from ticket2 where aadhar=4321678 and date_time='23 sep 3.15 pm'; 
 
 select ticket_id from ticket1 inner join ticket3 where ticket1.pnr_number=ticket3.pnr_number and ticket1.pnr_number=9999999;
 
 select p_id from payment_p1 inner join payment_p2 where payment_p1.ticket_id=22223 and payment_p1.ticket_id=payment_p2.ticket_id;
 
 insert into train1 values(74890,'kanyakumari super fast express',5.45,21,6.30,'guntur','rajastan');
 select* from train1;
 insert into train2 values(123,74890);
 
 select * from train1 inner join train2 where train1.t_num=train2.t_num and train1.t_num=97654;
 

  delete from ticket2 where ticket2.ticket_id=452389;
 select* from ticket2;

 
 
 
 delete from ticket2 where pnr_number=6666666;
 
 delete from ticket1 where pnr_number=6666666;
 
 select* from ticket1;
 
 update train1 
 set seats_avail=5 where t_num=89890;
 
 select * from train1;