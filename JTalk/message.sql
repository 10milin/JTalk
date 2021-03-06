drop table message;

create table message(
	num int not null auto_increment primary key,
	title varchar(300) not null,
	content varchar(4000) not null,
	sendId varchar(50) not null,
	sendName varchar(50) not null,
	sendProfile varchar(100) not null,
	receiveId varchar(50) not null,
	writeDate Timestamp default current_timestamp,
	readMessage char(1) default 0
)COLLATE='utf8_general_ci';

alter table message auto_increment = 1;