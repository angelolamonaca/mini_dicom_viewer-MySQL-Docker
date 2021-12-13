create table if not exists modality
(
	id_modality int auto_increment,
	name varchar(255) null,
	constraint modality_id_modality_uindex
		unique (id_modality)
);

alter table modality
	add constraint `PRIMARY`
		primary key (id_modality);

