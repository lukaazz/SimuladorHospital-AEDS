public static class NoManchester {

    private int indiceCaracteristica;
    private double valorLimite;
    private boolean ehFolha;
    private boolean maiorQue; 
    private CoresPrioridades corFolha;

    public NoManchester(CoresPrioridades cor) {
        this.corFolha = cor;
        this.ehFolha = true;
    }

    public NoManchester(int indice, double limite) {
        this(indice, limite, true);
    }

    public NoManchester(int indice, double limite, boolean maiorQue) {
        this.indiceCaracteristica = indice;
        this.valorLimite = limite;
        this.maiorQue = maiorQue;
        this.ehFolha = false;
    }

    public boolean getEhFolha() {
        return ehFolha;
    }

    public CoresPrioridades getCorFolha() throws IllegalStateException {
        if (ehFolha) {
            return corFolha;
        } else {
            throw new IllegalStateException();
        }
    }

    
    public boolean atendeCondicao(Paciente paciente) throws IllegalStateException {
    if (!ehFolha) {
        double valor = paciente.getCaracteristica(this.indiceCaracteristica);
        return maiorQue ? (valor > this.valorLimite) : (valor <= this.valorLimite);
    } else {
        throw new IllegalStateException();
    }
}
}