///
///PONG
///José Enrique Maese Álvarez
///IES Vicente Aleixandre 2ºBachillerato
///

Bloque[] miBloque = new Bloque[5];

//Introducimos variables de la bola
float bolaPosX=0;
float bolaPosY=0;
float bolaVX=4;   //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
float bolaVY=-4;  
float bolaVXmax=4;   //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
float bolaVYmin=-4;
float bolaVYmax=-4;
float bolaR=15;
float difPos;

//Introducimos variables de la pala
float palaposX=0;
float palaposY=0;
float palalong=0;

//Introducimos variables generales
int vidas = 3;
int pantalla=0;
int puntos=0;
int c;

void setup() {

  //Limpiamos la pantalla
  size(650, 650);
  background(255);

  //Bloques
  for (int i=0; i< 5; i++) {
    miBloque[i]= new Bloque((width/miBloque.length*i)+width/14, 3*height/7);
  }

  //Iniciamos variales de la bola
  bolaPosX= width/2;
  bolaPosY= height/2;
  //bolaVXmax=4; 
  //bolaVYmin=-4;
  //bolaVYmax=-4;

  //Iniciamos variables de la pala
  palalong=width/7;
  palaposX=width/2;
  palaposY=height-height/10;

  //Iniciamos variables generales
  pantalla=0;
  vidas=3;
  bolaVYmax=sqrt(sq(bolaVYmax)+sq(bolaVYmin));
  c=color(255);
}



void draw() {
  switch (pantalla) {
  case 0:
    Inicio();  //Aparece la pantalla de inicio
    break;
  case 1:
    Juego();  //Comienza el juego
    break;
  case 2:
    Final();  //Fin del juego: has perdido
    break;
  case 3:
    Ganar();  //Fin del juego: has ganado
    break;
  }
}

//INICIAMOS VARIABLES
void inicioVariables() {
  bolaPosX= width/2;
  bolaPosY= height/2;
  palalong=width/7;
  palaposX=width/2;
  palaposY=height-height/10;
  bolaVX=4;   //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
  bolaVY=-4;
  bolaVXmax=4;   //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
  bolaVYmin=-4;
  bolaVYmax=sqrt(sq(bolaVXmax)+sq(bolaVYmin));
  c=color(255);
}



//PANTALLA DE INICIO

void Inicio() {      
  background(0);      //Limpiamos la pantalla
  fill(0);
  stroke(255);      //Definimos las líneas y colores del botón 
  strokeWeight(10);
  rectMode(CENTER);  
  rect(width/2, height/2, width, height/4);  //Definimos el botón para comenzar la partida
  textSize(25);      //Definimos el texto
  textAlign(CENTER);
  fill(255);
  text("COMENZAR", width/2, height/2+25/2);
  mouseClicked();
}


//PANTALLA DE JUEGO: 1

void Juego() {
  background(255);
  textSize(20);      //Definimos el texto
  fill(0);
  textAlign(RIGHT);
  text(vidas + " VIDAS", width-width/20, height/20);
  textAlign(LEFT);
  text("PUNTOS: " + puntos, width/20, height/20);
  //fill(255);
  //stroke(bolaposX*255/width);      //Definimos las líneas y colores del botón
  //strokeWeight(height/20);
  //rect(width/2, height/2, width, height);
  difPos=bolaPosX-mouseX;
  dibujarPala();
  dibujarBola();
  iniciarBloques();
  moverPala();
  moverBola();
  aumentoVelocidad();
  reboteBola();
  terminarPartida();
}


//PANTALLA FINAL

void Final() {
  background(0);    //Limpiamos la pantalla
  fill(0);
  stroke(255);      //Definimos las líneas y colores del botón
  strokeWeight(5);
  rectMode(CENTER);
  rect(width/3, height/2, width/3, width/5);  //Definimos el botón para finalizar la partida
  rect(2*width/3, height/2, width/3, width/5);  //Definimos el botón para repetir la partida
  textSize(25);      //Definimos el texto
  textAlign(CENTER);
  fill(255);
  text("FIN", width/3, height/2+25/2);
  text("REPETIR", 2*width/3, height/2+25/2);
  text("HAS PERDIDO", width/2, height/2-height/3);
  mouseClicked();
}   

