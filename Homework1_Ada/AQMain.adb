with Text_Io; -- useless?
use Text_io;

with Ada.Numerics.Generic_Elementary_Functions;

with Ada.Float_text_IO;
use Ada.Float_Text_IO;

with AdaptiveQuad;

procedure AQMain is

	package FloatFunctions is new Ada.Numerics.Generic_Elementary_Functions(Float);
	use FloatFunctions;

	Epsilon: Constant Float:= 0.000001;

	task ReadPairs;
	task ComputeArea is
		entry abValues(a: Float; b: Float);
	end ComputeArea;
	task PrintResult is
		entry printMsg(a: Float; b:Float; computedResult:Float);
	end PrintResult;

	-- END OF DECLARATIVE STUFF

	function MyF(X:Float) return Float is
		begin
			return Sin(X * X); 
		end MyF;
	
	package corePack is new AdaptiveQuad(MyF);

	task body ReadPairs is
		A,B:Float;
		begin
			for i in 1..5 loop
				get(A);
				get(B); -- Read in A, B, using Get
				ComputeArea.abValues(A,B); -- Provide A, B to ComputeArea task
			end loop;
		end ReadPairs;

	task body ComputeArea is
		computedResult:Float;
		begin
			loop
				select
					accept abValues(a: Float; b: Float) do
						computedResult := corePack.AQuad(a,b,Epsilon);
						PrintResult.printMsg(a,b,computedResult);
					end abValues;
				end select;
			end loop;
		end ComputeArea;

	task body PrintResult is
		begin
			loop
				select
					accept printMsg(a:Float; b:Float; computedResult:Float) do
						Put("The area under sin(x^2) for x = ");
						Put(a,5,3,0);
						Put(" to ");
						Put(b,5,3,0);
						Put(" is ");
						Put(computedResult,5,7,0);
						new_line;
					end printMsg;
				end select;
			end loop;
		end PrintResult;

begin
	null;
end AQMain;