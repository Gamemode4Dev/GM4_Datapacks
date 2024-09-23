# code taken from sweethearts
# @s = player to damage
# at unspecified
# run from player/health/damaged/calculate_reduction

function gm4_survival_refightalized:player/health/calculate_hp

# calculate max health to get player to new health
scoreboard players operation $remove_health gm4_sr_data = @s gm4_sr_health.max
scoreboard players operation $remove_health gm4_sr_data -= @s gm4_sr_health.current
scoreboard players operation $remove_health gm4_sr_data += $damage_health gm4_sr_data

# if player died play custom death message
execute if score $remove_health gm4_sr_data >= @s gm4_sr_health.max run return run function gm4_survival_refightalized:player/health/reduce/death

execute store result storage gm4_survival_refightalized damage_player.remove_health int 1 run scoreboard players get $remove_health gm4_sr_data
execute unless score $remove_health gm4_sr_data matches 0 run function gm4_survival_refightalized:player/health/reduce/eval with storage gm4_survival_refightalized damage_player
data remove storage gm4_survival_refightalized damage_player

# heal player to set their health
effect give @s minecraft:instant_health 1 10 true

# prepare reverting
tag @s add gm4_sr_damaged
schedule function gm4_survival_refightalized:player/health/reduce/context 2t
