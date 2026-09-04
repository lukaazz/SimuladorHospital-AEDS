class SimuladorHospital {

    private float ultimoSpawn; // atribuir o tempo de quando foi o spawn
    private float tempoEsperaSpawn; // atribuir a função de espera de spawn


    public void iniciarGrid (Grid grid) {

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


    // se o tempo de intervalo entre os spawns já chegou no limite ele atualiza as entidades
    public void atualizarEntidades() {



    }


    // desenha as entidades
    public void desenhar() {

        
    }





}