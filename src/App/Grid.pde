//definir grid, terminar switch case

int tamanho = 24;
int largura_celula = width / tamanho;
int altura_celula = height / tamanho;

enum Celulas { 
    #, ., a, m, e, t, g, r
}

PImage[] chao_img = new PImage[];
PImage[] parede_img = new PImage[];
PImage[] cadeira_img = new PImage[];
PImage[] gerador_img = new PImage[];
PImage[] removedor_img = new PImage[];

CelulasGrid[][] grid = new CelulasGrid[tamanho][tamanho];

void inicializarImagens() {
    chao_img = loadImage("tilefloor.png");
    parede_img = loadImage("tilewall.png");
    cadeira_img = loadImage("chair.png");
    gerador_img = loadImage("gerador.png");
    removedor_img = loadImage("removedor.png");
}

void inicializarGrid() {
    int i, j;

    for(i = 0; i < tamanho; i++) {
        for(j = 0; j < tamanho; j++) {
            grid[i][j] = new CelulasGrid();
        }
    }

    for(i = 0; i < tamanho; i++) {
        for(j = 0; j < tamanho; j++) {


            switch (i) {
                //por nao ter o break, vai ler o case seguinte tbm (as linhas sao iguais)
                //acho que deve ter uma forma melhor de fazer isso, mas dps eu penso com calma
                case 0: 
                case 23:
                    grid[i][j].setTipoCelula(Celulas.#);
                    break;

                case 1:
                case 4:
                case 6:
                case 9:
                case 10:
                case 12:
                case 13:
                case 14:
                case 16:
                case 19:
                case 20:
                case 22:
                    if(j == 0 || j == 16 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.#);
                    } else {
                        grid[i][j].setTipoCelula(Celulas..);
                    }
                    break;

                case 2:
                case 5:
                case 8:
                    if(j >= 2 && j <= 11) {
                        grid[i][j].setTipoCelula(Celulas.a);
                    } else if(j == 0 || j == 16 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.#);
                    } else {
                        grid[i][j].setTipoCelula(Celulas..);
                    }
                    break;

                case 3:
                    if(j == 0 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.#);
                    } else if(j == 22) {
                        grid[i][j].setTipoCelula(Celulas.m);
                    } else {
                        grid[i][j].setTipoCelula(Celulas..);
                    }
                    break;

                case 7:
                case 15:
                    if(j == 0 || (j >= 16 && j <= 23)) {
                        grid[i][j].setTipoCelula(Celulas.#);
                    } else {
                        grid[i][j].setTipoCelula(Celulas..);
                    }
                    break;

                case 11:
                    if(j == 0 || (j >= 3 && j <= 10) || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.#);
                    } else if(j == 22) {
                        grid[i][j].setTipoCelula(Celulas.m);
                    } else {
                        grid[i][j].setTipoCelula(Celulas..);
                    }
                    break;
                
                case 17:
                    if(j == 0 || j == 16 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.#);
                    } else if(j == 3) {
                        grid[i][j].setTipoCelula(Celulas.t);
                    } else {
                        grid[i][j].setTipoCelula(Celulas..);
                    }
                    break;
                
                case 18:
                    if(j == 0 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.#);
                    } else if(j == 22) {
                        grid[i][j].setTipoCelula(Celulas.e);
                    } else {
                        grid[i][j].setTipoCelula(Celulas..);
                    }
                    break;

                case 21:
                    if(j == 0 || j == 16 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.#);
                    } else if(j == 8) {
                        grid[i][j].setTipoCelula(Celulas.g);

                    } else if(j == 11) {
                        grid[i][j].setTipoCelula(Celulas.r);
                    } else {
                        grid[i][j].setTipoCelula(Celulas..);
                    }
                    break;
            }

            for(i = 0; i < tamanho; i++) {
                for(j = 0; j < tamanho; j++) {

                    switch (grid[i][j].getTipoCelula()) {
                        case #:
                            grid[i][j].setFundo(parede_img);
                            grid[i][j].setAcessorio(null);
                            break;

                        case .:
                            grid[i][j].setFundo(chao_img);
                            break;

                        case a:
                            grid[i][j].setFundo(chao_img);
                            grid[i][j].setAcessorio(cadeira_img);
                            break;

                        case m:
                            grid[i][j].setFundo(chao_img);
                            grid[i][j].setAcessorio(removedor_img);
                            break;

                        case e:
                            grid[i][j].setFundo(chao_img);
                            grid[i][j].setAcessorio(gerador_img);
                            break;

                        case t:
                            grid[i][j].setFundo(chao_img);
                            break;

                        case g:
                            grid[i][j].setFundo(chao_img);
                            break;

                        case r:
                            grid[i][j].setFundo(chao_img);
                            break;
                    }
                }
            }

        }
    }
}