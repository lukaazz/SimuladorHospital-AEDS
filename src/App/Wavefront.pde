//funcoes soltas para poderem ser acessadas de qualquer arquivo

boolean ehTransitavel(char celula){
    if(celula == '#' || celula == 'E' || celula == 'M'){
        return false;
    }
    return true;
}

int[][] calcularWavefront(int destinoLinha, int destinoColuna, char[][] mapa){
    int numLinhas = mapa.length; 
    int numColunas = mapa[0].length; //esse[0] pega o numero d colunas da linha inicial
    int[][] distancias = new int[numLinhas][numColunas];

    for(int i=0; i<numLinhas; i++){
        for(int j=0; j<numColunas; j++){
            distancias[i][j] = -1; //preenchendo a matriz toda com -1 "casa nao visitada"
        }
    }

    if(!ehTransitavel(mapa[destinoLinha][destinoColuna])){
        return distancias; //se tiver numa casa nao transitavel n muda nada
    }

    distancias[destinoLinha][destinoColuna] = 0; //o destino é marcado como 0
    FilaCoordenadas fila = new FilaCoordenadas();
    Coordenada cDest = new Coordenada(destinoLinha, destinoColuna);

    fila.enfileirar(cDest); //coloquei na fila a coordenada do destino
    int[] dLinha = {-1, 1, 0, 0};
    int[] dColuna = {0, 0, -1, 1};

    while(!fila.vazia()){ //pra percorrer todas as celulas
        Coordenada atual = fila.desenfileirar(); //peguei a primeira coord da fila como a coord atual

        for(int i=0; i<=3; i++){
            int novoL = atual.getL() + dLinha[i];
            int novoC = atual.getC() + dColuna[i]; //serve pra analisar as 4 celulas vizinhas

            if(novoL >= 0 && novoL < numLinhas && novoC >= 0 && novoC < numColunas){ //confere se tamo dentro do mapa
                if(ehTransitavel(mapa[novoL][novoC])){ //se nao for transitavel a onda nem propaga
                    if(distancias[novoL][novoC] == -1){ //confere se ja n visitei essa celula antes
                        distancias[novoL][novoC] = distancias[atual.getL()][atual.getC()] + 1; //a distancia do vizinho é atual +1
                        Coordenada nova = new Coordenada(novoL, novoC);
                        fila.enfileirar(nova); //guarda a coordenada nova na fila
                    }
                }
            }
        }
        
    }
    return distancias;
}