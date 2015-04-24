% bottom_up_recog.pl
% sample buttom-up recognizer
% 這個版本的詞彙部份要用word/2的形式，
% 不能用詞組律的格式。
% 不然無法判斷是要push還是reduce

:- op(700, xfx, ==>).

s ==> [np, vp].
np ==> [det, nBar].
np ==> [nBar].
nBar ==> [adj, nBar].
nBar ==> [n].
nBar ==> [propN].

vp ==> [vBar].
vBar ==> [adv, vBar].
vBar ==> [vi].
vBar ==> [vt, np].

word(det, the).
word(det, every).
word(det, this).
word(det, that).
word(det, a).

word(n, boy).
word(n, girl).
word(n, dog).
word(n, cat).
word(n, horse).
word(n, cook).

word(propN, john).
word(propN, mary).
word(propN, susan).
word(propN, helen).

word(adj, nice).
word(adj, tall).
word(adj, handsome).
word(adj, pretty).
word(adj, naughty).

word(adv, quickily).
word(adv, happily).
word(adv, soundly).
word(adv, abruptly).

word(vi, cried).
word(vi, slept).
word(vi, ran).
word(vi, smiled).

word(vt, liked).
word(vt, hated).
word(vt, chased).
word(vt, hit).

recognize([s], []).

recognize(Stack, [Word|RestString]) :-
	word(Cat, Word),
	recognize([Cat|Stack], RestString).

recognize([Cat2, Cat1|RestCats], String) :-
	Cat ==> [Cat1, Cat2],
	recognize([Cat|RestCats], String).

recognize([Cat1|RestCats], String) :-
	Cat ==> [Cat1],
	recognize([Cat|RestCats], String).
	
recognize(String) :-
	recognize([], String).

	
