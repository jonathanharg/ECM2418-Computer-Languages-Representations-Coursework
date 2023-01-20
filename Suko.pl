/*Begin Question 3.1*/
indices( [I], XS, [ES])
	:- index(I, XS, ES).
indices( [H|T], XS, ES )
	:- index(H, XS, A),
    indices(T, XS, B),
    append([A], B, ES).
    
index(0, [H|_], H).
index(I, [_|T] , R)
	:- I1 is I - 1,
    index(I1, T, R).

/*End Question 3.1*/

/*Begin Question 3.2*/
possible(GRID)
	:- permutation([1,2,3,4,5,6,7,8,9], GRID).

permutation([],[]).
permutation([H|T],X)
	:- permutation(T, TP),
    append(L, R, TP),
    append(L, [H], M),
    append(M, R, X).

/*End Question 3.2*/

/*Begin Question 3.3*/
acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
	:- possible(GRID),
    checkCellsSum(US, U, GRID),
    checkCellsSum(VS, V, GRID),
    checkCellsSum(WS, W, GRID),
    checkCellsSum([0,1,3,4], T0, GRID),
    checkCellsSum([1,2,4,5], T1, GRID),
    checkCellsSum([3,4,6,7], T2, GRID),
    checkCellsSum([4,5,7,8], T3, GRID).

checkCellsSum(I, S, GRID)
    :- indices(I, GRID, V),
    sum(V, S).
    
sum([X],X).
sum([H|T], R)
	:- sum(T, P),
    R is H + P.

suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
	:- acceptable(T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).

/*End Question 3.3*/

%main
%	%:- acceptable( 169, 247, 358 ).
%	:- time(findall([X, Y, Z], trait(X, Y, Z), L)),
%    write(L).

%main
%	:- suko( 17, 21, 12, 16, [3,6,7,8], 16, [0,2,5], 21, [1,4], 8, GRID ),
%	write(GRID).