# process a player sleeping in a bed
# @s = sleeping player
# at @s
# run from home/detect_sleep

# store the day in player score so they can't sleep multiple times per day
scoreboard players operation @s gm4_ce_last_sleep = $day gm4_ce_data

# check nearby home markers for one that matches this players id (closest first)
scoreboard players operation $id gm4_ce_data = @s gm4_ce_id
scoreboard players set $bed_found gm4_ce_data 0
execute as @e[type=marker,tag=gm4_ce_bed,distance=..128,sort=nearest] if score @s gm4_ce_id = $id gm4_ce_data at @s run function gm4_combat_expanded:home/update_bed

# spawn a new bed marker if there wasn't one found
execute if score $bed_found gm4_ce_data matches 0 run function gm4_combat_expanded:home/new_bed
