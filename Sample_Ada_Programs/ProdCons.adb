with Text_Io;  -- always need these two lines for printing
use Text_Io;

procedure Prodcons is 
   
   package Int_Io is new Integer_Io(Integer);  -- always need these two lines
   use Int_Io;                                 -- to print integers

   task Producer;
   
   task Consumer is
      entry Go(X:Integer);
      entry Done;
   end Consumer;
   
   task body Producer is
      Z: Integer := 0;
   begin
      for I in 1..10 loop
	 
	 for Y in 1..1000 loop   -- just code to take some time.
	    Z := Z + Y;          -- it can execute while Consumer
	 end loop;               -- is consuming the previous produced value.
	 
	 Consumer.Go(I);   -- entry call providing data to Consumer
      end loop;
      Consumer.Done;  -- entry call signalling producing is done.
   end Producer;
   
   task body Consumer is 
      Sum: Integer := 0;
      Num: Integer;
      Finished: Boolean := False;
      Z: Integer := 0;
   begin
	 while not Finished loop
	 Put("while not finished loop in Consumer...");New_Line;
	 select    -- allows waiting for one of multiple entry calls
	    
	    accept Go(X:Integer) do  -- if this entry call comes in, 
	       Num := X;             -- then continue computing
	    end Go;
	    Sum := Sum + Num;
	    for Y in 1..1000 loop   -- more code to take some time
	       Z := Z + Y;          -- it can execute while Producer
	    end loop;               -- is executing.
	    
	 or 
	    
	    accept Done;      -- if this entry call comes in, we're done.
	    Finished := True; 
    	 end select;
     end loop;
     Put("Result is "); Put(Sum); New_Line;
   end Consumer;
   
begin -- ProdCons
   null;
end ProdCons;

  

