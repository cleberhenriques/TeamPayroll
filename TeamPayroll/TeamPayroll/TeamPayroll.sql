CREATE TABLE player 
(
 id INTEGER PRIMARY KEY AUTOINCREMENT, 
 name TEXT, 
 age INTEGER, 
 salary REAL
);

CREATE TABLE supporter 
( 
 id INTEGER PRIMARY KEY AUTOINCREMENT, 
 name TEXT, 
 registrationID  TEXT, 
 overdue INTEGER
);

CREATE TABLE team 
( 
 id INTEGER PRIMARY KEY AUTOINCREMENT, 
 name TEXT 
);

CREATE TABLE team_player
(
 id_team INTEGER REFERENCES team ( id ),
 id_player INTEGER REFERENCES player ( id )
);

CREATE TABLE team_supporter
(
 id_team INTEGER REFERENCES team ( id ),
 id_player INTEGER REFERENCES player ( id )
);
