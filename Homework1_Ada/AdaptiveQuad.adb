package body AdaptiveQuad is

	-- simpsons_rule(f,a,b)
	function SimpsonsRule(a: Float; b:Float) return Float is
	h3,c:Float;
	begin
		c:=(a+b)/2.0;
		h3:=abs(b-a)/6.0;
		return h3 * ( F(a) + 4.0 * F(c) + F(b) );
	end SimpsonsRule;

	-- recursive_asr(f,a,b,eps,whole)
	function RecAQua(a:Float; b:Float; eps:Float; whole:Float) return Float is
	c,left,right:Float;
	begin
		c := (a+b)/2.0;
		left := SimpsonsRule(a,c); 
		right := SimpsonsRule(c,b);
		if ( abs(left + right - whole) <= 15.0 * eps) then
			return left + right + (left + right - whole)/15.0;
		else
			return RecAQua(a,c,eps/2.0,left) + RecAQua(c,b,eps/2.0,right); -- HOW TO DO CONCURRENCY HERE?
		end if;
	end RecAQua;

	-- adaptive_simpsons_rule
	function AQuad(A:Float; B:Float; Eps:Float) return Float is
	begin
		return RecAQua(A,B,Eps,SimpsonsRule(A,B));
	end AQuad;

end AdaptiveQuad;