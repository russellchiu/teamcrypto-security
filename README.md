# TeamCrypto-Security
This is an implementation of the PRESENT algorithm in synthesizable Verilog.

## Progress
* Creating accurate testcases for key scheduling
* Testing current KSA algorithm with Testbench verification
* Active files
  - KSA.sv: under debugging through verification process
  - testbench-ksa.sv: under development to use new input files format
  - origkeys, origkeys128, cases-keys.mem, cases-keys128.mem: input/output cases for testbench

### Current Issues
The testbench for KSA does not seem to read in the cases file correctly and many ports are unstable in testing. We will need to look into the port sizes in the KSA algorithm from the original python.


## Update notes
Verify behavior with testbench.
* Modules
  - [ ] KSA
  - [x] AddRK
  - [ ] Encrypt
  - [ ] Decrypt
  - [x] SBox 
  - [x] SubsLayer
  - [x] SBoxDec
  - [x] SubsLayerDec
  - [x] PLayer
  - [x] PLayerDec

## Functions
* generateRoundkeys80 - KSA
* generateRoundkeys128 - KSA
* addRoundKey - addrk
* sBoxLayer - SBox, SubsLayer
* sBoxLayer_dec - SubsLayerDec
* pLayer - pLayer
* pLayer_dec - pLayerDec
* encryption - Encrypt
* decryption - Decrypt

## Upcoming
* Testing full encryption and decryption 
