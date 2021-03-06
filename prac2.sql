CREATE DOMAIN D-codigo-jugador INT;
CREATE DOMAIN D-nombre-persona CHAR(30);
CREATE DOMAIN D-altura REAL;
CREATE DOMAIN D-peso INT;
CREATE DOMAIN D-fecha DATE;
CREATE DOMAIN D-anho INT;
CREATE DOMAIN D-tipo-jugador INT
      CHECK (VALUE IN (0,1,2,3));
CREATE DOMAIN D-puesto-draft INT;
CREATE DOMAIN D-universidad CHAR(20);
CREATE DOMAIN D-equipo-actual CHAR(30);
CREATE DOMAIN D-numero-version INT;
CREATE DOMAIN D-posicion CHAR(2);
      CHECK (VALUE IN ('A','AP','B','E','P'));
CREATE DOMAIN D-codigo-franquicia INT;
CREATE DOMAIN D-nombre-equipo CHAR(30);
CREATE DOMAIN D-salario REAL;
CREATE DOMAIN D-ciudad CHAR(20);
CREATE DOMAIN D-presupuesto INT;
CREATE DOMAIN D-codigo-presidente INT;
CREATE DOMAIN D-codigo-pabellon INT;
CREATE DOMAIN D-nombre-division CHAR(15)
      CHECK (VALUE IN ('PACIFICO','MEDIO-OESTE','CENTRAL','ATLANTICO'));
CREATE DOMAIN D-codigo-contrato INT;
CREATE DOMAIN D-duracion-contrato INT;
CREATE DOMAIN D-cantidad-dinero REAL;
CREATE DOMAIN D-tipo-contrato INT;
CREATE DOMAIN D-cadena CHAR(20);
CREATE DOMAIN D-codigo-sponsor INT;
CREATE DOMAIN D-nombre-empresa CHAR(20);
CREATE DOMAIN D-tipo-sponsor INT;
CREATE DOMAIN D-codigo-entrenador INT;
CREATE DOMAIN D-anhos-liga INT;
CREATE DOMAIN D-codigo-cheerleader INT;
CREATE DOMAIN D-lugar-residencia CHAR(20);
CREATE DOMAIN D-capacidad INT;
CREATE DOMAIN D-codigo-producto INT;
CREATE DOMAIN D-tipo-producto INT;
CREATE DOMAIN D-talla CHAR(4)
      CHECK (VALUE IN ('S','M','L','XL','XXL','XXXL'));   
CREATE DOMAIN D-color CHAR(10);
CREATE DOMAIN D-marca CHAR(20);
CREATE DOMAIN D-precio REAL;
CREATE DOMAIN D-nombre-conferencia CHAR(5)
      CHECK (VALUE IN ('ESTE','OESTE'));
CREATE DOMAIN D-ronda CHAR(10)
      CHECK (VALUE IN ('CUARTOS','SEMIFINALES','FINAL','FINALS'));
CREATE DOMAIN D-codigo-partido INT;
CREATE DOMAIN D-puntos INT;
CREATE DOMAIN D-televisado CHAR(2)
      CHECK (VALUE IN ('SI','NO'));
CREATE DOMAIN D-tipo-partido INT
      CHECK (VALUE IN (0,1));
CREATE DOMAIN D-duracion-partido INT;
CREATE DOMAIN D-rebotes INT;
CREATE DOMAIN D-asistencias INT;
CREATE DOMAIN D-tapones INT;
CREATE DOMAIN D-robos INT;
CREATE DOMAIN D-codigo-comentarista INT;
CREATE DOMAIN D-codigo-evento INT;
CREATE DOMAIN D-audiencia INT;
CREATE DOMAIN D-codigo-arbitro ;
CREATE DOMAIN D-minutos-jugados INT;
CREATE DOMAIN D-tiros INT;
CREATE DOMAIN D-hora TIME;
CREATE DOMAIN D-ganador CHAR(30);
CREATE DOMAIN D-tipo-evento INT
      CHECK (VALUE IN (0,1,2,3,4));
CREATE DOMAIN D-puntuacion1 INT;
CREATE DOMAIN D-puntuacion2 INT;

