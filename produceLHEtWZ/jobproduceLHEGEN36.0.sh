#!/bin/bash
export SCRAM_ARCH=slc5_amd64_gcc434
cmsDriver.py produceLHE.py -s GEN  --conditions auto:mc --datatier GEN-SIM --eventcontent RAWSIM --no_exec -n 10000 --python_filename produceLHEGEN36.0.py  --fileout produceLHEGEN36.0.root --filein tWZ.lhe
echo "process.generator.jetMatching.MEMAIN_qcut=36.0" >> produceLHEGEN36.0.py
echo "process.generator.jetMatching.outTree_flag=1" >> produceLHEGEN36.0.py
cmsRun produceLHEGEN36.0.py &> produceLHEGEN36.0.log
mv events.tree produceLHEGEN36.0.tree
