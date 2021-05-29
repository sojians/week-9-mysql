create database if not exists socialdev;

use socialdev;

drop table if exists comment;
drop table if exists post;
drop table if exists persona;

create table persona (
	persona_pk int primary key auto_increment not null,
	username varchar(40) not null,
	email varchar(384) not null,
	password varchar(64) not null
);

create table post (
	post_pk int primary key auto_increment not null,
	persona_fk int not null,
	post_body text not null,
	post_time datetime not null default current_timestamp,
	foreign key (persona_fk) references persona (persona_pk) on delete cascade
);

create table comment (
	comment_pk int not null auto_increment primary key,
	persona_fk int not null,
	post_fk int not null,
	comment_body text not null,
	comment_time datetime not null default current_timestamp,
	foreign key (post_fk) references post (post_pk),
	foreign key (persona_fk) references persona (persona_pk)
);