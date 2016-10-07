package Protected_Stack is
 procedure push(x:integer);
 function pop return integer;
 stack_overflow, stack_underflow:exception;
end Protected_Stack;

