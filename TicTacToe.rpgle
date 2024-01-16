**free
Ctl-Opt dftactgrp(*no) bnddir('QC2LE');

dcl-pr exit extproc('exit'); // Exit programme
  status int(3) value;
end-pr;

dcl-pr srand extproc('srand');
    seed uns(10) value;
end-pr;

dcl-pr rand int(10) extproc('rand');
end-pr;

dcl-pr clock int(10) extproc('clock');
end-pr;

dcl-c PLAYER_SYMBOL const('X');
dcl-c AI_SYMBOL const('O');
dcl-c PLAYER const(1);
dcl-c AI const(2);

srand(clock());
tictactoe();                   // lancement du programme
return;

dcl-proc input;                // Demande à l'utilisateur
    dcl-pi *n varchar(26);
        msg varchar(26);
    end-pi;

    dcl-s user_input varchar(26);

    dsply msg '' user_input;
    return user_input;
end-proc;

dcl-proc get_player;
    dcl-pi *n int(3);
        symbol char(1);
    end-pi;

    if symbol = AI_SYMBOL;
        return AI;
    endif;
    return PLAYER;
end-proc;

dcl-proc has_won;
    dcl-pi *n int(3); // returns 1 for player, 2 for AI and 0 for no winner, 3 for tie
        grid char(1) dim(9);
    end-pi;

    dcl-s start int(3);
    dcl-s line int(3);
    dcl-s col int(3);
    dcl-s is_grid_full int(3) inz(1);

    for line = 0 to 2;
        start = line * 3 + 1;
        if grid(start) = grid(start + 1) and grid(start) = grid(start + 2) and grid(start) <> '_';
            return get_player(grid(start));
        endif;
    endfor;

    for col = 0 to 2;
        if grid(col + 1) = grid(col + 4) and grid(col + 1) = grid(col + 7) and grid(col + 1) <> '_';
            return get_player(grid(col + 1));
        endif;
    endfor;

    if grid(1) = grid(5) and grid(1) = grid(9) and grid(1) <> '_';
        return get_player(grid(1));
    endif;
    if grid(3) = grid(5) and grid(3) = grid(7) and grid(3) <> '_';
        return get_player(grid(3));
    endif;

    for start = 1 to 9;
        if grid(start) = '_';
            is_grid_full = 0;
            leave;
        endif;
    endfor;
    if is_grid_full = 1;
        return 3; // tie
    endif;

    return 0;
end-proc;

dcl-proc player_turn;
    dcl-pi *n;
        grid char(1) dim(9);
    end-pi;

    dcl-s player_input varchar(26);
    dcl-s n uns(3);
    player_input = 'Quelle case [1-9] ? ';

    dow n=n;
        monitor;
            n = %uns(input(player_input));
            on-error;
        endmon;
        if n <= 9 and n <> 0 and grid(n) = '_';
            leave;
        endif;
    enddo;
    grid(n) = PLAYER_SYMBOL;
end-proc;

dcl-proc ai_turn;
    dcl-pi *n;
        grid char(1) dim(9);
    end-pi;

    dcl-s i int(3);
    dcl-s n_empty int(3) inz(0);
    dcl-s turn int(3);

    for i = 1 to 9;
        if grid(i) = '_';
            n_empty += 1;
        endif;
    endfor;

    if n_empty <> 1;
        turn = %rem(rand() : n_empty);
    endif;

    for i = 1 to 9;
        if grid(i) = '_';
            if turn = 0;
                grid(i) = AI_SYMBOL;
                leave;
            else;
                turn -= 1;
            endif;
        endif;
    endfor;
end-proc;

dcl-proc display_grid;   // Affichage de la grille
    dcl-pi *n;
        grid char(1) dim(9);
    end-pi;

    dcl-s line int(3);
    dcl-s start int(3);

    for line = 0 to 2;
        start = line * 3 + 1;
        dsply ('|' + grid(start) + '|' + grid(start + 1) + '|' + grid(start + 2));
    endfor;
    dsply '---------';
end-proc;

dcl-proc dsply_end_msg;     // Affichage message fin
    dcl-pi *n;
        winner int(3);
    end-pi;

    if winner = 3;
        dsply 'Tie.';       // Egalité
        exit(0);
        return;
    elseif winner = AI;
        dsply 'AI won.';    // AI victorieux
        exit(0);
        return;
    elseif winner = PLAYER;
        dsply 'Player won.';  // Joueur victorieux
        exit(0);
        return;
    endif;
    return;
end-proc;

dcl-proc tictactoe;           // Programme de jeu
    dcl-s grid char(1) dim(9);
    dcl-s winner int(3);
    grid = %list('_' : '_' : '_' : '_' : '_' : '_' : '_' : '_' : '_');

    display_grid(grid);
    dow 1 = 1;
        ai_turn(grid);
        display_grid(grid);
        winner = has_won(grid);
        dsply_end_msg(winner);
        player_turn(grid);
        display_grid(grid);
        winner = has_won(grid);
        dsply_end_msg(winner);
    enddo;
end-proc;
