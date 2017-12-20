Models obtained from Charmm-GUI
===============================

To build a complete model of the system to simulate a number of steps are needed. A good way to get
started is to use the Charmm-GUI to build the model using `../struct_h_added/4pgr.pdb` as an
initial structure.

* `4pgr_charmm_membrane_model.pdb`
  * Directly obtained from Charmm-GUI step5.

* `4pgr_charmm_membrane_model_min.pdb`
  * Obtained from 4pgr_membrane_model.pdb by applying 5000 additional minimization
    steps with Charmm.

* `4pgr_amber_membrane_model_min.pdb`
  * Obtained from 4pgr_charmm_membrane_model_min.pdb by running it through
    ```
    charmmlipid2amber.py -i 4pgr_charmm_membrane_model_min.pdb -o 4pgr_amber_membrane_model_min.pdb
    ```
  * Note that the lipids, waters and ions have been updated. However, the 
    histidine residues have not been translated.

* `4pgr_amber_membrane_model_min_res.pdb`
  * Rename HSD histidine residues to the Amber HID convention.
  * Need to rename the ion residue names from "K+" to "K" and from "Cl-" to "Cl". Manually.
  * Rename water residue from WAT to HOH manually.

* `4pgr_amber_membrane_model_min_res_renum.pdb`
  * Need to renumber all the residues so that the lipid residues are numbered sensibly. I.e. the
    original DPPG residue is replaced by PA-PGR-PA but the latter three residues all have the
    same number causing confusion in NWChem. The renumbering is done through 
    ```
    pdb4amber -i 4pgr_amber_membrane_model_min_res.pdb -o 4pgr_amber_membrane_model_min_res_renum.pdb
    ```

