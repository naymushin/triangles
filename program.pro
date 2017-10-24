predicates

error_data(integer, integer, integer)
not_triangle(integer, integer, integer)
degenerate(integer, integer, integer)
rectangular(integer, integer, integer)
isosceles(integer, integer, integer)
equilateral(integer, integer, integer)
random_tr(integer, integer, integer)

max_side(integer, integer, integer, integer)
min_side(integer, integer, integer, integer)
middle_side(integer, integer, integer, integer)

max(integer, integer, integer)
min(integer, integer, integer)

nondeterm analyze(integer, integer, integer)

clauses

max(X,Y,Res):- X>Y, Res=X, !.
max(X,Y,Res):- Res=Y.
min(X,Y,Res):- X<Y, Res=X, !.
min(X,Y,Res):- Res=Y.

max_side(A,B,C,Res):- max(A,B,Res1), max(Res1,C,Res2), max(Res1,Res2,Res).
min_side(A,B,C,Res):- min(A,B,Res1), min(Res1,C,Res2), min(Res1,Res2,Res).
middle_side(A,B,C,Res):- max_side(A,B,C,Res1), min_side(A,B,C,Res2),
Res=A+B+C-Res1-Res2.

error_data(A,B,C):- A<=0.
error_data(A,B,C):- B<=0.
error_data(A,B,C):- C<=0.

not_triangle(A,B,C):- max_side(A,B,C,Res), 2*Res>A+B+C.
degenerate(A,B,C):- max_side(A,B,C,Res), 2*Res=A+B+C.
rectangular(A,B,C):- max_side(A,B,C,Res), 2*Res*Res=A*A+B*B+C*C.
isosceles(A,B,C):- max_side(A,B,C,Res1), min_side(A,B,C,Res2),
middle_side(A,B,C,Res3), Res1>Res2, Res2=Res3.
equilateral(A,B,C):- A=B, B=C.
random_tr(A, B, C).

analyze(A,B,C):- error_data(A,B,C), write(" error data"), nl, !.
analyze(A,B,C):- not_triangle(A,B,C), write(" not triangle"), nl, !.
analyze(A,B,C):- degenerate(A,B,C), write(" degenerate"), nl, !.
analyze(A,B,C):- rectangular(A,B,C), write(" rectangular"), nl, !.
analyze(A,B,C):- isosceles(A,B,C), write(" isosceles"), nl, !.
analyze(A,B,C):- equilateral(A,B,C), write(" equilateral"), nl, !.
analyze(A,B,C):- random_tr(A,B,C), write(" random"), nl.

goal

analyze(7,4,5).