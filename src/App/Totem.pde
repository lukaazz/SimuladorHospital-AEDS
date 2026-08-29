int DIGITOS_SENHA = 4;

public class Totem {
    private int contadorPreferencial;
    private int contadorNormal;
    private boolean ocupado;

    public Totem() {
        contadorPreferencial = 0;
        contadorNormal = 0;
        ocupado = false;
    }

    public String gerarSenha(boolean preferencial) {
        String senha;

        if (preferencial) {
            String digitos = nf(contadorPreferencial, DIGITOS_SENHA);
            senha = "P" + digitos;
            contadorPreferencial++;
        } else {
            String digitos = nf(contadorNormal, DIGITOS_SENHA);
            senha = "N" + digitos;
            contadorNormal++;
        }
        return senha;
    }

    public boolean estaOcupado() {
        return ocupado;
    }

    //pensar na logica de quando vai ser settado como o ocupado ou nao
    //talvez seja mais facil definir isso dps que o wavefront estiver pronto?
    public void setOcupado(boolean ocupado) {
        this.ocupado = ocupado;
    }
}