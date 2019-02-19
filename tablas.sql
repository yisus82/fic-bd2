CREATE TABLE Jug(
  cd_jug INT CONSTRAINT KeyJug PRIMARY KEY,
  nombre CHAR(30),
  altura INT,
  peso INT,
  fecha_nac DATE,
  nacionalidad CHAR(3),
  anhos_experiencia INT,
  ind_tipo INT,
  puesto_draft INT,
  univers CHAR(30),
  equipo_actual CHAR(20),
  CONSTRAINT TipJug CHECK (ind_tipo IN (0,1,2,3))
);

CREATE TABLE Pab(
  cd_pab INT CONSTRAINT KeyPab PRIMARY KEY,
  nombre CHAR(30),
  ciudad CHAR(20),
  capac INT,
  anho_inaug INT
);

CREATE TABLE Confer(
  nombre CHAR(5) CONSTRAINT KeyConfer PRIMARY KEY,
  campeon CHAR(20),
  CONSTRAINT TipoConfer CHECK (nombre IN ('Este','Oeste')) 
);

CREATE TABLE Divis(
  nombre CHAR(12) CONSTRAINT KeyDivis PRIMARY KEY,
  conferencia CHAR(5),
  campeon CHAR(20),
  CONSTRAINT ForDivis FOREIGN KEY (conferencia) REFERENCES Confer(nombre)
	ON DELETE SET NULL,
  CONSTRAINT TipDiv CHECK (nombre IN ('Pacifico','Central','Medio-Oeste','Atlantico'))   
);

CREATE TABLE Franq(
  cd_franq INT CONSTRAINT KeyFranq PRIMARY KEY,
  nombre CHAR(30),
  ciudad CHAR(20),
  cd_pab INT,
  nom_div CHAR(12),
  CONSTRAINT ForFranq1 FOREIGN KEY (cd_pab) REFERENCES Pab(cd_pab)
	ON DELETE SET NULL,
  CONSTRAINT ForFranq2 FOREIGN KEY (nom_div) REFERENCES Divis(nombre)
	ON DELETE SET NULL
);

CREATE TABLE Pres(
  cd_pres INT CONSTRAINT KeyPres PRIMARY KEY,
  nombre CHAR(30),
  franquicia INT,
  tvi DATE NOT NULL,
  tvf DATE,
  CONSTRAINT ForPres FOREIGN KEY (franquicia) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL,
  CONSTRAINT FechasPres CHECK (tvi<tvf)
);

CREATE TABLE HistJug(
  cd_jug INT,
  num_ver INT,
  dorsal INT,
  posicion CHAR(2),
  cd_franq INT,
  tvi DATE NOT NULL,
  tvf DATE,
  CONSTRAINT KeyHist PRIMARY KEY (cd_jug,num_ver),
  CONSTRAINT ForHist1 FOREIGN KEY (cd_jug) REFERENCES Jug(cd_jug)
	ON DELETE SET NULL,
  CONSTRAINT ForHist2 FOREIGN KEY (cd_franq) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL,
  CONSTRAINT TipPos CHECK (posicion IN ('A','AP','B','E','P')),
  CONSTRAINT FechasHistJug CHECK (tvi<tvf)
);

CREATE TABLE Contr_TV(
  cd_contr INT,
  cd_franq INT,
  durac INT,
  cantidad REAL,
  tipo CHAR(15),
  cadena CHAR(20),
  CONSTRAINT KeyContr PRIMARY KEY (cd_contr),
  CONSTRAINT ForContr FOREIGN KEY (cd_franq) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL
);

CREATE TABLE Sponsor(
  cd_sponsor INT CONSTRAINT KeySponsor PRIMARY KEY,
  nombre CHAR(20),
  tipo CHAR(10)
);

CREATE TABLE Patroc(
  cd_franq INT,
  cd_sponsor INT,
  cantidad REAL,
  durac INT,
  CONSTRAINT KeyPatroc PRIMARY KEY (cd_franq,cd_sponsor),
  CONSTRAINT ForPatroc1 FOREIGN KEY (cd_franq) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL,
  CONSTRAINT ForPatroc2 FOREIGN KEY (cd_sponsor) REFERENCES Sponsor(cd_sponsor)
	ON DELETE SET NULL
);

