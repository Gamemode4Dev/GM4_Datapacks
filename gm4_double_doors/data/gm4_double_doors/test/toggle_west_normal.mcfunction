# @template gm4_double_doors:test/valid_door_west_normal
# @dummy

# position dummy and make it face the right way
tp @s ~3.5 ~1 ~1.5 90 0

# open door
dummy @s use block ~2 ~2 ~1

# left column
assert block ~2 ~1 ~2 oak_door[open=true,facing=west,hinge=left,half=lower]
assert block ~2 ~2 ~2 oak_door[open=true,facing=west,hinge=left,half=upper]
assert block ~2 ~3 ~2 oak_trapdoor[open=true,facing=north,half=bottom]
assert block ~2 ~4 ~2 oak_trapdoor[open=true,facing=north,half=bottom]
assert block ~2 ~5 ~2 oak_trapdoor[open=true,facing=west,half=bottom]

# right column
assert block ~2 ~1 ~1 oak_door[open=true,facing=west,hinge=right,half=lower]
assert block ~2 ~2 ~1 oak_door[open=true,facing=west,hinge=right,half=upper]
assert block ~2 ~3 ~1 oak_trapdoor[open=true,facing=south,half=bottom]
assert block ~2 ~4 ~1 oak_trapdoor[open=true,facing=south,half=bottom]
assert block ~2 ~5 ~1 oak_trapdoor[open=true,facing=west,half=bottom]

# close door
dummy @s use block ~2 ~2 ~1

# left column
assert block ~2 ~1 ~2 oak_door[open=false,facing=west,hinge=left,half=lower]
assert block ~2 ~2 ~2 oak_door[open=false,facing=west,hinge=left,half=upper]
assert block ~2 ~3 ~2 oak_trapdoor[open=true,facing=west,half=bottom]
assert block ~2 ~4 ~2 oak_trapdoor[open=true,facing=west,half=bottom]
assert block ~2 ~5 ~2 oak_trapdoor[open=true,facing=west,half=bottom]

# right column
assert block ~2 ~1 ~1 oak_door[open=false,facing=west,hinge=right,half=lower]
assert block ~2 ~2 ~1 oak_door[open=false,facing=west,hinge=right,half=upper]
assert block ~2 ~3 ~1 oak_trapdoor[open=true,facing=west,half=bottom]
assert block ~2 ~4 ~1 oak_trapdoor[open=true,facing=west,half=bottom]
assert block ~2 ~5 ~1 oak_trapdoor[open=true,facing=west,half=bottom]
