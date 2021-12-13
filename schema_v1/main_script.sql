create table if not exists modality
(
	id_modality int auto_increment,
	name varchar(255) null,
	constraint modality_id_modality_uindex
		unique (id_modality)
);

alter table modality
	add primary key (id_modality);

create table if not exists patient
(
	id_patient int auto_increment,
	name varchar(255) null,
	createdDate date null,
	constraint patient_id_patient_uindex
		unique (id_patient)
);

alter table patient
	add primary key (id_patient);

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
	add primary key (id_study);

create table if not exists series
(
	id_patient int null,
	id_study int null,
	id_modality int null,
	series_name varchar(255) null,
	created_date date null,
	id_series int auto_increment,
	constraint series_id_series_uindex
		unique (id_series),
	constraint series_modality_id_modality_fk
		foreign key (id_modality) references modality (id_modality)
			on update cascade on delete cascade,
	constraint series_patient_id_patient_fk
		foreign key (id_patient) references patient (id_patient)
			on update cascade on delete cascade,
	constraint series_study_id_study_fk
		foreign key (id_study) references study (id_study)
			on update cascade on delete cascade
);

alter table series
	add primary key (id_series);

create table if not exists file
(
	id_patient int null,
	id_study int null,
	id_series int null,
	id_file int auto_increment,
	file_path varchar(255) null,
	created_date date null,
	constraint file_id_file_uindex
		unique (id_file),
	constraint file_patient_id_patient_fk
		foreign key (id_patient) references patient (id_patient)
			on update cascade on delete cascade,
	constraint file_series_id_series_fk
		foreign key (id_series) references series (id_series)
			on update cascade on delete cascade,
	constraint file_study_id_study_fk
		foreign key (id_study) references study (id_study)
			on update cascade on delete cascade
);

alter table file
	add primary key (id_file);

