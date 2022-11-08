Create DATABASE SiteBibliotheque
use SiteBibliotheque

create table Livre(
	id int NOT NULL IDENTITY(1,1),
	titre varchar(100) NOT NULL,
	date_Parution date,
	synopsis text,
	type_livre varchar(50),
	Constraint pk_Livre Primary KEY(id),
	id_Image int,
	id_Auteur int);

create table Images(
	id int NOT NULL IDENTITY(1,1),
	nom varchar(100) NOT NULL,
	extention varchar(5),
	type_image varchar(50),
	Constraint pk_Images Primary Key(id)
	);

Create table Auteur(
	id int NOT NULL IDENTITY(1,1),
	nom varchar(50) NOT NULL,
	prenom varchar(50),
	date_naissance date,
	date_mort date,
	Constraint pk_Auteur Primary KEY(id));

CREATE TABLE Genre(
  id INT NOT NULL IDENTITY(1,1),
  nom VARCHAR(50),
  Constraint pk_Genre Primary KEY(id));

CREATE TABLE GenreLivre(
  livre_id INT foreign key references Livre(id),
  genre_id INT foreign key references Genre(id)
);

	Insert into Genre (nom) values
	('Action'),
	('Aventure'),
	('Science-Fiction'),
	('Social'),
	('Historique'),
	('Romantique'),
	('Humour'),
	('Fantasy'),
	('Horreur'),
	('Biographie'),
	('Policier')
	;

	select * from genre;

	Insert into Auteur (nom, prenom, date_naissance, date_mort) values
	('Verne', 'Jules', '1828-02-08', '1905-03-24'),
	('Dumas', 'Alexandre', '1802-06-24', '1870-12-05'),
	('Victor', 'Hugo', '1802-02-26', '1885-05-22'),
	('Agatha', 'Christie', '1890-09-15', '1976-01-12'),
	('Shakespeare', 'William', '1564-04-15', '1616-04-23'),
	('Tolkien', 'J.R.R.', '1892-01-03', '1973-09-01'),
	('Freud', 'Sigmund', '1856-05-06', '1939-09-23'),
	('Rowling', 'Joanne', '1965-07-31', null),
	('King', 'Stephen', '1947-09-21', null),
	('Platon', null, null, null),
	('Poe', 'Edgar', '1809-01-19', '1849-10-07'),
	('Eiichiro', 'Oda', '1975-01-01', null),
	('Hergé', null, '1907-05-22', '1983-03-03');

	select * from auteur
	
	Insert into Livre (titre, date_Parution, type_livre, id_Auteur) values
	('Le tour du monde en 80 jours', '1872-12-22', 'Roman', 1),
	('Voyage au centre de la Terre', '1864-11-25', 'Roman', 1),
	('Vingt Mille Lieues sous les mers', '1870-06-20', 'Roman', 1),
	('Les Trois Mousquetaires', '1844-11-06', 'Roman', 2),
	('Les Misérables', '1844-11-06', 'Roman', 3),
	('One Piece', '2022-11-07', 'Manga',12),
	('Tintin au Tibet', '2000-11-06', 'Bande-déssiné', 13),
	('Tintin au Congo', '1998-11-06', 'Bande-déssiné', 13);

	select * from livre

	select * from genre;
	select * from livre

	Insert into GenreLivre (livre_id, genre_id) values
	(1,2),
	(2,2),
	(2,3),
	(3,2),
	(3,3),
	(4,2),
	(4,5),
	(5,4),
	(5,5),
	(6,2),
	(6,7),
	(7,2),
	(7,11)
	;
	
	Select Livre.titre, STRING_AGG(Genre.nom,'/') as Genre 
	From Livre LEFT join GenreLivre on Livre.id = GenreLivre.livre_id 
	Left join Genre on GenreLivre.genre_id = Genre.id
	Group by Livre.titre;

	Select Livre.titre, Auteur.nom From Livre Inner JOIN Auteur on Livre.id_Auteur = auteur.id
	order by Auteur.nom;

	Select Auteur.nom, Auteur.prenom, STRING_AGG(Livre.titre,', ') as Ouvrages 
	From Livre LEFT join Auteur on Livre.id_Auteur = auteur.id
	Group by Auteur.nom, auteur.prenom;

	Select Livre.titre from Livre
	order by Livre.titre ASC

	Select Livre.titre from Livre
	order by Livre.titre DeSC

	Select Livre.titre, type_livre from Livre
	where type_livre = 'Roman'

	Select Livre.titre, type_livre from Livre
	where type_livre != 'Roman'

	Select livre.titre, date_Parution from Livre
	where date_Parution < '1900-01-01'
