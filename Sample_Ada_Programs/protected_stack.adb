
package body Protected_Stack is

 subtype stack_index is integer range 1..20;
 the_stack: array (stack_index) of integer;
 index: integer:= 1;

 protected P_Stack is
  procedure Protected_Push(X:Integer);
  function  Protected_Pop return Integer;
 end P_Stack;

 protected body P_Stack is


     procedure Protected_Push(x:integer) is
      begin
        if (index > 20) then
          raise stack_overflow;
        else
          the_stack(index) := x;
          index := index + 1;
        end if;
      end;

     function Protected_Pop return integer is
     begin
       if (index <= 1) then
         raise stack_underflow;
       else
        index := index - 1;
        return the_stack(index);
       end if;
     end;
 end P_Stack;



 procedure push(x:integer) is
 begin
    P_Stack.Protected_Push(X);
 end Push;


 function pop return Integer is
 begin
    return P_Stack.Protected_Pop;
 end;

end Protected_Stack;

