public class GeradorTempo {

    public static float gerarTempoSpawn() {
        float media = 5.0;
        float u = random(0, 1);
        return (int) (-media * log(1 - u));
    }

    public static float gerarTempoTriagem() {
        float media = 6.0;
        float desvio = 2.0;
        float minimo = 2.0;
        return max(minimo, media + desvio * randomGaussian(), minimo);
    }

    public static float gerarTempoConsulta() {
        float media = 12.0;
        float desvio = 4.0;
        float minimo = 4.0;
        return max(minimo, media + desvio * randomGaussian(), minimo);
    }
}
  