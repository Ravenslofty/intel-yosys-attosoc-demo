#!/bin/bash
yosys -p "synth_intel_alm -family cyclonev -top attosoc -vqm output.vqm" attosoc.v picorv32.v
quartus_map -c attosoc attosoc
quartus_fit -c attosoc attosoc
quartus_asm -c attosoc attosoc
quartus_sta -c attosoc attosoc
quartus_pgm --haltcc --mode JTAG --operation "P;attosoc.sof@2"
