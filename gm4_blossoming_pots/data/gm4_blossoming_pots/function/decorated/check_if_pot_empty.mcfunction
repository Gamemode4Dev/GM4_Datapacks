# Checks if decorated pot has any items inside before trying to instantiate macro
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, count}
# run from decorated/raycast

# kills marker and returns, if pot empty
execute unless data block ~ ~ ~ item run return run kill @s
function gm4_blossoming_pots:decorated/set_count with block ~ ~ ~ item
