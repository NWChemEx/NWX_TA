#!/bin/bash -l
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=32
#SBATCH --time=06:00:00
#SBATCH --partition=regular
#SBATCH --license=SCRATCH
#SBATCH --constraint=haswell
#SBATCH --job-name=cori_nwx_ubq_sto-3g_000256
#SBATCH --error=cori_nwx_ubq_sto-3g_000256.e%j
#SBATCH --output=cori_nwx_ubq_sto-3g_000256.o%j
export NWCHEM_MEMORY_HEAP=6553600
export NWCHEM_MEMORY_STACK=104857600
export NWCHEM_MEMORY_GLOBAL=268435456
export NWCHEM_BASIS_LIBRARY=/global/common/sw/cray/cnl6/ivybridge/nwchem/6.6/intel/17.0.2.174/kdw3gtl/share/nwchem/libraries/
export SCRATCH_DIR=$SCRATCH/$SLURM_JOB_NAME.$SLURM_JOB_ID
export PERMANENT_DIR=$SCRATCH_DIR
export OMP_NUM_THREADS=1
export START_DIR=`pwd`
env | sort
pwd
#
# Copy data into place
#
mkdir $SCRATCH_DIR
cp ../input/ct500838h_si_003.xyz        $SCRATCH_DIR/ubiquitin_full.xyz
cp ../src/SCF/build/tests/basic_scf     $SCRATCH_DIR
cd $SCRATCH_DIR
#
# Fire up NWChemEx
#
srun -n $SLURM_NPROCS ./basic_scf ubiquitin_full.xyz sto-3g
#
# Clean up
#
rm -rf $SCRATCH_DIR
