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
ExecStep $xv_path/bin/xsim top_behav -key {Behavioral:sim_1:Functional:top} -tclbatch top.tcl -view /afs/ece.cmu.edu/usr/ashresth/Private/545proj/F15_18545_BattleZone/code/6502/GameCore/top_behav.wcfg -log simulate.log
