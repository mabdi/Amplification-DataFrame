# Amplification-DataFrame

Test Amplification for DataFrame

### Current status 

- under development

## How to load

Set the Bytecode Backend to `SistaV1` in the prefrence.
Then run the following code:

```smalltalk
Metacello new
  baseline: 'AmplificationDataFrame';
  repository: 'github://mabdi/Amplification-DataFrame/src';
  load.
```

## How to Run

More info @ https://github.com/mabdi/Amplification-Roassal3/blob/master/README.md

## Generated versions

Currently, Small-Amp creates this versions:

- Amp: amplified tests generated from original.
- AmpMin: The assert statements which doesn't kill a mutant is removed from Amp.
- AmpMinAdd: AmpMin added to original one.

## Coverage

[coverage.md](coverage.md)



