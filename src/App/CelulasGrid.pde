public class CelulasGrid {
    PImage fundo = new PImage();
    PImage acessorio = new PImage();
    Celulas tipo_celula;

    public PImage getFundo() {
        return fundo;
    }

    public void setFundo(PImage fundo) {
        this.fundo = fundo;
    }

    public PImage getAcessorio() {
        return acessorio;
    }

    public void setAcessorio(PImage acessorio) {
        this.acessorio = acessorio;
    }

    public Celulas getTipoCelula() {
        return tipo_celula;
    }

    public void setTipoCelula(Celulas tipo_celula) {
        this.tipo_celula = tipo_celula;
    }

}