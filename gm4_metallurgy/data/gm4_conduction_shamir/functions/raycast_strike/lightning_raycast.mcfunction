# @s = @e[type=area_effect_cloud,tag=gm4_conduction_raycast_point]
# at @s
#ran from metallurgy:pulse_check

#tp cloud forwards
execute at @s run tp @s ^ ^ ^1
scoreboard players add @s gm4_volt_dist 1

#stirke if in block
execute unless score @s gm4_volt_dist matches 20.. at @s unless block ~ ~ ~ #gm4:air run function gm4_conduction_shamir:raycast_strike/summon_lightning

#failsafe
execute if score @s gm4_volt_dist matches 20.. at @s run function gm4_conduction_shamir:raycast_strike/summon_lightning
