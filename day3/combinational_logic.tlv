\m5_TLV_version 1d: tl-x.org
\m5



   //use(m5-1.0)   /// uncomment to use M5 macro library.
 \SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   $out1 = ! $in1
   $out2 = $in2 || $in3
   $out3 = $in4 && $in4
   $out4 = $in5 ^ $in6

   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
  endmodule