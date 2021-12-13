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
	add constraint `PRIMARY`
		primary key (id_series);

