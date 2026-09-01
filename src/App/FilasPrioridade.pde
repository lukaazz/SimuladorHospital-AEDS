public static class FilasPrioridade {

    private static ListaPacientes[] filas = new ListaPacientes[5];

    public static void preencheFilas() {
        for(int i = 0; i < filas.length; i++) {
            filas[i] = new ListaPacientes();
        }
    }

    public static void adicionarPaciente(Paciente p) throws IllegalStateException {
        
        if(p.getCorPrioridade() == null) {
            throw new IllegalStateException();
        }
        filas[p.getCorPrioridade().ordinal()].adicionar(p);
    }

    public static Paciente chamarProximo() {

        for(int i = 0; i < filas.length; i++) {
            if(!(filas[i].vazia())) {
                return filas[i].removerPrimeiro();
            }
        }
        return null;
    }
}