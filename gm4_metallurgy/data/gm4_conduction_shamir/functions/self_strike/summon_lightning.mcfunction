# @s = gm4_conduction_strike_point area_effect_cloud
# at @s
# ran from conduction_shamir:self_strike/prepare_lightning_self

#move cloud to surface
spreadplayers ~ ~ 0 1 false @s

#summon lightning
execute at @s run summon minecraft:lightning_bolt ~ ~ ~

#kill area_effect_cloud
kill @s
