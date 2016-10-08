

-- This is the version of the stack package that uses a
-- task to support mutually exclusive access to the stack.


package body new_stack is
 subtype stack_index is integer range 1..20;
 the_stack: array (stack_index) of integer;
 index: integer:= 1;
 finished: boolean := FALSE;

 task stack_call is
    entry push(x:integer);
    entry pop(y:out integer);
 end stack_call;

 task body stack_call is
  begin
        loop 
              select 
                	accept push(x: integer) do
                	  if (index > 20) then
                	      raise stack_overflow;
                	  else 
                	     the_stack(index) := x;
                	     index := index + 1;
                	  end if;
                	end push;
              or
                 accept pop(y:out integer) do
                	 if (index <= 1) then
                	    raise stack_underflow;
                	 else
                	    index := index - 1;
                	    y:= the_stack(index);
                	 end if;
                 end pop;
              or
                  terminate;
             end select;
        end loop;
 end stack_call;

 procedure push(x:integer) is
  begin
    stack_call.push(x);	
  end;

 function pop return integer is
   r:integer;
 begin
   stack_call.pop(r);
   return r;
 end;

end new_stack;

