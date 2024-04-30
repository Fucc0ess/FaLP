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

% Задание 3
% 6. Дан целочисленный массив. Необходимо осуществить циклический сдвиг элементов массива влево на три позиции
% left3_shift(+N) - предикат, отвечающий за проверку входных данных и за вход в программу
% read_list(-List, +N) - предикат, отвечающий за считывание массива
% left3_shift(+List, -NList) - предикат, отвечающий за основную логику работы. Выполняет циклический сдвиг на 3 элемента влево
% write_list(+List) - предикат, отвечающий за вывод массива
left3_shift(N) :- (N < 4 -> write('N must be equal or greater than 4'), fail; read_list(List, N), left3_shift(List, NList), write_list(NList)).
left3_shift([H1,H2,H3|T], NList) :- append(T, [H1,H2,H3], NList).

% 19. Дан целочисленный массив. Необходимо осуществить циклический сдвиг элементов массива вправо на одну позицию
% right_shift(+N) - предикат, отвечающий за проверку входных данных и за вход в программу
% read_list(-List, +N) - предикат, отвечающий за считывание массива
% right_shift(+List, -Last, -NList) - предикат, отвечающий за основную логику работы. Выполняет циклический сдвиг на 1 элемент вправо
% write_list(+List) - предикат, отвечающий за вывод массива
right_shift(N) :- (N < 2 -> write('N must be equal or greater than 2'), fail; read_list(List, N), right_shift(List, Last, NewList), append([Last], NewList, NList), write_list(NList)).
right_shift([], _, _) :- !.
right_shift([H|T], Last, NList) :- right_shift(T, Last, CurList), (T == [] -> Last is H; append([H], CurList, NList)).

% 33. Дан целочисленный массив. Проверить, чередуются ли в нем положительные и отрицательные числа
% alt_check(+N) - предикат, отвечающий за проверку входных данных и за вход в программу
% read_list(-List, +N) - предикат, отвечающий за считывание массива
% alt_check(+List, -NList) - предикат, отвечающий за основную логику работы. Выполняет проверку чередования положительных и отрицательных элементов в массиве
alt_check(N) :- (N < 2 -> write('N must be equal or greater than 2'), fail; read_list(List, N), alt_chk(List)).
alt_chk([H1,H2|T]) :- (((H1 < 0, H2 > 0); (H1 > 0, H2 < 0)) -> (T == [] -> !; append([H2],T, CurList), alt_chk(CurList)); fail).

% Задание 5
% Найти сумму непростых делителей числа.
% sum_del_call(+X) - предикат, отвечающий за выхов основного предиката и вывод ответа
% sum_del_call(+X, +CurDel, -Sum, +CurSum) - предикат, отвечающий за основную логику работы. Выполняет нахождение делителей числа, и их суммирование после проверки простоты
% dividers_up(+X, -N) - предикат, считающий количество делителей числа
sum_del_call(X) :- sum_del(X, 2, Sum, 0), write(Sum).

sum_del(X, X, FSum, Sum) :- dividers_up(X, N), (N > 2 -> FSum is Sum + X; FSum is Sum), !.
sum_del(X, CurDel, Sum, CurSum) :- NewDel is CurDel + 1, Ost is (X mod CurDel), (Ost == 0 -> dividers_up(CurDel, N), (N > 2 -> NSum is CurSum + CurDel; NSum is CurSum); NSum is CurSum), sum_del(X, NewDel, Sum, NSum).

% Найти количество чисел, не являющихся делителями исходного числа, не взаимно простых с ним и взаимно простых с суммой простых цифр этого числа
% kol_chisl_call(+X) - предикат, отвечающий за выхов основного предиката и вывод ответа
% two_way_prime(+X, +Y, +Del) - предикат, проверяющий 2 числа на взаимную простоту
% prime_cifr_sum(+X, -Sum, +CurSum) - предикат, суммирующий простые цифры числа
% dividers_down(+X, -N) - предикат, считающий количество делителей числа
% kol_chisl(+X, +CurChisl, -N, +CurN) - предикат, отвечающий за основную логику работы. Выполняет подсчёт количества удовлетворяющих условиям чисел
kol_chisl_call(X) :- kol_chisl(X, 2, N, 0), write(N).

two_way_prime(X, Y, X) :- OstXY is X mod Y, OstYX is Y mod X, ((OstXY == 0; OstYX == 0) -> fail; true), !.
two_way_prime(X, Y, Del) :- NewDel is Del + 1, OstX is X mod Del, OstY is Y mod Del, (OstX == 0, OstY == 0 -> fail, !; two_way_prime(X, Y, NewDel)).

prime_cifr_sum(0, Sum, Sum) :- !.
prime_cifr_sum(X, Sum, CurSum) :- CurCifr is (X mod 10), X1 is X//10, dividers_down(CurCifr, N), (N == 2 -> NewSum is CurSum + CurCifr; NewSum is CurSum), prime_cifr_sum(X1, Sum, NewSum).

kol_chisl(X, X, N, N) :- !.
kol_chisl(X, CurChisl, N, CurN) :- NewChisl is CurChisl + 1, ((not(two_way_prime(X, CurChisl, 2)), prime_cifr_sum(X, S, 0), two_way_prime(CurChisl, S, 2)) -> NewN is CurN + 1; NewN is CurN), kol_chisl(X, NewChisl, N, NewN).

