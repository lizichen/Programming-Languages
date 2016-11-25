
(* Standard ML / NJ *)
(* Lizi Chen lc3397@nyu.edu *)

Control.Print.printDepth  := 100;
Control.Print.printLength := 100;


(* Q1 - merge two sorted lists *)
fun merge [] [] = []
| merge [] b = b
| merge a [] = a
| merge (a::ax) (b::bx) =
if a <= b then [a] @ (merge ax (b::bx))
else [b] @ (merge (a::ax) bx);

(* Q2 - alterating list spliting *)
fun split [] = ([], [])   
  | split [a] = ([a], [])  
  | split (a1::a2::ax) = 
  	let 
    	val (b, c) = split ax
    in 
    	((a1::b), (a2::c))
    end;

(* Q3 - mergeSort*)
fun mergeSort a = 
	let
		val l = split a
		val l1 = #1 l
		val l2 = #2 l
		fun sort [] = []
			| sort [x] = [x]
			| sort (x1::x2::xz) = 
				case Int.compare(x1, x2) of
					GREATER => x2::x1::xz
					| EQUAL => x1::x2::xz
					| LESS => x1::sort (x2::xz)
		fun fix f x = 
			if f x = x 
				then x
                else fix f (f x)
        fun mySort x = 
        	fix sort x
	in
		merge (mySort l1) (mySort l2)
	end;

(* Q3 - mergeSort - Version 2*)
fun mergeSort a = 
	let
		val l = split a
		val l1 = #1 l
		val l2 = #2 l
		fun insertionSortFirstTwo (x, []) = [x]
		| insertionSortFirstTwo (first, second::secondRest) = 
			case Int.compare(first, second) of
				GREATER => second::insertionSortFirstTwo(first, secondRest)
				| _     => first::second::secondRest
		fun insertionSort [] = []
			| insertionSort (x::xz) = insertionSortFirstTwo (x, insertionSort xz)		
	in
		merge (insertionSort l1) (insertionSort l2)
	end;

(* Q4 - polymorphic sort function *)
fun sort (op <) tobesorted = 
	let
		fun split [] = ([], [])
			| split [s] = ([s], [])
			| split (s1::s2::sx) = 
			let
				val (i, j) = split sx
			in
				((s1::i), (s2::j))
			end

		fun merge [] []  = []
			| merge [] b = b
			| merge a [] = a
			| merge (a::ax)	(b::bx) = 
				if a < b 
				then [a] @ (merge ax 		(b::bx)	) 
				else [b] @ (merge (a::ax) 	bx		) 

		fun insertionSortFirstTwo (x, []) = [x]
			| insertionSortFirstTwo (first, second::secondRest) = 
				if first < second 
				then first::second::secondRest
				else second::insertionSortFirstTwo(first, secondRest) 

		fun insertionSort [] = []
			| insertionSort (x::xz) = insertionSortFirstTwo (x, insertionSort xz) 

		val l = split tobesorted;
		val l1 = #1 l
		val l2 = #2 l
	in
		merge (insertionSort l1) (insertionSort l2) 
	end ;
(* val sort = 
	fn : ('a * 'a -> bool) -> 'a list -> 'a list *)


(* Q5 - define polymorphic type 'a tree*)
datatype 'a tree = empty 
	| leaf of 'a 
	| node of 'a * 'a tree * 'a tree ;

(* Q6 - define function labels 'a tree, print out in-order 'a tree traversal path *)
fun labels (empty) = []
	| labels (leaf l) = [l]
	| labels (node (Value, L, R)) = 
		(labels (L))@[Value]@(labels (R)) ;	
(* Problem: 
	when having val testTree = empty ;
		labels testTree ; 
		returns error as below:
			stdIn:745.1-745.13 Warning: type vars not generalized because of
	   		value restriction are instantiated to dummy types (X1,X2,...)
			val it = [] : ?.X1 list
*)		

(* Q7 - Clone tree with swapped values *)
infix == ;

fun replace (op ==) x y (empty) = empty
	| replace (op ==) x y (leaf l) = 
		if l == x 
		then (leaf y) 
		else (leaf l) 
	| replace (op ==) x y (node (Value, L, R)) = 
	if Value == x 
	then (node (y, (replace (op ==) x y L), (replace (op ==) x y R) ))
	else (node (Value, (replace (op ==) x y L), (replace (op ==) x y R) )) ;

(* Q8 - replace empty node with a value *)
fun replaceEmpty y empty = y
	| replaceEmpty y (leaf l) = (leaf l)
	| replaceEmpty y (node (Value, L, R)) = 
		(node (Value, replaceEmpty y L, replaceEmpty y R)) ;

(* Q9 - mapTree function that applies f to every node *)
fun mapTree f empty = f empty
	| mapTree f (leaf l) = f (leaf l)
	| mapTree f (node (Value, L, R)) =
		 f (node (Value, (mapTree f L), (mapTree f R))) ;
(* val mapTree = 
	fn : ('a tree -> 'a tree) -> 'a tree -> 'a tree *)

(* Q10 - sortTree function for an 'a list tree *)
(* Use mapTree and polymorphic sort function *)
(* sortTree function is not recursive *)

fun sortTree (op <) tobesorted = 
	
	mapTree (fn ('a list tree) => sort (op <) ('a list)) tobesorted ;
























