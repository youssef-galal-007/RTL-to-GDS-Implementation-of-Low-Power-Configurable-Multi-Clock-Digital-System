
module RX_FSM_control_unit #(
   parameter data_width_fsm    = 8 ,
             prescale_bits_fsm = 6 , 
             cnt_bits_fsm = $clog2(data_width_fsm) 
                            
)(
   input                             i_clk_fsm         ,
   input                             i_rst_n_fsm       ,

   input                             i_rx_in_fsm       ,
   input                             i_par_en_fsm      ,

   input [cnt_bits_fsm:0]            i_bit_cnt_fsm     ,
   input [prescale_bits_fsm - 1 : 0] i_edg_cnt_fsm     ,
   input [prescale_bits_fsm - 1 : 0] i_prescale_fsm    ,

   input                             i_par_err_fsm     ,
   input                             i_stp_err_fsm     ,
   input                             i_strt_glitch_fsm ,

   output reg                        o_errors_rst_fsm  ,
   output reg                        o_deser_en_fsm    ,
   output reg                        o_enable_ebc_fsm  ,
   output reg                        o_par_chk_en_fsm  ,
   output reg                        o_stp_chk_en_fsm  ,
   output reg                        o_strt_chk_en_fsm ,
   output reg                        o_dat_samp_en_fsm ,

   output reg                        o_data_valid_fsm  
);

// internal signal 
wire data_valid_comb ;

// fsm states 
typedef enum bit [2:0] { 
            IDLE = 'b000 ,
            STR  = 'b001 ,
            DATA = 'b011 ,
            PAR  = 'b010 ,
            STP  = 'b110  
            } state_e ;

// states pointers 
state_e current_state , next_state ;

// state transition block  
always @( posedge i_clk_fsm or negedge i_rst_n_fsm )
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

// next-state logic 
always @ (*)
begin
   case ( current_state )
      IDLE : 
      begin
         if ( !i_rx_in_fsm )
         begin
            next_state = STR ;
         end
         else
         begin
            next_state = IDLE ;
         end
      end
      STR :
      begin
         if ( ( i_edg_cnt_fsm == i_prescale_fsm - 1 ) ) 
         begin
            // check if glitches occur 
            if ( !i_strt_glitch_fsm )
            begin
               next_state = DATA ;
            end 
            else
            begin
               next_state = IDLE ;
            end  
         end
         else
         begin
            next_state = STR ;
         end
      end
      DATA :
      begin
         if ( ( i_edg_cnt_fsm == i_prescale_fsm - 1 ) && ( i_bit_cnt_fsm == data_width_fsm ) )
         begin
            // checks if parity enable for estimating next state PAR or STP
            if ( i_par_en_fsm )
            begin
               next_state = PAR ;
            end
            else
            begin
               next_state = STP ;
            end
         end
         else
         begin
            next_state = DATA ;
         end
      end
      PAR :
      begin
         if ( i_edg_cnt_fsm == i_prescale_fsm - 1 && ( i_bit_cnt_fsm == data_width_fsm + 'd1 ) )
         begin
            next_state = STP ;
         end
         else
         begin
            next_state = PAR ;
         end
      end
      STP :
      begin
         if ( i_par_en_fsm )
         begin
            if ( i_edg_cnt_fsm == i_prescale_fsm - 1 && ( i_bit_cnt_fsm == data_width_fsm + 'd2 ) )
            begin
               // check if back to back frames 
               if ( !i_rx_in_fsm )
               begin
                  next_state = STR ;
               end
               else
               begin
                  next_state = IDLE ;
               end
            end
            else
            begin
               next_state = STP ;
            end
         end
         else
         begin
            if ( i_edg_cnt_fsm == i_prescale_fsm - 1 && ( i_bit_cnt_fsm == data_width_fsm + 'd1 ) )
            begin
               // check if back to back frames
               if ( !i_rx_in_fsm )
               begin
                  next_state = STR ;
               end
               else
               begin
                  next_state = IDLE ;
               end
            end
            else
            begin
               next_state = STP ;
            end
         end   
      end   
      default: 
      begin
         next_state = IDLE ;
      end
   endcase
end


// Output logic based on current state
always @ (*)
begin

   // intialization 
   o_enable_ebc_fsm  = 'b0 ;
   o_dat_samp_en_fsm = 'b0 ;
   o_strt_chk_en_fsm = 'b0 ;
   o_deser_en_fsm    = 'b0 ;
   o_par_chk_en_fsm  = 'b0 ;
   o_stp_chk_en_fsm  = 'b0 ;
   o_errors_rst_fsm  = 'b0 ; 

   case ( current_state )
      IDLE : 
      begin
         // no operations in the idle 
      end
      STR :
      begin
         // start bit sampling
         o_enable_ebc_fsm  = 'b1 ;
         o_dat_samp_en_fsm = 'b1 ;
         o_errors_rst_fsm = 'b1 ;
         
         if ( i_edg_cnt_fsm >= ( i_prescale_fsm >> 1 ) + 2 )
         begin
            o_strt_chk_en_fsm = 1'b1 ;
         end
         else
         begin
            o_strt_chk_en_fsm = 1'b0 ;
         end
      end
      DATA :
      begin
         // data processing & sampling 
         o_enable_ebc_fsm  = 'b1 ;
         o_dat_samp_en_fsm = 'b1 ;
         o_deser_en_fsm    = 'b1 ;
      end
      PAR :
      begin
         // parity bit sampling & error checking 
         o_enable_ebc_fsm  = 'b1 ;
         o_dat_samp_en_fsm = 'b1 ;

         if ( i_edg_cnt_fsm >= ( i_prescale_fsm >> 1 ) + 2 )
         begin
            o_par_chk_en_fsm  = 'b1 ;
         end
         else
         begin
            o_par_chk_en_fsm  = 'b0 ;
         end
      end
      STP :
      begin
         // stop bit sampling & error checking 
         o_enable_ebc_fsm  = 'b1 ;
         o_dat_samp_en_fsm = 'b1 ;

         if ( i_edg_cnt_fsm >= ( i_prescale_fsm >> 1 ) + 2 )
         begin
            o_stp_chk_en_fsm  = 'b1 ;
         end
         else
         begin
            o_stp_chk_en_fsm  = 'b0 ;
         end         
      end       
      default: 
      begin
         
      end
   endcase
end

// data valid condition 
assign data_valid_comb = ( current_state == STP ) 
                      && ( i_edg_cnt_fsm == i_prescale_fsm - 1) 
                      && ( !i_stp_err_fsm ) 
                      && ( !i_par_en_fsm || !i_par_err_fsm ) ;

// data valid assigning 
always @( posedge i_clk_fsm or negedge i_rst_n_fsm ) 
begin
   if ( !i_rst_n_fsm )
   begin
      o_data_valid_fsm <= 'b0 ;
   end
   else
   begin
      o_data_valid_fsm <= data_valid_comb ;
   end
end

endmodule
