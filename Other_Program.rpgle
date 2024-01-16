**FREE
Ctl-Opt dftactgrp(*no);

dcl-pr rand int(10) extproc('rand');
end-pr;

dcl-s Ex int(3);

Ex= Exo5();
dsply Ex;
return ;

dcl-proc Exo1;
    dcl-pi *n int(3);
    end-pi;
// Déclaration des variables
    dcl-s Number int(3);
    dcl-s Carre int(3);

    dsply 'Quel nombre : ' '' Number;

    Carre = Number * Number;

    return Carre;
end-proc;

dcl-proc Exo2;
    dcl-pi *n int(3);
    END-PI;
// Déclaration des variables
    dcl-s Number int(3);
    dcl-s Result int(3);
    dsply 'Quel nombre : ' '' Number;

    if (Number > 0);
        Result = 1;
    elseif (Number = 0);
        Result = 0;
    else;
        Result = -1;
    Endif;

    Return Result;
end-proc;

dcl-proc Exo3;
    dcl-pi *n int(3);
    end-pi;
// Déclaration des variables
    dcl-s Result int(3);

    dcl-s VariableA int(3);
    dcl-s VariableB int(3);
    dcl-s VariableC int(3);

    dsply 'Si renvoie 1 = Bonne ordre sinon mauvais ordre';

    dsply 'Quel nombre : ' '' VariableA;
    dsply 'Quel nombre : ' '' VariableB;
    dsply 'Quel nombre : ' '' VariableC;

    if (VariableA < VariableB) and (VariableB < VariableC);
        Result = 1;
    else;
        Result = 0;
    endif;

    return Result;
end-proc;

dcl-proc Exo4;
    dcl-pi *n int(3);
    end-pi;
// Déclaration des variables
    dcl-s Number int(3);
    dcl-s i int(3);

    dsply 'Quel nombre : ' '' Number;

    for i = 1 to 10;
        dsply (Number + i);
    endfor;

    return Number;
end-proc;

dcl-proc Exo5;
    dcl-pi *n int(3);
    end-pi;
// Déclaration des variables
    dcl-s Number int(3);
    dcl-s i int(3);

    dsply 'Quel nombre : ' '' Number;

    for i = 1 to 10;
        dsply (Number * i);
    endfor;

    return Number;
end-proc;

dcl-proc Exo6;
    dcl-pi *n int(3);
    end-pi;
// Déclaration des variables
    dcl-s MonTab int(3) dim(5);
    dcl-s nombre_aleatoire int(3);
    dcl-s i int(3);
    dcl-s note_min int(3) inz(20);
// Remplissage du tableau
    for i=1 to 5;
        nombre_aleatoire = %rem(rand():20);
        MonTab(i) = nombre_aleatoire;
        nombre_aleatoire = 0;
    endfor;

    for i=1 to 5;
        if (MonTab(i) < note_min);
            note_min = MonTab(i);
        endif;
    endfor;

    return note_min;
end-proc;

dcl-proc Exo7;
    dcl-pi *n int(3);
    end-pi;
// Déclaration des variables
    dcl-s MonTab int(3) dim(5);
    dcl-s nombre_aleatoire int(3);
    dcl-s i int(3);
    dcl-s note_max int(3) inz(0);
// Remplissage du tableau
    for i=1 to 5;
        nombre_aleatoire = %rem(rand():20);
        MonTab(i) = nombre_aleatoire;
        nombre_aleatoire = 0;
    endfor;

    for i=1 to 5;
        if (MonTab(i) > note_max);
            note_max = MonTab(i);
        endif;
    endfor;

    return note_max;
end-proc;

dcl-proc Exo8;
    dcl-pi *n int(3);
    end-pi;
// Déclaration des variables
    dcl-s MonTab int(3) dim(5);
    dcl-s nombre_aleatoire int(3);
    dcl-s nombre_a_trouver int(3);
    dcl-s i int(3);
