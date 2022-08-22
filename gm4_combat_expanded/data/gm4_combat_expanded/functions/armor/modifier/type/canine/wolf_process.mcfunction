# check if wolf has matching armor equipped by player
# @s = wolf from canine armor
# at world spawn
# run from main

# check if matching player is online
scoreboard players set $player_online gm4_ce_data 0
scoreboard players operation $curr_id gm4_ce_id = @s gm4_ce_id
execute as @a if score @s gm4_ce_id = $curr_id gm4_ce_id run scoreboard players set $player_online gm4_ce_data 1

# despawn wolf if it was not matched to armor this check
execute if score $player_online gm4_ce_data matches 1.. if score @s gm4_ce_t_wolf matches 0 at @s run function gm4_combat_expanded:armor/modifier/type/canine/wolf_kill

scoreboard players set @s gm4_ce_t_wolf 0
