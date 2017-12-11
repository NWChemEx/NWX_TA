#!/bin/bash
#
# Use PDBFixer to add missing residues, atoms and hydrogen atoms. 
# The 4PGR structure was obtained at a pH of 8.0 hence we protonate the
# structure at the same pH.
#
pdbfixer ../struct_raw/4pgr.pdb --add-atoms=all --add-residues --ph=8.0 
mv output.pdb 4pgr.pdb
