public static class NoManchester {

    private int indiceCaracteristica;
    private double valorComparacao;
    private OperadorComparacao operador;
    private boolean ehFolha;
    private CoresPrioridades corFolha;


    public NoManchester(CoresPrioridades corFolha) {
        this.ehFolha = true;
        this.corFolha = corFolha;
    }


    public NoManchester(int indiceCaracteristica, double valorComparacao, OperadorComparacao operador) {
        this.ehFolha = false;
        this.indiceCaracteristica = indiceCaracteristica;
        this.valorComparacao = valorComparacao;
        this.operador = operador;
    }

    public boolean getEhFolha() {
        return ehFolha;
    }

    public CoresPrioridades getCorFolha() {
        if (ehFolha) {
            return corFolha;
        } else {
            throw new IllegalStateException("Este nó não é uma folha.");
        }
    }

    public boolean atendeCondicao(Paciente paciente) {
        
        double valorPaciente = paciente.getCaracteristica(this.indiceCaracteristica);

        switch (this.operador) {
            case IGUAL:
                return valorPaciente == valorComparacao;
            case DIFERENTE:
                return valorPaciente != valorComparacao;
            case MAIOR:
                return valorPaciente > valorComparacao;
            case MAIOR_IGUAL:
                return valorPaciente >= valorComparacao;
            case MENOR:
                return valorPaciente < valorComparacao;
            case MENOR_IGUAL:
                return valorPaciente <= valorComparacao;
            default:
                return false;
        }
    }
}