drop table notice;

create table notice(
	num int not null auto_increment primary key,
	title varchar(1000) not null,
	content varchar(65535) not null,
	writerId varchar(50) not null,
	writerName varchar(50) not null,
	fileName varchar(1000),
	writeDate datetime default current_timestamp
);