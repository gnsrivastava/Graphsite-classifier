#!/bin/bash
#PBS -q v100
#PBS -l nodes=1:ppn=36
#PBS -l walltime=24:00:00
#PBS -A hpc_michal01
#PBS -j oe

run=61
seed=21

module purge
source activate graph
cd /work/derick/siamese-monet-project/Siamese-MoNet

singularity exec --nv -B /work,/project,/usr/lib64 /home/admin/singularity/pytorch-1.5.1-dockerhub-v4-python38 python train_classifier_final.py -run ${run} -seed ${seed} &> ./results/train_deepdrug_${run}.txt 2>&1



