
module Control_unit_FSM (
    input            i_clk_fsm        ,
    input            i_rst_n_fsm      ,
    input            i_Data_Valid_fsm ,
    input            i_ser_done_fsm   ,
    input            i_PAR_EN_fsm     ,
    output reg       o_ser_en_fsm     ,
    output reg       o_busy_fsm       ,
    output reg [1:0] o_mux_sel_fsm
);

// states encoding ( gray-coded )
typedef enum bit [2:0] { 
            IDLE = 'b000 ,
            STR  = 'b001 ,
            DATA = 'b011 ,
            PAR  = 'b010 ,
            STP  = 'b110  
            } state_e ;  

// mux_sel encoding ( binary-coded )
localparam  START_MS = 'b00 ,
            STOP_MS  = 'b01 ,
            DATA_MS  = 'b10 ,
            PAR_MS   = 'b11 ;


state_e current_state , next_state ;                      // signals to hold the states transition

// states transition logic 
always @ ( posedge i_clk_fsm or negedge i_rst_n_fsm )
begin
    if ( !i_rst_n_fsm )
    begin
        current_state <= IDLE ;
    end
    else
    begin
        current_state <= next_state ;
    end
end

// states selection logic 
always @(*) 
begin

    // initialization 
    o_ser_en_fsm = 'b0 ;
    o_busy_fsm = 'b0 ;
    o_mux_sel_fsm = STOP_MS ;
    next_state = IDLE ;

    case ( current_state )

    // no operation state
    IDLE :                                  
    begin
        o_mux_sel_fsm = STOP_MS ;

        if ( i_Data_Valid_fsm && !o_busy_fsm )
        begin
            next_state = STR ;
        end
        else
        begin
            next_state = IDLE ;
        end
    end

    // start sending the frame 
    STR :                                  
    begin
        o_busy_fsm = 'b1 ;
        o_mux_sel_fsm = START_MS ;

        next_state = DATA ;
    end

    // data frame transmiting 
    DATA :                                 
    begin
        o_busy_fsm = 'b1 ;
        o_ser_en_fsm = 'b1 ;
        o_mux_sel_fsm = DATA_MS ;

        if ( i_ser_done_fsm )
        begin
            // checking on parity enable 
            next_state = ( i_PAR_EN_fsm ) ? PAR : STP ;        
        end
        else
        begin
            next_state = DATA ;
        end
    end

    // adding parity bit if enabled
    PAR :                                  
    begin
        o_busy_fsm = 'b1 ;
        o_mux_sel_fsm = PAR_MS ;

        next_state = STP ;
    end

    // the frame ending 
    STP :                                  
    begin
        o_busy_fsm = 'b1 ;
        o_mux_sel_fsm = STOP_MS ;

        next_state = IDLE ;
    end
    
    default :
    begin
        next_state = IDLE ;
    end

    endcase    
end

endmodule
