# TeamCrypto-Security
This is an implementation of the PRESENT algorithm in synthesizable Verilog.

## Updating notes
Screen shot update for google drive
* Ankit
  * InitPresent
  * KSA
  * AddRK
* Talaha 
  * Encrypt
  * Decrypt
* Russell
  * SBox
  * SubsLayer
  * SubsLayerDec
* Jason
  * PLayer
  * PLayerDec

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
* Created a synthesizable model

## Upcoming
* Writing testbench scripts for each module
  