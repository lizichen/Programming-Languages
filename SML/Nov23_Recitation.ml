(* Nov 23, 2016 Programming Language SML Recitation *)


(*Recitation Example 1*)
fun folder F y nil = y
| folder F y (x::xs) = F(x, folder F y xs) ;

val folder = fn : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b

 F 	 	'b * 'a -> 'a )
 y  	'a
 x::xs 	'b list 

 

(*Recitation Example 2*)
 fun f g h i j k l m n =
 if h k then
 	let 
 		val t = g i 
 	in
 		(j l)
 	else
 		(m n);

 g		'a -> 'b
 h		'c -> bool
 i 		'a
 j		'd -> 'e
 k		'c
 l 		'd
 m		'f -> 'e
 n		'f

 ('a -> 'b) -> ('c -> bool) -> 'a -> ('d -> 'e) -> 'c -> 'd -> ('f -> 'e) -> 'f -> 'e

(*Recitation Example 3*)
fn 'a -> ('a -> 'b) -> ('b -> 'c) -> ('c -> 'd) -> 'b
    _    __________    __________    __________ 
    g		h				i            j

    fun f g h i j = 
    	let val y = j(i(h(g)))
    	in
    		h g
    	end;


(*Recitation Example 4*)
fn: 'a * ('a -> 'b) * ('b -> bool) * (b-> 'c list) -> 'c
	__   __________   ____________   ____________
	 g      h             i              j

	 fun f ( g,h,i,j) = 
	 	let 
	 		val x = h g
	 		y::ys = j x 
	 		if i x then
	 			y
	 		else
	 			hd(ys)   (*hd(ys) return the first element of ys*)

(*Recitation Example 5*)
fun f g i j k l m n = 
	if h k then
		let
			val t::ts = g (i, m)
		in
			j (l, t)
		end
	else
		m (n, k)
	end;

	g	('d * ('a * 'b -> 'c) -> 'e list)					m  	('a * 'b -> 'c)	
	h 	'b -> bool											n   'a
	i 	'd
	j   ('f * 'e) -> 'c  
	k	'b
	l 	'f
	
(*Recitation Example 6	*)
fn: 'a * 'b list * ('a -> 'c) * ('b * 'c -> 'd) -> 'd list
    __   _______   __________   ______________
     x     y          z             l

     fun f ( x, y::ys, z, l) = 
     	let
     		val m = z x
     		val n = l (y, m)
     	in
     		body
     	end













































