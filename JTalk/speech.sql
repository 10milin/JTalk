drop table speech;

create table speech(
	num int not null auto_increment primary key,
	title varchar(300) not null,
	content varchar(4000) not null,
	writerId varchar(50) not null,
	writerName varchar(50) not null,
	fileName varchar(100),
	originFileName varchar(100),
	writeDate Timestamp default current_timestamp,
	hit int default 0,
	period int not null
)COLLATE='utf8_general_ci';

alter table speech auto_increment = 1;