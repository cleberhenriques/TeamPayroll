CREATE TABLE player 
(
 id INTEGER PRIMARY KEY AUTOINCREMENT, 
 name TEXT, 
 age INTEGER, 
 salary REAL,
 id_team INTEGER REFERENCES team ( id )
);

CREATE TABLE supporter 
( 
 id INTEGER PRIMARY KEY AUTOINCREMENT, 
 name TEXT, 
 registrationID  TEXT, 
 overdue INTEGER,
 id_team INTEGER REFERENCES team ( id )
);

CREATE TABLE team 
( 
 id INTEGER PRIMARY KEY,
 name TEXT,
 imgUrl TEXT
);

INSERT INTO team (id, name, imgUrl) VALUES
(1,"Sport Club Internacional", "https://hdlogo.files.wordpress.com/2011/11/internacional-logo.png"),
(2,"Grêmio", "http://nova99.com.br/copasantiago/timeslogo/gremio.png"),
(3,"Vasco", "https://hdlogo.files.wordpress.com/2011/11/vasco-da-gama-logo.png");

INSERT INTO player (name, age, salary, id_team) VALUES
("Andrés D\'alessando", 30, 500000, 1),
("Anderson Luis", 20, 250000, 1),
("Victor Vínicius", 21, 100000, 1),
("Nilmar", 23, 300000, 1),
("Nelson de Jesus", 24, 23000, 1),
("Charles Aránguiz", 28, 230000, 1),
("Fabrício dos Santos", 24, 23123, 1),
("Réver", 32, 21222, 1),
("Carlos Martín",23, 213333, 1),
("Rafael Moura",25, 343123, 1),
("Muriel",22, 31341, 1),
("Jogador Gremio 1", 30, 50, 2),
("Jogador Gremio 2", 20, 25, 2),
("Jogador Gremio 3", 21, 10, 2),
("Jogador Gremio 4", 23, 10, 2),
("Jogador Gremio 5", 24, 10, 2),
("Jogador Gremio 6", 28, 10, 2),
("Jogador Gremio 7", 24, 10, 2),
("Jogador Gremio 8", 32, 10, 2),
("Jogador Gremio 9",23, 10, 2),
("Jogador Gremio 10",25, 10, 2),
("Jogador Gremio 11",22, 10, 2);


INSERT INTO supporter (name, registrationId, overdue, id_team) VALUES
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 1),
("Torcedor", "fj8998sdf", 0, 2),
("Torcedor", "fj8998sdf", 0, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 0, 2),
("Torcedor", "fj8998sdf", 1, 2),
("Torcedor", "fj8998sdf", 0, 2);




