#!/bin/bash

# From @cMadan { https://riojournal.com/article/10398 } 
# Once the requisite tools have been installed (for github fetch see code/config.sh),
# the script herein should take the output from code/fs_extract.sh
# and convert to STL file for 3d printing.

# Replace the path below with your local path to the directory you
# have the tools installed, or where you want to clone them
export APPS_DIR=/volumes/lighthall_lab/apps
export CODE_DIR="${0%/*}"

cd $APPS_DIR/vcglib/apps/tridecimator
qmake tridecimator.pro
make
cd $CODE_DIR


mg=%APPS_DIR/meshgeo/meshgeometry_mac
td=%APPS_DIR/vcglib/apps/tridecimator/tridecimator
ml=/applications/meshlab.app/Contents/MacOS/meshlabserver



f=rh.pial
$mg -i $f -centre -o $f.ply
$td $f.ply $f.dec.ply 100000
$ml -i $f.dec.ply -o $f.dec.stl

f=lh.pial
$mg -i $f -centre -o $f.ply
$td $f.ply $f.dec.ply 100000
$ml -i $f.dec.ply -o $f.dec.stl