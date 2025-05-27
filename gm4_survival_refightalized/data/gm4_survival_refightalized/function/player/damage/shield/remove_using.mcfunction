# remove shield using status from player that stopped using a shield
# @s = player
# at unspecified
# run from tick

attribute @s minecraft:knockback_resistance modifier remove gm4_survival_refightalized:using_shield
scoreboard players add @s gm4_sr_shield.use_ticks 999

tag @s remove gm4_sr_parried
