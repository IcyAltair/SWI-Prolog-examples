factor(0,1):-!.
factor(1,1):-!.

factor(X,Y):-
    T is X-1,
    factor(T,Z),
    Y is Z*X.



