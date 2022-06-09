NESAP baseline benchmarks for NWChemEx
======================================

Description
-----------

NWChemEx is a computational chemistry code being developed for exa-scale 
computing platforms. Unlike its predecessor, NWChem, the NWChemEx code is
written in C++. The programming model is based on tensor operations that
are supported by the Tensor Algebra for Many-body Methods (TAMM)
infrastructure. In addition NWChemEx seeks to avoid building large 
monolithic executables. Therefore, the Simulation Development Environment
(SDE) provides infrastructure to let one compose simulations from multiple
modules. Each module currently lives in a repository of its own so users 
can build and install just the pieces they need. A consequence of this model
is that the directory benchmark/src contains a number of submodules. For 
the benchmarks being provided here all these submodules have to be built. 

Figure of Merit
---------------

The Figure of Merit (FOM) for the NWChemEx is the rate of instructions at
scale. This rate is calculated from the order of the computational complexity
of the simulation divided by the time it takes to run the simulation. Hence,
the higher optimized the code is, and the more scalable the code, the shorter
the time to solution for a given calculation, and hence the higher the FOM. 

To handle the weak scaling scenario larger problems may be run where the number
of atoms in the molecular system is increased. It is important to keep other
input parameters (such as basis sets and cut-offs) the same. Changing these
parameters would affect the pre-factor in the complexity and make valid 
comparisons impossible.

As alluded to above, the FOM depends on the complexity of the method being
used. In this project two methods are particularly relevant:

1. Density Functional Theory (DFT) which is a low complexity method that is
   most commonly used in ab-initio chemistry calculations. 
2. Coupled Cluster (CC) which is a high complexity method that is used
   for particularly accurate calculations.

Both these methods are important to computational chemistry and therefore
it makes sense to try and enhance them all. 

The complexity of the various components in the calculations is:

| Computational Method    | Computational Complexity                  |
| ----------------------- | :---------------------------------------- |
| DFT                     | $`a_{DFT}n_{it}N_{mo}^4`$                 |
| Integral transformation | $`a_{int}N_{mo}^5`$                       |
| CCSD                    | $`a_{CCSD}n_{it}^{'}N_{occ}^2N_{virt}^4`$ |
| (T) of CCSD(T)          | $`a_{(T)}N_{occ}^3N_{virt}^4`$            |

Note that $`N_{occ}`$ is the number of occupied molecular orbitals, 
$`N_{virt}`$ is the number of unoccupied (virtual) orbitals, and
$`N_{mo} = N_{occ} + N_{virt}`$. The numbers of orbitals are 
proportional to the number of atoms in the chemical system.
The factors $`a_{x}`$ are prefactors associated with step $`x`$. 
The DFT and CCSD methods are iterative and therefore the number of
iterations is an additional factor in the complexity. However, the 
number of iterations typically does not depend on the size of the
chemical system.

Given that DFT and CC are both important methods, and given that they
have very different numerical complexities, two different baseline FOMs
have been established. 

For DFT the FOM is based on a calculation on a small protein, Ubiquitin.
The 6-31G basis set with 6680 basis functions was used as well as the 
PBE0 GGA functional. The calculation converged in 12 iterations. The times
to solution are recorded below.

| # nodes | # cores | Time to solution (s) |
| ------: | ------: | -------------------: |
|   128   |  3072   | 5300.7               |
|   256   |  6144   | 4061.0               |
|   512   | 12288   | 2552.4               |

For CC the FOM is based on uracil, a small molecule, for which three
chemical systems were set up by having one, two, and three molecules in the
system. The 6-31G* basis set was used which provides 128 basis functions
per molecule.

The timings for uracil are:

| # nodes | # cores | RHF  | CCSD | CCSD(T) |
| ------: | ------: | ---: | ---: | ------: |
|     8   |  192    |  3.0 | 46.9 |   5.0   |
|    16   |  384    |  4.9 | 43.2 |   2.9   |
|    32   |  768    |  5.3 | 41.1 |   1.7   |
|    64   | 1536    | 19.4 | 96.1 |   1.5   |

The timings for uracil dimer are:

| # nodes | # cores |  RHF  |  CCSD  | CCSD(T) |
| ------: | ------: | ----: | -----: | ------: |
|     8   |  192    |  87.2 |  902.5 |   378.2 |
|    16   |  384    | 124.3 |  545.8 |   214.2 |
|    32   |  768    |  19.4 |  268.3 |    97.0 |
|    64   | 1536    |  14.1 |  176.9 |    57.7 |
|   128   | 3072    |  20.0 |  180.2 |    27.3 |

The timings for uracil trimer are:

| # nodes | # cores |  RHF  |  CCSD  | CCSD(T) |
| ------: | ------: | ----: | -----: | ------: |
|     8   |  192    | 188.4 | 6464.3 |  5613.2 |
|    16   |  384    | 323.7 | 4264.5 |  2803.2 |
|    32   |  768    | 209.6 | 2255.3 |  1406.9 |
|    64   | 1536    |  15.4 | 1003.1 |   734.6 |
|   128   | 3072    |  22.4 |  717.0 |   364.7 |

Note that the timings for the RHF part seem irregular but there are two
algorithms for the Fock matrix construction. One that is based on 
replicated data structure and one that relies on distributed data
structures. Depending on the amount of memory available the code switches
between these two algorithms at which point the communication changes 
significantly.

