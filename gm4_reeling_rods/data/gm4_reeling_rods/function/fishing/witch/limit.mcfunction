# Sets a limit on witch so player cant steal any more
# @s = witch
# at @s
# run from gm4_reeling_rods:fishing/witch/action

tag @s add gm4_reeling_rods.immune
particle minecraft:witch ~ ~1.2 ~ 0.5 0.7 0.5 40 25
playsound minecraft:entity.witch.celebrate hostile @a[distance=..16] ~ ~1.5 ~
