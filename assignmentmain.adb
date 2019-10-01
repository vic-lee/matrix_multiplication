with Ada.Command_Line, Text_Io;
use  Ada.Command_Line, Text_Io;


procedure AssignmentMain is
	Line : String(1..10);
   	Length : Natural;

   	task Reader1;
   	task body Reader1 is
   		counter : INTEGER range 1 .. MatrixMult.SIZE**2 := 1;
   		Next_Int : INTEGER;
   	begin
		while not Text_Io.End_Of_File loop
			Get(Next_Int);
			Put(Next_Int);
			New_Line;
			counter := counter + 1;
		end loop;
end AssignmentMain;
