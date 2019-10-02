with Ada.Command_Line, Text_Io, Ada.Integer_Text_IO, MatrixMult;
use  Ada.Command_Line, Text_Io, Ada.Integer_Text_IO, MatrixMult;


procedure AssignmentMain is

   	task type Matrix_Reader is
   		entry Start_Reading_Matrix(M : out MatrixMult.Matrix);
   	end Matrix_Reader;

   	task body Matrix_Reader is
   		Next_Int : INTEGER;
   		Col, Row : INTEGER range 1 .. MatrixMult.SIZE := 1;
   	begin
   		loop
   			select
   				accept Start_Reading_Matrix(M : out MatrixMult.Matrix) do
   					Col := 1;
   					Row := 1;
	   				while not Text_Io.End_Of_File or Row <= MatrixMult.SIZE loop
						Get(Next_Int);
						M(Row, Col) := Next_Int;
						if Col < MatrixMult.SIZE then
							Col := Col + 1;
						else
							Col := 1;
							if Row + 1 > MatrixMult.SIZE then
								exit;
							end if;
							Row := Row + 1;
						end if;
					end loop;
   				end Start_Reading_Matrix;
   			or
   				terminate;
   			end select;
   		end loop;
   	end Matrix_Reader;
end AssignmentMain;