Compilation
-----------

The compilation of the code has been facilitated by a special script that
runs over all the module repositories and compiles and installs the relevant
pieces. To compile and install the code run:

```bash
    cd NESAP/NWChemEx/benchmark/src
    ./nesap_nwchemex_compile.sh 2>&1 | tee build_nwchemex.log
```

This will create a directory

```bash
    NESAP/NWChemEx/benchmark/install
```

that contains the various libraries. For the benchmarks provided here
two executables are relevant

```
    NESAP/NWChemEx/benchmark/src/SCF/build/tests/basic_scf
    NESAP/NWChemEx/benchmark/src/TAMM/build/tamm_Tests_External-prefix/src/tamm_Tests_External-build/Test_CCSD_T
```

Note that `Test_CCSD_T` is a GPU only code and therefore is compiled only 
when a CUDA module is loaded. By contrast `basic_scf` is currently a CPU only
code that provides DFT capabilities.

Also note that these codes are currently under very active development. Hence
significant modifications are likely introduced over short periods of time.

Measurement on Edison
---------------------

For DFT the FOM is based on a calculation on a small protein, Ubiquitin.
The 6-31G basis set with 6680 basis functions was used as well as the 
PBE0 GGA functional. The calculation converged in 12 iterations. The times
to solution are recorded below.

| # nodes | # cores | Time to solution (s) |
| ------: | ------: | -------------------: |
|   128   |  3072   | 5300.7               |
|   256   |  6144   | 4061.0               |
|   512   | 12288   | 2552.4               |

For CC the FOM is based on uracil, a small molecule, for which three
chemical systems were set up by having one, two, and three molecules in the
system. The 6-31G* basis set was used which provides 128 basis functions
per molecule.

The timings for uracil are:

| # nodes | # cores | RHF  | CCSD | CCSD(T) |
| ------: | ------: | ---: | ---: | ------: |
|     8   |  192    |  3.0 | 46.9 |   5.0   |
|    16   |  384    |  4.9 | 43.2 |   2.9   |
|    32   |  768    |  5.3 | 41.1 |   1.7   |
|    64   | 1536    | 19.4 | 96.1 |   1.5   |

The timings for uracil dimer are:

| # nodes | # cores |  RHF  |  CCSD  | CCSD(T) |
| ------: | ------: | ----: | -----: | ------: |
|     8   |  192    |  87.2 |  902.5 |   378.2 |
|    16   |  384    | 124.3 |  545.8 |   214.2 |
|    32   |  768    |  19.4 |  268.3 |    97.0 |
|    64   | 1536    |  14.1 |  176.9 |    57.7 |
|   128   | 3072    |  20.0 |  180.2 |    27.3 |

The timings for uracil trimer are:

| # nodes | # cores |  RHF  |  CCSD  | CCSD(T) |
| ------: | ------: | ----: | -----: | ------: |
|     8   |  192    | 188.4 | 6464.3 |  5613.2 |
|    16   |  384    | 323.7 | 4264.5 |  2803.2 |
|    32   |  768    | 209.6 | 2255.3 |  1406.9 |
|    64   | 1536    |  15.4 | 1003.1 |   734.6 |
|   128   | 3072    |  22.4 |  717.0 |   364.7 |

Note that the timings for the RHF part seem irregular but there are two
algorithms for the Fock matrix construction. One that is based on 
replicated data structure and one that relies on distributed data
structures. Depending on the amount of memory available the code switches
between these two algorithms at which point the communication changes 
significantly.

Epilog
------

The figures of merit given as timings in the tables above can be converted
into a rate of computation performed. Rates for calculations of different
sizes can be normalized using the numerical complexity of the methods used. 
Note that no absolute rates can be computed as the prefactors in the
complexity are unknown. If the calculations are carefully chosen (same 
basis, same cut-offs, same convergence criteria, etc.) then we may 
reasonably assume that the prefactors are the same, and they will
cancel when we compute ratios of FOMs to establish the performance of the
project.

Example
-------

If we take the time to compute the (T) term for the uracil trimer on 128 cores
as the baseline for the project. Then we have the following job parameters

| size parameters | initial values |
| --------------- | -------------- |
| $`N_{occ}`$     |    87          |
| $`N_{virt}`$    |   297          |

with a time to solution of 364.7s on 3072 cores and the complexity of the
(T) given by $`a_{(T)}N_{occ}^3N_{virt}^4`$ the rate would be
$`FOM_{init} = a_{(T)}87^3 297^4/(364.7s) = 1.40e+13 a_{(T)}/s`$.

If, at a later stage in the project we would be able to do a calculation on 
a system consisting of six uracil molecules (see sizes below) on 30720 cores
in 100s then the corresponding rate would be

| size parameters | new values |
| --------------- | ---------- |
| $`N_{occ}`$     |   174      |
| $`N_{virt}`$    |   594      |

$`FOM_{new} = a_{(T)}174^3 594^4/(100.0s) = 6.56e+15 a_{(T)}/s`$
in which case the performance of the project would be
$`P_{NWChemEx}=(6.56e+15 a_{(T)}/s)/(1.40e+13 a_{(T)}/s) = 466.8`$
