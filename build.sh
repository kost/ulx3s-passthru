#!/bin/sh

export ulx3s_dist=/dist/

 git clone https://github.com/emard/ulx3s-passthru && \
 cd ulx3s-passthru/proj/universal-make && \
 for size in 25 45 85; do make clean; make FPGA_SIZE=${size} ulx3s_${size}f_passthru.bit; make FPGA_SIZE=${size} ulx3s_${size}f_passthru.bit; cp -a project/project_project.bit $ulx3s_dist/ulx3s_${size}f_passthru.bit; done && \
 /opt/ulx3s/bin/ecpunpack --input $ulx3s_dist/ulx3s_25f_passthru.bit --textcfg /tmp/ulx3s_12f_passthru.config --idcode 0x41111043 && \
 /opt/ulx3s/bin/ecppack --input /tmp/ulx3s_12f_passthru.config --bit $ulx3s_dist/ulx3s_12f_passthru.bit --compress --idcode 0x21111043 && \
 echo "[Success]"
