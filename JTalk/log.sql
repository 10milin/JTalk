drop table log;

create table log(
	num int not null auto_increment primary key,
	board varchar(50) not null,
	title varchar(300) not null,
	content varchar(4000) not null,
	writerId varchar(50) not null,
	writerName varchar(50) not null,
	deleteId varchar(50) not null,
	deleteName varchar(50) not null,
	executeDate Timestamp default current_timestamp
);

alter table log auto_increment = 1;