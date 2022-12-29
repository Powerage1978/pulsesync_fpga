# Test simulation setup



```
xvlog src/hdl/myip_v1_0_S00_AXI.v --nolog
```


```
xvlog -sv sim/myip_v1_0_S00_AXI_tb.sv --nolog
```


```
xelab -top myip_v1_0_S00_AXI_tb -snapshot myip_tb_snapshot -debug all --nolog
```


```
xsim myip_tb_snapshot --tclbatch tcl/xsim_cfg.tcl --wdb sim/myip_tb_snapshot.wdb --nolog
```


```
xsim --gui sim/myip_tb_snapshot.wdb -view sim/cfg/myip_v1_0_S00_AXI_tb_behav.wcfg -tempDir tmp --nolog
```


Run a single test:

```
make simulate TB_TOP="axi4lite_bram_tb"
```