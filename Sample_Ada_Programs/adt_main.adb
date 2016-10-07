with text_io;
with adt_stack;

procedure adt_main is
  use text_io;
  package int_io is new integer_io(integer);
  use int_io;

  use adt_stack;
  x,y,z:integer;
  s1, s2: stack;

begin
  initialize(s1);
  initialize(s2);
  put("Enter number of pushes > ");
  get(x);
  put("Enter number of pops > ");
  get(y);
  for i in 1..x loop
     push(s1,i);
     push(s2,100-i);
  end loop;
  for i in 1..y loop
    pop(s1,z);
    put(z); new_line;
  end loop;
  new_Line;
  for i in 1..y loop
    pop(s2,z);
    put(z); new_line;
  end loop;

exception
   when stack_overflow =>
        put("Stack has overflowed"); new_line;
   when stack_underflow =>
        put("Stack has underflowed"); new_line;
end adt_main;

