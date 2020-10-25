mov(1, A, _, Z, [[A, Z]]).

mov(N, A, [H|R], Z, P) :-
    M1 is (N - floor(sqrt(2*N + 1)) + 1),
    M2 is (N - M1),
    mov(M1, A, [Z|R], H, S),
    mov(M2, A, R    , Z, T),
    mov(M1, H, [A|R], Z, U),
    append(S, T, Q),
    append(Q, U, P).
