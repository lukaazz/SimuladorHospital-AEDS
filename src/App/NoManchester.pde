public static class NoManchester {

    private int indiceCaracteristica;
    private double valorLimite;
    private boolean ehFolha;
    private CoresPrioridades corFolha;


    // dois construtores diferentes para os estados possíveis de um nó
    public NoManchester(CoresPrioridades cor) {
        this.corFolha = cor;
        this.ehFolha = true;
    }

    public NoManchester(int indice, double limite) {
        this.indiceCaracteristica = indice;
        this.valorLimite = limite;
        this.ehFolha = false;
    }


    public boolean getEhFolha() {
        return ehFolha;
    }

    // para os nós que são folhas, retorna a cor dela 
    public CoresPrioridades getCorFolha() throws IllegalStateException {
        
        if(ehFolha) {
            return corFolha;
        } else {
            throw new IllegalStateException();
        }
    }

    // para os nós que não são folhas, faz a comparação entre os o valor e o limite e retorna se maior
    public boolean ehMaiorLimite(Paciente paciente) throws IllegalStateException {
        
        if(!ehFolha) {
            return (paciente.getCaracteristica(this.indiceCaracteristica) > this.valorLimite);
        } else {
            throw new IllegalStateException();
        }
    }

    
    
}