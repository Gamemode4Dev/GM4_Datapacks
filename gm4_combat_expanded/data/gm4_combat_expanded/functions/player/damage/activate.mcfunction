# code taken from sweethearts
# @s = player to damage
# at unspecified
# run from armor/modifier/type/link/process/calc_damage
# run from armor/modifier/type/link/process/set_health

# calculate max health to get player to new health
scoreboard players operation $remove_health gm4_ce_data = @s gm4_ce_health.max
scoreboard players operation $remove_health gm4_ce_data -= @s gm4_ce_health.current
execute store result storage gm4_combat_expanded damage_player.remove_health int 1 run scoreboard players operation $remove_health gm4_ce_data += $health_change gm4_ce_data

execute unless score $remove_health gm4_ce_data matches 0 run function gm4_combat_expanded:player/damage/eval with storage gm4_combat_expanded damage_player
data remove storage gm4_combat_expanded damage_player

# heal player to set their health
effect give @s minecraft:instant_health 1 10 true

# prepare reverting
tag @s add gm4_ce_damaged
schedule function gm4_combat_expanded:player/damage/context 1t
