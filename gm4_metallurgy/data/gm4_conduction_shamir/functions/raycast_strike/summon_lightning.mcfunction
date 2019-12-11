# @s = gm4_conduction_raycast_point area_effect_cloud
# at @s
# ran from conduction_shamir:raycast_strike/lightning_raycast

#initiate self_strike
function gm4_conduction_shamir:self_strike/prepare_lightning_self

#kill raycast_strike area_effect_cloud
kill @s

#reset 20Hz toggle if not needed anymore
execute unless entity @e[type=area_effect_cloud,tag=gm4_conduction_raycast_point] run scoreboard players set conduction_raycast gm4_ml_data 0
