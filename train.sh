
#!/bin/bash
#PBS -q v100
#PBS -l nodes=1:ppn=36
#PBS -l walltime=72:00:00
#PBS -N GINMolecule
#PBS -A hpc_michal01
#PBS -j oe

module purge
source activate graph
cd /work/derick/monet-project/MolNet/

singularity exec --nv -B /work,/project,/usr/lib64 /home/admin/singularity/pytorch-1.5.1-dockerhub-v4.simg python train.py &> ./train.txt 2>&1



