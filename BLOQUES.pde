///
///BLQUES
///José Enrique Maese Álvarez
///IES Vicente Aleixandre 2ºBachillerato
///

Bloque[] miBloque = new Bloque[7];

void setup() {
  size (800, 800);
  for (int i=0; i< 7; i++) {
    miBloque[i]= new Bloque((width/miBloque.length*i)+width/14, height/7);
  }
}

void draw() {
  background(255);
  for (int i=0; i< 7; i++) {
    miBloque[i].display();
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
    anchoBloque=20;
    altoBloque=35;
    r=random(0, 255);
    g=random(0, 255);
    b=random(0, 255);
  }
  // FUNCIONES
  // dibuja la pelota
  void display() {

    fill(r-50 ,g-50 ,b-50);
    stroke(r, g, b);
    strokeWeight(2);
    rectMode(CENTER);
    rect(bloquePosX, bloquePosY, altoBloque, anchoBloque);
  }
}
