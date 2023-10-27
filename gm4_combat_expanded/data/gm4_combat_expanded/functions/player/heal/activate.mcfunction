# code taken from sweethearts
# @s = player to heal
# at unspecified
# run from any armor/active/heal/heal_calc

# calculate max health to get player to new health
scoreboard players operation $remove_health gm4_ce_data = $max_health gm4_ce_data
scoreboard players operation $remove_health gm4_ce_data -= @s gm4_ce_health
execute store result storage gm4_combat_expanded heal_player.remove_health int 1 run scoreboard players operation $remove_health gm4_ce_data -= @s gm4_ce_healstore

execute if score $remove_health gm4_ce_data matches 1.. run function gm4_combat_expanded:player/heal/eval with storage gm4_combat_expanded heal_player
data remove storage gm4_combat_expanded heal_player.remove_health

# prepare reverting
tag @s add gm4_ce_healed
schedule function gm4_combat_expanded:player/heal/context 1t
