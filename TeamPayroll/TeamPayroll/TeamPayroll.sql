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
 name TEXT 
);

INSERT INTO team (id, name) VALUES
(1,"Sport Club Internacional"),
(2,"Grêmio"),
(3,"Vasco"),
(4,"Corinthians"),
(5,"Xavante");

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
("Andrés D\'alessando", 30, 50, 2),
("Anderson Luis", 20, 25, 2),
("Victor Vínicius", 21, 10, 2),
("Nilmar", 23, 10, 2),
("Nelson de Jesus", 24, 10, 2),
("Charles Aránguiz", 28, 10, 2),
("Fabrício dos Santos", 24, 10, 2),
("Réver", 32, 10, 2),
("Carlos Martín",23, 10, 2),
("Rafael Moura",25, 10, 2),
("Muriel",22, 10, 2);


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