CREATE TABLE Entren(
  cd_entren INT CONSTRAINT KeyEntren PRIMARY KEY,
  nombre CHAR(30),
  anhos_en_liga INT
);

CREATE TABLE Entrena(
  cd_franq INT,
  cd_entren INT,
  tvi DATE NOT NULL,
  tvf DATE,
  CONSTRAINT KeyEntrena PRIMARY KEY (cd_franq,cd_entren),
  CONSTRAINT ForEntrena1 FOREIGN KEY (cd_franq) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL,
  CONSTRAINT ForEntrena2 FOREIGN KEY (cd_entren) REFERENCES Entren(cd_entren)
	ON DELETE SET NULL,
  CONSTRAINT FechasEntrena CHECK (tvi<tvf)
);

CREATE TABLE Cheer(
  cd_cheer INT CONSTRAINT KeyCheer PRIMARY KEY,
  cd_franq INT,
  nombre CHAR(30),
  fecha_nac DATE,
  lugar_resid CHAR(20),
  CONSTRAINT ForCheer FOREIGN KEY (cd_franq) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL
);

CREATE TABLE Merchan(
  cd_prod INT CONSTRAINT KeyMerchan PRIMARY KEY,
  nombre CHAR(20),
  ind_tipo INT,
  talla CHAR(4),
  color CHAR(10),
  marca CHAR(15),
  CONSTRAINT TipoMerchan CHECK (talla IN ('S','M','L','XL','XXL','XXXL'))
);

CREATE TABLE Vende(
  cd_franq INT,
  cd_prod INT,
  precio REAL,
  CONSTRAINT KeyVende PRIMARY KEY (cd_franq,cd_prod),
  CONSTRAINT ForVende1 FOREIGN KEY (cd_franq) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL,
  CONSTRAINT ForVende2 FOREIGN KEY (cd_prod) REFERENCES Merchan(cd_prod)
	ON DELETE SET NULL
);

CREATE TABLE Elimin(
  ronda CHAR(12),
  conferencia CHAR(5),
  CONSTRAINT KeyElimin PRIMARY KEY (ronda,conferencia),
  CONSTRAINT TipoConf CHECK (conferencia IN('Este','Oeste','Final')),
  CONSTRAINT TipoRonda CHECK (ronda IN ('Cuartos','Semifinales','Final','Finals'))
);

CREATE TABLE Partido(
  cd_partido INT CONSTRAINT KeyPartido PRIMARY KEY,
  fecha DATE,
  local INT,
  visitante INT,
  ptos_local INT,
  ptos_visitante INT,
  televisado CHAR(2),
  duracion INT,
  rebotes_l INT,
  rebotes_v INT,
  asist_l INT,
  asist_v INT,
  tapones_l INT,
  tapones_v INT,
  robos_l INT,
  robos_v INT,
  CONSTRAINT ForPartido1 FOREIGN KEY (local) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL,
  CONSTRAINT ForPartido2 FOREIGN KEY (visitante) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL,
  CONSTRAINT TVPart CHECK (televisado IN ('Si','No'))
);

CREATE TABLE Playoff(
  cd_partido INT CONSTRAINT KeyPlayoff PRIMARY KEY,
  fecha DATE,
  local INT,
  visitante INT,
  ptos_local INT,
  ptos_visitante INT,
  televisado CHAR(2),
  duracion INT,
  rebotes_l INT,
  rebotes_v INT,
  asist_l INT,
  asist_v INT,
  tapones_l INT,
  tapones_v INT,
  robos_l INT,
  robos_v INT,
  ronda CHAR(12),
  conferencia CHAR(5),
  CONSTRAINT ForPlayoff1 FOREIGN KEY (local) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL,
  CONSTRAINT ForPlayoff2 FOREIGN KEY (visitante) REFERENCES Franq(cd_franq)
	ON DELETE SET NULL,
  CONSTRAINT ForPlayoff3 FOREIGN KEY (ronda,conferencia) REFERENCES Elimin(ronda,conferencia)
	ON DELETE SET NULL,
  CONSTRAINT TVPlay CHECK (televisado IN ('Si','No'))
);

CREATE TABLE Coment(
  cd_coment INT CONSTRAINT KeyComent PRIMARY KEY,
  nombre CHAR(30),
  fecha_nac DATE,
  fecha_comienzo DATE
);

