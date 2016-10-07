package body GenPack is
	function Apply(Y:T) return T is
	begin
		return F(Y);
	end Apply;
end GenPack;
