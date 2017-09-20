drop table member;

create table member(
	email varchar(50) primary key,
	pass varchar(50) not null,
	name varchar(50) not null,
	period int not null,
	ban char(1) default '0',
	active char(1) default '0',
	link varchar(100),
	registerDate TIMESTAMP default current_timestamp,
	profile varchar(100) default 'user-default.png',
	pr varchar(1000) default '안녕하세요?'
);

insert into member values('admin', '1234', '관리자', 0, 0, 3, null, default, default, default);