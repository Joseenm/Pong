///
///PONG
///José Enrique Maese Álvarez
///IES Vicente Aleixandre 2ºBachillerato
///

//Introducimos variables de la bola
float bolaposX=0;
float bolaposY=0;
float bolaVX=4;   //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
float bolaVY=-4;  
float bolaVXmax=7;   //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
float bolaVYmin=-7;
float bolaVYmax;
float bolaR=12;
float difPos;

//Introducimos variables de la pala
float palaposX=0;
float palaposY=0;
float palalong=0;

//Introducimos variables generales
int vidas = 3;
int pantalla=0;
int puntos=0;


void setup(){
  
//Limpiamos la pantalla
size(500,400);
background(255);

//Iniciamos variales de la bola
bolaposX= width/2;
bolaposY= height/2;
bolaVXmax=8;   //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
bolaVYmin=-4;
bolaVYmax=-8;

//Iniciamos variables de la pala
palalong=width/7;
palaposX=width/2;
palaposY=height-height/10;

//Iniciamos variables generales
pantalla=0;
vidas=3;
bolaVYmax=sqrt(sq(bolaVXmax)+sq(bolaVYmin));
}



void draw(){
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
void inicioVariables(){
  bolaposX= width/2;
  bolaposY= height/2;
  palalong=width/7;
  palaposX=width/2;
  palaposY=height-height/10;
  bolaVX=4;   //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
  bolaVY=-4;
  bolaVXmax=7;   //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
  bolaVYmin=-7;
  bolaVYmax=sqrt(sq(bolaVXmax)+sq(bolaVYmin));
}



//PANTALLA DE INICIO

void Inicio(){      
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

void Juego(){
background(255);
textSize(20);      //Definimos el texto
fill(0);
textAlign(RIGHT);
text(vidas + " VIDAS", width-width/20, height/20);
textAlign(LEFT);
text("PUNTOS: " + puntos, width/20, height/20);
difPos=bolaposX-mouseX;
dibujarPala();
dibujarBola();
moverPala();
moverBola();
aumentoVelocidad();
reboteBola();
terminarPartida();
}


//PANTALLA FINAL

void Final(){
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

void Ganar(){
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


//PERDER/GANAR PARTIDA

void terminarPartida(){
  if (bolaposY>=height-height/15){  
   vidas=vidas-1;
   inicioVariables();
  }
  if (vidas==0) pantalla=2;
  if (puntos==5) pantalla=3;
}


//DIBUJAR BOLA

void dibujarBola(){
stroke(0);
strokeWeight(1);
fill(palaposX*255/width);
ellipse(bolaposX, bolaposY, bolaR, bolaR);
}


//DIBUJAR PALA

void dibujarPala(){
stroke(0);
strokeWeight(1);
fill(bolaposX*255/width);
rect(mouseX, palaposY, palalong, 5);
}


//MOVER PALA

void moverPala(){
rectMode(CENTER);
palaposX=mouseX;
}


//MOVER BOLA

void moverBola(){
  
//Direccion en X
bolaposX=bolaposX+bolaVX;
if(bolaposX>=width-bolaR){
bolaVX=bolaVX*-1;
}
else if(bolaposX<=bolaR){
bolaVX = bolaVX*-1;
}

//Direccion en Y
bolaposY=bolaposY+bolaVY;
if(bolaposY<=bolaR){
bolaVY=bolaVY*-1;
}
else if(bolaposY>=height-bolaR){
bolaVY=bolaVY*-1;
}
}


//REBOTE DE LA BOLA

void reboteBola(){
  if ( difPos<=palalong/2+bolaR && difPos>=-(palalong/2+bolaR) && bolaposY>=height*9/10-bolaR) { 

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

void aumentoVelocidad(){
if((bolaposY+bolaR>=palaposY) && (palaposX-palalong/2<bolaposX) && (palaposX+palalong/2>bolaposX) && (bolaVY<14)){    //Aumentamos la velocidad cada vez que la bola rebote en la pala
  bolaVYmax=bolaVYmax-1;
  bolaVYmin=bolaVYmin-1;
  bolaVXmax=bolaVXmax+1;
  puntos=puntos+1;
}
}
