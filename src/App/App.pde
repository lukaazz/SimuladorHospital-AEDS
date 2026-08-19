int tamanho = 24;
int largura_celula;
int altura_celula;

PImage chao_img = new PImage();
PImage parede_img = new PImage();
PImage cadeira_img = new PImage();
PImage gerador_img = new PImage();
PImage removedor_img = new PImage();
PImage enfermeira_img = new PImage();
PImage medico_img = new PImage();
PImage totem_img = new PImage();

CelulasGrid[][] grid = new CelulasGrid[tamanho][tamanho];
Cadeira[] cadeiras = new Cadeira[30];

void setup() {
    size(800, 800);

    largura_celula = width / tamanho;
    altura_celula = height / tamanho;

    inicializarImagens();
    inicializarGrid();
}

void draw() {
    desenharGrid();
}