CREATE TABLE Evento_a_s(
  cd_evento INT CONSTRAINT KeyEvento_a_s PRIMARY KEY,
  fecha DATE,
  ciudad CHAR(20),
  ind_tipo INT,
  ganador CHAR(30),
  mvp CHAR(30),
  result_este INT,
  result_oeste INT,
  rebotes_este INT,
  rebotes_oeste INT,
  asist_este INT,
  asist_oeste INT,
  tapones_este INT,
  tapones_oeste INT,
  robos_este INT,
  robos_oeste INT,
  duracion INT,
  CONSTRAINT TipoEvento CHECK (ind_tipo IN (0,1,2,3,4))
);

CREATE TABLE Comenta(
  cd_partido INT,
  cd_coment INT,
  audiencia INT,
  CONSTRAINT KeyComenta PRIMARY KEY (cd_partido,cd_coment),
  CONSTRAINT ForComenta1 FOREIGN KEY (cd_partido) REFERENCES Partido(cd_partido)
	ON DELETE SET NULL,
  CONSTRAINT ForComenta2 FOREIGN KEY (cd_coment) REFERENCES Coment(cd_coment)
	ON DELETE SET NULL
);

CREATE TABLE Comenta2(
  cd_evento INT,
  cd_coment INT,
  audiencia INT,
  CONSTRAINT KeyComenta2 PRIMARY KEY (cd_evento,cd_coment),
  CONSTRAINT ForComenta21 FOREIGN KEY (cd_evento) REFERENCES Evento_a_s(cd_evento)
	ON DELETE SET NULL,
  CONSTRAINT ForComenta22 FOREIGN KEY (cd_coment) REFERENCES Coment(cd_coment)
	ON DELETE SET NULL
);

CREATE TABLE Comenta3(
  cd_partido INT,
  cd_coment INT,
  audiencia INT,
  CONSTRAINT KeyComenta3 PRIMARY KEY (cd_partido,cd_coment),
  CONSTRAINT ForComenta31 FOREIGN KEY (cd_partido) REFERENCES Playoff(cd_partido)
	ON DELETE SET NULL,
  CONSTRAINT ForComenta32 FOREIGN KEY (cd_coment) REFERENCES Coment(cd_coment)
	ON DELETE SET NULL
);

CREATE TABLE Arbitro(
  cd_arbitro INT CONSTRAINT KeyArbitro PRIMARY KEY,
  nombre CHAR(30),
  fecha_nac DATE,
  fecha_comienzo DATE
);

CREATE TABLE Arbitra(
  cd_arbitro INT,
  cd_partido INT,
  CONSTRAINT KeyArbitra PRIMARY KEY (cd_arbitro,cd_partido),
  CONSTRAINT ForArbitra1 FOREIGN KEY (cd_arbitro) REFERENCES Arbitro(cd_arbitro)
	ON DELETE SET NULL,
  CONSTRAINT ForArbitra2 FOREIGN KEY (cd_partido) REFERENCES Partido(cd_partido)
	ON DELETE SET NULL
);

CREATE TABLE Arbitra2(
  cd_arbitro INT,
  cd_evento INT,
  CONSTRAINT KeyArbitra2 PRIMARY KEY (cd_arbitro,cd_evento),
  CONSTRAINT ForArbitra21 FOREIGN KEY (cd_arbitro) REFERENCES Arbitro(cd_arbitro)
	ON DELETE SET NULL,
  CONSTRAINT ForArbitra22 FOREIGN KEY (cd_evento) REFERENCES Evento_a_s(cd_evento)
	ON DELETE SET NULL
);

CREATE TABLE Arbitra3(
  cd_arbitro INT,
  cd_partido INT,
  CONSTRAINT KeyArbitra3 PRIMARY KEY (cd_arbitro,cd_partido),
  CONSTRAINT ForArbitra31 FOREIGN KEY (cd_arbitro) REFERENCES Arbitro(cd_arbitro)
	ON DELETE SET NULL,
  CONSTRAINT ForArbitra32 FOREIGN KEY (cd_partido) REFERENCES Playoff(cd_partido)
	ON DELETE SET NULL
);

