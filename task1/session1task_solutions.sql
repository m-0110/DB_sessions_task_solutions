create database mydb;
show databases;
use mydb;
CREATE TABLE IF NOT EXISTS USERS(user_id varchar(20),
				user_name varchar(20),
				email_id varchar(20),
				pass_word varchar(20),
				total_points INTEGER,
				college varchar(20),
                rank_of_user INTEGER,
				drives_attended INTEGER,PRIMARY KEY(user_id),
                zen_candidate varchar(20)
                );
show tables;


CREATE TABLE IF NOT EXISTS CODEKATA(user_id varchar(20) references USERS(user_id),
				   problems_solved INTEGER,
				   points_in_codekata INTEGER,primary key(user_id)
				   );

 
CREATE TABLE IF NOT EXISTS ATTENDANCE(user_id varchar(20) references USERS(user_id),
				      conducted_on DATE,
					  status varchar(20),primary key(user_id,conducted_on));



CREATE TABLE IF NOT EXISTS TASKS(Task_id varchar(20) PRIMARY KEY, Task_Name varchar(20),Assigned_on DATE,deadline DATE,users_completed INTEGER);




CREATE TABLE IF NOT EXISTS company_drives(company_name varchar(10) PRIMARY KEY,students_attended INTEGER,students_selected INTEGER);



CREATE TABLE IF NOT EXISTS Mentors(mentor_id varchar(20) PRIMARY KEY,mentor_name varchar(10),students_assigned INTEGER);



CREATE TABLE IF NOT EXISTS courses(course_id varchar(20) PRIMARY KEY,course_name varchar(20),students_enrolled INTEGER);

CREATE TABLE IF NOT EXISTS TOPICS(Topic_id varchar(20) PRIMARY KEY,course_id varchar(20) references courses(course_id),Topic_Name varchar(20),Total_points INTEGER,Users_solved INTEGER);

CREATE TABLE IF NOT EXISTS students_activated_courses(user_id varchar(20) references USERS(user_id) ,
course_id varchar(20) references courses(course_id),status TEXT,CHECK(status IN ('self paced','classroom')),PRIMARY KEY(user_id,course_id));



insert into users values('a10','amar','amar@mail.com','123',156,'kits',33,2,'yes'),
('a11','geeta','geeta@mail.com','456',150,'kits',45,2,'yes'),
('a12','ravi','ravi@mail.com','789',154,'kits',34,2,'yes'),
('a13','ram','ram@mail.com','111',15,'kits',989,1,'no'),
('a14','sita','sita@mail.com','222',1560,'kits',16,2,'yes'),
('a15','priya','priya@mail.com','242',1578,'kits',15,1,'yes')
;




insert into codekata values('a10',6,20),('a11',3,15),('a12',4,24),('a13',5,10),('a14',10,300),('a15',10,306);



insert into attendance values ('a10','2021-09-01','y'),('a10','2021-09-02','n'),('a12','2021-09-01','y'),('a14','2021-09-02','y'),('a15','2021-09-02','n');


insert into topics values('t01','arrays','c103',100,3) , ('t02','sorting','c103',240,3),('t06','strings','c103',135,2),('t05','html','c109',80,2);


insert into tasks values('101','task1','2021-02-01','2021-03-01',1) ,('102','task2','2021-02-01','2021-03-01',0),
('103','task3','2021-02-01','2021-03-01',2),('104','task4','2021-03-01','2021-03-01',0),('105','task5','2021-02-01','2021-03-01',3);



insert into company_drives values('chubb',4,3) , ('amazon',5,1),('dxc',4,3),('infosys',4,2),('adobe',5,0);

insert into mentors values(1,'rahul',4),(2,'rama',2),(3,'shyma',5),(4,'reema',2),(5,'raghu',4);

insert into courses values('c101','mysql',5),('c109','web',4),('c102','datastructures',5),('c103','Algorithms',5),('c104','Networking',4);

insert into students_activated_courses values('a10','c101','self paced') ,('a10','c103','classroom'),('a11','c109','classroom'),('a13','c104','self paced');

insert into students_activated_courses values('a10','c102','classroom') ,('a11','c103','classroom'),('a11','c104','classroom');


select user_name,problems_solved as "problems solved in codekata " from codekata inner join users on codekata.user_id=users.user_id;

select user_id,user_name , drives_attended as "Number of drives attended" from users;






select students_activated_courses.course_id,count(*) from students_activated_courses inner join courses on
 students_activated_courses.course_id =courses.course_id group by course_name ;
 
 select * from mentors;

select mentor_name, students_assigned as "Number of students assigned" from mentors ;


                   
                   