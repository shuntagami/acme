create database if not exists `acme_development` character set utf8mb4 collate utf8mb4_bin;

use `acme_development`;

drop table if exists users;
create table if not exists users
(
  id int unsigned not null primary key auto_increment,
  name varchar(128) not null
) character set utf8mb4 collate utf8mb4_bin;

insert into users (name)
values ('user1'),
       ('user2');
