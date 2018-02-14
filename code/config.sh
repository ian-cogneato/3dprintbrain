#!/bin/bash

export DOWNLOAD_DIR=~/d/downloads

# fetches the 'latest' (as of 2018-02-13) version of freesurfer
wget ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz
#export FREESURFER_HOME=/applications/freesurfer
#source $FREESURFER_HOME/setupfreesurfer.sh

# Replace the path below with your local path to the directory where 
# you have the tools installed, or where you want to clone them to.
export APPS_DIR=~/d/apps

# These are examples from our system
# export APPS_DIR=//net1110.net.ucf.edu/research2/lighthall_lab/apps
# export APPS_DIR=/r/lighthall_lab/apps
# export APPS_DIR=/r/apps

# To fetch the tools from github:

# MeshGeometry:
git clone https://github.com/r03ert0/meshgeometry $APPS_DIR/meshgeometry
# VCGlib:
git clone -b devel https://github.com/cnr-isti-vclab/vcglib $APPS_DIR/vcglib

# MeshLab shouldn't be cloned from git this way, it turns out.
# We want the package installer at http://github.com/cnr-isti-vclab/meshlab/releases/download/v2016.12/MeshLab2016.12.dmg
# maybe we can fetch this with the procedure at https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8 ??
# and then mount/install with hdiutil? http://osxdaily.com/2011/12/17/mount-a-dmg-from-the-command-line-in-mac-os-x/
