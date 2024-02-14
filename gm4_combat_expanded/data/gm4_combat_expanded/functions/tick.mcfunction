schedule function gm4_combat_expanded:tick 1t

# | Reset Scoreboards
scoreboard players reset @a gm4_ce_absorped
scoreboard players reset @a gm4_ce_shielded_hit
scoreboard players reset @a gm4_ce_sword_hit_triggered

# | Other
# poison slime landings
execute as @e[type=slime,tag=gm4_ce_poison_landing] at @s run function gm4_combat_expanded:mob/process/poison_slime/process
# check for items on the ground
execute as @e[type=item,tag=!gm4_ce_item_checked] run function gm4_combat_expanded:check_item
