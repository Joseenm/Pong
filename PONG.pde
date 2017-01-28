/*
 PONG
 José Enrique Maese Álvarez
 IES Vicente Aleixandre 2ºBachillerato
 
 CONTROLES
 Mover pala: puntero del ratón
 Eliminar todos los bloques para ganar
 */

//Introducimos variables de la bola
float bolaposX=0;  //Posición inicial de la bola
float bolaposY=0;
float bolaVX=random(3, 4); //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
float bolaVY=random(-3, -4);
float bolaR=15;  //Radio de la bola

//Introducimos variables de la pala (posción y longitud iniciales)
float palaposX=0;  
float palaposY=0;
float palalong=0;

//Introducimos variables generales
int vidas = 3;
int pantalla=0;
int puntos=0;
int c;

//Variables de los bloques
int numBloques=7;
Bloque[] miBloque1 = new Bloque[numBloques];
Bloque[] miBloque2 = new Bloque[numBloques];
Bloque[] miBloque3 = new Bloque[numBloques];


void setup() {

  //Limpiamos la pantalla
  size(650, 650);
  background(255);

  //Iniciamos variales de la bola
  bolaposX= width/2;
  bolaposY= height/2;

  //Iniciamos variables de la pala
  palalong=width/7;
  palaposX=width/2;
  palaposY=height-height/10;

  //Iniciamos variables generales
  pantalla=0;
  vidas=3;
  c=color(255);
  crearBloque();
}


void draw() {
  switch (pantalla) {
  case 0:
    Inicio(); //Aparece la pantalla de inicio
    break;
  case 1:
    Juego(); //Comienza el juego
    break;
  case 2:
    Final(); //Fin del juego: has perdido
    break;
  case 3:
    Ganar(); //Fin del juego: has ganado
    break;
  }
}


//INICIAMOS VARIABLES
void inicioVariables() {
  //Bola
  bolaposX= width/2;
  bolaposY= height/2;
  bolaVX=random(3, 4); 
  bolaVY=random(-3, -4);

  //Pala
  palalong=width/7;
  palaposX=width/2;
  palaposY=height-height/10;

  //Otras
  c=color(255);
}


//PANTALLA DE INICIO
void Inicio() {

  //Limpiamos la pantalla
  background(mouseX*255/width);  

  //Definimos el botón para comenzar la partida (líneas, colores, etc.)
  fill(mouseX*255/width);
  stroke(mouseX-mouseY/3, mouseY, 0); 
  strokeWeight(10);
  rectMode(CENTER);
  rect(width/2, height/2, width/2, height/4);

  //Definimos el texto
  textSize(35);    
  textAlign(CENTER);
  fill(mouseX-mouseY/3, 0, mouseY);
  text("PONG", width/2, height/4);
  
  textSize(25);    
  textAlign(CENTER);
  fill(mouseX-mouseY/3, mouseY, 0);
  text("COMENZAR", width/2, height/2+25/2);
  textSize(17);
  textAlign(LEFT);
  fill(255);
  text("José Enrique Maese Álvarez", width/10, height-height/20);
  mouseClicked();
}


//PANTALLA DE JUEGO: 1
void Juego() {
  //Limpiamos la pantalla
  background(255);

  //Definimos el texto de los puntos y las vidas
  textSize(20); 
  fill(0);
  textAlign(RIGHT);
  text(vidas + " VIDAS", width-width/20, height/20);
  textAlign(LEFT);
  text("PUNTOS: " + puntos, width/20, height/20);

  //Dibujamos los elementos
  dibujarPala();
  dibujarBola();
  dibujarBloque();

  //Definimos el movimiento de los elementos
  moverPala();
  moverBola();
  aumentoVelocidad();

  //Fin de la partida
  terminarPartida();
}


//PANTALLA HAS PERDIDO
void Final() {

  //Limpiamos la pantalla
  background(50); 

  //Definimos los botones (líneas, colores, posición, etc.)
  fill(0);
  stroke(255); 
  strokeWeight(5);
  rectMode(CENTER);
  rect(width/3, height/2, width/3, width/5); //Botón para finalizar la partida
  rect(2*width/3, height/2, width/3, width/5); //Botón para repetir la partida

  //Definimos el texto (posición, tamaño, etc.)
  textSize(25); 
  textAlign(CENTER);
  fill(255);
  text("FIN", width/3, height/2+25/2);
  text("REPETIR", 2*width/3, height/2+25/2);
  text("HAS PERDIDO", width/2, height/2-height/3);
  mouseClicked();
}


//PANTALLA HAS GANADO
void Ganar() {

  //Limpiamos la pantalla
  background(200); 

  //Definimos los botones (líneas, colores, posición, etc.)
  fill(255);
  stroke(0); 
  strokeWeight(5);
  rectMode(CENTER);
  rect(width/3, height/2, width/3, width/5); //Definimos el botón para finalizar la partida
  rect(2*width/3, height/2, width/3, width/5); //Definimos el botón para repetir la partida

  //Definimos el texto (posición, tamaño, etc.)
  textSize(25); 
  textAlign(CENTER);
  fill(0);
  fill(mouseX-mouseY/3, mouseY, 0);
  text("FIN", width/3, height/2+25/2);
  text("REPETIR", 2*width/3, height/2+25/2);
  text("HAS GANADO", width/2, height/2-height/3);
  mouseClicked();
}


