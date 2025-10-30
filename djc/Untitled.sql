use test;
    
alter table new change password pass varchar(30);
insert into new(id,username,pass,answer1,answer2) values (1,'jack','101abc',10,'y'),
   (2,'alan','102abc',15,'n'),
   (3,'bob','103abc',30,'y'),
   (4,'dick','104abc',10,'y');

select * from new where username like '___';
select * from new;
select max(answer1) from new;
select answer2,count(*) from new where answer1<=20 group by answer2 having count(*)>3;

create table questionnaire (
id int primary key auto_increment comment'问卷编号',
write_time varchar(10) comment'填写用时',
gender char(3) comment '性别',
age varchar(10) comment'年龄',
height varchar(10) comment'身高',
weight varchar(10) comment'体重',
brush_time varchar(10) comment'刷牙时长',
brush_method varchar(10) comment'刷牙方法',
toothpaste char(3) comment'是否使用牙膏',
brush_counter varchar(7) comment'刷牙次数',
wash_meal char(3) comment'饭后漱口',
floss_seq varchar(10) comment'牙线频率',
wash_seq varchar(10) comment'漱口水频率',
sweet_seq varchar(10) comment'甜食频率',
sweet_drink_seq varchar(10) comment'含糖饮料频率',
other_snack_seq varchar(10) comment'其他零食频率',
dental_seq char(6) comment'诊所检查频率',
first_brush varchar(10) comment'首次刷牙年龄',
help_until varchar(10) comment'家长帮助到年龄',
first_check varchar(10) comment'首次检查年龄',
first_descsyed varchar(10) comment'首次得龋齿年龄',
descsyed_counter varchar(10) comment'龋齿数量',
descsyed_cure char(3) comment'是否治疗',
milk_time varchar(10) comment'夜奶时间',
milk_method char(6) comment'喂养方式',
whether_F char(3) comment'是否涂氟',
F_seq varchar(10) comment'涂氟频率',
sealant char(3) comment'是否窝沟封闭',
systemic_disease char(3) comment'是否全身性疾病',
self_brush char(3) comment '是否主动刷牙',
parent_edu varchar(10) comment'父母学历',
parent_job varchar(30) comment'父母工作',
family_income varchar(20) comment'家庭月收入',
parent_health varchar(10) comment'父母口腔健康情况',
parent_emphasis varchar(10) comment'父母重视程度',
whether_cure char(3) comment'是否需要治疗',
user_id int not null comment '填写人编号',
foreign key(user_id) references users(user_id)
);
select * from questionnaire where user_id=2;

show tables;
use test;
select * from questionare2;
SHOW TABLE STATUS WHERE Name = 'questionare';
ALTER TABLE questionare ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

SELECT COUNT(*) FROM questionare;

create table users(
user_id int auto_increment primary key comment'用户编号',
user_name varchar(10) not null unique comment'用户名',
user_email varchar(50) not null unique comment'用户邮箱',
user_pass varchar(30) not null comment'密码'
);
select * from users;

create table messages (
id int auto_increment primary key,
user_name varchar(10) not null,
content text not null,
created_at timestamp default current_timestamp,
user_id int,
foreign key (user_id) references users(user_id)
);

create table result(
id int primary key auto_increment comment'结果编号',
content text comment'具体内容',
q_id int comment'对应问卷编号',
foreign key (q_id) references questionnaire(id)
);

select * from questionare;
select * from users;

use mysql;
create user 'apppy'@'localhost' identified by 'model_connect';
grant select on test.questionnaire to 'apppy'@'localhost';
select * from user;

create database lab1;
use lab1;
create table Branch(
branchNo char(4) not null primary key,
street varchar(20) not null,
city varchar(10) not null,
postcode varchar(20)
);
create table Staff(
staffNo varchar(4) not null primary key,
fName varchar(20) not null,
lName varchar(20) not null,
position varchar(20) not null,
sex char(1) not null,
DOB varchar(20) not null,
salary int not null,
barnchNo char(4) not null,
foreign key(barnchNo) references Branch(branchNo)
);
create table pertyForRent (
propertyNo varchar(4) not null primary key,
street varchar(20) not null,
city varchar(10) not null,
postcode varchar(10) not null,
type varchar(10) not null check(type in('House','Flat')),
rooms tinyint not null,
rent int not null,
ownerNo char(4) not null,
staffNo varchar(3),
branchNo char(4) not null,
foreign key(branchNo) references Branch(branchNo)
);
create table Client(
clientNo char(4) not null primary key,
fName varchar(10) not null,
lName varchar(10) not null,
telNo varchar(20) not null,
preType varchar(10) not null check(type in('House','Flat')),
maxRent int not null,
eMail varchar(50) not null
);
select * from Branch;
select * from Branch where(city like '%Aberdeen%');
select * from Staff where(salary>15000 and salary<25000);
select * from Staff where(DOB like '%Jun%');
select sum(staffNo) from Staff where(DOB like '%Jun%');


create database emailDB;
use emailDB;
create table user(
user_id int not null auto_increment primary key,
user_name varchar(20) not null,
user_pass varchar(50) not null,
user_email varchar(50) not null
);
create table user_account(
id int auto_increment primary key,
user_id int not null,
email varchar(100) not null,
imap_host varchar(100) not null,
imap_port int not null,
smtp_host varchar(100) not null,
smtp_port int not null,
username varchar(100) not null,
password varchar(255) not null,
is_default boolean default false,
created_at timestamp default current_timestamp,
foreign key (user_id) references user(user_id)
);
create table email(
id int auto_increment primary key,
account_id int not null,
uid VARCHAR(255) NOT NULL,
    message_id VARCHAR(255),
    subject TEXT,
    from_address TEXT NOT NULL,
    to_address TEXT,
    cc_address TEXT,
    bcc_address TEXT,
    body_text TEXT,
    body_html TEXT,
    is_read BOOLEAN DEFAULT FALSE,
    is_starred BOOLEAN DEFAULT FALSE,
    has_attachment BOOLEAN DEFAULT FALSE,
    date DATETIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES user_account(id),
    UNIQUE (id, uid)
);
CREATE TABLE attachments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email_id INT NOT NULL,
    filename VARCHAR(255) NOT NULL,
    content_type VARCHAR(100),
    size INT,
    content_id VARCHAR(255),
    file_path TEXT NOT NULL,
    FOREIGN KEY (email_id) REFERENCES email(id)
);
CREATE TABLE folders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    path VARCHAR(255) NOT NULL,
    FOREIGN KEY (account_id) REFERENCES user_account(id),
    UNIQUE (account_id, path)
);
CREATE TABLE email_folders (
    email_id INT NOT NULL,
    folder_id INT NOT NULL,
    PRIMARY KEY (email_id, folder_id),
    FOREIGN KEY (email_id) REFERENCES email(id),
    FOREIGN KEY (folder_id) REFERENCES folders(id)
);


show global status like 'com_______';