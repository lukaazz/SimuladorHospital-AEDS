NoManchester[] ArvoreManchester;

Grid grid;

//apenas teste, talvez a logica deva ser alterada
boolean inicializado;

void setup() {
    size(800, 800);
    inicializado = false;

    grid = new Grid();

    grid.inicializarImagens();


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