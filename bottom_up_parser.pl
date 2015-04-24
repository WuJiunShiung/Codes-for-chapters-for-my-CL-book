% bottom_up_parser.pl
% sample bottom-up parser

:- op(700, xfx, ==>).

s(s(NP, VP)) ==> [np(NP), vp(VP)].
np(np(Det, NBar)) ==> [det(Det), nBar(NBar)].
np(np(NBar)) ==> [nBar(NBar)].
nBar(nBar(Adj, NBar)) ==> [adj(Adj), nBar(NBar)].
nBar(nBar(N)) ==> [n(N)].
nBar(nBar(PropN)) ==> [propN(PropN)].

vp(vp(VBar)) ==> [vBar(VBar)].
vBar(vBar(Adv, VBar)) ==> [adv(Adv), vBar(VBar)].
vBar(vBar(Vi)) ==> [vi(Vi)].
vBar(vBar(Vt, NP)) ==> [vt(Vt), np(NP)].

word(det(det(the)), the).
word(det(det(every)), every).
word(det(det(this)), this).
word(det(det(that)), that).
word(det(det(a)), a).

word(n(n(boy)), boy).
word(n(n(girl)), girl).
word(n(n(dog)), dog).
word(n(n(cat)), cat).
word(n(n(horse)), horse).
word(n(n(cook)), cook).

word(propN(propN(john)), john).
word(propN(propN(mary)), mary).
word(propN(propN(susan)), susan).
word(propN(propN(helen)), helen).

word(adj(adj(nice)), nice).
word(adj(adj(tall)), tall).
word(adj(adj(handsome)), handsome).
word(adj(adj(pretty)), pretty).
word(adj(adj(naughty)), naughty).

word(adv(adv(quickly)), quickily).
word(adv(adv(happily)), happily).
word(adv(adv(soundly)), soundly).
word(adv(adv(abruptly)), abruptly).

word(vi(vi(cried)), cried).
word(vi(vi(slept)), slept).
word(vi(vi(ran)), ran).
word(vi(vi(smiled)), smiled).

word(vt(vt(liked)), liked).
word(vt(vt(hated)), hated).
word(vt(vt(chased)), chased).
word(vt(vt(hit)), hit).

parse([s(Parse)], Parse, []).

parse(Stack, Parse,[Word|RestString]) :-
	word(Cat, Word),
	parse([Cat|Stack],Parse, RestString).

parse([Cat2, Cat1|RestCats], Parse, String) :-
	Cat ==> [Cat1, Cat2],
	parse([Cat|RestCats], Parse, String).

parse([Cat1|RestCats], Parse, String) :-
	Cat ==> [Cat1],
	parse([Cat|RestCats], Parse, String).
	
parse(Parse, String) :-
	parse([], Parse, String).
	
 
