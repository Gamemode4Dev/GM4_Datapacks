# Checks if decorated pot has any items inside before trying to instantiate macro
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from decorated/raycast

# kills marker and returns, if pot empty
execute unless data block ~ ~ ~ item run return run kill @s

# fail if smithed.block
execute align xyz if entity @e[tag=smithed.block,dx=0,dz=0,dy=0,limit=1] run return run kill @s

# continues if not empty
function gm4_blossoming_pots:decorated/set_count with block ~ ~ ~ item
