# H2O

A very small test case to check whether the procedure of using multiple restart
jobs works overall. The same approach will be used for larger test cases when it
makes actual sense to do so.

Lessons learned:

- On Titan the data from the CCSD calculation cannot be brought back to the 
  home directory. Hence you need to leave the data on the work file system
  (time limit of 2 weeks) and have the CCSD(T) pick the data up from there.
- The tilesize in the CCSD and the CCSD(T) calculation needs to be the 
  same. Otherwise the CCSD(T) cannot read the data files. This is a bit
  painful: The biggest tensor block in the CCSD code N**4 but in the
  CCSD(T) it is N**6. So if you pick a big tilesize like 40 the CCSD(T)
  will run out of memory, but if you pick a small tilesize like 15 
  you get large runtime overheads in the CCSD calculations.
