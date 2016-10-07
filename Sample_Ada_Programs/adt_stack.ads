package adt_stack is

   type stack is private;   
   procedure initialize(s: out stack);
   procedure push(s: in out stack; x:integer);
   procedure pop(s: in out stack; x: out integer);
   stack_overflow, stack_underflow:exception;

private
   type int_array is array(1..20) of integer;
   type stack is record
       the_stack: int_array;
       index: integer;
       end record;

end adt_stack;

