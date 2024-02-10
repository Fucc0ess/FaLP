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

men :- man(X), write(X), nl, fail. %men - âûâîä âñåõ ìóæ÷èí
women :- woman(X), write(X), nl, fail. %women - âûâîä âñåõ æåíùèí
children(X) :- parent(X, Y), write(Y), nl, fail. %children(+X) - âûâîä âñåõ äåòåé X
mother(X, Y) :- parent(X, Y), woman(X). %mother(+X, +Y) - ïðîâåðêà ÿâëÿåòñÿ ëè X ìàòåðüþ Y
mother(X) :- parent(Y, X), woman(Y), write(Y). %mother(+X) - âûâîä ìàòåðè Y
brother(X, Y) :- parent(Z, X), parent(Z, Y), man(X). %brother(+X, +Y) - ïðîâåðêà ÿâëÿåòñÿ ëè X áðàòîì Y
brothers(X) :- parent(Z, X), parent(Z, Y), not(X==Y), man(Z), man(Y), write(Y), nl, fail. %brothers(+X) - âûâîä âñåõ áðàòüåâ X
b_s(X, Y) :- parent(Z, X), parent(Z, Y). %b_s(+X, +Y) - ïðîâåðêà ÿâëÿþòñÿ ëè X è Y áðàòüÿìè, èëè ñåñòðàìè, èëè áðàòîì è ñåñòðîé
b_s(X) :- parent(Z, X), parent(Z, Y), not(X==Y), man(Z), write(Y), nl, fail. %b_s(+X) - âûâîä âñåõ áðàòüåâ è ñåñò¸ð X
