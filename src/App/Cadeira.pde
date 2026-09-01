public class Cadeira {
    private int coluna, linha;
    private EstadoCadeira estado;
    
    public Cadeira(int linha, int coluna) {
        this.coluna = coluna;
        this.linha = linha;
        this.estado = EstadoCadeira.LIVRE;
    }

    public int getColuna() {
        return coluna;
    }

    public int getLinha() {
        return linha;
    }

    public EstadoCadeira getEstado() {
        return estado;
    }

    public void setEstado(EstadoCadeira estado) {
        this.estado = estado;
    }
}