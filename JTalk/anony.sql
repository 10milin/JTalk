drop table anony;

create table anony(
	num int not null auto_increment primary key,
	writerId varchar(50) not null,
	content varchar(4000) not null,	
	writeDate Timestamp default current_timestamp
	
);

alter table anony auto_increment = 1;