# finds the minecart that was placed by the player OR dispenser
# @s = player that just placed a machine minecart OR none
# located at @s OR world spawn
# run from gm4_machines:resolve_load/place_machine_minecart
# and from gm4_machines:main

advancement revoke @s only gm4_machines:place_machine_cart

# set up
tag @s add gm4_machines_placer
scoreboard players set $placed_block gm4_machine_data 0

# call function for all minecarts with custom names
execute as @e[type=#gm4:minecarts,tag=!gm4_machine_checked] if data entity @s CustomName at @s run function #gm4_machines:place_cart

# clean up
tag @e[type=#gm4:minecarts] add gm4_machine_checked
tag @s remove gm4_machines_placer
