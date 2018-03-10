#!/bin/bash

export DOWNLOAD_DIR=~/Downloads
export APPS_DIR=~/Applications

export FS_VERSION=6.0.0
export FS_FILENAME=freesurfer-Linux-centos6_x86_64-stable-pub-v$FS_VERSION.tar.gz
export FS_HOST=ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/$FS_VERSION/$FS_FILENAME

export ML_VERSION=2016.12
export ML_FILENAME=v$ML_VERSION.tar.gz
export ML_HOST=https://github.com/cnr-isti-vclab/meshlab/archive/$ML_FILENAME

# Fetching and extracting Freesurfer from the Host addr. above
if ! [ -d "$APPS_DIR/freesurfer" ]; then
	wget $FS_HOST
	sudo tar -C $APPS_DIR -xzvf $FS_FILENAME
	rm $FS_FILENAME
fi

# Fetching and extracting Meshlab from the host addr.
if ! [ -d "$APPS_DIR/meshlab-$ML_VERSION" ]; then
	wget $ML_HOST
	sudo tar -C $APPS_DIR -xzvf $ML_FILENAME
	rm $ML_FILENAME
fi

# MeshGeometry:
if ! [ -d "$APPS_DIR/meshgeometry" ]; then
	git clone https://github.com/r03ert0/meshgeometry $APPS_DIR/meshgeometry
fi
# VCGlib development branch:
if ! [ -d "$APPS_DIR/vcglib" ]; then
	git clone -b devel https://github.com/cnr-isti-vclab/vcglib $APPS_DIR/vcglib
fi

# Compile Tridecimator
# sudo apt install qtchooser
cd $APPS_DIR/vcglib/apps/tridecimator
qmake tridecimator.pro
make
cd $CODE_DIR

# export FREESURFER_HOME=$APPS_DIR/freesurfer
# source $FREESURFER_HOME/setupfreesurfer.sh

# To fetch the tools from github:


# These are examples from our system
# export APPS_DIR=//net1110.net.ucf.edu/research2/lighthall_lab/apps
# export APPS_DIR=/r/lighthall_lab/apps
# export APPS_DIR=/r/apps
