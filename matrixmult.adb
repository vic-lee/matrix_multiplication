with Text_Io;
use  Text_Io;

with Ada.Integer_Text_IO;
use  Ada.Integer_Text_IO;


package body MatrixMult is

	task type Mult_Worker is
		entry Mult_Cell(A     : in Matrix;
						B     : in Matrix;
						A_Row : in INTEGER;
						B_Col : in INTEGER;
						Ans   : out INTEGER);
	end Mult_Worker;

	task body Mult_Worker is
		Cum : INTEGER := 0;
	begin
		loop
			select
				accept Mult_Cell(A     : in Matrix;
								 B     : in Matrix;
								 A_Row : in INTEGER;
								 B_Col : in INTEGER;
								 Ans   : out INTEGER) do
				    for Index in 1 .. SIZE loop
						Cum := Cum + A(A_Row, Index) * B(Index, B_Col);
					end loop;
					Ans := Cum;
				end Mult_Cell;
				or
					terminate;
			end select;
		end loop;
	end Mult_Worker;

	Workers : array(1 .. SIZE, 1 .. SIZE) of Mult_Worker;

	procedure MatMult(A: in Matrix; B: in Matrix; C: out Matrix) is
	begin
		for Row in 1 .. SIZE loop
			for Col in 1 .. SIZE loop
				Workers(Row, Col).Mult_Cell(A, B, Row, Col, C(Row, Col));
			end loop;
		end loop;
	end MatMult;

end MatrixMult;
