\m5_TLV_version 1d: tl-x.org
\m5



   //use(m5-1.0)   /// uncomment to use M5 macro library.
 \SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   |pipeline
      @1
	$err1 = $bad_input || $illegal_op;
	$err1 = $reset ? 0 : $err1;
      @3
        @err2 = $reset ? $over_flow : 0;

      @6
        err3 = $reset ? $div_by_zero : 0;

   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
  endmodule