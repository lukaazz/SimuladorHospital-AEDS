//definir grid, terminar switch case

int tamanho = 24;
int largura_celula = width / tamanho;
int altura_celula = height / tamanho;

enum Celulas { 
    #, ., a, m, e, t, g, r
}

PImage[] chao_img = new PImage[];
PImage[] parede_img = new PImage[];

void inicializarImagens() {
    chao_img = loadImage("tilefloor.png");
    parede_img = loadImage("tilewall.png");
}

void inicializarGrid() {
    int i, j;

    for(i = 0; i < tamanho; i++) {
        for(j = 0; j < tamanho; i++) {


            switch (i) {
                case 1:
                    
            }

        }
    }
}