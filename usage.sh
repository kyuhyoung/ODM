#!/bin/bash
DATA=/data
#PJT=odm_boruszyn_kap
#PJT=Samseong
PJT=samsung_copy
#PJT=odm_boruszyn_kap
echo "Compiling SuperBuild"
RUNPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "RUNPATH : ${RUNPATH}"
#cd ${RUNPATH}/SuperBuild
#mkdir -p build && cd build
mkdir -p ${RUNPATH}/SuperBuild/build && cd ${RUNPATH}/SuperBuild/build

#cmake .. && make -j$processes && cd - && echo -e "\n\n\n" && python3 run.py --project-path $DATA $PJT --rerun-from mvs_texturing
cmake .. && make -j$processes && cd - && echo -e "\n\n\n" && python3 run.py --project-path $DATA $PJT --dsm --dtm --rerun-from odm_dem --end-with odm_dem
