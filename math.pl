add(N1, N2, N):-
    add1(N1, N2, N,
         0,0,
         [0,1,2,3,4,5,6,7,8,9],_).

add1([],[],[],0,0,Num,Num).

add1([D1|N1],[D2|N2],[D|N],C1,C,Num1,Num):-
    add1(N1,N2,N,C1,C2,Num1,Num2),
    addnums(D1,D2,C2,D,C,Num2,Num).

addnums(D1,D2,C1,D,C,Num1,Num):-
    deleteNumber(D1,Num1,Num2),
    deleteNumber(D2,Num2,Num3),
    deleteNumber(D,Num3, Num),
    S is D1 + D2 + C1,
    D is mod(S,10),
    C is div(S,10).

deleteNumber(A,L,L):-
    nonvar(A),!.

deleteNumber(A,[A|L],L).

deleteNumber(A,[B|L],[B|L1]):-
    deleteNumber(A,L,L1).

task1([D,O,N,A,L,D],
      [G,E,R,A,L,D],
      [R,O,B,E,R,T]).

task2([0, S, E, N, D],
 [0, M, O, R, E],
 [M, O, N, E, Y]).


