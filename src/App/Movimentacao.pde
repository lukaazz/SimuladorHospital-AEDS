public class GerenciadorMovimento{
    private char[][] mapaBase;
    private Paciente[][] ocupacao; //mapinha que mostra onde ta cada paciente

    int numLinhas;
    int numColunas;

    public GerenciadorMovimento(char[][] mapaBase){
        this.mapaBase = mapaBase;
        this.numLinhas = mapaBase.length;
        this.numColunas = mapaBase[0].length;

        this.ocupacao = new Paciente[numLinhas][numColunas];
    }

    public void registrarPosicaoInicial(Paciente p, int linha, int coluna){
        p.setPosicao(linha, coluna);
        ocupacao[linha][coluna] = p;
    }

    public Coordenada calcularIntencao(Paciente p){
        if(p.chegouAoDestino()){
            return null;
        }
        int[][] distancias = calcularWavefront(p.getDestinoLinha(), p.getDestinoColuna(), mapaBase); //salva na matriz a onda pra saber as distancias
        Coordenada[] candidatos = vizinhosOrdenadosPorDistancia(p.getLinha(), p.getColuna(), distancias); //ordena as casas vizinhas pra saber a mais proxima do destino
        if(candidatos.length == 0){
            return null; //nao tem pra onde ir
        }
        return candidatos[0]; //melhor casa pra se mover (a q tem o menor numero pra chegar ao destino)
    }

    void atualizarMovimentacao(Paciente[] pacientesAtivos) {
        Coordenada[] intencoes = new Coordenada[pacientesAtivos.length];

        for(int i=0; i<intencoes.length; i++){
            intencoes[i] = calcularIntencao(pacientesAtivos[i]);
        }
    }

    void resolverConflitos(Paciente[] pacientesAtivos, Coordenada[] intencoes) {
        
    }

}