public class NoManchester {

    private int indiceCaracteristica;
    private double valorLimite;
    private boolean ehFolha;
    private color corFolha;



    public boolean getEhFolha() {
        return ehFolha;
    }


    public boolean ehMaiorLimite(Paciente paciente) {
        if(paciente.getCaracteristica(this.indiceCaracteristica) > this.valorLimite) {
            return true;
        } else {
            return false;
        }
    }


    public color getCorFolha() {
        if(ehFolha) {

        }
    }

    

}