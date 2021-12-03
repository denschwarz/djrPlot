#!/bin/bash
export SCRAM_ARCH=slc5_amd64_gcc434
cmsDriver.py produceLHE.py -s GEN  --conditions auto:mc --datatier GEN-SIM --eventcontent RAWSIM --no_exec -n 10000 --python_filename produceLHEGEN32.0.py  --fileout produceLHEGEN32.0.root --filein tWZ.lhe
echo "process.generator.jetMatching.MEMAIN_qcut=32.0" >> produceLHEGEN32.0.py
echo "process.generator.jetMatching.outTree_flag=1" >> produceLHEGEN32.0.py
cmsRun produceLHEGEN32.0.py &> produceLHEGEN32.0.log
mv events.tree produceLHEGEN32.0.tree
