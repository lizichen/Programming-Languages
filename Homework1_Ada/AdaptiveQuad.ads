generic
	-- type T is limited private;
	-- with function F(X:T) return T; 
	-- 		If declaring the formal parameter T as above in generic package, 
	--		then we have to maintain the throughout package body.
	--		This means that in the AdaptiveQuad.adb, we must have returned a float from:
	--			SimpsonsRule
	--			RecAQua
	--			AQuad
	--		rather than a T.
	with function F(X:Float) return Float;
	package AdaptiveQuad is
		function SimpsonsRule(a: Float; b:Float) return Float;
		function RecAQua(a:Float; b:Float; eps:Float; whole:Float) return Float;
		function AQuad(A:Float; B:Float; Eps:Float) return Float;
	end AdaptiveQuad;