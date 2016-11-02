with text_io;
use text_io;

procedure simplyConcurrencyDemo is
	
	task One;

	task body One is
	begin
		Put("In One"); New_Line;
	end One;

begin
	Put("In Test"); New_Line;
end simplyConcurrencyDemo;
