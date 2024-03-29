% Задание 1
% max(+X,+Y,+U,-Z) - максимум из 3 чисел
max(X,Y,U,X) :- X>U, X>Y, !.
max(_,Y,U,Y) :- Y>U, !.
max(_,_,U,U).

% fact_up(+X, -Y) - факториал вверх
fact_up(0,1) :- !.
fact_up(N,X) :- N1 is N-1, fact_up(N1,X1), X is N*X1.

% fact_down(+X, -Y) - факториал вниз
fact_down(N,X) :- fact_down(0,1,N,X).
fact_down(N,Y,N,Y) :- !.
fact_down(I,Y,N,X) :- I1 is I+1, Y1 is Y*I1, fact_down(I1,Y1,N,X).

% sum_cifr_up(+X, -Y) - сумма цифр вверх
sum_cifr_up(0, 0):- !.
sum_cifr_up(X, SummCifr):- X1 is X // 10, Ost is X mod 10, sum_cifr_up(X1, SummCifr1), SummCifr is SummCifr1 + Ost.

% sum_cifr_down(+X, -Y) - сумма цифр вниз
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
read_list(List,N,K,B) :- read(X), append(B,[X],B1),K1 is K+1, read_list(List,N,K1,B1).

% write_list(+List) - напечатать список
write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).