CREATE TABLE Juega(
  cd_partido INT,
  cd_jug INT,
  num_ver INT,
  puntos INT,
  rebotes INT,
  asist INT,
  tapones INT,
  robos INT,
  minutos INT,
  t1_i INT,
  t1_c INT,
  t2_i INT,
  t2_c INT,
  t3_i INT,
  t3_c INT,
  CONSTRAINT KeyJuega PRIMARY KEY (cd_partido,cd_jug,num_ver),
  CONSTRAINT ForJuega1 FOREIGN KEY (cd_partido) REFERENCES Partido(cd_partido)
	ON DELETE SET NULL,
  CONSTRAINT ForJuega2 FOREIGN KEY (cd_jug,num_ver) REFERENCES HistJug(cd_jug,num_ver)
	ON DELETE SET NULL
);

CREATE TABLE Juega2(
  cd_partido INT,
  cd_jug INT,
  num_ver INT,
  puntos INT,
  rebotes INT,
  asist INT,
  tapones INT,
  robos INT,
  minutos INT,
  t1_i INT,
  t1_c INT,
  t2_i INT,
  t2_c INT,
  t3_i INT,
  t3_c INT,
  CONSTRAINT KeyJuega2 PRIMARY KEY (cd_partido,cd_jug,num_ver),
  CONSTRAINT ForJuega21 FOREIGN KEY (cd_partido) REFERENCES Playoff(cd_partido)
	ON DELETE SET NULL,
  CONSTRAINT ForJuega22 FOREIGN KEY (cd_jug,num_ver) REFERENCES HistJug(cd_jug,num_ver)
	ON DELETE SET NULL
);

CREATE TABLE Participa(
  cd_jug INT,
  cd_evento INT,
  tipo INT,
  puntos INT,
  rebotes INT,
  asist INT,
  tapones INT,
  robos INT,
  minutos INT,
  t1_i INT,
  t1_c INT,
  t2_i INT,
  t2_c INT,
  t3_i INT,
  t3_c INT,
  puntuacion1 INT,
  puntuacion2 INT,
  CONSTRAINT KeyParticipa PRIMARY KEY (cd_jug,cd_evento),
  CONSTRAINT TipoEventVet CHECK (tipo IN (1,2,3,4)),
  CONSTRAINT ForParticipa1 FOREIGN KEY (cd_jug) REFERENCES Jug(cd_jug)
	ON DELETE SET NULL,
  CONSTRAINT ForParticipa2 FOREIGN KEY (cd_evento) REFERENCES Evento_a_s(cd_evento)
	ON DELETE SET NULL
);

CREATE TABLE Participa2(
  cd_jug INT,
  cd_evento INT,
  tipo INT,
  puntos INT,
  rebotes INT,
  asist INT,
  tapones INT,
  robos INT,
  minutos INT,
  t1_i INT,
  t1_c INT,
  t2_i INT,
  t2_c INT,
  t3_i INT,
  t3_c INT,
  puntuacion1 INT,
  puntuacion2 INT,
  CONSTRAINT KeyParticipa2 PRIMARY KEY (cd_jug,cd_evento),
  CONSTRAINT TipoEventoLib CHECK (tipo IN (1,2,3,4)),
  CONSTRAINT ForParticipa21 FOREIGN KEY (cd_jug) REFERENCES Jug(cd_jug)
	ON DELETE SET NULL,
  CONSTRAINT ForParticipa22 FOREIGN KEY (cd_evento) REFERENCES Evento_a_s(cd_evento)
	ON DELETE SET NULL
);

CREATE TABLE Participa3(
  cd_jug INT,
  cd_evento INT,
  tipo INT,
  puntos INT,
  rebotes INT,
  asist INT,
  tapones INT,
  robos INT,
  minutos INT,
  t1_i INT,
  t1_c INT,
  t2_i INT,
  t2_c INT,
  t3_i INT,
  t3_c INT,
  puntuacion1 INT,
  puntuacion2 INT,
  CONSTRAINT KeyParticipa3 PRIMARY KEY (cd_jug,cd_evento),
  CONSTRAINT TipoEventoRook CHECK (tipo IN (0,1,2,3,4)),
  CONSTRAINT ForParticipa31 FOREIGN KEY (cd_jug) REFERENCES Jug(cd_jug)
	ON DELETE SET NULL,
  CONSTRAINT ForParticipa32 FOREIGN KEY (cd_evento) REFERENCES Evento_a_s(cd_evento)
	ON DELETE SET NULL
);

select table_name from user_tables;
