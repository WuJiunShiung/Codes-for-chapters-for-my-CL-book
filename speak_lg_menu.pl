% speak_lg_menu.pl
% from Clive's book

spoken_in(english, uk).
spoken_in(english, usa).
spoken_in(english, australia).
spoken_in(spanish, peru).
spoken_in(quechua, peru).
spoken_in(piro, peru).
spoken_in(french, france).
spoken_in(french, canada).
spoken_in(french, belgium).
spoken_in(german, germany).
spoken_in(german, austria).

speaks(boris, russian).
speaks(hank, english).
speaks(john, english).
speaks(jacques, french).
speaks(helmut, german).



go_menu :-
	write('Do you want to search via:'), nl,
	tab(5), write('(a) Languages or'), nl,
	tab(5), write('(b) Countries'), nl, 
	get(X),
	get0(_),
	sub_go(X).

sub_go(97) :- 
	write('Which language are you interested in?'), nl,
	read(Language), nl,
	spoken_in(Language, Country),
	write(Language),
	write(' is spoken in '),
	write(Country), nl, fail.

sub_go(98) :- !, 
	write('Which Country are you interested in?'), nl,
	read(Country), nl,
	spoken_in(Language, Country),
	write(Language),
	write(' is spoken in '),
	write(Country).

sub_go(_) :-
	write('Please type either a or b'), nl,
	get(C),
	get0(_),
	sub_go(C).

go :-
	nl,
	write('Which country are you interested in?'),
	nl,
	read(Country),
	spoken_in(Language, Country),
	nl,
	write(Language), 
	write(' is spoken in '),
	write(Country),
	fail.
	
go :-		
	nl, write('No (more) answers known').


understood_in(Person, Country) :-
	speaks(Person, Lg),
	spoken_in(Lg, Country).

world_lg(Lg) :-
	spoken_in(Lg, Country1),
	spoken_in(Lg, Country2),
	\+ Country1 = Country2.
	
	
	
