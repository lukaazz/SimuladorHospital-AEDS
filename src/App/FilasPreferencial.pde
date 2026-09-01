public static class FilasPreferencial {

    private static ListaPacientes[] filas = new ListaPacientes[2];
    public static int preferenciaisAtendidos = 0;

    public final static int PREFERENCIAL = 1;
    public final static int NORMAL = 0;
    public final static int LIMITE_ALTERNANCIA = 2;


    public static void preencheFilas() {
        for(int i = 0; i < filas.length; i++) {
            filas[i] = new ListaPacientes();
        }
    }

    public static void adicionarPaciente(Paciente p)  {  
        filas[(p.getPreferencial() ? PREFERENCIAL : NORMAL)].adicionar(p);
    }

    public static Paciente chamarProximo() {

        if(!(filas[PREFERENCIAL].vazia()) && preferenciaisAtendidos < LIMITE_ALTERNANCIA) {
            preferenciaisAtendidos++;
            return filas[PREFERENCIAL].removerPrimeiro();

        } else if (!(filas[NORMAL].vazia())) {
            preferenciaisAtendidos = 0;
            return filas[NORMAL].removerPrimeiro();
        } else {
            return filas[PREFERENCIAL].removerPrimeiro();
        }
    }
}