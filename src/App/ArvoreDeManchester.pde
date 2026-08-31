public static class ArvoreDeManchester {

    static NoManchester[] arvoreManchester = new NoManchester[31];


    public static void preencheArvore() {

        arvoreManchester[0] = new NoManchester(3, 1);
        arvoreManchester[1] = new NoManchester(CoresPrioridades.VERMELHO);
        arvoreManchester[2] = new NoManchester(0, 92);
        arvoreManchester[5] = new NoManchester(CoresPrioridades.LARANJA);
        arvoreManchester[6] = new NoManchester(2, 8);
        arvoreManchester[13] = new NoManchester(CoresPrioridades.AMARELO);
        arvoreManchester[14] = new NoManchester(1, 38);
        arvoreManchester[29] = new NoManchester(CoresPrioridades.VERDE);
        arvoreManchester[30] = new NoManchester(CoresPrioridades.AZUL);
    }


    public static color decideCorPrioridade(Paciente paciente) {

        int i = 0;

        while(!(arvoreManchester[i].getEhFolha())) {
            if(arvoreManchester[i].ehMaiorLimite(paciente)) {
                i = (2 * i) + 1;
            } else {
                i = (2 * i) + 2;
            }
        }
        return arvoreManchester[i].getCorFolha();
    }


}


// if(arvoreManchester[0].ehMaiorLimite(paciente)) { //CONSICIENCIA
        //     return CoresPrioridades.VERMELHO;

        // } else if (!arvoreManchester[2].ehMaiorLimite(paciente)) { //SATURAÇÃO
        //     return CoresPrioridades.LARANJA;

        // } else if (arvoreManchester[6].ehMaiorLimite(paciente)) { // NIVEL DOR
        //     return CoresPrioridades.AMARELO;

        // } else if (arvoreManchester[14].ehMaiorLimite(paciente)) { // TEMPERATURA
        //     return CoresPrioridades.VERDE;
        
        // } else {
        //     return CoresPrioridades.AZUL;
        // }