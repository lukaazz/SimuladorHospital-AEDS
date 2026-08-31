int tamanho = 24;
int largura_celula;
int altura_celula;

NoManchester[] ArvoreManchester;

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

    grid = new Grid();

    inicializarImagens();
    inicializarGrid();


    /* 
    
    logica de manchester:
        -> se existe um paciente no totem de atendimento  
        -> chama metodo que passa pela arvore e retorna uma cor  
        -> cor vira atributo de paciente
        -> paciente vai pra fila de espera da consulta
        
    */
}

void draw() {
    background(255);

    if (!inicializado) {

        try {
            //vai ser chamado sempre que um mapa diferente for escolhido, para resetar o grid e desenhar o novo mapa
            grid.inicializarGrid("data/mapa1.txt");

        } catch (MapaNaoFormatadoException e) {
            println(e.getMessage());
        }
        inicializado = true;
    }

    grid.desenharGrid();
}