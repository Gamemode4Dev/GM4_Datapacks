# runs commands for all custom potion tracker markers
# @s = potion tracker marker
# located at @s
# run from gm4_potion_tracking-1.0:track/check_marker

# check if their potion still exists
scoreboard players operation $current gm4_potion_id = @s gm4_potion_id
scoreboard players set $match gm4_potion_id 0
execute as @e[type=potion,tag=gm4_potion] if score @s gm4_potion_id = $current gm4_potion_id run scoreboard players set $match gm4_potion_id 1

# if there is no matching potion, run their commands
execute unless score $match gm4_potion_id matches 1 run function gm4_potion_tracking:track/potion_landed
