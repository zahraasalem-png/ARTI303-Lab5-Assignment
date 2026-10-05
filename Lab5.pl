% Males
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% Females
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parents
parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

% Rules
father(X, Y):-
    parent(X, Y),
    male(X).

mother(X, Y):-
    parent(X, Y),
    female(X).

son(X, Y):-
    parent(Y, X),
    male(X).

daughter(X, Y):-
    parent(Y, X),
    female(X).

brother(X, Y):-
    parent(A, X),
    parent(A, Y),
    male(X),
    X \= Y.

sister(X, Y):-
    parent(A, X),
    parent(A, Y),
    female(X),
    X \= Y.

grandfather(X, Z):-
    parent(X, Y),
    parent(Y, Z),
    male(X).

aunt(X, Z):-
    sister(X, Y),
    parent(Y, Z).

uncle(X, Z):-
    brother(X, Y),
    parent(Y, Z).

sibling(X, Y):-
    parent(A, X),
    parent(A, Y),
    X \= Y.

cousin(X, Y):-
    parent(A, X),
    parent(B, Y),
    sibling(A, B).

ancestor(X, Z):-
    parent(X, Z).

ancestor(X, Z):-
    parent(X, Y),
    ancestor(Y, Z).
