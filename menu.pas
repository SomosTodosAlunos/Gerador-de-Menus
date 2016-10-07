Program Pzim ;

Type
	array_options = array[1..20] of String;
	
Var
	options: array_options;
	length, selected: integer;


Procedure menu(options: array_options; var length: integer; active: integer);
	var 
		i: integer;

	begin
		clrscr();
	  length := 0;
		
		writeln('#################################');
		writeln('');
		
		for i:=1 to 20 do
			begin
				if options[i] <> '' then
					begin
						if active = i then
							begin
								writeln('> ', i, '  -  ', options[i]);
								length := length + 1;
							end
						else 
							begin
							 	writeln('  ', i, '  -  ', options[i]);
								length := length + 1;
							end;			
					end;	 
			end; 
		
		writeln('');
		writeln('#################################');
	end;

Function select(options: array_options; length: integer): integer;
	var 
		i, active: integer;
		key : char;
	
	begin 
		key := #28;
		active := 1;
				
		repeat
			key := ReadKey(); 
		
			case key of  
				#72: begin
					active := active - 1;
					
					if active < 1 then
						active := 1;	
					
					menu(options, length, active)
				end;
				#80: begin
					active := active + 1;
					
					if active > length then
						active := length;	
					
					menu(options, length, active);
				end;	
			end;	
		until (key = #27) or (key = #13);
		
		if key = #13 then 
			select := active
		else
			select := 0;
		
	end;

  
Begin
	options[1] := 'Criar Arquivo';
  options[2] := 'Cadastrar palavras';   
  options[3] := 'contar Palavras';
  options[4] := 'exibir as palavras';
  options[5] := 'Procurar uma Palavra';
  options[7] := 'Sair';
  
	menu(options, length, 1);
	
	selected := select(options, length);
	
	if selected = 0 then
		write('até mais')
	else
		begin
		  writeln('');
			writeln('A opção escolhida foi ', options[selected]);	
		end;	
End.