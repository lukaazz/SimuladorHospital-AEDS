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
                    grid[i][j].setTipoCelula(Celulas.p);
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
                        grid[i][j].setTipoCelula(Celulas.p);
                    } else {
                        grid[i][j].setTipoCelula(Celulas.c);
                    }
                    break;

                case 2:
                case 5:
                case 8:
                    if(j >= 2 && j <= 11) {
                        grid[i][j].setTipoCelula(Celulas.a);
                    } else if(j == 0 || j == 16 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.p);
                    } else {
                        grid[i][j].setTipoCelula(Celulas.c);
                    }
                    break;

                case 3:
                    if(j == 0 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.p);
                    } else if(j == 22) {
                        grid[i][j].setTipoCelula(Celulas.m);
                    } else {
                        grid[i][j].setTipoCelula(Celulas.c);
                    }
                    break;

                case 7:
                case 15:
                    if(j == 0 || (j >= 16 && j <= 23)) {
                        grid[i][j].setTipoCelula(Celulas.p);
                    } else {
                        grid[i][j].setTipoCelula(Celulas.c);
                    }
                    break;

                case 11:
                    if(j == 0 || (j >= 3 && j <= 10) || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.p);
                    } else if(j == 22) {
                        grid[i][j].setTipoCelula(Celulas.m);
                    } else {
                        grid[i][j].setTipoCelula(Celulas.c);
                    }
                    break;
                
                case 17:
                    if(j == 0 || j == 16 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.p);
                    } else if(j == 3) {
                        grid[i][j].setTipoCelula(Celulas.t);
                    } else {
                        grid[i][j].setTipoCelula(Celulas.c);
                    }
                    break;
                
                case 18:
                    if(j == 0 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.p);
                    } else if(j == 22) {
                        grid[i][j].setTipoCelula(Celulas.e);
                    } else {
                        grid[i][j].setTipoCelula(Celulas.c);
                    }
                    break;

                case 21:
                    if(j == 0 || j == 16 || j == 23) {
                        grid[i][j].setTipoCelula(Celulas.p);
                    } else if(j == 8) {
                        grid[i][j].setTipoCelula(Celulas.g);

                    } else if(j == 11) {
                        grid[i][j].setTipoCelula(Celulas.r);
                    } else {
                        grid[i][j].setTipoCelula(Celulas.c);
                    }
                    break;
            }
        }
    }

    int cadeiraIndex = 0;

    for(i = 0; i < tamanho; i++) {
        for(j = 0; j < tamanho; j++) {

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
                    cadeiras[cadeiraIndex] = new Cadeira(j, i);
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
}

void desenharGrid() {
    int i, j;

    for(i = 0; i < tamanho; i++) {
        for(j = 0; j < tamanho; j++) {

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