#!/bin/bash
DATA=/data
#PJT=odm_boruszyn_kap
#PJT=Samseong
#PJT=Sillim
PJT=sillim_ew
#PJT=sillim_ew_debug
#PJT=odm_boruszyn_kap
echo "Compiling SuperBuild"
RUNPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "RUNPATH : ${RUNPATH}"
mkdir -p ${RUNPATH}/SuperBuild/build && cd ${RUNPATH}/SuperBuild/build

#cmake .. && make -j$processes && cd - && echo -e "\n\n\n" && python3 run.py --project-path $DATA $PJT --rerun-from dataset --use-exif --feature-quality ultra --camera-lens perspective --pc-quality ultra #--rerun-from mvs_texturing #--end-with dataset 

cmake .. && make -j$processes && cd - && echo -e "\n\n\n" && python3 run.py --project-path $DATA $PJT --rerun-from odm_dem --use-exif --feature-quality ultra --camera-lens perspective --pc-quality ultra --dsm --dtm --end-with odm_dem
