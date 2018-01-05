#!/bin/bash -l
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=24
#SBATCH --time=06:00:00
#SBATCH --partition=regular
#SBATCH --license=SCRATCH
#SBATCH --job-name=eds_nwc_pweg_dgrtl_000048
#SBATCH --error=eds_nwc_pweg_dgrtl_000048.e%j
#SBATCH --output=eds_nwc_pweg_dgrtl_000048.o%j
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
cd ..
cp nwc_pweg/nwc_pweg_dgrtl.nw  $SCRATCH_DIR
cp struct_h_added/dgrtl.pdb    $SCRATCH_DIR
cd 
cp edison/nwchem-1/bin/LINUX64/nwchem $SCRATCH_DIR
cd $SCRATCH_DIR
#
# Fire up NWChem
#
srun -n $SLURM_NPROCS ./nwchem nwc_pweg_dgrtl.nw
#
# Clean up
#
rm -rf $SCRATCH_DIR
