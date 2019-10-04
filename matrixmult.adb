with Text_Io;
use  Text_Io;

with Ada.Integer_Text_IO;
use  Ada.Integer_Text_IO;


package body MatrixMult is

	procedure MatMult(A: in Matrix; B: in Matrix; C: out Matrix) is

		task type Mult_Worker is
			entry Mult_Cell(A_Row : in INTEGER;
							B_Col : in INTEGER);
			entry Completed(Ans : out INTEGER);
		end Mult_Worker;

		task body Mult_Worker is
			Sum 	: INTEGER := 0;
			Row 	: INTEGER;
			Col 	: INTEGER;
		begin
			accept Mult_Cell(A_Row : in INTEGER;
							 B_Col : in INTEGER) do
				Row := A_Row;
				Col := B_Col;
			end Mult_Cell;

			for Index in 1 .. SIZE loop
				Sum := Sum + A(Row, Index) * B(Index, Col);
			end loop;

			accept Completed(Ans : out INTEGER) do
				Ans := Sum;
			end Completed;
		end Mult_Worker;

		Workers : array(1 .. SIZE, 1 .. SIZE) of Mult_Worker;

	begin
		for Row in 1 .. SIZE loop
			for Col in 1 .. SIZE loop
				Workers(Row, Col).Mult_Cell(Row, Col);
			end loop;
		end loop;

		for Row in 1 .. SIZE loop
			for Col in 1 .. SIZE loop
				Workers(Row, Col).Completed(C(Row, Col));
			end loop;
		end loop;
	end MatMult;

end MatrixMult;
