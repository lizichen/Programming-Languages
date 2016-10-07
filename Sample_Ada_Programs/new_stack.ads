
package new_stack is 
 procedure push(x:integer);
 function pop return integer;
 stack_overflow, stack_underflow:exception;
end new_stack;

