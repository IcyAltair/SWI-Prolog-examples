condition(right,right,right,right,_):-
write('Arrived'),nl,nl,
write('Reversed order:'),nl,nl.

condition(Man,Wolf,Goat,_,_):-
Wolf=Goat,not(Goat=Man),write('Goat is eaten'),nl,nl,!,fail.

condition(Man,_,Goat,Cabbage,_):-
Cabbage=Goat,not(Goat=Man),write('Cabbage is eaten'),nl,nl,!,fail.

condition(right,Wolf,Goat,Cabbage,Last):-
not(Last=none),write('Go empty to left coast'),nl,nl,
condition(left,Wolf,Goat,Cabbage,nothing),write('Go empty to left coast'),nl,nl.

condition(Together,Together,Goat,Cabbage,Last):-
not(Last=wolf),opposite(Together,Other),
write('Wolf is driven on '),write(Other),nl,nl,
condition(Other,Other,Goat,Cabbage,wolf),
write('Wolf is driven on '),write(Other),nl,nl.

condition(Together,Wolf,Together,Cabbage,Last):-
not(Last=goat),opposite(Together,Other),
write('Goat is driven on '),write(Other),nl,nl,
condition(Other, Wolf, Other,Cabbage,goat),
write('Goat is driven on '),write(Other),nl,nl.

condition(Together,Wolf,Goat,Together,Last):-
not(Last=cabbage),opposite(Together,Other),
write('Cabbage is driven on '),write(Other),nl,nl,
condition(Other,Wolf,Goat,Other,cabbage),
write('Cabbage is driven on '),write(Other),nl,nl.

condition(left,Wolf,Goat,Cabbage,Last):-
not(Last=none),
write('Go empty to right coast'),nl,nl,
condition(right,Wolf,Goat,Cabbage,nothing),
write('Go empty to right coast'),nl,nl.

opposite(right,left).
opposite(left,right).
