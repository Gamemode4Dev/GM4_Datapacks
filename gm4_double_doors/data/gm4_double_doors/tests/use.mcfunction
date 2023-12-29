# @template gm4_double_doors:test_door
# @dummy ~1 ~1 ~

dummy @s use block ~1.5 ~2.5 ~2

assert block ~2 ~1 ~2 mangrove_door[open=true]
assert block ~2 ~2 ~2 mangrove_door[open=true]

await delay 1s

dummy @s use block ~1.5 ~2.5 ~2

assert block ~2 ~1 ~2 mangrove_door[open=false]
assert block ~2 ~2 ~2 mangrove_door[open=false]
