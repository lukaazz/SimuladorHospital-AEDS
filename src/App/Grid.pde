public class Grid {
    int largura, altura;
    int largura_celula;
    int altura_celula;

    PImage chao_img = new PImage();
    PImage parede_img = new PImage();
    PImage cadeira_img = new PImage();
    PImage gerador_img = new PImage();
    PImage removedor_img = new PImage();
    PImage enfermeira_img = new PImage();
    PImage medico_img = new PImage();
    PImage totem_img = new PImage();

    
    CelulasGrid[][] grid;
    //colocar qnt_livres de cadeiras
    Cadeira[] cadeiras;

    void inicializarImagens() {
        chao_img = loadImage("tilefloor.png");
        parede_img = loadImage("tilewall.png");
        cadeira_img = loadImage("chair.png");
        gerador_img = loadImage("gerador.png");
        removedor_img = loadImage("removedor.png");
        medico_img = loadImage("doctor.png");
        enfermeira_img = loadImage("nurse.png");
        totem_img = loadImage("totem.png");
    }

    void inicializarGrid(String caminhoMapa) throws MapaNaoFormatadoException {
        int i, j;
        
        String[] linhasMapa = loadStrings(caminhoMapa);

        try {
            String[] dimensoes = split(linhasMapa[0], ' ');
            altura = int(dimensoes[0]);
            largura = int(dimensoes[1]);
        } catch (ArrayIndexOutOfBoundsException e) {
            //preferi tratar assim porque, nesse caso, o mapa tambem nao esta formatado como deveria
            throw new MapaNaoFormatadoException();
        }

        grid = new CelulasGrid[altura][largura];
        largura_celula = width / largura;
        altura_celula = height / altura;

        for(i = 0; i < altura; i++) {
            for(j = 0; j < largura; j++) {
                grid[i][j] = new CelulasGrid();
            }
        }

        for(i = 0; i < altura; i++) {

            //1a linha eh o tamanho do mapa
            String linha = linhasMapa[i + 1];

            if (linha.length() != largura) {
                throw new MapaNaoFormatadoException();
            }

            for(j = 0; j < largura; j++) {
        
                char c = linha.charAt(j);
                
                switch (c) {
                    case '#':
                        grid[i][j].setTipoCelula(Celulas.p);
                        break;
                    case '.':
                        grid[i][j].setTipoCelula(Celulas.c);
                        break;
                    case 'A':
                        grid[i][j].setTipoCelula(Celulas.a);
                        break;
                    case 'M':
                        grid[i][j].setTipoCelula(Celulas.m);
                        break;
                    case 'E':
                        grid[i][j].setTipoCelula(Celulas.e);
                        break;
                    case 'T':
                        grid[i][j].setTipoCelula(Celulas.t);
                        break;
                    case 'G':
                        grid[i][j].setTipoCelula(Celulas.g);
                        break;
                    case 'R':
                        grid[i][j].setTipoCelula(Celulas.r);
                        break;
                    default:
                        throw new MapaNaoFormatadoException();
                }
            }
        }

        int cadeiraIndex = 0;

        for(i = 0; i < altura; i++) {
            for(j = 0; j < largura; j++) {

                switch (grid[i][j].getTipoCelula()) {
                    case p:
                        grid[i][j].setFundo(parede_img);
                        grid[i][j].setAcessorio(null);
                        break;

                    case c:
                        grid[i][j].setFundo(chao_img);
                        grid[i][j].setAcessorio(null);
                        break;

                    case a:
                        grid[i][j].setFundo(chao_img);
                        grid[i][j].setAcessorio(cadeira_img);
                        cadeiraIndex++;
                        break;

                    case m:
                        grid[i][j].setFundo(chao_img);
                        grid[i][j].setAcessorio(medico_img);
                        break;

                    case e:
                        grid[i][j].setFundo(chao_img);
                        grid[i][j].setAcessorio(enfermeira_img);
                        break;

                    case t:
                        grid[i][j].setFundo(chao_img);
                        grid[i][j].setAcessorio(totem_img);
                        break;

                    case g:
                        grid[i][j].setFundo(chao_img);
                        grid[i][j].setAcessorio(gerador_img);
                        break;

                    case r:
                        grid[i][j].setFundo(chao_img);
                        grid[i][j].setAcessorio(removedor_img);
                        break;
                }
            }
        }

        cadeiras = new Cadeira[cadeiraIndex];

        int qnt_livres_temporario = 0;
        for(i = 0; i < altura; i++) {
            for(j = 0; j < largura; j++) {
                if (grid[i][j].getTipoCelula() == Celulas.a) {
                    cadeiras[qnt_livres_temporario] = new Cadeira(j, i);
                    qnt_livres_temporario++;
                }
            }
        }
    }

    int qnt_livrescadeiras = 0;

    void desenharGrid() {
        int i, j;

        for(i = 0; i < altura; i++) {
            for(j = 0; j < largura; j++) {

                switch(grid[i][j].getTipoCelula()) {

                    case p:
                        image(grid[i][j].getFundo(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        break;

                    case c:
                        image(grid[i][j].getFundo(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        break;

                    case a:
                        image(grid[i][j].getFundo(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        image(grid[i][j].getAcessorio(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        break;

                    case m:
                        image(grid[i][j].getFundo(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        image(grid[i][j].getAcessorio(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        break;

                    case e:
                        image(grid[i][j].getFundo(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        image(grid[i][j].getAcessorio(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        break;

                    case t:
                        image(grid[i][j].getFundo(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        image(grid[i][j].getAcessorio(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        break;

                    case g:
                        image(grid[i][j].getFundo(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        image(grid[i][j].getAcessorio(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        break;

                    case r:
                        image(grid[i][j].getFundo(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        image(grid[i][j].getAcessorio(), 
                            j * largura_celula, 
                            i * altura_celula, 
                            largura_celula, altura_celula);
                        break;
                }
            }
        }
    }

    public Cadeira[] ordenarCadeirasPorDistancia(int[][] distancias) {
        Cadeira[] cadeirasLivres = filtrarCadeirasLivres();
        int n = cadeirasLivres.length;

        for(int i = 0; i < n; i++) {
            int menor_indice = i;
            int menor_distancia = distanciaReal(cadeirasLivres[i], distancias);

            for(int j = i + 1; j < n; j++) {
                int distanciaJ = distanciaReal(cadeirasLivres[j], distancias);

                if(distanciaJ < menor_distancia) {
                    menor_indice = j;
                    menor_distancia = distanciaJ;
                }
            }

            Cadeira temporaria = cadeirasLivres[i];
            cadeirasLivres[i] = cadeirasLivres[menor_indice];
            cadeirasLivres[menor_indice] = temporaria;
        }

        return cadeirasLivres;
    }

    public int distanciaReal(Cadeira cadeira, int[][] distancias) {
        int distancia_real = distancias[cadeira.getY()][cadeira.getX()];

        if(distancia_real == -1) {
            distancia_real = Integer.MAX_VALUE;
        }

        return distancia_real;
    }

    public Cadeira[] filtrarCadeirasLivres() {
        int qnt_livres = 0;
        int contador = 0;

        for (int i = 0; i < cadeiras.length; i++) {
            if (cadeiras[i].getEstado() == EstadoCadeira.LIVRE) {
                qnt_livres++;
            }
        }

        Cadeira[] cadeirasLivres = new Cadeira[qnt_livres];

        for (int i = 0; i < cadeiras.length; i++) {
            if (cadeiras[i].getEstado() == EstadoCadeira.LIVRE) {
                cadeirasLivres[contador] = cadeiras[i];
                contador++;
            }
        }
        return cadeirasLivres;
    }

    public void resetarGrid() {
        grid = null;
        cadeiras = null;
        largura = 0;
        altura = 0;
        largura_celula = 0;
        altura_celula = 0;
    }
}