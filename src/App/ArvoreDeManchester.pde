public static class ArvoreDeManchester {

    static NoManchester[] arvoreManchester = new NoManchester[31];


    public static void preencheArvore() {

        arvoreManchester[0] = new NoManchester(Paciente.CONSCIENCIA, 1.0, OperadorComparacao.IGUAL);
        arvoreManchester[1] = new NoManchester(CoresPrioridades.VERMELHO);
        arvoreManchester[2] = new NoManchester(Paciente.SATURACAO, 92.0, OperadorComparacao.MENOR); 
        arvoreManchester[5] = new NoManchester(CoresPrioridades.LARANJA);
        arvoreManchester[6] = new NoManchester(Paciente.NIVEL_DOR, 8.0, OperadorComparacao.MAIOR_IGUAL);
        arvoreManchester[13] = new NoManchester(CoresPrioridades.AMARELO);
        arvoreManchester[14] = new NoManchester(Paciente.TEMPERATURA, 38.0, OperadorComparacao.MAIOR_IGUAL);
        arvoreManchester[29] = new NoManchester(CoresPrioridades.VERDE);
        arvoreManchester[30] = new NoManchester(CoresPrioridades.AZUL);  
    }

    public static CoresPrioridades decideCorPrioridade(Paciente paciente) {
        int i = 0;
        while (!(arvoreManchester[i].getEhFolha())) {
            if (arvoreManchester[i].atendeCondicao(paciente)) {
                i = (2 * i) + 1;
            } else {
                i = (2 * i) + 2;
            }
        }
        return arvoreManchester[i].getCorFolha();
    }
}