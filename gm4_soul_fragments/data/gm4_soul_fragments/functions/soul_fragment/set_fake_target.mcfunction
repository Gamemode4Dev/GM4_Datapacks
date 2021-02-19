# @s = player who hasn't been targetted yet near a soul fragment
# at @s
# from soul_fragment/process

# check if near a placed soul lantern
execute store result score @s gm4_sf_fire run clone ~-1 ~-1 ~-1 ~1 ~1 ~1 ~-1 ~-1 ~-1 filtered minecraft:soul_lantern force
tag @s[scores={gm4_sf_fire=1..}] add gm4_sf_target
tag @s[scores={gm4_sf_fire=1..}] add gm4_sf_f_target
scoreboard players reset @s gm4_sf_fire
