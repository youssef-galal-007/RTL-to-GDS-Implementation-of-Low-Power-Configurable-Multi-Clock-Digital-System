
module Data_synchronizer #(parameter data_width = 8 ,
                                     Num_Stg = 2                // required Num_Stg >= 2
)(
    input                            i_des_clk    ,             // Destination Clock Signal
    input                            i_des_rst_n  ,             // Destination Active Low Reset

    input                            i_bus_en     ,             // Bus enable signal
    input      [data_width - 1 : 0]  i_unsync_bus ,             // Unsynchronized bus

    output reg [data_width - 1 : 0]  o_sync_bus   ,             // synchronized bus
    output reg                       o_en_pulse                 // enable pulse signal
);

reg [ Num_Stg - 1 : 0 ] sync_en_reg ;

wire o_pulse_gen ;
reg  delayed_sync_en ;

// pulse generation logic 
assign o_pulse_gen = ( sync_en_reg[Num_Stg - 1] & (~delayed_sync_en) ) ;

// data bus logic enabled through mux 
always @ ( posedge i_des_clk or negedge i_des_rst_n ) 
begin
    if ( !i_des_rst_n )
    begin
        o_sync_bus <= {data_width{1'b0}} ;
    end
    else if ( o_pulse_gen )
    begin
        o_sync_bus <= i_unsync_bus ;
    end
end

// synchronizer logic 
always @( posedge i_des_clk or negedge i_des_rst_n ) 
begin
    if ( !i_des_rst_n )
    begin
        sync_en_reg <= {Num_Stg{1'b0}} ;
    end
    else
    begin
        sync_en_reg <= { sync_en_reg[Num_Stg - 2 : 0] , i_bus_en } ;            // shifting enable through D_flop
    end
end

// delayed enable logic 
always @( posedge i_des_clk or negedge i_des_rst_n ) 
begin
    if ( !i_des_rst_n )
    begin
        delayed_sync_en <= 'b0 ;
    end
    else
    begin
        delayed_sync_en <= sync_en_reg[Num_Stg - 1] ;
    end
end

// enable pulse generation 
always @( posedge i_des_clk or negedge i_des_rst_n ) 
begin
    if ( !i_des_rst_n )
    begin
        o_en_pulse <= 'b0 ;
    end
    else
    begin
        o_en_pulse <= o_pulse_gen ;
    end
end

endmodule
