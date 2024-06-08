schedule function gm4_ce_base:tick 1t

# check for items on the ground
execute as @e[type=item,tag=!gm4_ce_biomes_item_checked] run function gm4_ce_base:check_item
