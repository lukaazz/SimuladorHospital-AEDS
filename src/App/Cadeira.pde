public class Cadeira {
    private int x, y;
    EstadoCadeira estado;
    
    public Cadeira(int x, int y) {
        this.x = x;
        this.y = y;
        EstadoCadeira estado = EstadoCadeira.LIVRE;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public EstadoCadeira getEstado() {
        return estado;
    }

    public void setEstado(EstadoCadeira estado) {
        this.estado = estado;
    }
}