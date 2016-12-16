float bolaposX=0;
float bolaVX=4;
float bolaposY=0;
float bolaVY=-4;
float bolaR=12;
float palaposX=0;
float palaposY=0;;
float palalong=0;
float vidas = 3;
int nivel=0;

void setup(){
size(500,300);
background(255);
//BOLA
bolaposX= width/2;
bolaposY= height/2;
//PALA
palalong=width/7;
palaposX=width/2;
palaposY=height-height/10;
}



void draw(){
  
  switch (nivel) {
    case 0:
    pantallaInicio();
    //break;
    case 1:
    pantallaJuego();
    break;
  }
}
  
  
//PANTALLA DE INICIO
void pantallaInicio(){
  background(50);
  fill(255);
  textSize(25);
  text("press P", width/2, height/2);
    if (key=='P') {
    nivel=nivel+1;
  }
}
  
  
// PANTALLA DE JUEGO  
void pantallaJuego(){
background(255);
fill(0);
dibujarPala();
dibujarBola();
moverPala();
moverBola();
reboteBola();
  if (bolaposY>=palaposY) {
    nivel=nivel+1;
    bolaVX=0;
    bolaVY=0; 
    key='a';
  }
  if (nivel==2){ nivel=0;
}
}

//DIBUJAR BOLA
void dibujarBola(){
fill(palaposX*255/width);
ellipse(bolaposX, bolaposY, bolaR, bolaR);
}
//DIBUJAR PALA
void dibujarPala(){
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
bolaVY=bolaVY*-1;
}
}
