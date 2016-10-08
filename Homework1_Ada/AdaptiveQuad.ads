generic
	type T is limited private;
	with function F(X:T) return T;
	package AdaptiveQuad is
		function AQuad(A:Float; B:Float; Eps:Float) return Float;
	end AdaptiveQuad;