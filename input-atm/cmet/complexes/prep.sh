#!/bin/bash
#
#SBATCH -J atmbn-prep
#SBATCH --partition=gpu-shared
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=2
#SBATCH --no-requeue
#SBATCH --account=<account>
#SBATCH -t 12:00:00

. ~/miniconda3/bin/activate atm
for pair in CHEMBL3402741-400-CHEMBL3402741-400 CHEMBL3402742-23-CHEMBL3402742-23 CHEMBL3402743-42-CHEMBL3402743-42 CHEMBL3402744-300-CHEMBL3402744-300 CHEMBL3402745-200-CHEMBL3402745-200 CHEMBL3402747-3400-CHEMBL3402747-3400 CHEMBL3402748-5300-CHEMBL3402748-5300 CHEMBL3402749-500-CHEMBL3402749-500 CHEMBL3402750-400-CHEMBL3402750-400 CHEMBL3402751-2100-CHEMBL3402751-2100 CHEMBL3402752-30000-CHEMBL3402752-30000 CHEMBL3402753-200-CHEMBL3402753-200 CHEMBL3402754-40-CHEMBL3402754-40 CHEMBL3402755-4200-CHEMBL3402755-4200 CHEMBL3402756-2.7-CHEMBL3402756-2.7 CHEMBL3402757-6.5-CHEMBL3402757-6.5 CHEMBL3402758-10-CHEMBL3402758-10 CHEMBL3402759-5.7-CHEMBL3402759-5.7 CHEMBL3402760-1-CHEMBL3402760-1 CHEMBL3402761-1-CHEMBL3402761-1 CHEMBL3402762-1-CHEMBL3402762-1 CHEMBL3402763-90-CHEMBL3402763-90 CHEMBL3402764-90-CHEMBL3402764-90 CHEMBL3402765-11-charged-pKa-8.1-CHEMBL3402765-11-charged-pKa-8.1 ; do
    jobname=protein-$pair
    echo "Prepping $jobname"
    ( cd ${jobname} &&  python /home/users/sheenam/src/AToM-OpenMM/rbfe_structprep.py ${jobname}_asyncre.cntl )  || exit 1
done
