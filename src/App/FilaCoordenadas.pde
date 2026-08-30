public class NoFila {
    private Coordenada valor;
    private NoFila proximo;

    public NoFila(Coordenada c){
        this.valor = c;
        this.proximo = null;
    }
}

public class FilaCoordenadas {
    private NoFila inicio;
    private NoFila fim;
    int quantidade;

    public FilaCoordenadas(){
        this.inicio = null;
        this.fim = null;
        this.quantidade = 0;
    }

    public void enfileirar(Coordenada valor){
        NoFila nF = new NoFila(valor);
        if(!this.vazia()){ //se a fila nao tiver vazia
            this.fim.proximo = nF; //o atributo proximo do ultimo elemento (fim) aponta pro novo nó
            this.fim = nF;
        }
        else{            //se a fila tiver vazia
            this.inicio = nF; //o inicio e o fim sao o novo no
            this.fim = nF;
        }
        quantidade++; //mais um na fila
    }

    public Coordenada desenfileirar(){
        if(this.vazia()){
            return null;
        }
        Coordenada primeiro = inicio.valor; //variavel pra guardar as coordenadas do primeiro
        this.inicio = this.inicio.proximo; //o primeiro passa a ser o elemento que ele apontava como proximo
        if(inicio == null){
            this.fim = null; //se a fila acabou o ultimo morre tbm
        }
        quantidade--;
        return primeiro;     //retorna as coordenadas de quem saiu da fila
    }

    public boolean vazia(){
        if(this.inicio == null){
            return true;
        }
        return false;
    }

    public int getQuantidade(){
        return quantidade;
    }
}