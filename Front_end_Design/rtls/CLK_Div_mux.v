
module CLK_Div_mux #(parameter  prescale_bits = 6 ,
                                data_width    = 8 
) (
    input      [ prescale_bits - 1 : 0 ] i_config_prescale  ,

    output reg [ data_width - 1 : 0 ]    o_config_prescale
);

always @ (*)
begin
    case ( i_config_prescale )
    
    6'b100000 :
    begin
        o_config_prescale = 'd1 ;
    end

    6'b010000 :
    begin
        o_config_prescale = 'd2 ;
    end

    6'b001000 :
    begin
        o_config_prescale = 'd4 ;
    end

    6'b000100 :
    begin
        o_config_prescale = 'd8 ;
    end

    6'b000010 :
    begin
        o_config_prescale = 'd16 ;
    end

    6'b000001 :
    begin
        o_config_prescale = 'd32 ;
    end

    default :
    begin
        o_config_prescale = 'd1 ;
    end

    endcase 
end

endmodule 