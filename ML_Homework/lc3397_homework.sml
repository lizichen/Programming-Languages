
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

(*Q5 - define polymorphic type 'a tree*)
datatype 'a tree = empty 
	| leaf of 'a 
	| node of 'a * 'a tree * 'a tree ;










