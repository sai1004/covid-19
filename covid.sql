create database covid_19;

use covid_19;

create table covid_paitent (

	id varchar(299) primary key not null,
    name varchar(255) not null,
    age int(3) not null,
    gender enum('F','M','Other') not null,
    mobile int(16) ,
    repoted_on datetime not null,
    areas_went_id varchar(299),
	recovered boolean not null default false,
	is_dead boolean not null default false,
    medical_report_id varchar(199) not null,
    is_local_citizen boolean not null,
    img_id varchar(30) not null,
    address_id varchar(299) not null

);

areas_went_id --> infected_locations

create table medical_report (

	id varchar(299) primary key not null,
    status enum('mild','average','critical') not null,
	hospital_name varchar(149) not null,
    admitted_on datetime not null default now(),
    bed_num varchar(99) not null,
    ward_num varchar(99) not null,
    died_on datetime default null,
    covid_documents_id varchar(299) not null,
    hospital_address_id varchar(150) not null,
    doctor_id varchar(99) not null
    
);
hospital_address_id --> address
covid_documents_id --> covid_documents
doctor_id --> covid_doctors

create table covid_doctors (

	id varchar(299) primary key not null,
    name varchar(199) not null,
    age int(3) not null,
    mobile int(15) not null,
    email varchar(199) not null,
    designation varchar(149) not null,
    address_id varchar(199),
    
); 
address_id --> address

create table covid_documents (

    id varchar(299) primary key not null,
    scanned_docs_id varchar(299) not null,

);
scanned_docs_id --> img

create table address (
	
    id varchar(299) primary key not null,
    area varchar(255),
    land_mark varchar(255),
    city varchar(255),
    state varchar(255),
    country varchar(255),
    zip_code int(10),
    lat varchar(255) not null default '00.0000000',
    lng varchar(255) not null default '00.0000000',
    show_map boolean not null default true,
    updated_on timestamp default now(),

);

create table img (
    
    id varchar(99) primary key,
    name varchar(99) default 'upload',
    src longtext not null

);

create table covid_network (

    id varchar(299) primary key not null,
    profile_id varchar(299) not null 

);
profile_id --> profile

create table profile (

    id varchar(299) primary key not null,
    contacted_to_id varchar(299) not null


);
contacted_to_id --> suspects

create table suspects (

    id varchar(299) primary key not null,
    name varchar(255) not null,
    age int(3) not null,
    gender enum('F','M','Other') not null,
    mobile int(16),
    is_screened boolean not null,
    is_quarantine boolean not null,
    tested_on datetime default now(),
    covid_result boolean default null,
    travel_history varchar(299) not null,
    updated_on timestamp default now(),

);

create table infected_locations (

    id varchar(299) primary key not null,
    area varchar(299) not null,
    land_mark varchar(255),
    city varchar(255),
    state varchar(255),
    country varchar(255),
    zip_code int(10),
    lat varchar(255) not null default '00.0000000',
    lng varchar(255) not null default '00.0000000',
    infected_on datetime not null,
    is_sanitized boolean not null default false,
    show_map boolean not null default true,
    updated_on timestamp default now(),

);
