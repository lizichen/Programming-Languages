
(*PL ML Homework*)
(*Lizi Chen lc3397@nyu.edu*)

Control.Print.printDepth  := 100;
Control.Print.printLength := 100;


(* Q1 - merge two sorted lists *)
fun merge [] [] = []
| merge [] b = b
| merge a [] = a
| merge (a::ax) (b::bx) =
if a <= b then [a] @ (merge ax (b::bx))
else [b] @ (merge (a::ax) bx);

(*Q2 - alterating split*)
