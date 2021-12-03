#!/bin/bash
export SCRAM_ARCH=slc5_amd64_gcc434
cmsDriver.py produceLHE.py -s GEN  --conditions auto:mc --datatier GEN-SIM --eventcontent RAWSIM --no_exec -n 10000 --python_filename produceLHEGEN37.0.py  --fileout produceLHEGEN37.0.root --filein tWZ.lhe
echo "process.generator.jetMatching.MEMAIN_qcut=37.0" >> produceLHEGEN37.0.py
echo "process.generator.jetMatching.outTree_flag=1" >> produceLHEGEN37.0.py
cmsRun produceLHEGEN37.0.py &> produceLHEGEN37.0.log
mv events.tree produceLHEGEN37.0.tree
