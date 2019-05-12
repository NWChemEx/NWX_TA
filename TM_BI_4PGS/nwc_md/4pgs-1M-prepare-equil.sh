#!/bin/bash
#set -x
########################################################################
#   Batch Job Parameters
########################################################################
#
#### Grid Engine Job Wrapper ####
#
#$ -N 4pgs-1M-equil
#$ -pe mpi2 1
#$ -q wp08
#$ -j y
#$ -m e
#$ -v LD_LIBRARY_PATH,OMP_NUM_THREADS
#
#### Torque/PBS Job Parameters ####
#
#PBS -N 4pgs-1M-equil
#PBS -l nodes=1:ppn=16
#
########################################################################
#   Batch Environment Initialization Commands
########################################################################
#
#### Grid Engine Initialization Commands ####
#
if [ -f $TMPDIR/sge_init.sh ]; then
    source $TMPDIR/sge_init.sh
fi
#
#### Torque/PBS Initialization Commands ####
#
if [ ! -z $PBS_JOBID ]; then
    cd $PBS_O_WORKDIR
fi
#
########################################################################
#   Job Execution Commands
########################################################################
#
export OMP_NUM_THREADS=1

mpiexec -n 16 -x LD_LIBRARY_PATH ~/nwchem-1-codar/bin/LINUX64/nwchem 4pgs-1M-prepare-equil.nw 
