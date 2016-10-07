with Text_Io;
use Text_io;

with Ada.Float_text_IO;
use Ada.Float_Text_IO;

with GenPack;

procedure GenMain is

	package Int_Io is new Integer_IO(Integer);
	use int_io;

	function F1(X: integer) return Integer is
	begin
		return X*X;
	end F1;

	function F2(X: Float) return Float is
	begin
		return X*X;
	end F2;
	
	package IntPack is new GenPack(Integer, F1);
	package FloatPack is new GenPack(Float, F2);

begin
	Put("The integer version procedures: "); Put(IntPack.apply(3)); New_Line;
	Put("The float version procedures: "); Put(FloatPack.apply(3.0)); New_Line;
end GenMain;
