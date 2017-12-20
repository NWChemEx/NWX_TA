Input file for PREPARE and MD
=============================

In this directory classical molecular dynamics runs are kept. They use the AMBER
force field as provided with NWChem. The model being used in the calculations
comes from `../struct_model/4pgr_amber_membrane_model_min_res_renum.pdb`.
To ensure that all entities in the model are recognized by NWChem the following
force field parameter sets are needed:

* amber_s
* amber_x
* amber_q

The calculations require two runs with different inputs:

* `4pgr_prepar.nw`
  * Run NWChem through the prepare phase, setting the topology and the initial
    restart file up.
  * Also produces a PDB file of the model that NWChem actually uses, for
    inspection.

* `4pgr_prepar_md.nw`
  * Run the dynamics (in parallel).
