#!/usr/bin/env python3
'''
Need to optimize 1AAR into proper Cyclic Lys-48 linked di-Ubiquitin.

The 1AAR structure is very close already but is a "linear" Lys-48
linked di-Ubiquitin. We just need to tie the remaining C-terminus to
the nearby Lys-48 of the other chain, and fold the final few residues
to meet the Lys-48.

This script uses Pybel [1] to achieve this.

References:

[1] N. M. O'Boyle, C. Morley, G. R. Hutchison,
    "Pybel: a Python wrapper for the OpenBabel cheminformatics toolkit",
    Chemistry Central Journal (2008) Vol. 2, Art. 5,
    https://doi.org/10.1186/1752-153X-2-5
'''
from openbabel import pybel
mol = next(pybel.readfile("pdb","1aar_h_2o4h.pdb"))
mol.OBMol.AddBond(1227,1999,1)
mol.OBMol.AddBond(771,2455,1)
mol.localopt()
output = pybel.Outputfile("pdb","1aar_cyclic.pdb")
output.write(mol)
output.close()

