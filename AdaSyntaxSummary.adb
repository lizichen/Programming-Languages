
-- Ada Syntax

-- Compile and Run an Ada program:
	-- 1. Compile: 	gnatmake test.adb
	-- 2. Run:		./test

-- Ada program each consists of two parts: 
-- 1. Declaration / Specification
-- 2. Body

-- Package Specification file (*.ads)
package packageStackSample is -- same name as Package Body
	procedure push(x:integer);
	function pop return integer;
	stack_overflow, stack_underflow: exception;
end packageStackSample;

-- Package body (*.adb)
package body packageStackSample is -- same name as Package Specification
	procedure push(x: integer) is
	begin
		-- Do some push
	end;
	function pop return integer is
	begin
		-- Do some pop
		-- return some value
	end;
end packageStackSample;

-- import package or other adb
with sample.adb;
with text.io;

-- declare a procedure
procedure sampleProcedure is
	begin
		dosomething(withsomething);
	end sampleProcedure;

-- declare variables and types
index: integer:= 1;

-- create an array
subtype stack_index is integer range 1..20;
the_stack: array (stack_index) of integer;

-- if statement
if (index > 10) then
	index := index - 1;
else
	index := index + 1;

-- for loop:
for i in 1..n loop
	dosomething(i);
end loop;

-- I/O
put("print out this line.");
get(x); -- get input from console and assign to x

-- Task
task taskName is
	--declarations of exported identifiers
	entry someEntry; -- Rendezvours
end taskName;
task body taskName is
	-- statements
end taskName;
-- If there is content, task declaration can just be itself.
task taskName2;
task body taskName2 is
	-- statements
end taskName2;

-- Exception
	-- In package specification: packageStackSample, have
	stack_underflow, stack_overflow: exception;
	-- In package body: packageStackSample, have
	procedure push(x:integer) is
		begin
			if (index > 20) then
				raise stack_overflow;
		end;
	-- In main procedure
	exception
	   when stack_overflow =>
	        put("Stack has overflowed"); new_line;


	



