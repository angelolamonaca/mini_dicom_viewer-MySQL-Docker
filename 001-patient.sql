create table if not exists patient
(
	id_patient int auto_increment,
	name varchar(255) null,
	createdDate date null,
	constraint patient_id_patient_uindex
		unique (id_patient)
);

alter table patient
	add constraint `PRIMARY`
		primary key (id_patient);

