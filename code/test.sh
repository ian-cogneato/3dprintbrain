#!/bin/bash

echo $0

mydir="${0%/*}"

echo $mydir

export CODE_DIR="${0%/*}"
export SOURCE_DIR=$CODE_DIR/../sourcedata
export DERIVS_DIR=$CODE_DIR/../derivatives
export SUBJ=sub-0

echo code_dir $CODE_DIR
echo src_dir $SOURCE_DIR
echo drv_dir $DERIVS_DIR

cd $SOURCE_DIR