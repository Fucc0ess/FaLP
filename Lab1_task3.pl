%������� 1
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).
man(miloslav).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).
woman(bogdana).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(miloslav, lubomila).
parent(miloslav, boguslav).
parent(miloslav, veslava).
parent(miloslav, duhovlad).

parent(bogdana, lubomila).
parent(bogdana, boguslav).
parent(bogdana, veslava).
parent(bogdana, duhovlad).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

men :- man(X), write(X), nl, fail. %men - ����� ���� ������
women :- woman(X), write(X), nl, fail. %women - ����� ���� ������
children(X) :- parent(X, Y), write(Y), nl, fail. %children(+X) - ����� ���� ����� X
mother(X, Y) :- parent(X, Y), woman(X). %mother(+X, +Y) - �������� �������� �� X ������� Y
mother(X) :- parent(Y, X), woman(Y), write(Y). %mother(+X) - ����� ������ Y
brother(X, Y) :- parent(Z, X), parent(Z, Y), man(X). %brother(+X, +Y) - �������� �������� �� X ������ Y
brothers(X) :- parent(Z, X), parent(Z, Y), not(X==Y), man(Z), man(Y), write(Y), nl, fail. %brothers(+X) - ����� ���� ������� X
b_s(X, Y) :- parent(Z, X), parent(Z, Y). %b_s(+X, +Y) - �������� �������� �� X � Y ��������, ��� ��������, ��� ������ � �������
b_s(X) :- parent(Z, X), parent(Z, Y), not(X==Y), man(Z), write(Y), nl, fail. %b_s(+X) - ����� ���� ������� � ����� X

%������� 2
daughter(X, Y) :- parent(Y, X), woman(X). %daughter(+X, +Y) - �������� �������� �� X ������� Y
daughter(X) :- parent(X, Y), woman(Y), write(Y), nl, fail. %daughter(+X) - ����� ������� X
husband(X, Y) :- parent(X, Z), parent(Y, Z), man(X). %husband(+X, +Y) - �������� �������� �� X ����� Y
husband(X) :- parent(X, Z), parent(Y, Z), man(Y), not(X==Y), write(Y). %husband(+X) - ����� ���� X

%������� 3
%grand_ma(+X, +Y) - �������� �������� �� X �������� Y
grand_ma(X, Y) :- woman(X), parent(X, Z), parent(Z, Y).
%grand_ma(X, Y) :- mother(X, Z), parent(Z, Y).

grand_mas(X) :- parent(Z, X), parent(Y, Z), woman(Y), write(Y), nl, fail. %grand_mas(+X) - ����� ���� ������� X

%grand_ma_and_da(+X, +Y) - �������� �������� �� X � Y �������� � ������� ��� ������� � ��������
grand_ma_and_da(X, Y) :- woman(X), woman(Y), (parent(X, Z), parent(Z, Y); parent(Y, Z), parent(Z, X)).
% grand_ma_and_da(X, Y) :- mother(X, Z), daughter(Y, Z); mother(Y, Z),
% daughter(X, Z).

%aunt(+X, +Y) - �������� �������� �� X ���� Y
aunt(X, Y) :- woman(X), parent(Z, V), parent(V, Y), parent(Z, X).
%aunt(X, Y) :- woman(X), parent(Z, Y), b_s(Z, X).

aunts(X) :- woman(Z), parent(Z, V), parent(V, X), woman(Y), parent(Z, Y), write(Y), nl, fail. %aunts(+X) - ����� ���� ���� X
