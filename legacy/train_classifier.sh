#!/bin/bash
#PBS -q hybrid
#PBS -l nodes=1:ppn=20
#PBS -l walltime=72:00:00
#PBS -A hpc_gcn03
#PBS -j oe

run=5

module purge
source activate graph
cd /work/derick/siamese-monet-project/Siamese-MoNet

singularity exec --nv -B /work,/project,/usr/lib64 /home/admin/singularity/pytorch-1.5.1-dockerhub-v4.simg python train_classifier.py -trained_model_dir ../trained_models/trained_classifier_model_${run}.pt -loss_dir ./results/train_classifier_results_${run}.json &> ./results/train_classifier_${run}.txt 2>&1


