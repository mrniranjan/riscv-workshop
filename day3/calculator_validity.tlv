\m5_TLV_version 1d: tl-x.org
\m5



   //use(m5-1.0)   /// uncomment to use M5 macro library.
 \SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
	@0
           $reset  = *reset;
	   $valid = $reset ? 0 : 1;
	@1
	   $valid_or_reset = $valid || $reset
	   
	?$valid_or_reset
    	   @1
 	      $sum[31:0] = $val1[31:0] + $val2[31:0];
	      $diff[31:0] = $val1[31:0] - $val2[31:0];
	      $prod[31:0] = $val1[31:0] * $val2[31:0];
	      $div[31:0] = $val1[31:0] / $val2[31:0];

	      $valid = $reset ? 0 : 1;
	      $val1[31:0] = $reset ? 0 : >>2$out[31:0];
     @2
	   // use mux to select any 1 operation
	   $out[31:0] = $reset ? 0 : $op[0] ? $sum : $op[1] ? $diff : $op[2] ? $prod : $div;

   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 16'b30;
\SV
  endmodule
