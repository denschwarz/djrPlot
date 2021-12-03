#!/bin/bash
export SCRAM_ARCH=slc5_amd64_gcc434
cmsDriver.py produceLHE.py -s GEN  --conditions auto:mc --datatier GEN-SIM --eventcontent RAWSIM --no_exec -n 10000 --python_filename produceLHEGEN6.0.py  --fileout produceLHEGEN6.0.root --filein tWZ.lhe
echo "process.generator.jetMatching.MEMAIN_qcut=6.0" >> produceLHEGEN6.0.py
echo "process.generator.jetMatching.outTree_flag=1" >> produceLHEGEN6.0.py
cmsRun produceLHEGEN6.0.py &> produceLHEGEN6.0.log
mv events.tree produceLHEGEN6.0.tree
