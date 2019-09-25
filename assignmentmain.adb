with Text_Io;
use Text_Io;

procedure AssignmentMain is
    Input_File: File_Type;
begin
    Open(File => Input_File, 
         Mode => In_File, 
         Name => "input.txt");
    loop
        declare
            Line: String := Get_Line(Input_File);
        begin
            Put_Line(Line);
        end;
    end loop;
    Close(Input_File);
exception
    when End_Error =>
        if Is_Open(Input_File) then
            Close(Input_File);
        end if;
end AssignmentMain;
