
(*PL ML Homework*)
(*Lizi Chen lc3397@nyu.edu*)

Control.Print.printDepth  := 100;
Control.Print.printLength := 100;


(* question 1 *)
fun merge [] [] = []
| merge [] b = b
| merge a [] = a
| merge (a::ax) (b::bx) =
if a <= b then [a] @ (merge ax ([b]@bx))
else [b] @ (merge ([a]@ax) bx)