# runs every tick on the command block subtick; detects when a machine block has been broken
# @s = forceloaded command block 
# located at 29999998 1 7131
# run from gm4_machines:resolve_tick

# check if machine blocks have been broken or moved by a piston (note: this assumes that the block is never replaced with a /fill command)
execute as @e[type=marker,tag=gm4_machine_marker] at @s if block ~ ~ ~ #gm4_machines:empty_block run function #gm4_machines:destroy
execute as @e[type=armor_stand,tag=gm4_machine_cart,predicate=!gm4_machines:has_vehicle] at @s run function #gm4_machines:destroy_cart
execute as @e[type=area_effect_cloud,tag=gm4_machine_cart,predicate=!gm4_machines:has_vehicle] at @s run function #gm4_machines:destroy_cart
execute as @e[type=marker,tag=gm4_machine_cart,predicate=!gm4_machines:has_vehicle] at @s run function #gm4_machines:destroy_cart
