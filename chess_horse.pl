horse(N) :-
	Max is N * N,
	length(L, Max),
	horse(N, 0, Max, 0, 0, L),
	display(N, 0, L).


horse(_, Max, Max, _, _, _) :- !.

horse(NColumns, N, NMaxMoves, Line, Column, L) :-
	
	Line >= 0, Column >= 0, Line < NColumns, Column < NColumns,

	Pos is Line * NColumns + Column,
	N1 is N+1,
	
	nth0(Pos, L, N1),

	LineM1 is Line - 1, LineM2 is Line - 2, LineP1 is Line + 1, LineP2 is Line + 2,
	ColumnM1 is Column - 1, ColumnM2 is Column - 2, ColumnP1 is Column + 1, ColumnP2 is Column + 2,
	maplist(bestMove(NColumns, L),
		[(LineP1, ColumnM2), (LineP2, ColumnM1), (LineP2, ColumnP1),(LineP1, ColumnP2),
		 (LineM1, ColumnM2), (LineM2, ColumnM1), (LineM2, ColumnP1),(LineM1, ColumnP2)],
		R),
	sort(R, RS),
	pairs_values(RS, Moves),

	move(NColumns, N1, NMaxMoves, Moves, L).

move(NColumns, N1, NMaxMoves, [(Line, Column) | R], L) :-
	horse(NColumns, N1, NMaxMoves, Line, Column, L);
	move(NColumns, N1, NMaxMoves,  R, L).


bestMove(NColumns, _L, (Line, Column), 1000-(Line, Column)) :-
	(   Line < 0 ; Column < 0; Line >= NColumns; Column >= NColumns), !.

bestMove(NColumns, L, (Line, Column), 1000-(Line, Column)) :-
	Pos is Line*NColumns+Column,
	nth0(Pos, L, V),
	\+var(V), !.


bestMove(NColumns, L, (Line, Column), R-(Line, Column)) :-
	LineM1 is Line - 1, LineM2 is Line - 2, LineP1 is Line + 1, LineP2 is Line + 2,
	ColumnM1 is Column - 1, ColumnM2 is Column - 2, ColumnP1 is Column + 1, ColumnP2 is Column + 2,
	include(possibleMove(NColumns, L),
		[(LineP1, ColumnM2), (LineP2, ColumnM1), (LineP2, ColumnP1),(LineP1, ColumnP2),
		 (LineM1, ColumnM2), (LineM2, ColumnM1), (LineM2, ColumnP1),(LineM1, ColumnP2)],
		Res),
	length(Res, Len),
	(   Len = 0 -> R = 1000; R = Len).


possibleMove(NColumns, L, (Line, Column)) :-	
	Line >= 0, Column >= 0, Line < NColumns, Column < NColumns,
	Pos is Line * NColumns + Column,	
	nth0(Pos, L, V),
	var(V).


display(_, _, []).
display(N, N, L) :-
	nl,
	display(N, 0, L).

display(N, M, [H | T]) :-
	writef('%3r', [H]),
	M1 is M + 1,
	display(N, M1, T).

