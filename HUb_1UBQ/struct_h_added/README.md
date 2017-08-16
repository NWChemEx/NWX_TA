# HUb_1UBQ: Human Ubiquitin 1UBQ: Hydrogens added

Structure of Ubiquitin refined at 1.8 Angstroms resolution [Vijay-Kumar:1987]
as obtained from the Protein Data Bank with structure ID [1UBQ](http://www.rcsb.org/pdb/explore/explore.do?structureId=1UBQ).

Added Hydrogens with the [CHARMM-GUI](HTTP://WWW.CHARMM-GUI.ORG) [Jo:2008]
using the "Quick MD Simulator" running only STEP1. The structure stored here
is from the file "step1_pdbreader.pdb". However, the CHARMM-GUI has moved the
heavy atoms while adding the Hydrogens. So, more was done to this structure 
than just adding Hydrogens. Presumably the energy was minimized to arrive
at physically reasonable distances between atoms.

A Ubiquitin structure with added Hydrogens can be obtained from [Ruger:2015] 
and is stored in the file "ct500838h_si_003.xyz". The positions of the heavy
atoms are those of [Vijay-Kumar:1987] but while the structure has Hydrogen atoms
it is not clear how they were added. This question does not necessarily pose 
a problem for this particular structure but it does leave the question of how
to add Hydrogen atoms properly open for the membrane proteins.

The run_xyz_to_pdbs script takes the "ct500838h_si_003.xyz" file and generates
a number of PDB files from it. These PDB files include files for the whole
structure as well as subsequences. The subsequences are terminated with 
Hydrogens. This means that the end carboxyl groups end up getting replaced
by a ketone. The script uses AWK [Aho:1979] and Open Babel [Boyle:2011] to
achieve this.

## References

[Aho:1979] A. V. Aho, B. W. Kernighan, P. J. Weinberger, "Awk — a pattern
scanning and processing language", _Software: Practice and Experience_
(1979) **9**, 267-279, Doi: 
[10.1002/spe.4380090403](https://dx.doi.org/10.1002/spe.4380090403).

[Boyle:2011] N. M. O'Boyle, M. Banck, C. A. James, C. Morley, T. Vandermeersch,
G. R. Hutchison, "Open Babel: An open chemical toolbox", _Journal of
Cheminformatics_ (2011) **3**, 33-46, 
Doi: [10.1186/1758-2946-3-33](https://dx.doi.org/10.1186/1758-2946-3-33).
The Open Babel Package, version 2.4.1, http://openbabel.org
(accessed Aug 2017).

[Jo:2008] S. Jo, T. Kim, V.G. Iyer, W. Im, “CHARMM-GUI: A Web-based Graphical
User Interface for CHARMM”, _Journal of Computational Chemistry_ (2008) 
**29**, 1859-1865, Doi: [10.1002/jcc.20945](https://dx.doi.org/10.1002/jcc.20945).

[Ruger:2015] R. R&uuml;ger, E. van Lenthe, Y. Lu, J. Frenzel, T. Heine, 
L. Visscher, "Efficient Calculation of Electronic Absorption Spectra by Means
of Intensity-Selected Time-Dependent Density Functional Tight Binding",
_Journal of Chemical Theory and Computation_ (2015) **11**, 157-167,
Doi: [10.1021/ct500838h](https://dx.doi.org/10.1021/ct500838h).

[Vijay-Kumar:1987] S. Vijay-Kumar, C.E. Bugg, W.J. Cook, "Structure of ubiquitin
refined at 1.8 A resolution", _Journal of Molecular Biology_ **194** (1987)
531-544. Doi: [10.1016/0022-2836(87)90679-6](https://dx.doi.org/10.1016/0022-2836(87)90679-6), Structure Doi: [10.2210/pdb1ubq/pdb](https://dx.doi.org/10.2210/pdb1ubq/pdb).
