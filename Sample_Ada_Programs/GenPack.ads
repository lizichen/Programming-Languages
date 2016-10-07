generic
	type T is limited private;
	with function F(X: T) return T;
	package GenPack is
		function Apply(Y:T) return T;
	end GenPack;
