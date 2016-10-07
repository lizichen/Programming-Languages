package body adt_stack is

 procedure push(s:in out stack; x:integer) is
  begin
    if (s.index > 20) then
      raise stack_overflow;
    else
      s.the_stack(s.index) := x;
      s.index := s.index + 1;
    end if;
  end;

 procedure pop(s: in out stack; x: out integer) is
 begin
   if (s.index <= 1) then
     raise stack_underflow;
   else
    s.index := s.index - 1;
    x :=  s.the_stack(s.index);
   end if;
 end;

 procedure initialize(s: out stack) is
 begin
   s.index := 1;
 end;

end adt_stack;


