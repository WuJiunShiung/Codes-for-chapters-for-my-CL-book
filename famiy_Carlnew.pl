% File family_Carlnew.pl
% the sons of Carl.
/* father(x, y) means x is 
y's father */


:- dynamic(father/2).
:- dynamic(girlFriend/2).

father(carl, paul).
father(carl, patrick).
father(carl, peter).
father(carl, philip).
father(carl, phoebe).
father(philip, tom).
father(philip, tommy).
father(jim, david).
father(jim, bill).
father(jim, sam).

girlFriend(paul, melody).
girlFriend(peter, sunny).
girlFriend(tom, windy).


