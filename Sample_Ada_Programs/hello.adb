with text_io; -- always need these two lines for reading and printing
use text_io;

procedure hello is

   task Foo;
   task body Foo is
   begin
      Put("In foo");
      new_line(3);
   end Foo;

begin
  Put("Hello World"); New_Line;
end Hello;

