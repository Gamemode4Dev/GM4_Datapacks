# set smeltery to unlit state
# @s = smeltery marker
# run from process

execute positioned ~ ~-0.3 ~ run item replace entity @e[type=armor_stand,tag=gm4_smeltery_stand,distance=..0.1,limit=1] armor.head with iron_block{CustomModelData:3420002}
execute positioned ^ ^-1.5 ^-1 run item replace entity @e[type=armor_stand,tag=gm4_smeltery_cauldron,distance=..0.1,limit=1] armor.head with air
tag @s remove gm4_smeltery_lit
