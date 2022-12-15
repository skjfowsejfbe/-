:- op( 50, xfy, :).
рейс( Пункт1, Пункт2, День, _, ВрОтпр, ВрПриб) :-
 расписание( Пункт1, Пункт2, СписРейсов),
 принадлежит( ВрОтпр / ВрПриб / Nр / СписДней, СписРейсов),
 день_выл( День, СписДней).
принадлежит( X, [X | L] ).
принадлежит( X, [Y | L] ) :-
 принадлежит( X, L ).
день_выл( День, СписДней) :-
 принадлежит( День, СписДней).
день_выл( День, ежедневно) :-
 принадлежит( День, [пн, вт, ср, чт, пт, сб, вс] ).
маршрут( P1, P2, День, [P1-Р2 : Np : ВрОтпр] ) :-
 рейс( P1, P2, День, _, ВрОтпр, _ ).
маршрут( P1, Р2, День, [P1-P3 : Np1 : Oтпp1 | Маршрут]) :-
 маршрут( Р3, P2, День, Маршрут ),
 рейс( P1, Р3, День, Npl, Oтпp1, Приб1),
 вр_отпр( Маршрут, Отпр2),
 пересадка( Приб1, Отпр2).
вр_отпр( [P1-Р2 : _ : Отпр | _ ], Отпр).
пересадка( Часы1 : Минуты1, Часы2 : Минуты2) :-
 60 * (Часы2-Часы1) + Минуты2 - Минуты1 >= 40.
    
расписание( Пятигорск, Элиста,
 [ 9:40 / 10:50 / bа4733 / ежедневно,
   13:40 / 14:50 / ba4773 / ежедневно,
   19:40 / 20:50 / bа4833 / [пн, вт, ср, чт, пт, вс] ] ).
расписание( Элиста, Волгоград,
 [ 9:40 / 10:50 / bа4732 / ежедневно,
   11:40 / 12:50 / bа4752 / ежедневно,
   18:40 / 19:50 / bа4822 / [пн, вт, ср, чт, пт] ] ),
расписание( Элиста, Ставрополь,
 [13:20 / 16:20 / ju201 / [пт],
  13:20 / 16:20 / ju213 / [вс] ] ).
расписание( Элиста, Милан,
 [ 9:10 / 11:45 / bа614 / ежедневно,
   14:45 / 17:20 / sr805 / ежедневно ] ).
расписание( Элиста, Краснодар,
 [ 8:30 / 11:20 / bа510 / ежедневно,
   11:00 / 13:50 / az459 / ежедневно ] ).
расписание( Пятигорск, Краснодар,
 [11:30 / 12:40 / ju322 / [вт,чт] ] ).
расписание( Пятигорск, Элиста,
 [11:10 / 12:20 / yu200 / [пт],
  11:25 / 12:20 / yu212 / [вс] ] ).
расписание( Волгоград, Ставрополь,
 [ 9:10 / 10:00 / az458 / ежедневно,
   12:20 / 13:10 / bа511 / ежедневно ] ).
расписание( Волгоград, Милан,
 [ 9:25 / 10:15 / sr621 / ежедневно,
   12:45 / 13:35 / sr623 / ежедневно ] ).
расписание( Милан, Элиста,
 [13:30 / 14:40 / yu323 / [вт, чт] ] ).
расписание( Пятигосрк, Волгоград,
 9:00 / 9:40 / bа613 /
 [ пн, вт, ср, чт, пт, сб],
   16:10 / 16:55 / sr806 / [пн, вт, ср, чт, пт, сб] ] ).
расписание( Пятигорск, Милан,
 [ 7:55 / 8:45 / sr620 / ежедневно ] ).
menu:-   
	write("1 -Рейсы от-до"),nl, 
	write("2 - Дни рейсов от-до "),nl, 
	write("0 - Выйти"),nl, 
	readchar(C),  
	menu(C). 
menu(1):- 
	write("Введите Пункт1 - "), nl, 
    write("Введите Пункт2 - "), nl,
	readln(Пункт1), 
    readln(Пункт2),
	write("Оценка: ",рейс(Пункт1, Пункт2, _, _, _, _ )., !
	readchar(_), 
	menu.
menu(2):- 
	write("Введите Пункт1 - "), nl, 
    write("Введите Пункт2 - "), nl,
    write("Введите День - "), nl,      
	readln(Пункт1), 
    readln(Пункт2),
    readln(День),
	write("Оценка: ",рейс(Пункт1, Пункт2, День, _, _, _ )., !,
	readchar(_), 
	menu.
menu(0):- !.
menu(_):- 
menu.