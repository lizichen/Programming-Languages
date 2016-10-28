with Text_Io;
use Text_io;

with Ada.Float_text_IO;
use Ada.Float_Text_IO;


procedure concurrentTask is

	task one is
		entry twoDone;
	end one;
	task two is
		entry oneDone;
	end two;

	task body one is
	begin
		loop
			select
				accept twoDone do
					put("one running");
					new_line;
				end twoDone;	
			end select;	
			two.oneDone;
		end loop;
	end;

	task body two is
	begin
		loop
			select
				accept oneDone do
					put("two running");
					new_line;
				end oneDone;
			end select;
			one.twoDone;
		end loop;
	end;

begin 
	one.twoDone;
end;

	