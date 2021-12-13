create table if not exists SequelizeMeta
(
	name varchar(255) not null,
	constraint name
		unique (name)
)
collate=utf8_unicode_ci;

alter table SequelizeMeta
	add primary key (name);

create table if not exists modalities
(
	idModality int auto_increment
		primary key,
	name varchar(255) null,
	createdAt datetime not null,
	updatedAt datetime not null
);

create table if not exists patients
(
	idPatient int auto_increment
		primary key,
	name varchar(255) null,
	createdAt datetime not null,
	updatedAt datetime not null
);

create table if not exists studies
(
	idStudy int auto_increment
		primary key,
	idPatient int null,
	studyName varchar(255) null,
	createdAt datetime not null,
	updatedAt datetime not null,
	constraint studies_ibfk_1
		foreign key (idPatient) references patients (idPatient)
);

create table if not exists series
(
	idSeries int auto_increment
		primary key,
	idStudy int null,
	idPatient int null,
	idModality int null,
	seriesName varchar(255) null,
	createdAt datetime not null,
	updatedAt datetime not null,
	constraint series_ibfk_1
		foreign key (idStudy) references studies (idStudy),
	constraint series_ibfk_2
		foreign key (idPatient) references patients (idPatient),
	constraint series_ibfk_3
		foreign key (idModality) references modalities (idModality)
);

create table if not exists files
(
	idFile int auto_increment
		primary key,
	idSeries int null,
	idStudy int null,
	idPatient int null,
	filePath varchar(255) null,
	createdAt datetime not null,
	updatedAt datetime not null,
	constraint files_ibfk_1
		foreign key (idSeries) references series (idSeries),
	constraint files_ibfk_2
		foreign key (idStudy) references studies (idStudy),
	constraint files_ibfk_3
		foreign key (idPatient) references patients (idPatient)
);

create index idPatient
	on files (idPatient);

create index idSeries
	on files (idSeries);

create index idStudy
	on files (idStudy);

create index idModality
	on series (idModality);

create index idPatient
	on series (idPatient);

create index idStudy
	on series (idStudy);

create index idPatient
	on studies (idPatient);

