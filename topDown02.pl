% topDown02.pl
% an example of top-down recognition/parsing


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

det ==> [the].
det ==> [every].
det ==> [this].
det ==> [that].

n ==> [boy].
n ==> [girl].
n ==> [dog].
n ==> [cat].
n ==> [horse].
n ==> [cook].

propN ==> [john].
propN ==> [mary].
propN ==> [susan].
propN ==> [helen].

adj ==> [nice].
adj ==> [tall].
adj ==> [handsome].
adj ==> [pretty].
adj ==> [naughty].

adv ==> [quickly].
adv ==> [happily].
adv ==> [soundly].
adv ==> [abruptly].

vi ==> [cried].
vi ==> [slept].
vi ==> [ran].
vi ==> [smiled].

vt ==> [liked].
vt ==> [hated].
vt ==> [chased].
vt ==> [hit].


recognize(String) :-
	recognize(String, [s]).

recognize([], []).

recognize([Word|RestString], [Cat|TCat]) :-
	Cat ==> [Word],
	recognize(RestString, TCat).
	
recognize(String, [Cat|TCat]) :-
	Cat ==>[Cat1, Cat2],
	recognize(String, [Cat1, Cat2|TCat]).

recognize(String, [Cat|TCat]) :-
	Cat ==>[Cat1],
	recognize(String, [Cat1|TCat]).


