%:- set_prolog_stack(global, limit(100 000 000 000)).

tailFactorTemp(A,B,A,B):-!.

tailFactorTemp(C,D,A,B):-
    E is C+1,
    F is D*E,
    (   E<A -> tailFactorTemp(E,F,A,B);write(F)).


tailFactor(A,B):-
   tailFactorTemp(0,1,A,B).



