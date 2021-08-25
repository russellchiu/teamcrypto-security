# TeamCrypto-Security
This is an implementation of the PRESENT algorithm in synthesizable Verilog.

## Updating notes
Verify behavior with testbench.
* Modules
  - [ ] InitPresent
  - [ ] KSA
  - [ ] AddRK
  - [ ] Encrypt
  - [ ] Decrypt
  - [x] SBox 
  - [ ] SubsLayer
  - [ ] SubsLayerDec
  - [ ] PLayer
  - [ ] PLayerDec

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
* keyPrep* - InitPresent

## Progress
* Testing sub modules

## Upcoming
* Testing full encryption and decryption 