create table if not exists Modalities
(
	id int auto_increment
		primary key,
	name varchar(255) null,
	createdAt datetime not null,
	updatedAt datetime not null
);

create table if not exists Patients
(
	id int auto_increment
		primary key,
	name varchar(255) null,
	createdAt datetime not null,
	updatedAt datetime not null
);

create table if not exists SequelizeMeta
(
	name varchar(255) not null,
	constraint name
		unique (name)
)
collate=utf8_unicode_ci;

alter table SequelizeMeta
	add primary key (name);

create table if not exists Studies
(
	id int auto_increment
		primary key,
	idPatient int null,
	studyName varchar(255) null,
	createdAt datetime not null,
	updatedAt datetime not null,
	constraint Studies_ibfk_1
		foreign key (idPatient) references Patients (id)
);

create table if not exists Series
(
	id int auto_increment
		primary key,
	idStudy int null,
	idPatient int null,
	idModality int null,
	seriesName varchar(255) null,
	createdAt datetime not null,
	updatedAt datetime not null,
	constraint Series_ibfk_1
		foreign key (idStudy) references Studies (id),
	constraint Series_ibfk_2
		foreign key (idPatient) references Patients (id),
	constraint Series_ibfk_3
		foreign key (idModality) references Modalities (id)
);

create table if not exists Files
(
	id int auto_increment
		primary key,
	idSeries int null,
	idStudy int null,
	idPatient int null,
	filePath varchar(255) null,
	createdAt datetime not null,
	updatedAt datetime not null,
	constraint Files_ibfk_1
		foreign key (idSeries) references Series (id),
	constraint Files_ibfk_2
		foreign key (idStudy) references Studies (id),
	constraint Files_ibfk_3
		foreign key (idPatient) references Patients (id)
);

create index idPatient
	on Files (idPatient);

create index idSeries
	on Files (idSeries);

create index idStudy
	on Files (idStudy);

create index idModality
	on Series (idModality);

create index idPatient
	on Series (idPatient);

create index idStudy
	on Series (idStudy);

create index idPatient
	on Studies (idPatient);

