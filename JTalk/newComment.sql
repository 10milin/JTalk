drop table newComment;

create table newComment(
	tableName varchar(100) not null,
	postNum int not null,
	email varchar(50) not null,
	newCount int default 0
);