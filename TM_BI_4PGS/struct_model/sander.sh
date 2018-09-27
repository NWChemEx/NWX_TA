#!/bin/bash
#set -x
########################################################################
#   Batch Job Parameters
########################################################################
#
#### Grid Engine Job Wrapper ####
#
#$ -N 4pgs-1M
#$ -pe mpi2 1
#$ -q wp08
#$ -j y
#$ -m e
#$ -v LD_LIBRARY_PATH,OMP_NUM_THREADS
#
#### Torque/PBS Job Parameters ####
#
#PBS -N 4pgs-1M
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
export PATH=~/amber17/bin:$PATH


mpiexec -n 16 sander.MPI -O -i 4pgs-1M-sander-minimize.in -p 4pgs-1M-amber-manual-lipid-ion2.prmtop -c 4pgs-1M-amber-manual-lipid-ion2.inpcrd -r 4pgs-1M-amber-manual-lipid-ion2.rst -o sander_minimize.out 
