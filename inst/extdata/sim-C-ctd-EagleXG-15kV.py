# -*- coding: utf-8 -*-
"""sim-C-ctd-EagleXG-15kV.py

   Date     Who  Comment
----------  ---  -----------------------------------------------
2017-05-19  JRM  Simulation EDS spectra from bulk Corning Eagle
                 XG glass.
2018-07-21  JRM  Copy in ext/data in rpenepma pkg. Change to 15 kV,
                 Set image size to 5 microns sq.


"""

import sys
sys.packageManager.makeJavaPackage("gov.nist.microanalysis.NISTMonte.Gen3", "CharacteristicXRayGeneration3, BremsstrahlungXRayGeneration3,FluorescenceXRayGeneration3, XRayTransport3", None)


import os

import gov.nist.microanalysis.EPQLibrary as epq
import gov.nist.microanalysis.EPQLibrary.Detector as epd
import gov.nist.microanalysis.NISTMonte as nm
import gov.nist.microanalysis.NISTMonte.Gen3 as nm3
import gov.nist.microanalysis.EPQTools as et
import gov.nist.microanalysis.dtsa2 as dt2

import dtsa2.jmGen as jmg
import dtsa2.mcSimulate3 as mc3

import shutil
import time

import java.util as jutil
import java.io as jio
import java.nio.charset as cs
import string


start = time.time()


gitDir  = os.environ['GIT_HOME']
gitDir  = gitDir.replace('\\','/')
rPrjDir = "/rpenepma/inst/extdata"
inDir   = gitDir + rPrjDir
rptDir  = inDir + '/sim-C-ctd-EagleXG-15kV Results/'
outDir  = inDir + '/sim'
jmg.ensureDir(outDir)

bVerbose = False
det      = findDetector("Oxford p4 05eV 4K")
e0       =    15.0   # kV
nTraj    =  20000    # trajectories
lt       =    100    # sec
pc       =     5.0   # nA
imgSize  =   512     # pixel size for images
imgSzUm  =    5.0    # image size in microns
vmrlEl   =    40     # number of el for VMRL
tCNm     =    20.0   # thickness of C on EagleXG in nm
przDepUm =     1.0   # phirhoz depth in microns
rhoC     =     2.267 # C density
rhoEXG   =     2.36  # Eagle XG density 


dose = pc * lt  # na-sec"

DataManager.clearSpectrumList()

c = material("C", density=rhoC)
eagleXG = mixture({"SiO2"  : 0.6447825,
                  "Al2O3" : 0.1702057,
                  "B2O3"  : 0.1051482,
                  "CaO"   : 0.0542376,
                  "MgO"   : 0.0128153,
                  "SrO"   : 0.0082368,
                  "SnO2"  : 0.0015215,
                  "BaO"   : 0.0012188,
                  "Fe2O3" : 0.0005078,
                  "Sb2O3" : 0.0004635,
                  "As2O3" : 0.0003145,
                  "ZrO2"  : 0.0002938,
                  "TiO2"  : 0.0002540
                 },
                 density=2.36,
                 name="Eagle XG")



layers = [ [c,   tCNm*1.0e-9],
           [eagleXG, 50.0e-6]
         ]

xrts = []

trs = mc3.suggestTransitions(eagleXG, e0)
for tr in trs:
    xrts.append(tr)

trs = mc3.suggestTransitions(c, e0)
for tr in trs:
    xrts.append(tr)



xtraParams={}
xtraParams.update(mc3.configurePhiRhoZ(przDepUm*1.0e-6))
xtraParams.update(mc3.configureXRayAccumulators(xrts,True, True, True))
# note that the image size on the specimen is in meters...
xtraParams.update(mc3.configureEmissionImages(xrts, imgSzUm*1.0e-6, imgSize))
xtraParams.update(mc3.configureTrajectoryImage(imgSzUm*1.0e-6, imgSize))
xtraParams.update(mc3.configureVRML(nElectrons = vmrlEl))
xtraParams.update(mc3.configureOutput(outDir))

print(xtraParams)

fmtS = "%g-nm-C-on-EagleXG-at-%g-kV"

print("Starting simulation")

multiLaySim = mc3.multiFilm(layers, det, e0, True, nTraj, dose, True, True, xtraParams)
sName = fmtS % (tCNm, e0)
multiLaySim.rename(sName)
multiLaySim.setAsStandard(eagleXG)
multiLaySim.display()
fi =  outDir + "/"
fi += sName
fi += "-%g-Traj.msa" % (nTraj)
multiLaySim.save(fi)

# clean up cruft
shutil.rmtree(rptDir)
print "Done!"

end = time.time()
delta = (end-start)/60
msg = "This script required %.3f min" % delta
print msg
if(delta > 60):
    delta = delta/60
    msg = "...or %.3f hr" % delta
    print msg

