#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --time=00:30:00
#SBATCH --partition=regular
#SBATCH --account=m1759
#SBATCH --license=SCRATCH
#SBATCH --constraint=gpu
#SBATCH --gres=gpu:8
#SBATCH --job-name=cori_nwx_uracil_6-31gs_000020
#SBATCH --error=cori_nwx_uracil_6-31gs_000020.e%j
#SBATCH --output=cori_nwx_uracil_6-31gs_000020.o%j
export SCRATCH_DIR=$SCRATCH/$SLURM_JOB_NAME.$SLURM_JOB_ID
export PERMANENT_DIR=$SCRATCH_DIR
export OMP_NUM_THREADS=1
export START_DIR=`pwd`
module list
env | sort
pwd
#
# Copy data into place
#
export EXECUTABLE=`find .. -name Test_CCSD_T`
mkdir $SCRATCH_DIR
cp ../input/uracil.nwx                  $SCRATCH_DIR
cp $EXECUTABLE                          $SCRATCH_DIR
cd $SCRATCH_DIR
#
# Fire up NWChemEx
#
srun nvidia-smi
srun -n $SLURM_NPROCS ./Test_CCSD_T uracil.nwx
#
# Clean up
#
rm -rf $SCRATCH_DIR
