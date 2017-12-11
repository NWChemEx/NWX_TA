#!/bin/bash
#
# Use PDBFixer to add missing residues, atoms and hydrogen atoms. 
# The 4PGS structure was obtained at a pH of 6.0 hence we protonate the
# structure at the same pH.
#
pdbfixer ../struct_raw/4pgs.pdb --add-atoms=all --add-residues --ph=6.0 
mv output.pdb 4pgs.pdb