//PANTALLA HAS GANADO

void Ganar() {
  background(255);    //Limpiamos la pantalla
  fill(255);
  stroke(0);      //Definimos las líneas y colores del botón
  strokeWeight(5);
  rectMode(CENTER);
  rect(width/3, height/2, width/3, width/5);  //Definimos el botón para finalizar la partida
  rect(2*width/3, height/2, width/3, width/5);  //Definimos el botón para repetir la partida
  textSize(25);      //Definimos el texto
  textAlign(CENTER);
  fill(0);
  text("FIN", width/3, height/2+25/2);
  text("REPETIR", 2*width/3, height/2+25/2);
  fill(mouseX, mouseY, mouseX+mouseY);
  text("HAS GANADO", width/2, height/2-height/3);
  mouseClicked();
}

//CAMBIO DE PANTALLA
void mouseClicked () {   //Definimos la acción al pasar el mouse por los botones
  if (mouseY < (height/2+height/8) && mouseY > (height/2-height/8) && pantalla == 0 && mouseButton==LEFT) {   //En el menú pasamos por el botón para iniciar el juego
    pantalla=1;
  }
  if (mouseY < (height/2 + width/10) && mouseY > (height/2 - width/10) && mouseX < (width/3 + width/6) && mouseX > (width/3 - width/6) && pantalla == 2 && mouseButton==LEFT) {    //Al perder todas las vidas pasamos por el botón para finalizar el juego
    exit();
  }
  if (mouseY < (height/2 + width/10) && mouseY > (height/2 - width/10) && mouseX < (2*width/3 + width/6) && mouseX > (2*width/3 - width/6) && pantalla == 2 && mouseButton==LEFT) {    //Al perder todas las vidas pasamos por el botón para finalizar el juego
    vidas=3;
    puntos=0;
    pantalla=1;
  }
  if (mouseY < (height/2 + width/10) && mouseY > (height/2 - width/10) && mouseX < (width/3 + width/6) && mouseX > (width/3 - width/6) && pantalla == 3 && mouseButton==LEFT) {    //Al perder todas las vidas pasamos por el botón para finalizar el juego
    exit();
  }
  if (mouseY < (height/2 + width/10) && mouseY > (height/2 - width/10) && mouseX < (2*width/3 + width/6) && mouseX > (2*width/3 - width/6) && pantalla == 3 && mouseButton==LEFT) {    //Al perder todas las vidas pasamos por el botón para finalizar el juego
    vidas=3;
    puntos=0;
    pantalla=1;
    inicioVariables();
  }
}


//BLOQUES

void iniciarBloques() {
  for (int i=0; i< 5; i++) {
    miBloque[i].display();
    miBloque[i].reboteBloque();
  }
}

class Bloque {
  // DATOS 
  float bloquePosX;  // posicion x del bloque
  float bloquePosY;  // posicion y del bloque
  float anchoBloque; // ancho del bloque
  float altoBloque; // alto del bloque
  float r;
  float g;
  float b;

  // CONSTRUCTOR
  Bloque(float xPosTemp, float yPosTemp) {
    bloquePosX=xPosTemp;
    bloquePosY=yPosTemp;
    anchoBloque=45;
    altoBloque=30;
    r=random(0, 255);
    g=random(0, 255);
    b=random(0, 255);
  }
  // FUNCIONES
  // dibuja de los bloques
  void display() {

    fill(r-50, g-50, b-50);
    stroke(r, g, b);
    strokeWeight(2);
    rectMode(CENTER);
    rect(bloquePosX, bloquePosY, anchoBloque, altoBloque);
  }
  
