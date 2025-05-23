#!/bin/bash

FILES=( \
    "tests/types/types.pas" \
    "tests/constants/constants.pas" \
    "tests/pointer/pointer.pas" \
    "tests/aritmhetic/aritmhetic.pas" \
    "tests/bits/bits.pas" \
    "tests/relational/relational.pas" \
    "tests/logical/logical.pas" \
    "tests/ifelse/ifelse.pas" \
    "tests/cycles/cycles.pas" \
    "tests/array/array.pas" \
    "tests/function/function.pas" \
    "tests/structure/structure.pas" \
    "tests/programs/AABBCollision.pas" \
    "tests/programs/LinePlaneIntersection.pas" \
    "tests/examples/fact_recursive.pas" \
    "tests/examples/fact_cycle.pas" \
    "tests/examples/list.pas" \
)

for FILE in "${FILES[@]}"; do
  ./pascal.sh -r "$FILE"
done