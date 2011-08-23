reverser([], []).
reverser([Head|Tail], Reversed) :- reverser(Tail, [Tail|Head]).
