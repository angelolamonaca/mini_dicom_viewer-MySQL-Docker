create table if not exists study
(
	id_study int auto_increment,
	study_name varchar(255) null,
	created_date date null,
	id_patient int null,
	constraint study_id_study_uindex
		unique (id_study),
	constraint study_patient_idPatient_fk
		foreign key (id_patient) references patient (id_patient)
			on update cascade on delete cascade
);

alter table study
	add constraint `PRIMARY`
		primary key (id_study);

