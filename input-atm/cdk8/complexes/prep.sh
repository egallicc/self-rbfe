#!/bin/bash
#
#SBATCH -J <JOBNAME>
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus=1
#SBATCH --account=TG-MCB150001
#SBATCH --no-requeue
#SBATCH -t 90:00:00


. ~/miniconda3/bin/activate atm
for pair in 13-13 14-14 15-15 16-16 17-17 18-18 19-19 20-20 21-21 22-22 23-23 24-24 25-25 26-26 27-27 28-28 29-29 30-30 31-31 32-32 33-33 34-34 35-35 36-36 37-37 38-38 39-39 40-40 41-41 42-42 43-43 44-44 45-45 ; do
    jobname=protein-$pair
    echo "Prepping $jobname"
    ( cd ${jobname} &&  python /home/users/sheenam/AToM-OpenMM/rbfe_structprep.py ${jobname}_asyncre.cntl )  || exit 1
done
