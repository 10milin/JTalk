drop table member;

create table member(
	email varchar(50) primary key,
	pass varchar(200) not null,
	name varchar(50) not null,
	period int not null,
	ban char(1) default '0',
	active char(1) default '0',
	link varchar(100),
	registerDate TIMESTAMP default current_timestamp,
	profile varchar(100) default 'user-default.png',
	pr varchar(1000) default 'hi?'
)COLLATE='utf8_general_ci';

insert into member values('admin', '$2a$10$kAx/fvekwISov5f/WRrHuONbDOwk5lTfHtpJLRaFg4kKNkIDJ8YVC', '관리자', 0, 0, 3, null, default, default, default);