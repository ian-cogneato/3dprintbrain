#!/bin/bash

# requires freesurfer to be installed. 

export FREESURFER_HOME=/applications/freesurfer
source $FREESURFER_HOME/setupfreesurfer.sh

export SOURCE_DIR=../sourcedata
export DERIVS_DIR=../derivatives
export SUBJ=sub-101

recon-all \
	-i $SOURCE_DIR/$SUBJ/${SUBJ}_t1w.nii \
	-s $DERIVS_DIR/$SUBJ \
	-all