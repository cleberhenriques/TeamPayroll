CREATE TABLE player 
(
 id INTEGER PRIMARY KEY AUTOINCREMENT, 
 name TEXT, 
 age INTEGER, 
 salary REAL,
 imgUrl TEXT,
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

INSERT INTO player (name, age, salary, imgUrl, id_team) VALUES
("Andrés D\'alessando", 30, 500000,"http://www.infernomeudestino.com.br/wp-content/uploads/2014/08/Dalessandro.png",1),
("Anderson Luis", 20, 250000,"http://www.internacional.com.br/jogadorescolorados/foto/anderson3_grupo_grande.jpg", 1),
("Victor Vínicius", 21, 100000,"http://www.internacional.com.br/jogadorescolorados/foto/vitinho_grupo_280115.jpg", 1),
("Nilmar", 23, 300000,"http://www.internacional.com.br/jogadorescolorados/foto/Nilmar_grupo_2014_230914.jpg", 1),
("Nelson de Jesus", 24, 23000,"http://www.internacional.com.br/jogadorescolorados/foto/Dida_gruponovo_2014.jpg", 1),
("Charles Aránguiz", 28, 230000,"http://www.zerozero.pt/img/jogadores/80/180680_ori_charles_aranguiz.jpg", 1),
("Fabrício dos Santos", 24, 23123,"http://www.internacional.com.br/jogadorescolorados/foto/Fabricio_gruponovo_2014.jpg", 1),
("Réver", 32, 21222,"http://noticiasinter.com.br/wp-content/uploads/2015/01/rever_grupo_280115-374x547.jpg", 1),
("Carlos Martín",23, 213333,"http://www.internacional.com.br/jogadorescolorados/foto/luque_grupo_280115.jpg", 1),
("Rafael Moura",25, 343123,"http://www.sports21.com.br/atletas/rafael_moura_grupo_130812.jpg", 1),
("Muriel",22, 31341,"http://i0.statig.com.br/esporte/futebol/6869_1337366593794.jpg", 1);

INSERT INTO player (name, age, salary, id_team) VALUES
("Player Gremio 1", 30, 500000,2),
("Player Gremio 3", 20, 200000,2),
("Player Gremio 4", 30, 240000,2),
("Player Gremio 5", 30, 210000,2),
("Player Gremio 6", 30, 100000,2),
("Player Gremio 7", 30, 115000,2),
("Player Gremio 8", 30, 50000,2),
("Player Gremio 9", 30, 404000,2),
("Player Gremio 10", 30, 60000,2),
("Player Vasco 1", 30, 160000,3),
("Player Vasco 2", 30, 120000,3),
("Player Vasco 3", 30, 130000,3),
("Player Vasco 4", 30, 130000,3),
("Player Vasco 5", 30, 180000,3),
("Player Vasco 6", 30, 160300,3),
("Player Vasco 7", 30, 130330,3),
("Player Vasco 8", 30, 210000,3),
("Player Vasco 9", 30, 530000,3),
("Player Vasco 10", 30, 310000,3),
("Player Vasco 11", 30, 130000,3);

INSERT INTO supporter (name, registrationId, overdue, id_team) VALUES
("Supporter Gremio 1", "ga8ysdf", 1, 2),
("Supporter Gremio 3", "ga8ysdf", 1, 2),
("Supporter Gremio 3", "ga8ysdf", 1, 2),
("Supporter Gremio 4", "ga8ysdf", 1, 2),
("Supporter Gremio 5", "ga8ysdf", 1, 2),
("Supporter Gremio 6", "ga8ysdf", 1, 2),
("Supporter Gremio 7", "ga8ysdf", 1, 2),
("Supporter Gremio 8", "ga8ysdf", 1, 2),
("Supporter Gremio 9", "ga8ysdf", 1, 2),
("Supporter Gremio 10", "ga8ysdf", 1, 2),
("Supporter Gremio 11", "ga8ysdf", 1, 2),
("Supporter Gremio 12", "ga8ysdf", 1, 2),
("Supporter Gremio 13", "ga8ysdf", 1, 2),
("Supporter Gremio 14", "ga8ysdf", 1, 2),
("Supporter Vasco 1", "va8ysdf", 0, 3),
("Supporter Vasco 2", "va8ysdf", 0, 3),
("Supporter Vasco 3", "va8ysdf", 0, 3),
("Supporter Vasco 4", "va8yddf", 0, 3),
("Supporter Vasco 5", "va8ysdf", 1, 3),
("Supporter Vasco 6", "va8ysdf", 1, 3),
("Supporter Vasco 7", "va8ysdf", 0, 3),
("Supporter Vasco 8", "va8ysdf", 0, 3),
("Supporter Vasco 9", "va8ysdf", 1, 3),
("Supporter Vasco 10", "va8ysdf", 0, 3),
("Supporter Inter 1", "fj8998sdf", 0, 1),
("Supporter Inter 2", "fj8998sdf", 0, 1),
("Supporter Inter 3", "fj8998sdf", 0, 1),
("Supporter Inter 4", "fj8998sdf", 0, 1),
("Supporter Inter 5", "fj8998sdf", 0, 1),
("Supporter Inter 6", "fj8998sdf", 0, 1),
("Supporter Inter 7", "fj8998sdf", 0, 1),
("Supporter Inter 8", "fj8998sdf", 0, 1),
("Supporter Inter 9", "fj8998sdf", 0, 1),
("Supporter Inter 10", "fj8998sdf", 0, 1),
("Supporter Inter 11", "fj8998sdf", 0, 1),
("Supporter Inter 12", "fj8998sdf", 0, 1),
("Supporter Inter 13", "fj8998sdf", 0, 1),
("Supporter Inter 15", "fj8998sdf", 0, 1),
("Supporter Inter 16", "fj8998sdf", 0, 1);



