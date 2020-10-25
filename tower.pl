mov(1, X, _, Z, [[X, Z]]).

mov(N, X, Y, Z, P) :-
    M is (N - 1),
    mov(M, X, Z, Y, S),
    mov(1, X, Y, Z, T),
    mov(M, Y, X, Z, U),
    append(S, T, R),
    append(R, U, P).
