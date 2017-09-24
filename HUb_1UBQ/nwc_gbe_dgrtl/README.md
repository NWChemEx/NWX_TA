# HUb_1UBQ_DGRTL: Human Ubiquitin 1UBQ DGRTL fragment: Coupled Cluster

Structure of Ubiquitin refined at 1.8 Angstroms resolution [Vijay-Kumar:1987]
as obtained from the Protein Data Bank with structure ID [1UBQ](http://www.rcsb.org/pdb/explore/explore.do?structureId=1UBQ).

Using the structure with Hydrogens added that was reported in [Ruger:2015].
The method by which Hydrogens were added is not reported in the paper.

In a recent publication fragments of Ubiquiting were discussed along
with their likely function [Pasikowski:2010]. This work identified a 
number of sequences with immunosuppressive effects. The longest of these
sequences is the decapeptide LEDGRTLSDY. The smallest fragment in this
sequence that is thought to have immunosuppresive activity is the core
DGRTL sequence. In this directory a number of polypeptides from DGRTL
to LEDGRTLSDY have been extracted from the structure published in
[Ruger:2015]. Some of these fragments are small enough that 
Coupled Cluster calculations can be performed on them.


Here Coupled Cluster calculations for the energy are performed
with NWChem [Valiev:2010]. In these calculations the 6-31G and
6-31G\* basis sets [Hariharan:1973, Francl:1982] as well as the cc-pVDZ,
aug-cc-pVDZ, cc-pVTZ, aug-cc-pVTZ, and cc-pVQZ basis sets [Dunning:1989,
Woon:1993] are considered. 

Table 1 provides some details about the structure and the resulting calculation
sizes. We are using spherical harmonic basis functions for all
basis sets. The cost estimates are relative to the smallest basis set
assuming that the cost scales like _N_<sup>4</sup> if we increase the
basis set. Note that this cost scaling with the size of the basis set
is different from the cost scaling with the number of atoms. This is a 
consequence of the fact that CCSD scales as _O_(_o_<sup>2</sup>_v_<sup>4</sup>)
where _o_ is the number of occupied orbitals and _v_ is the number of virtual
orbitals. If the number of atoms is increased both the number of basis functions
and the number of electrons increases simultaneously generating a cost scaling of
_N_<sup>6</sup>. For CCSD(T) the cost scales as _O_(_o_<sup>3</sup>_v_<sup>4</sup>).

| Elements   | #atoms | #electrons | 6-31g | 6-31g\* | cc-pVDZ | aug-cc-pVDZ | cc-pVTZ | aug-cc-pVTZ | cc-pVQZ |
| ---------- | ------ | ---------- | ----- | ------- | ------- | ----------- | ------- | ----------- | ------- |
| H          |   41   |         1  |  2    |  2      |  5      |  9          | 14      |   23        |  30     |
| C, N, O    |   38   |       6-8  |  9    | 14      | 14      | 23          | 30      |   46        |  55     |
| Total      |   79   |       293  | 424   | 614     | 737     | 1243        | 1714    |   2691      |  3320   |
| Cost       |        |            |  1    | 4.4     | 9.2     | 73.7        | 266.4   |   1625.9    |  3758.8 |

[Table 1. Basis sets sizes and total number of basis functions for the DGRTL fragment of Ubiquitin]

## References

[Dunning:1989] T. H. Dunning, Jr., "Gaussian basis sets for use in correlated
molecular calculations. I. The atoms boron through neon and hydrogen",
 _Journal of Chemical Physics_ (1989) **90**, 1007-1023. Doi:
[10.1063/1.456153](https://dx.doi.org/10.1063/1.456153).

[Francl:1982] M. M. Francl, W. J. Pietro, W. J. Hehre, J. S. Binkley,
M. S. Gordon, D. J. DeFrees, J. A. Pople, "Self‐consistent molecular orbital
methods. XXIII. A polarization‐type basis set for second‐row elements",
_Journal of Chemical Physics_ (1982) **77**, 3654-3665. Doi:
[10.1063/1.444267](https://dx.doi.org/10.1063/1.444267).

[Hariharan:1973] P. C. Hariharan, J. A. Pople, "The influence of polarization
functions on molecular orbital hydrogenation energies",
_Theoretica Chimica Acta_ (1973) **28**, 213-222. Doi:
[10.1007/BF00533485](https://dx.doi.org/10.1007/BF00533485).

[Pasikowski:2010] P. Pasikowski, M. Cydzik, A. Kluczyk, P. Stefanowicz, 
Z. Szewczuk, "Ubiquitin fragments: their known biological activities and
putative roles", _Biomolecular Concepts_ (2010) **1**, 67-83. Doi:
[10.1515/bmc.2010.002](https://dx.doi.org/10.1515/bmc.2010.002).

[Ruger:2015] R. R&uuml;ger, E. van Lenthe, Y. Lu, J. Frenzel, T. Heine,
L. Visscher, "Efficient Calculation of Electronic Absorption Spectra by Means
of Intensity-Selected Time-Dependent Density Functional Tight Binding",
_Journal of Chemical Theory and Computation_ (2015) **11**, 157-167. Doi:
[10.1021/ct500838h](https://dx.doi.org/10.1021/ct500838h).

[Valiev:2010] M. Valiev, E.J. Bylaska, N. Govind, K. Kowalski, T.P. Straatsma,
H.J.J. van Dam, D. Wang, J. Nieplocha, E. Apra, T.L. Windus, W.A. de Jong,
"NWChem: a comprehensive and scalable open-source solution for large scale
molecular simulations" _Computer Physics Communications_ **181** (2010)
1477-1489. Doi: 
[10.1016/j.cpc.2010.04.018](https://doi.org/10.1016/j.cpc.2010.04.018).

[Vijay-Kumar:1987] S. Vijay-Kumar, C.E. Bugg, W.J. Cook, "Structure of ubiquitin
refined at 1.8 A resolution", _Journal of Molecular Biology_ **194** (1987)
531-544. Doi: [10.1016/0022-2836(87)90679-6](https://dx.doi.org/10.1016/0022-2836(87)90679-6), Structure Doi: [10.2210/pdb1ubq/pdb](https://dx.doi.org/10.2210/pdb1ubq/pdb).

[Woon:1993] D. E. Woon, T. H. Dunning, Jr. "Gaussian basis sets for use in
correlated molecular calculations. III. The atoms aluminum through argon", 
_Journal of Chemical Physics_ (1993) **98**, 1358-1371. Doi:
[10.1063/1.464303](https://dx.doi.org/10.1063/1.464303).
