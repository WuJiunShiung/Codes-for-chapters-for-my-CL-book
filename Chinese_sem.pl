% File: Chinese_sem.pl
/* for this code to work, you need 
   to put lambda_reducton02.pl under
   the same directory as this file. */
   
:- encoding(utf8).
:- ensure_loaded('lambda_reduction02.pl').
:- dynamic some/2.

propN(張無忌) --> [張無忌].
propN(趙敏) --> [趙敏].
propN(楊逍) --> [楊逍].
propN(楊不悔) --> [楊不悔].
propN(大都) --> [大都].

vi(lam(X, lam(E, 慢跑(X, E)))) --> [慢跑].
vi(lam(X, lam(E, 睡覺(X, E)))) --> [睡覺].
vi(lam(X, lam(E, 微笑(X, E)))) --> [微笑].

% vt(y, x) = X vt. Y

vt(lam(Y, lam(X, lam(E, 踢(Y, X, E))))) --> [踢].
vt(lam(Y, lam(X, lam(E, 打(Y, X, E))))) --> [打].
vt(lam(Y, lam(X, lam(E, 喜歡(Y, X, E))))) --> [喜歡].

p(lam(X, lam(P, lam(E, and(app(P, E), 在(X, E)))))) --> [在].
adv(lam(P, lam(E, and(app(P, E), 輕輕地(E))))) --> [輕輕地].


s(Sem_s) --> np(Sem_np), vp(Sem_vp), {lambdaReduct(app(Sem_vp, Sem_np), Sem_s)}.
s(Sem_s) --> np(Sem_np), pp(Sem_pp), vp(Sem_vp), {lambdaReduct(app(Sem_vp, Sem_np), Sem_preS), lambdaReduct(app(Sem_pp, Sem_preS), Sem_s)}.
s(Sem_s) --> np(Sem_np), adv(Sem_adv), vp(Sem_vp), {lambdaReduct(app(Sem_vp, Sem_np), Sem_preS), lambdaReduct(app(Sem_adv, Sem_preS), Sem_s)}.

np(Sem_propN) --> propN(Sem_propN).

vp(Sem_vBar) --> vBar(Sem_vBar).

vBar(Sem_vi) --> vi(Sem_vi).
vBar(Sem_vBar) --> vt(Sem_vt), np(Sem_np), {lambdaReduct(app(Sem_vt, Sem_np), Sem_vBar)}.

pp(Sem_pp) --> p(Sem_p), np(Sem_np), {lambdaReduct(app(Sem_p, Sem_np), Sem_pp)}.

infer(P) :-
	some(_, and(P, _)).
	
infer(P) :-
	some(_, and(_, P)).

% 以下是執行existential closure 的部份
% 只是把 lam 改成 some 而已。

exist_cl(Sem, Sem01) :-
	Sem =.. [lam, X, P],
	Sem01 =.. [some, X, P].
	
/*
exist_cl(Sem, Sem01) :-
	Sem =.. [and, P, Q],
	P =.. [lam, X, P2],
	P3 =.. [some, X, P2],
	Sem01 =.. [and, P3, Q].
*/

sem_test01 :-
	s(Sem, [張無忌, 踢, 趙敏], []),
	exist_cl(Sem, Sem01),
	print(Sem01).

sem_test02 :-
	s(Sem, [張無忌, 睡覺], []),
	exist_cl(Sem, Sem01),
	print(Sem01).
	
sem_test03 :-
	s(Sem, [張無忌, 在, 大都, 踢, 趙敏], []),
	exist_cl(Sem, Sem01),
	print(Sem01).
	
sem_test04 :-
	s(Sem, [張無忌, 輕輕地, 踢, 趙敏], []),
%print(Sem),nl,
	exist_cl(Sem, Sem01),
	print(Sem01).
	
sem_pp01 :-
	pp(Sem, [在, 大都], []),
	print(Sem).
	
sem_vp01 :-
	vp(Sem,[在, 大都, 踢, 趙敏], []),
	print(Sem).

sem_vp02 :-
	vp(Sem, [輕輕地, 踢, 趙敏], []),
	print(Sem).
	
sem_s01 :-
	s(Sem, [張無忌, 在, 大都, 踢, 趙敏], []),
	print(Sem),
	Sem =.. Y, nl, 
	print(Y).
