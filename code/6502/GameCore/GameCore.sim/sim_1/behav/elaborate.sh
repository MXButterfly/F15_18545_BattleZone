#!/bin/sh -f
xv_path="/afs/ece.cmu.edu/support/xilinx/xilinx.release/Vivado-2015.2/Vivado/2015.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 2b87322c6ff44fa3be084cae8e8f2018 -m64 --debug typical --relax --mt 8 --include "../../../../" -L blk_mem_gen_v8_2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot top_behav xil_defaultlib.top xil_defaultlib.glbl -log elaborate.log