// Remplissage du tableau
    for i=1 to 5;
        nombre_aleatoire = %rem(rand():20);
        MonTab(i) = nombre_aleatoire;
        nombre_aleatoire =0;
        dsply MonTab(i);
    endfor;

    nombre_a_trouver = %rem(rand():20);
    dsply nombre_a_trouver;

    for i=1 to 5;
        if (MonTab(i) = nombre_a_trouver);
            return i;
        else;
            return -1;
        endif;
    endfor;
end-proc;

dcl-proc TriBulleCroissant;
    dcl-pi *n;
    a int(3) dim(5);
    end-pi;
// Déclaration des variables
    dcl-s i int(3);
    dcl-s j int(3);
    dcl-s temp int(3);

    for i=1 to 5;
        for j=1 to 5-i;
            if a(j) > a(j+1);
                temp = a(j);
                a(j) = a(j+1);
                a(j+1) = temp;
            endif;
        endfor;
    endfor;

    for i=1 to 5;
        dsply a(i);
    endfor;

end-proc;

dcl-proc RechercheDichotomie;
    dcl-pi *n int(3);
    a int(3) dim(5);
    note int(3);
    end-pi;
// Déclaration des variables
    dcl-s gauche int(3) inz(0);
    dcl-s droite int(3);
    dcl-s milieu int(3);
    dcl-s i int(3);
    dcl-s cpt int(3);

    for i=1 to 5;
        cpt = cpt + 1;
    endfor;
    droite = cpt-1;

    dow (gauche <= droite);
        milieu = gauche + (droite - gauche) / 2;
        if (a(milieu) = note);
            return milieu;
        elseif (a(milieu) < note);
            gauche = milieu +1;
        else;
            droite = milieu -1;
        endif;
    enddo;

    return -1;
end-proc;

dcl-proc Exo9;
    dcl-pi *n int(3);
    end-pi;
// Déclaration des variables
    dcl-s MonTab int(3) dim(5);
    dcl-s nombre_aleatoire int(3);
    dcl-s i int(3);
    dcl-s nombre_a_trouver int(3);
    dcl-s indice int(3);
// Remplissage du tableau
    for i=1 to 5;
        nombre_aleatoire = %rem(rand():20);
        MonTab(i) = nombre_aleatoire;
        nombre_aleatoire = 0;
    endfor;

    nombre_a_trouver = %rem(rand():20);
    dsply ('Le nombre a trouvé est ' + %char(nombre_a_trouver));

    TriBulleCroissant(MonTab);
    indice = RechercheDichotomie(MonTab : nombre_a_trouver);

    if (indice > 0);
        dsply indice;
    else;
        dsply 'Le nombre est pas dans la liste';
    endif;

    return 1;
end-proc;

dcl-proc Exo10;
    dcl-pi *n int(3);
    end-pi;

    dcl-s a int(3);
    dcl-s b int(3);
    dcl-s c int(3);
    dcl-s Delta float(8);
    dcl-s Nb_Sol int(3) inz(0);
    dcl-s x0 float(8);
    dcl-s x1 float(8);
    dcl-s x2 float(8);

    dsply 'Saisir a' '' a;
    dsply 'Saisir b' '' b;
    dsply 'Saisir c' '' c;

    Delta = b * b - 4 * a * c;

    if (Delta > 0);
        Nb_Sol += 2;
        x1 = (-b - %sqrt(Delta) / 2 * a);
        x2 = (-b + %sqrt(Delta) / 2 * a);
        dsply ('Delta vaut ' + %char(Delta));
        dsply ('Le nombre de solution est ' + %char(Nb_Sol));
        dsply 'Les solutions sont :';
        dsply x1;
        dsply x2;
    elseif (Delta = 0);
        Nb_Sol += 1;
        x0 = (-b / ( 2 * a));
        dsply ('Delta vaut ' + %char(Delta));
        dsply ('Le nombre de solution est ' + %char(Nb_Sol));
        dsply ('Les solutions sont ' + %char(x0));
    else;
        dsply 'Il existe pas de solutions';
    endif;
    return 1;
end-proc;
