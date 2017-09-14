drop table comment;

create table comment(
	tableName varchar(100) not null,
	postNum int not null,
	num int not null auto_increment primary key,
	writerId varchar(50) not null,
	writerName varchar(50) not null,
	content varchar(1000) not null,
	writeDate Timestamp default current_timestamp
);

alter table comment auto_increment = 1;