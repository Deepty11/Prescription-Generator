
    create table hibernate_sequence (
       next_val bigint
    ) engine=MyISAM

    insert into hibernate_sequence values ( 1 )

    create table prescription (
       id integer not null auto_increment,
        age varchar(255),
        date varchar(255),
        diagnosis varchar(255),
        gender varchar(255),
        medicines varchar(255),
        next_visit_date varchar(255),
        patient_name varchar(255),
        primary key (id)
    ) engine=MyISAM

    create table user (
       id integer not null,
        email varchar(255),
        password varchar(255),
        primary key (id)
    ) engine=MyISAM
