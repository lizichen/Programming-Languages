with text_io;
use text_io;

procedure F is

--always need these two lines to print integers
package int_io is new integer_io(integer);
use int_io;

task One; -- task spec
task body One is
  X: integer:=6;
begin
  for I in 1..10 loop
    put(X+I);put("inside task One");new_line;
  end loop;
end one;

begin
   for J in 90..100 loop
      put(J);put("inside procedure F");new_line;
   end loop;
end F;

