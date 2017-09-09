drop table notice;

create table notice(
	num int not null auto_increment primary key,
	title varchar(300) not null,
	content varchar(4000) not null,
	writerId varchar(50) not null,
	writerName varchar(50) not null,
	fileName varchar(100),
	writeDate datetime default current_timestamp
);