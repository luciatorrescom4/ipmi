//Torres Lucía
//https://youtu.be/LP9s-XU5yEU



// interactividades: con el click izquierdo estiras el hoyo negro central, con el derecho lo podes rotar, las flechas arriba y abajo cambian el tamaño de los ovalos de la grilla, con el epsacio cambia a una escala de grises random y con la r reinicias la imagen.




//varibales globales

PImage imgReferencia;
color colorPuntos = color(0);

// variables para la grilla
int cantX = 17;
int cantY = 28;
float tamCelda = 25;

//variables de control para el hoyo negro
boolean hoyoCentral = false;
float escalaX = 1.0;
float escalaY = 1.0;
float rotar = 0;

//modificador de las flechas del teclado
float tamanoOvalos = 0;

void setup() {
  size(800, 400);
  imgReferencia = loadImage("07.png");
}


//bucle de dibujo


void draw() {
  background(255);

  noClip();
  //referencia
  if (imgReferencia != null) {
    image(imgReferencia, 0, 0, 400, 400);
  }

  //separador
  stroke(180);
  line(400, 0, 400, height);

  //reborde de mi lienzo
  clip(400, 0, 400, height);

  //capa de atras que tiene el difuminado
  pushMatrix();
  translate(600, 200);
  rotate(rotar);

  for (int i = 320; i > 0; i -= 2) {
    float alfaF = map(i, 0, 320, 18, 0);
    fill(colorPuntos, alfaF);
    noStroke();
    ellipse(0, 0, ((150 + i) * 1.25) * escalaX, ((130 + i) * 1.15) * escalaY);
  }
  popMatrix();

  // capa intermedia ponele donde esta la grilla de los ovalos
  for (int i = 0; i < cantX; i++) {
    for (int j = -2; j < cantY; j++) {

      float xReal = 400 + (i * tamCelda);
      float yReal = j * 14.5;

      if (j % 2 != 0) {
        xReal += 12.5;
      }

      float distancia = dist(xReal, yReal, 600, 200);
      float anchoPunto = daAncho(distancia);

      dibujaOvalos(colorPuntos, xReal, yReal, anchoPunto, 11);
    }
  }

  //capa de adelante (hoyo negro)
  pushMatrix();
  translate(600, 200);
  rotate(rotar);

  for (int i = 90; i > 0; i--) {
    float alfa = 255 - (i * 2.5);
    fill(colorPuntos, alfa);
    noStroke();
    ellipse(0, 0, (150 + i) * escalaX, (130 + i) * escalaY);
  }
  popMatrix();
}


//mis funciones

void dibujaOvalos(color c, float px, float py, float ovalW, float ovalH) {
  fill(c);
  noStroke();
  ellipse(px, py, ovalW, ovalH);
}

float daAncho(float d) {
  float total = 17 + tamanoOvalos;
  return total;
}

//funcion de color
color daGrises() {
  float tono = random(0, 255);
  color colorResultado = color(tono);
  return colorResultado;
}

//eventos del mouse

void mousePressed() {
  float d = dist(mouseX, mouseY, 600, 200);

  if (d < 140) {
    hoyoCentral = true;

    if (mouseButton == LEFT) {
      println("click izquierdo - podes estirar");
    } else if (mouseButton == RIGHT) {
      println("click derecho - podes rotar");
    }
  } else {
    if (mouseButton == LEFT) {
      println("click izquierdo pero estas lejos del centro");
    } else if (mouseButton == RIGHT) {
      println("click derecho pero estas lejos del centro");
    }
  }
}

void mouseDragged() {
  if (hoyoCentral) {
    float dMouse = dist(mouseX, mouseY, 600, 200);

    if (mouseButton == LEFT) {
      escalaY = map(dMouse, 0, 250, 0.5, 2.5);
      if (escalaY < 0.3) {
        escalaY = 0.3;
      }
    } else if (mouseButton == RIGHT) {
      rotar = map(mouseX, 400, width, -0.4, 0.4);
    }
  }
}

void mouseReleased() {
  hoyoCentral = false;
}


//eventos del teclado

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      tamanoOvalos += 2;
    } else if (keyCode == DOWN) {
      tamanoOvalos -= 2;
    }
  }

  if (key == ' ') {
    colorPuntos = daGrises();
  }
  //por si usan el bloq mayus, imaginandolo como un juego
  if (key == 'r' || key == 'R') {
    tamanoOvalos = 0;
    colorPuntos = color(0);
    escalaX = 1.0;
    escalaY = 1.0;
    rotar = 0;
    println("reseteaste");
  }
}
