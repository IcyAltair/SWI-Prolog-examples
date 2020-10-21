%:- set_prolog_stack(global, limit(100 000 000 000)).
tailFibonacci(0,_,0).
tailFibonacci(1,0,1).

tailFibonacci(N,V1,V):-
    N>1,N1 is N-1,
    tailFibonacci(N1,V2,V1),
    V is V1+V2.




