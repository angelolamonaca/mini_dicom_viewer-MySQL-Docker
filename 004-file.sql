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
	add constraint `PRIMARY`
		primary key (id_file);

