
-- this procedure creates tasks that access the same stack. Thus, the
-- stack, as implemented by the stack package, must provide mutual
-- exclusion.

with text_io;
with new_stack;

procedure test_new_stack is
   use text_io;
   package int_io is new integer_io(integer);
   use int_io;
   use new_stack;

   task one;
   task two;
   task three is
       entry onedone;
       entry twodone;
   end three;

    task body one is
    begin
      Put("One running"); New_Line;
      for i in 1..10 loop
          push(i);
      end loop;
      three.onedone;
      exception
        when stack_overflow =>
            put("Stack has overflowed"); new_line;
            three.onedone;
    end;

    task body two is
    begin
        Put("Two running"); New_Line;
        for i in 91..100 loop
            push(i);
        end loop;
        three.twodone;
       exception
         when stack_overflow =>
              put("Stack has overflowed"); new_line;
              three.twodone;
    end;

    task body three is
      j: integer;
    begin
        accept onedone;
        accept twodone;
        for i in 1..20 loop
            j:= pop;
            put(j); new_line;
        end loop;
        exception
         when stack_underflow =>
              put("Stack has underflowed"); new_line;
    end;

begin
    null;
end;




