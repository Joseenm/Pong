///
///PONG
///José Enrique Maese Álvarez
///IES VIcente Aleixandre 2ºBachillerato
///

//Introducimos variables de la bola
float bolaposX=0;
float bolaposY=0;
float bolaVX=random(3,5);   //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas
float bolaVY=random(-3,-5);  
float bolaR=12;

//Introducimos variables de la pala
float palaposX=0;
float palaposY=0;
float palalong=0;

//Introducimos variables generales
float vidas = 3;
int pantalla=0;


void setup(){
  
//Limpiamos la pantalla
size(600,400);
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
    Final();  //Fin del juego
    break;
  }
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
  text("COMENZAR", width/2, height/2);
  mouseClick();
    }
  
  
//PANTALLA DE JUEGO  

void Juego(){
background(255);
fill(0);
dibujarPala();
dibujarBola();
moverPala();
moverBola();
aumentoVelocidad();
reboteBola();
perderPartida();
}


//PANTALLA FINAL

void Final(){
  background(0);    //Limpiamos la pantalla
  fill(0);
  stroke(255);      //Definimos las líneas y colores del botón
  strokeWeight(10);
  rectMode(CENTER);
  rect(width/2, height/2, width, height/4);  //Definimos el botón para finalizar la partida
  textSize(25);      //Definimos el texto
  textAlign(CENTER);
  fill(255);
  text("FIN", width/2, height/2);
  mouseClick();
    }


//CAMBIO DE PANTALLA

void mouseClick () {   //Definimos la acción al pasar el mouse por los botones
   if (mouseY < height/3 + height/3 && mouseY > height/3 && pantalla == 0) {   //En el menú pasamos por el botón para iniciar el juego
    pantalla=1; 
  }
     if (mouseY < height/3 + height/3 && mouseY > height/3 && pantalla == 2) {    //Al perder todas las vidas pasamos por el botón para finalizar el juego
    exit(); 
  }
}


//PERDER PARTIDA

void perderPartida(){
  if (bolaposY>=height-height/15){  
   vidas=vidas-1;
   bolaVX=random(3,4);    //Definimos unas velocidades aleatorias entre dos números para mayor variedad de partidas tras perder cada vida
   bolaVY=random(-4,-5);
   bolaposX= width/2;      //Reiniciamos las posiciones de la bola tras perder una vida
   bolaposY= height/2;
  }
  if (vidas==0) pantalla=pantalla+1;
  
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
if((bolaposY+bolaR>=palaposY) && (palaposX-palalong/2<bolaposX) && (palaposX+palalong/2>bolaposX)){
  bolaVY=bolaVY*random(-0.8,-1.2);
}
}


//AUMENTO VELOCIDAD DE LA BOLA

void aumentoVelocidad(){
if((bolaposY+bolaR>=palaposY) && (palaposX-palalong/2<bolaposX) && (palaposX+palalong/2>bolaposX) && (bolaVY<10)){    //Aumentamos la velocidad cada vez que la bola rebote en la pala
  bolaVY=bolaVY+2;
}
}

