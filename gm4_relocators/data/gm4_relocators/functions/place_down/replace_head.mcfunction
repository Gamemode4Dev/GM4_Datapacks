# @s = player who placed a relocated block player head
# run from advancement "place_relocated_block"

advancement revoke @s only gm4_relocators:place_relocated_block

tag @s add gm4_rl_placed_relocated_block

# check for relocated block heads
function #gm4_relocators:place_down
