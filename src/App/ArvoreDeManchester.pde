public static class ArvoreDeManchester {

    static NoManchester[] arvoreManchester = new NoManchester[31];


    public static void preencheArvore() {

        arvoreManchester[0] = new ArvoreDeManchester(0, 1);
        arvoreManchester[2] = new ArvoreDeManchester(1, 92);
        arvoreManchester[6] = new ArvoreDeManchester(2, 8);
        arvoreManchester[14] = new ArvoreDeManchester(3, 38);
    }


    public static color decideCorPrioridade(Paciente paciente) {

        if(arvoreManchester[0].ehMaiorLimite(paciente)) {
            return CoresPrioridades.VERMELHO;

        } else if (arvoreManchester[2].ehMaiorLimite(paciente)) {
            return CoresPrioridades.LARANJA;

        } else if (arvoreManchester[6].ehMaiorLimite(paciente)) {
            return CoresPrioridades.AMARELO;

        } else if (arvoreManchester[14].ehMaiorLimite(paciente)) {
            return CoresPrioridades.VERDE;
        
        } else {
            return CoresPrioridades.AZUL;
        }
    }
}