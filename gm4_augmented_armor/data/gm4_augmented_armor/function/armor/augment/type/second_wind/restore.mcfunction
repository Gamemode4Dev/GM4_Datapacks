# restore stored health to player
# @s = player being checked
# at @s
# run from armor/augment/type/second_wind/check

scoreboard players operation @s gm4_aa_augment.rejuvenating.stored_health /= #100 gm4_aa_data
scoreboard players operation @s gm4_sr_health.restoration += @s gm4_aa_augment.rejuvenating.stored_health

tag @s remove gm4_aa_augment.rejuvenating.stored_health.active
scoreboard players reset @s gm4_aa_augment.rejuvenating.stored_health

playsound minecraft:item.bottle.fill player @s ~ ~ ~ 0.6 2
particle heart ~ ~1 ~ 0.3 0.3 0.3 1 3
