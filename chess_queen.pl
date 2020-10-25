ferz(0,_,[],[8,7,6,5,4,3,2,1]):-!.

ferz(8,M,[[8,X]|A],C):-
    L is M+1,
    ferz(7,L,A,B),
    choose(X,B,C),
    may([8,X],A),!.

ferz(N,M,[[N,X]|A],C):-
    K is N-1,
    L is M+1,
    ferz(K,L,A,B),
    choose(X,B,C),
    may([N,X],A).

choose(X,[X|A],A).
choose(X,[Y|A],[Y|B]):-
    choose(X,A,B).

may(_,[]):-!.
may(A,[B|C]):-
    not(notfree(A,B)),
    may(A,C).

notfree([A,_],[A,_]):-!.
notfree([_,A],[_,A]):-!.
notfree([A,B],[C,D]):-
    K is A-C,abst(K,E),
    L is B-D,abst(L,F),
    E is F.

abst(X,Y):-
    X<0,!,
    Y is -1 * X.
abst(X,X).

ferzi(A):-
    ferz(8,0,A,[]).
