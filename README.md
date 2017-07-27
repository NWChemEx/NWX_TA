# NWX_TA: NWChemEx - Testing and Assessment

This repository contains everything related to the testing and assessment part of NWChemEx. 
In particular it contains the test cases that are used to assess the progress of the
project. These tests will stress the code performance, scalability, performance portability,
etc. These test cases are typically of a substantial size and therefore a separate
repository from which they can be checked out only when needed seems a reasonable 
approach.

Small tests associated with judging the code correctness, such as unit tests,
regression tests, etc., are kept in the source code repository. The rationale for that
is that users and developers who build the code from source should test whether it
built correctly in their environment.

## Layout of the repository

The test cases in this repository serve a number of purposes:
   1. Generate baseline performance data from NWChem
      1. For plane wave DFT
      2. For Gaussian basis DFT
      3. For Coupled Cluster
      4. For classical MD
   2. Generate performance data for NWChemEx
      1. For plane wave / real space DFT
      2. For Gaussian basis DFT
      3. For Coupled Cluster
      4. For the embedding capabilities

As at the present time the input structure for NWChemEx is not clear yet, and
as we need to be able run the same test cases with NWChem and NWChemEx it seems
sensible to separate the molecular structure data of the test cases from the
test inputs. At the same time deep directory trees should be avoided hence a 
two level approach is suggested:

    <test system>/
        struct_raw/            - the initial structure data
        struct_<modification>/ - modified versions of the structures (hydrogens added, 
                                 Si/Al substitutions, solvated, etc.)
        nwc_<method>/          - NWChem test for <method> capability
        nwx_<method>/          - NWChemEx test for <method> capability
      
This structure should not be too cumbersome to navigate yet compartimentalize what needs to be kept
separate but still close together. Obviously how successfull this choice is
can be reviewed at a later date when experience has informed us.

## Additional resources

For the proteins it is useful to be aware of the IUPAC nomenclature and symbolism for
amino acids and peptides [IUPAC-IUB:1983]

## References

[IUPAC-IUB:1983] IUPAC-IUB Joint Commission on Biochemical Nomenclature (JCBN), 
["Nomenclature and Symbolism for Amino Acids and Peptides"](http://www.chem.qmul.ac.uk/iupac/AminoAcid/) (1984), Walter de Gruyter, Berlin.
DOI: [10.1351/pac198456050595](https://doi.org/10.1351/pac198456050595).

