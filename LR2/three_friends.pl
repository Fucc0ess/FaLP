% Задание 4
% Три друга заняли первое, второе, третье места в соревнованиях универсиады. Друзья разной национальности, зовут их по-разному, и любят они разные виды спорта.
% Майкл предпочитает баскетбол и играет лучше, чем американец. Израильтянин Саймон играет лучше теннисиста. Игрок в крикет занял первое место. Кто является австралийцем? Каким спортом увлекается Ричард?

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

pr_friends:- 

    Info=[_,_,_],

    in_list(Info,[michael,basket,better,_]),
    in_list(Info,[simon,_,_,israel]),
    in_list(Info,[_,_,_,australia]),
    in_list(Info,[richard,_,_,_]),
    in_list(Info,[_,cricket,best,_]),
    in_list(Info,[_,tennis,_,_]),
    in_list(Info,[_,_,_,usa]),
    in_list(Info,[_,_,worst,_]),


    write(Info), !, fail.