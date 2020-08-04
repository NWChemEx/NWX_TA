#!/usr/bin/env python3

import psi4

def run_dft():
    '''
    Run a simple DFT calculation.
    '''
    fp = open("molecule.xyz","r")
    mol = fp.read()
    fp.close()
    psi4.geometry(mol)
    psi4.set_options({
        "guess":    "sad",
        "scf_type": "df"
    })
    psi4.energy('b3lyp/cc-pvdz')

if __name__ == "__main__":
    run_dft()
