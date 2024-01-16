**free
Ctl-Opt dftactgrp(*no) bnddir('QC2LE');

dcl-pr rand int(10) extproc('rand');
end-pr;

plusmoins();
return;

dcl-proc input;                // Request to user
    dcl-pi *n varchar(26);
        msg varchar(26);
    end-pi;

    dcl-s user_input varchar(26);

    dsply msg '' user_input;
    return user_input;
end-proc;

dcl-proc player_turn;
    dcl-pi *n int(3);
    end-pi;

    dcl-s player_input varchar(26);
    dcl-s n int(3);

    player_input = 'What number :';

    dow n=n;
        monitor;
           n = %int(input(player_input));
            on-error;
        endmon;
        if n <= 100 and n >= 0;
            leave;
        endif;
    enddo;
    return n;
end-proc;

dcl-proc plusmoins;
    dcl-pi *n;
    END-pi;

    dcl-s a int(3);
    dcl-s nombre_aleatoire int(3);
    nombre_aleatoire = %rem(rand():101);

    dsply 'Welcome to Higher Smaller Game.';
    dsply 'The number to find is between 0 and 100.';
    dsply 'Good Luck !';
    dow 1 = 1;
        a=player_turn();
        if a = nombre_aleatoire;
            dsply 'It is Won';
            leave;
        elseif a > nombre_aleatoire;
            dsply 'Smaller';
        else;
            dsply 'Higher';
        endif;
    enddo;
end-proc;
