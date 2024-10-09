# reapply resistance effects that the player had besides the one from this module
# @s = damaged player
# at @s
# run from player/health/damaged/resistance_remove
# run from here

# reapply
$execute unless score $duration gm4_sr_data matches 0..19 run effect give @s resistance $(duration_set) $(amplifier) $(show_icon)

# check if this should keep looping
execute unless data storage gm4_survival_refightalized:temp reapply_resistance.hidden_effect run return 0

data modify storage gm4_survival_refightalized:temp reapply_resistance set from storage gm4_survival_refightalized:temp reapply_resistance.hidden_effect

execute store result score $show_particles gm4_sr_data run data get storage gm4_survival_refightalized:temp reapply_resistance.show_icon
execute if score $show_particles gm4_sr_data matches 0 run data modify storage gm4_survival_refightalized:temp reapply_resistance.show_icon set value "true"
execute if score $show_particles gm4_sr_data matches 1 run data modify storage gm4_survival_refightalized:temp reapply_resistance.show_icon set value "false"

execute store result score $duration gm4_sr_data run data get storage gm4_survival_refightalized:temp reapply_resistance.duration
execute if score $duration gm4_sr_data matches 20.. store result storage gm4_survival_refightalized:temp reapply_resistance.duration_set int 0.05 run scoreboard players get $duration gm4_sr_data
execute if score $duration gm4_sr_data matches -1 run data modify storage gm4_survival_refightalized:temp reapply_resistance.duration_set set value "infinite"

function gm4_survival_refightalized:player/health/damaged/resistance_reapply_loop with storage gm4_survival_refightalized:temp reapply_resistance
