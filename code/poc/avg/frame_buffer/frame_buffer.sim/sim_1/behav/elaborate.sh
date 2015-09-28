#!/bin/sh -f
xv_path="/afs/ece/support/xilinx/xilinx.release/Vivado"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 96a5931274a14026bb409a00eeb60ca0 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L blk_mem_gen_v8_2 -L unisims_ver -L unimacro_ver -L secureip --snapshot fb_top_behav xil_defaultlib.fb_top xil_defaultlib.glbl -log elaborate.log
