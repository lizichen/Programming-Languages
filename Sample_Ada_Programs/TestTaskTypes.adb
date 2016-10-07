

with text_io;
use text_io;

procedure TestTaskTypes is
   
   package int_io is new integer_io(integer);
   use int_io;

   Size: constant Integer := 10;
 
   
   task type MyTaskType is
      entry SetValue(Val: Integer);
      entry GetValue(Val: out Integer);
   end MyTaskType;

   task body MyTaskType is 
      Value : Integer;
   begin
      accept SetValue(Val: Integer) do  -- Val is only visible w/in entry block
	  Value := Val;
      end SetValue;
      
      Value := Value * 2;
      
      accept GetValue(Val: out Integer) do
	 Val := Value;
      end GetValue;
   end MyTaskType;
   
   MyTasks: array(1..Size) of MyTaskType; 
   
   begin -- Task_Type
   for Index in 1..Size loop
	 MyTasks(Index).SetValue(Index);
   end loop;
   
   declare -- for declaring new variables
      Val: Integer;
   begin
      for Index in 1..Size loop
	 MyTasks(Index).GetValue(Val);
	 Put(Item => Val, Width => 4);  -- using named parameters
      end loop;
      
      New_Line;
   end;
      
end TestTaskTypes;


