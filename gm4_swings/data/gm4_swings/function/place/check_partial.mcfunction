# Check if the block above is a partial block (slab or trapdoor) and place the swing accordingly
# @s = Item display, unsetup swing main body
# at swing placement player head
# run from gm4_swings:place/check

tag @s add gm4_swings.in_partial

# trapdoor offset
execute positioned ~ ~1 ~ if predicate gm4_swings:partials/trapdoor positioned ~ ~-0.1875 ~ run return run function gm4_swings:swing/setup with storage gm4_swings:temp

# slab offset
execute positioned ~ ~1 ~ if predicate gm4_swings:partials/slab positioned ~ ~-0.5 ~ run return run function gm4_swings:swing/setup with storage gm4_swings:temp

# normal placement
tag @s remove gm4_swings.in_partial
function gm4_swings:swing/setup with storage gm4_swings:temp
