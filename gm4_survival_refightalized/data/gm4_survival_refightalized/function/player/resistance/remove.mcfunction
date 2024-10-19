# remove resistance from armor if armor is broken
# @s = damaged player
# at @s
# run from player/health/damaged/calculate_reduction

# check if player actually has resistance that should be removed
execute store result score $resistance_level gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].amplifier
execute unless score $resistance_level gm4_sr_data matches -1 run return 0

# clear resistance to remove the immunite from armor
effect clear @s resistance

# check if the player had additional resistance levels
execute unless data storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].hidden_effect run return 0

# reapply the resistance levels that should stay
data modify storage gm4_survival_refightalized:temp reapply_resistance set from storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].hidden_effect

execute store result score $show_particles gm4_sr_data run data get storage gm4_survival_refightalized:temp reapply_resistance.show_icon
execute if score $show_particles gm4_sr_data matches 0 run data modify storage gm4_survival_refightalized:temp reapply_resistance.show_icon set value "true"
execute if score $show_particles gm4_sr_data matches 1 run data modify storage gm4_survival_refightalized:temp reapply_resistance.show_icon set value "false"

execute store result score $duration gm4_sr_data run data get storage gm4_survival_refightalized:temp reapply_resistance.duration
execute if score $duration gm4_sr_data matches 20.. store result storage gm4_survival_refightalized:temp reapply_resistance.duration_set int 0.05 run scoreboard players get $duration gm4_sr_data
execute if score $duration gm4_sr_data matches -1 run data modify storage gm4_survival_refightalized:temp reapply_resistance.duration_set set value "infinite"

function gm4_survival_refightalized:player/resistance/reapply_loop with storage gm4_survival_refightalized:temp reapply_resistance