//CAMBIO DE PANTALLA
void mouseClicked () { //Al presionar el ratón estando el puntero encima de un botón este se activa
  if (mouseY < (height/2+height/8) && mouseY > (height/2-height/8) && pantalla == 0 && mouseButton==LEFT) { //En el menú pasamos por el botón para iniciar el juego
    pantalla=1;
  }
  if (mouseY < (height/2 + width/10) && mouseY > (height/2 - width/10) && mouseX < (width/3 + width/6) && mouseX > (width/3 - width/6) && pantalla == 2 && mouseButton==LEFT) { 
    exit();
  }
  if (mouseY < (height/2 + width/10) && mouseY > (height/2 - width/10) && mouseX < (2*width/3 + width/6) && mouseX > (2*width/3 - width/6) && pantalla == 2 && mouseButton==LEFT) { 
    vidas=3;
    puntos=0;
    pantalla=1;
    crearBloque();
  }
  if (mouseY < (height/2 + width/10) && mouseY > (height/2 - width/10) && mouseX < (width/3 + width/6) && mouseX > (width/3 - width/6) && pantalla == 3 && mouseButton==LEFT) { 
    exit();
  }
  if (mouseY < (height/2 + width/10) && mouseY > (height/2 - width/10) && mouseX < (2*width/3 + width/6) && mouseX > (2*width/3 - width/6) && pantalla == 3 && mouseButton==LEFT) { 
    vidas=3;
    puntos=0;
    pantalla=1;
    inicioVariables();
    crearBloque();
  }
}


//BLOQUES
class Bloque {

  //Variables de los bloques
  int x, y, z, anchoBloque, altoBloque;
  float r;
  float g;
  float b;
  Bloque (int xPosBloque, int yPosBloque, int estadoBloque) { //constructor
    x=xPosBloque;
    y=yPosBloque;
    z=estadoBloque;
    anchoBloque=35;
    altoBloque=20;
  }

  //DIBUJAR LOS BLOQUES
  void dibujar() {
    if (z==1) {
      fill(#0C05FA-150);
      stroke(#0C05FA-50);
      strokeWeight(2);
      rectMode(CENTER);
      rect(x, y, anchoBloque, altoBloque);
    }
  }

  //ELIMINAR BLOQUES
  void desaparecer() {
    if (bolaposX > x-anchoBloque/2-bolaR && bolaposX < x+anchoBloque/2+bolaR && bolaposY > y-altoBloque/2-bolaR && bolaposY < y +altoBloque/2+bolaR && z==1) {
      z=0;
      bolaVY= bolaVY*(-1);
      puntos++;
    }
  }
}


//POSICIÓN DE LOS BLOQUES EN FILAS Y COLUMNAS
void crearBloque() {
  for (int i=0; i< miBloque1.length; i++) {
    miBloque1[i]= new Bloque(i*width/numBloques+width/(2*numBloques), height/7, 1);
  }
  for (int h=0; h< miBloque2.length; h++) {
    miBloque2[h]= new Bloque(h*width/numBloques+width/(2*numBloques), 2*height/7, 1);
  }
  for (int m=miBloque3.length/8; m< miBloque3.length; m++) {
    miBloque3[m]= new Bloque(m*width/numBloques+width/(2*numBloques), 3*height/7, 1);
  }
}


//DIBUJAR BLOQUES
void dibujarBloque() {
  for (int i=0; i< miBloque1.length; i ++) {
    miBloque1[i].dibujar();
    miBloque1[i].desaparecer();
  }
  for (int h=0; h< miBloque2.length; h ++) {
    miBloque2[h].dibujar();
    miBloque2[h].desaparecer();
  }
  for (int m=0; m< miBloque2.length; m ++) {
    miBloque3[m].dibujar();
    miBloque3[m].desaparecer();
  }
}


//PERDER/GANAR PARTIDA
void terminarPartida() {
  if (bolaposY>=height-height/15) {
    vidas=vidas-1;
    inicioVariables();
  }
  if (vidas==0)  pantalla=2;
  if (puntos==21) pantalla=3;
}


//DIBUJAR BOLA
void dibujarBola() {
  stroke(0);
  strokeWeight(1);
  fill(palaposX*255/width);
  ellipse(bolaposX, bolaposY, bolaR, bolaR);
}


//DIBUJAR PALA
void dibujarPala() {
  stroke(0);
  strokeWeight(1);
  fill(bolaposX*255/width);
  rect(mouseX, palaposY, palalong, height/80);
}


//MOVER PALA
void moverPala() {
  rectMode(CENTER);
  palaposX=mouseX;
}


//MOVER BOLA (Y REBOTE
void moverBola() {

  //Direccion en X
  bolaposX=bolaposX+bolaVX;
  if (bolaposX>=width-bolaR) {
    bolaVX=bolaVX*-1;
  } else if (bolaposX<=bolaR) {
    bolaVX = bolaVX*-1;
  }

  //Direccion en Y
  bolaposY=bolaposY+bolaVY;
  if (bolaposY<=bolaR) {
    bolaVY=bolaVY*-1;
  } else if (bolaposY>=height-bolaR) {
    bolaVY=bolaVY*-1;
  }
  
  //Rebote con la pala 
  if ((bolaposY+bolaR>=palaposY) && (palaposX-palalong/2<bolaposX) && (palaposX+palalong/2>bolaposX)) {
    bolaVY=bolaVY*-1;
  }
}



//AUMENTO VELOCIDAD DE LA BOLA
void aumentoVelocidad() {
  
  //Aumentamos la velocidad cada vez que la bola rebote en la pala
  if ((bolaposY+bolaR>=palaposY) && (palaposX-palalong/2<bolaposX) && (palaposX+palalong/2>bolaposX) && (bolaVY<10)) {
    bolaVX=bolaVX+1;
    bolaVY=bolaVY-1;
  }
}
