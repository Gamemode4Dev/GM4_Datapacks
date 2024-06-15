# @template gm4_double_doors:test/valid_door_north_inverted
# @dummy

# position dummy and make it face the right way
tp @s ~1.5 ~1 ~3.5 180 0

# open door
dummy @s use block ~1 ~2 ~2

# left column
assert block ~1 ~1 ~2 oak_door[open=false,facing=east,hinge=right,half=lower]
assert block ~1 ~2 ~2 oak_door[open=false,facing=east,hinge=right,half=upper]
assert block ~1 ~3 ~2 oak_trapdoor[open=true,facing=east,half=bottom]
assert block ~1 ~4 ~2 oak_trapdoor[open=true,facing=east,half=bottom]
assert block ~1 ~5 ~2 oak_trapdoor[open=true,facing=north,half=bottom]

# right column
assert block ~2 ~1 ~2 oak_door[open=false,facing=west,hinge=left,half=lower]
assert block ~2 ~2 ~2 oak_door[open=false,facing=west,hinge=left,half=upper]
assert block ~2 ~3 ~2 oak_trapdoor[open=true,facing=west,half=bottom]
assert block ~2 ~4 ~2 oak_trapdoor[open=true,facing=west,half=bottom]
assert block ~2 ~5 ~2 oak_trapdoor[open=true,facing=north,half=bottom]

# close door
dummy @s use block ~1 ~2 ~2

# left column
assert block ~1 ~1 ~2 oak_door[open=true,facing=east,hinge=right,half=lower]
assert block ~1 ~2 ~2 oak_door[open=true,facing=east,hinge=right,half=upper]
assert block ~1 ~3 ~2 oak_trapdoor[open=true,facing=north,half=bottom]
assert block ~1 ~4 ~2 oak_trapdoor[open=true,facing=north,half=bottom]
assert block ~1 ~5 ~2 oak_trapdoor[open=true,facing=north,half=bottom]

# right column
assert block ~2 ~1 ~2 oak_door[open=true,facing=west,hinge=left,half=lower]
assert block ~2 ~2 ~2 oak_door[open=true,facing=west,hinge=left,half=upper]
assert block ~2 ~3 ~2 oak_trapdoor[open=true,facing=north,half=bottom]
assert block ~2 ~4 ~2 oak_trapdoor[open=true,facing=north,half=bottom]
assert block ~2 ~5 ~2 oak_trapdoor[open=true,facing=north,half=bottom]
