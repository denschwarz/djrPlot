#!/bin/bash
export SCRAM_ARCH=slc5_amd64_gcc434
cmsDriver.py produceLHE.py -s GEN  --conditions auto:mc --datatier GEN-SIM --eventcontent RAWSIM --no_exec -n 10000 --python_filename produceLHEGEN21.0.py  --fileout produceLHEGEN21.0.root --filein tWZ.lhe
echo "process.generator.jetMatching.MEMAIN_qcut=21.0" >> produceLHEGEN21.0.py
echo "process.generator.jetMatching.outTree_flag=1" >> produceLHEGEN21.0.py
cmsRun produceLHEGEN21.0.py &> produceLHEGEN21.0.log
mv events.tree produceLHEGEN21.0.tree
