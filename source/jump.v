// Function to find Jump and Subroutine instruction

function jump_instruction;  
  input [15:0]instruction;
  input [15:0]result;  
    begin      
      jump_instruction = 0;      
      case(instruction[8:6])       
          JMP:     
          begin
            if(instruction[5:3] == 3'b000)
              begin
                $display("Can not use Register addressing mode for JMP instruction");
              end             
             else
               begin
                result = read_word(instruction[5:3], instruction[2:0]);
                if(result%2 == 0)
                begin
                   R[PC] = result;
                end                  
                else
                  $display("Boundry Error. The address cannot be odd");                
               end      
         end          
           RTS:
           begin
                result = read_word(instruction[5:3],instruction[2:0]);
                R[PC] = result;              
           end
  	endcase
end       
endfunction