  void reboteBloque(){
      if (bolaPosX+bolaR >= bloquePosX-anchoBloque/2 && bolaPosY <= bloquePosY+altoBloque/2 && bolaPosY >= bloquePosY-altoBloque/2){      //REBOTE CON LADO IZQUIERDO
      bolaVX=bolaVX*-1;
      }
       if (bolaPosX-bolaR <= bloquePosX+anchoBloque/2 && bolaPosY <= bloquePosY+altoBloque/2 && bolaPosY >= bloquePosY-altoBloque/2){      //REBOTE CON LADO DERECHO
      bolaVX=bolaVX*-1;
      }
      if (bolaPosY-bolaR <= bloquePosY+altoBloque/2 && bolaPosX >= bloquePosX-anchoBloque/2 && bolaPosX <= bloquePosX+anchoBloque/2){      //REBOTE CON LADO INFERIOR
      bolaVY=bolaVY*-1;
      }
      if (bolaPosY+bolaR >= bloquePosY-altoBloque/2 && bolaPosX >= bloquePosX-anchoBloque/2 && bolaPosX <= bloquePosX+anchoBloque/2){      //REBOTE CON LADO SUPERIOR
      bolaVY=bolaVY*-1;
      }
    }
}


//PERDER/GANAR PARTIDA

void terminarPartida() {
  if (bolaPosY>=height-height/15) {  
    vidas=vidas-1;
    inicioVariables();
  }
  if (vidas==0) pantalla=2;
  if (puntos==100) pantalla=3;
}


//DIBUJAR BOLA

void dibujarBola() {
  stroke(0);
  strokeWeight(1);
  fill(palaposX*255/width);
  ellipse(bolaPosX, bolaPosY, bolaR, bolaR);
}


//DIBUJAR PALA

void dibujarPala() {
  stroke(0);
  strokeWeight(1);
  fill(bolaPosX*255/width);
  rect(mouseX, palaposY, palalong, height/80);
}


//MOVER PALA

void moverPala() {
  rectMode(CENTER);
  palaposX=mouseX;
}


//MOVER BOLA

void moverBola() {

  //Direccion en X
  bolaPosX=bolaPosX+bolaVX;
  if (bolaPosX>=width-bolaR) {
    bolaVX=bolaVX*-1;
  } else if (bolaPosX<=bolaR) {
    bolaVX = bolaVX*-1;
  }

  //Direccion en Y
  bolaPosY=bolaPosY+bolaVY;
  if (bolaPosY<=bolaR) {
    bolaVY=bolaVY*-1;
  } else if (bolaPosY>=height-bolaR) {
    bolaVY=bolaVY*-1;
  }
}


//REBOTE DE LA BOLA

void reboteBola() {
  if ( difPos<=palalong/2+bolaR && difPos>=-(palalong/2+bolaR) && bolaPosY>=height*9/10-bolaR) { 

    bolaVYmax=sqrt(sq(bolaVXmax)+sq(bolaVYmin));

    bolaVX= difPos*bolaVXmax/(palalong/2+bolaR);
    if (difPos <0) {
      bolaVY= -(-difPos*(bolaVYmin-bolaVYmax)/(palalong/2+bolaR)+bolaVYmax);
    } else {
      bolaVY= -(difPos*(bolaVYmin-bolaVYmax)/(palalong/2+bolaR)+bolaVYmax);
    }
  }
}


//AUMENTO VELOCIDAD DE LA BOLA

void aumentoVelocidad() {
  if ((bolaPosY+bolaR>=palaposY) && (palaposX-palalong/2<bolaPosX) && (palaposX+palalong/2>bolaPosX) && (bolaVY<14)) {    //Aumentamos la velocidad cada vez que la bola rebote en la pala
    bolaVX=bolaVX+1; 
    bolaVY=bolaVY-1;  
    bolaVXmax=bolaVXmax+1;
    bolaVYmin=bolaVYmin-1;
    bolaVYmax=bolaVYmax-1;
    puntos=puntos+1;
  }
}
