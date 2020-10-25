print_list([]).
concat_list([],L2,L2).
delete_list(_,[],L,L).
member_list(X,[X|_]).
reverse_list([],L4,L4).
split_list(_,[],[],[]).
insert_head_list(Head,Tail,[Head|Tail]).
insert_back_list([], Element, [Element]).
insert_list(Tail,X,0,[X|Tail]).

print_list([Head|Tail]):-
    write(Head),nl,
    print_list(Tail).

concat_list([X|L1],L2,[X|L3]):-
    concat_list(L1,L2,L3).

delete_list(X,[X|L],L1,L2):-
    delete_list(X,L,L1,L2).
delete_list(X,[Y|L],L1,L2):-
    X \== Y,
    delete_list(X,L,[Y|L1],L2).

member_list(X,[_|Tail]):-
    member_list(X,Tail).

reverse_list([X|L],L1,L4):-
    reverse_list(L,[X|L1],L4).

split_list(Y,[X|L],[X|L1],L2):-
    X @=< Y,
    split_list(Y,L,L1,L2).
split_list(Y,[X|L],L1,[X|L2]):-
    X @>Y,
    split_list(Y,L,L1,L2).

insert_back_list([Head|Tail], Element, [Head|TailWithElement]):-
  insert_back_list(Tail, Element, TailWithElement).

insert_list([Head|Tail],X,Pos,[Head|Tail2]):-
    Pos1 is Pos - 1,!,
    insert_list(Tail,X,Pos1,Tail2).
