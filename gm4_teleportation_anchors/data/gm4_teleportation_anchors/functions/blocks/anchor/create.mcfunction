# @s = custom crafter with teleportation jammer recipe
# run from recipe_check

setblock ~ ~ ~ lodestone
data merge entity @s {CustomName:'"gm4_teleportation_anchor"',ArmorItems:[{},{},{},{id:"end_portal_frame",Count:1b,tag:{CustomModelData:3420001}}]}
playsound minecraft:block.end_portal.spawn block @a[distance=..8] ~ ~ ~ 0.3 1.8
tag @s add gm4_teleportation_anchor
tag @s remove gm4_custom_crafter
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:teleportation_anchors_anchor
