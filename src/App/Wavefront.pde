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
}