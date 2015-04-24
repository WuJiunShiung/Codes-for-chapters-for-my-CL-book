% faculty_menu.pl
% The main part for Faculty-Expertise matching

:- encoding(utf8).
:- ensure_loaded('faculty_expertise.pl').

menu :-
	write('你想知道語言所的什麼事？'), nl,
	tab(10), write('(一) 哪位老師有什麼專長？'), nl,
	tab(10), write('(二) 具某專長的是哪位老師'), nl,
	tab(10), write('(三) 離開'), nl, nl, 
	tab(10), write('請輸入你的選擇：'), nl, nl, 
	get(X),
	goToMenu(X).
	
goToMenu(19968) :-
	nl, nl,
	write('請輸入你想知道的老師，輸入完成請打半型句點：'),
	nl,nl, 
	read(Teacher),
	search_expertise(Teacher, Expertise), nl, nl,
	write(Teacher), write(' 的專長是: '), write(Expertise),
	nl, nl,
	menu.
	
goToMenu(20108) :-
	nl, nl,
	write('請輸入你想知道的專長，輸入完成請打半型句點：'),
	nl, nl,
	read(Expertise),
	search_teacher(Teacher, Expertise),nl, nl,
	write('具'), write(Expertise), write('專長的老師是：'),
	write(Teacher),
	nl, nl,
	menu.
	
goToMenu(19977).

goToMenu(_) :-
	nl, nl,
	write('請輸入一、二、三，謝謝！'), nl, nl, nl,
	menu.
	
	
search_expertise(Teacher, Expertise) :-
	專長(Teacher, Expertise).

search_expertise(Teacher, _) :-
	nl, nl,
	write('我不知道這位老師，請問他的專長是：'), nl, nl, 
	read(X),
	open('faculty_expertise.pl', write, Stream, [encoding(utf8)]),

	assertz(專長(Teacher, X)),
	with_output_to(Stream, listing(專長/2)),
	close(Stream),nl, 
	write('增加了'), write(Teacher), write('的專長！'), nl, nl,
	menu.
	
search_teacher(Teacher, Expertise) :-
	專長(Teacher, Expertise).

search_teacher(_, Expertise) :-
	nl, nl,
	write('我不知道具'),write(Expertise),
	write('專長的老師有誰。請問是誰？'), 
	nl, nl,
	read(Teacher),
	open('faculty_expertise.pl', write, Stream, [encoding(utf8)]),

	assertz(專長(Teacher, Expertise)),
	with_output_to(Stream, listing(專長/2)),
	close(Stream),nl, 
	write('增加了具'), write(Expertise), write('專長的老師！'),
	nl, nl,
	menu.
	

	

