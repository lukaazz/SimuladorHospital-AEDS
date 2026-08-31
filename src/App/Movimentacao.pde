public class GerenciadorMovimento{
    private char[][] mapaBase;
    private Paciente[][] ocupacao;

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
        calcularWavefront(p.getDestinoLinha, p.getDestinoColuna, mapaBase);
        
    }
}