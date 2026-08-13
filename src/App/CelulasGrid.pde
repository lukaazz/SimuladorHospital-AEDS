public class CelulasGrid {
    PImage fundo = new PImage();
    PImage acessorio = new PImage();
    Celula tipo_celula;

    public PImage getFundo() {
        return fundo;
    }

    public Pimage setFundo(PImage fundo) {
        this.fundo = fundo;
    }

    public PImage getAcessorio() {
        return acessorio;
    }

    public PImage setAcessorio(PImage acessorio) {
        this.acessorio = acessorio;
    }

    public Celula getTipo_celula() {
        return tipo_celula;
    }

    public void setTipo_celula(Celula tipo_celula) {
        this.tipo_celula = tipo_celula;
    }

}