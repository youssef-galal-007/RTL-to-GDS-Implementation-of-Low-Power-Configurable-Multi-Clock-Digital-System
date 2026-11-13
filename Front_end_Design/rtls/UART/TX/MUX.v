
module MUX (
    input [1:0] i_mux_sel_M   ,         // mux selection 
    input       i_start_bit_M ,         // start bit 
    input       i_stop_bit_M  ,         // stop bit 
    input       i_ser_data_M  ,         // serialized bit 
    input       i_par_bit_M   ,         // parity bit 
    output reg  o_TX_OUT_M              // mux output
);

always @ (*) 
begin

    // default output mux 
    o_TX_OUT_M = 'b1 ;

    case ( i_mux_sel_M )

    'b00 :      // start_bit selection                                
    begin
        o_TX_OUT_M = i_start_bit_M ;
    end

    'b01 :      // stop_bit selection
    begin
        o_TX_OUT_M = i_stop_bit_M ;
    end

    'b10 :      // data_frame selection                                
    begin
        o_TX_OUT_M = i_ser_data_M ;
    end

    'b11 :      // parity_bit selection                                   
    begin
        o_TX_OUT_M = i_par_bit_M ;
    end
    endcase
end

endmodule 