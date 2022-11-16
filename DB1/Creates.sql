create table people(
    id serial primary key,
    name text not null,
    surname text,
    birthday date not null
);
create table science_types(
    name text primary key ,
    description text
);
create table companies(
    id serial primary key,
    name text not null,
    location text not null,
    science_type text references science_types not null
);
create table scientists(
    people_id int references people on delete cascade on update cascade primary key,
    position text,
    work_comp_id int references companies,
    start_date date,
    check ((work_comp_id is null and position is null and start_date is null) or (work_comp_id is not null and position is not null and start_date is not null))
);
create table scientific_discoveries(
    name text primary key,
    description text,
    opening_date date not null
);
create table researches(
    company_id int references companies,
    start_date date not null,
    science_type text references science_types not null,
    scientific_discovery text references scientific_discoveries,
    primary key(company_id, scientific_discovery)
);
create table educational_institution_types(
    name text primary key,
    description text
);
create table education_type(
    name text primary key,
    duration integer not null,
    ed_inst_type text references educational_institution_types not null,
    constraint positive_duration check (duration > 0)
);
create table education_institution(
    id serial primary key,
    name text not null,
    location text not null,
    head_master_id integer references people on update cascade not null,
    eq_inst_type text references educational_institution_types not null
);
create table education(
    people_id  integer references people on update cascade on delete cascade,
    ed_inst_id integer references education_institution,
    start_date date,
    ed_type text references education_type not null,
    status text not null,
    primary key (people_id, ed_inst_id, start_date),
    constraint valid_status check (status = 'Оконченное' or status = 'Неоконченное')
);