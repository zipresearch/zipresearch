/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     07/03/2014 16:49:13                          */
/*==============================================================*/


drop table if exists alternatives;

drop table if exists cities;

drop table if exists clients;

drop table if exists client_surveys;

drop table if exists conditions;

drop table if exists condition_group_conditions;

drop table if exists countries;

drop table if exists faqs;

drop table if exists group_conditions;

drop table if exists headers;

drop table if exists input_types;

drop table if exists logs;

drop table if exists questions;

drop table if exists surveys;

drop table if exists users;

/*==============================================================*/
/* Table: alternatives                                          */
/*==============================================================*/
create table alternatives
(
   id                   int not null auto_increment,
   questions_id         int,
   conditions_id        int,
   weight               int not null,
   description          text not null,
   chosen               smallint,
   answer_description   text,
   primary key (id)
);

/*==============================================================*/
/* Table: cities                                                */
/*==============================================================*/
create table cities
(
   id                   int not null auto_increment,
   countries_id         int,
   name                 varchar(255) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: clients                                               */
/*==============================================================*/
create table clients
(
   id                   int not null auto_increment,
   cities_id            int,
   countries_id         int,
   name                 varchar(255) not null,
   lastname             varchar(255),
   username             varchar(255) not null,
   password             varchar(255) not null,
   email                varchar(255) not null,
   status               enum('ACTIVE','PENDING','INACTIVE') not null,
   registration_date    datetime not null,
   image                varchar(255),
   gender               enum('M','F') not null,
   changed_password     enum('Y','N') not null,
   birthday             date not null,
   primary key (id)
);

/*==============================================================*/
/* Table: client_surveys                                        */
/*==============================================================*/
create table client_surveys
(
   surveys_id           int not null,
   clients_id           int not null,
   completion           enum('NOTCOMPLETED','COMPLETED') not null,
   primary key (surveys_id, clients_id, completion)
);

/*==============================================================*/
/* Table: conditions                                            */
/*==============================================================*/
create table conditions
(
   id                   int not null auto_increment,
   questions_id         int,
   primary key (id)
);

/*==============================================================*/
/* Table: condition_group_conditions                            */
/*==============================================================*/
create table condition_group_conditions
(
   conditions_id        int not null,
   group_conditions_id  int not null,
   primary key (conditions_id, group_conditions_id)
);

/*==============================================================*/
/* Table: countries                                             */
/*==============================================================*/
create table countries
(
   id                   int not null auto_increment,
   name                 varchar(255) not null,
   code                 varchar(20) not null,
   capital              varchar(35),
   primary key (id)
);

/*==============================================================*/
/* Table: faqs                                                  */
/*==============================================================*/
create table faqs
(
   id                   int not null auto_increment,
   question             text not null,
   answer               text not null,
   primary key (id)
);

/*==============================================================*/
/* Table: group_conditions                                      */
/*==============================================================*/
create table group_conditions
(
   id                   int not null auto_increment,
   questions_id         int,
   primary key (id)
);

/*==============================================================*/
/* Table: headers                                               */
/*==============================================================*/
create table headers
(
   id                   int not null auto_increment,
   description          varchar(255) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: input_types                                           */
/*==============================================================*/
create table input_types
(
   id                   int not null auto_increment,
   description          varchar(255) not null,
   type                 enum('ADVANCED','BASIC') not null,
   primary key (id)
);

/*==============================================================*/
/* Table: logs                                                  */
/*==============================================================*/
create table logs
(
   id                   int not null auto_increment,
   users_id             int,
   action               varchar(255) not null,
   reason               text not null,
   log_date             datetime not null,
   primary key (id)
);

/*==============================================================*/
/* Table: questions                                             */
/*==============================================================*/
create table questions
(
   id                   int not null auto_increment,
   headers_id           int,
   input_types_id       int not null,
   surveys_id           int,
   type                 enum('OPEN','CLOSE','ORDINAL','INTERVAL','RATIO','OTHER') not null,
   weight               int not null,
   alternatives_number  int not null,
   description          text not null,
   primary key (id)
);

/*==============================================================*/
/* Table: surveys                                               */
/*==============================================================*/
create table surveys
(
   id                   int not null auto_increment,
   users_id             int,
   bonus                int,
   time                 int not null,
   max_questions        int not null,
   title                varchar(255) not null,
   description          text not null,
   status               enum('INACTIVE','DRAFT','ACTIVE') not null,
   creation_date        datetime not null,
   primary key (id)
);

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
   id                   int not null auto_increment,
   username             varchar(255) not null,
   password             varchar(255) not null,
   name                 varchar(255) not null,
   lastname             varchar(255) not null,
   email                varchar(255) not null,
   status               tinyint not null,
   primary key (id)
);

alter table alternatives add constraint fk_relationship_27 foreign key (questions_id)
      references questions (id) on delete restrict on update restrict;

alter table alternatives add constraint fk_relationship_35 foreign key (conditions_id)
      references conditions (id) on delete restrict on update restrict;

alter table cities add constraint fk_relationship_14 foreign key (countries_id)
      references countries (id) on delete restrict on update restrict;

alter table clients add constraint fk_relationship_12 foreign key (cities_id)
      references cities (id) on delete restrict on update restrict;

alter table clients add constraint fk_relationship_13 foreign key (countries_id)
      references countries (id) on delete restrict on update restrict;

alter table client_surveys add constraint fk_relationship_11 foreign key (clients_id)
      references clients (id) on delete restrict on update restrict;

alter table client_surveys add constraint fk_relationship_11 foreign key (surveys_id)
      references surveys (id) on delete restrict on update restrict;

alter table conditions add constraint fk_relationship_31 foreign key (questions_id)
      references questions (id) on delete restrict on update restrict;

alter table condition_group_conditions add constraint fk_relationship_32 foreign key (conditions_id)
      references conditions (id) on delete restrict on update restrict;

alter table condition_group_conditions add constraint fk_relationship_32 foreign key (group_conditions_id)
      references group_conditions (id) on delete restrict on update restrict;

alter table group_conditions add constraint fk_relationship_30 foreign key (questions_id)
      references questions (id) on delete restrict on update restrict;

alter table logs add constraint fk_relationship_15 foreign key (users_id)
      references users (id) on delete restrict on update restrict;

alter table questions add constraint fk_relationship_18 foreign key (input_types_id)
      references input_types (id) on delete restrict on update restrict;

alter table questions add constraint fk_relationship_25 foreign key (surveys_id)
      references surveys (id) on delete restrict on update restrict;

alter table questions add constraint fk_relationship_26 foreign key (headers_id)
      references headers (id) on delete restrict on update restrict;

alter table surveys add constraint fk_relationship_16 foreign key (users_id)
      references users (id) on delete restrict on update restrict;

