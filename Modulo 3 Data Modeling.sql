create table consultants (
  consultant_id   integer,
  consultant_name varchar2(100)
);

create table patients (
  patient_id   integer,
  patient_name varchar2(100)
);

create table clinics (
  clinic_name varchar2(10),
  address     varchar2(1000)
);

create table appointments (
  appointment_id       integer,
  appointment_datetime date,
  clinic_name          varchar2(30),
  consultant_id        integer,
  patient_id           integer
);

create table people (
  person_id integer,
  full_name varchar2(100)
);

create table consultants 
  consultant_id  integer,
  salary         number(10,2),
  speciality     varchar2(30)
);

create table patients (
  patient_id      integer,
  hopsital_number integer
);

create table appointments (
  appointment_doc varchar2(4000)
);