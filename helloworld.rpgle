**free

ctl-opt dftactgrp(*no);

dcl-s mytext char(25);

//Dcl-PR printf Int(10) extproc('printf'); With built-in function in C
// input Pointer value options(*string);
//End-PR;

mytext = 'Hello World';
//printf(mytext);

dsply mytext;

return;