% Задание 6
% Найдите сумму всех чисел, которые равны сумме факториала их цифр
% task6_call(+X) - предикат, отвечающий за выхов основного предиката и вывод ответа
% sum_fact(+X, -Sum, +CurSum) - предикат, вычисляющий сумму факториалов цифр числа X
% fact_up(+CurX, -N) - предикат, вычисляющий факториал числа X
% int_num(+CurX, -Sum, +CurSum) - предикат, отвечающий за основную логику работы. Вычисляет сумму чисел, удовлетворяющих условиям задачи
sum_fact(0, Sum, Sum) :- !.
sum_fact(X, Sum, CurSum) :- X1 is X//10, CurX is X mod 10, fact_up(CurX, F), NewSum is CurSum + F, sum_fact(X1, Sum, NewSum).

task6_call(X) :- int_num(X, Sum, 0), write(Sum).

int_num(9, Sum, Sum) :- !.
int_num(CurX, Sum, CurSum) :- NewX is CurX - 1, sum_fact(CurX, SumFact, 0), (CurX == SumFact -> NewSum is CurSum + CurX; NewSum is CurSum), int_num(NewX, Sum, NewSum).

% Задание 7
% 42. Дан целочисленный массив. Найти все элементы, которые меньше среднего арифметического элементов массива
% task71_call(+N) - предикат, отвечающий за выхов основного предиката и вывод ответа
% read_list(-List, +N) - предикат, отвечающий за считывание массива
% write_list(+List) - предикат, отвечающий за вывод массива
% list_sum(+List, -Sum, +CurSum) - предикат, считающий сумму элементов массива
% over_avg(+List, +Avg, -NewList, +CurList) - предикат, проверяющий элементы массива на условие задачи и добавляющий их в новый массив при положительном результате
task71_call(N) :- read_list(List, N), list_sum(List, Sum, 0), Avg is (Sum/N), over_avg(List, Avg, NewList, []), write_list(NewList).

list_sum([], Sum, Sum) :- !.
list_sum([H|T], Sum, CurSum) :- NewSum is CurSum + H, list_sum(T, Sum, NewSum).

over_avg([], _, List, List) :- !.
over_avg([H|T], Avg, List, CurList) :- ((H > Avg) -> append(CurList, [H], NewList); append(CurList, [], NewList)), over_avg(T, Avg, List, NewList).

% 45. Дан целочисленный массив и интервал a..b. Необходимо найти сумму элементов, значение которых попадает в этот интервал
% task72_call(+N, +A, +B) - предикат, отвечающий за выхов основного предиката и вывод ответа
% read_list(-List, +N) - предикат, отвечающий за считывание массива
% list_sumab(+List, +A, +B, -Sum, +CurSum) - предикат, отвечающий за проверку принадлежности элементов массива интервалу (a,b) и добавляющий их в новый массив при положительном результате
task72_call(N, A, B) :- read_list(List, N), list_sumab(List, A, B, Sum, 0), write(Sum).

list_sumab([], _, _, Sum, Sum) :- !.
list_sumab([H|T], A, B, Sum, CurSum) :- ((H > A, H < B) -> NewSum is CurSum + H, !; NewSum is CurSum), list_sumab(T, A, B, Sum, NewSum).

% 49. Для введенного списка положительных чисел построить список всех положительных простых делителей элементов списка без повторений
% task73_call(+N) - предикат, отвечающий за выхов основного предиката и вывод ответа
% read_list(-List, +N) - предикат, отвечающий за считывание массива
% write_list(+List) - предикат, отвечающий за вывод массива
% list_check() - предикат, отвечающий за проход по списку и вызов предиката find_dividers
% find_dividers() - предикат, отвечающий за нахождение простых делителей X и вызов предиката add_dividers
% add_dividers() - предикат, отвечающий за проверку элемента на уникальность и добавление его в общий массив
task73_call(N) :- read_list(List, N), list_check(List, NewList, []), write_list(NewList).

list_check([], List, List) :- !.
list_check([H|T], List, CurList) :- find_dividers(H, 1, NewList, CurList), list_check(T, List, NewList).

find_dividers(X, X, List, CurList) :- dividers_down(X, N), (N == 2 -> add_dividers(X, CurList, List, CurList); append(CurList, [], List)), !.
find_dividers(X, CurDel, List, CurList) :- NewDel is CurDel + 1, Ost is X mod CurDel, (Ost == 0 -> dividers_down(CurDel, N), (N == 2 -> add_dividers(CurDel, CurList, NewList, CurList); append(CurList, [], NewList)); append(CurList, [], NewList)), find_dividers(X, NewDel, List, NewList).

add_dividers(X, [], List, FullList) :- append(FullList, [X], List), !.
add_dividers(X, [H|T], List, FullList) :- (not(X == H) -> add_dividers(X, T, List, FullList); append(FullList, [], List)).

% 60. Дан список. Построить массив из элементов, делящихся на свой номер и встречающихся в исходном массиве 1 раз
% task74_call(+N) - предикат, отвечающий за выхов основного предиката и вывод ответа
% read_list(-List, +N) - предикат, отвечающий за считывание массива
% write_list(+List) - предикат, отвечающий за вывод массива
% list_check74(+List, +N, -List, +CurList) - предикат, проверяющий элементы массива на делимость на их номер, вызывающий предикат check_exclusive для проверки уникальности элемента, добавляющий элемент в новый список при положительном результате обеих проверок
% check_exclusive(+X, +List) - предикат, проверяющий X на уникальность в List
task74_call(N) :- read_list(List, N), list_check74(List, 1, NewList, []), write_list(NewList).

list_check74([], _, List, List) :- !.
list_check74([H|T], N, List, CurList) :- N1 is N + 1, Ost is H mod N, (Ost == 0, check_exclusive(H, T) -> append(CurList, [H], NewList), !; append(CurList, [], NewList)), list_check74(T, N1, List, NewList).

check_exclusive(_, []) :- !.
check_exclusive(X, [H|T]) :- (not(X == H) -> check_exclusive(X, T); fail).
