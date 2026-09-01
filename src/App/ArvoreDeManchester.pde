public static class ArvoreDeManchester {

    static NoManchester[] arvoreManchester = new NoManchester[31];


    public static void preencheArvore() {

        // instancia cada nó que vai ser utilizado na árvore (os de escolha e os que são folhas)
        arvoreManchester[0] = new NoManchester(3, 0);
        arvoreManchester[1] = new NoManchester(CoresPrioridades.VERMELHO);
        arvoreManchester[2] = new NoManchester(0, 92);
        arvoreManchester[5] = new NoManchester(CoresPrioridades.LARANJA);
        arvoreManchester[6] = new NoManchester(2, 7);
        arvoreManchester[13] = new NoManchester(CoresPrioridades.AMARELO);
        arvoreManchester[14] = new NoManchester(1, 38);
        arvoreManchester[29] = new NoManchester(CoresPrioridades.VERDE);
        arvoreManchester[30] = new NoManchester(CoresPrioridades.AZUL);   
    }

    public static CoresPrioridades decideCorPrioridade(Paciente paciente) {
        int i = 0;

        // para os nós que não são folhas, enquanto ele não ultrapassar o limite, passa pelos nós da árvore 
        while(!(arvoreManchester[i].getEhFolha())) {
            if(arvoreManchester[i].ehMaiorLimite(paciente)) {
                i = (2 * i) + 1;
            } else {
                i = (2 * i) + 2;
            }
        }
        // se atinge o limite retorna a cor da folha que parou
        return arvoreManchester[i].getCorFolha();
    }
}