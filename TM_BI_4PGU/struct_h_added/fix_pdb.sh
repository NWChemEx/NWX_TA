#!/bin/bash
#
# Use PDBFixer to add missing residues, atoms and hydrogen atoms. 
# The 4PGU structure was obtained at a pH of 7.0 hence we protonate the
# structure at the same pH.
#
pdbfixer ../struct_raw/4pgu.pdb --add-atoms=all --add-residues --ph=7.0 
mv output.pdb 4pgu.pdb
