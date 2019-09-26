with Ada.Command_Line, Text_Io;
use  Ada.Command_Line, Text_Io;


procedure AssignmentMain is
	Line : String(1..10);
   	Length : Natural;
begin
	while not Text_Io.End_Of_File loop
		Get_Line(Item => Line, Last => Length);
		Put(Line);
	end loop;
end AssignmentMain;
