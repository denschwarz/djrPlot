#!/bin/bash
export SCRAM_ARCH=slc5_amd64_gcc434
cmsDriver.py produceLHE.py -s GEN  --conditions auto:mc --datatier GEN-SIM --eventcontent RAWSIM --no_exec -n 10000 --python_filename produceLHEGEN13.0.py  --fileout produceLHEGEN13.0.root --filein tWZ.lhe
echo "process.generator.jetMatching.MEMAIN_qcut=13.0" >> produceLHEGEN13.0.py
echo "process.generator.jetMatching.outTree_flag=1" >> produceLHEGEN13.0.py
cmsRun produceLHEGEN13.0.py &> produceLHEGEN13.0.log
mv events.tree produceLHEGEN13.0.tree
