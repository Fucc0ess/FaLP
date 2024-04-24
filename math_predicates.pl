% Задание 1
% max(+X,+Y,+U,-Z) - максимум из 3 чисел
max(X,Y,U,X) :- X>U, X>Y, !.
max(_,Y,U,Y) :- Y>U, !.
max(_,_,U,U).

% fact_up(+N, -X) - факториал вверх
fact_up(0,1) :- !.
fact_up(N,X) :- N1 is N-1, fact_up(N1,X1), X is N*X1.

% fact_down(+N, -X) - факториал вниз
fact_down(N,X) :- fact_down(0,1,N,X).
fact_down(N,Y,N,Y) :- !.
fact_down(I,Y,N,X) :- I1 is I+1, Y1 is Y*I1, fact_down(I1,Y1,N,X).

% sum_cifr_up(+X, -SummCifr) - сумма цифр вверх
sum_cifr_up(0, 0):- !.
sum_cifr_up(X, SummCifr):- X1 is X // 10, Ost is X mod 10, sum_cifr_up(X1, SummCifr1), SummCifr is SummCifr1 + Ost.

% sum_cifr_down(+N, -X) - сумма цифр вниз
sum_cifr_down(N, X):- sum_cifr_down(N, 0, X).
sum_cifr_down(0, X, X):- !.
sum_cifr_down(N, CurX, X):- N1 is N // 10, Ost is N mod 10, NewX is CurX + Ost, sum_cifr_down(N1, NewX, X).

% free_from_square(+X) - проверка, свободное ли число от квадратов
free_from_square(X) :- MaxDel is X - 1, free_from_square(2, MaxDel, X), !, true.
free_from_square(MaxDel, MaxDel, X) :- !.
free_from_square(N, MaxDel, X) :- Square is N * N, Ost is X mod Square, Ost \= 0, NextN is N + 1, free_from_square(NextN, MaxDel, X).

% read_list(-List, +N) - ввод списка с клавиатуры, N - количество элементов
read_list(List,N) :- read_list(List,N,0,[]).
read_list(List,N,N,List) :- !.
read_list(List,N,K,B) :- read(X), append(B,[X],B1), K1 is K+1, read_list(List,N,K1,B1).

% write_list(+List) - напечатать список
write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

% delete_sum(+List, +Sum, -NL) - удаление из списка чисел, сумма цифр которых равна заданной
delete_sum([], _, _) :- !.
delete_sum([H|T], Sum, NL) :- delete_sum(T, Sum, NL1), sum_cifr_up(H, X), (not(X == Sum) -> append(NL1, [H], NL); append(NL1, [], NL)).

% Задание 2
% min_cifr_up(+X, -N) - минимальная цифра числа вверх
min_cifr_up(0, 9) :- !.
min_cifr_up(X, N) :- X1 is X//10, min_cifr_up(X1, N1), XL is X mod 10, ((XL < N1) -> N is XL; N is N1). 

% min_cifr_down(+X, -N) - минимальная цифра числа вниз
min_cifr_down(X, N) :- min_cifr_down(X, 9, N).
min_cifr_down(0, N, N) :- !.
min_cifr_down(X, N1, N) :- XL is (X mod 10), ((XL < N1) -> NewN is XL; NewN is N1), X1 is X//10, min_cifr_down(X1, NewN, N).

% less3_up(+X, -N) - количество цифр числа, меньших 3, вверх
less3_up(0, 0) :- !.
less3_up(X, N) :- X1 is X//10, less3_up(X1, N1), XL is (X mod 10), ((XL < 3) -> N is N1 + 1; N is N1).

% less3_down(+X, -N) - количество цифр числа, меньших 3, вниз
less3_down(X, N) :- less3_down(X, 0, N).
less3_down(0, N, N) :- !.
less3_down(X, N1, N) :- XL is (X mod 10), ((XL < 3) -> NewN is N1 + 1; NewN is N1), X1 is X//10, less3_down(X1, NewN, N).

% dividers_up(+X, -N) - количество делителей вверх
dividers_up(X, N) :- dividers_up(X, 1, N).
dividers_up(X, X, 1) :- !.
dividers_up(X, D, N) :- D1 is D + 1, dividers_up(X, D1, N1), Ost is (X mod D), ((Ost == 0) -> N is N1 + 1; N is N1).

% dividers_down(+X, -N) - количество делителей вниз
dividers_down(X, N) :- dividers_down(X, N, 1, 1).
dividers_down(X, C, X, C) :- !.
dividers_down(X, Count, CurDel, CurCount) :- Ost is (X mod CurDel), ((Ost == 0) -> NewCount is CurCount + 1; NewCount is CurCount), NewDel is CurDel + 1, dividers_down(X, Count, NewDel, NewCount).
