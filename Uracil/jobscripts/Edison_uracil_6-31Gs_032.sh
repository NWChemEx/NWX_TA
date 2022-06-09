#!/bin/bash -l
#SBATCH --nodes=32
#SBATCH --ntasks-per-node=24
#SBATCH --time=06:00:00
#SBATCH --partition=regular
#SBATCH --license=SCRATCH
#SBATCH --job-name=eds_nwc_uracil_6-31gs_000768
#SBATCH --error=eds_nwc_uracil_6-31gs_000768.e%j
#SBATCH --output=eds_nwc_uracil_6-31gs_000768.o%j
export NWCHEM_MEMORY_HEAP=6553600
export NWCHEM_MEMORY_STACK=104857600
export NWCHEM_MEMORY_GLOBAL=268435456
export NWCHEM_BASIS_LIBRARY=/global/common/sw/cray/cnl6/ivybridge/nwchem/6.6/intel/17.0.2.174/kdw3gtl/share/nwchem/libraries/
export NWCHEM_EXECUTABLE=/global/common/sw/cray/cnl6/ivybridge/nwchem/6.6/intel/17.0.2.174/kdw3gtl/bin/nwchem
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
cp uracil_ccsd_t.nw                     $SCRATCH_DIR
cp $NWCHEM_EXECUTABLE                   $SCRATCH_DIR
cd $SCRATCH_DIR
#
# Fire up NWChemEx
#
srun -n $SLURM_NPROCS ./nwchem uracil_ccsd_t.nw
#
# Clean up
#
rm -rf $SCRATCH_DIR
