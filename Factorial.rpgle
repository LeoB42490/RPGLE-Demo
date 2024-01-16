**free
Ctl-Opt dftactgrp(*no);

dcl-pi *n;
end-pi;
dcl-s a int(3);

dow 1=1;
  a=player_turn();
  dsply facto(a);
  return;
enddo;

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

dcl-proc input;                // Request to user
    dcl-pi *n varchar(26);
        msg varchar(26);
    end-pi;

    dcl-s user_input varchar(26);

    dsply msg '' user_input;
    return user_input;
end-proc;


dcl-proc facto;
    dcl-pi *n int(20);
      a int(3) value;
    end-pi;
    if a <= 1;
      return 1;
    endif;
    return a * facto(a-1);
end-proc;
