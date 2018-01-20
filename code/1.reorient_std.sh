#!/bin/sh

# @ianad 2018-01-20
# Here I'm going to use @lbconner's reorient script as a template and scaffold
# so we can do brain extraction on the anatomical scan we want to 3d-print

#to run:
	# cd /Volumes/Lighthall_Lab/experiments/cjfmri-2/code/FSL/1.preprocessing
	# ./1.reorient_std.sh
#-----------------------------------------------------------------------#

export source_dir = ../sourcedata
export deriv_dir = ../derivatives
export subj = sub-101

# copy & reorient anat scan per subj (MPRAGE)
fslreorient2std ${source_dir}/${subj}/${subj}_T1w.nii ${deriv_dir}/${subj}_T1w.nii

# Brain Extraction for anatomical scan
bet ${deriv_dir}/${subj}_T1w.nii ${deriv_dir}/${subj}_brain.nii -f 0.5 -g 0

# Check orientation for FSL: facing up & right
fsleyes ${analysis_dir}/${subj}_T1w.nii
fsleyes ${analysis_dir}/${subj}_brain.nii



# functional scans are not relevant here
# copy 5 func scans per subj (3 enc runs; 2 judg); reorient func scans to FSL orientation; compress (.nii.gz)
# cd ${source_dir}/sub-2112/func
# fslreorient2std sub-2112_task-encd_run-1_bold.nii ${analysis_dir}/Func/2112/CJ2_2112_Enc1.nii.gz
# fslreorient2std sub-2112_task-encd_run-2_bold.nii ${analysis_dir}/Func/2112/CJ2_2112_Enc2.nii.gz
# fslreorient2std sub-2112_task-encd_run-3_bold.nii ${analysis_dir}/Func/2112/CJ2_2112_Enc3.nii.gz
# fslreorient2std sub-2112_task-judg_run-1_bold.nii ${analysis_dir}/Func/2112/CJ2_2112_Jud1.nii.gz
# fslreorient2std sub-2112_task-judg_run-2_bold.nii ${analysis_dir}/Func/2112/CJ2_2112_Jud2.nii.gz





