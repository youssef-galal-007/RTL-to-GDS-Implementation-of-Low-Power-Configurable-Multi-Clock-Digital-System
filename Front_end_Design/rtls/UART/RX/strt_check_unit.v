
module strt_check_unit (
    input       i_strt_chk_en_strt  ,
    input       i_sampled_bit_strt  ,

    output reg  o_strt_glitch        
);

always @(*) 
begin
    if ( i_strt_chk_en_strt )
    begin
        if ( i_sampled_bit_strt != 1'b0 )           // check start glitch
        begin
            o_strt_glitch = 1'b1 ;
        end
        else
        begin
            o_strt_glitch = 1'b0 ;
        end
    end
    else
    begin
        o_strt_glitch = 1'b0 ;
    end
end
endmodule