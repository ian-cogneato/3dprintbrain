#!/bin/bash
# Use to kick off freesurfer reconstruction,
# which takes several hours to complete
# and generates more data than we need.

# requires freesurfer to be installed already

export FREESURFER_HOME=/applications/freesurfer
source $FREESURFER_HOME/setupfreesurfer.sh

export CODE_DIR="${0%/*}"
export SOURCE_DIR=$CODE_DIR/../sourcedata
export DERIVS_DIR=$CODE_DIR/../derivatives
export SUBJ=sub-0

recon-all \
	-i $SOURCE_DIR/$SUBJ/${SUBJ}_t1w.nii \
	-s $DERIVS_DIR/$SUBJ \
	-all
