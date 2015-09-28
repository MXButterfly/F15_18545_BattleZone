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
ExecStep $xv_path/bin/xsim fb_top_behav -key {Behavioral:sim_1:Functional:fb_top} -tclbatch fb_top.tcl -view /afs/ece.cmu.edu/usr/htay/frame_buffer/fb_top_behav.wcfg -log simulate.log
