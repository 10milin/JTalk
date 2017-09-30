drop table trade;

create table trade(
	num int not null auto_increment primary key,
	title varchar(50) not null,
	photo varchar(100) not null,
	originphoto varchar(100) not null,
	content varchar(4000) not null,
	isSoldout char(1) default '0',
	writerID varchar(50) not null,
	writerName varchar(50) not null,
	phone varchar(50) not null,
	price varchar(50) not null default 0,
	writeDate Timestamp default current_timestamp,
	hit int default 0
);

alter table trade auto_increment = 1;