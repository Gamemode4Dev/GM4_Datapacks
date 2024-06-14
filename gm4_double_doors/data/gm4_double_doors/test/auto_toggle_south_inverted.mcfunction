# @template gm4_double_doors:tests/valid_door_south_inverted
# @dummy

# position dummy and make it face the right way
tp @s ~1.5 ~1 ~1.5 0 0

# open door
dummy @s use block ~1 ~2 ~2

# left column
assert block ~2 ~1 ~2 oak_door[open=false,facing=west,hinge=right,half=lower]
assert block ~2 ~2 ~2 oak_door[open=false,facing=west,hinge=right,half=upper]
assert block ~2 ~3 ~2 oak_trapdoor[open=true,facing=west,half=bottom]
assert block ~2 ~4 ~2 oak_trapdoor[open=true,facing=west,half=bottom]
assert block ~2 ~5 ~2 oak_trapdoor[open=true,facing=south,half=bottom]

# right column
assert block ~1 ~1 ~2 oak_door[open=false,facing=east,hinge=left,half=lower]
assert block ~1 ~2 ~2 oak_door[open=false,facing=east,hinge=left,half=upper]
assert block ~1 ~3 ~2 oak_trapdoor[open=true,facing=east,half=bottom]
assert block ~1 ~4 ~2 oak_trapdoor[open=true,facing=east,half=bottom]
assert block ~1 ~5 ~2 oak_trapdoor[open=true,facing=south,half=bottom]

# move dummy into door and chech that it is still open
execute at @s run tp @s ^ ^ ^0.75
await delay 10t

# left column
assert block ~2 ~1 ~2 oak_door[open=false,facing=west,hinge=right,half=lower]
assert block ~2 ~2 ~2 oak_door[open=false,facing=west,hinge=right,half=upper]
assert block ~2 ~3 ~2 oak_trapdoor[open=true,facing=west,half=bottom]
assert block ~2 ~4 ~2 oak_trapdoor[open=true,facing=west,half=bottom]
assert block ~2 ~5 ~2 oak_trapdoor[open=true,facing=south,half=bottom]

# right column
assert block ~1 ~1 ~2 oak_door[open=false,facing=east,hinge=left,half=lower]
assert block ~1 ~2 ~2 oak_door[open=false,facing=east,hinge=left,half=upper]
assert block ~1 ~3 ~2 oak_trapdoor[open=true,facing=east,half=bottom]
assert block ~1 ~4 ~2 oak_trapdoor[open=true,facing=east,half=bottom]
assert block ~1 ~5 ~2 oak_trapdoor[open=true,facing=south,half=bottom]

# move dummy behind door and check that it is closed again
execute at @s run tp @s ^ ^ ^1
await delay 20t

# left column
assert block ~2 ~1 ~2 oak_door[open=true,facing=west,hinge=right,half=lower]
assert block ~2 ~2 ~2 oak_door[open=true,facing=west,hinge=right,half=upper]
assert block ~2 ~3 ~2 oak_trapdoor[open=true,facing=south,half=bottom]
assert block ~2 ~4 ~2 oak_trapdoor[open=true,facing=south,half=bottom]
assert block ~2 ~5 ~2 oak_trapdoor[open=true,facing=south,half=bottom]

# right column
assert block ~1 ~1 ~2 oak_door[open=true,facing=east,hinge=left,half=lower]
assert block ~1 ~2 ~2 oak_door[open=true,facing=east,hinge=left,half=upper]
assert block ~1 ~3 ~2 oak_trapdoor[open=true,facing=south,half=bottom]
assert block ~1 ~4 ~2 oak_trapdoor[open=true,facing=south,half=bottom]
assert block ~1 ~5 ~2 oak_trapdoor[open=true,facing=south,half=bottom]
