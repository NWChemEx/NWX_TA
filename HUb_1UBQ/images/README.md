# HUb_1UBQ: Human Ubiquitin 1UBQ fragment images

This directory contains images of the structure of fragements of Ubiquitin
refined at 1.8 Angstroms resolution [Vijay-Kumar:1987]. The images are provided
in .pov files that can be rendered with the POV-Ray program [Cason:1994]. 

The POV-Ray files were produced by VMD [Humphrey:1996]. The aim of these images
was to show the relative size of the fragments. For this purpose a new PDB file 
generated that contained all the fragments. Renaming the chain for each fragment
to something unique individual fragments can be shown in the same view by hiding
all others. A POV-Ray file can be generated for each fragment. Keeping the POV-Ray
files makes it possible to rerender the images depending the on requirements for
their use (low resolution for the web, high resolution for posters, etc.) 

An example POV-Ray command is given in the comments at the top of each file.
E.g.:
```
  povray +W2676 +H3336 -Ivmdscene.pov -Ovmdscene.pov.tga +P +X +A +FT +C
```
Hopefully this is useful.

## References

[Vijay-Kumar:1987] S. Vijay-Kumar, C.E. Bugg, W.J. Cook, "Structure of ubiquitin
refined at 1.8 A resolution", _Journal of Molecular Biology_ **194** (1987)
531-544. Doi: [10.1016/0022-2836(87)90679-6](https://dx.doi.org/10.1016/0022-2836(87)90679-6).

[Cason:1994] Chris Cason, "Persistence of Vision Raytracer", August 18 1994 [http://povray.org/](http://povray.org/).

[Humphrey:1996] W. Humphrey, A. Dalke, K. Schulten, "VMD - Visual Molecular Dynamics", 
J. Molec. Graphics, 1996, vol. 14, pp. 33-38. 
Doi: [10.1016/0263-7855(96)00018-5](https://doi.org/10.1016/0263-7855(96)00018-5). 
Web: [http://www.ks.uiuc.edu/Research/vmd/](http://www.ks.uiuc.edu/Research/vmd/).
