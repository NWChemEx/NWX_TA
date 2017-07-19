# HUb_1UBQ: Human Ubiquitin 1UBQ: Plane Wave DFT Energy & Gradient

Structure of Ubiquitin refined at 1.8 Angstroms resolution [Vijay-Kumar:1987]
as obtained from the Protein Data Bank with structure ID [1UBQ](http://www.rcsb.org/pdb/explore/explore.do?structureId=1UBQ).

Using the structure with Hydrogens added that was reported in [Ruger:2015].
The method by which Hydrogens were added is not reported in the paper.

Perform a Gaussian basis set DFT calculation for the energy and the
gradients with NWChem [Valiev:2010]. In these calculations the 6-31G and
6-31G\* basis sets [Hariharan:1973, Francl:1982] as well as the cc-pVTZ
and the aug-cc-pVTZ basis sets [Dunning:1989] are used.

Table 1 provides some details about the structure and the resulting calculation
sizes. We are using spherical harmonic basis functions for all
basis sets. The cost estimates are relative to the smallest basis set
assuming that the cost scales like _N_<sup>4</sup> if we increase the
basis set (basically assuming that the change in cost comes entirely
from the 2-electron integrals).

| Elements   | #atoms | 6-31g | 6-31g\* | cc-pVTZ | aug-cc-pVTZ |
| ---------- | ------ | ----- | ------- | ------- | ----------- |
| H          |  629   |  2    |  2      | 14      |   23        |
| C, N, O    |  601   |  9    | 14      | 30      |   46        |
| S          |    1   | 13    | 18      | 34      |   50        |
| Total      | 1231   | 6680  | 9690    | 26870   |   42163     |
| Cost       |        | 1     | 4.4     | 261.2   |   1595.4    |
[Table 1. Basis sets sizes and total number of basis functions for Ubiquitin]

## References

[Dunning:1989] T. H. Dunning, Jr., "Gaussian basis sets for use in correlated
molecular calculations. I. The atoms boron through neon and hydrogen",
 _Journal of Chemical Physics_ (1989) **90**, 1007-1023. Doi:
[10.1063/1.456153](https://dx.doi.org/10.1063/1.456153).

[Francl:1982] M. M. Francl, W. J. Pietro, W. J. Hehre, J. S. Binkley,
M. S. Gordon, D. J. DeFrees, J. A. Pople, "Self‐consistent molecular orbital
methods. XXIII. A polarization‐type basis set for second‐row elements",
_Journal of Chemical Physics_ (1982) **77**, 3654-3665,
[10.1063/1.444267](https://dx.doi.org/10.1063/1.444267).

[Hariharan:1973] P. C. Hariharan, J. A. Pople, "The influence of polarization
functions on molecular orbital hydrogenation energies",
_Theoretica Chimica Acta_ (1973) **28**, 213-222,
[10.1007/BF00533485](https://dx.doi.org/10.1007/BF00533485)

[Ruger:2015] R. R&uuml;ger, E. van Lenthe, Y. Lu, J. Frenzel, T. Heine,
L. Visscher, "Efficient Calculation of Electronic Absorption Spectra by Means
of Intensity-Selected Time-Dependent Density Functional Tight Binding",
_Journal of Chemical Theory and Computation_ (2015) **11**, 157-167,
[10.1021/ct500838h](https://dx.doi.org/10.1021/ct500838h).

[Valiev:2010] M. Valiev, E.J. Bylaska, N. Govind, K. Kowalski, T.P. Straatsma,
H.J.J. van Dam, D. Wang, J. Nieplocha, E. Apra, T.L. Windus, W.A. de Jong,
"NWChem: a comprehensive and scalable open-source solution for large scale
molecular simulations" _Computer Physics Communications_ **181** (2010)
1477-1489. Doi: 
[10.1016/j.cpc.2010.04.018](https://doi.org/10.1016/j.cpc.2010.04.018)

[Vijay-Kumar:1987] S. Vijay-Kumar, C.E. Bugg, W.J. Cook, "Structure of ubiquitin
refined at 1.8 A resolution", _Journal of Molecular Biology_ **194** (1987)
531-544. Doi: [10.1016/0022-2836(87)90679-6](https://dx.doi.org/10.1016/0022-2836(87)90679-6), Structure Doi: [10.2210/pdb1ubq/pdb](https://dx.doi.org/10.2210/pdb1ubq/pdb).

