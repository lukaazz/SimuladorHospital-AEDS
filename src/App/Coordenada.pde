public class Coordenada {
    private int linha;
    private int coluna;

    public Coordenada(int l, int c){
        this.linha = l;
        this.coluna = c;
    }

    public Coordenada copy(){
        Coordenada c = new Coordenada(this.linha, this.coluna);
        return c;
    }

    public boolean equals(Coordenada outra){
        if(outra != null){
            if(outra.linha == this.linha && outra.coluna == this.coluna){
                return true;
            }
        }
        return false;
    }

    public int getL(){
        return linha;
    }

    public int getC(){
        return coluna;
    }
}