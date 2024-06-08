schedule function gm4_ce_base:tick 1t

# | Reset Scoreboards
scoreboard players reset @a gm4_ce_absorped
scoreboard players reset @a gm4_ce_shielded_hit
scoreboard players reset @a gm4_ce_sword_hit_triggered

# check for items on the ground
execute as @e[type=item,tag=!gm4_ce_item_checked] run function gm4_ce_base:check_item
