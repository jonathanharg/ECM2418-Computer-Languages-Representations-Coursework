/*Begin Question 4.1*/
prime(N)
:- N > 1,
  S is sqrt(N),
  F is floor(S),
  % Only need to test divisibility by 2 ... sqrt(n).
  prime_(N, F).

prime_(N, D)
:- R is mod(N, D),
  R \= 0,
  D1 is D - 1,
  prime_(N, D1).
prime_(_, D)
:- D is 1.
/*End Question 4.1*/

/*Begin Question 4.2*/
possible(X, Y, Z)
:- permutations([1,2,3,4,5,6,7,8,9], P),
  permToBears(P, X, Y, Z),
  X >= 123, % since anything < 123 must contain a repeated digit or a zero
  X =< 178, % since 180 contains 0 and 179 is prime
  Y >= 182,
  Y =< 268, % since 181 & 269 are prime
  Z >= 272,
  Z =< 358. % since 271 & 359 are prime

permToBears([A, B, C, D, E, F, H, I, J], X, Y, Z)
% From [A,B,...,J] to X = ABC, Y= DEF, Z= HIJ, and perform preliminary bounds checks.
% 123 =< ABC =< 178 
:- A is 1,
  1 < B,
  B < 8,
  % 182 =< DEF =< 268
  D < 3,
  E \= 7,
  % 272 =< HIJ =< 358
  1 < H,
  H < 4,
  I \= 6,
  X is (100 * A) + (10 * B) + C,
  Y is (100 * D) + (10 * E) + F,
  Z is (100 * H) + (10 * I) + J.

permutations([],[]).
permutations([H|T],X)
:- permutations(T, TP),
  append(L, R, TP),
  append(L, [H], M),
  append(M, R, X).
/*End Question 4.2*/

/*Begin Question 4.3*/
acceptable(X, Y, Z)
:- not(prime(X)),
  not(prime(Y)),
  not(prime(Z)).

trait(X, Y, Z)
:- possible(X, Y, Z),
  acceptable(X, Y, Z).
/*End Question 4.3*/

% [159, 267, 348] is the only possibility with two unique bearings
% and is therefore the solution to this problem