public class Paciente {
    
    public static final int SATURACAO = 0;
    public static final int TEMPERATURA = 1;
    public static final int NIVEL_DOR = 2;
    public static final int CONSCIENCIA = 3;

    private String id;
    private double[] caracteristicas;
    private boolean prioridade;

    private static final Random rand = new Random();

    public Paciente(String id) {
        this.id = id;
        this.caracteristicas = gerarCaracteristicasAleatorias();

        if(rand.nextDouble() < 0.25) {
            prioridade = true;
        } else {
            prioridade = false;
        }
    }

    private double[] gerarCaracteristicasAleatorias() {
        
        double[] c = new double[4];

        // geração das caracteriticas aleatorias
        c[SATURACAO]   = 70 + rand.nextDouble() * (100 - 70); // 70 + um número de ponto flutuante aleatório entre 0 e 1 * a diferença do intervalo 
        c[TEMPERATURA] = 34 + rand.nextDouble() * (42 - 34); // mesma logica
        c[NIVEL_DOR]   = rand.nextInt(11); // número aleatório entre 0 e 10
        c[CONSCIENCIA] = rand.nextInt(2); // mesma logica

        return c;
    }

    public double getCaracteristica(int indice) {
        return caracteristicas[indice];
    }
}