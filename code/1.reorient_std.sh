#!/bin/sh

#Copy & reorient subj scans from source to analysis folders; bet anat scans
#Updated for cjfmri-2 data; LConner, 12.19.17

#to run:
	# cd /Volumes/Research2/Lighthall_Lab/experiments/cjfmri-2/code/FSL/1.preprocessing
	# ./1.reorient_std.sh
#-----------------------------------------------------------------------#

export source_dir=/Volumes/Research2/Lighthall_Lab/experiments/cjfmri-2/sourcedata
export analysis_dir=/Volumes/Research2/Lighthall_Lab/experiments/cjfmri-2/derivatives/fmri/fsl/data

#copy 5 func scans per subj (3 enc runs; 2 judg); reorient func scans to FSL orientation; compress (.nii.gz)
cd ${source_dir}/sub-2112/func
fslreorient2std sub-2112_task-encd_run-1_bold.nii ${analysis_dir}/Func/2112/CJ2_2112_Enc1.nii.gz
fslreorient2std sub-2112_task-encd_run-2_bold.nii ${analysis_dir}/Func/2112/CJ2_2112_Enc2.nii.gz
fslreorient2std sub-2112_task-encd_run-3_bold.nii ${analysis_dir}/Func/2112/CJ2_2112_Enc3.nii.gz
fslreorient2std sub-2112_task-judg_run-1_bold.nii ${analysis_dir}/Func/2112/CJ2_2112_Jud1.nii.gz
fslreorient2std sub-2112_task-judg_run-2_bold.nii ${analysis_dir}/Func/2112/CJ2_2112_Jud2.nii.gz

#copy & reorient anat scan per subj (MPRAGE)
cd ${source_dir}/sub-2112/anat
fslreorient2std sub-2112_T1w.nii ${analysis_dir}/Anat/2112/CJ2_2112_anat.nii.gz

#Brain Extraction for anatomical scan
bet ${analysis_dir}/Anat/2112/CJ2_2112_anat.nii.gz  ${analysis_dir}/Anat/2112/anat_2112_brain.nii.gz -f 0.5 -g 0

#Check orientation for FSL: facing up & right
fsleyes ${analysis_dir}/Func/2112/CJ2_2112_Jud2.nii.gz
fsleyes ${analysis_dir}/Anat/2112/CJ2_2112_anat.nii.gz
fsleyes ${analysis_dir}/Anat/2112/anat_2112_brain.nii.gz