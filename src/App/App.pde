Grid grid;

//essa aqui eh uma variavel temporaria so pra testar o grid enquanto o menu n ta pronto
boolean inicializado = false;

void setup() {
    size(800, 800);

    grid = new Grid();

    grid.inicializarImagens();
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