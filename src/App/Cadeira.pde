public class Cadeira {
    private int x, y;
    private boolean ocupada;
    
    public Cadeira(int x, int y) {
        this.x = x;
        this.y = y;
        this.ocupada = false;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public boolean estaOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }
}