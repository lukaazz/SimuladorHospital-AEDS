public class MapaNaoFormatadoException extends Exception {
    public MapaNaoFormatadoException() {
        super("Erro ao ler o mapa. Confira o formato do arquivo ou escolha outro mapa.");
    }
}