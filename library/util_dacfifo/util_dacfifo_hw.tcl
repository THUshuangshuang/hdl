
package require qsys
source ../scripts/adi_env.tcl
source ../scripts/adi_ip_intel.tcl

ad_ip_create util_dacfifo {UTIL DAC FIFO Interface}
ad_ip_files util_dacfifo [list\
  $ad_hdl_dir/library/common/ad_mem.v \
  $ad_hdl_dir/library/common/ad_mem_asym.v \
  $ad_hdl_dir/library/common/ad_b2g.v \
  $ad_hdl_dir/library/common/ad_g2b.v \
  util_dacfifo.v \
  util_dacfifo_bypass.v \
  util_dacfifo_constr.sdc]

# parameters

ad_ip_parameter DEVICE_FAMILY STRING {Arria 10}
ad_ip_parameter ADDRESS_WIDTH INTEGER 6
ad_ip_parameter DATA_WIDTH INTEGER 128

# interfaces

ad_interface clock dma_clk input 1 clk
ad_interface reset dma_rst input 1 if_dma_clk
ad_interface signal dma_valid input 1 valid
ad_interface signal dma_data input DATA_WIDTH data
ad_interface signal dma_ready output 1 ready
ad_interface signal dma_xfer_req input 1 xfer_req
ad_interface signal dma_xfer_last input 1 last

ad_interface clock dac_clk input 1
ad_interface reset dac_rst input 1 if_dac_clk
ad_interface signal dac_valid input 1 valid
ad_interface signal dac_data output DATA_WIDTH data
ad_interface signal dac_xfer_out output 1 xfer_req
ad_interface signal dac_dunf output 1 unf

ad_interface signal bypass input 1 bypass

