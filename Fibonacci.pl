fibonacci(0,0):-!.
fibonacci(1,1):-!.

fibonacci(X,Y):-
    T is X-1,
    Z is X-2,
    fibonacci(T,A),
    fibonacci(Z,B),
    Y is A+B.


