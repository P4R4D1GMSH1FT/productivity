% predicate to find the maximum value in a list
max_list([X], X).
max_list([H|T], Max) :-
    max_list(T, MaxT),
    (H > MaxT -> Max = H ; Max = MaxT).

% predicate to find the minimum value in a list
min_list([X], X).
min_list([H|T], Min) :-
    min_list(T, MinT),
    (H < MinT -> Min = H ; Min = MinT).