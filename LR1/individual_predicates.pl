%Задание 1
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

men :- man(X), write(X), nl, fail. %men - вывод всех мужчин
women :- woman(X), write(X), nl, fail. %women - вывод всех женщин
children(X) :- parent(X, Y), write(Y), nl, fail. %children(+X) - вывод всех детей X
mother(X, Y) :- parent(X, Y), woman(X). %mother(?X, +Y) - +X проверка является ли X матерью Y; -X вывод матери Y
mother(X) :- mother(Y, X), write(Y). %mother(+X) - вывод матери X
brother(X, Y) :- parent(Z, X), parent(Z, Y), man(Z), man(X). %brother(?X, +Y) - +X проверка является ли X братом Y; -X вывод брата Y
brothers(X) :- brother(Y, X), not(Y==X), write(Y), nl, fail. %brothers(+X) - вывод всех братьев X

b_s(X, Y) :- parent(Z, X), parent(Z, Y), man(Z), not(X==Y). %b_s(+X, ?Y) - +Y проверка являются ли X и Y братьями, или сестрами, или братом и сестрой; -Y вывод брата/сестры X
b_s(X) :- b_s(X, Y), not(X==Y), write(Y), nl, fail. %b_s(+X) - вывод всех братьев и сестёр X


